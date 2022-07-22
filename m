Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C6CC57E0CD
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Jul 2022 13:30:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EF26316DC;
	Fri, 22 Jul 2022 13:29:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EF26316DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658489433;
	bh=/MO8Osk2Irp21KH6SVBr9MxbXmK6ITiY3s74BG7ZUaI=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZFyks5qpb6Dshbao54+TGYpnGMyCtqbXQMqIeff1zfjnusNv4hhdNfKQ3CUHtQJe2
	 FOIBQZ0lKGL6UDSQfWR57v/Ll+irbwLMbkJSoDaX8eao86FY35bkHlte/fTNgOGSXR
	 4VH4WFz6E0H2877ZmDjWomTlNh4e/RU27zWU3lXA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 31004F8012A;
	Fri, 22 Jul 2022 13:29:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7602DF80246; Fri, 22 Jul 2022 13:29:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 40E21F8012A
 for <alsa-devel@alsa-project.org>; Fri, 22 Jul 2022 13:29:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 40E21F8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="WQzoHJ/N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658489361; x=1690025361;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/MO8Osk2Irp21KH6SVBr9MxbXmK6ITiY3s74BG7ZUaI=;
 b=WQzoHJ/NpkvK+6IOf+0RLnGnmQcqxHSSCgA2tgRItYxlJhdy/6g5noBl
 f4U7kDkiOHsAA73+36fG2LVfu1dUzxiETTUDORoe9uTGz7h0Sm9c/wcTd
 255s9gFeIzskExcxcTGJrWRD0WWJPwLoD6NDsu0pKSQbARbeHUIBFeUHi
 3SlFfGm7IeFhfh2p1dQgfrXVb9oOSz0efTgV1JeFHfE5UTFGEqVbniNIR
 NmqO5U8gFrfmNS7WJFqhfbXcDfS0JBYKAz4GTZPQQNVPMzNcJmrvSl5zS
 5CeRnjIa09RpyivbQ1aZxGrT0f4vhuZyL7suJT5JKtdfMptK2scgCYhDD w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10415"; a="274150160"
X-IronPort-AV: E=Sophos;i="5.93,185,1654585200"; d="scan'208";a="274150160"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2022 04:29:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,185,1654585200"; d="scan'208";a="657182294"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by fmsmga008.fm.intel.com with ESMTP; 22 Jul 2022 04:29:16 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Fri, 22 Jul 2022 04:29:16 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Fri, 22 Jul 2022 04:29:15 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Fri, 22 Jul 2022 04:29:15 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Fri, 22 Jul 2022 04:29:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mGriaFHidX0h6KlULFR2vkNK8Ytl8HeFtrjGYoNKyfcnx8693McSoW7QK3+e7cCsULQGEn8N6W51k30WLidc79dAGjjuKJeLixPkFAEziTs2n2pCW3hsfGRLPLPNRujO51YO5UpMT8TOC8GjRf/4+0aUWTW0w1bvIshaeYAfQcaMfBCtPg+/+kYL0kS1jpuJMlHS9GmTrHPCMXCUjliB9ZMsygg9yNyuSUVyJJwvVYLN2jzKxF+4aa32OcwA4Q7eYMJvjjzxSndSrlKmj1IFgAf0ml9TgkPq1cIP/o5JfAgvsvEEh881ADUMlZwSuVWoR1GOfs7jsvMH4C0wH8/ggg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fDeFJk8xYwzagHvc6HvOLDMv+FNhBOrmwErmpGx/1c8=;
 b=X++aKUi9hP3ZiXIYRqUoKhwne5YuWS9RLssM/n+qYL+MFqND6sjo+Jw6m5yJ2VCJCc8d6EfkDor3Aqe1NuSLax3wPPynnZsoMX0UoCPan/La212yWM54rXEr/TtkswciE0UOeeN55c5JVEkCirZxIeW9+CBgAe3Q2zjKob25Dc12rYXd3v6rVArI7lra7m8hSDrSYLgNjXarYk+aQuxuy+U2tqEpZDkDjF29ze+st/BnN/NoqBg6jUTLikjzrhY4zQXMx2yhAj06v5r31JFDF6q+ZQNVlGAgaKQvPVQneW49fpp1jgycRruWaTJp9YkZAPE6KL+jrusldsn4Uq/etQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 IA1PR11MB6441.namprd11.prod.outlook.com (2603:10b6:208:3aa::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Fri, 22 Jul
 2022 11:29:08 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::852b:5f7:46eb:fca6]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::852b:5f7:46eb:fca6%6]) with mapi id 15.20.5458.019; Fri, 22 Jul 2022
 11:29:07 +0000
