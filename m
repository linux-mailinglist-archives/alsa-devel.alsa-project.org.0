Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 547499529EB
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Aug 2024 09:30:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 743812392;
	Thu, 15 Aug 2024 09:30:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 743812392
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723707041;
	bh=neHq1ChfxSe3ZSySCO1d0/Pq1qI6TvHFWTmoH/H8A5s=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YCgniyeCYoDQw3bQXxgbK9XMd4ia64cNvcgWpI9cL4aAgVXme9ItGDc6MFkpgEuDO
	 jtXExdaLULIYYQQUOqziMhAxX+zUSmUWz6nKdfX6AUiAdax/1bIOfON2lFbheaKrUB
	 skV0Sd+nOS6s6swulOAbnFgXxPqzx7/SAerL+F+o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 39AE0F80423; Thu, 15 Aug 2024 09:30:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8DCF0F805AD;
	Thu, 15 Aug 2024 09:30:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4C499F80423; Thu, 15 Aug 2024 09:24:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20614.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2414::614])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B2ADFF80107
	for <alsa-devel@alsa-project.org>; Thu, 15 Aug 2024 09:23:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B2ADFF80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=infinera.com header.i=@infinera.com header.a=rsa-sha256
 header.s=selector2 header.b=gGmPA0FT
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z6uVKsqg8TbaG3l9nXz2fzGt7iHL+LdqvfmZeb9fA0TLQ1ZT/AC9P1lfiAivDgvb1ARVwGSKT9qbGo8uHbbi+57z36Kym09iHRdLyeef9OrHQwtyvRcR6rwX2Z3q5G4GhP4t7CN9hsmw7f59QQIM6Rf4Me+sbbT1G7Tt2okCrEt/fBJPg8n8IXDpTQhBoUIpBM91fcdEGqak3/tU1fXblY5Zj2pelaXBqntAmEq21F/sqTP4CZpKr+wnyF8dyGalzSYn+oTAx3Sr1T+NkF1KFkJSm9uFEekyR8r2T3DJWkGatauawHdNLvax3cPRZLB9X78rxdLDHt/AzJpI7xSQOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=neHq1ChfxSe3ZSySCO1d0/Pq1qI6TvHFWTmoH/H8A5s=;
 b=bfwOxbB1Oo25wNv9gm4Q4RUwIoont/XIZ0rVuxZwutBXBEipp+qlE14j6ONpTkTwcnDzKasZZ9W44BGCYe0akvz3XmDyomSgnlTE75VunnTEaEYXQK4Lm9r3jIjsGnot7kzmnm1MUQJhS5LyhD5jeOZEouwzXVHsEa1znmu1EdjuLpnr+6PIIT4iZn3OqEVpQDL2tthArCF+VIRHL0vpa+9FnlYL8MnzfLIT3Tv3LtJAzep2PkCkBS/aNzuNP0bsps7T7wgoET91VHw77dN+xJ3tgusospZKAuDP7v7dXYmW6hIWV9rnh50dSLCceRiQrm9kSv73zwmDxI8P5CtLsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=neHq1ChfxSe3ZSySCO1d0/Pq1qI6TvHFWTmoH/H8A5s=;
 b=gGmPA0FT245eQEBzvBwBwFs/F0tuHkxCroy4nVPad7+AvJ9coFGEyzdxQ7dQZUXs3RUC8W68dAPwUP10zrayJNbiUKePQT87/uci2SzfcYDYceJJd39CWSX9N0RTu4m2OhtKZLXyuy5OdgXDTS/v+ww5o/KEcfQU1HmEBWFVuIJFMG6gewDFGLdG3h/ygwzCPXGciOvKtLbXNvQfe55Das2NdWGbhb0nWJHKEAW3M6XY39Mi7MXcSc+NEbdnq4VLlJpeEkmcCemK4Lzg9BtufbyPX9EoRvtbMu2XAIy6VF5ZF7AXbuFtdCAGh0kbDV++fpqy2L+KMpfKpofUcauSbg==
Received: from PH0PR10MB4615.namprd10.prod.outlook.com (2603:10b6:510:36::24)
 by DS7PR10MB5200.namprd10.prod.outlook.com (2603:10b6:5:3a6::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.13; Thu, 15 Aug
 2024 07:23:07 +0000
Received: from PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::24d1:393a:f0ee:5c7f]) by PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::24d1:393a:f0ee:5c7f%7]) with mapi id 15.20.7875.016; Thu, 15 Aug 2024
 07:23:06 +0000
