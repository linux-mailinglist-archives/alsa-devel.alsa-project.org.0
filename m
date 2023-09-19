Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B86D7A5DEC
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Sep 2023 11:29:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7FFBEDF4;
	Tue, 19 Sep 2023 11:28:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7FFBEDF4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695115778;
	bh=G3C+I1ykHdwFH7Z/Pwii5CLO0iGtRy4k+mLO3LW3g7c=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uepXYs/afWD9W5UiO/iTYw0Zt1xhqPaLPlYUOru0sKpViT1KZWXf8XsJF78jN4cC1
	 MaCVaHrn2VWM1VTSec5aTUW5+9RpNviLupSY424o74uQIb41Mc25TQYOXmu41VW6eY
	 107eximiWVPvVcqeI9dcJptckFi6351bdsxuJ0Cw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4A7BEF80124; Tue, 19 Sep 2023 11:28:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B087F80125;
	Tue, 19 Sep 2023 11:28:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1BA5FF801F5; Tue, 19 Sep 2023 11:28:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7CC56F80124
	for <alsa-devel@alsa-project.org>; Tue, 19 Sep 2023 11:28:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7CC56F80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=WctAtQ35
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695115716; x=1726651716;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=G3C+I1ykHdwFH7Z/Pwii5CLO0iGtRy4k+mLO3LW3g7c=;
  b=WctAtQ354BAons9zpYLeSKuAIIXQpXgd4JNRANXTvjk2AvAO5UE4mV7O
   gXM1acZsDs3+aLjA9J5c0aQTAbnir+t+mYb4mg5+ylvguV+eMP9GTdStF
   3g0bd8jazLL8nrzaecw3G/hp4hW7h/L56LPlB5anGxzMLp49VW4tgDm2z
   kLjjO2u7YlBNUL5e3d/CGamLUDpiLPB86Q0mxCDu+IAKRFfo5f9RoctoU
   4Q+YSIUIH4Xit06bBC207UOvMdJeaWo9BdLjNic1GJR/NgKpsZ3jK3ATL
   ZsW7wBqe3kVUi8z5VhO+24sRfy5kU3Ly1ZgF08fUz+iRqxUucwSfmo4qz
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="359294829"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000";
   d="scan'208";a="359294829"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 02:28:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="919796831"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000";
   d="scan'208";a="919796831"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Sep 2023 02:28:28 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 19 Sep 2023 02:28:28 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 19 Sep 2023 02:28:28 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 19 Sep 2023 02:28:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rw3xXbRIDhE3OU9oihIzrM+RojLgtNojv8E+E8WF1mxF8nzL/Nu7WZMkxWRn7NnaMkyYZpZ011ow4ISx3zmeGPfnnXsJyTtitSojKFT1oUzJk4j1lijBbgTgBiHWFzwsIEEGAEISIuzX53QR8PN1+0PIVKmljhkfUAAn0+gyUO0BR+KUsLt2wiKpahjkFdT3g7JtPe1rqX99Yc9oDjGXbjknCgv5KVPjcV3SuYii8uQd5/2MlUnaTP3DK31p5HFxiZoAdnbhFJoXppVq578zG6+pcTlBZ0upzc2c0WktZPEtuU3W9EizKlGkRgh+ZrdlP/zdQ/uNWttiv1uGKdplSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a7Dhz/RZBlTIr29/983DoF1aEK4nW3QAMCT8HmCcZtM=;
 b=G/2N7RPccyY7CgSZlwrt3Qph6pMXPVVMA7DwcE17eHVMJ+zuOAXBNVdKfqFIrVKR6OvUcIYWajkf4cBUZSPlZr40vGo58vheYTUsuvrj4AtoWh1sfyMXJXaWt4cDYSGs5SEyNn1X0WvN1MaOJxDzxrsNVy8V1tIka7wdhK+1yy5xQV1jHlH8Y2gpJiwlbj5vzIE765DFCQHosM6Nd2xs3bbrqIb2SzD2ch/m2QV6ff34dJstjImVU5of+MOHfTXoiCZDUPi7+LojqUYN0qIuV/xO4oznAYHf7sM2lxvY7AIwLCQo+3vImF322SWktn55wxOJ0UXAMCuNhqGyYaCJuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 PH7PR11MB6055.namprd11.prod.outlook.com (2603:10b6:510:1d3::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.23; Tue, 19 Sep
 2023 09:28:20 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::71cd:9328:e4d3:d104]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::71cd:9328:e4d3:d104%3]) with mapi id 15.20.6792.026; Tue, 19 Sep 2023
 09:28:20 +0000
