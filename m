Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 430DB729416
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Jun 2023 11:04:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C55C208;
	Fri,  9 Jun 2023 11:04:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C55C208
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686301494;
	bh=vSjIRgEqIMhZYBsF2v2tYTwCU7mrif4ivrzjtZKqGzo=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LihnwYb2oXQzup4nM0Zbgb8/Jbf0gIePmQvk7rVWVPy8LndrNY5xcFA35hkqFLDkc
	 EAwg+W3d/4S5EosmOh9vl+6r1TbfaU7XKPnQp2nYExUHom49y36aKM33VoqU5yfOVY
	 sTdLnoowKkyT7qKEDmg92AUlAWsKODYpZSzDEjV8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7E39FF80254; Fri,  9 Jun 2023 11:04:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D5DBDF8016C;
	Fri,  9 Jun 2023 11:04:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A8C55F80199; Fri,  9 Jun 2023 11:03:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3B75DF800ED
	for <alsa-devel@alsa-project.org>; Fri,  9 Jun 2023 11:03:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3B75DF800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=JLWWsXJP;
	dkim=pass (1024-bit key,
 unprotected) header.d=microchiptechnology.onmicrosoft.com
 header.i=@microchiptechnology.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-microchiptechnology-onmicrosoft-com header.b=ITzMXymP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1686301432; x=1717837432;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=vSjIRgEqIMhZYBsF2v2tYTwCU7mrif4ivrzjtZKqGzo=;
  b=JLWWsXJPVp+RlBB0G3Nfc5QmB5muIZXrQaT75IP82wLfXp328LAxMZh1
   7I7RIRtfRmOPYRQ3bGrOY230txPdMTvyytnJWI8UP7cSPKQ9zt01CgHPS
   lm1mYHulXrCxGN2wpFepk37f0vKOJX/mad+ddYZ3agrxR51WmMmnHnerS
   jO3dL7iwX8RR2VgBh/2DVP7UdrBusBHwsPf3I78NVRMc3KXslmuqUd1/+
   qgALtZ44zG3Do4TKF4SrkfibeuMYiiZ3NMSxhIwiU6BJPr7uz6HuQV58G
   JZVMSPDzQ3U9NgInUpoJa/0xVt+3f0MV/WEmDbjp+rSGl3Tpi1Fx5CD8D
   g==;
X-IronPort-AV: E=Sophos;i="6.00,228,1681196400";
   d="scan'208";a="217032124"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 09 Jun 2023 02:03:47 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 9 Jun 2023 02:03:41 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 9 Jun 2023 02:03:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dFr1BBd8th3g9+sftELEhzdmjwnY2ajBETCEaaz1pQyj+sTbIGVtSUOPKOorZTmBkP+DKD6xx5Iyw0wNLf1SdU9UH0PCPKIYVgITn+s1DRVWFlwuCWWTIPpcSqb1YfyZ7MXE2UOBQS+pYjn/uFWVFWwr707prkhCQCs7mWPOmGbjCFCarXI942PRNDuxeV+PGkXu70rcRpiLaA0UBH/dBgD7ZKyaPtNWaS+inwQULyCFOSxMEL65ifqYK2SiqjShRCNvt1/iGtMxGhkVi/RTJ3KHL/bzRZnMfYIFE01o+Y8nv0yEBts0q+bvmK3JtJeEHc1ZJJFSKMnPDqHnZ2gy+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vSjIRgEqIMhZYBsF2v2tYTwCU7mrif4ivrzjtZKqGzo=;
 b=K/uNvQKKPhwoSdGktXVHnnNgJg3JEzm2B7JaNLL7XSZ5kOotU11jnoTHvKuZYNutonAyBf/dI5FDp1EUtsLXrkbot3MI/ktG+SO7xKPSddHsK1UhMPiKkQoRgqpk5C7W97I0/oZPHCfCO5ynEhFJPdz2ZrbDpPWEcTeakt7YWqsxafgvpDq+LMVHYaYSmmWK0eAWvmd3/02/508en60qYTrLzr0zJuXENNOtOsxNmEt65zTePZUORLBS1ywRoJJSABzRQMkW5IT1BkZyvTihXLMHldbmUHF0XxldIImoyzKZQCjClAgY2MwoP+HqVgyHtJB/H/Bv3oOiLllCPG9SKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vSjIRgEqIMhZYBsF2v2tYTwCU7mrif4ivrzjtZKqGzo=;
 b=ITzMXymP9WROIAoohQX7fSFA7HU2O3UtBUW4a1WM1CryzDgaIO6mEH0mg4jfchoXpdA2o95LqMXnD9dh/dWwAPlbRcpQWXW01LT6s9xmT7PkRmJGJy8hF/aGH9sxr97ERlqWPYl5fcyD9THsadvz7nZvww9kcA7wY0yvTBoI6Jo=
