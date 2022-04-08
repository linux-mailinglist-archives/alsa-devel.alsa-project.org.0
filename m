Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DAF74F935D
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Apr 2022 12:55:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 05E4918A3;
	Fri,  8 Apr 2022 12:54:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 05E4918A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649415337;
	bh=6NsCsYz33en76ahIXGiEFss3SiTTLQbzIl4PihoTZKI=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KKHbw3kYpab7AFH5zSPMbcS2f6sBG0ueUWkJNAdHte3/RZmryGqGc4Xp/Q/3AotFK
	 mZdYO8gSBsO167l4jxszZ07JeAmWWZ51Sp5LDRImFFi5eicyXaJqo7M5NHtimSeNqT
	 ycTYvJjOi7USYbFNBo4zPiKjOmKz0GtqL9fzJKMQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A4B07F80311;
	Fri,  8 Apr 2022 12:54:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 631ADF8014E; Fri,  8 Apr 2022 12:54:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EB27AF80128
 for <alsa-devel@alsa-project.org>; Fri,  8 Apr 2022 12:54:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EB27AF80128
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="HWJkZ7El"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649415273; x=1680951273;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6NsCsYz33en76ahIXGiEFss3SiTTLQbzIl4PihoTZKI=;
 b=HWJkZ7ElMvsHo5Xa3PFYGMZ+xEbX26RWcQ/8K+2V66pF6odx7q/QsQqM
 3qqv3MkGdv1GidoEbjOgSpCL3g+WxZ7+2s2cA+8IWI4gj3wuuk3pP9bm/
 7OFJcZuNA/BwEGBaD7T9gjeyf1FK3KB2xdp/ABoeMmtNAKxy6VTFO6mJB
 BZNlJ2fHMa76YOb63VIEYPWV4T7BxFvFrBCfjIBJNc/u5kaKnyKmK+nPk
 t54vCOOAJQgs56rcYqDMdInZHDm+IhBt8lMuTxrSekUY+fmTczl5ocjf0
 yTAU1+4krDp+HhC8lBZChFEKwEaaMtWEblfu4iPClhLa1FnV3+KlRjt+R A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10310"; a="249096189"
X-IronPort-AV: E=Sophos;i="5.90,244,1643702400"; d="scan'208";a="249096189"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2022 03:54:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,244,1643702400"; d="scan'208";a="659446061"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by orsmga004.jf.intel.com with ESMTP; 08 Apr 2022 03:54:28 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 8 Apr 2022 03:54:27 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Fri, 8 Apr 2022 03:54:27 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.170)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Fri, 8 Apr 2022 03:54:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jNa6yksjmDy7x30ubWrj/63gsXGOW6niL/F19CObrKIV/JHCLaJPUERDy0zRnwgX5AKLSfVhSgjws7iiF+B5O+e5t+VSBW1nabWLd0hX3udxlU78jbWy+BNawWmf9Jk+LGKF663R3lKvGDr4hmD7P9+fGi3TNkonkEpDNs616Sei1GWm5dFI9HkhEmeateWofSpHuBAkYZNmKV8+xu5S67Fn3AKZk7BXdzvhQf8Bv5wcZqMWFxOZlvmxqG/cXv4atbUFoJb2GeJEwwd0Fc3JB/xWflbIJ+Ed7pNnHqcXg/AFYcN/pUVKxPJ4S1Ph5zYCLC62MC9EK5mC0wJf7r+gxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AnPuLWvqtWGas+yXMUvvRrOuK0uMuXh8nxLvYQtlEmA=;
 b=Q4ohJRHu+Ej6Gw33Zco/k/YcDfmHlaxVPS9RFfFN2+jRjMgOSzBd/8HAQad7oqGmzPY85BPomf7dqpAOhtTc8eHeTFr3mEwMpMxGDmqxOP4+nkV+jI3Eiu065N2vELohefxKbCXGTNh3aT37OgI0uJSUj2gYYe/f1AB4ElZbv2AMXYbR+9ubEimiK1ZkV6mAWkwWIh4ukCkAwJ7Huj1hcA1IYprLy613sCrGuIoyaFqp4BjTGMmlWzesH4lBsGZGWg8IOTFUxkW2wJUvsKopKS/Il4ZsnWPfqv3U5QWz3/hsf0n7Z7fGnGLzIRuX62zqpOcbkvJICUYvzhK0P7LVFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10) by BYAPR11MB3815.namprd11.prod.outlook.com
 (2603:10b6:a03:fa::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.26; Fri, 8 Apr
 2022 10:54:20 +0000
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::ccac:dd6b:b12e:477c]) by MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::ccac:dd6b:b12e:477c%12]) with mapi id 15.20.5144.026; Fri, 8 Apr 2022
 10:54:20 +0000
