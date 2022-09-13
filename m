Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4F75B6F1B
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Sep 2022 16:08:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 12CC2175F;
	Tue, 13 Sep 2022 16:07:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 12CC2175F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663078085;
	bh=kl1O5/D4ZCMyYPe/UeqsHLg52DAjLzpM9u7Hd7gmdng=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RYGpte1BJ0puEfH6it+xEZLhFTqEDuemaDK7Y+gQcN3ozNNLmCKfKT/V+GWDhRfgJ
	 kxURBPwu18+x0pdn4J2q2M3dBlQEmtFyrHBzqE4fdxk01N+GmbVQ+LcIOxWgfj6O3W
	 RGuuqTw2MXTGYUkCSnTXT9YX1nvUbohTnLNi4mmk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9C6C3F80269;
	Tue, 13 Sep 2022 16:07:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6EC54F80154; Tue, 13 Sep 2022 16:07:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 63753F80154
 for <alsa-devel@alsa-project.org>; Tue, 13 Sep 2022 16:06:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 63753F80154
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="W6ufhFqk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663078021; x=1694614021;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=kl1O5/D4ZCMyYPe/UeqsHLg52DAjLzpM9u7Hd7gmdng=;
 b=W6ufhFqk5cAl2TMXqkKIMQYNbeS6UH04Max7fVnI32v7lGXKZoS+pgFq
 hnfUyjEtrH6cbZJso1YwCFvqORftF5qHDVdegY3NH3K9WF7fsm7CEHnKR
 MboJoJu3NOVJ+jMsa83/BjtcGPA1sfRv7rsKUkDSzDBqhS4oci7d6wk0i
 wT0D+5D1ZX81h81MwnEcrlBpeZDPvhvCAQYTTmy1uxg2ceuy7pRNDTfHR
 uopF1zAyGkPPxSINVNj0T6AVznze4sHYBRoE9SuD/Uh6WVFsUObdlKxa7
 H/+Rx238/gTNbR09zkmtIJEmxMAK/8idEgcR6V+tVNoC0lp/5doGmewQ9 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10469"; a="362093427"
X-IronPort-AV: E=Sophos;i="5.93,312,1654585200"; d="scan'208";a="362093427"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2022 07:06:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,312,1654585200"; d="scan'208";a="616469231"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga002.jf.intel.com with ESMTP; 13 Sep 2022 07:06:55 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 13 Sep 2022 07:06:55 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 13 Sep 2022 07:06:54 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 13 Sep 2022 07:06:54 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 13 Sep 2022 07:06:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A26maZyLygQ4GZ5Bcgc3HS6MrATX1LUneg2VXEbc9jXVMhMuosV+PZR6QXIWQBFNvecTH0oottJLvlKrbYnbqAwFuHtRSSwOZAm80kwU94OIUzSLz7PTUOPCmG0nTsoy2mVU5GzcgJ4US0apQ3VBTcwNx2R0BQWjjN3wkU9HV3VP/raeH4yz5GubZ6D/39iZ89XoVM8Nm7O870kvTJu03+XND0i4up/LqC7RBNpapNH/A24ZOsgq+5Bysv7QIf+umWc2wIbuhOobbYwvzIfGROZ/wVqz94OXEx8rZMABBV93GDyY6VHsCvj7ilSNK0kilIQdFKA2D8eonCortWHevQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=14t/pIpJUQSxlhHVhVrX+2/UtH4ppfmsXjnU5elJUZ8=;
 b=TvL/pWE1cQGEDlLNcj27eC8pYLe/sWn1IZ5ffpGgpuAHNsp+2YwnnitY4lmebej2+KE2fT7KowzhFfZPVJPgmESeSs61bDlrA29qJYCt4Yq/FdCQkRIb+jDed1OsLpaR+A15Egg6bKbLjZRaE9ljUlsY/vthf/aPFtcVX/1XmjMv7XTQUXXbO9ep7Rrwr1UAAW0MndgbFiS0bzWnURzBD7wiXuJfBQLfM2MTVceILrhxug2p/OabjleTSgvVuTHv57pD52vSuaSoh1C6HrqDlV0mZFNg2gz7rokF4qtd+/g6pSnn8VYckYTZz+d5on8c6/K2uyzD0diJYqMklak+6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 CY8PR11MB7169.namprd11.prod.outlook.com (2603:10b6:930:90::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5612.19; Tue, 13 Sep 2022 14:06:52 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::b5fa:8b77:19e8:f342]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::b5fa:8b77:19e8:f342%3]) with mapi id 15.20.5612.022; Tue, 13 Sep 2022
 14:06:52 +0000
