Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AD43E4311E8
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Oct 2021 10:10:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0399518C7;
	Mon, 18 Oct 2021 10:09:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0399518C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634544610;
	bh=3tvmS7p+oLAshq+CgtchcamZf0zSU3b8zwkCLA3BPDE=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iksh7SIgugB2qd735+Dxhk7UBIxRSukN+5NcgZfCxiJaQXyA8cOyq3/soGe6A2j35
	 KFt1TjvQYTfV5D/GSduxPbQ6goGjATOuSzvDR9U/j1iX43SpcGuuFxJnuYwF/14rUA
	 gAs3rbstJTFW0Ycg3fwOAUcVMHN5TY1jP4DLnXZU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5FF3DF80253;
	Mon, 18 Oct 2021 10:08:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C3B8CF80224; Mon, 18 Oct 2021 10:08:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 58C65F80159
 for <alsa-devel@alsa-project.org>; Mon, 18 Oct 2021 10:08:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 58C65F80159
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="Ofhf2XEu"
X-IronPort-AV: E=McAfee;i="6200,9189,10140"; a="208988866"
X-IronPort-AV: E=Sophos;i="5.85,381,1624345200"; d="scan'208";a="208988866"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2021 01:08:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,381,1624345200"; d="scan'208";a="719228780"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by fmsmga005.fm.intel.com with ESMTP; 18 Oct 2021 01:08:41 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 18 Oct 2021 01:08:40 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 18 Oct 2021 01:08:40 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Mon, 18 Oct 2021 01:08:40 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.46) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Mon, 18 Oct 2021 01:08:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F5m5ZcHUHInsPzYmGoEYdMw/BTEv2hDZ6g2R9/DMQv2+i4U8RwrH62sR2m3YMtfcCzmedobLpmK7LnpmIlAPockdw2/Wx4f3VbWEh1c01tdPsIt6pT0DtqSNJ3QHwukXbMiou2XJy14nk0UcWodPxlpPdO0i2OyZdmN5JHFNp+GSvYcMXdzcBKBtq2afLe4lP+3/fDmImfX/LnjYYFgz132dFsplw37V4PLZmIS1i1andH7AqE5fV9FwHoiLAgUe2GirVQwKZsNK8NQrqBogA7mLMPvWUuEZGu0THyUeoSU8wyHhsKa5UDxiAWbK2txSJKWVPgXK4dRykROq8j6jZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HAZW5bbkRwkJ0ko8fCEIL3D9ianFePEOUyeqtpBqHL8=;
 b=P/b0oY1PJpoHZiUKjYldD3uP1kPwBkZ+VFS9lAZeFGfBu9W8iFY2ZPU3u6XKrj9JfevzGlo4aktF/5E8BuFS6kcxBNj4k4ftM3MnK6zL3xGLiCBosozCdn+wU9TNaZ+i2BEQ39ngFfGzQavd5XYnEolqeZbAtJfZ+xQvnb77LKp6joL71M3omaL9ALLNra8jZqncAPKASwe2EzYcbsVsDzHnhAGiGp1kQJjiKTl0F5yRHicSbp87nrM9jw7AUUM+WnunjI1SR2Wxven5hV3cRHYlAVUGEfADlXyItJnJf13y3ogu10NkxP0WHyvVZc0rffRJCxRTIeDQW/KgVAJNVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HAZW5bbkRwkJ0ko8fCEIL3D9ianFePEOUyeqtpBqHL8=;
 b=Ofhf2XEu1IP9SUhzzdFr/RFUrm6P3NbQcNNzJG4JQuD1LT4Tp5eQyxYKipBYPcNQmLOzZ4XKz2TR/LP3e+V4xi1bC5koX6PoBcDKut+zU8XBvdcQfmKKqYOosZSRvzcgmYOG4lyj+wrOLMgGezlUN3BSptDfMTAEenIK33KVWZA=
