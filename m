Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 00CFE784596
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Aug 2023 17:31:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 23578844;
	Tue, 22 Aug 2023 17:31:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 23578844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692718312;
	bh=x169K6iQdBJSXx2OJMg6pFHBEfHfjpnmVNwApNlh2v4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tU4XOFlLYtNPefTHOEr92r6dxFz95Kz7K4L0TIFrSHq/Db8lx8jbNnwEhUdi4U2r8
	 94IqMeZVqO+Q+DT91GoLy0KffCucOKO5XWJA2jm5W4dNW0sWSx5VgI57a0H2n57yDJ
	 /bjmCDhlIdYV5NL4ngPjVdhI0OaOYLEBR/R/Y2qQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9046DF80553; Tue, 22 Aug 2023 17:30:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EDA23F804F3;
	Tue, 22 Aug 2023 17:30:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9F6F3F80537; Tue, 22 Aug 2023 17:30:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3C826F804DA
	for <alsa-devel@alsa-project.org>; Tue, 22 Aug 2023 17:30:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C826F804DA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=gJgh9Vql
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692718243; x=1724254243;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=x169K6iQdBJSXx2OJMg6pFHBEfHfjpnmVNwApNlh2v4=;
  b=gJgh9Vql8JuOp3voLPzzq2bcXS62ENnPib7KLS3J6j+fz+7fiM1VjZDb
   vHa/1Vdj3pOlQOtfjuguO1mDBsgCK8fgKbGRkKoB62J8BK2qeQyUi+RYK
   8DE/7TTdnbfsiBMmNU1GfCu6R+m3UrCDUg89PWunUUxZwui6Z4b27iqrn
   9tj0Y7W7uC6vAyUSuuUb2aUnm28Jx0XBIhehLARmF4DY4eGsUyaSvKsz9
   89cpiI0x9eiu0l+4xX1idJrcYtFHAeu4NuFM8XekRZvW8o+g9XQJk6Z6P
   r+H3+dzmlgs6StcGYjNnOZreNOUpUHc3QW8jr50Q48oiQuC7dGdSu87PI
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="354246456"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200";
   d="scan'208";a="354246456"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2023 08:30:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="910111115"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200";
   d="scan'208";a="910111115"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orsmga005.jf.intel.com with ESMTP; 22 Aug 2023 08:30:34 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 22 Aug 2023 08:30:34 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 22 Aug 2023 08:30:33 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 22 Aug 2023 08:30:33 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.175)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 22 Aug 2023 08:30:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ixUAVAJQkNi5xv1Y2ytbApSad0w9EO6DbnZ8MgqQtuzT9BsaDObCJRlD423LJiNT9+w8fKsGjf7T+erhwKoUYSg8y/gfCBHeujIgzQ+te3UN/e16nFJ4P3j1jCfgEyAMMrfaGUGfgkVh7udQdFDqDYlni7fBCr7hY8NCLxxZsLcd4wdeYeQi98qHABS37nEckNr6b2qCqpZ8NEBsPiHp+A5KesKu+qlYe4db4CnO+98U908BErg9B1Jh6+tk2KEv8CrB6NmIzup/PjvMtR8IWhkHEU/tGFxQgEfxlzSrjZb1UNefit8oH1vbuidMeSG8KhDYPTGdYjP3SimQfAhy2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4XinPweon7Bp3gG5x7XouiJJob3/B6EshgIgd4geOpY=;
 b=BakS3lIr465wy8e05qi8IEc6EkliPYQvqXzhGledDSfVDoIuX2idEh6F+UjLgksnMINCyXVTM/awBLEncbGCE8T2d66rjNLQT3T/4Qkkmhj52xxZ4qMizfQ8BHmoMhjoRswsJcev8ojdfnuB0o/2Dfphemzw+nLyjp4aZoLrZvXwShFMvIre+faa2PFavv5yhMy5Cjm7O/IFplrRtH5bHPFhbJ7qkoyjOyJR6FkR5DmIdcF3IfaTuPvjCO0QIU3lVRdPt8Sc6ZWQwe7XhzffPA505ubmK3hcfVAgZlx5rsAsPynf8eqjbimf09GS/Uj7mfNEMjrCxefd7a5mfzxX1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 DM4PR11MB6527.namprd11.prod.outlook.com (2603:10b6:8:8e::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.24; Tue, 22 Aug 2023 15:30:29 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::71cd:9328:e4d3:d104]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::71cd:9328:e4d3:d104%3]) with mapi id 15.20.6678.031; Tue, 22 Aug 2023
 15:30:29 +0000
