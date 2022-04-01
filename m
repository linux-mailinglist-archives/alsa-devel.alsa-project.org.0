Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B914EEDC8
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Apr 2022 15:04:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 811D2181C;
	Fri,  1 Apr 2022 15:04:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 811D2181C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648818298;
	bh=BnM/v1P27Von819kZQi4VHbhREfIJNMl4ONjJNEMBbE=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pIj1UYSTjMAk084MP9xMj25AhkryEYNtdpiS8kpooRb6QwpNHFwL71k84sqyKbPM/
	 iMtqoEv7miQ2buo7RaCL2LDhm0BspUAplWI7d2iacJ0TpOGeXUMxJK2tMZJmmjB/KY
	 Y01n2Dpa/wt4YJs8L2IuKYgfQrK1CAgPamjz5Cwo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EC17FF80109;
	Fri,  1 Apr 2022 15:03:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1D08DF80279; Fri,  1 Apr 2022 15:03:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D5AAFF801D8
 for <alsa-devel@alsa-project.org>; Fri,  1 Apr 2022 15:03:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D5AAFF801D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="kp7E/Qnz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648818226; x=1680354226;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=BnM/v1P27Von819kZQi4VHbhREfIJNMl4ONjJNEMBbE=;
 b=kp7E/Qnz79UstD/oqAMaeMHwRpqhHYBTVEghi/JAPNwqBQJ9EH2CDaS+
 oX7IbEyIwrsTKmsksPC9wAVqODQ42G9RS4hIqdNeyfsFxTSsrPwBGPSDs
 fZJfIRtYqZN9EvRA0WbsvgORBfwXVLZaPraCx9V1QhURX94q8PzsOAYGy
 LDD6td2gFyXJeHQJwMAnsMTZZhVoyrTBDrxuCTBiflcmbRgXP4fm64T5Z
 z87obf3Glrpa3zCsKQwUekuBjNMzIcDvgP2HLPXYLQ3AersSLbvrIFqhj
 CCjzrHEaq4Jx19SW8E/lOV09PJepy/6v0CeSq9Mce3Ha0wPvDLTmjVwAA w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10303"; a="260118211"
X-IronPort-AV: E=Sophos;i="5.90,227,1643702400"; d="scan'208";a="260118211"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2022 06:03:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,227,1643702400"; d="scan'208";a="522769721"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by orsmga006.jf.intel.com with ESMTP; 01 Apr 2022 06:03:41 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 1 Apr 2022 06:03:41 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 1 Apr 2022 06:03:40 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Fri, 1 Apr 2022 06:03:40 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Fri, 1 Apr 2022 06:03:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FVNjSX4j5P+8h8PFs2PEyLfopzn23ciFP0+oJrLMBXsRqsQQbhFu7ZP5JE5sWCL32Z1RAQRenirBMPIYgCaAMPFBsnHDSXBdaa41kMDvDMCtm/qCV+nn5TyEKc5fdWjlXTV0iF1hzQ8hdTMhzoXM261kNT3Pxyr+g3iTcIGPfa6kNus7pirvpbbGAyCVna2zjURztSuJe4kLGzy4AVyiI+RQPBbZLxaShbAFnJ3s8Rao7ImcEzlZsUJChpDx1D5hwq8FS3/D2cAEe5l3z3P/eLxLOX1R+uoDNSMDjtDrY3ygKshRJGGGa7lkHSScYoiB3+zr/JgyAwY+UOttqqcXwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bqnPwIP3cRL/8jMlq4CUHvSU7dtTyaP9IAiUuqut10U=;
 b=mTosue6YgRfyzkeyaFZRAsElXNEVuZ7z3U6FUhVu7JOFddk+A6UH9wI8nNSssrFYK+r5bzPj5m1vSj7S7noOYYiN1PFqq81m44TO19Ms8H+wao6wZauKaW8ofZ4afii0d8VsQqNyyEvs7MPdbNHo0JY+6i+1JRPlDcxsirD9YO8MjJwYgAYmxiMf83ThoJkCeuAgFKtNcas+79rzh54f0YwDvdF1ExAYqR2b2wU9i3Urs4ItF1SsCDJsgWXCJxDBIci5wjUxX2Y9AXjCgxJqgeaHBUyrNVIyJoPArQFqZy7T0/HI5EqqcVwRYT8ijx9b+oE1PRj7IA5yWVqzDStPkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10) by DM6PR11MB3196.namprd11.prod.outlook.com
 (2603:10b6:5:5b::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.19; Fri, 1 Apr
 2022 13:03:38 +0000
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::ccac:dd6b:b12e:477c]) by MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::ccac:dd6b:b12e:477c%12]) with mapi id 15.20.5123.028; Fri, 1 Apr 2022
 13:03:38 +0000