Authentication-Results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=intel.com;
Received: from BN6PR11MB4049.namprd11.prod.outlook.com (2603:10b6:405:7f::12)
 by BN6PR11MB1954.namprd11.prod.outlook.com (2603:10b6:404:106::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Mon, 18 Oct
 2021 08:08:39 +0000
Received: from BN6PR11MB4049.namprd11.prod.outlook.com
 ([fe80::2091:65f4:8530:1542]) by BN6PR11MB4049.namprd11.prod.outlook.com
 ([fe80::2091:65f4:8530:1542%6]) with mapi id 15.20.4608.018; Mon, 18 Oct 2021
 08:08:39 +0000
Subject: Re: [PATCH 1/5] ALSA: hda: Drop device-argument in NHLT functions
To: Takashi Iwai <tiwai@suse.de>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>
References: <20211015164047.44492-1-cezary.rojewski@intel.com>
 <20211015164047.44492-2-cezary.rojewski@intel.com>
 <bb2b223e-6318-ed3c-bbe8-31ba4b8d02fe@linux.intel.com>
 <s5hr1ck5bqu.wl-tiwai@suse.de>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <fe697391-339d-5874-4959-8f0f436280f3@intel.com>
Date: Mon, 18 Oct 2021 10:08:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
In-Reply-To: <s5hr1ck5bqu.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DB8PR04CA0028.eurprd04.prod.outlook.com
 (2603:10a6:10:110::38) To BN6PR11MB4049.namprd11.prod.outlook.com
 (2603:10b6:405:7f::12)
MIME-Version: 1.0
Received: from [192.168.0.164] (89.64.109.178) by
 DB8PR04CA0028.eurprd04.prod.outlook.com (2603:10a6:10:110::38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.15 via Frontend Transport; Mon, 18 Oct 2021 08:08:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5ce45404-ffd4-4e25-6598-08d9920e7e13
X-MS-TrafficTypeDiagnostic: BN6PR11MB1954:
X-Microsoft-Antispam-PRVS: <BN6PR11MB1954443BB0575B8735AC047EE3BC9@BN6PR11MB1954.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YNjlsDQoakoaWUwRvLp8ZvdUctV05CaoJxmfzmFa4jbgfcUYfoEr4wpJq7ttzNQDmBkU2i4WmgiMIen65vM08Ws4c3GHK6m5ywmtkpqmMaCWxb9Ja9VcmLdaOpy2Bqo/9ZeedqaZ88vO46AentBJNbKJDnzGKqSg1sVukPolM/QaZsEBvOkgxZhLV7wQQCV2CIfqed+I8ONw1sQi2EM3ysD8wbodis3CjqZBjyy1WdZ9lgpKVspJRLZ85kd6VH3Q0yq5Ih2YUL80awDSZVeUTuRiD9PtIHdumsuNeWQxQ85l2jzQLg+zmO55OxJFbESNG0kHvQPqK+1FJmBSwb9BhKTX6E+FVpb4aVu23HwNWJEESIjazK0yDpvKY7GX9xdOp8a63N3r8sxH5r9EnZee5IPteoxs7IIP1N7HIIoKxX2Bbgalzui/SvKIwIUUi5CujHqqNS9aDi17J/VLQtDDdukz7csxc/OUfq8gzD4/CM1taMXdVvCs3unrLjH7LbeQHyVhGMvEVH5/YeSBBUyts4PH/YI14v4pyjF1T45UifDOAJPwBTj5zPdeCV9zsNqwb0DJRJbjtj71/GQx0fPUBSs+4cbZEdD/wZn1urzP3sjrbOw5PAd6t3QFnGlDW5jZIIhEwlhdP4Ln3ut7anfjmiYstZDgUaYnoBEUar6l5LCI4Tp30q/Sc8ULeBckxdxMEn5wyUDmx9JrnSf2UxyXXP1UdGEAaCJ+sPERI307/wTWFtdJQ54bkCHpErgFY9cN
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR11MB4049.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(31696002)(4001150100001)(53546011)(83380400001)(5660300002)(86362001)(66556008)(66476007)(6666004)(2906002)(66946007)(4326008)(31686004)(110136005)(186003)(16576012)(8936002)(6486002)(2616005)(36756003)(316002)(508600001)(38100700002)(26005)(956004)(8676002)(44832011)(82960400001)(21314003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SmE5c044eHJjdUZ5UFBlNGQ5Rk14NUJpTEZVZFV4THBCQmJkVXMzUTNFcEZX?=
 =?utf-8?B?SGJwL1lqN0JLQkhjejVPOTlYajZyWVAzVCtNYVZ2dVVrVWJXSkNrNFdtT0lU?=
 =?utf-8?B?bjdWaGNldjdKbmZJb1Blblh3S0ZweU5JdnVwTGJJemVjMkZUelppUEJaV0ND?=
 =?utf-8?B?N0F0QWNhN3Jpa0NjUk53QWcybUhMbjA3Z3Zrd2g5YSt5SDhNOTRiOTVqS2pC?=
 =?utf-8?B?OXJoMGoyQTQ0SDRSOGpwb1VoZmtrc0dhcS84cENkbEs5Nms5WXlsZ3hNOUVu?=
 =?utf-8?B?T2JDTThucWpheERsWm9VN3lmY3RUTHlZb3MyTUIzb3R0MWVOWlhxSjF3WS9C?=
 =?utf-8?B?SHNHUzM1RDdaa2dTaHIwTmpXNHN6N0Y5SnBuenFBOHBNYUY5NGhNNnVLSDNv?=
 =?utf-8?B?TEZJbzZpT2RnRFNtSEhDWWVTa0NKOVVjWG9PMk5vbWFjUFo5ZnJrWk55aTYw?=
 =?utf-8?B?UUNCc0pTcS9XOHNiRlpnOTZRY0hLY0E3anFqUlE2bHVzRXBsMWRnbVJEY0w5?=
 =?utf-8?B?RUx4Z1ZTSndxa001VXBRTFB6RmY1T1ZHM1Roc1ovRnZ6S2RUc24zVHAwOWxN?=
 =?utf-8?B?bzRkWnoxWEZHTkF0eW44NGk0RUVRR2JEVjFoeDZCL1d0ZWF5SWFEeUtYTklO?=
 =?utf-8?B?MkE4bkdVLzhKYmdPKytIT09CV3VPdUtaSG9pSkJHSzhsYXhzU2preU5yRUd0?=
 =?utf-8?B?T0I4bm1HSHJKdGZTckJtL3lXNWNsN1E5N2pEdXpyTFRWTFZrZVdZTld4REVP?=
 =?utf-8?B?RFRGVC9PUTF2bzJMeWhCQUZVMVE2Um83a2N6NXRJckp3MENvU0FJUmZIYkRW?=
 =?utf-8?B?Mkc4YjdFOW1UeXQxS25sdmhqeUNpbW5rd0RwTDIzYSs3cjgxU0o5NktIWjJ0?=
 =?utf-8?B?SGdyQUR1eDVEcGFsVDdjOVZPSnB6MHNjcmxOc1Q2N1BQbGJjK1Z4bFFVUXRn?=
 =?utf-8?B?b0ZnOWxEdzRoT2hhTWhmczV4YU9RckxPUmJzUDdkSkcxdjlyNm1KZDRzcFA1?=
 =?utf-8?B?Rmlic2M2S2FBK3dDVHBkUWs5SlYrbDFhOEhJTFcydU42a3FCKzRFdUdReTEw?=
 =?utf-8?B?SjB0dmRiTThRd01WQWF1YmlDQTNFRHBNbWt2c1RuVjN6VXMzdG9aNnZVeFVY?=
 =?utf-8?B?cmhsckFhMGpUdUJld0o0Qk5lTEduenhKMFJkR0xuSkxZZGtNWmFJYTJvSmUr?=
 =?utf-8?B?cmZsMjQ3TnhxZXRPV2pPb1dSaW5OZW9aV2lGaWduYXl2UDBpRDRsV2FUQnQ2?=
 =?utf-8?B?Q3R6UHZnaFZXVk5zUGtGWWpiNnFobXN0T0t1M3dkd25EUUxrMDVkaW9SdWJU?=
 =?utf-8?B?TUcvbU02S29PRkNlRm9LMjlna1VhNkNzM0xPaWJYSDVxV2dCNll5bHBsOUxC?=
 =?utf-8?B?YU41bHNydVY5S1FtOHhkcVhaTEFBY2kwaXkwSEVxeXpmMUVGMndlQkI3MDd3?=
 =?utf-8?B?SFk1emI5aEJoRkxkeVo3S1VHRWdQOEx6UVprUW5ianhIK0tSZWpUcllNNjVt?=
 =?utf-8?B?L21ZZkEwWTZMakRPVTFYY0kzYVRZVzRoUzE3Q0Vaenh0YnBGaTdhZDI5MGFL?=
 =?utf-8?B?blZFQnRzUitBSmFmTkwvdUZTdDJkUHcvYnk3dnhZb2NOSHdPQWxlQW9oWUp6?=
 =?utf-8?B?bk0vbisyRlkzdTh4N2VqQUFlRVZsc2Fwa2hHTTJKZWx5Z2pHTUY4OC92WnJK?=
 =?utf-8?B?SGdCeW5EU0FhbHRQV2dMb1hKalRXMW5CdmlGZ0kwNW1qQXc5VjV1bmM4TkRu?=
 =?utf-8?Q?eNmgBPoUSH0ue0n/62XgNroTTWRUNxcICiR9XPh?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ce45404-ffd4-4e25-6598-08d9920e7e13
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB4049.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2021 08:08:39.3113 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n7guEhggj5EvEtEo1zmuAxasXRnz6Q0nUOvH1Oif0w1n1rrWM+TH5g8Mfaw97AIswJ2GQoov5GRZU3fhj9keJOtmovEFj6rA7ggD19xkNd4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1954
X-OriginatorOrg: intel.com
Cc: alsa-devel@alsa-project.org, tiwai@suse.com, hdegoede@redhat.com,
 broonie@kernel.org, Amadeusz SX2awiX4ski <amadeuszx.slawinski@linux.intel.com>
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

On 2021-10-17 9:52 AM, Takashi Iwai wrote:
> On Fri, 15 Oct 2021 18:42:33 +0200,
> Pierre-Louis Bossart wrote:
>> On 10/15/21 11:40 AM, Cezary Rojewski wrote:
>>> From: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
>>>
>>> ACPI is device independent, so printing warnings using device functions
>>> is misleading. Replace dev_xxx() with pr_xxx() and remove now
>>> unnecessary argument.
>>
>> the routines in sound/hda/intel-nhtl.c are called from a specific PCI
>> device, why would you remove that information?
>>
>> This makes no sense to me.
> 
> Right, otherwise this change would confuse user, too; they'll be
> clueless about who triggers it.
> 
> It's OK to change to pr_*(), but then it should have more information
> that can be easily identified and understood what user should do.

Isn't the answer as to 'who' used it obvious, though? NHLT is used for 
I2S and DMIC endpoints only, so the question is 'limited' in the first 
place. And then, you cannot have several Intel ADSP drivers running 
simultaneously.

Also, logs found ACPI-table interface are device-less so this patch 
makes NHLT interface look more ACPI-generic alike.


Regards,
Czarek