Message-ID: <8198d1c2-4f69-b3f1-5368-ce60d1414f5c@intel.com>
Date: Tue, 22 Aug 2023 17:30:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [RFC PATCH 01/17] ALSA: pcm: Introduce MSBITS subformat interface
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>, Jaroslav Kysela <perex@perex.cz>
CC: <broonie@kernel.org>, <tiwai@suse.com>, <alsa-devel@alsa-project.org>,
	<amadeuszx.slawinski@linux.intel.com>,
	<pierre-louis.bossart@linux.intel.com>, <hdegoede@redhat.com>
References: <20230811164853.1797547-1-cezary.rojewski@intel.com>
 <20230811164853.1797547-2-cezary.rojewski@intel.com>
 <43b25b8b-3e28-bd91-a29a-846a5aa7579e@perex.cz> <87bkezdsjh.wl-tiwai@suse.de>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <87bkezdsjh.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0126.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::20) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6375:EE_|DM4PR11MB6527:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d031a9a-c350-40fb-d5cf-08dba324b752
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
 2REkC4UmE9VyykwlIAJAEtVGFiBepU04O93hCQdggGBjyjJuTO2ruwHQe6zZ9tcwoFofVrliCM0oyqYMdL7IV/jy0Pjy46er2PckGW8IkfU61NvFZTfVL6be8qoMGJ2/0VcB9Qv8QDwp/SRFPaPPP3buqClFOsn0Avoykkc/GxxWaSBkPPvWrbceE4pbnhxr+oufD0RG9yrOOgJWJjHtmqlzZn79Pt5Dfde4Lt8XcvhGekgwW3zO6+IXrb8w02fYfspH/5a81aCBZE+otdttIcPsxoUgnLUTFL/RQC1fSO/7PTTlgNis5VfL6dOCt2pzKzD+4VcUxPlP7HlSjeIsbR/hSfpl/3pRAKcxH8Bdfdmr5vRTwe2k52aom1a9WPzq8E6Lm1b0KC06n27IqOO6bKBdvIW8eDId45f7iJDfFhp6OZVfsTtTiRFmiQ1YRmjIGrIkVe3+I0qrnuLu/4ucADAgURDRYo8/GBb9Catj46RkCHPJyw4f4tXk7WTvdL0PeJTlvKLEYIVE10Xiu1o1Zawi5pI+MHxkQWdX4hwFJRCeXvTZ+DRyRNKHf5EO4zbhhwU3jLoxn9eIl9wrrYqRxQM9uaobpd7irNEpNEsdYciM/QJP72c7rsaJmdyLcifmBZIebZLFlvlyqgWwVNbKqg==
