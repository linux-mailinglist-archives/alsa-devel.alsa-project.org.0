Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B104C70E0
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Feb 2022 16:40:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9084817C5;
	Mon, 28 Feb 2022 16:40:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9084817C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646062852;
	bh=W3NDqzPPHfSsv07yOxt+M4DCKkPA0/InZdwfeA31IFs=;
	h=Date:Subject:From:To:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GrWMIp4kZKkfZ+4HRwDEU9siCy+5dTAPwzqvPEd0+wIIEuFzHT3SF8aflXLwS8dyc
	 Qr7z7mWpBj+JrB7c7ABzw53imkzve+ucVXqki7mLegRiEqj/iTTlhkH1RewSXOGg9A
	 fIXWqh9eMsSth2sARnrdDi2765fDMff+aQbrl6Yo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EA867F8015B;
	Mon, 28 Feb 2022 16:39:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9B8A7F80054; Mon, 28 Feb 2022 16:39:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CB063F80128
 for <alsa-devel@alsa-project.org>; Mon, 28 Feb 2022 16:39:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CB063F80128
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="JL2FCFJ2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646062783; x=1677598783;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=W3NDqzPPHfSsv07yOxt+M4DCKkPA0/InZdwfeA31IFs=;
 b=JL2FCFJ2LxxT86fWscCQGRidKQyXvDbxI93yLv036WnYonM1Vo898gkW
 5IEsWvOBJZkaZSaJGe64+NPba7YMGRIRf54n6cPUhdFAt93VLmqbue0vl
 iZW/baNUiDblwb3/dVotmsp/q/dyoXFKQd+LIbwIpAR5l5nDlcuKrLigr
 +Zlt2hM/7R2SZ2kuY4wGu6g2zobwFJ5cBz8hJFCjE+v5loYJwN6+fmoM/
 7C5nIHGhj55Et1trFFLzSgqlsZgaTBgxWtZWfqJG/Y/6xyLDMautc+tVL
 AzpIbokDzgNOJMprarr+UMHZrqWweWOFTM8Jhg9Aes7s1hGmlRjLhQUa+ g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10272"; a="250492676"
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400"; d="scan'208";a="250492676"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 07:39:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400"; d="scan'208";a="593257394"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga008.fm.intel.com with ESMTP; 28 Feb 2022 07:39:24 -0800
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Mon, 28 Feb 2022 07:39:24 -0800
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Mon, 28 Feb 2022 07:39:23 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Mon, 28 Feb 2022 07:39:23 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.109)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Mon, 28 Feb 2022 07:39:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mR9vt0EFyKehvCAVgqjVpX1XxgUfO+6GbK57JpcJxliRg2/24PmIx+42rd9Lu43jHDh5Vlm//CLblJybk4EhZ7HLHpGZ0gNO75YQUy1EtMpPN823LHbBxbl8HgxEh1idOQUmSYQQf7yFvYSka4Mq8KHHN44R18OG5W1TSzNBA3zwRjFlqWxoN9HRFtBq+QXHWjbXuuMUbxaMF1tfin2rnxZfex2oHmDcZDNTu5tBD6c5NykyFz2c64goDwgDoKTL2JF2X9/u30A571KsgmS3E3qvV30WBegzLSqHh7rKw60nEeZ2K1xH1IAXCUjX29P4HycbAsDt/qeq4d4BcvLnRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gLJILTt4CjpeGpIM3Cb4IyXzwbU0rRU13Dn4cs2D/50=;
 b=gOkPRnRl/Z5BStPEzuvZ35TNkIp+LOJPYOkWv1b7HTaxvCky7RWiKw9UKpt0cHmwab7JsgpRGgR4qQzp34liaL2HCrw4x2p40RVpr44CWVe+G2t6RtpqWTC37Mjbgd4uzSNkk9owu8ILh+gK9GG6sg/LaLJaKe91odFi98uiU1gYu4SqtCAXdn5UhQ1Dm96axeeK6523qVA1XNtoxmQx2inQec3q1CecNTDxftmPJEGEFS0j1tl9aZcc3DNZdeEMe3YAcccCLC2Dnxc0sagWdezAICPUvoEOtTNQtZUgfVgKRuZ1S2Ri8arPZH9DbTZEZEPb0ey+Ihs2E9wS9DpAZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10) by SJ0PR11MB4927.namprd11.prod.outlook.com
 (2603:10b6:a03:2d6::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Mon, 28 Feb
 2022 15:39:20 +0000
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6]) by MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6%5]) with mapi id 15.20.5017.027; Mon, 28 Feb 2022
 15:39:20 +0000
