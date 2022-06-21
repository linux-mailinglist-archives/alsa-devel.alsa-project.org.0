Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 65BAA55392A
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Jun 2022 19:48:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BEAFE2040;
	Tue, 21 Jun 2022 19:48:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BEAFE2040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655833731;
	bh=pgTM+XypuEULEUw1fjkc0XWZk/naHeIgqAluWMXnZoY=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HB1JREtVEvPqSe5uOWe+WV0qqLpn7MnRfMMR7d2Xpw8s3G7DKrjY2WMErLF4dMA0a
	 HP9T2KMUjFN2v4Uz7hT4Ybb0XVwu+nwW8W4XREktGCwaMja9ntsm/drakkfE9k3ubT
	 vWZvg5M/cNUO/wNFMghPplbm0XpHfO/1vMhpXYDA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 34D07F80253;
	Tue, 21 Jun 2022 19:47:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 127FAF80155; Tue, 21 Jun 2022 19:47:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DAC87F80104
 for <alsa-devel@alsa-project.org>; Tue, 21 Jun 2022 19:47:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DAC87F80104
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Zpl9fKGe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655833669; x=1687369669;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pgTM+XypuEULEUw1fjkc0XWZk/naHeIgqAluWMXnZoY=;
 b=Zpl9fKGeGvSoJfhlWBu0XtKKDL0ZI4vAuxj3PpcSv4xVR2eQHccEN7Dd
 fAFR2SX1MsEvJQ4faHUNDgnNgd5NOH87YO0UXBt0vH2GEN/Xsx4AQ6Fk4
 Ue/rnijFRLSaYwAEpMB8MmJdssj+NdX0YKFmOLSLqJSm5uzkaXO/SX6pF
 AV7VIxWJG4HaByzN29gzZZBQCKGgYB7rT7X1GXr1cphH7ai+KACKppm+w
 IFXOIWo6wJgGzaaczkC/iFoVMwAUwwkUc5nlzzaFYt5s1/wgQsUagKXv8
 KlWzGwW7mwWmjFvl0oWxYcbU0oD6tx9vy78DBCZTkI1lf9lYLX/o81zQK A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10385"; a="263226919"
X-IronPort-AV: E=Sophos;i="5.92,210,1650956400"; d="scan'208";a="263226919"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2022 10:47:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,210,1650956400"; d="scan'208";a="620576838"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by orsmga001.jf.intel.com with ESMTP; 21 Jun 2022 10:47:40 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 21 Jun 2022 10:47:40 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Tue, 21 Jun 2022 10:47:40 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.108)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Tue, 21 Jun 2022 10:47:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jdw3qaQYrHyMUVN3awZ8rm9bbwGQyFJcljT5yWMWgcy8O2t79D8989Hrzt5/m7fzZPcgtEzl2izECCzxwhT7nC/fuepk/a0uLxexZuPzvx176N5wsD7gKU3fduvEfx7HOO3aQe1hj/fDJJmI+1LzZ/SRuBqS2JLrRXeb3eO/4mmQv4B4WxugKxAUEG/0p7nb1DH8FPDKl1Um6lIL0tgnthWOZ+1/guljgMsnKwWWS7lhx3+0L4jQMnWz9MBbNGAyn9PqnbBl6Ei0VYBsOUV+GSjPaH7ATNEOWY2HnJBQEDOpTOAQWhsqZTXe5MfadP5C6S5ToHdEStAxJi58+/qWiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TaVxGFE3VtOBGGuM5iVpj7ZBCWMY40EeJbUDvZBRbtc=;
 b=kBB9jnViLyJqS5HkYKUsrwTDf5Bw4ttnwQMdgr4qvorZstIBk717EWkf4tkqqQ6p+AWONhmmHooRRKt4354fObOnRwz69L3l3ZwJc/ALXKIceZHTwVXPLsjtExd127TqZaPvnkgQjtJnQq2j8uGdJyiokqL/+xS5rC5aTCk1irsLmKQP/nvl2+TvhDqLVp9M66wldejSYqnzHy9milPlvTMqM7sw3ikjAJeMDpW8HtToB5cacGpcmWIliOvLS0q0HiipejLzazZF/Dz4IWB4LFi7ialXk1cZVZYTWt/43J3OMxspiwO+1mdqa9MS2wclGcbpXDpVPEj+iV/9p8evyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 BL0PR11MB3300.namprd11.prod.outlook.com (2603:10b6:208:2e::27) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5353.20; Tue, 21 Jun 2022 17:47:38 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::a879:23a2:1836:2691]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::a879:23a2:1836:2691%6]) with mapi id 15.20.5353.016; Tue, 21 Jun 2022
 17:47:38 +0000