Message-ID: <89b0c3e8-2834-ba69-831b-51ea0621edb6@intel.com>
Date: Tue, 19 Sep 2023 11:28:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [RFC PATCH] ALSA: pcm: Introduce MSBITS subformat API extension
Content-Language: en-US
To: Jaroslav Kysela <perex@perex.cz>
CC: Takashi Iwai <tiwai@suse.de>, ALSA development
	<alsa-devel@alsa-project.org>
References: <20230912162526.7138-1-perex@perex.cz>
 <fd153436-d128-c1b9-dee0-ba03224fa013@intel.com>
 <f7dfdbd9-b8c0-fd65-1280-256e9a82fca2@perex.cz>
 <63b3eb26-3a76-5993-bd65-c3461a264b95@intel.com>
 <de412997-627d-9ad2-b9c2-cbdb78b70f5d@perex.cz>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <de412997-627d-9ad2-b9c2-cbdb78b70f5d@perex.cz>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0004.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::9) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6375:EE_|PH7PR11MB6055:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a4f7b72-924a-4c61-e56b-08dbb8f2c2ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
 Jm4fbUQihK6XMCwO/+xVP58dvUIqDIKEHTSvHIZyHpw1pNHoHkIsNeRe/vGQFU5E2sV6ykqArtUcFo+iJDBobsU3B6ep0xQ1pPHDkuj6SurDABEAw/ECmqWSJJrQleQXkB5mmtpmH+pVOc2WM0Nt2Eh9aio4rjvb8ysO9irnst+RMpcErSrB8CnBWJQk3i743mmUPFPbL3Fig310Z0TNzcH+fkvjd237h4v+E+bk2umZv7V6S1Mh11CDnCTd/SKdFnR0r9KsJ4ErE/O/p5PRzy66Soi/ormTJN/DyDBBXpkDnwp8j29xBULfob8m69HVYOMK2GKZwhg9/o6O5ephrm54bGLt1C8q7ftRelxPwKKTGjx3EebCIB5WX/KyGgASiycamCC4hgu4BP0JCpcdUNAGRZjyQ9yUimZ523xV27gzJKFh0I6kI//wrKj89wFr7myIyMaYpxcjarOgtroQ+tE/xbniVXBQ3pNBd5FJLGWBdHgl+Y3234KbI5B7BYI4AFAl0pvFXlQe4i4hhiuVD78+f7DSqcGbdvS4KfuMYX+8+RK3uy5ZYxZGcIYZbknyvYY1cinqojudsu2EuFSAAZF07HBok393dffjqWtd7IKldCCqxhs95Fb7P+e9bu8f8AQT7jy4VcthAr80FmRSK8TZRcISrREpXVYzApwDsVWm2Hy8ycwgUl9nqpL1hitu
