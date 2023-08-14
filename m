Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6141577B719
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Aug 2023 12:52:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ABA341F1;
	Mon, 14 Aug 2023 12:52:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ABA341F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692010373;
	bh=58w29hSkB6Qx4mzkWkFCcBhpWztGF25UFuMZgf7i4I4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=f709Ja+oAwoQb3fVuhOJewdP91DhJh5zeezLr9fwEfks5huc03EzwAfbCsCa0S8oS
	 gtFegLzRD/MBN0Hg4+JtG5JBw6rS7sPZsa4kSisg0T7u4Po57ya/SbmmUae9KxtySo
	 2DAgRdSP60d8IcbSpzdE+XCp/UEy5ijgKLcbBcdk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D9603F800EE; Mon, 14 Aug 2023 12:52:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E429F80254;
	Mon, 14 Aug 2023 12:52:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7110FF8025F; Mon, 14 Aug 2023 12:51:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F2D0DF80074
	for <alsa-devel@alsa-project.org>; Mon, 14 Aug 2023 12:51:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F2D0DF80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ey5k4WzS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692010306; x=1723546306;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=58w29hSkB6Qx4mzkWkFCcBhpWztGF25UFuMZgf7i4I4=;
  b=ey5k4WzSYvBWoQMcVW7g+roGiprQ7ulr21G2BrEYPa82X5wLL+XztH4U
   YL1sbcDLMh728d2Jg2zh564/PHMsAweIc7ml4LYL0zwh5RcobFR01l3RE
   fpvvSBMSMvO5T2E/rgdgy5rP3VaXRLRNRpZKwLF+ZGcjFRYX2Kx+ylKNk
   Jlyx8Us8t4OfCZl/D8IfbsFPkUb/uot+xB4MozbEjxY9Nj/Yu2kRoOTtA
   JinscD+eVFmwUdvMIW+XmWXoLpWNCcudo4r8wjqs2ZmDLKDbMd+mIzmYa
   SD3FwTVHJ2giV5SxG47eZWFsOSEzekSIzYSP3pti5N55vHqXQyayiGEm5
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10801"; a="435903469"
X-IronPort-AV: E=Sophos;i="6.01,172,1684825200";
   d="scan'208";a="435903469"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2023 03:51:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200";
   d="scan'208";a="876908165"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmsmga001.fm.intel.com with ESMTP; 14 Aug 2023 03:51:43 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 14 Aug 2023 03:51:39 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 14 Aug 2023 03:51:39 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 14 Aug 2023 03:51:39 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.42) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 14 Aug 2023 03:51:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hY3hvpwBGz4RWFrvvoeUDlDTtuDZQbbpGsfl2NJw77hzcpBm9UsZ22AFU+5hAWFpmQdgz7MPjWvCGgYBo7n9+nomui3EoGBAu28P6VKhck0xtb788GyIUQ84ZjjGQ86gsPXKPUjtNbIVFhk8/+2FB5Waw96U6TySzShJv8iQpd4furJldWNvdWhaOxGMnRwu4mfegf7FjiCNtGlrRE/6KOzorEr810rBRT6wGFVDYyNdDmdKBqfljUOXhWNEUUkFeOrFbCvPpb9UlGBzoIJ5r1z8EwZK+XJa1zNNCE0ZIw1/Y1Z40tOOKzk5U5+mkJj/SEpcm9hZ3wdHLIccnDSSTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jqgJnKpgy3pYEj7CF0wSPcUy/qCRnrmG0d/7udQWh+E=;
 b=N2wHGRyscOGQgOIaH6fXUDr4VbhD2+HBTG0Y7uB9rUE5nmztU6NMGZffakjz8vhrGSx2qkCRNLU2vxVb/OFfqeWb2E7N0eOyBRJPk3oC8g1aTnKvS2zsg6Idp4nnmMHCg4/BWLcS5hyCmgeTSn+bMioHoU0ZRZ9uVQ+gfHzBrnQURI1znhPgDiuSjvr08ztKE3Rg2ssUzCNR/eG23m5dRtKpeLAjLNlvc7UFUqrxlrmweXSdtf5oyPEWTqALcfR4X7RQlIcf1/B3SMsw7eZ8oQ4ztkUPTYWBNyPauEYLPoD56aVe5OA8CBZYM0fRk2IBhKDkafeCEh7IoUwdHCnLmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 DS0PR11MB8205.namprd11.prod.outlook.com (2603:10b6:8:162::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6678.24; Mon, 14 Aug 2023 10:51:37 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::71cd:9328:e4d3:d104]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::71cd:9328:e4d3:d104%3]) with mapi id 15.20.6678.022; Mon, 14 Aug 2023
 10:51:37 +0000