Message-ID: <2ed532a4-a232-eb14-7122-e5b08cb79bb3@intel.com>
Date: Tue, 21 Jun 2022 19:47:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.10.0
Subject: Re: [PATCH v4 00/17] ASoC: Intel: haswell and broadwell boards update
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 <alsa-devel@alsa-project.org>, <broonie@kernel.org>
References: <20220620101402.2684366-1-cezary.rojewski@intel.com>
 <95a7a219-8330-628f-aa10-28a078217de7@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <95a7a219-8330-628f-aa10-28a078217de7@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P192CA0091.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:8d::32) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 61b5db1a-e77e-4d95-d625-08da53ae21c1
X-MS-TrafficTypeDiagnostic: BL0PR11MB3300:EE_
X-Microsoft-Antispam-PRVS: <BL0PR11MB33003F75DE59160626C6AC81E3B39@BL0PR11MB3300.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AeFeyu8rqZYqbV2hhKadogJwab3LNSECNi8qP9aC++mXqOGNsNfHDe9O9R/Dx/tf3C9Pt4kv0knEjJcc0xCHp7buTLQid+y4z1kZHxxKC711ZMWAAQnAS3Y6vT1SNvSctLFLKRiWGazueZszQ5q4P0rIo9JYY1rET7EZdwCDTj4drNg2IT2Lk217rAxRzsKyV6htImChQLexTyRpR1za3E6oBWXADqYkc31SaRP9cp2uOxZcv59M3REINk/P94gd73TUCp63kX4CrUGwHT2s/pr9/JKGlx13DPSPvV8CTiNZiixj7rVKo+wXzRNaCcHj0FW1+elBeSOlHgc54iR2gW1HL/Vw3LV0xLsk4l47vVXii6wvy0Wgsn+KXQHKh2yV9Pqzo2Wtxo7RfvvRlaWQdgodoRU0oV65QC/7Dybnn3NeO95JFS0p45NY/AlAxxtXCg4UmI7RJ/fSAXrddJy7O4ypXTHX2si84HRbQwiImIPi8SGcfx60AjKRBHCSnu6bIKopqlwrIHfN88JXtpinOhicCQeDiH6SCWDvVD9b7d+DnG+FTBcleEReIvW8vSYyGLMi0U9yiwnTyKXznZJwrihjxQUwCZZScI1144f0D2w6/Ml5LXwRKYVnBlHeA/1vTtE11JRbuat0SqI9DbhElnNEE4pFDIBGQ7vYahJUJgbLzEiIcaBAPfyImxO1pPrvSkBwLo7R5kJVsXnr/LNeAV4f0PyphaRTXXkyP423SjcEAArgHYvBTkdSIyP3U6/OVo4JbTdTEtJz9BjVpXSFEo4f8FblJMdigS4on5Ek9yj2l1JdpD4z6gzJyROApPrUoV++vcyu9X9LwwHmtSTaPPAQvIaOAJcCdDB4rUJngm0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6375.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(396003)(136003)(366004)(39860400002)(346002)(376002)(316002)(82960400001)(966005)(4326008)(31696002)(86362001)(8676002)(66556008)(66476007)(66946007)(6512007)(26005)(41300700001)(2616005)(6486002)(44832011)(478600001)(53546011)(6506007)(15650500001)(8936002)(6666004)(2906002)(38100700002)(186003)(83380400001)(5660300002)(36756003)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TGU4cHZ6Wjc3b1BXU1lrSUxTckxKc3JKQmMzNWFSWVZXYTZCQlMxL0tDTVhK?=
 =?utf-8?B?M1JxMkxiRWNsSmNKZkdrQk5ndEFlZkhrZkxqRU05c3I3RDdLZmtnVS9paEFh?=
 =?utf-8?B?R3BzNmsyQlRRU2EvOG5OdEM3N3dFck1QTkhMY01HZWlDeWtkRWNBaVhSN09y?=
 =?utf-8?B?OEF0MlJzWEdKK1U3SVFweHNBLzNZVENRNVJyL2VvK0ZmanBodjRLTG42azgr?=
 =?utf-8?B?WklUbDFtYlNqYUtkZFJyQmtEeXVWTTdzSzVNYUhGMEFMUFM0R09wOUJXN2M4?=
 =?utf-8?B?andYVlJWU1MrS3d0cWtnVTlpcGtoTnJLYUh5a0RhVm5vVFpVcE10VUMxbW8y?=
 =?utf-8?B?Nkk2c1c2c3B0cDNyLzlzdTRhamFNWHlyaytHZ3VKRSt5L1hXcm5WLzNCcWdo?=
 =?utf-8?B?R0trUlVCTmtRZHVVNUFHQzZ1UGJuVlBKQzhvQUp6SFNYOE14QmZldndTWVZD?=
 =?utf-8?B?ZkVwTVZzbGV6UGdPcVNsZVY0VHc0Y1Vrd0R3dXFHTTRZRkFHVmZWUlowTHBl?=
 =?utf-8?B?THhkMGVuTTFqclp2T2pFNGxQRmVPK1Z5OEJobU4rQmFxWWRVRHBaejNTUGNL?=
 =?utf-8?B?TkpQODdlVnJxQlVWYVdKRk1ybGV1Q0dYT05NdHVhb1B3OGdHQW1TNm9od3kv?=
 =?utf-8?B?WWdpRHhVbnFueHVGa1lwNW5NN09yOE9qbi9EMnJ4WE1hZlM5ajg2VzdFV3NY?=
 =?utf-8?B?VkJaQVNDS2pUUmZVT0RyVkI2WmNDTWhiOC9ibHV3VEJweDB4TVl0RUwxcnBr?=
 =?utf-8?B?ano0azZJcWtyQWs2b0Q5U0tWdFFqbGtQK3cyZGJXeXRSK2dDRis1elZuU25y?=
 =?utf-8?B?emhTQ3ZBSXgvazlndXZHYlB1QzNveUtNNkxpQ29ocU4vcDB3dVlPOEpRQVlQ?=
 =?utf-8?B?MS9HcS9FeFdKUEVSWUFEMXpGS3NRWm9XNkZtRTlYSmNGcUZZUTVUYTQraFlz?=
 =?utf-8?B?VHJxaTlheVh5VkZhQWNIY0lTcXpFbm9oSllvYjRwTTNHL0F2QVRRdDlnclhm?=
 =?utf-8?B?cThORWllbHV1bzlLNjY5K2VTTnQ4K1dFckFQZnRTUDg0VXZBQXY2cXJWb2xK?=
 =?utf-8?B?MjA4RGFRSGV5SSt2dGhLU01YMGZEUldjano3WTBXZGV3MEI4ZHhHV2h0b29a?=
 =?utf-8?B?UmhlKythR2taVThlSklYUUNTWDNQd1I1b00zQmg4WU1ySW1vL0ZGbUhBajF6?=
 =?utf-8?B?M21EbHR5dmZLY0w3R3ZhNGFRQnh0UTFmNkhlVS9nZW5odFcvSEFQRU9KL1dY?=
 =?utf-8?B?eVZoQzFMUUd5VGRxQXZGZ1czUnFGRnVZNmxLT2xEWEJlWW05NTNBekhHLy8y?=
 =?utf-8?B?SHdudTBMcitGbVUxdTQ3Z0dlanp0SzVCZitBL0FiUENZSTI2WnBocXIra3Vx?=
 =?utf-8?B?dlBUaHdncVNMajEreWpVODBKMjROMEpMM29Kdm1KQ2FwTS82eGpyTm9YS252?=
 =?utf-8?B?WE82YXlNVng3UE51MnhVMzFnVUxsUzY3OXQvaGhwQmozbHdVd2dQSkMyZ0d0?=
 =?utf-8?B?bzJRUnBMVHRqTWhyb0pod1N2QUM0aW5vNEU4ZEpRRlRrd3RYRVZkYmsrcTVF?=
 =?utf-8?B?WmZ0aURaTW44Mm5CMEFPOVBpVzA4SzgzY2xKT2JTRitINFk1M1F2V1ppTDZI?=
 =?utf-8?B?MUxyZGJXR1RTSzl5NE5HdnJyZnoxcmw5YjJ3RXBhQWJUVGxMeDVkNUZISjVi?=
 =?utf-8?B?K21WQ3JTOEduVm9UQlFFRC9mWVpwUTZLVlR6WFo5TEE3UWliQzJ2ZEVwZkRG?=
 =?utf-8?B?U1h6VEhaZTRwczlUTWxMdDRwZkpGWGx6MEV1cEY3bXVuRkpQK3AvUUJFeWZt?=
 =?utf-8?B?SkhCUzlwcXA1ZTB0dk1zZi81dUcyYURGdFBPRjhUTzJJRER0MWgrVjhQcFIx?=
 =?utf-8?B?NlpvcjNYWERoUjYwL2xxWFI3d0Y3dWt6N2tUbEtHNEpwRFBZRnh2TTI5aG9H?=
 =?utf-8?B?ZjJkc3NGMVBWeTVxWVRkZWg4ck9hUmRzbjVjbnR6OGdGTnZPZ0tST2VNUlZT?=
 =?utf-8?B?aTJOU3MwNC9LVGVaMG53VE9UVUVuQ3B4bG1OUUl4b0ZHRDhMaDFUdi81N1JD?=
 =?utf-8?B?dEVpQkR3UkxVVmJ4M3kydi8vMFVNSDVhL3BJVGdZN21vVjJjYXFVa01YaXdL?=
 =?utf-8?B?ZytDbk8wM20vQkJObE9zK0VhRGQ0Vmx4ejlMbW9aRjZJMXhmeC9NdGRPVlRE?=
 =?utf-8?B?Q3dJcWg0bmIrVDZMWDJPSmErc21PbGFRQTZCN0J0Y3I2WG1tTnZUNTZFV0JI?=
 =?utf-8?B?OU1ERjc0ZDlpaEVNeHFNejRzTk5ydWRTMDBJdzFnUUxaTFpmeTNHOVdhWlJQ?=
 =?utf-8?B?R2xmNkdQZU5vQmNvOW96VHZYcDB1dlk2K3E5U2xuT2tuSWJQSTdnbDV6aHRt?=
 =?utf-8?Q?DE55VPCq/I9P32bw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 61b5db1a-e77e-4d95-d625-08da53ae21c1
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2022 17:47:38.4158 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q88SoCVhdx6B4BGVSLAQMvUFDSs1FHmu7e58+nJ6kszDUrmCkFK0Gb2i+ALdygstltmq0al1pph4FvRp8HZwn4fOBWDNgVjl4dfnyamKTg8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR11MB3300
X-OriginatorOrg: intel.com
Cc: hdegoede@redhat.com, tiwai@suse.com, amadeuszx.slawinski@linux.intel.com
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