X-Forefront-Antispam-Report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6375.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(39860400002)(136003)(366004)(346002)(451199024)(186009)(1800799009)(6486002)(966005)(5660300002)(44832011)(6506007)(53546011)(86362001)(54906003)(316002)(6512007)(66946007)(66476007)(38100700002)(41300700001)(66556008)(31686004)(478600001)(6666004)(6916009)(82960400001)(8936002)(2616005)(8676002)(26005)(2906002)(31696002)(36756003)(4326008)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
 =?utf-8?B?dGs2OWw0M2R3a1dKMTJwTFp4ZjZEeUViNFdURWhobThhcGw5Um41RnNyZGZG?=
 =?utf-8?B?RWJZbVJsSzF4L0ZFb0s1aFJsb2J6dmRYRUVkYmlRK1JjSFd6TWVCRHp4SFFr?=
 =?utf-8?B?UnZGUlZ5dk42ZWtjWFU4MHFlenU4ZlQ0bTlFRTkzQ0puOVV2V2tqZVVTS2Nq?=
 =?utf-8?B?eUgvclBkaHlVaHpvRFlVaUxpeG00cmRXYjhINkRydmk3YmVKYXo1dmZ0bGJT?=
 =?utf-8?B?WStrclVlMk9keldMMi9FV3JmOFdTWEdwc0xCWFFyblJNOFpXTWtjQ2NZNkkx?=
 =?utf-8?B?UFlIdkNhK280UzNpM1JLbG4vaHMvZ2dhbFJHcEVjUVBoblhXWnFiV1BzeFJV?=
 =?utf-8?B?TG1aOEhwT2JQWi9NRFBwVFZIME42UVRCaEFpZ252MmNwZVVrempPSXFyYjZX?=
 =?utf-8?B?UGNIWmtBRWVyTzFEMFZrUGNjOENYWDJyNERmNm9GNGhMQ1VXNWZDTEpNQ3o3?=
 =?utf-8?B?K2krWkYvNGoxN3V3U0lCYkhCTnlUTWtRZ1FzUFBnTk9aYTIwa1p2a093cUxS?=
 =?utf-8?B?cFRDY2wxUXpMSk9iNUgyQnlwcUErck1XNno4WnhqZWJ3SkhBV0c1ZUd4eWN1?=
 =?utf-8?B?M1hQZzkrdGsya1Qzd29FbWxtK2hJM05aemU5eWdsSW5ZZTRjQXdrZTd3UXNi?=
 =?utf-8?B?UmExUWRLb0ZEdnRwSmdEcWJpWWxMTVRKbUgrL0xGSlVOVXYwSFVHckw5bWE3?=
 =?utf-8?B?TUl0c2g1VzdhUUF5ZEpCYm1Oam5LaUlYVjFFbE04bGpBcU1TQnl1dDVkbFRR?=
 =?utf-8?B?TXVGbkFRVDVoK3lsTG84N0pXV0tyRlFDcjFPQm84d1pxUUVtanhjZU1Cdk9p?=
 =?utf-8?B?NGRkNXNwQ1hOdXhmdERoV0NQb2o2RERGQXFKNVhUOGgyYTF6MktONU01U0ls?=
 =?utf-8?B?T2hHdzcreE5rUWJkcGI2ajhyV3lNRGN2RnhkUnVEdG9RUzQ0cUVmSHN1MkFk?=
 =?utf-8?B?d25xdXFOUHdiZ0YvV1hBaGljdHFsN05iazZzWk85Mm5vRVhtVGpNdDRGc2pB?=
 =?utf-8?B?MG5hdElVWHJSWWxQRlBzaWE0Y21FZkl1d25HZGFjSlZIaENvQ25vYWZQRmg2?=
 =?utf-8?B?WE9pK1h4NjVuRWNkdkxoRnRxY1lZYXJGRzhpbGFTeExGNElUakdzdmJuRUly?=
 =?utf-8?B?R0RiNVBNV1U1V1ltMFYrRFFiczYxejlxTW5sSW52eFFUUUlIRUUvbHJpMWVu?=
 =?utf-8?B?MGEwcm42ZzA5MmR3L0QrV3ZKVmVJNlhQcU0zenpVNnFjaVNMdjVzcFFNQ25z?=
 =?utf-8?B?V3ZWeFpaWmZ6TU1uODBKRWVib3kvdEJHWEpTc3dZdkhaMVlLbU84dnJrL1Zu?=
 =?utf-8?B?M0dhM1N2ZDJDV2xpbGV1Ti80b0lGaWw2bVk0NW1xOHlJVEk0TjgxRFM4Ny9t?=
 =?utf-8?B?VDB4N2VCNU9JSUVBUUV6MHhaRW1sbWQ2ZnRNb2hjcmU0dkNzVnJpWlBxTkdh?=
 =?utf-8?B?Mkh6bDZRKytUYkJwbmlnZ3cxb0JyZzlRY2QwK01FYVJsdXpISVVKUm5hYitH?=
 =?utf-8?B?VUhKV3J6TXdSbjJsbGNyc2dDT0hza1YwTXk0QjZZa2lRZGxMaVlMME55RWFP?=
 =?utf-8?B?ZG5xN3ZHOEhwZFZaQ3hhbkE0RHFGbUM2SXlxbnorS3VpN0pJMTZqMU9KOGs0?=
 =?utf-8?B?WkRIcGtyOStUN3FyWGZXWm11OXFkcER2UzFXRFlPTzlYU3JZbEE1YTJwZmVM?=
 =?utf-8?B?Y29yVnpYaWhFQkFrUjFnRjNRT1cwSloxK2JnN3FkT3FmRStnWUMrWElRMlh0?=
 =?utf-8?B?YURReFV1anJWMDR4WmEvSXZGcWVPSUlDRmhWNEpsVlNIWWVKL3JFbHI3SmVn?=
 =?utf-8?B?a0pHcG1wU3dRSVRXKzc1N2RhOUJONk1TSXlVQnpnVFg4NGoraWhweldlRmds?=
 =?utf-8?B?NW1sTTFuK3BuNlRxMkxMUDNiSmtIbUFYME02aStuSUxQczh5SlhRYUxxbFZn?=
 =?utf-8?B?OUxOMEgwZUlkU1gwS09LUWQrUVVlT3FmU3lzc21vY1RnOW9IVTljVFJ6VUsr?=
 =?utf-8?B?enYvQU1Nc3F5alZSL2trY0d0VXJpSW8vZThPZXd4V0lXTVZLWmYvTU5jeHBx?=
 =?utf-8?B?Q3RicVViMWJ3aWtVNi9JMVhJTUU1Wmo1b0svaGtTM1JDVkdPWFg4cTdpUHc3?=
 =?utf-8?B?ZXFud0dJMWt1UmwyQ1FHclBYbnVSWUlKTHhMTUttaGVRVzkrY3F3NGJhS3FX?=
 =?utf-8?B?Z3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 2a4f7b72-924a-4c61-e56b-08dbb8f2c2ea
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2023 09:28:19.8047
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 wsa8BHRmAezeLcKs/sQllQ9qQwnsMYDHz2DMMXOADoAN0KkZX6ye+Ngge76htn97bCLF2JIMniChmcjlJYOJTDX+FTXQuFC/fRPfONhdMVM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6055
X-OriginatorOrg: intel.com
Message-ID-Hash: ZI5DLWYOYF4SFS3CF23P4RI7TDSVN2HH
X-Message-ID-Hash: ZI5DLWYOYF4SFS3CF23P4RI7TDSVN2HH
X-MailFrom: cezary.rojewski@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZI5DLWYOYF4SFS3CF23P4RI7TDSVN2HH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 2023-09-18 5:04 PM, Jaroslav Kysela wrote:
> On 18. 09. 23 15:55, Cezary Rojewski wrote:

...

>>> This is for a special case when the drivers do not set
>>> snd_pcm_hw_constraint_subformats (all current drivers). In this case,
>>> the default is to handle STD and MAX subformat bits.
>>>
>>> This constraint should be applied only one time. So this prevents to
>>> install it twice.
>>
>> I believe we could avoid special-case approach. Have a copy/intersection
>> helpers in place and utilize iterations-with-sentinel-entry. Provided
>> such in v2 of my series.
> 
> I don't think that it's required to carry the format->subformat map in 
> struct snd_pcm_hardware. Only few drivers will use it, so the separate 
> constraint is fine. Also, you can remove a lot of your added code to the 
> pcm_misc and ASoC core (copy, masking, allocating) when the affected 
> drivers install the map using the constraint call.

I believe the question isn't how few or how many, but are there users or 
not. The answer to that question is: there are users of the subformat 
feature.

Adding an array of subformats to the snd_pcm_hardware makes things 
explicit, example being sound/soc/intel/avs/pcm.c. That's a win from 
maintenance point of view. Another thing is that we could utilize 
subformat to drop msbits entirely in the future. To summarize, to make 
subformat a first class citizen, we should avoid special-casing anything 
related to it.

> Few points:
> 
> 1) PCM API interface changes should be separate, you mixing unused 
> helpers and separating vital functionality for drivers

What I could do is shuffle the code a bit e.g.: let snd_pcm_hw_copy() be 
introduced along the ASoC changes. Frankly that was the initial approach 
(forgotten to update the commit message of 04/17 so it still talks about 
code that's no longer part of the commit).

> 2) if you copy 90% of my code, I don't think that Suggested-by: tag is fine
> 
> Could you do your work on top of my patch?

I'm afraid this isn't a fair claim. The feature is driven by validation 
and this has been conducted be me or my folks entirely. Given the scarce 
guidance provided in [1] I still provided a valid WIP in [2] and 
expected to iterate over it given the feedback. Closing the discussion 
by taking a single patch away from the series and re-authoring it is not 
a welcoming way to do a review. Perhaps Co-developed-by: then?

Please note that the code differs. I do believe that splitting the API 
and the constrains into separate patches is a better approach from 
maintenance point of view. Proposed readability improvements have also 
been applied in v2. For reasons provided in previous paragraphs, I chose 
to avoid the chicken-bit and treat subformat constraints in generic 
fashion. Also, validation shows that without updating 
snd_pcm_subformat_names[] in pcm.c the code ends with UBSAN during 
runtime. I've already addressed that, even in v1.

I'm happy to continue the technical discussion as there are still points 
to discuss. Let's do so in v2 of the series [3].


Kind regards,
Czarek

[1]: 
https://lore.kernel.org/alsa-devel/337fe790-fdbc-1208-080d-5bcf9264fc65@perex.cz/
[2]: 
https://lore.kernel.org/alsa-devel/8d76a1d8-e85c-b699-34a0-ecea6edc2fe1@intel.com/
[3]: 
https://lore.kernel.org/alsa-devel/20230918133940.3676091-1-cezary.rojewski@intel.com/