Message-ID: <fef42075-44f8-c897-c05a-180dd30f5b37@intel.com>
Date: Mon, 14 Aug 2023 12:51:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [RFC PATCH 13/17] ASoC: SOF: Intel: Switch to new stream-format
 interface
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
CC: <alsa-devel@alsa-project.org>, <amadeuszx.slawinski@linux.intel.com>,
	<hdegoede@redhat.com>, <broonie@kernel.org>, <tiwai@suse.com>,
	<perex@perex.cz>
References: <20230811164853.1797547-1-cezary.rojewski@intel.com>
 <20230811164853.1797547-14-cezary.rojewski@intel.com>
 <0474e41a-0e69-d739-1e4a-cdc555e6fbd0@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <0474e41a-0e69-d739-1e4a-cdc555e6fbd0@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0049.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::9) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6375:EE_|DS0PR11MB8205:EE_
X-MS-Office365-Filtering-Correlation-Id: a2a92d0d-ddf7-4494-85ce-08db9cb46ec8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
 tTzSGXDkuNjmM3pVYUR56bcs5mggVhUO1Zzy5pDk7aq0wF+TaelC3Rzpge7c9pJWd728g4RNvH31I1y3ODuiQbWVJWkoCjPvKee8EPT6BZ4kxpD+qAY3cMtXgwPFZe2zF3nMxb6KRxws+3RyDkGmqXjW8oFvoqN2Jg1gMktu57VAB2AIRxt/ecw+oTPjzWLmIBiM4/P9/bZS64PN3j6U9az9IJ4IMlvoJvbn7jzO4s0DxWGii7oPGVPzSnCdWV1mS3DZMphc4IZ9XvaBLnxMNOnLUP3Pbh2bOKKTr1amlA7gtiqLXrRxfkW8J6Ujl0QXmvXTVvcnn99dwWAEY3ogTKkO7APvV+IsCWCbL4oH6z0NzBKE3/md8mHjQ5n9CPjT+RXrPVNeykgsdVOf+VJ/LklVDvCxc3TbfxWaAdkq7v+I+/HQ/pKnoS2cDrgpbdxoPa0ZDcBrSDZgGsaj0kV6RJOk2gE6fVQw+qavdY/z3HcngF75pcQfHvN2r4J7XnqUBzTx6W1rnW39JiKkmLb8zubrePlKTB/r1gv1/39fkLSpXfByRKg2su5I2B+zsQKthFmWlgOhep1jxwAXDZ7iodCaW9BUM7pe8NCN924g22NqDS7mKEh2ZC+zOO8U57r6EqFt4FgBBkO/ukK+zvBDVA==