On 2022-06-21 6:36 PM, Pierre-Louis Bossart wrote:
> On 6/20/22 05:13, Cezary Rojewski wrote:
>> A number of patches improving overall quality and readability of
>> haswell.c and broadwell.c source files found in sound/soc/intel/boards.
>> Both files are first renamed and only then actual changes are being
>> incrementally added. The respective names are: hsw_rt5640 and bdw_rt286
>> to match the pattern found in more recent boards.
>>
>> Most patches bring no functional change - the more impactful patches at
>> are placed the end:
>>
>> Refactor of suspend/resume flow for the bdw_rt286 board by dropping
>> dev->remove() in favour of card->remove() and adjust jack handling to
>> reduce code size slightly by implementing card_set_jack().
>>
>> The last patch is removing of FE DAI ops. Given the existence of
>> platform FE DAI capabilities (either static declaration or through
>> topology file), this code is redundant.
> 
> Possibly a mistake in our tests, but this error seems to be introduced:
> 
> [  107.397637] kernel: rt286 i2c-INT343A:00: ASoC: DAPM unknown pin LDO1
> 
> I'll have to re-run the tests, sharing this information as is.


Hello,

Thanks for the report! However, this has been reported earlier during 
the v2 review [1]. This is also why a fix have been provided [2] earlier 
today. Notice that shape of link->exit() found here is shared by other 
Intel boards e.g.: SOF ones. In general, the initial discussion 
regarding card->remove() revealed some 'probe vs remove' problems within 
the framework.


[1]: 
https://lore.kernel.org/alsa-devel/69e4263a-e036-cb21-2360-55b06600911e@intel.com/
[2]: 
https://lore.kernel.org/alsa-devel/1cff4ac0-6d45-95e1-ed9f-6abaded3f8b7@intel.com/T/#t


Regards,
Czarek
