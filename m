Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9633F4318E2
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Oct 2021 14:19:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F3D981AA6;
	Mon, 18 Oct 2021 14:18:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F3D981AA6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634559587;
	bh=pBXtGDXpzyPviXRWSsOr9ePWW3Su9oz2AI+R+HtIUJg=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YrPm3mxHUw+3ywz8t9ABZy7WSFRZzX0AcMnXLxIgU99YbK1SGOhyLyL4RZ97Nd2tt
	 MkcmdKY3+oebSqNpkVsScyKpia1/JqQmfbbGVojs8Jj6NTin8XpusFt0/erDvmR17w
	 Ea8NOt+qsjDGGBHVT5U7QhnD+EkBrh270ufjJcOk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D924F802A9;
	Mon, 18 Oct 2021 14:18:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8F3D7F80253; Mon, 18 Oct 2021 14:18:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER,NICE_REPLY_A,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8B495F801DB
 for <alsa-devel@alsa-project.org>; Mon, 18 Oct 2021 14:18:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8B495F801DB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="sDxWSqJ5"
X-IronPort-AV: E=McAfee;i="6200,9189,10140"; a="225696618"
X-IronPort-AV: E=Sophos;i="5.85,382,1624345200"; d="scan'208";a="225696618"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2021 05:18:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,382,1624345200"; d="scan'208";a="717588823"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga006.fm.intel.com with ESMTP; 18 Oct 2021 05:18:48 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 18 Oct 2021 05:18:47 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Mon, 18 Oct 2021 05:18:47 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.175)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Mon, 18 Oct 2021 05:18:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AiSv/j7EHKJVcu3VdnrZFbOt8jF4cCdGf9MIGro2Zd1vPYlEL/mQwNlzMJ5W9Sn/X+5nLVwHt/07Z+hVPJjCNwhgIOWpMXULp+kWmXaMgcQbCL0dPmMrmPB9cP7203b1zl8kNWnFlts8wCXHfWcUk/LXjdpPEj5rdBDJLQecqva7PVSUDTw6BPkvkaNFRKp7ovN8CSwUvkhd1wQawY/Te6ptFdEZbdndMEgzMB71YmfBrTSjkAH4GyUgpZHpY6kw7I9FOkQr0mKepiQTvgOHW0OFC0yAqIAnn0inVzG4KXw9u83ppP3hdJtpe2a9immpgKAT5L2xi9SnvMMLo3cP0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f/r+cEposJVUqZTa3B6wrqxnjROtwHNo/2QL93I1GIs=;
 b=Fj36ysjGSaWbNxHl1ocnrJUNgfjEk2PH4PAFjjlnNXfa3Kggbd04d+FPosRNfXHHLU1YpiD9p7TZ6PaPMqfcpR9up7qR/3zL9NQy0/mL83Y7at0ZBQElyKk7cJEmnZ1c1LAuP8YQkKgd2aGBXoi1HhRzq8LY9NKJ8fjk2S1c6/dPT1wYrQEKk81GAPd10ZHvDr1LwyMYT8vPo2b803xFOZFAFRWp1hjSKgE7vBNTvnj98NeKNL02vqR5Gd2zv9C5Mpw4bi/9fcIAIRo7wZDGRtgvB2hXLg751VW6l7C3mcnOFIQ5Mi9MTqTm9QVadNdXHyjkvPKcFRonvNIqBc289g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f/r+cEposJVUqZTa3B6wrqxnjROtwHNo/2QL93I1GIs=;
 b=sDxWSqJ51osmYcODOnXUCNrytguiPRjPo9AwYSiSZ8C+5R40m0G6xDxseP2FExzeruRe7fPUADT2oesEzPps4uz6W8gJWtHrbMF1MJV3ZOSCqjmY6m3W69vgDGXodOSSSSnczDTp5GPXmaAnBPteD7jxHGMhY4qZYbAKgo6AqGw=
