Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C814335D5
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Oct 2021 14:21:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0631616BE;
	Tue, 19 Oct 2021 14:20:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0631616BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634646075;
	bh=aWQOvWC5zeuPOHHDm0TxF33qml7KrHlyql+BXuTLCBo=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YX5uvbiA4aaKTmRqwM1qCEu2vuH/ahVX5aN2sirV79DeNs/BwGgpAvq1Kxcjmdk6a
	 NnyS4nrylanF4Or7agTBjgZScr1ItSJAWWA1l8cl6Hwio5YJae4hHe8Qt+E3HHe5dK
	 Vz8NGJACC0iBGl3FOuhDwnt1sNGGbmiYP0yTfKMs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 92F7FF80249;
	Tue, 19 Oct 2021 14:20:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F0D1DF80246; Tue, 19 Oct 2021 14:20:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A6EA4F80082
 for <alsa-devel@alsa-project.org>; Tue, 19 Oct 2021 14:20:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6EA4F80082
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="ahYzMQU2"
X-IronPort-AV: E=McAfee;i="6200,9189,10141"; a="209288172"
X-IronPort-AV: E=Sophos;i="5.85,384,1624345200"; d="scan'208";a="209288172"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2021 05:19:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,384,1624345200"; d="scan'208";a="490270501"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga007.fm.intel.com with ESMTP; 19 Oct 2021 05:19:35 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 19 Oct 2021 05:19:34 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 19 Oct 2021 05:19:34 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Tue, 19 Oct 2021 05:19:34 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Tue, 19 Oct 2021 05:19:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GgfHJp44NPJte2Y9qTBWGxMGslRBlDeelY9YxPEHNsbkag4Qy0At+0/HWpr2qzXHxg+jaPCicPTW2Oh9bTpfPkpPKTgTLtkYGCMAY7dRaXYYbGDBAIa75ev2fAMzga+GJGxMwgeAVN3pW5aaIGQm6pir91ki1r4v21hR85K9Yp3mFdTnzMZS1Iy7SFwVCJme7M03PSxuOcdc/SOzvd6xyQDH8ylg5RzhFgmPVE+8b74UTBpWJ+/PubMyEELAiOXveql//iGcc3Gpzx5eXHdjBbd1+CrkUc+Z0Bxj3H8f81i70nOKfjsP94el/ZOYcVDamWrKFNFCypTxlZgSTsJyzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BOpXsEUAaHQozynC3xkN28kK3Mnb3jhYZEZUZbOubjs=;
 b=j7Xodp2pMUnoxJN5uotwpVOCj2he0N6TX1OpLWwrsbIkR9Kj/tggFq+X92jEzVJQHOBQOy2tfFf0MeLGUeBk+JyRNzLPyeWTvIuHSqJgSnbyhD//+65Mjs1ETwm/oq4bdjx8jVDY4UTSD5nn7RYh2Z8PGLi/aEE1dPuSZNuz+vuvISWnDgQr3tBNt5ARwwEnDy2itePKX3EIRhn5s5DBU2n3ZVa/tOZoXlurK4GNcq3WIkSRv7RsxHhbHYvH30pGd96Nfaq+do+/pu5yf6NgLCK9NYMqXcpSR+xW36IcxTaloHkiLTpEiBWyGUKJjchza746eMJtFaVRmHhB9sPAZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BOpXsEUAaHQozynC3xkN28kK3Mnb3jhYZEZUZbOubjs=;
 b=ahYzMQU2sAiZTS7mgttg9yt+oXJmVOj+vUy3LVbUIizVeTou9vOql68krFN8cgC1LuCT3e8hlIDuxDig7CtiMzwMKCZNY4uRl4YM3Kfdqxujtra0lGNwFNcDiT2JeAChx30Btc9Byjm5C8ucxEq67KxN01DDJn8cCh8M/NzKFQ8=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=intel.com;
