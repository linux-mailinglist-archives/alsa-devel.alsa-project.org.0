Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B1BE587AC0
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Aug 2022 12:31:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 16E75201;
	Tue,  2 Aug 2022 12:30:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 16E75201
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659436291;
	bh=VFsApFHeVv/jmrxnxFviqCDrdQl2Ab95uPXvCRcDn0A=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OCTSyeNlQ3CTf6kGbx6B+SJPMv/k3ZIfTid2VgDyTP3u4TA/iRlIgDFmtOw0xjipT
	 uxUBTO83LdYvT/UTRDQyRnfg/vZm6R4Q1Xa9t5L68dGRuWbtUULkdyTixWmla7Hvhi
	 8a0T+qZxeVbr1h8a+HNvihxFsr9v5G2QroqVbCAw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8C7D7F804A9;
	Tue,  2 Aug 2022 12:30:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 096FDF8026D; Tue,  2 Aug 2022 12:30:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, NICE_REPLY_A, NO_DNS_FOR_FROM, T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E90EBF800B8
 for <alsa-devel@alsa-project.org>; Tue,  2 Aug 2022 12:30:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E90EBF800B8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="JMvQMul1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659436226; x=1690972226;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VFsApFHeVv/jmrxnxFviqCDrdQl2Ab95uPXvCRcDn0A=;
 b=JMvQMul1c8yUYfsDk4UCE96Si3TglSAoTk1MomnRRHeuDW8vXsSfMFLO
 9xy+tK+q/xJB7mJ4yY2KbD5qeRC/zE52RIJ16W08DNz//Y6UZdL/bUAXL
 mUCu0P180xXSRQMCgE9W4fMCf05k22Z5dvfptKqlY8h/p22J9E4capDqQ
 tU+r6v9ZaNRnzXEENK0yJSt6c6R5Kbjf4LyejeR2cnaK3TkHEPiYhGMUW
 9ipTjhFL9BWM3dhAjTLurtboO8/swG517U5oPq8fVhPZJTjVdDwZFiDO3
 LdcmVK1k3v3MPFlX8BD03Gu390Bi7niDkps14/qoOcbb473e9v7RCfdv+ g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10426"; a="269144285"
X-IronPort-AV: E=Sophos;i="5.93,210,1654585200"; d="scan'208";a="269144285"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2022 03:30:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,210,1654585200"; d="scan'208";a="929921064"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by fmsmga005.fm.intel.com with ESMTP; 02 Aug 2022 03:30:19 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Tue, 2 Aug 2022 03:30:18 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Tue, 2 Aug 2022 03:30:18 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Tue, 2 Aug 2022 03:30:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oEJCCWvOcaKEEnVtPpIu8fNVCylUMAKOVX3rxZZ8VuMIZT6VTayoClm+9RVmJnIMzsq1bYxXzkljqaaITmi3lOsqpHLnnyh+bLR8cpgT1OtgPbVqTAgMV1NQEnxBx8skcDpDa9YiKCbX/rDEcrPxfG4nNpXeOceh0cKaQUvn8zuPmrzaPzmoVEAbxI7lDYlnDni5sVkVRcTKnLjqDv2qZ5fytwKnSjxnOupSxJYMKvAL3YdPbW81BEW7uzx3p5Vb927Zl8s1r0jfTl6RNi08SbuG11RVm8JX7Rg8MQ1u49BUSWQRX/tNwFdbEWnEnJrZxOO502j8NaqSg+c31y5m2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cJw5d02aRqlfKugE7MozHx1dAAuZZPs2KfuwNW44XFQ=;
 b=m/Fhs+QC3gnb1w7SH6hSLXR1no4R8NORuErUTE3lfir6D6RQmLKBgvr9rafF7JAvP8V5i333lH/Tsu5E4+ElZmQHVKIe/S5OpwXJduLPaf1108cYiMQaZcKjuoaGwUzsvixtezGFhwfPPyn6Pv+MpHjPp/4O70joc73RvlO/NYwVrB703jE4JNex4FzYf8UdIRosQE/GGmq1V5GHXCYx799YcQUr0cFETIdeqInmw0VLL8/q+uEM8AUqgdRR5YxSV7wikUmo9SkHBqp7w6dRzMXSYuISg+9EJwI4I5hHAlcwUNyxqDzpVT4Q/Ibhkj90zqk5QHk7vfrW5weqlHyZZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 MN2PR11MB3869.namprd11.prod.outlook.com (2603:10b6:208:138::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.15; Tue, 2 Aug
 2022 10:30:16 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::852b:5f7:46eb:fca6]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::852b:5f7:46eb:fca6%6]) with mapi id 15.20.5458.025; Tue, 2 Aug 2022
 10:30:16 +0000
