Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A7307587A99
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Aug 2022 12:23:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A1E484A;
	Tue,  2 Aug 2022 12:23:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A1E484A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659435837;
	bh=M4C8ACFP0sqDi2VYSudlR4cBg1FXl7bbDX2vKrRDwhY=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mYshCYlDiYkvx3h+56obEqNcvYRnHA9xxECFV5O8331WSacUHsEFO4GAJkLhrnsgT
	 rod5wdwWwDu+uTMgVwKj0P2Mg8GcL0LMoQrQ8bIT1JcaWVkx2aftviKQBT+pvYeL9u
	 Wh+reMINEXVPOM99xtIHpguEiJriN3MqVX+RcgHQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A7A36F804A9;
	Tue,  2 Aug 2022 12:22:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 17B14F8026D; Tue,  2 Aug 2022 12:22:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, NICE_REPLY_A, NO_DNS_FOR_FROM, T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BE7D4F800B8
 for <alsa-devel@alsa-project.org>; Tue,  2 Aug 2022 12:22:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE7D4F800B8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="mYwhAFV7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659435772; x=1690971772;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=M4C8ACFP0sqDi2VYSudlR4cBg1FXl7bbDX2vKrRDwhY=;
 b=mYwhAFV7euqUESYQd41aIQYn1PT0ztl4b43w8pkWq45TlHmSFZFgl5bP
 RPGBiADHmuR6EZEKG/Kz0kLP8EX4YmG9NMAJ8bKqVVufNQXnMuty1tIJP
 JNVnQNvDtgQZms8TkbuPsxf7izRTtx4WPFeubbdXQp5ipmc9Tv7AQhBH9
 JquC9ERWJCZRfzV2MtL0PXSOn/RvuSz6g90iVljhrZcAEZTJ9wkjj3K2g
 Aapqibs3OVdWjfv5jpgN1vwNyQtT4bfHrZvIsFro0TcJCqpCGHyXMwbJC
 tsJ/LcdbcOFkBa4DAl4oHWqWUTxfCpeea0qsUeQHAkWInuapLSRiq7BEh A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10426"; a="276284139"
X-IronPort-AV: E=Sophos;i="5.93,210,1654585200"; d="scan'208";a="276284139"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2022 03:22:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,210,1654585200"; d="scan'208";a="630652057"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by orsmga008.jf.intel.com with ESMTP; 02 Aug 2022 03:22:46 -0700
Received: from orsmsx605.amr.corp.intel.com (10.22.229.18) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Tue, 2 Aug 2022 03:22:46 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Tue, 2 Aug 2022 03:22:46 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Tue, 2 Aug 2022 03:22:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eM96+tUFBhplb2HtazzTkUFSJ2Y0/TOELhC95AMa+TinNmmp8IMs7/cBf6jALdqLH/C8ygkDEgjYbvFEsTzSUiRGMqYqhwd3Iw8pc5phXwDW6Mku2LJLb5aTLyMGb2sz52Eh+SLq5pVxAP6KJt6pReChL+mSrFVtjpdpyzUMneZsZV+PhRw9Hw6ZBQ9/Pudo4wyfPm+tHXtYImQhBF4+72Jk0juGAZVO18iYP2nEzTV2NoDA7T1RizYJY9o2VQZdbKaNxRhKlMO0finPJ6VK6EdT5XeIbILbEpDO4DAI6rcNL55bxV3vcBpCSQfBEW703UpcdIx957szhM8wjXDvww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p+AxOG8tVhuCZ3NcfRRGFslulPvtv02N4IWRaq/pQdg=;
 b=LBI6W5EB0iyfwIzT0MwxjWQlhQ631pZczcnJldriSb/te4rvRLpTRCdtsUkLIw+aVCH+WGnkFHprAb59ZcZEL217XE3g5jgLA3Iu9coUe22mp0+BdRImUgZav1uJy/OSg972M96SD+jPxJmcJlv5ibad/pDgZh0AfCG3HLr4SAXkhycCUR3wkDN25jbYnRq8hZHK9b0gf+36kt/p05SfRuIi82CnhlI9DRm2QkPQ8NKMpTBLaJmHAbkymAuJx5xoOS3158/YeOPGBAjZ6VDWLmVOPjchd99D7TQ8Ktm+I94I4YSpWYEv9ztydgyYxtFRF4SXRP69umHZUfM13kZG/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 BYAPR11MB3751.namprd11.prod.outlook.com (2603:10b6:a03:f8::31) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5482.15; Tue, 2 Aug 2022 10:22:39 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::852b:5f7:46eb:fca6]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::852b:5f7:46eb:fca6%6]) with mapi id 15.20.5458.025; Tue, 2 Aug 2022
 10:22:38 +0000
Message-ID: <73413b25-1ba0-bbdc-525b-ba2964907a0a@intel.com>
Date: Tue, 2 Aug 2022 12:22:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH 1/3] ASoC: Intel: avs: Fix potential buffer overflow by
 snprintf()
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>
References: <20220801165420.25978-1-tiwai@suse.de>
 <20220801165420.25978-2-tiwai@suse.de>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20220801165420.25978-2-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR02CA0001.eurprd02.prod.outlook.com
 (2603:10a6:20b:6e::14) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1db71a36-147c-48fd-0ac9-08da7470ec90
