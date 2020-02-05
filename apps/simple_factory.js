'use strict';

const newAcc = function(context, args) {
    return {
        fn: 'createAccount',
        args: {accountName: args.name, domainId: context.domain, publicKey: args.publickey}
    };
};

const log = function(context, args) {
    return {
        fn: 'setAccountDetail',
        args: {accountId: args.accountName, key: 'sensor', value: '1'}
    };
};

const simple = function(context, args) {
    try {
        switch(args.verb) {
        case 'newAccount':
            return newAcc(context, args);
        case 'log':
            return log(context, args);
        default:
            throw new Error('Unknown verb for "simple" contract');
        }
    } catch(err) {
        console.error(err);
        return {};
    }
};

module.exports.contracts = {
    simple : simple
};