Message-ID: <4208aece-0aea-ba86-9a00-9e217546e1dd@intel.com>
Date: Tue, 2 Aug 2022 12:30:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH 2/2] ASoC: Intel: Skylake: try to get NHLT blob with PCM
 params as fallback
Content-Language: en-US
To: Icenowy Zheng <uwu@icenowy.me>
References: <20220725111002.143765-1-uwu@icenowy.me>
 <20220725111002.143765-2-uwu@icenowy.me>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20220725111002.143765-2-uwu@icenowy.me>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0102.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::18) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ea84ca6a-f077-4de2-275f-08da7471fdea
X-MS-TrafficTypeDiagnostic: MN2PR11MB3869:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hRNAXGCJHhNz0t/WWmCsJr2kitNFuDq+noPqJGYfmYCEugOHyq9pAVWfrEagF+0i3Twb2rVikLryoV6XcgGT7MKmsaNFN1wNAJUg02jDCcvjdwY+2R0KFSh6eanfVvvNATARPaoczti9IEI/dSDmkVat0HptC3KNtPSTopdA+n9ioEEfX+uxgWJtgrQsqVDwzDQDgT8LjkUiBqetKt2VdKefFdCw6VRXT9NALh5PxayPtadiZaOoMgM4EDGpN2foVCatDEjGS0kjyK41I4V19ZFWGp0VusdR4verFZyqAhY+3R9BojcXU/O03hVB0TU2dVF9yGoZK7RSAGAaL7GVK58rKd2cAcF+600pHhvj+pbQwlyoH79BYqw0dAjcErA+2m8FdQ+Ly4XMp4nzi4rmDF4mV2OE2xqO3SS+W8kMqEtCWSdaKeu8pYOS2H8LDVDff5Tc85YIpBRDDfVDNqJWA5qSPLh79Hhw8W39yGLoutbbUiccUuvWUMyOsg2eNRps1H4Zw2UQm6G1HL3iirLbGsZku+VG5w46WVl56XYUbj6o7nybXh+HNATT/1gnmxRRxc+Kkd1ZwFLoJHyEphxMzxNjk0l03fq/bvU1P6NFWvS7nnkfLmCXq/VzERJ5Gkf5jf2cY49SZP/ddTKzKjUvif8LES/ne2clXHvltINakLvO2pNpFH5W8mpdlmn4803Z+HmYotgS0ta21Zb1/XRUwzKdpNu4C3qYjK9zB9fOosVIoc3bg+zdClkE02/T5Yzsv1g1cTuIoz2yTfLnocS0XnkU4vVbX4KwEjQw5QTi0eZce75VtQDt4ErQ73N6IcSSrolbdM7qAv84lIqaCVA8tQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6375.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(396003)(346002)(136003)(376002)(39860400002)(366004)(41300700001)(31686004)(5660300002)(2906002)(36756003)(7416002)(82960400001)(6666004)(478600001)(6486002)(53546011)(2616005)(6506007)(54906003)(8936002)(38100700002)(44832011)(6916009)(186003)(316002)(4326008)(66476007)(66556008)(8676002)(66946007)(6512007)(31696002)(26005)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NWFCRFhyK1lXSzcvTEZETHVVamZNa2Z3U0lUR3A0c2ZFdTd6ZkpPTGpnM25C?=
 =?utf-8?B?bUFwMzlrd0syM2hoNi9VR2E3MkFKdHJsTWlpeHA2QUwxYzhRc1VJa010ZGZU?=
 =?utf-8?B?N043aTh1RzR5d1dwS01mSUExU21qVnRhRURRaVBwb2JHNkZYTzFiQWVHOGFq?=
 =?utf-8?B?ZkZvWkdBR0tNWlVISEYyUVFqUWxjTnNSNFpYN1AwdEIvVXhYT2Vtako5elBZ?=
 =?utf-8?B?U1VNNVhGQ3drS0EwRGxMZ2RUTEVzalpVQk5BZFBBc3NSU2hsRFpoODAxaCtK?=
 =?utf-8?B?bmNRZmd3SXBOVGV1dWNRZlFnRFNPYnRQTnVyK2xSbmFUV1Y0WDFReHlEUUhn?=
 =?utf-8?B?c0FTMnJVcDExZDJ3V0dPdWFNNm5aaUFERE9TTjNTK295MitNbHpaQkNHSlo5?=
 =?utf-8?B?ZXdtYStIMXk0eXV0UUJadmZVdzc5ckcza1V4NHNHcHdFZXF0a2tUODcybnJy?=
 =?utf-8?B?YzdJdkE1b0RXVnFZVHBtT1RFbm5EenZHWm9Tc2c3MVJpVHBHRmFPUTI4OHk4?=
 =?utf-8?B?QWNDNmNnTXN4cUR0T1hadWVNNzBRc2dUZG1MSENXa3ZXQ1ljZnFaZUR4THd4?=
 =?utf-8?B?eVU0eHJwYitBZ25Iai9ZV3NPNDI4dDB0d2N4UWdXZEM0d2o3R3ZKSmJ5OXZz?=
 =?utf-8?B?cTcvdVQ3cC9LRjMrblYrNkw4bWp1QUtGaTRCYlNtQkV1RXNZU1FNVVhwbUx0?=
 =?utf-8?B?a1B1RlhQb1pGS3ozWGRhelFueDd0VGpXMWl5a0g3Wk5KT1lFSHlycWNHbCty?=
 =?utf-8?B?LzRQTXBlMDdwbzFMOE8vbm9scEUxOEFmaEljeXhidzRIL1h1RUg0bUtaTFdz?=
 =?utf-8?B?NStkU2dkR0t0bEJCUHhPdjJxMk5vcTZZRHFpUENXbXhkQ0tBQnpxb0pwOGpt?=
 =?utf-8?B?WEtkRXdTaVZiZ0FqemRhT1NVVEg5QUY1ODdiZVQvbllCenJKcWRJWFZNZ2Fu?=
 =?utf-8?B?M04yeWV6RytERDgvQ01qZlNleFBUZUlnZG81eDJjVXM5TVZLWHZaRFFSaWYr?=
 =?utf-8?B?QkdRb1dFQ0c4RmVMWTROTFNBZDhiM3hnVWd5WWlGZjVGM200SmFNdUcrRG1j?=
 =?utf-8?B?YjQ3SkRsSzB4cVB1aE1OQTAxcms3TExaaGdUTXdCNTJpTnZlclVpM2J0aVZt?=
 =?utf-8?B?dVlyMnNjSUxWMmpEU3hFYjhNMlhYSExCZnlYT0k4amhnL1QrK0ptaWxRamlM?=
 =?utf-8?B?ZS9FMmsvR1R3NjdtY3AweDNOeERtaEo5aHJtMHBjN0FpTnIyT1Rtb2tPRVJK?=
 =?utf-8?B?T3ovWnR3MUxqRHlFS0NtcTNXWERZWmcycEFTcTlzb3VaYUJsOXFxc1graDAr?=
 =?utf-8?B?SzJ0R2VnMDcvUEpBTjVWakVzanpJazk5VGZzc0I3YWVrWi9jbE9zTzVtQ3k4?=
 =?utf-8?B?dTdUbkR2NzlHODJOYjJzK1pRcHhuVjVRd3R3Ty9hcDZ5RnczZzhkdktUUFVv?=
 =?utf-8?B?cS82Q3ZjOGk4aXdXSllTSEhYRzN0TG5hMklMTUhvODhYQmJhK0tmZ1gvemVw?=
 =?utf-8?B?YmlwSUlGTCsxRk9uMzBVOGE0ZkNwcG5yRFhZdERZdStJUHNIQ0lzYkFXR3N4?=
 =?utf-8?B?R0pJS0NCVS9pcW5peTNpMVRhSVllOGQvNnVSSG15Q0NVQk9yY3RnNmxKbm1v?=
 =?utf-8?B?SzNnNTBPZWRTbGN0TGJ0Y0ZkQ0xIWE5ZNFhjMlBNRWN6eDZlQ29KVHBOeHBn?=
 =?utf-8?B?SDB2R3VyYVVnN0V4cUFRbWpYNmR6UC9JSXBXdURjRUkzYjFGQzVtalp3YUdr?=
 =?utf-8?B?NjRaSFNzYndGd3NDZllnMlFOV3htcDdxeURBcnlINURCcHlxdEdsS0dQa3h2?=
 =?utf-8?B?VzF6OXZ6ZGJ4ZTBMQU83ZXZTdi9NNlVDVE1Ca1VSamx3anpnR3NYWU5vRzRM?=
 =?utf-8?B?V3d4VG1udjRzd09SK0I4N0trQW81bGJJZ2JlN2FyOWhIN1huV1VFQ2J0dTYr?=
 =?utf-8?B?OFpHZy9jajVpYldYeGJ1WVpHbGlKTVJIYmZiQjQ4T2Q2NjdEWW9aS1dCTWl0?=
 =?utf-8?B?K1hvNG1SY0x0elk1Zkp5anMwMHE0azlBQmk3YktmM1JLcWVoL3R1ek03bUxJ?=
 =?utf-8?B?eWhpR0J1WVhIT0gzSzJ5SXdCMnRPTDNsbTNJTTdwd2dMZmtoQ1AzMXpmdDgx?=
 =?utf-8?B?SFB1eGpvVEg2cTdtMnNBa3BNMTl1cGdIR2FlNVJ2V1BTSWVvb2wyOGd4QXRT?=
 =?utf-8?B?MHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ea84ca6a-f077-4de2-275f-08da7471fdea
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2022 10:30:16.8328 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B3Fu8xNGR39Bix7SOHJWx1SndbXdUy/KK2zDtmGFnUfGgQAK7CO2ByacF4LSfmKPOHK1dhTGwpd081L0NA/BuZpJuGufOwacITdJLOekTBA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3869
X-OriginatorOrg: intel.com
Cc: alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