Message-ID: <6d7a64b4-9b5f-2fc9-e53b-603cdda6cecf@intel.com>
Date: Fri, 8 Apr 2022 12:54:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.7.0
Subject: Re: [PATCH v2 00/14] ASoC: Intel: avs: Topology and path management
Content-Language: en-US
To: <alsa-devel@alsa-project.org>, <broonie@kernel.org>
References: <20220331135246.993089-1-cezary.rojewski@intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20220331135246.993089-1-cezary.rojewski@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0234.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a6::23) To MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0394ab7d-fd54-4404-67ec-08da194e2225
X-MS-TrafficTypeDiagnostic: BYAPR11MB3815:EE_
X-Microsoft-Antispam-PRVS: <BYAPR11MB3815DF155FFA7052B0CDAEAAE3E99@BYAPR11MB3815.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZlsljC3iVH6ehOoS18jvecyXuDp16ZQu3F2y2opi9VaDJ+qPwkz0dbrbxgaijSLn+pC8KALPdeaKfrVEOLb8LPPnsaAU58eopCt9tmvdmIIx1H81O+siSgkCw9tC2zumFDixln4nDTKKfXjQIBbAdRbDE0nNrkSLLrWnfiYjCwGejB+YkDYLzUgXl8wsM6DGG93fOHTqBH7NTteZ7AwNMBmOCKyBnz881znRIqkz9eAcLaZ1fT10lvBaZeJDUDfTrh3yNKRipUY1H+py3gaV7tuEt3Ld2vUOk4LgDl2HfCz5c7w4OBCnj7YIhzyJU+dRFBcrqYgj0ZtCUKnYgsjvwkG+hFIKB2knGrvtky4Z6HL/dRFVPYTH+/KdhL3mDBENDUvbIPVJ88d5IXVvA8f//Wnqo16xQbp64wXcQ50uYxHMus1jxVvuoozoiUh6EMTnAkw/OsbW2K2Tk8jNT3+CsdiVgEbeYIn0KBO0wHyhggZgXZt0SEwARjcNgTrPn2i0pCpNba+LcJcjBmvBkkZUZ8P6Ug3bPoTsVJfqKNrUnuWb4uqlToqI4lHm/ID7Fk6blXjJzLOkU+qetHPCKblW8JDhYkVhTEXeQrrqwYMfehwS3d5izZq8xVjkhoEVfviojsjd9FN4moRkrpZHWwB1/gWRIiQpHcrxbkvM0rdiGDaylHRPeQeunBj1yLbSTMVmws31LBW8SDImw4Lgz8XpFdZj1UpodhKGbHNEsIyzc1tN97oRF3QP6N7Z9VGhrpJdwcIX7MRh3kZ7ResuT/RKQjRuBr29PfsSKWP/zXEPq6zir/8e+WPb76tGr0+RTH+koTdtAyFw8/7MMhvZn85NvQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1101MB2157.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(2616005)(66946007)(6506007)(66476007)(66556008)(86362001)(8676002)(4326008)(38100700002)(6666004)(53546011)(7416002)(44832011)(31696002)(82960400001)(6486002)(966005)(508600001)(186003)(36756003)(26005)(31686004)(316002)(5660300002)(2906002)(6512007)(8936002)(83380400001)(21314003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VFB5NGFibWNGZTBMVHBpaTZYcTdneFJ2OWFhb2F5OW5FY09HTnoxK2Q0c1ZE?=
 =?utf-8?B?RHQ0Q2paVzdWUEZBbDM4cjhTQVRWZjAxQk1rbldzblFkeklhajRCb0JwMXJF?=
 =?utf-8?B?OW9MdWtTNnJYc256cHBFZHRSNjAzVjVicVNtTUJGaFZJWTNwZVI5MWUzYTFn?=
 =?utf-8?B?dEw3aEl1WE5xV1NWNzU3TzdzM29uVFBQdXM4dWVtQ3lybjhhalVadXRCYjEv?=
 =?utf-8?B?OVFQNlVWcmJ4aHQyVDFCZnR3bWVkTTZGZDQ2Z01ZWVdiZ2VzbFlYUEFFRjZq?=
 =?utf-8?B?N2EwWlpmYk9XRHR0VlByeXdibWJvWnJhV3NhTU1FaEVTWUhaZjV3M2tXcU5q?=
 =?utf-8?B?UmlwMzVPTU5jdW9vc0hhcXo3V3kvRGNIUlJ6eEk3d0RJcFpWY3NBWnMvK2xV?=
 =?utf-8?B?dVFzM1hPSndJZnVNYWF3WVNadjN3TGNncjV1ZGxYQnNrK29Ub2d1NFlzYklT?=
 =?utf-8?B?QXVTWERpa005VUxFdmdHaXFMWDhUTEZBY2d3R0tnT1hveEF0T3pGa3MxWU5J?=
 =?utf-8?B?anVZMmVGSVNhaWhrVWtabVJUanArUC9lMmhLaGRRajFON3JaejlwYUJqcStv?=
 =?utf-8?B?ejhNbGY3QkdpYXdmc20zTVhJMHV4VEk4SkduRjR2ZDI2eVBTVXFIMmM0NTFZ?=
 =?utf-8?B?Tnh3cnhaSVZuNGZvdlIraVIva2FESTk0M0FGeTFNbno3aUJpeldnWTErcnBL?=
 =?utf-8?B?WE5jL2RNTkhxck94bnpzdGhocWF0OEVzcjZuRE9OYlRKeG1CZFVseVFyRzBw?=
 =?utf-8?B?V0pSYTB6TVFNclRkcGlyWS9hK1RvYVRpTU1xc29qRXgyYVlSbzlQZFdLSktr?=
 =?utf-8?B?d1hIWGxiM1FjWDltbUtPN09CbHd5OHJWOGFjb1RhZ1pQMkEyRy94cEY2b0I1?=
 =?utf-8?B?QWJQOFVOZHJBQWJNMVZkYzNYZXBBOTMvcnhldExEbm9YZWlDbkhLQUhOdDdY?=
 =?utf-8?B?NXAxWUNhMXQzMVY3UXpYc01IYWg2NU1OeHhnSHNPUkl5NUQ5WDhiZlhSNGk5?=
 =?utf-8?B?VS8zZjA4UWNPQ1VoRVVvblNQcXB6L1ZYWUdrZkcweHU4WFdQZUQ1RldCMmJt?=
 =?utf-8?B?MElkbGZtQ3c5U2FuVjhRdDJkOXNsTyt6RXRTaVFuYm10amkybHIxTXdLclFW?=
 =?utf-8?B?TW0vc3oxbjBSWUVYK1hzRXprWjE3SkF5WmpuTmd4TjVuVkFKR0ZWY3hrT0RT?=
 =?utf-8?B?OENuaUJ5YTFvR0dQUFgyYXlJZUNzWk1jaDB5c2Q5YzBSanVEMUhNT3hlR1BW?=
 =?utf-8?B?WGhMeUMwdVNTbWJTRWZpbld2RThqUzNVVkRQR3l6SlRzR0xXOTNaNUVmL01X?=
 =?utf-8?B?RHVST08zZ0lxQm91U1ErY1VKVUYyZUtldGN1WmNlc0xXY0tBTy9mY1Y0RVQ4?=
 =?utf-8?B?N0RuY0JEMnQzWlZtVlRlU2ExQmxpNE5xZDVEeTFIY2J6SWRTQzlCUWk1aTQ3?=
 =?utf-8?B?RzE1OEhjdlMvQVFHU2NqT0t6eTJMendLSi8xeGpUKzN3SmlibHZDVmpaYjcw?=
 =?utf-8?B?UExLYXF1aDNEYnlHMXpxZlBEOXlTQ2VQNmZhc2FncDEwREorT2l2TTI5Z0Vn?=
 =?utf-8?B?aFpSUnZITnFmWnd5bHMwYUNTdmNhVWRnQk10RUNadW1HMDdhNWdKdVhrUENa?=
 =?utf-8?B?ZWZnV0IvVUlqdnluaU00NTdoZ3FSSElYckxRWlRmazhObXNneUhoaEg0dVNp?=
 =?utf-8?B?V2ZuTWVYOGN2eGt5TTdlWWQvK0RUcC9iT3M5eU1GRm4wU0phYnJKMjhpck5G?=
 =?utf-8?B?c3BsK3BzNDF4VGZYODVPMDBvSzdCVXRUdkNvQUdrT2FDQ0ZZeU1kQ2JhRVVL?=
 =?utf-8?B?akFqWXVMNVVDOE54QVNHY0dUZVJmeFVlUWp5RUZPaDZoV0Q2bmJzcjNYSHhy?=
 =?utf-8?B?cHNEbTNZUlBjcTllYkEyWTJkeTlMRVR1dGNVRHZFeEgxbEd1VXhDQW53ZVh5?=
 =?utf-8?B?TndoZ0dTVDVldGROMnExelN1U3NrR3MwcWFscStHR0pmNzJremYvRWU3S0dJ?=
 =?utf-8?B?YlI5RjhXRTU2V3pVQzlFbjliZFRqa1IySjdid2pNKzAvbVNCSFU2RFJaUjQ5?=
 =?utf-8?B?UUJsak1EeWdpcit2R0VIRDFNWlB1QXpQUWlJSjBveUtNQlk2a2k5dER2Sm9v?=
 =?utf-8?B?TEFZa0lTUG56TVFiMUZEcHpMbUcvZVRPNm5OcTBTNWlxb2dJeDdwMXNMcFln?=
 =?utf-8?B?RVdoN3IraHg1eEtpeDMrelBaYno1Z3lyNlhDY2poUkI5Mk0vc3RiTnpkTFZY?=
 =?utf-8?B?NUx0bG1EZktlQ3dFY3MvaWc1SG5PZDFCQVhCaWUvTUFSeTU0R3Q5UVFKVUty?=
 =?utf-8?B?UVhLckRJS2QvVE8wU0FQOGEwSHV4RDVHQnc1L3U2YklGdTJqai9oUWk0cHhI?=
 =?utf-8?Q?tb0FvgZBJUSQE9tw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0394ab7d-fd54-4404-67ec-08da194e2225
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2157.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2022 10:54:20.0960 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9PGC+NbaQSO/5CrvGQ1mEgZio5WDIhxbIbq+YvUHcq3gJ+NfrEuJsR1/abSf7dymQnyuZJrloJ63w6qvXbZtphB7+joPan/yAJ+O4frTaxA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3815
X-OriginatorOrg: intel.com
Cc: upstream@semihalf.com, harshapriya.n@intel.com, rad@semihalf.com,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
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