From: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To: "pierre-louis.bossart@linux.intel.com"
	<pierre-louis.bossart@linux.intel.com>, "broonie@kernel.org"
	<broonie@kernel.org>, "peter.ujfalusi@linux.intel.com"
	<peter.ujfalusi@linux.intel.com>, "amadeuszx.slawinski@linux.intel.com"
	<amadeuszx.slawinski@linux.intel.com>
CC: "perex@perex.cz" <perex@perex.cz>, "cezary.rojewski@intel.com"
	<cezary.rojewski@intel.com>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "tiwai@suse.com" <tiwai@suse.com>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: Re: [PATCH] ASoC: topology: Fix route memory corruption
Thread-Topic: [PATCH] ASoC: topology: Fix route memory corruption
Thread-Index: AQHa7aKy1QkthXgmgUKaNI8G30a7XrIlbFaAgAKAUwA=
Date: Thu, 15 Aug 2024 07:23:06 +0000
Message-ID: <875ca46fdec532be1345351cc668268cf2478967.camel@infinera.com>
References: <20240613090126.841189-1-amadeuszx.slawinski@linux.intel.com>
	 <e486fcb1a838a9bb254706141885f306a5865d20.camel@infinera.com>
In-Reply-To: <e486fcb1a838a9bb254706141885f306a5865d20.camel@infinera.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.4 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=infinera.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR10MB4615:EE_|DS7PR10MB5200:EE_
x-ms-office365-filtering-correlation-id: e6f46e45-210e-4a80-eca4-08dcbcfb1b64
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?Z21tOERoT2o5eGsxVDZnb3BRVFl4NXpJektIMzVJTnBtYXdyR2F3QnVzVU8x?=
 =?utf-8?B?elZOS2F2bEdaL1hqenZxNFN5b3JvRkhhZTZ2MzdWNGpvNnhTQ252aVkzdmcr?=
 =?utf-8?B?ZUFjaEZoVnJ2WmZoNm5sc1puY2RMZy91ci8zVXFyeW1WRDcxU2VzY0txVnJ4?=
 =?utf-8?B?TFZ6RGZFKzRlbUozNW0xTWlDM3Irc3puWlNLbUxoQVRzN3FReUlHcENZUW95?=
 =?utf-8?B?bWQxSWdLbFVPMTBmNHVQMjdXeFpJRjV4VU9DWm83K0R6TktGYkRlemdWWE4x?=
 =?utf-8?B?U05kWklYdGpkK0t6bHlEdXZiK0FOemhxckJheksvU0VHWWtUcUZIb1BMYm1J?=
 =?utf-8?B?WTlZc1JYdmFxZjdiS3FYQngrNTVFcEtOTjlhYnZQc04vaGwvMFNnRUNoTW5v?=
 =?utf-8?B?anY2NlZEV08xN0NPeTkrbUZrcGM2RE83MmFaRGxhSk9hSTZyYk45Rlo5QXZM?=
 =?utf-8?B?RzlMbm1KSnVJQzcxelNPRWZZT0VvNFU1bEhnbE1HSjR0Z2p2L09BQlU4WUMx?=
 =?utf-8?B?SURiOXQrNXBxUElTU2JqM0FhYkJKbS9sZVYrVElOc3BMdGxsN094QVR3SGR6?=
 =?utf-8?B?bndCcWpKT2pTNlIzV1JHM0I3MTdVdnZuOG0vUzU1Z1cwT2FFY3JKSTJsZ1pm?=
 =?utf-8?B?U1BTOWN6K2R6SXpoS0dVSmlUOWpaNFdLYTZQYU93SnplbzVHY1dqTkFQTWhE?=
 =?utf-8?B?cmZWT3o1VzV4MHJlOEVYa05aQTBNWmVBYWY5KzgyMHZuQlJRV1ZFQlRPNkdK?=
 =?utf-8?B?bGdETDhLWitVVGtkdmhRemZ3VUpyMTVpKytlYzhFMHNpL0pCSUsrR3ZOd3FW?=
 =?utf-8?B?ckdkbXNtclpHS1M0eWlyL0hvZlhleXVOUHNTanJwdG1IcThjbk01dVhjM05Z?=
 =?utf-8?B?YWZwR3NycVRPSGVYa1ZrWXlEd1Z4ZytGM1A1RU9taVZ3ZnE1NGJlRWFHYkhy?=
 =?utf-8?B?cGJwMWMvT3pOOU1pVkhGYllnVStaS2pqdkFTeG5PakhEeXpTSGNreTIrWHNR?=
 =?utf-8?B?YnRkRFZ3M2Z1M2pwTWRuN0FzUTJXNEZpQ1FDZzlPV2ZzYnM4a2ovRC9qelFK?=
 =?utf-8?B?Z09kU0dHSHdqSXlPZzkvaUplMHZrVEpGK3NKSUk0U1QzZGhITXNGQVdqNFFE?=
 =?utf-8?B?dEhpVjB5aVFXeHlUQmJFeUNnQXZjZG1oWjZreXdjczBZanovV2Z5ZlpZVHpO?=
 =?utf-8?B?SVJjeE5PTFQxUXp6dGlEdUVmN3YzSnZHeVR0VVFqSVRLS2tEbHJmSzdSOFd6?=
 =?utf-8?B?OHpHdWMwSnRrRkh4UndIUGRRV2hUY3JrTXhvRWYrbG0yNTM4S3FlMnpkRTdN?=
 =?utf-8?B?R1JRdHM2Qk9RZ2xONzRETlBwaENDWDkyUVNSUDZSTmRPeXJZSmZyNDZPUll3?=
 =?utf-8?B?ZkpGR0FyYkY4UlMrRDJ5RW0yaG1qYU40SWo5NjNlL1dBaDBaVVhVelpsL1M2?=
 =?utf-8?B?RU8rU2w1NWRpb2NSek1rSVdpd2lHekxiRWZVQlluVlBtMmk4VnlrR0hYejBE?=
 =?utf-8?B?dGQvQWs5NXV6UEJBMkZIb0xJVzlQMWVIeWxQN3YwWWRZVFJzRCtyV08yV3hL?=
 =?utf-8?B?OWF6eWthUEIwZHUzMnYzaEV4RVo2dWRwSG5VbDFPaW1GME0vSDFrVGp6RUl0?=
 =?utf-8?B?T2N5bWdJaHZhbk8reG1HeXVZVnp0UWR5dTVVRkpVSUZvR3MycG5saDlibldX?=
 =?utf-8?B?UXhGaVNid0FwN09XQVh2Q3FkM2lRM3lHSGlnTnhaQmh4LzVlY3lXUjVLTVd5?=
 =?utf-8?B?TUE0MWhMOWsvWExYWEdUcVRXdHM3bUp1NFlsaEhHSGRFb25DR29kL2RNbGNk?=
 =?utf-8?B?blZGL083VEZMVEJZeGV4RnNta3BNZHhwbkhGQjllZ25Xd2hFYXN4OWVWWVVz?=
 =?utf-8?B?YlFmTGFmNVNSTzNhWnhNSjRXS3ZpamVNaHJSaFJYUkNzRlE9PQ==?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB4615.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?QUJ2Smk3VUVrYVp0bW1QVVhwblYzQjdGNjZLQnFZeDRJaG5FSlJ4bUJOd0pO?=
 =?utf-8?B?WG5IMG5MS0FFemZER1FCRHRHM2VBZkN1aGdNeVhkdm9JMEZPVUdCa05lbTJ2?=
 =?utf-8?B?RHBXVVYxVUU2NHdNMnZBbXNSWW92NC9pa3Z1Y2JxaVplYWhFeGNVdFFjV0Zx?=
 =?utf-8?B?RnhYM25JRmxVcVFITXdJRDg3M1BrSitNc3g0OW1TVTVRMVlid3dTMkNycXhs?=
 =?utf-8?B?TnFuaXFLaXJvVUx2Ky9tWmdnT0JrNmtWNnYrcklaVkp0U1VtL204QjVFbkRU?=
 =?utf-8?B?Ui91ZHJyOCtwMnAzTlFkKy9SNFVVRHhmYlFFaUN4TlkrMDVDb0paSjJHSjZR?=
 =?utf-8?B?NFFUNUYySG92UWlQMzNKTHVDZlJpL2M4YlBJcXc1MHJ1U0ZGTXBwTktlMHp3?=
 =?utf-8?B?dWZyREMwRVA4bGVHVURuaFduTFB4a1k0MUxaT202OGZpWUtaTllub1M4ZDNX?=
 =?utf-8?B?eDUwbkFVYzRTbTUvVU1kY0FHMU4wVG93L0oyK2xaMmJZTnlvZ1VjZTREdHRP?=
 =?utf-8?B?Nm45U1JHU1JsdU9FWEFVQzhVS1B3SFo0RGhBclQvbjJtVDhiMmVSdy9QeC9z?=
 =?utf-8?B?UXdyZFlCcDMwOXdYbERpWi9TeVh0QWNtdEZZSXVabE1WK0FBU0NkVStvVGdr?=
 =?utf-8?B?K25Oc1l6M1cvQ2VXSThKQ2JSdGpybElPcmNoVTViVFZFR29YRW9SVWZhcjhG?=
 =?utf-8?B?clZxTHNHck1UY0NtWlVrVlYxV3RqcFkyQ202bS9ZL0FlUW9NS3kwV2pyMlNS?=
 =?utf-8?B?WDBMYXIxV01pNThUeXJjT2xCV2ZxTTdxRW1ZR3ZwT1RVTlVtZ2xybVd3RkxX?=
 =?utf-8?B?ZyszSEhvV2o4WDFEaTNYMk0vb2YvUGxkM0ovcWVJTXRUMXl5MkV0ZngzbDRi?=
 =?utf-8?B?enFTUzcrcnRCYXdEVGZGS1BDd05MR1JpZzJPcmFyeUxXejJmaXd0VWJyR2Zw?=
 =?utf-8?B?MEhUOUtPc3lPMFRyTjJSK1hOVEtuQ2VpZ3pGTDZkaXkzcHVINm1WWUxMZXFE?=
 =?utf-8?B?aE1EcW93T1JieHkzdWFLNjFOQzhTZVJ4NGg4b0JjUkNjbDRkRHBXSVFLWGlF?=
 =?utf-8?B?Yy8zRUJpOW1CdnlWTmFOWUczVXkwdTBCMjhFeWpmWS9PQnc1MG9wV28vbi9W?=
 =?utf-8?B?UlRFazZtRFZTTUQxLzg0ODltMFdYQzllUEhoWGl5UjdNWUdqdkRhVE5vNmJv?=
 =?utf-8?B?NyswcVJqRTAxb1R3L2pkMDk0NHorZGIzbU90NFJCTHY2U05JbUNLZnRUR1Yr?=
 =?utf-8?B?UGpDdTlhbm5vY1ZPS3N5U0sxeFRYeG4rOVBkbmVlOEZ4eFExTTIxZ1VWQWxY?=
 =?utf-8?B?Um5adGxMblFrczRpajIvVHBGdnpERjFhc0wwbHRadGVwd1U0MWMwTnlNM1RV?=
 =?utf-8?B?K3VEeEV0Y0VzOFdZbWs2bFdObThkTi9sakprUkN3Q0VheEtsMGNvekhZU3N1?=
 =?utf-8?B?S1VlRjhlL3ptdXg1czI0UCtUUEJqckxnV3d1bVpBMWJTSFQvdEl5RTZJcXFJ?=
 =?utf-8?B?dUdsZjhxckd3c0pGL0lFaTJGZXJhd0QzYWpZYzdBSEdEV0lpZWYzMXNqRU14?=
 =?utf-8?B?OHNTd1dJLzJGekJmM1JPcUw2VEE0RkRXSnpJd2ZpM2xsK2FxZFVVdVVPNVp5?=
 =?utf-8?B?VVRlaWozUkxRRWJ1UDJDTDhMTmNuOEdmL0czTUNiUThTMm5QeGo5eDNmeTNy?=
 =?utf-8?B?TWx1ZFRHcEplVWw5RzhMRXJDZzNiWWQ3WVBoV2t2bklYYnhpQnJDSm1KQk1R?=
 =?utf-8?B?ZFFVRGVJNE5GaE56SGRXTjhoNm4zOTBVQm9rMVJlQUxPekszK256MW9ReGpY?=
 =?utf-8?B?NEVKbUZkRlVlYlNSMGhXeHpER1pJYXZpNUIrcG9zUlVFenl6bXZtaTdBUGx6?=
 =?utf-8?B?UkJoekk0RDhENTFFU0dFWjhyc3VFOERVMm1WQi9xUEx5VUM2MHFJNEowdVI5?=
 =?utf-8?B?aFZrcE9KMnBFOG1MUjVGSm0wOFU3OWJFOUpkZHFnSnBVY0ZxMmFTTHY3OVhn?=
 =?utf-8?B?MmhLNCsyZWRrYXlxdmRMMVg2UXlWcEwzZGdJRm1aL3d3cGVrWHREMEVHWFZU?=
 =?utf-8?B?RmdvZzZ1U3MzMFhvYnQwc292SkE5WUdGVTFSQzZ2WVJQV1N0TTk0NjlwTGhK?=
 =?utf-8?Q?fLixJ5/4He2nU4o+ep1YiFgOd?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <25F4D31DE4FC9D498043B67180426B64@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4615.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e6f46e45-210e-4a80-eca4-08dcbcfb1b64
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2024 07:23:06.1809
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 Nq54tTUluS1niEN8O8plOf+3p4caEzcwwpsfJNWOkR7YCQS4Q9IpOoUdtHfmvbHQis51vAbklwzbS5okmdPWtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5200
Message-ID-Hash: OWMFVVYG6GLXUSVLETFDWOZ557EDCCJQ
X-Message-ID-Hash: OWMFVVYG6GLXUSVLETFDWOZ557EDCCJQ
X-MailFrom: Joakim.Tjernlund@infinera.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OWMFVVYG6GLXUSVLETFDWOZ557EDCCJQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