Message-ID: <77b2bf70-6b65-3e8d-a3b1-d0e3575083a6@intel.com>
Date: Tue, 13 Sep 2022 16:06:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.2.1
Subject: =?UTF-8?Q?Re=3a_=5b-next=5d_ASoC=3a_Intel=3a_fix_compiler_warning_o?=
 =?UTF-8?B?ZiBmdW5jdGlvbiDigJhwcm9iZV9jb2RlY+KAmQ==?=
Content-Language: en-US
To: Wang Yufen <wangyufen@huawei.com>, <pierre-louis.bossart@linux.intel.com>, 
 <liam.r.girdwood@linux.intel.com>, <peter.ujfalusi@linux.intel.com>,
 <yung-chuan.liao@linux.intel.com>, <ranjani.sridharan@linux.intel.com>,
 <kai.vehmanen@linux.intel.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <alsa-devel@alsa-project.org>
References: <1663063320-29158-1-git-send-email-wangyufen@huawei.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <1663063320-29158-1-git-send-email-wangyufen@huawei.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0081.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::7) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6375:EE_|CY8PR11MB7169:EE_
X-MS-Office365-Filtering-Correlation-Id: d4bafb8b-2dab-4f98-e85e-08da95913545
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ipAlQPTaIq+VmfINmfukLiq6gxBKch5cnP8uby5XoKCPg8f6aY+JyJY2nXiven303Wj+buKYFCz+0kICjnpmH7WZOq/kTnd6OuKMr60Upvmsc76xUlKg2aHDBJhEgbE1CLQNQFFD1bPLyIEI38KOkjLNPAqq2zgPCyj9UElVm6GHgdE1fcEzJA+nrH8dvFmldtZfbPJ2bAvysJsKgDVoHPSCz2LlzOa9akbY6bGQ9qZYlCd0muBni3CUY4XQGXI+ro2fo9qn5Xi1YJ8+W5Rm4KuPwwt/6fYywfFAQv3/inAMfuVudsuCdBhe+cEIr/UYdRR2J1HhEkroSzCAhN3MwTASL1UfMYTaBHkUNx/Kw7+0ERfmjfqPqRFlBJZh+/DhXzuX4QghPeJU6Kd2wqjWcs3hH8QDu39JQNnOCaw8AAKRq93hGd26VLxWuWQr4ZNHQvuticBGY+a8JKbxHv77uziY1zv4jsCwsBOuptUGqLyUoK7tUjOr4xtphKSTRn9UJF7G9DnY99OPFqSzHnyBQYBefMa0uvV87bZpYjlIJyjasc5r6r0ec1WWiGG9MuRmKYl25GqXE0EdTcRP3ZL1ar4DPVna9zrRd5sFjAVYFbUciWa+xE5eDhWwUE6X0+7Hp2OFiwbJKKogHDdc9F0En5Dbf6jluq2EUJ8GL0PRs3EUF7KKddBbfwH62s2W4WRMKV0bRoEmqfexRxoIp8Jej0K4CJo094wxGFcBhwMYZJZPyVnt4yU17MJ6IWXrD+dZY3vs4leTPFYoQRJNhoaCW0p4VLwNl7bdx1fV7sB3952WtfBodK47rjOkb7cwOfIlCKxWy+ZHcDy46WfZN5HHXRGRYgxHWvUKUyu4G/xCAr8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6375.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(366004)(376002)(39860400002)(396003)(136003)(451199015)(66946007)(41300700001)(66556008)(82960400001)(2616005)(36756003)(83380400001)(53546011)(6486002)(7416002)(8936002)(31696002)(86362001)(26005)(478600001)(966005)(44832011)(921005)(31686004)(186003)(5660300002)(6512007)(6666004)(2906002)(66476007)(38100700002)(6506007)(4326008)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cTZPcXNIUHNDV25ycFJicC96c2tnYXJoY0pEMFFCWWw2VnVHd1RtN3RyVGph?=
 =?utf-8?B?VmdHb1ZYcHRORDd1NWJ2TGRaaGxXZDZQbkp3R013ckxpWU1Qa0ZaZFJ1ZWVS?=
 =?utf-8?B?MjdZWkhTWk04QXJCMThqUmI2Zjg1Q0p0dXQ5RjBrUE5uNUpwbjhQcHYyOHRX?=
 =?utf-8?B?bkgxTlFtVVlQeEZQWEtocVVTeDEvOGU1UGxQOGJxYTN3Y0VLVlV1NTJWdGEv?=
 =?utf-8?B?VEYxZXVpeHJuZ3BKZlhvV3B2L0lWRnRma1dCNksvTUg3ZFkzUldEbXBJaFdl?=
 =?utf-8?B?ejV1T0lld2NFbzc4Z1J3cHNMaWhDVi9KeGFDZjNvVnk3ZDFWeWU1UmgrQmto?=
 =?utf-8?B?L3BoVER1Y3AxZHlFME1ObkU3T1dKbStRNDMxZ2FtRUFVY3U3MUx6cDdZaGs2?=
 =?utf-8?B?dEo1UGZkcStJeWpaalF1dXFNeFBGdjcySjZiRXIzWm1mcko3QXE4VWUremkw?=
 =?utf-8?B?bmxCMG50Q3gxVkJPVTQ2YjZQemVwYWptM3pnbHdrUlRsTWdSaGFUV25zWVlW?=
 =?utf-8?B?RER6cWtuVFlrVC9xUjV2TGdRU1BFRUcxbTZnb0U3L0k2b25KdlhFRlZTc3dP?=
 =?utf-8?B?QzlGZ3pmR3lReDJ1bVN6dU9VS25JQ0tON2tzUzVjRytJZlZRU3kwZm4xS0lM?=
 =?utf-8?B?UWxwMHIvTHhzZXM2S1JCVHNqOUtQcEhYWHhINm1WQm5wQ2RhUEtHUDBJMXpa?=
 =?utf-8?B?UG9McFFFWmkvS3NzSHhTRTdMME5GdVAzQitmcm1tVUQvU0VaTXVRZXM4Vysr?=
 =?utf-8?B?NzJYS0RhYklIVlJ6WGVOTVBIUU0yRXVRODh4VzZGRVlsSm02VmdZWWxPZXJ3?=
 =?utf-8?B?M3JQVE5md1FaMEhhbStTRFltd214MmZ1R3ptakFOQnhGK0ZGM3N5ZnRJaTlM?=
 =?utf-8?B?YTc5dmVVOUN6aHBKaUxNOU1VMHVtY0d1djlHYmlrbmtsTHhlOTFPdHc4MTVC?=
 =?utf-8?B?akVqV2VBczlyTWo3b1ZRcUZjb3NPRnF5ZVpoc0w4VmVjUm9KdncrQzRsUnNs?=
 =?utf-8?B?V1hiY3JYWHdTMjlURzlvbWIzRXArVVpmM2VUMVVFNzhkNEFkbm1HOGNnaEJE?=
 =?utf-8?B?OWpUSllXSEMycitNMFh1T1k0SGVHejVrT1FySDRZSWk0YlZkcmJpbDdWc2wy?=
 =?utf-8?B?NXdESTlqQ0k1Sjh3Rml1aUl6ZU5qRmtpNk9WTlBJcWwzeldXa28wVVIxTWJ5?=
 =?utf-8?B?eVV1S0FKdnU4MzFWREpmQ2h6SW9HNUJpK1NjMHptVTYveTdWSzEyN1hPTUZP?=
 =?utf-8?B?V05RTXBvZ3BJVzFDeWRmN3dVdjJKZ01uaHE2SGhNVkF2cGtWd1JyV003enR6?=
 =?utf-8?B?UHg0amc2L0d0MkZ2T3drQWN1MW5pOHEwWXByZ3AwWWNZWDRrVHdMVVFoTDh0?=
 =?utf-8?B?RkcrQ0V4R1ZYWlhHNjgxUnFaSWg2SjQwT0drTU9hZjg4ZThkK3Z4clVFZ0pZ?=
 =?utf-8?B?bVNXYkhZSWR4dFl0RzJuMTFPdWtwcVRLK3ZuS1I4OStLZ3NCOUl0RUlSb3NC?=
 =?utf-8?B?T3RzUGZlc0V1eXUwT1lOWW16RENYcHc4NXJWWWp6ZWxCcmNRM0ZGd1ZTRm14?=
 =?utf-8?B?bWJQUzA5TWt1WFJUL3REdFVpcS9FdDdlaUY0dHg1TlpCUzRGZW9naGkvb2ZK?=
 =?utf-8?B?ZW9rL1RHTnd6N000Rzc0emwvaDRVNkdyL2d5RDB5a1N4ZzBRTVhZWUFSYms4?=
 =?utf-8?B?bG5jazdkQ0xvVnoxV1dzcTlvcFQ4aVdGSWpJTW1yZjJ3cklhaHQ5bnFnZXpL?=
 =?utf-8?B?c256YjAvRXltbjUrb01lcnozNG1zcHVkS1lhYnpQN2NqTGtyUDMxRHJ1ZERK?=
 =?utf-8?B?cjV3Zi83Y0xKWHZ4Mzd6c2kzMlQ0Vlh0N2VzMTJ2MFhPRVVGT0RKbEJlN2hC?=
 =?utf-8?B?eCtrWjlSUlE2c3orT1BJZ1ZhTUVPdkRNTWgyakhCRVV3MlU1WnEzQUdjVGNs?=
 =?utf-8?B?K1NGS1kzK1l2NlhjZEZ4ZllGKy9xdERBOHptdWdZTkVyNTE1blQyMklEZ3hW?=
 =?utf-8?B?OVg1dzBrR0orVzJFRkF5Z3BxNVhOM09oQWkwWmc4UFhDb25OUVpteGxSQ00v?=
 =?utf-8?B?RjZOMmpzajdnU1lBWjNqamY2aFJQaXpQQzUrYTZVLzljTFNRMWcrYzVpN09s?=
 =?utf-8?B?VDlKVzBtOGcxS3oxcEJIMzhXTVRWbHRJWlBKWWZZNmZSa2tpeHhuSjVtZlpM?=
 =?utf-8?B?Q0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d4bafb8b-2dab-4f98-e85e-08da95913545
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2022 14:06:52.5430 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gQaB8Gi0CkFeuyKm6dOPFJo1pbWPJ2kcHuJZcZQ1WCDjmDzb5qdNNXb/xQPQM1tHYXsT1vXuSvOzWPPgwvGWn8FmuMhS9Bfzlo0N8bXcICQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7169
X-OriginatorOrg: intel.com
Cc: linux-kernel@vger.kernel.org
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