On 2022-03-31 3:52 PM, Cezary Rojewski wrote:
> A continuation of avs-driver initial series [1]. This chapter covers
> path management and topology parsing part which was ealier path of the
> main series. The two patches that represented these two subjects in the
> initial series, have been split into many to allow for easier review and
> discussion.
> 
> AVS topology is split into two major parts: dictionaries - found within
> ASoC topology manifest - and path templates.
> 
> Dictionaries job is to reduce the total amount of memory
> occupied by topology elements. Rather than having every pipeline and
> module carry its own information, each refers to specific entry in
> specific dictionary by provided (from topology file) indexes. In
> consequence, most struct avs_tplg_xxx are made out of pointers.
> 
> Path templates are similar to path descriptions found in skylake-driver
> and they describe how given path shall look like in runtime - number of
> modules and pipelines that shape it and how they are laid out. A single
> path template is tied either to FE or BE and thus at most to a single,
> user-visible endpoint when speaking of FE.
> 
> Path is a software representation of its ADSP firmware equivalent. It's
> a logical container for pipelines which are themselves containers - this
> time for modules i.e. processing units.
> Depending on the number of audio formats supported, each path template
> may carry one or more descriptions of given path. During runtime, when
> audio format is known, description matching said format is selected and
> used when instantiating path on ADSP firmware side through IPCs.
> 
> 
> Changes v1 -> v2:
> - fixed 'set but not used' warning in patch 10/14 as mentioned by ikp
>    builder
> 
> 
> Changes RFC -> v1:
> - Plenty of rewordings and spelling fixes as requested by Pierre
> - any sysfs-functionality-related left in RFC dropped, will be part of
>    separate subject in the future
> - separated parsing of formatted strings into: "Support link_mask
>    formatted string" patch, increasing series size to 14 patches
> 
> 
> [1]: https://lore.kernel.org/alsa-devel/20220207122108.3780926-1-cezary.rojewski@intel.com/T/#t


Should I resend this one? Would like to move forward with the follow up 
series so the skylake-driver can be finally replaced :)


Regards,
Czarek