X-Forefront-Antispam-Report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6375.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(396003)(376002)(346002)(39860400002)(136003)(186006)(451199021)(1800799006)(4326008)(8936002)(6512007)(86362001)(478600001)(6506007)(6486002)(316002)(8676002)(66946007)(41300700001)(66556008)(6666004)(66476007)(53546011)(6916009)(5660300002)(44832011)(26005)(2616005)(31686004)(31696002)(36756003)(83380400001)(2906002)(38100700002)(82960400001)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
 =?utf-8?B?RWIwVyt2bEV2b0FlT0Y3eGEzcVNSOHV0ZnBadUROWDRCRnVpZUpRdk92VkdY?=
 =?utf-8?B?N3RRUnVmL1Y4SXlvd29vWlNlV1NyVkxKMldSZzhWNEFaUlF1RVJ0d3QrRTJV?=
 =?utf-8?B?YVk1VkwvdVZNMW1wOGdVS0dTL0JlenlpSFd1ZW1pbGtIeklrS3dwVEZIWXZT?=
 =?utf-8?B?TW9KTVl4dVlKTm80UWdDYncxaURkN0EwNjNRNy96TkxEbnByWHUvWFFkSDds?=
 =?utf-8?B?aUhlM3VpUElieWxteW95azJBVWJDN1ViQzRCZ2FLTStwWGYyeHBOTlI0WTl0?=
 =?utf-8?B?dWpUT3dKK0M2QjNZMWpBd0RJOU9Ja1VJd1JGdHk0ZlVwUERTWER5UTJMcnl0?=
 =?utf-8?B?Y1l1VHROeEFpSXUyak41ZXMvZC9tSnNtTlZva1VtRm9tVHNONU1RTVhoLy9Y?=
 =?utf-8?B?aEhnTTVVL0dRdkZROW0wcSs5MEdpYWtzNDQzQzRudmxHYVdWUVA3aHVlY0Vs?=
 =?utf-8?B?M1hNck1rZTlSdGFvUTVKN01WS0Q1ZWNuc2doTVNLb0V2cFppNUVDRi9lN3Qv?=
 =?utf-8?B?YVNmaFd5K2xHcm5kUVFsRGFSbDA4ZEkrMkQyTEtLbDFiYVduWWtlSU4rWUlB?=
 =?utf-8?B?T29PSEpRNWJLaDVmSjJLVEl5NVlRQmJmL2Q5U2FzaW5mSnBWVUtwbzQ5QmFF?=
 =?utf-8?B?ZUNXV2c1R1Nwb0tib1lTYThOZU5uTW54dldiZXE3TFRxV2JhZ3ZKN01aN25K?=
 =?utf-8?B?ajROZVRmdW1YaXR6UFcwMEp6SmtPc2RlVW95clVTVlhNQnNYNVh1YXFtRVpV?=
 =?utf-8?B?aE5tVDJtQmM1Zi84bHU1ZU9lZ1hnMjAvc0NXOG9IL0huLy9DMlMvZmJyOE1R?=
 =?utf-8?B?cE9MREl6RjVYNjMrSXNSRUJNVG05SENaN0RoZjJyMU8vZ3h6dnNlZXIyajJG?=
 =?utf-8?B?dzdVVC82allrNHR4d2tsZ0NOYzBGRTdyeVFMc0N1ejVjVzRIeHJ0TGdWR3pD?=
 =?utf-8?B?bUZaRHBsUlFpWGNTQVg0eUdCemRIT1pkREdmZTNyaXZVOGdJdkM1YmdHcVBi?=
 =?utf-8?B?ejlweG1iRlBVL2dLbElVT29Kb1RrK1d2S01STnRab29pYllpUUdUS1FianRJ?=
 =?utf-8?B?WTlEUnBTOHAzWWNzWGFTTmNJZ3lnSWNPNmFTaGFhellaUmxzUnZaNFFsckhr?=
 =?utf-8?B?UEZKcFVuTTRPQ2xNUU4zYmFEU0tqYTRROFVDM1FUOWVqU20reG0yNk9zQnRu?=
 =?utf-8?B?S2RyeDZZcldFTzNWY29nbnVtd1V1NzNiUTJJR2xIeHNCQXpsamZTTGdjalBj?=
 =?utf-8?B?NktUTnR1UkFsd2pTYjdqTW5TVkRDa1pUckhONUlWWDhRdlZwUXR2VnQwUm8w?=
 =?utf-8?B?VDVaVXg5VFlTOVZtMTNQSVlBcHlSVGRKNEtwL3lGeWFLU2lFcmIzb25qR2RD?=
 =?utf-8?B?TkpLZ1BaRGo0bHV3Ym1oOHZiYVF3Z1U2WVYvc1E0dFJBcy82dGMzSU1qeitn?=
 =?utf-8?B?RTcrTXI1eWFscVdUbkpQZzQ1UDNGaEF5d3B2ZlBXdGlGdjc4MVZFWGxXQ3ZR?=
 =?utf-8?B?Wk4rMXMvcmthS2cxYlV5Y3g4M0tYVkRvYWpLVFJLelRNZVVEYWpKZEpJdGN1?=
 =?utf-8?B?OXpVZ3lETDFQd3FKT1BYaVlWUndXK2JnaWlaekJ1VEVwWVl4SXJ2TitQaEY1?=
 =?utf-8?B?VzQ1dm1uR210Zm5tZG1OM3k0b01FYmFIcVpVWGlLejhBWmxXa1BPZTZZS2hF?=
 =?utf-8?B?eFErSFBURGNsU3JKZVdjQi9zanRiUGR0VDFRbUxRSnpGU2RZWW5pdFhOZldu?=
 =?utf-8?B?L0tUSDV1dkpSNzVyQi8wcmxpcGlNQ3A5WVBYYzBkMmIyUHJ0cjh2bW5Za0F6?=
 =?utf-8?B?YXc2a1B1Y09ucG1Fc0t2bnlyK1dUZUw0V0huSmFVanhIaHFnd2x0Z3hOYWs1?=
 =?utf-8?B?eWkxendBNklmRlBscysxbXVMbDRiejNzSloxUG02WS83QW1qaHpUZCsxY3V5?=
 =?utf-8?B?bnpIS21tZzZIeHdjdis5MklzZnBlM2N5Qk9nODk5UjU1eXlid29YandNZ2pj?=
 =?utf-8?B?dU5qeG9MNHNQYWY4eWdqUDkyRjVCZGlCN2ZVN2wzbHh1T0dPNzJLdzQ3Smt5?=
 =?utf-8?B?RzdxdlRkU2xCMlY2YUhCdVQwcFUxRE1FRnhvU1VteWFEelNybEsxQ2Fya1RJ?=
 =?utf-8?B?K2FGcjN3eUdPQ3VhMFNtMll1VE1WZ0VkL3dJYkNQNDRvYTVaWlNzV0hVOEll?=
 =?utf-8?B?d0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a2a92d0d-ddf7-4494-85ce-08db9cb46ec8
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2023 10:51:37.1034
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 62Lev6Pc688tbhLWUwamqP4m8VQQQ6xBgUV73iueUbA4fcFtZrbjAkP/Jzw+C2POdGZTCzYMnWMKeDio15T5Wu+sHkxPWgqtDV3f3ZKIC08=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8205
X-OriginatorOrg: intel.com
Message-ID-Hash: BAB4AP7KNXWLXCWLMSPS4AHP4WMKPPOX
X-Message-ID-Hash: BAB4AP7KNXWLXCWLMSPS4AHP4WMKPPOX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BAB4AP7KNXWLXCWLMSPS4AHP4WMKPPOX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 2023-08-11 8:21 PM, Pierre-Louis Bossart wrote:
> On 8/11/23 11:48, Cezary Rojewski wrote:
>> To provide option for selecting different bit-per-sample than just the
>> maximum one, use the new format calculation mechanism.
> 
> Can you remind me what the issue is in selecting the maximum resolution?
> 
> Isn't it a good thing to select the maximum resolution when possible so
> as to provide more headroom and prevent clipping? Usually we try to make
> sure the resolution becomes limited when we reach the analog parts. I am
> not sure I see a compelling reason to reduce the resolution on the host
> side.

