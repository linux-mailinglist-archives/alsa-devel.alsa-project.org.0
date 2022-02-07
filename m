Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ADAE24ABFBA
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Feb 2022 14:43:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2EB251740;
	Mon,  7 Feb 2022 14:43:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2EB251740
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644241430;
	bh=VFVYh+0Mx0R2GEbEWurkErG7Zu5djZMXAwy0lgQkj6w=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NlG4eZw9p1OKljlGx8aGhqsLyV2bDgV8im2+Zs1cVmXVb44cKo+C++GFrqBb3l0vF
	 mOMgaItOXW5Yn5DKRePpELcgpLnVeFayDaHNQJSEEkmmM/4JwSmxiFfNUD+53LatoS
	 UDtBMAK++fTG4m1fzjdlKhr9GGn88x7V8rjYQd9A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A4D0CF80249;
	Mon,  7 Feb 2022 14:42:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 75979F800E9; Mon,  7 Feb 2022 14:42:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7327CF800E9
 for <alsa-devel@alsa-project.org>; Mon,  7 Feb 2022 14:42:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7327CF800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="F4UDzm6G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644241360; x=1675777360;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VFVYh+0Mx0R2GEbEWurkErG7Zu5djZMXAwy0lgQkj6w=;
 b=F4UDzm6GNmx/NN4BZiazaIQ9f6ZvcVhiTsL5o/4xQ5+b4zREqnx9+d0X
 5f1uMl1BnPsWuPauvlFfdStKQoDTqNI57t4S0/ptXCtDFrewaGojh8bN+
 GA2R3ajqvFdQG5Q6tb6ZdORw2g2lumpFoLDEDcv8+fAnd79l7LPP59lkF
 lTmyVuCk5hTnNC0vowl1ssPtme1BWwY+yfZqxA2BSQFwsLJK/jStoIUPT
 ws3jv8NMg3LcHFKYpqcYG1JEXqqWUjh8lk4VS13cw8bzCbrjJdZQ+//n2
 0cZNtWRbyFS/OUGJx95Hi46xv7BuWGcAE8H1GOevZeBBFfi4XGfYXp4in w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10250"; a="248926950"
X-IronPort-AV: E=Sophos;i="5.88,349,1635231600"; d="scan'208";a="248926950"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2022 05:42:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,349,1635231600"; d="scan'208";a="484423123"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga006.jf.intel.com with ESMTP; 07 Feb 2022 05:42:35 -0800
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 7 Feb 2022 05:42:35 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 7 Feb 2022 05:42:35 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Mon, 7 Feb 2022 05:42:35 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.44) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Mon, 7 Feb 2022 05:42:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ncuGwM1MyG9bvqrCpmLoGdVl2b187hCtkXCffGlkH5nsmmGXhZEy1MVexmSP4RnpMCFQP33G/4HK+LWURU99s5Ww8CfKql7k1BPsWDMvRxJO+ZU/XXoPwM+vcZ6h9FefEB7+MCGrTQvGxmze/OI5B1V0ca9Jc2Yp6MIrAYYGSymbmq78MP+hivglfH0TST+HRN/QiL2RK6sKKFWRzExM3SnV8JNioSrkm4whJEe2DM9InqRkeCJ7IdL8j88EZEzEyyFrafYURuIdrNgAAo6sBk9kpOmdxegzgSCxNlzQqUe0gZdIi4hU/Un4GItboEygHDAjUbzIwri8xzkvjS6Byg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9x/wKdvAv5SFB7sBcgpoB1RzgcWifaSqvRWuRpJtODE=;
 b=GsCKRCzspaNOWoPIPV7iSvG2KFQjbpxO/Ng0RuI3b83KFgx+5tEy3tQZeVILkHuskJAubpPEm1s5y3g20NPSZ54T+VA9MJlndZRcvXh4nKQU+kdDkRmbJJYJU6aG4za0hQp6GA0Jq9RF9kfEWmj5o5C89dNh6RT9AfKFVddmHUksVjDOS8EkKyv2Y4NHcwXad20E5x4KHKCbIlhaP4bliB7kdWV+cMPPxbR473vY/CAvpGKlC/q5jEDOW95vXv76QbEFCYCe71TyVpwAa3hIxnSUy4VgBNz/xfRZqsVwpZw263Wg/Y6BcXxGMp2G89ePDH9zW8rbiSq+N3N419eF5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10) by SN6PR11MB3374.namprd11.prod.outlook.com
 (2603:10b6:805:c5::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Mon, 7 Feb
 2022 13:42:31 +0000
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6]) by MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6%5]) with mapi id 15.20.4951.019; Mon, 7 Feb 2022
 13:42:31 +0000
