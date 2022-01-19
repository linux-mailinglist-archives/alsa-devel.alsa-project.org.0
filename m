Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C6B493B2C
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Jan 2022 14:37:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E7E429F9;
	Wed, 19 Jan 2022 14:36:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E7E429F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642599423;
	bh=UMM48yPwZ2IWoKqOw7vrxHHsnXMC/DM0mmCXInuPU/k=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=afO6pptJJohWeRf06JOpfY4501Juv1W8DgdPA+f58ZjXzUsdaBMfiuhPoBD6lrwxu
	 wFlsQS1ve4OQ4B9Oho1ykU3QmpwgUW1cRUwiaEx8jUjPR6JHaMFanLTrGSc0wFceYa
	 qygJNtF43TDo3qKTEJ8Tm6uP9xEJB7cWd1EKKoTg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A1483F80212;
	Wed, 19 Jan 2022 14:35:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C4923F801F7; Wed, 19 Jan 2022 14:35:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5A6BAF800F8
 for <alsa-devel@alsa-project.org>; Wed, 19 Jan 2022 14:35:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A6BAF800F8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="jUu4AAQL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642599349; x=1674135349;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=UMM48yPwZ2IWoKqOw7vrxHHsnXMC/DM0mmCXInuPU/k=;
 b=jUu4AAQLSeKgwk1KsE+uy9PqtbFWmWmcDeaJNBdrOPtXU5kVZ08FLPgR
 FYtS+fqHBVO4kiC4MDc9rNj3Ztw3G7R6eyCGziepz13rPtR99lSyK1pnj
 JRL6aN8iY9jQuJbUaNI92mtsvIK6CmOmxs6HmmY+/2ohXN28TmhzoqWwz
 Biy+Tv3rtz5mcNKyQYh6UTROdb1aGSGLkBFoa9G/+EvDboQZC/q+lyWq9
 IY4PGJnbJ5Ef9LLHJ9Eeg3o1G+AnA4818Llj3Bbc+meNtMT/qw6Nx+XqK
 0grMGp/BMZmJN/M5Mtsvd96kRk5S2waNxFCjfs4KK7hCpjkmCOnd8xTas A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10231"; a="269456888"