Received: from BN6PR11MB4049.namprd11.prod.outlook.com (2603:10b6:405:7f::12)
 by BN6PR11MB1827.namprd11.prod.outlook.com (2603:10b6:404:fb::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.15; Tue, 19 Oct
 2021 12:19:32 +0000
Received: from BN6PR11MB4049.namprd11.prod.outlook.com
 ([fe80::2091:65f4:8530:1542]) by BN6PR11MB4049.namprd11.prod.outlook.com
 ([fe80::2091:65f4:8530:1542%6]) with mapi id 15.20.4608.018; Tue, 19 Oct 2021
 12:19:32 +0000
Subject: Re: [PATCH] ASoC: Intel: Unify HDAudio-ext bus initialization
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>
References: <20211018192134.353931-1-cezary.rojewski@intel.com>
 <alpine.DEB.2.22.394.2110191203390.3554566@eliteleevi.tm.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <4bf04607-0779-fe47-61b1-1780ab1a3d20@intel.com>
Date: Tue, 19 Oct 2021 14:19:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
In-Reply-To: <alpine.DEB.2.22.394.2110191203390.3554566@eliteleevi.tm.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DU2P251CA0012.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:10:230::8) To BN6PR11MB4049.namprd11.prod.outlook.com
 (2603:10b6:405:7f::12)
MIME-Version: 1.0
Received: from [192.168.0.164] (89.64.110.142) by
 DU2P251CA0012.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:230::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.16 via Frontend Transport; Tue, 19 Oct 2021 12:19:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 956dfe14-4bf0-4652-08c8-08d992fab4cb