On 2022-07-25 1:10 PM, Icenowy Zheng wrote:
> Switching to use pipeline parameters to get NHLT blob breaks audio on
> HP Chromebook 13 G1 (at least with MrChromeBox firmware).
> 
> Fix this by retrying to get NHLT blob with PCM parameters (which is the
> old behavior) if pipeline parameters fail.
> 
> Fixes: 87b265260046 ("ASoC: Intel: Skylake: Select proper format for NHLT blob")
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>

Hello,


Could you share the NHLT file from your platform plus the format used by 
the cras/userspace tool? Did you try playing over simple aplay tool instead?


>   sound/soc/intel/skylake/skl-topology.c | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/sound/soc/intel/skylake/skl-topology.c b/sound/soc/intel/skylake/skl-topology.c
> index 19994ec8bba1..3d5a3ee1c82c 100644
> --- a/sound/soc/intel/skylake/skl-topology.c
> +++ b/sound/soc/intel/skylake/skl-topology.c
> @@ -1858,6 +1858,15 @@ static int skl_tplg_be_fill_pipe_params(struct snd_soc_dai *dai,
>   					pipe_fmt->bps, params->s_cont,
>   					pipe_fmt->channels, pipe_fmt->freq,
>   					pipe->direction, dev_type);
> +	if (!cfg) {
> +		/* Retry with PCM parameters, as the old behavior */

Drop the "old behavior" - most of the readers are not aware of what that 
actually means.

> +		cfg = intel_nhlt_get_endpoint_blob(dai->dev, skl->nhlt,
> +						mconfig->vbus_id, link_type,
> +						params->s_fmt, params->s_cont,
> +						params->ch, params->s_freq,
> +						params->stream, dev_type);
> +	}
> +
>   	if (cfg) {
>   		mconfig->formats_config[SKL_PARAM_INIT].caps_size = cfg->size;
>   		mconfig->formats_config[SKL_PARAM_INIT].caps = (u32 *)&cfg->caps;
> @@ -1866,6 +1875,8 @@ static int skl_tplg_be_fill_pipe_params(struct snd_soc_dai *dai,
>   			mconfig->vbus_id, link_type, params->stream,
>   			pipe_fmt->channels, pipe_fmt->freq,
>   			pipe_fmt->bps);
> +		dev_err(dai->dev, "PCM: ch %d, freq %d, fmt %d\n",
> +			params->ch, params->s_freq, params->s_fmt);
>   		return -EINVAL;
>   	}
>   