Message-ID: <6738695b-c0cc-5841-4326-6eaeb356148c@intel.com>
Date: Fri, 1 Apr 2022 15:03:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.7.0
Subject: Re: [PATCH] ALSA: jack: Access input_dev under mutex
Content-Language: en-US
To: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
References: <20220401122931.4181700-1-amadeuszx.slawinski@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20220401122931.4181700-1-amadeuszx.slawinski@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DU2PR04CA0255.eurprd04.prod.outlook.com
 (2603:10a6:10:28e::20) To MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 52d25fa6-0b5f-49c9-8a0a-08da13e009a9
X-MS-TrafficTypeDiagnostic: DM6PR11MB3196:EE_
X-Microsoft-Antispam-PRVS: <DM6PR11MB319662E7D4427080A4AA962DE3E09@DM6PR11MB3196.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bWTLpvYpmiMzwqVRF8kifl2qZSzfwuj/LAETF55RRSyYdLbwUTqRKMv3leT/Wt0ZDluNkRg6UijT+VnPOX3yOBR2ZnMkS4F7p2OMdnO1EJSZIPWK9ZDvtsz/hFY6+KiOw3xZCloQGUiggGVIWmdxXobk517NQuBVX59I/MTJqfW/9cX/AWIxaD2oe4xO6sUftqhGKDeyijOUluTAOo6UqOYPCAKHCFF3KiWW0Z7GPa6cFBgB2fVPU5m8rkiqV0lFJbWyQpV5Kp5qUme8EUTLBxXpdg5ceLpBRXkLvZbOdEmgLgamh7xkzk2nH9ZLiZVpgqtCHdDA5eCKQ2pZoMDivSSn+68rj505pKGhdQC76y8kwmrDEWMe0XuGdHpRatxq4VozvnpNPSwkdla8apmzkG8Wx/GQkWN9Kn1XFmxTheDCHKmyITuTmbdZzta9KW5dJgYs443kB0iboJHjRBNgWDoO2LfcDP/2TN4fDOm4ZZVkjdBWy9wgTnUN1r+VUEp+on4/9c2NUiHqdsvgCkKr6QRIYaPJrg4/jcl+rpP652ptI0xoPfdb5Ovzss2th3ugjwOvqesTaOwuJCXSWMYS5WlBXnJqNYCf2Ls+K2UIadXM7A2Mpvo5u8Zq46BHFGJ15VUbBAYbv8AY6/TGNKGFbpRsJqlbH0AYo3WBuG01BqKEkH1uHFipYxdXVzY0DpZpYefefuZ7VJatxLj6KgqazjzF0o9lMhYwL50TBDz+4TY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1101MB2157.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(31686004)(4326008)(36756003)(6666004)(66476007)(8676002)(82960400001)(66556008)(6916009)(31696002)(86362001)(316002)(38100700002)(53546011)(83380400001)(66574015)(2616005)(6512007)(8936002)(6506007)(508600001)(5660300002)(2906002)(66946007)(26005)(186003)(6486002)(44832011)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U0FNRExGWmU4ZTNqb0hKUlNqZmM3RlZpcnp0SDVHWE16YnVSaXN6QWdKek9i?=
 =?utf-8?B?NitOeDRVeDBWZ1VUR1ZtcUtGQ0xpVzFDOVpFTHZxZVRyUzdPUlRadnJ6L1Nn?=
 =?utf-8?B?aG1TWDV3enRzb1B5cTBQanJiTW80dng3WGhJQzF0Y05Ga0lqamxGVGJsaG5E?=
 =?utf-8?B?K2hBdDdRR2RQbGtJL1NSK2s2V0VpalRXTlNjc01pVFFSbEl0STkvVnowb3ow?=
 =?utf-8?B?ME9McjAvNkJPNmZYSGVHU1loVkFxc01WUU96QTBaVjY3YjF1V2V5U0lTeC9v?=
 =?utf-8?B?NHE4Nml6aFNZNk10YmpWOTBDcnpXK3BBS3NscXcvWG81aXcxb2JIWUxzejlh?=
 =?utf-8?B?NjhXd1ZYN0swM0xwTTJxVkY2d0UrYXFBUWxicER6L2M0aEdJUGVPSGFDeEZZ?=
 =?utf-8?B?MXhna1RDS0FkMkpXNEQ3QUpaWXE5bU1DTkI1OXAvZ2hDVERHeEFEcFZvYWJX?=
 =?utf-8?B?ZWxwMTV1cHY1bGt5RUJzdUJsc1B3N0xpd1l2amMwcWVPYTVVYkVhSjVIRlpU?=
 =?utf-8?B?bDhGOFhNV0c5NXhnbFB4T2ZYNEpZN1ZrVjJqYUpLa2xYMkhaTS9SN0t5UG03?=
 =?utf-8?B?TmEweEJTTTFSeXFLaXRQRXBjVHR4WDJaRTVSS2tBY3BpbFNpcHFWWWRuZk1h?=
 =?utf-8?B?TnllWDQ2ZmhiRzNLQktmREQwdnVWU0NWL3RNZERQUCtZNDdHUUVhYU5Fc3RM?=
 =?utf-8?B?M3UvRzNlN01IRjVqQjlkNUlqZzlhcXlpUDkrcXlBVzkvYzlmWFQ0TXQyWVAz?=
 =?utf-8?B?NkxYVFNlZ1BwTjA0eEZFbGlmZjgxVkFTcm9OZmhHU0Njazc3N2t0dlpEZlJS?=
 =?utf-8?B?bWxDVnFBNVZoeUdkWUxpZ0gxbDJUeWtmcGdGOCtyQ2NRNm9KODJnTzdjN3Jn?=
 =?utf-8?B?a1hWRVpxR0Q1QzYrZ2tsNXJjSng1bkFpcU56Ykd3REIyenFPcC9DRTV0djRu?=
 =?utf-8?B?TEdiSDBBUWV4STlMbnduNWdBTG9ueFlhcjRmTUM4YUhZTkxjSTEzcC9wMkFT?=
 =?utf-8?B?RHkrL0xsQjU5V3lzYW5YNTRJMFN3QU1FQWY3WEdvelJtVDE4ZUp2Q1R6OWwz?=
 =?utf-8?B?aGZtWkxUZVRZeEtlaGVkSWRQcUI0UVNIL2kxRjcvQmhUeHp4KzRpZWVwdTl1?=
 =?utf-8?B?L3czTDF1Q0RkWit0SC9SeS9tYW9pRGFtdVNyejRDVUZxbStIUmxvSTRTbXhl?=
 =?utf-8?B?ZzNORE05Vkx0elorc2hLQUtHOWlTWG9Eakhwc29hZHJvMW04Q05DRjM5UWxq?=
 =?utf-8?B?UkZ4ejZ0dzllVzNqNnFYN3J1a0p3cmE1YmF1REwrTXk1OGtCSzd4KythN1pv?=
 =?utf-8?B?TVpBazJ3RitSZ3F0cDdEeVMzbEtSOWxmUWlTQlI3cjB4THY2Y09ya2g3OWg5?=
 =?utf-8?B?ZGd0K1VZNERycElZVUdmYjh3UzRBOEhjSDIvOTBqbFFwSHgrVTZrVzBESHZS?=
 =?utf-8?B?T0tKbU45Tm02enF5WXorSkFDdFJrSXFnTEU0bnBuanIvYlBPbHcxSU8ySGto?=
 =?utf-8?B?Tm03bEJKTEt3c3psOGxkc2dkK21nc0dIa0JsckF1SEg2SzEvZjNuYnptQVhQ?=
 =?utf-8?B?M05DdnhENGpwdG55WWZVL2trRUNValB4KzRrTDZVaCtXM2dyMFM0QjAyWUY1?=
 =?utf-8?B?cms1dUVvZUtqRjdzZDIxcVVpR2dDR0dEMkh5ajdVYUVORmU5Y1dKcHZpSFlB?=
 =?utf-8?B?bWhwRlVlSVhoNDYwcFFRdzF1TkdmNndpeU1XWjViempMQTNrZ2JTR3YrZ1Fl?=
 =?utf-8?B?b3h3aFAvaVhURWJnZnMxR3plNDd2TkE1ekE4Ry9xbkZZQUkrUWJPNXhtRTlh?=
 =?utf-8?B?bVBBSDc1M25yWWZkRjUycFNMd2ljN3hQNkdHb25DUUFMVS8rN1BBNnBYckVv?=
 =?utf-8?B?S3VWWU8rTE9qWG9pZXh5S0ZURHRWRmY2QnM1Uk1Rb0lRR2h1WExHRmMxd1Rm?=
 =?utf-8?B?a2E2aDZTcU9CNkdDUUU2TFR0N0dQdFBMRlJKTUdOWDVYRXJRVTJTbXVoRnBh?=
 =?utf-8?B?RDcvbk9tVnBrWGR1UVpGOGkvOE1xQ2Z6S0IxWExFd3VEL0pBK0lBLzVnd3B0?=
 =?utf-8?B?M0hUZis1QTBsYS84UndhaHdKTVVLWGVrcHNmbXRCZTdueWxic0hzbkpNa2FF?=
 =?utf-8?B?ZUQxWHUxM3M5UHJZZ0h5eFFpSWw5WjcxMWVjb2RFZms0eTZ1d3Jta1p4aE5L?=
 =?utf-8?B?Y05RZUZ6eFhrTXhjU3pMSC94K3ByaGR6dDhLKzhGUE81MVlRR0ZaVkRmUEht?=
 =?utf-8?B?VDN5S2lpOVZNT1hkOERNN1RpdG10OFZML0NlVFFKTGpMK0h1RzM0WjBlaGIy?=
 =?utf-8?B?WEY3L1loc2pVL24rSnhQY244QzFLUVlsaVpvWU80KzdzYzExTE5pZmdURzY3?=
 =?utf-8?Q?2BRVx/m/KFOtWo/s=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 52d25fa6-0b5f-49c9-8a0a-08da13e009a9
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2157.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2022 13:03:38.4554 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z8t+i4WmlwfgTyXUMfVC31NMw/7iVF73W/TtB7Z96FJIN54Rigjq1UKO9QXDm5M3RykuPVhgv4U5NVxhR3CbGC7D24h7p+NoO4MOrxy0T1s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3196
X-OriginatorOrg: intel.com
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>
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