Message-ID: <7394e77c-7ccd-c339-1138-96915e6e2f9f@intel.com>
Date: Mon, 28 Feb 2022 16:39:12 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.0
Subject: Re: [PATCH 04/17] ASoC: Intel: avs: Inter process communication
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 <alsa-devel@alsa-project.org>
References: <20220207122108.3780926-1-cezary.rojewski@intel.com>
 <20220207122108.3780926-5-cezary.rojewski@intel.com>
 <c2f249df-0b3e-1032-6514-81fabb544b6f@linux.intel.com>
 <1a8c9196-0ae2-c25b-32de-15821c948185@intel.com>
 <d41c3acf-09e4-3822-7b13-211d4f71d22e@linux.intel.com>
 <211f1273-6f40-6e9c-452b-788fdc526f41@intel.com>
In-Reply-To: <211f1273-6f40-6e9c-452b-788fdc526f41@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DB6P191CA0022.EURP191.PROD.OUTLOOK.COM (2603:10a6:6:28::32)
 To MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7c1c0ed5-e953-4f13-c872-08d9fad07c95
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4927:EE_
X-Microsoft-Antispam-PRVS: <SJ0PR11MB492767B1AF4109833E9E003BE3019@SJ0PR11MB4927.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pwo1swe1PaZxll3IwTHAKSKyTVldAJCNB0z0KYmZ3iSmpFYhDRYgqjTy2+TpNeTgqvNuNRymr82wdL1FIgp9lXr6yq7pbwuiJOcqDYBJg2KSqVcrYYyl3F89jXRa1Cc8HTYwZxI6EVmD1cuQdKYHkMZTn3iDFx1sGpILUanSPPleGsIBhEd3VFbNpjN/xlxE5xgBvjO2gGr+8TYXtCk7ARI/zNO60AHiaoGxyFIW2bMS30qS5sqcTxmTndCqJihLfTv0avYx4wunUQfE91yumLkD1MQJs7/AsjXDTjR+hEyLtclfa407Ag9wIZ2gd+gblL7uKzC4gGCFz4VjmvB1fuKxoS+FWAFtkNjzO1SFAmItta9r4fYUdpPRQpkTVaQo3aWezym1ZNcs2RkcHZxzBMncmJgGm1zruE9Ft1juiS/SJF96IH8XN0Gin5KHIW/ScKhsgqsoTu3CuOFU7de0hbnA9aYyiS6H7oE3P3EtmnFRgJFZDk8IWL2dVJVGTjkMExO8NJu/biznVYjNqbgc8khSftPXtTFDdJ7GApRav9pCzGyTmkxNAAdIVer7rJI/0/dGDUw7P3kNNG4rqM2z4xpcAsKUpunag7H6dPBwN9hrrCuBtGXergyMGF7HbBtmstaLQr2JF4M5fHxxaHoh3kemDrlrAbIWf+Xln/QMXEbR5EBnAlqupUccnio5WdtE6ZvWizStZZST16QSRwhZmj/MxEtoU5AtOxW3QU4F48w=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1101MB2157.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(508600001)(6486002)(36756003)(53546011)(6506007)(316002)(82960400001)(66476007)(8676002)(4326008)(66556008)(4744005)(8936002)(38100700002)(66946007)(6512007)(186003)(44832011)(31686004)(6666004)(86362001)(7416002)(31696002)(2616005)(2906002)(26005)(5660300002)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WUR6VXYvYU5KNjN2QzhCWW5Dc2pOdzBLZmFYVUp0ZERvclRORTB6SVA5citt?=
 =?utf-8?B?cGc2VzdFOFVER2lPRGp3MnhraEU1Y3l0NjR4VGtJZ2psTThnNlRJV0U0cEdG?=
 =?utf-8?B?cGFhNHBZTjlvZGVzQmhDSkZTb3Yxd3RDUTllZXFNcmcyTy8ra0NPenZIVFVY?=
 =?utf-8?B?STB0enpZbCt6aDVEL2d5bVFwekZpVU5WS0RNNjYrTFd6Y04vSXFXNjI2d2oy?=
 =?utf-8?B?aGlweVQrd0w4STIvYVF3dSt2QXhYdEZPWlhHcnJTR24yL1U1SzBrRWFoeldK?=
 =?utf-8?B?WDdCSTRXTHdRd01BWHZ4Tm8vSUUyOEN6TU13TTNnbjkxbDRpRHFISE5hMkY1?=
 =?utf-8?B?cU8rSm9ha3YyMVcvdnBUSlQ2ZVI2QkhRcTFYa01VWTZyczFvS2NjWW85d3NB?=
 =?utf-8?B?S3Y3d3NjelA4Mk15N1VsZm43Q2lIY1E2dDltZDFXRHc2dTkvOVBtVllNNWt4?=
 =?utf-8?B?ZzJGR0ZWZDR0VzVHQXZtUENGaWVISVRhaWk2aTRseTFqTG8yMEtHMnkwL2R0?=
 =?utf-8?B?YXNmZEJJN0J2cG1nTTJLRFBpVVBXZnpPaHMzc0pLNmhIVjJvamFKR3YybWZ3?=
 =?utf-8?B?d3RyWSt0UVo3M09ET2k3REtjeDNFRkpjV2RtVGorYVl3aWdjOTJQUHNKYUhF?=
 =?utf-8?B?QmtybFE3QXNEMzJTbTNaOTl3cEJiMzAyMzJYenJ3aWloTlVzSWRJWkxRMnFY?=
 =?utf-8?B?eGdwclhzVHk1bFlqQWMwUFVJS3ZFTEFqNVFEWW1kLzNBekFwMlBHWGFLTHFI?=
 =?utf-8?B?dnlXaXRjaTM3U1BPT3dSNkVCUy8wT21BYXFPQU16SWM2bUxmY3BRUjRuUFNp?=
 =?utf-8?B?Ly9aa2NKK09vNWFjcGxsUEZ3QUlBT25rU016ekVSSU5GRmJPMlB1TDFpNHZX?=
 =?utf-8?B?dVJDa0ZacFJ5KzFPbWRZbk9pR0tFbFlqUkJ0cmFZeTVrdkFBOEplR0tSUENq?=
 =?utf-8?B?clJWbzFKQldmSy8vU1FMUnhtdG1rb3VLSEEyQXk2SXNIaDNuQXZyL1U3Rk9Q?=
 =?utf-8?B?NjJ5VHlhVnB3MC9kU2ZIWFdaR2I4QzFSM3ZWNmxaeUpwWUZtQWlySEExNnJi?=
 =?utf-8?B?VThhK09KQmphbFJRWGdYSEwwNzcrQXFDWi9SVyt4TVliYzQ3OE5PTHFvWUtx?=
 =?utf-8?B?S1cxc2pNWEFSTUdqZFBsbERocVRsNklrVUhLWVZqTFJ1eC9OTEZad1B6S1M2?=
 =?utf-8?B?ZTl4ZnI4ZmFoeDFTVVJxbFM0em9KNXhEeEgrWEhIeFRWTHRyeXQrdVJ0N3hB?=
 =?utf-8?B?YXZRMWNYeEtMRGNOdmhja1pRV0ZTbjgwOExpZVR1djNTQjBIQjB6UGZqT0dO?=
 =?utf-8?B?NUdtVFJVNWlSMlpPaDFLUnhTd2M5NGxOSWtmTHF2UjZUZEF0TThYV253UVA5?=
 =?utf-8?B?dkQ5RmJYaERmaVFha2k1MXpTTXRPY1lTdG9kZjBsb09OOVkxcUF2QnpERXdG?=
 =?utf-8?B?d09FVjh5Yk5HS1JFUnJCeW8xaW8zemN6N09lallxNkw0SHFCczF1T1U5MjRv?=
 =?utf-8?B?V1pBWUQzajVvdE9wNEcxdEtIbnpobGRiTlhOVFNVVytoNHl5QzRxdFBxWGcx?=
 =?utf-8?B?SWpjemplOEd2a29va0YzMUQ1aGp5Q2taTmZ0U3FyWkd2aldaZTgrTFJNVitv?=
 =?utf-8?B?ZEpHNjV3eExNeURZK2Q3T0w5T3Z3elZhNXREU0JqY05OTjROdEJCaVMzMHpF?=
 =?utf-8?B?NnJZK3dQaTAwamM3NXltTTVJNDNXL2ZKRDUzTGNVNWZyVlZWdUErUE1XTEFm?=
 =?utf-8?B?TFJYNmt2TDJocXJxVVE5dVczTXFlVHc3YUJWOGF0aGhra05KWHl0Z3pIQVRp?=
 =?utf-8?B?WThnMVFkTE5xMGFORjhRLzJQdlhqQ3FERktjMlo1akdvTytRcTg1RlRDWS9C?=
 =?utf-8?B?UGZVbmlySEJvZFZXU09hZ1lFVW9YNkdlSWNmbW5QT1huSG1mR1lmVzJsSVdZ?=
 =?utf-8?B?S1JzcWd5N3V0Y2FBeStKUUtJaTdsVnB6TmMyT2RZbTVlbmFITzY3YUpCRHFY?=
 =?utf-8?B?algxcTBUYlNYaldrVzhBM21sT3FyNGVtNWFVRUhHcWNoakUyL0VCRElna3ZQ?=
 =?utf-8?B?YzZ4Nk4wVWgwL24xN0l4Szk5em1qOG0xalczSkJURXJ1NHBJeXQ3dE41ZWI2?=
 =?utf-8?B?RW43K2twZCtwcXE2RnFnSWNVTzQ3aXFnWjRFK3FibExINkNCWVNLdC90bWd4?=
 =?utf-8?B?THc5OCtkMVhOOWcrMWo1OVh2eVdtc2hoVGoySEpTWHgwR1JUek5WTWtsOXlT?=
 =?utf-8?Q?JiIw49DK8FFVD48miOVIgj/SunAfr9sCsWyTz4ilYs=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c1c0ed5-e953-4f13-c872-08d9fad07c95
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2157.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2022 15:39:20.2468 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pR4LODNOPA4PJQifGOND90UFTbYJhFUKqUSGXGDst7TpCAo4zM38SZPq7Hfp1n2494rPn/+Y2k11uZK022au6t/RgFt/rNXS2NzT1PSgoOA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4927
X-OriginatorOrg: intel.com
Cc: upstream@semihalf.com, harshapriya.n@intel.com, rad@semihalf.com,
 tiwai@suse.com, hdegoede@redhat.com, broonie@kernel.org,
 amadeuszx.slawinski@linux.intel.com, cujomalainey@chromium.org,
 lma@semihalf.com
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

On 2022-02-28 4:19 PM, Cezary Rojewski wrote:

> Few dev_crit()s can also be found in other components as well.
> 
> Without audio and graphics there is no real 'user experience'. Abrupt 
> closure of communication between DSP firmware and kernel driver can, and 
> usually is a consequence of either an undefined behaviour (in process 
> running on DSP) or hardware issue. While I can't spare the details here 
> for obvious reasons, not all situations can even be recovered with 
> reboot. That usually depends in which power wells registers reside. The 
> 100% confirmed solution for laptops is removing battery for a second or 
> day to force G3.


s/second or day/second or two/

Hope people are not panicking after that typo =)

> Considering this, I believe having a single dev_crit() here is justified.