X-IronPort-AV: E=Sophos;i="5.88,299,1635231600"; d="scan'208";a="269456888"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2022 05:35:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,299,1635231600"; d="scan'208";a="764945719"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by fmsmga006.fm.intel.com with ESMTP; 19 Jan 2022 05:35:32 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 19 Jan 2022 05:35:32 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Wed, 19 Jan 2022 05:35:32 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.102)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Wed, 19 Jan 2022 05:35:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wm+Rwvn7q19ebPDFlCL1UyCOnoMMo9nA2ivYCl01k0gkbkaVqEk5yEzcsv6wNxm5BUQNOdorNUHx9cKUX0sbq/2W+ciZWjnilHsdKShQkxUchWRObHkWeEksoSrfdgfGfKqck02CqaDqi6Kc9XmdPf7ZFrbfdliJtQbsgrg9A4eN40N/EaKnGw/yvNtiYLD+LPJqq4+xMJLsunsLae6EQHYUlgf2PbUTMzuSuIhs3fIPjtZFhbs/oBGN2v9r29Zvb8rsCsX5krd1m7W1bwlzZ4yapdcZDy742n/KTysOQgdHlfEO0TUWuH3uUoS0xPkT7D0fR3Gn9XHHvEnKdj8FOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xQqtOn1hbeKVV9p1Yohec0AX8X61fbpuB+T12mGiu1A=;
 b=Eb+UVhtj3IUh1vHGgeYAJ4i1hNLe4+yP92FF1PXVnGvCVlUZArwGmbuDUqGvQhbxqRBGYBwSZVFP5Ffdp2lXsKmHV/ygpeMO9+9Dx4WS4VCW2H4FD7tUUNJbslYuV4eE2/x32C290i4kwatbnfo/r/0uY7JclkrwDSbmOFedKQCsmccBsvzhnaZqPKDYxrrLkNLNsRUM2T3OE3fvdCqMuKTRJG/rXipVJIPtPzzGND5/XFJO4LW4c4MzixjPNry5hoobjpXHTebJIkJeqbT4hs+Vkz7NXjwOh5k9qR4wInWRYPdgZd4UxFTxg6xXrU62RHbmAwAFB+WNVBw5QbBgqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN6PR11MB4049.namprd11.prod.outlook.com (2603:10b6:405:7f::12)
 by SN6PR11MB3470.namprd11.prod.outlook.com (2603:10b6:805:b7::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.12; Wed, 19 Jan
 2022 13:35:30 +0000
Received: from BN6PR11MB4049.namprd11.prod.outlook.com
 ([fe80::cce3:53d5:6124:be26]) by BN6PR11MB4049.namprd11.prod.outlook.com
 ([fe80::cce3:53d5:6124:be26%4]) with mapi id 15.20.4888.014; Wed, 19 Jan 2022
 13:35:31 +0000
Message-ID: <c4d68409-ffa3-5999-6971-dfb0e8d15095@intel.com>
Date: Wed, 19 Jan 2022 14:35:24 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.4.1
Subject: Re: [PATCH v2 1/5] ASoC: sh: rz-ssi: Drop calling rz_ssi_pio_recv()
 recursively
Content-Language: en-US
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Biju Das
 <biju.das.jz@bp.renesas.com>
References: <20220115012303.29651-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220115012303.29651-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20220115012303.29651-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0146.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:188::7) To BN6PR11MB4049.namprd11.prod.outlook.com
 (2603:10b6:405:7f::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 74e24a70-7dba-449f-6071-08d9db508fe4
X-MS-TrafficTypeDiagnostic: SN6PR11MB3470:EE_
X-Microsoft-Antispam-PRVS: <SN6PR11MB3470438B36212FE5E79F46A3E3599@SN6PR11MB3470.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qZKa012VDW4FquPyox/w57L/UlMV99UIIam+zvmNcNd5LW3i7e10jRpTXcKyYZSJ3mvzptTem+r+mSxSW6WdT96TEBpke0BitmjI5NTqW6tKUDufZugycvajPxM9BW/nJgbubOoRrcsgccCqTts+GvlWhFoiG73nc6GwBzOGZGResVY2mzDTnrEDwfIJBb6WcK3m4zaVgasZKCVDkiBxlt36pHuZXUZlKBq75z45grnTtQFf5A8pw4ckD374cUlPbl70sx9vurSIY9B0nlviNq0RVQ9Tj53H+3d7sBl+5WEsyMq1VWilhykjMKXgUPJS0UFZSrU5ynIxXBn4CIsZMxonEoCGDHFZ7Szt40zxNB3EX7vKqXhaVsuLgh6xHx0g6pmq3qLwPOpb4ZcxY4AuyQSoVX/dDhxmveGzWmpZ/Biz6hfDdm4MwKWkKnlDt4uSBV5A+ipTECSgruwIR0l31v7rmvCGLRN5XUpdblkHABiR860ADjz4DnPcOMJetPMHVBiYRg+mmJGqKMnN9l1DJUV2UKZ6aPnubfecB1KasYyUxYNn7SfTpsUbDLCdR8pe2qthC6JknNzuDPkOQo/Na/UnL1kHTWfTdehfvfizPXUWAxh2Yp/YDZHPboEZfvCPrFB1296pmMNLsTsQ/6aK4RucgETrP+C33N6uuLEhtEDgvp/pSGED1z/pI5awBXMXtOSyJ5C8kacRQiFGmYTvbuhZvUPGiTGRZTstCheR8v8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR11MB4049.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(4326008)(66556008)(6512007)(66946007)(8936002)(44832011)(6486002)(6506007)(36756003)(31686004)(66476007)(38100700002)(82960400001)(83380400001)(86362001)(2616005)(26005)(4744005)(8676002)(31696002)(110136005)(508600001)(54906003)(7416002)(186003)(5660300002)(6666004)(2906002)(316002)(53546011)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c2Z2VlFXa0tnMEhPVjBTZTRjVEtPeXcreWlUMUVXM1JFNHZUclY4eS85NkVM?=
 =?utf-8?B?UzdhaGphSy9oZXU3MjJvSU51cjJQYWJ3QU1nVWpPWTZHQ0pHL2dyTWszd1Fz?=
 =?utf-8?B?ckp2dlZrdUpMNW04UXhuWlJzMUkvQ2xaeHdOaTAwVTdCNGwyRUYvLzB1Tisy?=
 =?utf-8?B?UDlIRXE3eW5WOFNYUHpRdFdXSWNuVnRKM1hMbGNzV0hDNmc4c2VoRUdoTTVq?=
 =?utf-8?B?eUJ2eDJRaXNBVGt2ZmJZOVZWZDErWkJkbnloc2NTaTFnZGpYOEZkOTFtS2Rz?=
 =?utf-8?B?RW1JR0FMZHcvNGd1eW8rOXZrbmNXQ3l1RDI2KzhiUGNMdmhyL2l2eVIyZG5Q?=
 =?utf-8?B?MGZHU01tWW05cGZGcFJoWG8xOVJPWW9WSFRIakxYQUdVVWFXRG9ka3RtSldM?=
 =?utf-8?B?ZlhHdGRURCtKOE5RRzdJVEtjbXVDSUFsUm16YktzOEJmYkpIMnRhMWFhUUFK?=
 =?utf-8?B?NXhNdVRjYTZpQllYUFVVRGNGdnFkUmc2OWNaSCt1b2hyVy9oTkNzd1VQZVU4?=
 =?utf-8?B?U3o1UEo0TmVmL3QzZHRRbkpGYUV5NlFFdDkyZC84WmVuL0dFMjhKNzJHRWhQ?=
 =?utf-8?B?ODhxUXorRzA3T05DM2k1OVNoV09zOWZyK05JT3lJZTlOY1JVVVFtcTAza2tr?=
 =?utf-8?B?bnlRajJTalh2YUljUTMzekxIdGZvcDQxQnVaNjh0c2ZlR2RSakZyK2toZzB1?=
 =?utf-8?B?Y3V1Z1QzQ2djSkFYNWc0MzVJQnBzUGptaVQ1RU42NzFwb1pzeUJQcDdvWFR6?=
 =?utf-8?B?VHRFU1VrOWpvOUgxcndlK1h6bmNSTTJzL0dBNWJMN3dMbVdGM2VGRzRqOXpJ?=
 =?utf-8?B?UkExNDFid1JrNTkzTllPcGt6NnJJMUw0cW9xWXRFVlBpNGozTUtLbzdGV2JP?=
 =?utf-8?B?cThVVE0zSFNLeVoyb1dZbjlvamI0dVZSRXMvUmZSNWJVaFgyQkZlY25MaGlO?=
 =?utf-8?B?WS8vYkJua09LZENGY1dQQVNZN3V2b3U5U3ZiWjJtUVp5VEMxQjNmb0dpVncz?=
 =?utf-8?B?M2NFYm05OTE3dzdvSzdWYWx2TTl0b3RPN2lKTWNmbnhSeURnUGVuZENMQVlD?=
 =?utf-8?B?NGhjQVpNcUFRU21sWVB2bG52bHVoU0laalVSY1o0dFFCbVl3Wno1UVpBSGhw?=
 =?utf-8?B?THBNSVBUazNacVFoR2VpZ3I0VXpLSGdzSXFHUHRRSm5zOUc5MERsR3gvRHNZ?=
 =?utf-8?B?elp4VTAzbCtrL0NNMnRFN3AzOXNWSndOS1VXSGd1aXZkTDRHNmNZZ28rMzFD?=
 =?utf-8?B?cVFKN3B6L3dJYmxzelFZd29iVDhhYUQ4QmV3eEdVaHFTUHlJdjRHdDM5Rkto?=
 =?utf-8?B?TFUwclJzOEIreFhGTDN1NEd4bFlici9ZSjNJOWQ2aTBQaHkrWko4bnFIZ0Qx?=
 =?utf-8?B?K2FvaURFL2tVekkyajV1NkMzdHdwU1dremVqQUY1Um5nVG8ybVN5cGdvUTA4?=
 =?utf-8?B?WGxZK2FMZjFQVVVRcXBIZnh3MHpsYW1CZW1GNWExRzZjaS9FakZRakVVbC9Q?=
 =?utf-8?B?UWVPaE52YjJidUxWNmZ5WEp3RnlJKzdGbXFoaWdqMFh0TmR0REUrRDVkdzFm?=
 =?utf-8?B?dkN1ZzRQeDZOQnNlcHJ6ZG5uMHRhN3EyTFVRbVB4R2xXUlFtempmd1pwc2s0?=
 =?utf-8?B?ZTZxR1JPaVI0TktSNGRNckFkc3hkbkNTWGwxQ2hKTmdOSzFwOWY0REdrNlhL?=
 =?utf-8?B?UVo5ZHAyL2w5SEUzQ0owREJWTFI0Y1NLc0JuNEU2OGtnMFNvckhGOUdLMitJ?=
 =?utf-8?B?TUhzYVU0eFpBVllydnA3allCc09Id2FOU05ISExrb0ROSlRYVEtEVjkwL3Nl?=
 =?utf-8?B?V3lobGpzazlqSVlldEpFV0g1TGdPcG9UZmc4SDFVTmZRTXByNnFORzdpaWFm?=
 =?utf-8?B?c01YRkprM09Cb3FyeWJNMWVWQzQ0ZDR3TFB6Nm1uQkxDdkdHeWhic3kvaWxT?=
 =?utf-8?B?NDk4MXF6cjBoL3Q1NVNxTXBnZGphb1p5SjBYT2htcVhydVJUMGpUNEliZnFW?=
 =?utf-8?B?WFBuT3hYTXA3UThwUmlRRGw4WERpbzM0Mll1c29od0M5c0Q3aldoMUZvUWRp?=
 =?utf-8?B?bWp0elRTK1FSN0dBcDY1MlZvcXJNbFRWS2RoM09POEF0Z2xOK0VuRHNFZHVB?=
 =?utf-8?B?ekc1dmtzZk1vMFJ4bTROVUdZeG9MOW9GVHZsYk9iSUV1KzlYUHA2YVRrdWx1?=
 =?utf-8?B?VG8zMmhRcm9JbGRoNmxmK2lvaXlDaG5RUzJWNWZudU95SU41Zmk1N3NCQ1Y2?=
 =?utf-8?B?T2Z5cHBlcWY4N1pLY1pkUjk1MjNBPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 74e24a70-7dba-449f-6071-08d9db508fe4
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB4049.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2022 13:35:31.0109 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g9ayc2V2CBq7AB5jBijkaynJP4QwhKrYhSXnfoSACbXrrK/HDKoXo6uwgxOT1ndWv+qkXxErER6oqj6HwTmSSSGxOC6psRfv3NeVy/w5JT4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3470
X-OriginatorOrg: intel.com
Cc: linux-renesas-soc@vger.kernel.org, Pavel Machek <pavel@denx.de>,
 Prabhakar <prabhakar.csengg@gmail.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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

On 2022-01-15 2:22 AM, Lad Prabhakar wrote:
> Instead of recursively calling rz_ssi_pio_recv() use a loop instead
> to read the samples from RX fifo.
> 
> Inspiration for this patch is to avoid recursion, as recursion is
> unwelcome in kernel due to limited stack use. Also to add this driver
> will later be used on RZ/A2 SoC's which runs with limited memory.
> 
> This also fixes an issue where the return value of rz_ssi_pio_recv()
> was ignored when called recursively.
> 
> Fixes: 03e786bd4341 ("ASoC: sh: Add RZ/G2L SSIF-2 driver")
> Reported-by: Pavel Machek <pavel@denx.de>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2
> * Used a do while loop
> * Fixed comments pointed by Cezary.

Apart from my previous suggestions which have already been addressed, I 
don't see any issues with the patch, so:

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>


Regards,
Czarek
