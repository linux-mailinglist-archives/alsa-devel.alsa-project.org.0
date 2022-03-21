Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 818824E246D
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Mar 2022 11:34:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1503A1706;
	Mon, 21 Mar 2022 11:33:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1503A1706
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647858883;
	bh=PAYxNAiYjLXPCJ3j4ttahmDu0ryFTGcb8kvUyv8GdA0=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=q/Z1rILmFIWoQY31EByadUaMH2O8eke4jHn5U0H4u2c4++hnAxixo9GzgkfFZ8x/G
	 +mxdnwoY6IiX3k7CFknhdycp6nid2Jd2hOY6pO1ej5NikX1TF5KzNlu3uTcJOjz0Ub
	 VyxE5Wx07w3c6HsLdO0Y8eNOuFuCK0sdTdVx48UE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 83024F80238;
	Mon, 21 Mar 2022 11:33:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6F5ACF80227; Mon, 21 Mar 2022 11:33:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D2DA5F800FD
 for <alsa-devel@alsa-project.org>; Mon, 21 Mar 2022 11:33:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D2DA5F800FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="OM6/bbW1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647858811; x=1679394811;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PAYxNAiYjLXPCJ3j4ttahmDu0ryFTGcb8kvUyv8GdA0=;
 b=OM6/bbW1ibMlJcYXsrws5z9y+JyxaEUJqdBclBYPiACOJaOXsR/brj1V
 enEH1/lbmyBu4yFyZEmu/Gq8wCGIi193s10hnfO1LpFRiK4gvTyusFrUv
 6y8LU2Kmws0vwqecqyjWYkpj/XVws2sb/GLt2wR4IFhTZLBqouN2OJqvs
 sVemNd7I0ILy72VmHbe3TNR3IVktO6/LDt4lml6NasL0E3smek0b3g2+0
 H9RaOb7YHCFtoXpX2DmI8BHa04zktkKsVbnrWfbH6BIR7DBLkh1+IGaY3
 LGtxKO6vpuEOvcWPLOn9pJL9zK3F0MK0AmtaTefuG8kAmU44RCfAOuhrG w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10292"; a="282344990"
X-IronPort-AV: E=Sophos;i="5.90,198,1643702400"; d="scan'208";a="282344990"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2022 03:33:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,198,1643702400"; d="scan'208";a="824338395"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by fmsmga005.fm.intel.com with ESMTP; 21 Mar 2022 03:33:25 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Mon, 21 Mar 2022 03:33:24 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Mon, 21 Mar 2022 03:33:24 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Mon, 21 Mar 2022 03:33:24 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.42) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Mon, 21 Mar 2022 03:33:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CRplK0058yRT9SbDFcF3Dl/gKRsHmW1Xi8GrS6I1J9Qgxgmf0Ji1zSCQfFsfc+3tgzADHI2D9P1+HhXh6FnYqyIPu/ih3pc2rKEGl/aJxAJMi/HRpDBnd9gyXvrrflIVgDKH6U53Fn3LBCJl7Wazcj9VCmUZXjSpoyIVr/xHBKxAvTNkuW0oicZIXbP+kyqkiHjelMWPUlsDKXBhVTBQoH1gPuWYnGETc4ifR6fLeqB9WAL2tvpG/lyZ6QAjPGT7IsdyPIjhw5LyM+78RUBMdnO3nKOgHUcmVDfC0b07SYHE6cgU3d1iCm7yldN4lC0Azu2ICzNHoE0eP44JdIruIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jl5nRL1IGxaR16gAY7Tx4cXJ5ACbBzYS7xm5sxPMt7Y=;
 b=NJ3F3Di9yV536zBQMDC8hu1yLOdl16kBVMoJ8ycAbcoEj3oQaKzh60Y5wLqk52fLq0TlioUN3TjgZAUixKokJIJL471TT8ZCCiVu8dU5W+eEnixqpomaOnpIqNw9OxXfRKlxxds+eKjIgeKU17J0Xcb3eq0cE/OLA0TobXlVjOGkIsq1lgh74cfAEzJmb9NBqQEE6unslwrxYe+SUjPjtFdEWYD6x+pqBKsGaMqcYOY/4hp5iQ0YjrJ3BU+2bUB82A7xu0lweGxI0d4iwtQZ8sXPmkXPP086XEHYYI3C31zzC7j1Kx2WwIBXSZiYECPVqBYwdJYujyKXRyi/R32NJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10) by PH7PR11MB6054.namprd11.prod.outlook.com
 (2603:10b6:510:1d2::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.22; Mon, 21 Mar
 2022 10:33:22 +0000
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::ccac:dd6b:b12e:477c]) by MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::ccac:dd6b:b12e:477c%11]) with mapi id 15.20.5081.022; Mon, 21 Mar
 2022 10:33:22 +0000
