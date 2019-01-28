<?php

PHP_CodeSniffer_Reports_Steevanb::addReplaceInPath(
    '/var/phpcs/',
    '/home/infodroid/dev/phpbenchmarks/benchmark-kit/src/'
);

Steevanb_Sniffs_Uses_GroupUsesSniff::addSymfonyPrefixs();

Steevanb_Sniffs_Functions_DisallowMultipleReturnSniff::addAllowedFunction(
    '/var/phpcs/Command/InitializeBranchCommand.php',
    'createComponentConfiguration'
);
Steevanb_Sniffs_Functions_DisallowMultipleReturnSniff::addAllowedFunction(
    '/var/phpcs/Command/InitializeBranchCommand.php',
    'defineAbstractComponentConfigurationCodeDependencyName'
);