Message-ID: <b120a683-fdd9-1312-67e4-72b3f32789e4@intel.com>
Date: Mon, 7 Feb 2022 14:42:22 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.4.1
Subject: Re: [RFC 00/37] ASoC: Intel: AVS - Audio DSP for cAVS
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
References: <20211208111301.1817725-1-cezary.rojewski@intel.com>
 <YcXFwTmP6k1Zfbw9@sirena.org.uk>
 <fecf5a0a-c2b6-f4a0-b4b1-d8243ea324a0@intel.com>
 <YfQhIoXTkzO9AEQc@sirena.org.uk>
 <ccb2f9f0-e9fa-3215-f623-bac58b4c9633@intel.com>
 <YfqYDkXQsyLOzfdp@sirena.org.uk>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <YfqYDkXQsyLOzfdp@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P123CA0088.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:138::21) To MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 33ab1f6c-83e2-4cca-6c85-08d9ea3fb035
X-MS-TrafficTypeDiagnostic: SN6PR11MB3374:EE_
X-Microsoft-Antispam-PRVS: <SN6PR11MB337416E41A51A3CA11A17468E32C9@SN6PR11MB3374.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CNwbn0IW+0X9ONV0FbOc+yG6fuO4XD5UyLKhjyaY3ETtEErpYPMKkfnk3YArTZNbMmRWZQeN7Tiw9nClD5XOCmIke2KM4E8CXm09xyDAMNbXTl6wXdi0zkyZkAdwpHXgR/nK/RXg5mz46urvDmZBVvjWH78ghQe/p550nE9Xl/foKgOz+fzgTaKkKwQEQYKKJOU0eg34cczlkbZ6HmsKyfxUIDVAGtwBOBntf9QVQ4pGWj9UpiWX8tXG4RISBHmB/uBucRs8d9vbV6BWJaUf9JaxzkKhIZL4QMUXR+X7OCP0Oi80Lavm51eMFOAjLeUDU2IbMMfbBYC70c9+A7LHm66dprY3UZ/FQwH+IANy93lGBYxXtQ9W/kgT0mHBe/csQRjGiHvRV/OoXRO18Fpnzcr6mNNq0a825z9kmxi7xH0vk+vDeQOAt0rvrq8EmqZTvMdmjM8RMmvQWBhTtHH4g5PPdMi1ktVkvl4xtmQwaC9fW6Hv77O5BOxSkqd23+Gj7ZR9bAsjhm/ut1f7Dx+m8mNGSX3u+tX1e8bVkfM0kangsa+3QW5CFZelUC9oMc0RQsLXNzKMvW+tjMfzYlmC0lJZF3FdqajvygBy3rAcuK2suhol4+98A4PU1/pUrrwTygmH5aw+0d3sNUjub7ajiECOhfuy2wjbsk8GjefgpFh4JLeTovZT6CbJim0JbjwTpGdM56GcUVgmKYrwRCAgC/5KhWFJlgGFoqxQkp7V4Qi+WDIbfVrIpAhnNHDQPSqLz9eBfpPeuZtIkiuGdmCp3L9N62JsEIoaaPqIO/jmOWhCSXOk+nx9FKkhw9rg0iVF
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1101MB2157.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(36756003)(38100700002)(6916009)(6666004)(316002)(83380400001)(82960400001)(86362001)(6512007)(44832011)(6486002)(966005)(2616005)(31686004)(7416002)(5660300002)(4326008)(8936002)(2906002)(8676002)(508600001)(186003)(6506007)(26005)(31696002)(66556008)(66476007)(66946007)(53546011)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d1Mxa1JUWmE2WVFwOGhtTmtLWkpKaEpkcWY2YUxRTkplenJ6aEhEM05idldE?=
 =?utf-8?B?SFhhaDlGZVRiazZyVFdNb1UxK1FPY1h3QmFNbTNPU2RJY2Y0anpqMFJ5anRp?=
 =?utf-8?B?OUhTQmdLZ2VwYUZHWVFpTmlOVFMvUmVOVGZ3TkJJQXpveERKNC83dW5VZGVD?=
 =?utf-8?B?M1c1M2toK2crTDA1UGx1bC9YSE1abTY3bTNteHUwKzNKM3JFZmVhZ3dwUkFR?=
 =?utf-8?B?WkErZWlXV01ScTNqN0lTNGNUdEpjSUxsTXlnT0pzUXN1UTI2QStHRTZUQjdp?=
 =?utf-8?B?b20xcHZCcGw2Y2c2U0RxUlpNZ1orQU8valA2L0ovaHBJdGFDZGpwNGNubFhl?=
 =?utf-8?B?VHNIdzFxajhNazNpRys0R0h6bEhWRldrMEQ5VVR3NzQzSmNwYVdoODI4ZEx2?=
 =?utf-8?B?Vld6OUVETEo5WXZFRnl5RlFYRjNrVHhIUDc1K3BWZUpNYjZnYnBYNG9XOGN6?=
 =?utf-8?B?QWZrYktlUU5JeUlEdFBDOCtGQnk0RFRwQlcyTU14MEtBQXdjdExlbWl6TmNr?=
 =?utf-8?B?M2xBcjhvVUxBREhWVUNYZTB2dmt6Umoyem1HQ1hPYXUwYUp3S1BOSFFFWFJW?=
 =?utf-8?B?RjZSMUNMM09jMlducFhXMFc2SUlyZUFRcGMrUHVDaFFCRzI2K0Mxd0YvQjVt?=
 =?utf-8?B?NDhtcmFXbHM5ZWdGVXlYQVRGWmNHbUVVNE95TTV5RlBXYUV0MVgwT0FaK0lM?=
 =?utf-8?B?NXhvWDE4cTBIV1hTVmZYbTJjWHlwV01hdHNRMDMwSE1ndGdOQXlGUzdWNzR2?=
 =?utf-8?B?Z25TUHdqWldZZUJPd3FqZnkvWEg5M05oQjIyV3E0K2FycXVmQ0t3dWJpSkZF?=
 =?utf-8?B?dmVLVGVrcUxCRFBLQng5bnZKcUdrR1h1d2FIYXd4QVBYUklkUDd3WTJYdzRU?=
 =?utf-8?B?dGYwMDFYazF6ZzhCejBnc1hqQ3h0VXEzN2VPeG5kVHNjVnhRL2E4djQ5b2lw?=
 =?utf-8?B?K3NVL1doeFo2bGVYUW9uTE9nUEYwMXRKLzdRZ2VCT3FtUEV6VzBMMVptOTZy?=
 =?utf-8?B?dE16aHNGMEtCK01TSUdiVmxzSmNwb1YyM050Vnp5YUQ2TWl3ZHJEMTUwQ0NT?=
 =?utf-8?B?MnVrNFo5MU0zWkxuRXM4SXUxM1NrbHJiaW5KVWliMXJpVG1JSUhXOUozOWFT?=
 =?utf-8?B?ZjBTcmVWMjBXM1hhSzhvY2c0cURoMUcrZHpabWtrWENOU0M0Y1ZsT3hBS29I?=
 =?utf-8?B?SmExRGV1bUlSOVI3YjNrRXZaMkt1L25yS0QvWk9RZEdVdE1hSG9OSkFhVzVW?=
 =?utf-8?B?NXNZUCt3ZTZDV1ByanVqRTFpc2ttK0RZUEFtSDI3bzQ3UE9ITHB0QkkvSTQ4?=
 =?utf-8?B?RTE2RzNpOTArOEdRQzIwT1dTUjVpRWF6NDlxSjlHVzlZVHV4NU1PSGU1TDdR?=
 =?utf-8?B?cWNFYkFaenRVUnl2TVl6STlkSnpyNDdYSlZsVGlYaHVaaXpGQWc3T1ZtdmZP?=
 =?utf-8?B?aW1BVGFqYlp2dkFic01kL1BUT1ZmMEZaTk9yRzlwdGh5UGJXMnVaQlEwbnpW?=
 =?utf-8?B?dzBZaTd5UGptcVJ4TlRkZ1RQenVGQVlvdFlKZXpNVWN3V25YcnZqWkZYR2Vj?=
 =?utf-8?B?QWRHSmsvekZDQlQweElhbEJWQlhGMzRudFFDd3E2ZmtKbmNDK0VqaTAyWklC?=
 =?utf-8?B?MndhL0pQSjhFekEwZkIwWEdMNEFIbjcrNndCaXpuOHlyeUkzOG5JME1LbktL?=
 =?utf-8?B?UnoxczlrNzZweS9zdXJpN0I2d0JHaGlJK2lmY2xmK0p3NnRrOVNNTDRldGdH?=
 =?utf-8?B?UzIvM1lydXFYVURMMjFNNExQdEQ3cUt1b0Y5VldUSm52dVMwS3lhcDlWdVJ2?=
 =?utf-8?B?KzhqaTdDYlEvWEVTOWpIekI4eUg4MVBxT2lRSHhzZ3ltd0JXUkE2cWcxMk83?=
 =?utf-8?B?SXpoK2dTWmxKU3I0NGkrNmR2SmYxZkFOdzIyYzNNRXBsWkJMUEV3NjQvaW5F?=
 =?utf-8?B?YUhrUUx1RTVTanJvSyt3YnhCVS9Cc3c2VmlIdlkyUmhPdHJWc0VTcXd1SHB1?=
 =?utf-8?B?Z3V1Mm9uSk5DMkllNms1ZVQ5cTQ3dXJMc3Z3OWk4cnJPTmtGRFgrS01sd084?=
 =?utf-8?B?NkE4eXMydEgrWC82QTdqRW4xQzJjdDFlUURYcmpCenRrd3ViTzlMMjU2RjhH?=
 =?utf-8?B?dnE3WkVjYm5iTGs1ajVWS3BGMklvQXpieG5IbktFYVNPQTZLSWhmekU3elI2?=
 =?utf-8?B?cjUveU13UmxxZ0JBTHlsYTdTczRsdFU1NDFESXdLUkNQWm42Ky9JMWxEb0J0?=
 =?utf-8?B?Wk0zU3RsNWQ0L0xBQngyckwrdnJnPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 33ab1f6c-83e2-4cca-6c85-08d9ea3fb035
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2157.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2022 13:42:31.3984 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2Zt+PBTvjwCCdM834gRTBadkZByJONBdmS0FWs9LQ0gZYI60IcQIgY1y020eUFHF42r+6Zs3A4kEm8WzB54ZcgAeLTmu6Nbnj+mawuNkEhU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3374
X-OriginatorOrg: intel.com
Cc: alsa-devel@alsa-project.org, upstream@semihalf.com, harshapriya.n@intel.com,
 yung-chuan.liao@linux.intel.com, rad@semihalf.com,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 ranjani.sridharan@linux.intel.com, amadeuszx.slawinski@linux.intel.com,
 cujomalainey@chromium.org, peter.ujfalusi@linux.intel.com, lma@semihalf.com
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

On 2022-02-02 3:41 PM, Mark Brown wrote:
> I don't have an off the shelf answer for you here, like I said half the
> thing here is to split this out from the rest of the series so it can be
> considered separately.  The digital domain stuff is obviously key here,
> the main extra bit for any sort of dynamic DSP routing seems to be
> working out a way for userspace to set up and remove new paths - that's
> probably new userspace ABI.  Perhaps that's a runtime thing with initial
> setup in UCM.  Or perhaps it's better to have something closer to what
> you have done but split out like topology is so that the bulk of the
> code is reusable with other firmwares and there's a thinner layer with
> the firmware specific bits in it.

I've re-organized the series and sent three chunks that could be sent 
immediately, at least in my opinion.

HDA bits and IPC protocol plus code loading make the first two and are 
probably least important for the current discussion.

Two patches that target topology parsing and path management have been 
split into total of 13 patches and sent as an RFC [1]. This should help 
in further discussion, extracting the framework-friendly bits and 
possibly shaping the new framework interface.

[1]: 
https://lore.kernel.org/alsa-devel/20220207132532.3782412-1-cezary.rojewski@intel.com/T/#t


Regards,
Czarek