X-MS-TrafficTypeDiagnostic: BN6PR11MB1827:
X-Microsoft-Antispam-PRVS: <BN6PR11MB182730047C23E1300DC77BB7E3BD9@BN6PR11MB1827.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FLHu1rPK000Sxn5R12qLZHLy9WO6npeY7zP/owowuJHwK/XVl6s1dkHQy4lC8HPijac5jeXb53n14JRKR7d1EUsOwiAUU9JHTBIRhzfSRspo0xNd3iWyxZIT+Oe/T8dbsMMet228/ofi3nCkkRNbfyogXPL1FqMDU3CEj7DbcYFUQT2sHy4Ij+m6q+Wn2u/W+Ov0CUilJCfoxZMb2VhVefsTPEXNn/2c4L+dwTxD2Ghk6DOyYktV4tUsgIHyDeMxT30HB1rUSLXAR5alsSP765J8VB1q5N3Cju3aIBB1uDejkkwGHmJTHKXvRFqJhYVMl0hFkK4aIji6123ECzQfAyJA+RZT1YFqxn14aWfY56OpCCthKj/J7hicFE+hjwDqLInY+Of8mGi6tVpAUp+SmhzslmI3eqxzmxJAJB4aCgjv47UCa6/bKYE/XCIeJZUkKK4i5G+n5DG9EbGw+GUzVP9czJvPt3Wvn9B01oxwqHbbBcX68toTB0jr/e3y7DgDStJ4AJO6kkTrAa019Q4JLnRB2/8ag9FEOUCbaSVAZ9N50P5cP0222GLrXXGuS7iGiydgx6c7gPULA8tHp1neslyvHmGvIxD/AuoQOa/UJm8tUp/zRImioMeEsy6C3jhs9dRDXY5CIpldUntoYBPt+piV0NvZ4FX8Y9BIcDoSPLh8sg8tkSeXtAeu7kfiTTJ22EtMD6k3PMsF7qdoUvnx9hamVMCCxSSFv4zJcL8VfvK4aAxyyl2iFBPEZE0AtMv7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR11MB4049.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(8676002)(186003)(8936002)(53546011)(26005)(4326008)(66946007)(956004)(44832011)(4001150100001)(5660300002)(66556008)(66476007)(2616005)(2906002)(508600001)(6486002)(16576012)(316002)(6916009)(31696002)(38100700002)(31686004)(83380400001)(36756003)(86362001)(6666004)(82960400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bkZ5Q25NaUJCYWV5YUErd3B0QldrSHJYQWtmV2Z6WmFQekhia0JGeTJKQnFp?=
 =?utf-8?B?aUtaT0RGNm82LzFxa25sOUxXd3ZTdElaalBlTE5ZWW5MK3p3QkVtWFpYQnAy?=
 =?utf-8?B?eDBsN0JPVnNLcXQ2aGkyT25TY2JyVWQ3bktYSjNsbkk0VTVLOFZLK0lOb29C?=
 =?utf-8?B?MjVQeDZlWHNCRkpoallUNmJoUng4T2FBSXlwbkZ0WjVISVRGaTkycXJsdGVU?=
 =?utf-8?B?a1dOa2hmamNWc29ES3B0OFNVUEFjK2I0Z2hYektuNW00UFRiN1F5MHNjbkMx?=
 =?utf-8?B?Y2xHUjZTZU55ZFUyWHZ5cWVidnVmWkxYNVBSbUVmMUZZTXNRL0F2TGkrekQx?=
 =?utf-8?B?K3U0VEpwR1NYU1paTTZUZW9xeDZ1dHpjYzFmTnB5VXM5RmNwNzNadW1meHBs?=
 =?utf-8?B?clJlMDBQV1g2VmJLOXRTSnJtd2o2OUNhdm1TRWhOMDBmNStvWElVbGkwTHF6?=
 =?utf-8?B?NWUva3ZhWmZFTEpUV0RXTTVxNkpxTy9GQWEwMCszMFRWNExERktnL0VwazZ5?=
 =?utf-8?B?VGdYWi9ja0svbFEySHhpUFJCNEM5T2dUTko1WjM1dWJTMGV2ejh2WHFhRVlV?=
 =?utf-8?B?MzJHNEY1V25vN1NFNEk2YnlDR1VvWE85VUdJZ2pJdytxNXl0blJIWWEycENP?=
 =?utf-8?B?a0JXSmdtdFVvQ1lOUnJhMmJQU0EwUlhYYUtXUm1GK00zdjE4U3pwRk1PMDJM?=
 =?utf-8?B?M1lRSElkSC80UGdpSVdjTzBPRW45N3NJc2lLUlJTcWhBNVNtZkJsOEhCRkQr?=
 =?utf-8?B?UkIyTWNmQjdTN3Y5TnJsZ2xvbllZQTlVOGhKNCtkcmp4QXlFRlpyWDlTSGRC?=
 =?utf-8?B?elM4VE1sTVl3OTRBYkVXdWxVTTF4Zis2NUE0MEhyeldIZDh1a0JiNXNWZG5h?=
 =?utf-8?B?UGxyTG9HQWdlKzBrTUFnTEdWaVNUM3FCODViM1psTnIycHRZcFRzbGRXbk5n?=
 =?utf-8?B?bGlIUFlTdmJyOGtNbmZkMnRpd0JBM1pJTUNnR0p5dzFCdDRJWXN2aE5IOXpt?=
 =?utf-8?B?cXgybzcxRlJmd2cxK2lEVi8wSXpIREhPK0Jabk5kOWRoZ1VFVHpFUFR5V3dp?=
 =?utf-8?B?ZUNZTU44UnhjZUhEZlovdDlGOW9neW9OTUJsN1Rhd2xqcFkzSTBObmthcnN4?=
 =?utf-8?B?ckFTdHRPb0k1VFRLRjJwUnFMakJORDJ4VU1OTTduQklSYkoyeDArZzRuMVZq?=
 =?utf-8?B?eUFhR1NyWkVnZXpyTGRFNnFrYjlvbVM1SDJ1K3Y3KzlQRmdGWFcyTGFLTGpp?=
 =?utf-8?B?UjRyQWRQR205dVJyR1pSLzlBUStaRTV5RW5qMzFkS1IzeUZiZXhQZTlhLy94?=
 =?utf-8?B?RUM5MFFNYk1VTVVkclRQd0JRdmkzSTE2WFBkb3pGNUQyM3ZNbFRveFRMYTlX?=
 =?utf-8?B?UXJncU5kT21xYm9weUpVRXZiODE2dWlMaG5YcEQ4L3doWU5MbVFrYi84T0tB?=
 =?utf-8?B?Qm93OU9UR2EwZC9QVGltWHU1d2RWbEJCbWJmcTM4VGFzaVJROFFIaVBzR0hD?=
 =?utf-8?B?ZHcxZngrWHBzY1JPRXFKSDNiK3lXWUFxdFVIVnNHUlB1RXFnUmhSUXVZTU5S?=
 =?utf-8?B?ZlhRclNRNVNnRkJONGZzVG9uTmlxWGZjRlU2Qkl4MzV2OEMxT3ArL2NqdWFq?=
 =?utf-8?B?WHFsZTNmc2xkdERKNkd0UW5ObXhDT3dScmplODY4VnpURTZUeG5saVJRdCts?=
 =?utf-8?B?SkpjbUJTeEJ0V2h6a2V2Zk05WW1Fcm5zbnJYZDJHRmppWGduU2JDK3RrVnBC?=
 =?utf-8?B?QTMyQzlya1Izc2tIN2djV2d6Y1FxbzIxR2l3V292SEhwb3Q1N0h2L0hYOThn?=
 =?utf-8?B?RUw2NnIvS2tNNkZBV2dVV2Y3bEtsZVpuRjNUdXMrVmNRNUdRaGoyYUNiTWhx?=
 =?utf-8?B?cTJiSThRTUQ0MkJNYm00L3F4aTF0Mzl0OWdiT09wV1RqRTF6b25mQ3lkdzNs?=
 =?utf-8?B?M3RzUTltOWNJVi83cjZqMU5WenZpRkhrcUlUL1BIeExhOGtsZEluMTgrVEdx?=
 =?utf-8?B?dE5yalU5Q2pERzdqRHhicjhhRGxLWTUrUGdRYTEvZXlSRHVUSDhHbTVzUEpZ?=
 =?utf-8?B?UFBzQnpEWDh3Mm1vT0R2UXBseEhwSnBRQk4yV0VQeXFDK21NR09UUUd3bDR4?=
 =?utf-8?B?L2ZLbmhFVXdTcTFGeFF2K3EyYVR0YVEycG5qM3MrWkZYUkorbGNJTVA2Y1Q1?=
 =?utf-8?B?MkxHV2pQNkx3bUR2RVZuT3BadzJuTzljbWR2RjU3ZVdQOFVUMXFVR1dLTTh0?=
 =?utf-8?Q?FygPh2dPOjNVyzXd2ZelxoSTN+bDBOHbZsgmww8HvA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 956dfe14-4bf0-4652-08c8-08d992fab4cb
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB4049.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 12:19:32.3319 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q8T5mRaJ0iCAxkBLebP7yL4TyEd2q5NfvibvhvO3Q4M939NbU0myngTZgS/0+ONUoDLDBq+coSYT/lZnsmnqrznFTIShUosGh0zyK2UNTns=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1827
X-OriginatorOrg: intel.com
Cc: hdegoede@redhat.com, alsa-devel@alsa-project.org, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com
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

On 2021-10-19 11:16 AM, Kai Vehmanen wrote:
> Hey,
> 
> On Mon, 18 Oct 2021, Cezary Rojewski wrote:
> 
>> HDAudio-extended bus initialization parts are scattered throughout Intel
>> ADSP drivers code. Gather them up in snd_hda_ext_bus_init() to provide
>> unified initialization point.
> [...]
>> --- a/sound/hda/ext/hdac_ext_bus.c
>> +++ b/sound/hda/ext/hdac_ext_bus.c
> [..]
>> -int snd_hdac_ext_bus_init(struct hdac_bus *bus, struct device *dev,
>> -			const struct hdac_bus_ops *ops,
>> -			const struct hdac_ext_bus_ops *ext_ops)
>> +int snd_hda_ext_bus_init(struct hda_bus *bus, struct pci_dev *pdev,
>> +			 const struct hdac_bus_ops *ops,
>> +			 const struct hdac_ext_bus_ops *ext_ops,
>> +			 const char *model)
> [...]
>> -	bus->idx = 0;
>> -	bus->cmd_dma_state = true;
>> +	base->idx = 0;
>> +	base->cmd_dma_state = true;
>> +	base->use_posbuf = 1;
>> +	base->bdl_pos_adj = 0;
>> +	base->sync_write = 1;
>> +	bus->pci = pdev;
>> +	bus->modelname = model;
>> +	bus->mixer_assigned = -1;
>> +	mutex_init(&bus->prepare_mutex);
> 
> hmm. It's not clear whether we should initialize the regular hdac_bus
> fields in the ext_bus_init(). For plain HDA, these are also initialized
> in the caller. E.g. in sound/pci/hda/hda_controller.c.
> 
> So if we start cleaning up, should we go further put this in
> snd_hdac_bus_init()?
> 
> Then another is what is the right place for settings like "sync_write =
> 1". While this settings applies to all current users of the extended
> bus, this is really hw specific setting and not really a property of
> the extended bus, so this feels a bit out-of-place.

I'm rather in favor of bigger cleanups. We can definitely move further 
in the future : )

Notice that some 'core' field are being initialized in 
snd_hda_ext_bus_init() for a very long time.
The problem with moving all 'core' bits to snd_hdac_bus_init() is that 
some of these are not 1:1 between ASoC and ALSA hda-drivers. Also, 
hda_tegra differs from hda_intel too. I could update said function while 
not removing any assignments which differ from the default. Maybe let's 
just go for it..

TLDR: treat snd_hdac_bus_init() as function initializing fields with 
defaults. Any you don't like? Change after its invocation.

BTW, I don't see any problems with ->sync_write=1 as from software 
perspective it is a bus property. Otherwise, interface change is 
required to reflect this 'misleading' information.


Regards,
Czarek