Authentication-Results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=intel.com;
Received: from BN6PR11MB4049.namprd11.prod.outlook.com (2603:10b6:405:7f::12)
 by BN6PR11MB3988.namprd11.prod.outlook.com (2603:10b6:405:7c::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Mon, 18 Oct
 2021 12:18:45 +0000
Received: from BN6PR11MB4049.namprd11.prod.outlook.com
 ([fe80::2091:65f4:8530:1542]) by BN6PR11MB4049.namprd11.prod.outlook.com
 ([fe80::2091:65f4:8530:1542%6]) with mapi id 15.20.4608.018; Mon, 18 Oct 2021
 12:18:44 +0000
Subject: Re: [PATCH 1/5] ALSA: hda: Drop device-argument in NHLT functions
To: Takashi Iwai <tiwai@suse.de>
References: <20211015164047.44492-1-cezary.rojewski@intel.com>
 <20211015164047.44492-2-cezary.rojewski@intel.com>
 <bb2b223e-6318-ed3c-bbe8-31ba4b8d02fe@linux.intel.com>
 <s5hr1ck5bqu.wl-tiwai@suse.de>
 <fe697391-339d-5874-4959-8f0f436280f3@intel.com>
 <s5hbl3m68pl.wl-tiwai@suse.de>
 <002bde61-eeea-a1d7-2392-488c5359ce97@intel.com>
 <s5h35oy5yoc.wl-tiwai@suse.de>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <6dd208c3-e9fb-05db-2c42-264d3ced6073@intel.com>
Date: Mon, 18 Oct 2021 14:18:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
In-Reply-To: <s5h35oy5yoc.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DB7PR02CA0033.eurprd02.prod.outlook.com
 (2603:10a6:10:52::46) To BN6PR11MB4049.namprd11.prod.outlook.com
 (2603:10b6:405:7f::12)
MIME-Version: 1.0
Received: from [192.168.0.164] (89.64.109.178) by
 DB7PR02CA0033.eurprd02.prod.outlook.com (2603:10a6:10:52::46) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.16 via Frontend Transport; Mon, 18 Oct 2021 12:18:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d37b191a-7520-4811-6dd6-08d992316e07
X-MS-TrafficTypeDiagnostic: BN6PR11MB3988:
X-Microsoft-Antispam-PRVS: <BN6PR11MB398842382492D216DE6B1B6CE3BC9@BN6PR11MB3988.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rWaVZCAbhoRvg/iiJ1FYACArbOhx416BtrkGRh/YYpnE7glpw3qbZ1uO1BI+4Tzt4nnHmF/T4xNs71LHnQ0zYxgsqxc9ylv6oXqvAyGAn5g7ZQKlAKLuy9apLS1bInKejVVuap0cv2uq+jmkC75NdqiCvsjuM9niNNvJo5IBGJnqaxx+X/Gj7zgmEtV8L9ZP4lxecuR+FWMKsRwdujdS0AY7bvdslRXHf/SHPJ3AuvniUOrDQe2SMqu5xpmXZACY3+sVUwBQ69dqZ5Kke/YgCyKu3RFEronNWM11qnxPvMwEidhvCecONytV8Vjlgls0yg1SVPr7VHZvqGGDpb2FdwzKNIHXIRcGkI5wwtME1vnm4XJXOoAvqMSWE9CDKq4YwfTq+9M4Cc11R0XEVl7/oyJOwLlYm5hk+bUVc8qjGKgaYU5825T6EtdyYDqtVQbc1zMQHgYfeq7EeImaqiU7meEYpB9tHlXP0lBJaR5LMwCxGVLRF9gV4hN3kzmV6X6UADOB4+4OPJZkCXcmHyg45jGNvXhIsCyJWzZHoGe8tFzFoaNih0k3avBRswfiqKKMbpgqiureKKVvJRRciPruO0WN2EwsWTxN6S3mOK2EYn1CpqxZ4K3owR7DRQEzRKOYZM6zkwqigeAbFcp53zSLLAfARMIK+pFyXlb2bOknzQCOfUf+uapy8AdK7Vmd567MKOA/Z7j2EFfRBQyW67MYLxcGxXNu+l3nBp+b4aLUAdOB3uGLPwkUXEAbkzVtQBYO2+9mX6nvSWDZs55V/W0k0A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR11MB4049.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(16576012)(6916009)(6486002)(8936002)(5660300002)(31686004)(4326008)(66476007)(53546011)(38100700002)(4001150100001)(82960400001)(44832011)(316002)(508600001)(2616005)(36756003)(8676002)(26005)(54906003)(66946007)(83380400001)(6666004)(956004)(186003)(31696002)(86362001)(2906002)(66556008)(21314003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OTBFZmoxK2YvSy9JSThycHNwVnVEdFl2LzJHZVdtK09oSTlWcXhGNnF3ckRG?=
 =?utf-8?B?cFhHc1hUNFZnZTJleFBnK1B1L3lCVWo2TGloa0JBYmgvK0IwaHFmQXByUHlI?=
 =?utf-8?B?VGJGbU1LZTl4UWlraDNSdnozUkJkYjRxTElDbHJMQ093TEpCZTkxTFFGUWE5?=
 =?utf-8?B?SlZ5OXkzaU9hWGxjOTAwS0FYNUlPbXZORXhFaTF3WjhFR0tsQTRNN0loYTl6?=
 =?utf-8?B?b0VYZTNzbHlCaGJxczhxSlNFbUl0aEJ2T2UzcFZZT050cTVXMnBKUkFzZzBM?=
 =?utf-8?B?N1NLTDFCb3lIM2ZRS0QyQ3Y4aDJjeVgvWjg4Q05GSHkvWVBPUWNtQkZWeGdH?=
 =?utf-8?B?eHdlb1diVC95dmZ1dy9Cd2dYYVIxTW5uOC9qd0tNQjEzV1dsUSsvbzN1VkRL?=
 =?utf-8?B?NnZYZlJQQk1rTG1nT0hBTDZORTRVVUc4akZUc1RkOENmazFUU0xTeVpXcDFB?=
 =?utf-8?B?OHBMcXNVRmhJcUlTUlBCRjBpYjlTbHk1SDRMNWdMczhFTGdmaDZNNkQ2ZVlQ?=
 =?utf-8?B?ZkNxVlFCNEdZUEpudlh4cEd2UUk3RklUOFJmODRpVU1QS0VSdW15Q25yRUt1?=
 =?utf-8?B?S3ZQdDQ1NWVSWlNvZUl4QXJVc2tDMC9qa1lpb09oL1doVE5Nbm4zVTM3azEz?=
 =?utf-8?B?WDM0UVZ1R08yZGE0S2gzSTV5UityaFRqY1JtaktHaEtlejl3NUFPamRCQTNn?=
 =?utf-8?B?aWdqZ3RoU0tmU05vOG1xeTJWRXF2OHhHVmt5dmNQQWxtL3kxcnFERDBIZGZi?=
 =?utf-8?B?N2cxdGk1aklmYW5RMHo1OWFMcmhCc1l6RTJWN1dxZFFIODdORkhiWVNiSldN?=
 =?utf-8?B?czg5ODhGSkZsaC9UdWxTM0p0cytsb3M2VUQ2N3dCd2ExckRiYUdIQVl4ZFlF?=
 =?utf-8?B?ejNVUVpFanhHSENnUkh6UXRjZ1R3ejZOL3BMZFNWN2kwMFRJb0UvMExBaHI0?=
 =?utf-8?B?TWxVM3Q5ZFB6OE5QMWJQV2VkKzdJQkEwSnQ1bmJhbzRWYnJucEVWRy9NQkNp?=
 =?utf-8?B?akdOUmJHSEFFSDJ0SGRXOVZ5R2xaM1FjbnU2YlExWHdrVVNUU2tpa0M5NFZx?=
 =?utf-8?B?WFpBSGs5VG82MW43Z1FiVEFPaHV0UUtZZm1EU3doVURDMTJScG5aQTBqcTcr?=
 =?utf-8?B?bXBWNi9mbS9vL0t0c3Q2cjdnNmg5dTF1cEVEUjBTanNBMHhQN1F6VXhoWjNr?=
 =?utf-8?B?T0JodVZBM1UwOTFlb1FnUnFDc1Q1Z1JXRjNMRm9na242S0FIKytLWFR2UUsy?=
 =?utf-8?B?TXR2QXQxaVRQOGh5UjhZdmd0TVoxU1p6N2d2NkxrRlhydGxqSkV4RUFSZlpT?=
 =?utf-8?B?QkxtN2Ywb1JKeG9Wa0wxSFVuYi9UWGdnbCtLbHhhTGM3bWpCV1JoUjNiNkI2?=
 =?utf-8?B?YVlSQWQzdmQyOUF4NG15NVNTcmtkT3o5TlBkS3BMUlloSmNueVZPZ241Zm94?=
 =?utf-8?B?cXRHUXhmcUJnbUxGSytZanV5a1p2Z2tsaDF3SUdjOFBxMnFDVTlLT0c0WG5a?=
 =?utf-8?B?RVY0ZHoxOE1YRW01RTRoUzZEbGd2Qnc3dGVjeGtpODRKeVlPTHRhay9Kd0cz?=
 =?utf-8?B?NisxWGdYdjVpejBCeEJOeEJteXhzZitLWGFIaEtwY1huR1dmSGVTVGR0TFQ3?=
 =?utf-8?B?Z00yS2pkNXNwU2RiOW50OVJVMFN3S0dpbTg1cXc2bHBnL05sdk1tYU9XVUJF?=
 =?utf-8?B?b3ZQMFBVclJSZG43Qm1kK2dXV0l2Q1JwWXpHZytGWXg3c0pQK0RFcFo5ZHQ5?=
 =?utf-8?Q?5UBcAL902x4u4q20ytvFL+l3Tr57ZFq1e3BXWta?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d37b191a-7520-4811-6dd6-08d992316e07
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB4049.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2021 12:18:44.7938 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: clX/H1Ehi9kT9fUY4BCnHDmvlXhNZIXjUOjf2VoUFk9WqLx04vkCwHJ+X3IKZyWDoUR2e/ke6uJZAsnBDCHG8qjmlK2OaCxEs1N6Beuw9Ec=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB3988
X-OriginatorOrg: intel.com
Cc: alsa-devel@alsa-project.org, tiwai@suse.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 hdegoede@redhat.com, broonie@kernel.org,
 Amadeusz SX2awiX4ski <amadeuszx.slawinski@linux.intel.com>
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

On 2021-10-18 2:01 PM, Takashi Iwai wrote:
> On Mon, 18 Oct 2021 11:07:15 +0200,
> Cezary Rojewski wrote:

...

>> Well, most invocations that end in error will cause stack of
>> error-logs (dev_xxx()) in the parent driver. NHLT reads:
>> Non-HDAudio-Link-Table. The name itself points reader towards
>> sound/hda already.
> 
> But then how dropping the device information would improve things at
> all?  It rather cuts off the link between that message and the later
> one.
> 
>> I understand that not everyone will google "NHLT"
>> and such but then there are ton of kernel messages which won't guide
>> reader by the hand anyway.
> 
> This can't be an excuse, we don't have to follow that anti pattern :)
> 
>> "NHLT table not found" is configuration problem, not a driver
>> problem. Mixing BIOS/config problems with driver ones leads to
>> incorrect conclusions what we want to avoid.
> 
> The configuration itself makes sense only if it's in actual use,
> i.e. the problem is always tied with the driver.
> 
> So, if any, you can put more information around the message mentioning
> that it's the configuration problem and what to do for users,
> e.g. check your BIOS, etc.  *That* would be the improvement.

Ok, I'll think about better solution. For now I'll just drop this patch 
from the series and send v2.

Thanks for the discussion!

Czarek