Maximum resolution is still the default, nothing changes there. 
Moreover, new subformat options are not added to any driver apart from 
the avs-driver.

The patchset provides _an option_ to change bits-per-sample. Right now 
there's no option to do that so the hardware - here, SDxFMT and PPLCxFMT 
- is not tested. We have enough recommended flows already. Frankly there 
is one for SDxFMT for the APL-based platforms (or BXT-based if one 
prefers that naming) present within snd_hda_intel and DSP drivers alike.

> I am also not sure what this patch actually changes, given that the
> firmware actually converts everything to the full 32-bit resolution.

The issue does not concern firmware, so we leave firmware out of the 
discussion - this is purely about hardware capabilities.

> I must be missing something on the problem statement.
> 
>> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
>> ---
>>   sound/soc/sof/intel/hda-dai-ops.c | 5 +++--
>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/sound/soc/sof/intel/hda-dai-ops.c b/sound/soc/sof/intel/hda-dai-ops.c
>> index f3513796c189..00703999e91b 100644
>> --- a/sound/soc/sof/intel/hda-dai-ops.c
>> +++ b/sound/soc/sof/intel/hda-dai-ops.c
>> @@ -194,14 +194,15 @@ static unsigned int hda_calc_stream_format(struct snd_sof_dev *sdev,
>>   	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
>>   	unsigned int link_bps;
>>   	unsigned int format_val;
>> +	unsigned int bps;
>>   
>>   	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
>>   		link_bps = codec_dai->driver->playback.sig_bits;
>>   	else
>>   		link_bps = codec_dai->driver->capture.sig_bits;
>> +	bps = snd_hdac_stream_format_bps(params_format(params), SNDRV_PCM_SUBFORMAT_STD, link_bps);
> 
> I can't say I fully understand the difference between 'bps' and
> 'link_bps'. The naming is far from self-explanatory just by looking at
> the code.

There's none. I just didn't reuse the 'link_bps' variable. I can reuse 
it if you like.

>> -	format_val = snd_hdac_calc_stream_format(params_rate(params), params_channels(params),
>> -						 params_format(params), link_bps, 0);
>> +	format_val = snd_hdac_stream_format(params_channels(params), bps, params_rate(params));
>>   
>>   	dev_dbg(sdev->dev, "format_val=%#x, rate=%d, ch=%d, format=%d\n", format_val,
>>   		params_rate(params), params_channels(params), params_format(params));
