Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D485859579E
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Aug 2022 12:09:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6EFE0AE9;
	Tue, 16 Aug 2022 12:08:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6EFE0AE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660644577;
	bh=RLnMvaXVWNMNfn98UcQAgkRtU0biP0MkF/4SP3/OC7M=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hThSxSmFhgPwyxNv0qgnwU3ULTzGgqWDKzSHB57gcnsybLNNachc5nU45ROW0xhnC
	 QUmQRSISxYtkKArM0t+xGnx3rbZR3ui8BKwz2dALdawM1CZ2WKOSBKxdoKV5HQhk6x
	 PyTlNpcSNmhI1RxKSWEj6sPsIIHgp9RXRAlb0uK8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D09BDF80424;
	Tue, 16 Aug 2022 12:08:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 327AAF8032D; Tue, 16 Aug 2022 12:08:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 88F2CF80118
 for <alsa-devel@alsa-project.org>; Tue, 16 Aug 2022 12:08:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 88F2CF80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="FDbRnBOb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660644511; x=1692180511;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=RLnMvaXVWNMNfn98UcQAgkRtU0biP0MkF/4SP3/OC7M=;
 b=FDbRnBOb0TDFQcOY+rQqNgLMyxTJrp+OEsUyDZpVFiLY0ITWmmF3n1Nf
 hRePXOM2Gpk6qOdBB6pyG21COFT0HOCPavjWokPp9Q4rjfjYwGreO9DX5
 8InIPb2/jZzHPzt3+z05i91KDSEtjWyzo7C59lG7WMwyGodch5QnoF8Rv
 TyvM2kgmusEq6VLfhkBnG3dVmdFypa4aVUSjpz/jI8OVpKxaHV2rc4Hv7
 iGXHj2Nge7PgvFudMfAu/qgR4JD0xrQCdhwRLqIyLpdI4pA37v8wfovJM
 iC7tidOgVtrY2CK27FbqLkZrh9xJM1O6GWkBno7Ng1pdIG1i0In/8L9Sw w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10440"; a="292175762"
X-IronPort-AV: E=Sophos;i="5.93,240,1654585200"; d="scan'208";a="292175762"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2022 03:08:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,240,1654585200"; d="scan'208";a="557638531"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga003.jf.intel.com with ESMTP; 16 Aug 2022 03:08:26 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Tue, 16 Aug 2022 03:08:21 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Tue, 16 Aug 2022 03:08:20 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Tue, 16 Aug 2022 03:08:20 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.170)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Tue, 16 Aug 2022 03:08:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=msYaXX2/Z0kH2jWXh8xaKUQwONeiYu0fIzOFn2VyJGGMDi/pY8LCOdeGo+OX0a2mOvHWedXlAvvvD32Y2+mSbTpLwRM0knP7HRxIhbdVgJRWa7zhzEXcpEHE/5D00IPJTHW/4nhXSAYUNpFVZgp5sEYna8FLX7YxNopyGVd28N0ENDkvbR/kNL88FN1kb5Rk+OAE9EBG/7nSsXn4G9g4iiuAwnfBqDn2BpgzL5MUJOd0dNwUj2zONUP/l9FcOXVhWqs93itJ+BFwrWS6UerUNylPFLqnoHi9I2IRXInH8ATKZQJLx6dpDoWDxY4CYnJZ439qJgJMKHkIsh+AXLiZtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DnztugN0xUCKI8hdLnXah9eyGf2rLKPnF9c0WVYRdQg=;
 b=WC89W1yroY4BLoPHJKO5DEyJ7xA5RjYKlSyOc34Sw0Yax7uMY6e2Xg3VhhI39gXGdUEtIcWTojj0LVRYx112W9aR0Vamd5bwGDxLgnDR3AD30LL7Qwmd4XOtZHt3Vxe9N94qaELgPavoh2j+KO2MAHt+X4fpj1wU93sQROfm6yX/8IT1Ywn2W0I/R54/morWoYeAf1O5Lm8DLPkY758cOngLzayGJsruv41HtWYi5peyv/6MHTC0C9558M0OJvs246nopLxPItvjatwumlbuXvOYXdrGQ274aOyZxeD9wbMqqIH8lDLuPy6x0R9vbn5AXrtxBOEAa/muqFm3MZIcJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 CY5PR11MB6305.namprd11.prod.outlook.com (2603:10b6:930:23::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5504.28; Tue, 16 Aug 2022 10:08:19 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::75e3:4009:a5d1:c3ae]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::75e3:4009:a5d1:c3ae%5]) with mapi id 15.20.5525.011; Tue, 16 Aug 2022
 10:08:19 +0000