T24gVHVlLCAyMDI0LTA4LTEzIGF0IDE5OjExICswMjAwLCBKb2FraW0gVGplcm5sdW5kIHdyb3Rl
Og0KPiBPbiBUaHUsIDIwMjQtMDYtMTMgYXQgMTE6MDEgKzAyMDAsIEFtYWRldXN6IFPFgmF3acWE
c2tpIHdyb3RlOg0KPiA+IEl0IHdhcyByZXBvcnRlZCB0aGF0IHJlY2VudCBmaXggZm9yIG1lbW9y
eSBjb3JydXB0aW9uIGR1cmluZyB0b3BvbG9neQ0KPiA+IGxvYWQsIGNhdXNlcyBjb3JydXB0aW9u
IGluIG90aGVyIGNhc2VzLiBJbnN0ZWFkIG9mIGJlaW5nIG92ZXJlYWdlciB3aXRoDQo+ID4gY2hl
Y2tpbmcgdG9wb2xvZ3ksIGFzc3VtZSB0aGF0IGl0IGlzIHByb3Blcmx5IGZvcm1hdHRlZCBhbmQg
anVzdA0KPiA+IGR1cGxpY2F0ZSBzdHJpbmdzLg0KPiA+IA0KPiA+IFJlcG9ydGVkLWJ5OiBQaWVy
cmUtTG91aXMgQm9zc2FydCA8cGllcnJlLWxvdWlzLmJvc3NhcnRAbGludXguaW50ZWwuY29tPg0K
PiA+IENsb3NlczogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtc291bmQvMTcxODEyMjM2
NDUwLjIwMTM1OS4zMDE5MjEwOTE1MTA1NDI4NDQ3LmI0LXR5QGtlcm5lbC5vcmcvVC8jbThjNGJk
NWFiZjQ1Mzk2MGZkZTZmODI2YzRiN2Y4NDg4MWRhNjNlOWQNCj4gPiBTdWdnZXN0ZWQtYnk6IFDD
qXRlciBVamZhbHVzaSA8cGV0ZXIudWpmYWx1c2lAbGludXguaW50ZWwuY29tPg0KPiA+IFNpZ25l
ZC1vZmYtYnk6IEFtYWRldXN6IFPFgmF3acWEc2tpIDxhbWFkZXVzenguc2xhd2luc2tpQGxpbnV4
LmludGVsLmNvbT4NCj4gPiAtLS0NCj4gPiAgc291bmQvc29jL3NvYy10b3BvbG9neS5jIHwgMTIg
KysrLS0tLS0tLS0tDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDkgZGVs
ZXRpb25zKC0pDQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBhL3NvdW5kL3NvYy9zb2MtdG9wb2xvZ3ku
YyBiL3NvdW5kL3NvYy9zb2MtdG9wb2xvZ3kuYw0KPiA+IGluZGV4IDAyMjViYzVmYzQyNWEuLjRi
MTY2Mjk0NjAyZmEgMTAwNjQ0DQo+ID4gLS0tIGEvc291bmQvc29jL3NvYy10b3BvbG9neS5jDQo+
ID4gKysrIGIvc291bmQvc29jL3NvYy10b3BvbG9neS5jDQo+ID4gQEAgLTEwNTIsMjEgKzEwNTIs
MTUgQEAgc3RhdGljIGludCBzb2NfdHBsZ19kYXBtX2dyYXBoX2VsZW1zX2xvYWQoc3RydWN0IHNv
Y190cGxnICp0cGxnLA0KPiA+ICAJCQlicmVhazsNCj4gPiAgCQl9DQo+ID4gIA0KPiA+IC0JCXJv
dXRlLT5zb3VyY2UgPSBkZXZtX2ttZW1kdXAodHBsZy0+ZGV2LCBlbGVtLT5zb3VyY2UsDQo+ID4g
LQkJCQkJICAgICBtaW4oc3RybGVuKGVsZW0tPnNvdXJjZSksIG1heGxlbiksDQo+ID4gLQkJCQkJ
ICAgICBHRlBfS0VSTkVMKTsNCj4gPiAtCQlyb3V0ZS0+c2luayA9IGRldm1fa21lbWR1cCh0cGxn
LT5kZXYsIGVsZW0tPnNpbmssDQo+ID4gLQkJCQkJICAgbWluKHN0cmxlbihlbGVtLT5zaW5rKSwg
bWF4bGVuKSwNCj4gPiAtCQkJCQkgICBHRlBfS0VSTkVMKTsNCj4gPiArCQlyb3V0ZS0+c291cmNl
ID0gZGV2bV9rc3RyZHVwKHRwbGctPmRldiwgZWxlbS0+c291cmNlLCBHRlBfS0VSTkVMKTsNCj4g
PiArCQlyb3V0ZS0+c2luayA9IGRldm1fa3N0cmR1cCh0cGxnLT5kZXYsIGVsZW0tPnNpbmssIEdG
UF9LRVJORUwpOw0KPiA+ICAJCWlmICghcm91dGUtPnNvdXJjZSB8fCAhcm91dGUtPnNpbmspIHsN
Cj4gPiAgCQkJcmV0ID0gLUVOT01FTTsNCj4gPiAgCQkJYnJlYWs7DQo+ID4gIAkJfQ0KPiA+ICAN
Cj4gPiAgCQlpZiAoc3RybmxlbihlbGVtLT5jb250cm9sLCBtYXhsZW4pICE9IDApIHsNCj4gPiAt
CQkJcm91dGUtPmNvbnRyb2wgPSBkZXZtX2ttZW1kdXAodHBsZy0+ZGV2LCBlbGVtLT5jb250cm9s
LA0KPiA+IC0JCQkJCQkgICAgICBtaW4oc3RybGVuKGVsZW0tPmNvbnRyb2wpLCBtYXhsZW4pLA0K
PiA+IC0JCQkJCQkgICAgICBHRlBfS0VSTkVMKTsNCj4gPiArCQkJcm91dGUtPmNvbnRyb2wgPSBk
ZXZtX2tzdHJkdXAodHBsZy0+ZGV2LCBlbGVtLT5jb250cm9sLCBHRlBfS0VSTkVMKTsNCj4gPiAg
CQkJaWYgKCFyb3V0ZS0+Y29udHJvbCkgew0KPiA+ICAJCQkJcmV0ID0gLUVOT01FTTsNCj4gPiAg
CQkJCWJyZWFrOw0KPiANCj4gSSBhbSBnZXR0aW5nIHZlcnkgc2ltaWxhciBjb3JydXB0aW9uL1NP
RiBlcnJvcnMgaW4gNi42LjQ1IGJ1dCB0aGVyZSBpcyBubyBzaW1pbGFyDQo+IGZpeCBpbiA2LjYu
eCB0aGF0IEkgY2FuIHNlZS4gSGFuZCBoYWNrZWQgdGhpcyBwYXRjaCBhbmQgbm93IHRoZSBlcnJv
cnMgYXJlIGdvbmU6DQo+IA0KPiAtLS0gLi9zb3VuZC9zb2Mvc29jLXRvcG9sb2d5LmMub3JnCTIw
MjQtMDgtMTMgMTc6NTg6NDkuODM3Mjk1NDg0ICswMjAwDQo+ICsrKyAuL3NvdW5kL3NvYy9zb2Mt
dG9wb2xvZ3kuYwkyMDI0LTA4LTEzIDE4OjIwOjQ0LjU2NDEwNzAyNCArMDIwMA0KPiBAQCAtMTA2
MCwyMyArMTA2MCwxNSBAQA0KPiAgCQkJYnJlYWs7DQo+ICAJCX0NCj4gIA0KPiAtCQlyb3V0ZS0+
c291cmNlID0gZGV2bV9rbWVtZHVwKHRwbGctPmRldiwgZWxlbS0+c291cmNlLA0KPiAtCQkJCQkg
ICAgIG1pbihzdHJsZW4oZWxlbS0+c291cmNlKSwNCj4gLQkJCQkJCSBTTkRSVl9DVExfRUxFTV9J
RF9OQU1FX01BWExFTiksDQo+IC0JCQkJCSAgICAgR0ZQX0tFUk5FTCk7DQo+IC0JCXJvdXRlLT5z
aW5rID0gZGV2bV9rbWVtZHVwKHRwbGctPmRldiwgZWxlbS0+c2luaywNCj4gLQkJCQkJICAgbWlu
KHN0cmxlbihlbGVtLT5zaW5rKSwgU05EUlZfQ1RMX0VMRU1fSURfTkFNRV9NQVhMRU4pLA0KPiAt
CQkJCQkgICBHRlBfS0VSTkVMKTsNCj4gKwkJcm91dGUtPnNvdXJjZSA9IGRldm1fa3N0cmR1cCh0
cGxnLT5kZXYsIGVsZW0tPnNvdXJjZSwgR0ZQX0tFUk5FTCk7DQo+ICsJCXJvdXRlLT5zaW5rID0g
ZGV2bV9rc3RyZHVwKHRwbGctPmRldiwgZWxlbS0+c2luaywgR0ZQX0tFUk5FTCk7DQo+ICAJCWlm
ICghcm91dGUtPnNvdXJjZSB8fCAhcm91dGUtPnNpbmspIHsNCj4gIAkJCXJldCA9IC1FTk9NRU07
DQo+ICAJCQlicmVhazsNCj4gIAkJfQ0KPiAgDQo+ICAJCWlmIChzdHJubGVuKGVsZW0tPmNvbnRy
b2wsIFNORFJWX0NUTF9FTEVNX0lEX05BTUVfTUFYTEVOKSAhPSAwKSB7DQo+IC0JCQlyb3V0ZS0+
Y29udHJvbCA9IGRldm1fa21lbWR1cCh0cGxnLT5kZXYsIGVsZW0tPmNvbnRyb2wsDQo+IC0JCQkJ
CQkgICAgICBtaW4oc3RybGVuKGVsZW0tPmNvbnRyb2wpLA0KPiAtCQkJCQkJCSAgU05EUlZfQ1RM
X0VMRU1fSURfTkFNRV9NQVhMRU4pLA0KPiAtCQkJCQkJICAgICAgR0ZQX0tFUk5FTCk7DQo+ICsJ
CQlyb3V0ZS0+Y29udHJvbCA9IGRldm1fa3N0cmR1cCh0cGxnLT5kZXYsIGVsZW0tPmNvbnRyb2ws
IEdGUF9LRVJORUwpOw0KPiAgCQkJaWYgKCFyb3V0ZS0+Y29udHJvbCkgew0KPiAgCQkJCXJldCA9
IC1FTk9NRU07DQo+ICAJCQkJYnJlYWs7DQo+IA0KPiAgICAgIA0KPiBKdXN0IGx1Y2s/DQo+IA0K
PiAgSm9ja2UNCg0KTmV2ZXIgbWluZCwgaXQgd2FzIGp1c3QgYWRkZWQgdG8gNi42Lnggc3RhYmxl
IHF1ZXVlLg0KDQogSm9ja2UNCg==