Message-ID: <e3784ec4-ce60-a8fc-b50d-9cf0f1879093@intel.com>
Date: Fri, 22 Jul 2022 13:28:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH] ASoC: Intel: avs: Use lookup table to create modules
Content-Language: en-US
To: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, Mark Brown <broonie@kernel.org>
References: <20220722111959.2588597-1-amadeuszx.slawinski@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20220722111959.2588597-1-amadeuszx.slawinski@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0104.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::20) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 82eaccd9-fb8b-4509-880c-08da6bd563eb
X-MS-TrafficTypeDiagnostic: IA1PR11MB6441:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: X0GW9bYroMRfYhiOZEgoL6EBdjiATg99CwvoVTB/IckFMZ7LqRHSEJYOoF31RZyVUZKNJe54AEP/OSa6wcPJg16B9bbNUyt1a1ue9D2VK+kCGV5SZnVxX6IXIJBr02uLCfF0YuQIRyIE0xWHVi43WJ5/FJy9p1dkIXpQO8UHt2EZzU9FOxGhxe98lCB61N7uheORFcld7rDpqYo5vzWeav3r+u+2MvooFVlB2SLq+nslv6k4BzifH0IqMR28cJJm8zvH4Hu3X/hHGv8Va2S/FmXnrr2tOCT74PFepLNTmpergRumSLFJLZGc+NYcnu10aPIHZwwleGO1qDNORDZA8VNxfG78Kw5ABKdwaVfXM/MVGQYhiSfbOtp2aopZaroIsYsPHiohpBn+cTFevNtA86ajFPn+sV61xalhEpBaCWVJdefDZEsnn95zZkwplK6ruYwzkCp24tCEAXvw1wcwJQxB49Pi182gWJErU0rf0hte0b+l8mj1Dy4KCkNVrKpUyjEN2xd7QgXNkKFpd8k0fkb8j6q66Glmfq2RmgZaKBolNqdxXqBiGBahsHnfjjEfdd98Qi53gh8QRQsSWGyaO/mf3sGyB11z78wCMsYHkCxyhwzlNYQJd2TpK9D5OUwniPIzVuC6sRFc7Ogzeo6Sa3OwSk/HiJf4T4hiDdoF90MujTq0BWUfZNZ+WTzHvwXR0HXZ0iDwBmRH27uuXbxCGipogoa90xNOrNZ2VKV9PJWtq7aI1bptbNWaxn3Ubq5pSYSE2qZ7mffCdZAIkZdkfuck3LdSxe3rswMBYUm9T3bq72lQWo+XUPthgJl6+B/xpG333SscPf165NMJ4QSj1HZQw+Lol/n/gL/daj4TfKF//CBQ+8nVzbb9EvvmbH8Q6KhZ0sDBmf4BtY6fOfWCDQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6375.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(396003)(366004)(346002)(136003)(39860400002)(376002)(186003)(6666004)(82960400001)(38100700002)(6512007)(41300700001)(26005)(6506007)(31686004)(110136005)(2906002)(966005)(54906003)(6486002)(44832011)(4744005)(2616005)(66476007)(53546011)(66946007)(4326008)(8676002)(66556008)(36756003)(7416002)(478600001)(5660300002)(8936002)(86362001)(31696002)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZmxPWG0yZDgxNElUbVNXT2FlUG1HWjBGenBPdmZnMUhmbXdwSmNJN3IrYWxi?=
 =?utf-8?B?Q3hQbm9wa25RVmZ2a1pQS0crMG5DVDJ6SklBWDk1bmNMaXpCSUV4VWZkRnA2?=
 =?utf-8?B?MW0xRTlVK1FjM3NUYWZDZ0RoTnhDZkZRd1E1TmNnTzhBcm9JWEF0cjBOZUsx?=
 =?utf-8?B?dk5JME52TkhMNWRONytNVTFCRllnR2gxY3dERVFGdXEzWWF2a2xXbjNEUzBl?=
 =?utf-8?B?SnhNVjFvUGJNMlFwd2Ntd1NaeWpVRy81RldxZDhpT21xSCtvekZQc2Z4QzNt?=
 =?utf-8?B?eVJ2UmpCZ3prWEw3ditvdlZVeWJwY3FaVzMwMzZ0aHM0WXV3SU5Ga0IyVHI5?=
 =?utf-8?B?d2pCUHIyWk84RFVWcENUNktQS05veERpUEF3Y2FXOThzZWIzekJMN05DcmtW?=
 =?utf-8?B?eEhGdG1QcDdZQmR0ZWZwRWdzZnU2VnFUMit4V2dobXd2SktoN3hNdnUwMExu?=
 =?utf-8?B?T0lwYU5Ld1lLaEV1VzFuYjF4VzBOOEpWKzJyOWdZK2lqTXJyMytlNzBYSWtG?=
 =?utf-8?B?RU4zemhnV0hWcEVydUFBbEJGdDE2SGlKbm81cElSNzE3VjlaMzU2OUJUK2VS?=
 =?utf-8?B?cEhOZHlid0VrWEZwN2I0R2F2OFlyT2wrd3hsT25reGliOVZMZHdDNkpoaEZj?=
 =?utf-8?B?VmlJVEoxUndoRVhHcFNBNmtUR0p2K2FrWFZUZGlBTFNOb3BxWkpHSTlCczgr?=
 =?utf-8?B?dzFRSlBtU3dpOFBqRXIrTjZPNkMrWlRkNEFmV0hmYXl6ckhWR0RzN1Npd1Rr?=
 =?utf-8?B?SUNidm1wclA4ZTRqSTFXYkdkZjVUR1V3NHAxT2ZObGt6UEVxOGdDWFRpUWo4?=
 =?utf-8?B?dFFnUDZ1WTJjVWR3Ynp4RUpOc3BIa1d0dUJlTzU5ZVBad3ZONlY2T3Uxa0lk?=
 =?utf-8?B?SnRGNlVZZ2MzQ3BSQmtxMGRFYzFYTkdVbUIvZ3c5TmRJTlpHSk1ybWduY1hG?=
 =?utf-8?B?dFJUV0NiVFFxcVNweUFST1dmelRSTGVUSmJzeDRaVmhpSkxSZytHOHdaY1I2?=
 =?utf-8?B?TVRkSlhSRmcwdytWb25KblVIR0ZiOEx3dUpNaU1tTFdYcFdJdkhTbWg1Z1Nj?=
 =?utf-8?B?NVp4c2hmeDBtQzMxY2ZYQTBxODZkN20wNlJmSkw3cHZJQ0RXeUtXNlJMY3Zk?=
 =?utf-8?B?ZjVPYjRkbG5lQjhSMXYwK0RFOXdsd1ZQMGtUSCtESHlNaEhOUlNyaHc3VTgy?=
 =?utf-8?B?cTRadzRUUzlkOHB2djYvN3ExNlNvRXJkWkdWUzV2bTh4Nzl0dGhBemZiUUpo?=
 =?utf-8?B?RG85N243RmlDc3ExVGIrdE5CTWI2Vm1yclNiVkIrRHhQblUrazdkUXUxZTF2?=
 =?utf-8?B?S2lIRFZYdHBqbkRaRGxTWFJubkpmZUlvRzd6bk55TVlPWGpUTlM3NDJ5M3Jw?=
 =?utf-8?B?Uk4wQThtRXhBdFplcCtBK0ZzRm8rU2pqamZtMW81R3d0SDAzcVBaNjRzbHRR?=
 =?utf-8?B?YTkwYTdXSm9IR2FJTW9oaXBhRzZOZTlTN0RMZEZ2Q0w1Z1pQa1YwZ1lMejN4?=
 =?utf-8?B?WUJscVYrRTRkdmxIM2ZCbXRsZkR0Umh2dlpCeTVSZzJmbnJkblA3QTZCK2ZT?=
 =?utf-8?B?TkU1M0FuWkhaVDdaSzdIUFc5and5TzdWTzBaTU5QdVNLYXQ3TExoY1BTZHBJ?=
 =?utf-8?B?VlJkZ0hCTG12VUZQallqbFZWTHdzNHlsM01jdWN1bVd6czhyWDN1ejF3SUZw?=
 =?utf-8?B?cXl2ME5PQTV0MzF0L1VubkRSbWEybDVWcVN5eUpoNkF5eHpuUDZQMThoZTM4?=
 =?utf-8?B?T0lKZ0Q4alhwL0xXenpyVUE4VUduR2llQy9rUnN6RER1NmovK0J2WWlnOEJz?=
 =?utf-8?B?RkJ6QTZWZ2hEZHFmbDhRU1FSTzJXaEtiWjZUYU5WUEVDcWdjelJHL0NVaDJs?=
 =?utf-8?B?aFhaQkliYzFRdlRScXFURHdXZnRGc3I4NHVVckJMU0xJSkZUdC9QVXJvaVlH?=
 =?utf-8?B?R25JbGl2TzhGMTY2bEo3cUh1aFZyNHFCQkpscUpYeVkzalRpTHhRUUErZVg0?=
 =?utf-8?B?L3VUUW5mRGQ0ZXhVeHRoMDNwemlCaHl6cWFrM3QxaVdqR2NUajJvRlJRdFpy?=
 =?utf-8?B?aUxHMkFvd1VwUWhZeHNwOER4blc1VjAyNnFXbWpYQWxSZE5NZVRtV2Ezeldk?=
 =?utf-8?B?MVhVSXVOY0FyNmFiODhiT29pUzdlL0FxeXFKa2NWRG9zLzI3bFhoYXBxYkFV?=
 =?utf-8?B?enc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 82eaccd9-fb8b-4509-880c-08da6bd563eb
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2022 11:29:07.7120 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FiE71G4BeX8H9TemgJsvqeSwEkH0paEDyAq3iiwDyzPHkJRoJnPAlXOWxz39rP+Xx0XuMWbAd4INF0vRIuFsyl8nNzKrnSgPXEsdOOi3M2Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6441
X-OriginatorOrg: intel.com
Cc: Nathan Chancellor <nathan@kernel.org>, alsa-devel@alsa-project.org,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, llvm@lists.linux.dev,
 Nick Desaulniers <ndesaulniers@google.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>, Tom Rix <trix@redhat.com>,
 patches@lists.linux.dev, Bard Liao <yung-chuan.liao@linux.intel.com>,
 linux-kernel@vger.kernel.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


On 2022-07-22 1:19 PM, Amadeusz Sławiński wrote:

...

> Instead of hardcoding many calls to guid_equal, use lookup table with
> one call, this improves stack usage.
> 
> Link: https://lore.kernel.org/alsa-devel/YtlzY9aYdbS4Y3+l@dev-arch.thelio-3990X/T/
> Link: https://github.com/ClangBuiltLinux/linux/issues/1642
> Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
> Reported-by: Nathan Chancellor <nathan@kernel.org>
> Build-tested-by: Nathan Chancellor <nathan@kernel.org>


Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>

Thanks!