X-MS-TrafficTypeDiagnostic: BYAPR11MB3751:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WL/0Lc2RugZoxz7ii1C4R5qJQ472kJmhJQjyu3pcg6RG+IlWMkKr+mMGOMzOX1nlT8eL8+eV4aBI5DwFytsD8mxpiXMMTG0mhL9Lx2zMkFV1b8tgMlsd2S9lqkIeAeWVx6waMa8zkJHLzWnwH36KyUDh8w4imzz9efoFUcEJ3fbMSHtEPBrbfoPJQR1woGmDvj0HleATHsmU+S3MDOuncNEKgvD19oe6/+6IoDdUxitW0YQlbaR374hwwnRJbHIFWOUGpX/DZKChdG0D2+6+9aAqqmRQajdsu814FPhbj6I5OY4RRIFfNN1ZiNKFFNoJxwm5FEkm2HiXOJTv5Usdk3/1SSILOd4zhSZI4u1oWk0gmj8Nxu5Qsk40/lpMk9r5Ix9Vj5ZG/xKBh85SqWqjGKVZxRuDWMFM/S6dyhaHUYuFyhTi8sgmGumvGQvU+5Ga0AlHuCSSqFWrPm4yySiBZZXC6q6Gyynv4gY4F3GuRpaf3vVj3wdyrc14X5t0beO/dc76KI2cPlQm12HudK/vBWYrllVQWusyxqmppQCVc/6L5TR2d8lRSuaRbVdjqCYe4EYjpllmD9pfJ5mmVnq/pPa1+gx+qtFXFMDovRH7u/dmlJK6eg7S8gYZf1CBJbTIszB8UPTjzwS5xp+vKuPoHbpZhKDiyX9MvjZp15OEhE3qrDby3wCKZVu/YDb6eSKIj0gFQvhHWkNMp/KbeXlUJGfNPbVr7IuPlVO69AEC8bnJ19m9c56V2uh8Za+Pemrgxm/bcJSo6uHx81X/X8Mele6Tb1BTOdhTpK6Ze12IX6zSWAEXuxt9xqSzeJMpocElA49NfUX1/LEL49XrOavNDQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6375.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39860400002)(346002)(376002)(396003)(366004)(136003)(31686004)(4744005)(186003)(86362001)(2616005)(31696002)(44832011)(8936002)(5660300002)(8676002)(66476007)(66556008)(66946007)(4326008)(36756003)(2906002)(38100700002)(110136005)(6486002)(478600001)(41300700001)(316002)(6666004)(6506007)(6512007)(53546011)(26005)(82960400001)(54906003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VHh1anF3RklNR21BR2xPeEVGNzc3UmNjKzhVOGYvdDZKcXpjTm1KZGlOcmt1?=
 =?utf-8?B?RlE2d3ZmakdmeXBlVFNpNVExSmVJN2RiRlV3bXZRZytVNVNETVVobzFISDhX?=
 =?utf-8?B?SVdwR1lMdE1hTEhZQjVMQWZrRmNUaUMwOUFCWkZXWTF3TWdwTmlGd1loQmQ0?=
 =?utf-8?B?KzFmcE84UFNTYUsrNFZoNGhHdjJZb2hxaXhaNVhqbWtML2EvbE9wY0FYUFBN?=
 =?utf-8?B?a3VNdWJLby9zcThSckNpbVFISy84WE5YeGZvNXBNRGtHeFBDMDNoeis4UmJu?=
 =?utf-8?B?N1cvZFl6TjM4MXA5cGd0cUZsdyt6dEh1aUtXRnFCcFM2QlB5L01LWTJnWUJu?=
 =?utf-8?B?b3ZkblVYWXpCYllkSTNleS9CWDhXOFVkd3EyMGtCODJLM2l1TW1jNTNoWjNK?=
 =?utf-8?B?Sm1iYVlIcERlSXd1MENHREJSbmdONTI5UEV0ZDBGejZvblJyUTkyVWlKQk9m?=
 =?utf-8?B?ZWErWEJ3VXFuK0NSWDN0RFpHYjlyNW5oUmJ3aDZiaGU2T1JyZGsyNGRQMkFQ?=
 =?utf-8?B?VUpwbUVuOG1DZmlBRC85Smt5c3pXSk1wMUNueEVGZWt3WEdqTWhkM3VHV2JC?=
 =?utf-8?B?MWdpbktWZjlTbldqWWphVG13WE1QVnljdHJMcXZ3cVU2cWp5SHRUcm9WN08w?=
 =?utf-8?B?NDRxOFRFVnlDVDZwVWorWHpsN1E5MFlJRFFDTmZTR3RNTUpJRzNqUXpUa29E?=
 =?utf-8?B?WCtiTTc5bkNkSWNsMDdUWHRnYWsrRVhOOVB6V3lPYWlMckZjRXR2dlYwQW1V?=
 =?utf-8?B?cGtXYkM4YW1IUkRGaGppcmFrMnFINklMYUcrdlNwaVQxNGVDRU4zdWEydEgz?=
 =?utf-8?B?SncySTQ1ZC9NVCtIeDJYbyszQi9zcUJJMUNocThrNGw4L2taMFJCUWZ1ZzJG?=
 =?utf-8?B?S0Fwa241M1RldGQ4d3gwZi9XMW9ZNGVXSE5mLzJpckliQ281ckp5RjhWbmNo?=
 =?utf-8?B?WmN3YUhmczAyc1ptd29obG5mU29CaEMvU1B4eVlyd25SZXZyd1k2bTBOUjNU?=
 =?utf-8?B?WGtrTHdqaUJ0M2ltWFBydkVpZGVlSDZ4Q3pNRXQ4OEYyc0lnVUlSZ3ppaHZv?=
 =?utf-8?B?WllkcWxaVGlrZGc5OC81WHRlUVIvVkt2T0lJVVRLN2cyeEpLWjJQd3d5ODJC?=
 =?utf-8?B?WVpPTTRsdDJQNkhoTWZMQWlpRDlZQkk2YVZIemthSkhPQ0EvYzZ2N2VqZXB1?=
 =?utf-8?B?NnU1RXZjOGROQkNaeUt4dzB1VDk4ZzlIbyswb1VpVUl3Z2kvbHU3ZGdCcUpB?=
 =?utf-8?B?N0NscHRnKytNbXJFV1dqZTFwVkhKSzNhU3hFbzZyOTZTZHRwczludkVrWjdB?=
 =?utf-8?B?b1NjSG1SV3RNSU84NGRacHpmWXNEakJna3dxT2djMjZyR0hvSjk3R0VlMmh1?=
 =?utf-8?B?dSs0YXBKdy9yVzNLZ0J6QnpqODlJUFF0dmFtbldGNWl2ckY0cGZtbTNXUDh4?=
 =?utf-8?B?MzJXcmpSclQ1V1VxWnZ4aklrZWxCSW15N04ybHdEa2VIajRINEY2MmM0WEp5?=
 =?utf-8?B?MVV0UUFYM0pXWU5yekNhOFdWekpNT21VTTRCN2ladVNpQXVIVlpZKzhWdkJB?=
 =?utf-8?B?Slg2MHgxYVBIRW0rMmF0VjZVL2hkaTdrVWlTVUJabndnRmNJTzBDcmFzRlNu?=
 =?utf-8?B?NE5aQjI4VzFkU2pLWGN3TmpGRDBCVjcxL0drTWhsSnVJTlBsM1M1YzZaQ1ZZ?=
 =?utf-8?B?L0tPU2lyTTNaZFA3dVQ5amh5b25HZEVWNld1K2pwMnlyYVBac1FCczczNGdq?=
 =?utf-8?B?bXdOTnMramxDalZrUWtFcUZqV0NEMmlYcFJ4czZTSmwwdXJqNktkOFdOWE44?=
 =?utf-8?B?M3lSanZ0a3RsREN6THVLSFllS2szdUQwbktrbjdiaVJqOUx5UFRnZ2J4TGl3?=
 =?utf-8?B?b25iaDFlYWJNQ1h3R3ZrZ0E3QmVOUFpySU9kL2tXY0lubmRETkJuSnozZ1VY?=
 =?utf-8?B?TnpQcUZRM05KQzlldUxweFpUZEcxQW9ranNKNGE4eFlWY3BOUEl5b1E2dFlr?=
 =?utf-8?B?MzBwbHNpU1RXYlE5dEgyMFNxYnlkaEZ3L0JnYUI5cG9lY3NlTGFrakcvWXJu?=
 =?utf-8?B?Y1VhMGdiWmFobkx3eDB5WUdSQ0JhVDJZbEZ1YXlNQU9aQUVmSWQ1QldUT3N3?=
 =?utf-8?B?c05UMXlwTjMxS0x1RVYyRUp0enNJNTNyWUlIUlhMa1JQa0ZqaWdzQ0s5bXlR?=
 =?utf-8?B?SGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1db71a36-147c-48fd-0ac9-08da7470ec90
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2022 10:22:38.2086 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vzcY/wZK3ZgyE0x1/OlVUg1RCsQtrFTFrunpqQGLnrqA8nvSszkohPFjV2NxspTCMaOqaNPuNKgKE+UJm+TPN/emHhJ41316h1/ilZ9JXrk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3751
X-OriginatorOrg: intel.com
Cc: alsa-devel@alsa-project.org,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
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

On 2022-08-01 6:54 PM, Takashi Iwai wrote:
> snprintf() returns the would-be-filled size when the string overflows
> the given buffer size, hence using this value may result in a buffer
> overflow (although it's unrealistic).
> 
> This patch replaces it with a safer version, scnprintf() for papering
> over such a potential issue.
> 
> Fixes: f1b3b320bd65 ("ASoC: Intel: avs: Generic soc component driver")
> Signed-off-by: Takashi Iwai <tiwai@suse.de>

Acked-by: Cezary Rojewski <cezary.rojewski@intel.com>