On 2022-04-01 2:29 PM, Amadeusz Sławiński wrote:
> It is possible when using ASoC that input_dev is unregistered while
> calling snd_jack_report, which causes NULL pointer dereference.
> In order to prevent this serialize access to input_dev using mutex lock.
> 
> Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>

Nitpick: "when using ASoC" is quite a generic statement. By that I guess 
you relate to concept of splitting audio functionality into smaller 
logical blocks - components (struct snd_soc_components) - and the 
possible synchronization issues that are part of that division.


That alone is probably not a reason for re-send so:

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>

> ---
>   include/sound/jack.h |  1 +
>   sound/core/jack.c    | 37 ++++++++++++++++++++++++++++++-------
>   2 files changed, 31 insertions(+), 7 deletions(-)
> 
> diff --git a/include/sound/jack.h b/include/sound/jack.h
> index 1181f536557e..1ed90e2109e9 100644
> --- a/include/sound/jack.h
> +++ b/include/sound/jack.h
> @@ -62,6 +62,7 @@ struct snd_jack {
>   	const char *id;
>   #ifdef CONFIG_SND_JACK_INPUT_DEV
>   	struct input_dev *input_dev;
> +	struct mutex input_dev_lock;
>   	int registered;
>   	int type;
>   	char name[100];
> diff --git a/sound/core/jack.c b/sound/core/jack.c
> index d1e3055f2b6a..58b9ebf5e7e1 100644
> --- a/sound/core/jack.c
> +++ b/sound/core/jack.c
> @@ -42,8 +42,11 @@ static int snd_jack_dev_disconnect(struct snd_device *device)
>   #ifdef CONFIG_SND_JACK_INPUT_DEV
>   	struct snd_jack *jack = device->device_data;
>   
> -	if (!jack->input_dev)
> +	mutex_lock(&jack->input_dev_lock);
> +	if (!jack->input_dev) {
> +		mutex_unlock(&jack->input_dev_lock);
>   		return 0;
> +	}
>   
>   	/* If the input device is registered with the input subsystem
>   	 * then we need to use a different deallocator. */
> @@ -52,6 +55,7 @@ static int snd_jack_dev_disconnect(struct snd_device *device)
>   	else
>   		input_free_device(jack->input_dev);
>   	jack->input_dev = NULL;
> +	mutex_unlock(&jack->input_dev_lock);
>   #endif /* CONFIG_SND_JACK_INPUT_DEV */
>   	return 0;
>   }
> @@ -90,8 +94,11 @@ static int snd_jack_dev_register(struct snd_device *device)
>   	snprintf(jack->name, sizeof(jack->name), "%s %s",
>   		 card->shortname, jack->id);
>   
> -	if (!jack->input_dev)
> +	mutex_lock(&jack->input_dev_lock);
> +	if (!jack->input_dev) {
> +		mutex_unlock(&jack->input_dev_lock);
>   		return 0;
> +	}
>   
>   	jack->input_dev->name = jack->name;
>   
> @@ -116,6 +123,7 @@ static int snd_jack_dev_register(struct snd_device *device)
>   	if (err == 0)
>   		jack->registered = 1;
>   
> +	mutex_unlock(&jack->input_dev_lock);
>   	return err;
>   }
>   #endif /* CONFIG_SND_JACK_INPUT_DEV */
> @@ -517,11 +525,15 @@ int snd_jack_new(struct snd_card *card, const char *id, int type,
>   		return -ENOMEM;
>   	}
>   
> -	/* don't creat input device for phantom jack */
> -	if (!phantom_jack) {
>   #ifdef CONFIG_SND_JACK_INPUT_DEV
> +	mutex_init(&jack->input_dev_lock);
> +
> +	/* don't create input device for phantom jack */
> +	if (!phantom_jack) {
>   		int i;
>   
> +		mutex_lock(&jack->input_dev_lock);
> +
>   		jack->input_dev = input_allocate_device();
>   		if (jack->input_dev == NULL) {
>   			err = -ENOMEM;
> @@ -537,8 +549,9 @@ int snd_jack_new(struct snd_card *card, const char *id, int type,
>   				input_set_capability(jack->input_dev, EV_SW,
>   						     jack_switch_types[i]);
>   
> -#endif /* CONFIG_SND_JACK_INPUT_DEV */
> +		mutex_unlock(&jack->input_dev_lock);
>   	}
> +#endif /* CONFIG_SND_JACK_INPUT_DEV */
>   
>   	err = snd_device_new(card, SNDRV_DEV_JACK, jack, &ops);
>   	if (err < 0)
> @@ -556,7 +569,9 @@ int snd_jack_new(struct snd_card *card, const char *id, int type,
>   
>   fail_input:
>   #ifdef CONFIG_SND_JACK_INPUT_DEV
> +	mutex_lock(&jack->input_dev_lock);
>   	input_free_device(jack->input_dev);
> +	mutex_unlock(&jack->input_dev_lock);
>   #endif
>   	kfree(jack->id);
>   	kfree(jack);
> @@ -578,10 +593,14 @@ EXPORT_SYMBOL(snd_jack_new);
>   void snd_jack_set_parent(struct snd_jack *jack, struct device *parent)
>   {
>   	WARN_ON(jack->registered);
> -	if (!jack->input_dev)
> +	mutex_lock(&jack->input_dev_lock);
> +	if (!jack->input_dev) {
> +		mutex_unlock(&jack->input_dev_lock);
>   		return;
> +	}
>   
>   	jack->input_dev->dev.parent = parent;
> +	mutex_unlock(&jack->input_dev_lock);
>   }
>   EXPORT_SYMBOL(snd_jack_set_parent);
>   
> @@ -654,8 +673,11 @@ void snd_jack_report(struct snd_jack *jack, int status)
>   					     status & jack_kctl->mask_bits);
>   
>   #ifdef CONFIG_SND_JACK_INPUT_DEV
> -	if (!jack->input_dev)
> +	mutex_lock(&jack->input_dev_lock);
> +	if (!jack->input_dev) {
> +		mutex_unlock(&jack->input_dev_lock);
>   		return;
> +	}
>   
>   	for (i = 0; i < ARRAY_SIZE(jack->key); i++) {
>   		int testbit = ((SND_JACK_BTN_0 >> i) & ~mask_bits);
> @@ -675,6 +697,7 @@ void snd_jack_report(struct snd_jack *jack, int status)
>   	}
>   
>   	input_sync(jack->input_dev);
> +	mutex_unlock(&jack->input_dev_lock);
>   #endif /* CONFIG_SND_JACK_INPUT_DEV */
>   }
>   EXPORT_SYMBOL(snd_jack_report);