X-Forefront-Antispam-Report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6375.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(366004)(136003)(396003)(376002)(451199024)(186009)(1800799009)(83380400001)(2906002)(6506007)(6486002)(38100700002)(53546011)(5660300002)(44832011)(26005)(86362001)(31686004)(31696002)(8676002)(8936002)(2616005)(4326008)(66946007)(316002)(6512007)(66476007)(66556008)(110136005)(82960400001)(478600001)(6666004)(36756003)(41300700001)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
 =?utf-8?B?YVgva0R5VEdCTlBHYURTWUpTSnlYZGt2UXI5UFF4VHp3aDVRMkJMZ1B6K29E?=
 =?utf-8?B?TUFWZlJnK1R5YjFPR0lOemJyMDl2cnhNejZkY3ZLVUdaRDVRKzRjckZTTVJS?=
 =?utf-8?B?WHJTN1laL1gvVG40Sm8vVkp2RWpzRzA1dHRScEtuOGxEMzQwVVZISmhZNE1Y?=
 =?utf-8?B?aGN3UGxtZXpObUdPclpKT2xXa2txQnpsWnYzWG5SaTFTUHFYTDlYRHR0T0Jy?=
 =?utf-8?B?SzRYdW1hMmM5cW5zTDUxUkx1a1Jxd3E5bkd4b1JOamUvSEZybkpIa0N2eU1i?=
 =?utf-8?B?ZG1kZlVZaldJQ2wxUmwwSDRIY1I3MWtqNXdQWWc2aDVraU4rczY3UGNxSVlq?=
 =?utf-8?B?NkdUNlFTdGlmYllmN1dLM0ZocTl0MkpYSWNkQ05adnVvLzhBQklDZ3RIeVJm?=
 =?utf-8?B?NkpUb0paUHFVcEdBN0luZUtua3dMeGlaNzRpN0J1UUUxcEdZUHZHc1VOUDQ3?=
 =?utf-8?B?bmlHbmRGbkYyS21PWmZTWnllZ1ZNSGhwSXR3V3JhR29HbGtGaE9tYTJjNjNv?=
 =?utf-8?B?NFpkYmNZdlNDaUdoMERIOUhMNEtVQmxrQWFJOWNpNDNGVDB2a01SRTlRQzU3?=
 =?utf-8?B?R3U5b1pqQi9lS2hWYlFQNk8xd29zT3p6WVowdTRCSEgvbytuV0c2Q0l0K21y?=
 =?utf-8?B?MjBNWEJXcjBzZEhpeWJTNGdnTGtWQkx6bVVjNVNnYkZaemxKTDNpeVZCZndJ?=
 =?utf-8?B?SDFDTk4xUm1paWR3TUhtc1FFQVNVWVBibWZ1bFdPcnhqWDcrLzlFZlROcjlS?=
 =?utf-8?B?MmdNTDREY09FL0lyblgrUE81SHROVlBtUlh0NTFWdmR4VGlWTWsyalkzWGpM?=
 =?utf-8?B?Wm9HdjR3UGdWRC83VzhWYldTOGUwL29zWURPbFhnRFFFVHQzTUtoRFhGOVU1?=
 =?utf-8?B?SndBMEFxQU1oL2lDbXlYZFJiMG1xT1BIN0dzaWRBY3VLWmUySVZUYTdGV3Z6?=
 =?utf-8?B?UVdmRWtnVGxvalVpREJoTzRxRWdvZmFZL3R0OTZPQVdGcEx6dmRQNlY5eTBW?=
 =?utf-8?B?cWltTDVaY1U2MFYyeWJhcHFJTjB5UC9lM3AxcklOZFRFU2V2VXFSMlhHdlc4?=
 =?utf-8?B?TkpBa05FMWUzditaOUNqN1puTlpUamtLbHptbCt6bGFKQzMrSmxTMmJxYml1?=
 =?utf-8?B?OGFqTHJpR1E4NEdwL1R6YkErcURHOVpYRklvYzBhVWdnRDV4L1J0cFVPSnhC?=
 =?utf-8?B?a0JkRmJMS2w4eEUwcDNjeTdqSmFtaWJzNExvSDc1ZUp3OGxMUzRlN0hlKzBQ?=
 =?utf-8?B?ZE4wemZYdG9Bcmt2djZlWXd0dk1xd0N3L2pCN1VyYVVVVmlDQTlyQVBXdVEw?=
 =?utf-8?B?NURKaElWWktYUEgzM1pCcDFSTmtDb1FaR2oyc2VCL0R4NSsyZkFwalp1bTE4?=
 =?utf-8?B?T1lUa1U3VlFNZVFiSzJCUWJMZzNJdFpIb1JLVjBad3FrRC9CVUQvZE1hV3U0?=
 =?utf-8?B?dmhOQXRtVytoT3FPOWVIbmxBNzNDYjZJa2tmMzFPL095U1RsZWFITTg2Rk5k?=
 =?utf-8?B?LzJPd1JncVlpUiswOC9Vck9zWTVZWEgybmkvcm5BbFBpNmF1QjFMT1IzNlQ0?=
 =?utf-8?B?Zm1pd1phWTBIMHl4YzBSbjhZV2FsZFpwazU4Nnp2R2EvdHdEdDBQY2t4UmNE?=
 =?utf-8?B?NlBpd0tJQkN5bGdaT3JjeWIzaC91NStrUDFzZW5PNlN1S3pRUWRhdStETlR1?=
 =?utf-8?B?ZTl2YTZtT01vbkJqeUVYMlFoUDVHMDVjWXZlMDAzaVAvSzVFZnJCKzlYdVYz?=
 =?utf-8?B?V3c1QmtXekQ3alBIb0dMazkwUFQ2MFFRb21IVDVXSFBFWmord0xsRjRvWGZh?=
 =?utf-8?B?ZXdqQnJqYXdubTlWMDVWM0lIY0lHVjZ6aExndUM5WkZmaGQvSUljQ1NLV2c0?=
 =?utf-8?B?KzdMejZaZzNCZ1FFd2xxVkk0TVBuQXlaVmJ1QnllWlhQak9qaDdJZzFsWEJO?=
 =?utf-8?B?c2t5T0NoYTRDWkRya295Ly9PQU5CTmJlU1RaQjlWRDgzTTlwM0VnZzJOSDgw?=
 =?utf-8?B?T09Zcmpvdm9mT2lienhwa281SmNwME8vOVkxdUZRejhGVDJubENWNGl0Z3o3?=
 =?utf-8?B?VW1pNTRmeXoyYzlRK3ZkcUI2cEZYNnlHaXo3WXF1ZVNYbzBMRXduOStsalBy?=
 =?utf-8?B?Yzh5UjhBRjdtYTI1bTZZZHZqaXd4bm1Wbjl4Ui9sczZybUxVM1ZnY3ROU0lZ?=
 =?utf-8?B?ZHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1d031a9a-c350-40fb-d5cf-08dba324b752
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 15:30:29.4470
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 pynh2jXiLtDH8lxKegM7MeBB0zBdCz9q0dzA4UoKep6nadaGRnLDTF4GJR/vBLeE3wpQl/1TaHJlfOPHLfyWqPseLUXgDlHmexMycNMl75k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6527
X-OriginatorOrg: intel.com
Message-ID-Hash: SIDF344WGPQQWZC5WOOCAJHOKJGA3FNT
X-Message-ID-Hash: SIDF344WGPQQWZC5WOOCAJHOKJGA3FNT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SIDF344WGPQQWZC5WOOCAJHOKJGA3FNT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 2023-08-22 5:07 PM, Takashi Iwai wrote:
> On Tue, 22 Aug 2023 17:03:02 +0200,
> Jaroslav Kysela wrote:
>>
>> On 11. 08. 23 18:48, Cezary Rojewski wrote:
>>
>>> +#define SNDRV_PCM_SUBFMTBIT_MSBITS_32	_SNDRV_PCM_SUBFMTBIT(MSBITS_32)
>>
>> What was reason to add 32/32 format ? Subformat STD + msbits == 32
>> should already handle the maximal resolution. Until we do not have 64
>> bit formats, it seems like an useless extension.
> 
> My understanding is to distinguish the cases "we do fully support
> 32bit" and "we don't care".  But, the end effect is same for both,
> user-space would handle 32bit in both cases, so this difference won't
> help much, indeed.

Bull's eye. We do want to be able to distinguish between "default" and 
"must be 32/32" cases. In fact we do have a test where each iteration 
takes a different --subformat option. On some configurations, iteration 
with --subformat=MSBITS_32 is expected to fail and PCM device remains 
closed - negative test case. If given configuration supports up to 
24/32, then 32/32 shall not be allowed. Option --subformat=STD is 
expected to select the default max e.g.: 24/32.

Czarek