Received: from SJ2PR11MB7648.namprd11.prod.outlook.com (2603:10b6:a03:4c3::17)
 by SA2PR11MB5017.namprd11.prod.outlook.com (2603:10b6:806:11e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.44; Fri, 9 Jun
 2023 09:03:40 +0000
Received: from SJ2PR11MB7648.namprd11.prod.outlook.com
 ([fe80::27bf:a69f:806f:67be]) by SJ2PR11MB7648.namprd11.prod.outlook.com
 ([fe80::27bf:a69f:806f:67be%5]) with mapi id 15.20.6433.024; Fri, 9 Jun 2023
 09:03:39 +0000
From: <Claudiu.Beznea@microchip.com>
To: <kuninori.morimoto.gx@renesas.com>, <alexandre.belloni@bootlin.com>,
	<perex@perex.cz>, <lgirdwood@gmail.com>, <broonie@kernel.org>,
	<Nicolas.Ferre@microchip.com>, <tiwai@suse.com>
CC: <alsa-devel@alsa-project.org>
Subject: Re: [PATCH v2 3/5] ASoC: atmel: use use new trigger ordering method
Thread-Topic: [PATCH v2 3/5] ASoC: atmel: use use new trigger ordering method
Thread-Index: AQHZmrFHZfIyqRCM20eCzk3VjLq4yA==
Date: Fri, 9 Jun 2023 09:03:39 +0000
Message-ID: <cd10f9ee-e623-72ff-da9d-471a1cf285e1@microchip.com>
References: <87sfb2fo0d.wl-kuninori.morimoto.gx@renesas.com>
 <87o7lqfnzb.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87o7lqfnzb.wl-kuninori.morimoto.gx@renesas.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR11MB7648:EE_|SA2PR11MB5017:EE_
x-ms-office365-filtering-correlation-id: f1121952-f4ac-4098-a672-08db68c86a5b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 t4A8ym41nKFyMCalremhoWVy/YmZGvxL6VuOxvYTMX8kXO1AiHEg6K4jv7E/wuHjZKBw40AhVQNQ/LunQgSZ2cltd6hnxb7DN7FiNpSfTSU3HiivRVAnt0ExCj3xpQjJyml8rKNSZCPM/JfBdWOdJP8L8jrUlHe0sILOr+h/PpkZZ2YmHNpw8YEGEsn4IlGZgIyRf8RF3yQh8wOZK1CBCy1vZHf3Z4ZJP1AXYjm4SI52YVaIyTsZtVRnpPsvBWVZRRrgG2A/LhIJIJ3bbq66Rpw+uL5GK+7VwivUvoSwzISLeAhAl8ay1d706v8W+qiVDfJhHRiA4+PkOxdLsA32fPOMYQNk1G8m0Hw80o+k82WG8JaWYUuCMvQ46cRYVbJxy+ZxQR+dJEuhGkQusLzU85f3c1yFgY6HyQBsP/uZGRdjcyBwChC4ik14+y5daWwpoYDUFpvQG++E5C81bD7P8v6x0cDNUh1PhHMk6V8DVMdCdpJluwf/GK/+WxtQ2vJokElTbnyaCbKHJ4MbF4Duc4+dVL3hPbZhczo5WWnlLcrFwjybggCGdG3/GMBaxxJmPPrIxGO93PR9aAgu0fdqSPLbYzP6IBRVWMVgIwGmMoLdjEUsbuDOBLVUVwo0MtHmPoVoLLfhEiG6/LNM2u6cBvnWLYHHncfzNZckVCgCi84OddVkoHzfkm9FWN4ac13d
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(39860400002)(376002)(366004)(136003)(396003)(451199021)(186003)(478600001)(110136005)(36756003)(6486002)(26005)(6512007)(6506007)(53546011)(71200400001)(41300700001)(83380400001)(316002)(38100700002)(38070700005)(2906002)(4744005)(5660300002)(8676002)(8936002)(31686004)(86362001)(66946007)(76116006)(91956017)(122000001)(64756008)(66446008)(66476007)(66556008)(31696002)(2616005)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?eENJU3hOSE04TjR0NkxucHJyY3lna0JmajNBdk5Ea0FudVp1MTJ3WnZ5SzJM?=
 =?utf-8?B?YkUwemd6QzJiRlNEWFk0cHJINlJMZ2F1Tmg4ZzZsMmRHcTFwY05tc1BDRm1K?=
 =?utf-8?B?cDNaQ1VzbDN2Um1POWdqUzFYeXA0UGx0OSs0eFlYemtjQ2xKcTF0SDBUcE1E?=
 =?utf-8?B?OXg5Z0QvRzA3ZkJtWjlQMVZkUUFrekhqQ3pBaU1sTkZpUStXNitLMGxhL0xC?=
 =?utf-8?B?dXRKbDZ1a1FYTjh6YkJGK3RkNmJlWmJkbnQ0UWNPT1Zma1ZoQ2VCUC9FbllU?=
 =?utf-8?B?VXY5b2dlc0dQQkNpaVRKRENka2JPRkN6YnJTZmVQMVI2dHZJQzg3NzdmL3FP?=
 =?utf-8?B?ZThWZnJjdkMwK3JOdFBoWlhjc3F6Y3RtSm9xN1VwcU5PcHozSTF1NTdBMUww?=
 =?utf-8?B?TVhUNmpyazZlekYzakVGZ040K3pIVWRBRmRVTVlxR05WUUZMcCtSbmtQbXY4?=
 =?utf-8?B?TWR3clBteUYxTVpmaTk1SVc4cUd6Z2lXb3dYOWVqVmpsZnZocCtBb1lWTXlT?=
 =?utf-8?B?QVZvcFhXa3hnWVlZREdFQldoaHNKdzMvNTBrZm8yUkk2a1lwN0QxWDY1VnVK?=
 =?utf-8?B?UW9seWN4RnVnelNQTmp3QlQ4aWRoV2x3aVBVTWo4NVZURGhWalBGZlNwd3Mx?=
 =?utf-8?B?UVNWQXV3Ukw3WngzcVJ4dDRQdWVJdHQ0aG55WTBpaGlZcmxhRHdqYTMyVWJi?=
 =?utf-8?B?ekJqWW1GVFNFVkdDYXkvTUc1ZXIzUGRoK2ZHd3M0YkMzbnV3T2h0bE5lTWhG?=
 =?utf-8?B?c3hpYVVVSENHSXFWYTFsOXB3S2lzOEtZVkpUdmNKRmQ3NFhYNUQzczJhdkpR?=
 =?utf-8?B?QWhKZTlJUVBkQkNGK1IvOWtrUlVVTUhsTWtTZW9LUExrcndhbzQrb3UxWGNn?=
 =?utf-8?B?Mit4V1ZiN2kydExFS0pHUjV5a1dBWXB4TmtpZkluNXJEbnFlVFlKRWlKckJM?=
 =?utf-8?B?SGk1Y0RWRit5VjUvck9nY1RFZEVKVW82VUpPRDJsZ1JWRUF5Y0c5eEZTNW54?=
 =?utf-8?B?TVAyTEdWc2MzTzZTS3FiVDMyVVhxeTNnM2NKalJXUlBvKzg5OXZtN3JxUis1?=
 =?utf-8?B?bEVReEZycFBOMGRlMWZ1WC82Y2svTnBla1I5WjBreVEvMEM3NElDbGg0UFMv?=
 =?utf-8?B?MDNUUUp3ZUpKc3ZFRExGb3lxM2NWM2sxMlNUR3RRVGhEc2VRN21GMG5VZ3Fs?=
 =?utf-8?B?Q1hTZ29SK2hpMnc0L096dDVTQnJ6MmU5R1dVZ21kWERsbk5TZkRVVW82U0JM?=
 =?utf-8?B?dFF4OVFTQWphUFpVQzlReDEwOE16aHl3TVl3WWl5QXZNRHo3NnZwbnNGV2Fy?=
 =?utf-8?B?Ty85Znp0cUduNjlzMEJWQzNDcm1jVlBzOUczWWtqR1IxajFVK2lyM1liTmtQ?=
 =?utf-8?B?NkprUWF1YW0wSU1oMjFQNjFqQTVUV2RqVzcvZmc0V2ljbm9JY2pSeVdKaGZL?=
 =?utf-8?B?bWluYUFPa1hxTkxxZDZ1dk1VRUw1OVJ5MWNpYXhmbkRuc25kYXd2ZVRrSmtU?=
 =?utf-8?B?bitKdUdCWXZDNjh1cTdEZjg3WTRJTG1tVVBpN0JLWEhySXBEVkppMnp3b1lK?=
 =?utf-8?B?Z2dCUDljRy95ZnlMM3FFVVVDWWU1TnNnOGNuZFNBa0FONm1NYkJyWVp6Q0dP?=
 =?utf-8?B?YlNYTVQ4elpTZDZWazVnbEl5SXZxL2ZvczIwV00waVdzV0tteTEwT1Q2bExG?=
 =?utf-8?B?NHZiY29kRUJIMXVzQVZGWUs5d2xOSGJ3QjcxZkRxUlVVSW1od3ljKzBmVi9N?=
 =?utf-8?B?d2s5WlJscEo3ekhvVm1rSnpxQWhFbEF5eG0zbWpULy9reTJmUWNCN3o4U0cz?=
 =?utf-8?B?Zk5qcWRwekRpMlZKNDJrdERDRnVhc3EvVW9ZMCtKNm1WQ1AxUGR6WTRMOTJB?=
 =?utf-8?B?RlZubWlhVWQvTVMyZEVlZ0RLbmFTcUo4S1NMbHVTQzNtekNURU10eWN5SVkw?=
 =?utf-8?B?Tjl4Z3dYemlCOGgvTHdYWWVYWDB6anp2SnlLVGZ0S09xeGdsRWRab24vYVE1?=
 =?utf-8?B?T2xxZFNEbW94d3FKSWlPUSt0bDRpTkRqUnBKa2l3VTZXZURiVDBlelIvQ2hQ?=
 =?utf-8?B?Y1VRY0VtTEtGamUycmQ0M3NONGlqSGhDREJSb1VPODQ1UGYrRFYvU3o0cmxK?=
 =?utf-8?B?RzZkL1FXeC9ZTmc4RG5uMzFZK0s0SGRVckpOOGcvVmlvdVcxQndVWW1haExV?=
 =?utf-8?B?MFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D52631BAE71D9E40AD958CE218EBB824@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f1121952-f4ac-4098-a672-08db68c86a5b
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2023 09:03:39.0113
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 MZYtMWD6i+B820ua+33bvtGOVnTTSjovcdpwmxJwMHb5g1pSTovaNdLIx8sI/uHW6b470QeQsxi0yra4bNDfC9XufxFpf/zJzFL9zXKW/x8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5017
Message-ID-Hash: DQWANOW5DCSO3WWTLQJTBWTAMVZ7GYXC
X-Message-ID-Hash: DQWANOW5DCSO3WWTLQJTBWTAMVZ7GYXC
X-MailFrom: Claudiu.Beznea@microchip.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DQWANOW5DCSO3WWTLQJTBWTAMVZ7GYXC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

T24gMDguMDYuMjAyMyAwOTo0OCwgS3VuaW5vcmkgTW9yaW1vdG8gd3JvdGU6DQo+IEVYVEVSTkFM
IEVNQUlMOiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91
IGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZQ0KPiANCj4gQVNvQyBpcyBub3cgc3VwcG9ydGluZyBn
ZW5lcmljIHRyaWdnZXIgb3JkZXJpbmcgbWV0aG9kLg0KPiBUaGlzIHBhdGNoIHN3aXRjaCB0byB1
c2UgaXQuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBLdW5pbm9yaSBNb3JpbW90byA8a3VuaW5vcmku
bW9yaW1vdG8uZ3hAcmVuZXNhcy5jb20+DQoNClJldmlld2VkLWJ5OiBDbGF1ZGl1IEJlem5lYSA8
Y2xhdWRpdS5iZXpuZWFAbWljcm9jaGlwLmNvbT4NClRlc3RlZC1ieTogQ2xhdWRpdSBCZXpuZWEg
PGNsYXVkaXUuYmV6bmVhQG1pY3JvY2hpcC5jb20+DQoNCj4gLS0tDQo+ICBzb3VuZC9zb2MvYXRt
ZWwvbWNocC1wZG1jLmMgfCAyICstDQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9zb3VuZC9zb2MvYXRtZWwvbWNocC1w
ZG1jLmMgYi9zb3VuZC9zb2MvYXRtZWwvbWNocC1wZG1jLmMNCj4gaW5kZXggZGEyMzg1NWEwZTQw
Li5jNzljNzNlNjc5MWUgMTAwNjQ0DQo+IC0tLSBhL3NvdW5kL3NvYy9hdG1lbC9tY2hwLXBkbWMu
Yw0KPiArKysgYi9zb3VuZC9zb2MvYXRtZWwvbWNocC1wZG1jLmMNCj4gQEAgLTQyMyw3ICs0MjMs
NyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHNuZF9zb2NfY29tcG9uZW50X2RyaXZlciBtY2hwX3Bk
bWNfZGFpX2NvbXBvbmVudCA9IHsNCj4gICAgICAgICAub3BlbiA9ICZtY2hwX3BkbWNfb3BlbiwN
Cj4gICAgICAgICAuY2xvc2UgPSAmbWNocF9wZG1jX2Nsb3NlLA0KPiAgICAgICAgIC5sZWdhY3lf
ZGFpX25hbWluZyA9IDEsDQo+IC0gICAgICAgLnN0YXJ0X2RtYV9sYXN0ID0gMSwNCj4gKyAgICAg
ICAudHJpZ2dlcl9zdGFydCA9IFNORF9TT0NfVFJJR0dFUl9PUkRFUl9MREMsDQo+ICB9Ow0KPiAN
Cj4gIHN0YXRpYyBjb25zdCB1bnNpZ25lZCBpbnQgbWNocF9wZG1jXzFtaWNbXSA9IHsxfTsNCj4g
LS0NCj4gMi4yNS4xDQo+IA0KDQo=