Message-ID: <f8426c4d-692d-c742-cbb1-f5d3a50cb9e6@intel.com>
Date: Mon, 21 Mar 2022 11:33:13 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.7.0
Subject: Re: [RFC 03/13] ASoC: Intel: avs: Parse module-extension tuples
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 <alsa-devel@alsa-project.org>
References: <20220207132532.3782412-1-cezary.rojewski@intel.com>
 <20220207132532.3782412-4-cezary.rojewski@intel.com>
 <77ce39c4-b41d-88a9-b83e-e1ff3dc23584@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <77ce39c4-b41d-88a9-b83e-e1ff3dc23584@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0043.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:152::12) To MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fe6adda4-925d-4066-a379-08da0b263922
X-MS-TrafficTypeDiagnostic: PH7PR11MB6054:EE_
X-Microsoft-Antispam-PRVS: <PH7PR11MB6054956FE01D2C7DF127906BE3169@PH7PR11MB6054.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +LoZCtFuWGr6zbyW+7iyjjmLYzC3gr9P+YH2h5PU6joqN22eviKi4ZlQreaZ85r7SHQxz+bHsc9nj6vWVzTJ7Axl2nl45qZGYx4BGOZwaNpvXKSHcVW81rwkBaEtKcoNATTY3+zOarkVDB2WJ+jr+FIWlIn1U38sKmaB7T0pGji4DLERdEi9y0xfZasXNgo8ndcVyUbOMQFqEq8rYZoK4s+OazQ4M8/vOsb3R3soiKI1EBnKCTzJI8WW2OjSorwnog1wWyfcjk8MySM3KRgmpK5r4HJe1cdQvMj5NBWY7DQRxIkGf9vNWPwOlndyDYrseOOBgw3dq+yRZTyf5+uqgLgf+/9ItfNwJ5p8M0xZNmVESgtgy6fMrDgKizgGVUy55GNge2W8t8Con81CKSfAoiVi9e5urtsX8dagLSNMvyMmKTQq7Yxgk6SXmyZc6qw6B1J7aibaN7+2PL4naCWr7H/GSgbyD0/pPWRmlc48fuBOH7YhkewSrQFzv65XG0vVYQSPx3RJs8cx2v9lDxN1kwCWOWjV1QNp4OrWG5S9AuJQdgN/mKghoNbka1dhZKtzHq+65CE/0kcYNLpIixq3oFq2BbMMorX4aWjTn1KjJ4KHS99RrpQ0inr9u42Ya2SnKxOBKf+359uB8H+8HE7pEZJt72ilQQRMlFezO8ucZTaY4NWvgbJN9AmDK/Eg/GSA6w1CzgmDMW0s4qaQzzRb+ofnyCNKygnx18uNbv/at6gAanxAtKAVcHOc+gdOaIHo
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1101MB2157.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(316002)(7416002)(82960400001)(86362001)(508600001)(38100700002)(6666004)(31696002)(2616005)(5660300002)(66476007)(66946007)(4326008)(8676002)(6486002)(6506007)(2906002)(36756003)(6512007)(8936002)(31686004)(26005)(66556008)(186003)(53546011)(44832011)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZmI3N3ZibEhsbTJ4N1l6eGVHR1lZb3EzSlNQODFoTDM5RThMVENDVDBtRnEz?=
 =?utf-8?B?aUpzS0s5Rk9wci9BQUtDaVF1RjhGVk1rK1ExVlgvdnZ4R1FSaVdPSFhnQkY4?=
 =?utf-8?B?Z1ZOdHdIaUswSWFMTm9CUVZ1K2tPMXN6RlJyejM0SkRHZE1rT3FtM3VqS1R4?=
 =?utf-8?B?MWdQUlpJZktmS05URjgwN1lDZGxqaGxET2d4dGVEeThnQ2wwWGl0TTJ3TDZy?=
 =?utf-8?B?T0JDaXArQXlRTFpoZERBNU0waUNzS2VQU3MrRTRpYmxrdU5ZVGFwY1pWTHBv?=
 =?utf-8?B?bXdyVVFoeWMyN0QwMWZuQW5RYngxdGtqTUl3aW5VVXh2THpSMTd5aVFhMGhi?=
 =?utf-8?B?S3MrbnUrVU9IOWVETHpZcTJPdlNHK2NQOTdaVU5wVkFlWVNkS2pScDVWWStO?=
 =?utf-8?B?V3VSa1JhYlNnam0xcVRnVlFKNVg0a05uMU9wNVlGdkt1Q0tRSzN5N2JLa0dh?=
 =?utf-8?B?TXQvR25wRmREanlRODM3WjFJZzdkWnhiSnZzK3ZNQWthT1RXY016SHQ0LzhC?=
 =?utf-8?B?T1ZFMzZvUWdsKzdWMXJ6Y040Zk8vUW9pQjhjUE5mdUJoSFJ3TXY0amp6NVB1?=
 =?utf-8?B?VXg0dUs2N0RYZ1d0aS9KYmg4cVphbGNwdVV4bjJyOHNyWXY4TjhBMmR5aWxJ?=
 =?utf-8?B?MUxlY1RCUVRhNEwwTjAxK1lCaGlUY0laemswV3hVUnUvQ3dYMXdXai8wTEZR?=
 =?utf-8?B?Z1oxNVVSMkVNM2liMzdjUzJWS082Y3FUZUs1MnBIbjZJZElFVDNPdjlRZDBM?=
 =?utf-8?B?cWtmL1dyRjVLTE9ScHlwMmN6clBoem4vZGhYZHpEMWhLSVdxVkpmY3BNajF2?=
 =?utf-8?B?RlpMTlhjcmtMQ2JScFUyTndRU1RyQ3RxNmFFL050Ly9Hb0ZndW85K3IybHVB?=
 =?utf-8?B?YnRWbFRPa21DMUJKYUl6WXhuL0VDN0x5RTRabWg2ckxQZ3BucDhQQzFzMGt4?=
 =?utf-8?B?V0FudTlFR3I0cE9vR2dQK1krTTdyT1lQZjV2SjNkM1IxS3g1b1lVSHFseEJZ?=
 =?utf-8?B?MW13bVAyTldVSXRxYzdPVjY1aUVMb2ZXaU1CMmFQZldEZmdQS3VrQWYwKys0?=
 =?utf-8?B?REJaR3JoKzRXWGs1NlBWZHM0Njc2SDRCZG95SUlJN1FKR1Q3bWlScjZKdVo3?=
 =?utf-8?B?NVl6K0FaMjRmS0Q0Z0JEOWlpU2kwS3E4akw1endJdHVQOVA0VG1PQ2NkYWpF?=
 =?utf-8?B?K25rMjBkc01ncWt6YjMyZzI5T0RldVFaenU0L1lsckxzcFNHd1hjT2F3UEhL?=
 =?utf-8?B?aCtZWUtoOUM4Rllub3BZVzcrbTNib1VQcVZHQ1NIRmtXVHR3YVdLVC9FSnFR?=
 =?utf-8?B?V2FmdUt3ZEIwYlJvR21DNC9RWithZzgxZ2hsbkg4UThaYndIWnpMd3VnZzRz?=
 =?utf-8?B?dzZnbXkzVWZGSmx2YkhCa0RHeGtwWC9RWXFuUEtOeXczZUhhUi9DWXp5N0Iz?=
 =?utf-8?B?MkV3a2dUaG80SWh2bkloZ2xiWjZCRXB1QWdYazNqMzN6SlZXOUMxTzVPbGdF?=
 =?utf-8?B?Qk96VzVQRkJ6N2dwNFEzMExlUE1XcVJVYjYxeGFRWU5HSVlhNGVLb0NOK21q?=
 =?utf-8?B?NU1NTEdtQmt3emNuUkpnSHVBUkV2VCtOdzlRdHBHMkFUTWpMZHFhZTNkZjc2?=
 =?utf-8?B?cHM1Sm1hUUZLelNLVlFZd2dIUWFLczQxTzlueU5KSWxXeFpnYnNKdGJYdkxs?=
 =?utf-8?B?TVRueWJPR3FSZ2xtUWczSlNTcGJ6S09Ebnc3eldkdDlhQ2pvOWZuYnhLTUxD?=
 =?utf-8?B?VWc5NVBuY3FTTDduRUdLSUJxVHl5U3E3S2hBdVd5U2tEODN2cFV2NWY0eC9Q?=
 =?utf-8?B?QUdMTFhvNVZ1THJmdnhrMmRjbEFNalY3ZWdoYjJNRTVsQjBjTnhsY29xV0cr?=
 =?utf-8?B?MDNTeTEzS0poRXlyUFRXd0V5OVF2ekl2REN3T2greWhzS0cva05uQzExNkdk?=
 =?utf-8?B?SUZkcFIwY1UwOWpvbmZuaE1xcE1ObEcwN09IcFk4ZkJuUldnSDBrbUZVd0RH?=
 =?utf-8?B?ZXJ5NHdWWGJBPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fe6adda4-925d-4066-a379-08da0b263922
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2157.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2022 10:33:22.3611 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +y/etjwtl4HfI/DFxdM0oMSVfjh6/IIIbwMr+TY8H7j64YBzpJP0EnEYzdvR4QduEl6rBog7LN0bi6uptfPFTuMPsdK7NcJc6P8FzuSaxeQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6054
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