Message-ID: <78315088-9aa5-2134-fc0f-12bee612e600@intel.com>
Date: Tue, 16 Aug 2022 12:08:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.12.0
Subject: Re: [PATCH v2 0/6] ALSA: hda: Unify codec construction
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
References: <20220815174227.3071323-1-cezary.rojewski@intel.com>
 <e8e9eb65-3095-ac5a-ce96-55eaa34ef895@intel.com>
 <87tu6cy0dm.wl-tiwai@suse.de>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <87tu6cy0dm.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0014.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::7) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9fce14b6-74c5-4b51-2f94-08da7f6f3e33
X-MS-TrafficTypeDiagnostic: CY5PR11MB6305:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ObZ+ozTIRYyQ9RwhftnSmXTDTOFBH2R9AMIdh7RZyQtrjx5FY16YSOXyya3KJKEUjnrl1ecX76SgvOq69UMl9uYFg2yk/BCJ7zPkDnxYiEmSC+mYKC18vYgqveLSA5moxYjN8ErBbc/IvcFtj9VtLF8tEMVE/FfX1XJSUqw2rrx0hzIUboppb2oYOxow8PE0lJtf0+KZZgyBeBssrEGTb7kIE3+GrS+Z7urY6J+iIICl38fBt8Y9SrNUHreKFbSHk0wZF668MLhlILbQ7oHg/M1JgrbmRFC4y2qm9aGXXhU5/YOAsJIwx7U+ArLrzcvJoWuR/v4eoPLSMYmEzY10BcGTFWtCu64EKQ9VICZVAYFYVaKHK4KAvQdi9aj2E5ZL/Zql466HiVfY3oNlDB2cDwQdd9q5aA2wYqkJDXsop3wbvM5dBFEn45Cme8IwPBhqYm+RqQHYKE2UOHLJj+Wk+GcGif7aPictmvyZgYll3hy0x7jyCX6OUkyoB7/B8xXVVYy4vNJL8gfs87xTGDC8i33sIiwzRIFYXu9mqmj7ldyAFxyrDiOZB/9tRfflQQn0upbB6EP/1k29ArlP8Qp/q8Ai+roszj69ft2AySsQ4Ccde8ZYmaMkys7bDAorLAIl+Q/C9EwecAS35lM8SrGxjMgW6BlRvtgvDCibwjHmvbmLw9SjCCCEj7FWHm/FaiZHiRZaB8tml3KRT3dPPBxsKvjzsJUcGm/79Y/r2V0LubD9bdPfGmK0DX04rGSdmHNpwBtuQ9pMs9AWQhHQ1QPg0scUYn9NOa2mgauPvg5u+IND9vzDfGcnpwJYN4zVHAEXNjkVcFxg4gGDYpCvkhaQeQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6375.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(346002)(366004)(396003)(39860400002)(376002)(136003)(44832011)(6506007)(6666004)(83380400001)(6512007)(6916009)(6486002)(316002)(31696002)(36756003)(2906002)(31686004)(8936002)(86362001)(38100700002)(66556008)(4326008)(8676002)(5660300002)(66476007)(66946007)(2616005)(53546011)(186003)(41300700001)(478600001)(26005)(82960400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RUQ0alFMS2xvTWRBRWFCTjBuKzRTbVZiamxxQkJqbG5mZW1oUDdwdDhDTm9y?=
 =?utf-8?B?RjcxV29pU21hZC9vWDhKUi9DbUp1QmRMZEdWbnRPeG1kOFkzUWNtWkxKYVBy?=
 =?utf-8?B?UlBXNkpSVDlpK0lhb3dvV3VRVllYMXJkdmdnRGNCbkN4Q2JnamdHcnBDb29Y?=
 =?utf-8?B?NlRWU3dZN3l3b2xaWjMwSFpaUU9YbVZSdmltQ2xSbEFCSm04R0JVSElMUUZa?=
 =?utf-8?B?N3VySlZsTHBZbnRwbGduMXIvZ09xM0RDM3lJb2N5bXdrWEh3L0tFWXg5QldM?=
 =?utf-8?B?TVEyL3FXNXBNZjlaeTRMK3hTUzZUa08vRFZDNWR5N1pTblBvZmJTYzZDZUxB?=
 =?utf-8?B?MWRHQzJkdnV1Z2M1TjMxejJyb2dibmxPM1JBQm5Nc3Yyb1hRVTdFVTlMcEpl?=
 =?utf-8?B?ZGxMdWpUMzNBWkQ4ZXNhV0tOUldWN2YyeDBaY0lrSi8yZTJRa0J6dm85SVdD?=
 =?utf-8?B?OU5Uc3U1NDNsZEI0eitTMmRIMXZmNGZoZ2hTZFYrVW9wdHNuZUJuaU5Dejk1?=
 =?utf-8?B?cG41VUlaVUxRN2pCVEZjTDYwZVFVRTRIY09qdFBrL3REQlcrc1ZlRWlYY2tS?=
 =?utf-8?B?b1BadlUxMGNnakdZb2syd29aelFYQmZOWk1FSXRoRnhWckdid2dQS0VCUTFt?=
 =?utf-8?B?RFJralRWdnlFUERTY3hXblVJcjRJYmhqNlovdHorVHdSdy9tSm5aZ3Nnd3A4?=
 =?utf-8?B?ZWtLUkFiK2M2K2FYWTk0d2hxUFFLcXp1Tzc4TEpJVnJLTGYvVzlkUnpjQ2Rp?=
 =?utf-8?B?cmZJZ1BnZkhOOVNSbzdtYWhUa0lDYXR1M2xVRHZsb2c3OTd3MG41YTJ3QWcy?=
 =?utf-8?B?R1RodXJNVDhWVlpqVFhqNUU5MURtR0o5TCtFSEFPRTZKSmZTZ2d0NUZFcjJj?=
 =?utf-8?B?QkV3ZmF5eWxPVDBuMy9Ud0xuTHVnMUF6MGVFZmMySXRIbk9LOWZaTDV4OHFi?=
 =?utf-8?B?RzhTcWptYVhoQXp5d2hJNVR0dkJPNFBIc1RXYmYzcW9lMjQ1enNicnE3NHFH?=
 =?utf-8?B?dmJhOTVxYUN4Y3RaWDhsM0FDMUZGVkZZdzk2MHA0Vld4MWExY0RDTUN5bmFy?=
 =?utf-8?B?QW9CSW4rVVhHQlRjbkxqamd3VEF3TFViOExRZS9BQSt0WktsYUViRWFKM0RG?=
 =?utf-8?B?NjFaclh2MXVrc2lUV1JqZ0d4QnFFVXlYU1pPNXpleVZpRDVzeCtFaFdqNktM?=
 =?utf-8?B?M1RQR2Q0UVRNSlo0cUR6SnJhUTNic28yTHpDR3gra3Zhd1hxSzI5M09xYS9w?=
 =?utf-8?B?RDRFeEVYY0hqekFUNHVZdDdzcC9QUDcwczBvZVB5S0VqaEVrbERLang3MjZS?=
 =?utf-8?B?UlVXMy9jeGNFSkxYQWNPdkNCaTBzbnA1ZGZiaHE0SjdTWU5kKy84R0VScGk2?=
 =?utf-8?B?MEQwZEVUSGlhMzVXeEVuNkRYL3VNS0dNczR3QVlxdGRVMDJKSTByMzcraFI0?=
 =?utf-8?B?WHdHalFvTUpyUS8vYkJWY2sxOW56QnpIRUlkb0p2ZC9LeXNsbVVZUnFxaTdU?=
 =?utf-8?B?NTg5UFg5ZFNmL05QOEVjSUViMDg3N3dJTmdOQkh5NkdxQ25TTWNTT0FRWHRL?=
 =?utf-8?B?YkpnVXdxdndMS3k5SjhHd0FRbnBKUG5uTktTb1ZEUTIxQWhodTVmNTdEdGlt?=
 =?utf-8?B?cERaR216WWRnZFFHYjJpeklQR1hVbDhsR1c5S1JsVjZWTWJ3ZGFRZWhONldi?=
 =?utf-8?B?OVJhODNTSmlCRU9hTXFmV0RwNkFHZjQwbU1EK1ZNMFlyVjRHaFAraXloWHFy?=
 =?utf-8?B?S2xyV3FrSTFPbEZRUUZkcnNiMWlZRlhkc0pBQmNtTXBxNU9qSTdvQ1Y2YzIw?=
 =?utf-8?B?eEdETFJTbnBLZHowU3FmOG9Vc3RnZEZiQjNiVTBMMVFaQ2VUWFVhZGs3Skdz?=
 =?utf-8?B?NWJ2WWhrbmZiUGJjYXFjcEE3VGpUQXAzQURDaXBHNm1GaFZuOVo3RHRYbDc2?=
 =?utf-8?B?Q3d4V0ZlRHpCRnVRNUJKV2VSd0VyUTRqdW1VSDNZeEdtSVZvL0RNRXFCQ1Fl?=
 =?utf-8?B?MVB0UnJwL3pOSHpRRDFlSENmSnJzMnZrTHdOakN1ZHlSbjZzeEVkNmpJVXJu?=
 =?utf-8?B?TVZrZjRBZWhkeGpzOXA0YWpMR0Q5R0k3U3l0eU1oYmZTUDdhV3FPa0pWVXcy?=
 =?utf-8?B?c3FGMzJDM205WDZqTFg4dTYvYWtJUVNwTjZEaWlrYXhwSWZMY3hTNXRhNEtx?=
 =?utf-8?B?bUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fce14b6-74c5-4b51-2f94-08da7f6f3e33
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2022 10:08:19.0811 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ItS3WBUHqCdgqYwbBkTG5ghdorTJexup1q2Tjg5GFeJhKHnzvDCzGOeBy5W8Sz3V256aQ+phqRUcd+Wmewb2lgBJrTgpuYgsjWmt7qldcxw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6305
X-OriginatorOrg: intel.com
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 broonie@kernel.org, amadeuszx.slawinski@linux.intel.com
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

On 2022-08-16 11:59 AM, Takashi Iwai wrote:
> On Tue, 16 Aug 2022 10:15:44 +0200,
> Cezary Rojewski wrote:

...

>>> Cezary Rojewski (6):
>>>     ASoC: Intel: Skylake: Introduce HDA codec init and exit routines
>>>     ASoC: SOF: Intel: Introduce HDA codec init and exit routines
>>>     ASoC: Intel: Drop hdac_ext usage for codec device creation
>>>     ALSA: hda: Always free codec on the device release
>>>     ALSA: hda: Remove codec init and exit routines
>>>     ALSA: hda: Fix page fault in snd_hda_codec_shutdown()
>>
>>
>> I've received a message yesterday that patches: 1/6, 3/6 and 6/6 were
>> not delivered to recipient: alsa-devel@alsa-projet.org. None else is
>> listed there. lore.kernel.org also shows only four letters (3 +
>> cover-letter) rather than seven. Given Mark's Ack on patch 3/6 it
>> makes me believe that indeed just the alsa-devel did not received some
>> of the messages.
>>
>> What should I do in such situation? Is the server admin about to

Meant to say 'able' instead of 'about'.

>> "recover them from the void" or should I resend the entire series as:
>> "[RESEND PATCH v2]" as see how it goes this time?
> 
> I guess the full resubmission would be better.


Should I apply Mark's ACKs for patches 2/6 and 3/6 in the 
about-to-be-resent series?