On 2022-09-13 12:02 PM, Wang Yufen wrote:
> Move the variable ‘skl’ define to
> CONFIG_SND_SOC_INTEL_SKYLAKE_HDAUDIO_CODEC enabled, to fix the compiler
> warning:
>    sound/soc/intel/skylake/skl.c: In function ‘probe_codec’:
>    sound/soc/intel/skylake/skl.c:729:18: warning: unused variable ‘skl’ [-Wunused-variable]
>      729 |  struct skl_dev *skl = bus_to_skl(bus);
>          |                  ^~~
> 
> Signed-off-by: Wang Yufen <wangyufen@huawei.com>

Fix is fine but it has been proposed already by Gaosheng [1].



[1]: 
https://lore.kernel.org/alsa-devel/20220822035133.2147381-1-cuigaosheng1@huawei.com/

Regards,
Czarek

> ---
>   sound/soc/intel/skylake/skl.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/intel/skylake/skl.c b/sound/soc/intel/skylake/skl.c
> index c7c1cad..52a041d 100644
> --- a/sound/soc/intel/skylake/skl.c
> +++ b/sound/soc/intel/skylake/skl.c
> @@ -726,8 +726,8 @@ static int probe_codec(struct hdac_bus *bus, int addr)
>   	unsigned int cmd = (addr << 28) | (AC_NODE_ROOT << 20) |
>   		(AC_VERB_PARAMETERS << 8) | AC_PAR_VENDOR_ID;
>   	unsigned int res = -1;
> -	struct skl_dev *skl = bus_to_skl(bus);
>   #if IS_ENABLED(CONFIG_SND_SOC_INTEL_SKYLAKE_HDAUDIO_CODEC)
> +	struct skl_dev *skl = bus_to_skl(bus);
>   	struct hdac_hda_priv *hda_codec;
>   #endif
>   	struct hda_codec *codec;