On 2022-02-25 6:24 PM, Pierre-Louis Bossart wrote:
> 
>> +struct avs_tplg_modcfg_ext {
>> +	guid_t type;
>> +
>> +	union {
>> +		struct {
>> +			u16 num_input_pins;
>> +			u16 num_output_pins;
>> +			struct avs_tplg_pin_format *pin_fmts;
>> +		} generic;
>> +		struct {
>> +			struct avs_audio_format *out_fmt;
>> +			struct avs_audio_format *blob_fmt; /* optional override */
>> +			u32 feature_mask;
>> +			union avs_virtual_index vindex;
>> +			u32 dma_type;
>> +			u32 dma_buffer_size;
>> +			u32 config_length;
>> +			/* config_data part of priv data */
>> +		} copier;
>> +		struct {
>> +			u32 out_channel_config;
>> +			u32 coefficients_select;
>> +			s32 coefficients[AVS_CHANNELS_MAX];
>> +			u32 channel_map;
>> +		} updown_mix;
>> +		struct {
>> +			u32 out_freq;
>> +		} src;
>> +		struct {
>> +			u32 out_freq;
>> +			u8 mode;
>> +			u8 disable_jitter_buffer;
>> +		} asrc;
>> +		struct {
>> +			u32 cpc_lp_mode;
>> +		} wov;
>> +		struct {
>> +			struct avs_audio_format *ref_fmt;
>> +			struct avs_audio_format *out_fmt;
>> +			u32 cpc_lp_mode;
>> +		} aec;
>> +		struct {
>> +			struct avs_audio_format *ref_fmt;
>> +			struct avs_audio_format *out_fmt;
>> +		} mux;
>> +		struct {
>> +			struct avs_audio_format *out_fmt;
>> +		} micsel;
>> +	};
>> +};
> 
> I am struggling to reconcile the notion of 'extension' with a fixed
> structure that deals with Intel-specific modules.
> 
> How would a 3rd party add their own modules and expose parameters/tokens
> through the topology?


All vendor modules go into 'generic' bucket. Vendor cannot define any 
specific fields i.e. extend the 'generic' header structure. Everything 
that is specific to them has to go into so called payload that is part 
of almost every INIT_INSTANCE.


Regards,
Czarek
