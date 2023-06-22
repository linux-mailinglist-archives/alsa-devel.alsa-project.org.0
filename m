Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E249739F3E
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Jun 2023 13:05:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B99C3839;
	Thu, 22 Jun 2023 13:04:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B99C3839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687431921;
	bh=mAqoP6onyaA+B8DA1tkEOnKo2W+hgxiwP5oPv07qQbY=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=l20Baecs+mfbe5ZrGhuKmg0jUWz5VljiSXTo/fhp2E1OGPpTDkJ4grNDp8m9lX9PU
	 3AYpDfaN2iXFMAk7cV90p6bR2mAqbFShvG7lK+d+bUPbXnYvIJIOWLw+sjBjxKzeEX
	 BpvRAlogadns5vpEaOwmGgoKw7nFvD49O+xgtvQY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 359D8F8051E; Thu, 22 Jun 2023 13:04:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ADE74F80132;
	Thu, 22 Jun 2023 13:04:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C4787F80141; Thu, 22 Jun 2023 13:04:25 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id F2BD5F80130
	for <alsa-devel@alsa-project.org>; Thu, 22 Jun 2023 13:04:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F2BD5F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=iPAsyepI;
	dkim=pass (1024-bit key,
 unprotected) header.d=microchiptechnology.onmicrosoft.com
 header.i=@microchiptechnology.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-microchiptechnology-onmicrosoft-com header.b=M2zK3oDc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1687431859; x=1718967859;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=mAqoP6onyaA+B8DA1tkEOnKo2W+hgxiwP5oPv07qQbY=;
  b=iPAsyepIwsDUh/Ae0EE1g+WI2pa0mjqHNxy+zueX/moK7HmDLvDM5/k5
   KfFlyxVzAQDkkEhIxyi+OBOacTPmvBkgSARKIv52cRH76MHjJPB1QWlPm
   lfQQZ+AurDujZURYm04yhVDvOBoWzGjddeP9x4Rhj35IaAIk11JKT23zR
   XmC1YCm8OEk0sMaaDnZyNh2g3a1CF8l3cbxstQ8W3nCRn0F0VfyXwrf5s
   wN2R4HkXOJOH7PPtEpKDx5wP/t6kfJOFaFyk/3MnDT9k/dhUhUnJnZdQu
   XPFuu78PoSQG6JXTuHy+7Dwm6/00i3NkT0eZUFY7OZArSXKCPg+Bw8PQM
   w==;
X-IronPort-AV: E=Sophos;i="6.00,263,1681196400";
   d="scan'208";a="219235100"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 22 Jun 2023 04:04:10 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 22 Jun 2023 04:04:10 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 22 Jun 2023 04:04:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OlsMEVG4P80J4+QNrT1OBiCFbCXyDeIhrCjtZBtN/zC8Qu5YBVS7oUi3hVDu3sXRKUcYRdeXj+7YNeQW7DltiOda3w6X4NnDqKcDAMz9aQC8ktZny3HpehRr7/k4oMySMxGPbJl3/Xmev5nBmBFWoU0PaQH8rU3UXBfG6Le5YG7Lpfy0TVNFXGjErNFHsk0CKCSDn1CNsd5xJWrVj/gZOGTbqKlW191dD984ZGvjqub5zcisi4B41MhBqyQZ0JzkQLw6I/aPawdtMFdpbyKs70xIj6hTBmMREEs59y1QuEpqJcw13XPKRR6a9pcyREShhpdsZvu3QIzr8xx3mz79Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mAqoP6onyaA+B8DA1tkEOnKo2W+hgxiwP5oPv07qQbY=;
 b=M08xVBQY2Lw9OzAYWDWyMV3CdG58A1JLRW/AkX+cDsgBCfubM8QuT0dNHw9GZzkzTKDqVuSvM+cjqfCufs/AlWTcDf3VXoiOc6SNu2JzmNUq2LA6GanMVTZhAeiv+jG7uqBc7SHb4KDWZ6sGryeoU0rRrCyLP0581mt0IWUcPEiTjB3ipPhszkKa90zeQ64Zp6ejf+cCHVYdwvPy8gi2yY3uqUXQGmrFyQFpFMkaxhhJn0PTAf2BZB4fG2icHXm6UNun+l6jG608s9ocerf6LPZ8NQBw+2lzdc4XAOWfVcjiIoHN8tHYr5LCQ0vnTBO4mcAjnfBplZ6W+Yn6RBJFJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mAqoP6onyaA+B8DA1tkEOnKo2W+hgxiwP5oPv07qQbY=;
 b=M2zK3oDcijtFMdGn6rnLsCTdXiPx+DGQpXPC/eFqnuoMzIEoY+8l8JOFmrozyyOfmhcqaz6XX2sgBGkwWAoUe5tIGf0xQoKeRlGgiywvhBOuSkbuLS9iNYfGIts6O2576fdos50D//C16rmjqcP9yqJROXCtLRDLmWackichFsQ=
Received: from SJ2PR11MB7648.namprd11.prod.outlook.com (2603:10b6:a03:4c3::17)
 by IA0PR11MB8418.namprd11.prod.outlook.com (2603:10b6:208:487::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.21; Thu, 22 Jun
 2023 11:04:07 +0000
Received: from SJ2PR11MB7648.namprd11.prod.outlook.com
 ([fe80::27bf:a69f:806f:67be]) by SJ2PR11MB7648.namprd11.prod.outlook.com
 ([fe80::27bf:a69f:806f:67be%5]) with mapi id 15.20.6500.031; Thu, 22 Jun 2023
 11:04:06 +0000
From: <Claudiu.Beznea@microchip.com>
To: <robh@kernel.org>, <lgirdwood@gmail.com>, <broonie@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
	<codrin.ciubotariu@microchip.com>
CC: <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ASoC: dt-bindings: microchip,sama7g5-pdmc: Simplify
 "microchip,mic-pos" constraints
Thread-Topic: [PATCH] ASoC: dt-bindings: microchip,sama7g5-pdmc: Simplify
 "microchip,mic-pos" constraints
Thread-Index: AQHZpPlDqfs7yK4m8E+8MrwZYTlIvg==
Date: Thu, 22 Jun 2023 11:04:06 +0000
Message-ID: <b1dbef0b-0c25-c646-58c1-f57bc4d13e62@microchip.com>
References: <20230621231044.3816914-1-robh@kernel.org>
In-Reply-To: <20230621231044.3816914-1-robh@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR11MB7648:EE_|IA0PR11MB8418:EE_
x-ms-office365-filtering-correlation-id: 4f57a76a-31c4-4fc2-cf67-08db731065c6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 rJp+BqVGeHUa5/qkY4ILREJ9e0Itqu7V5EghCKMNsvKRSAy3ybRdJsPkS1RXUlJeJ/9anGn+z3JmAUWvg90tCv0gUTA3wvGZPScBvViY20TxvqRhNhR7BJ5x3DP0XvimskIEeefhyZpnbl8+j05xEzWyLrvWasETFh+VBpLhernW+K6/dyaIs1+zrc0pxDTUR64ESKmITt66MlCtETCovUXzRMLTKW0rKgNMuGYCrCze3qn8oKPCIVtvJRH0un1jaBsngavo+zDLlv3hILD3i6mwTHd1XHGfsBV7nQwlH9cfkizgcLdYI2rcjp2Tk5PFytTaQVoj20vjNJ4SzI8jQfbJHIMHOt9l8Ht1WEP2vjO/ShNFQCr1XJop6WIUe9Vr4EP1hYwqb7pFX12OEJVvJ/y+Y8ttAZM1rdm2TEdIt6J2MNbvoRtSkYOwn2pWtig9xhS7J8eYPn9WRazjGBeY59s7tR21W6n2BvONeuXRz5ut2pqa4eVizuJt34me2wzNOGGL9lCl9BcbzrIRlGR807z7CsujT4K0WnO6hfQXyGVtlnke9ALY43jNsfQEcoRsfutMSNBJJY4OzbRqqZfD1jShymnkj7X4hi1u0EK9ak6tZFKBdBp+2rOUNvw/3Tc+wSJqM9hQ+LIbm+Kg/6D25ADwsEZUPnASZQyqgu0XH3GhPEedfBLd7hDHKFGlztCA
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(346002)(396003)(39860400002)(376002)(366004)(451199021)(31696002)(36756003)(86362001)(38070700005)(31686004)(122000001)(38100700002)(8676002)(83380400001)(66476007)(54906003)(6512007)(186003)(26005)(41300700001)(6506007)(53546011)(2616005)(316002)(66556008)(76116006)(66946007)(91956017)(64756008)(66446008)(6636002)(6486002)(71200400001)(4326008)(8936002)(478600001)(110136005)(2906002)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?VjIweXRCWkZOeEk1NWc1ZVAyeThXS3orZHI0czV4TUw1U244RndsbEJXTVFu?=
 =?utf-8?B?TDhldlVndU5PYTk3ZkJ6L0ZHMVUrdGxLTGFVN0dwVjNCZ2FBNHpGL0lCYnh0?=
 =?utf-8?B?andKcHlhS3Q0bTdtRFA1dzRGSW53YzFQRDNGUzd5MGl2U0VWSjl4Slp3N054?=
 =?utf-8?B?Umk5Z1lUak9oN0xPRWlJNDVEMUxiSUU1MS9Bem4zMFhsY3FjdmlqQ3Erb2hG?=
 =?utf-8?B?TDlzbytOVDJYc0FjeHNXaDI3LytEZVBHTUc0QzAyVmVLVVJEUTRYNGJXRU5V?=
 =?utf-8?B?SGpLTDl2WUE2cWhob3hUbDVJak9aTFFUWm41L01PRUVmZVBsc3lTRFhxZWhK?=
 =?utf-8?B?SjEvMjN2OWRVL3VXcXZEM1FiaDRRQzJ3V2p6cFBqVEZNYVp0eHQwakZ6Z2du?=
 =?utf-8?B?NUc3NWFnaGVvcTR1UTREOFNyb2l2ZzFXT2dZNmR4QW5TNWxWTUFxdldKaGxC?=
 =?utf-8?B?dXVUL2RFOEt4SHBWdHlheFVkbDNPN1ZIcWRVN21zN0xMbTlCYXlkYmNnQXcv?=
 =?utf-8?B?S1lIZVh2MGJhcTFsY0NBeUhlUFVINEdVNzh0Q29oUkdERjRieGR5Uk4wa3ky?=
 =?utf-8?B?WjZNdkQrYWFWYmRlRzBBSFRLRTB6N3dyUGVUT2FzcU5ERFVqcW1Rd0lqSWFW?=
 =?utf-8?B?K0s5emRjM0gzY1oyTnVXanQxdE5vamNHYmtKMndGNGxKTTZwcUR1U1JCc2xB?=
 =?utf-8?B?WnN3YVd1MGNPZUZpeVBSQUcxOE1aNWNDYnMvdkUyanFWaTYzbTJQbGp4WnBO?=
 =?utf-8?B?TDFtY3dpRVlOaGl3M2l5K2JGZndPUm14am1FNWRpdGVDUCtGSWdLQi9CK2tn?=
 =?utf-8?B?Mjl3RU4zOGZTYjdUd2hGVkN6NGxIWStYdFRWTnRvNUkyVnZzNUpvS1NNVTdT?=
 =?utf-8?B?SmNUSkF4T2hYcXJEN2RRV2pZS0x3OXY1T044SlgwQnZnZG1DTFIya202MmRz?=
 =?utf-8?B?Zi84OUx6d3hpV1BWNk1ockdtRHVLMHVVV3p4T1JoSnFFMUxDd1pGbjMvNmdO?=
 =?utf-8?B?VFhkQ1BFbmdZNTMweHBVa2RsZFJHdU9HUDl3Q1g3M1lCaVdwQjhQV08vS2ty?=
 =?utf-8?B?UE1zYUYyNkVlSjNiYXJ4RFpGQ1p2UGFKeWJKN1hXV09jbzB2VldoZkRTdEpD?=
 =?utf-8?B?MXAwOFJVRG5nc3FWdU5lcWl3YlBYS3dISVVuU0xVY3ViTW4yNVpjM3AvWWtU?=
 =?utf-8?B?Ung4dnNtMXkxVDgyTmhURkhvb2tZVWo5QXFXVGQ5WkMvb0pmQXdkamZNT0xN?=
 =?utf-8?B?QjdURmNYbmhGdlF5UVlpTUJML3NiQVh6NkpFRzF6SnpORC80Qm5OMEZVY2kr?=
 =?utf-8?B?TmNKM29QOTBubkFXZzBMaUxQSk1oemQxUEhVM2lQZ3JoVkVjTjE4bTIwdTBu?=
 =?utf-8?B?SVFSRGJXbjd2Y1Y4ZENXM3MxMGpZV1FtMXl6Ty9wR0Y5N25DMG91UnBUUmxU?=
 =?utf-8?B?V1BrajAzblk2emJDT2hOdWo3eHI2OHhvdkF6K1hIK2VtNjN6K0FsL2VidVJt?=
 =?utf-8?B?Zngxb2FlSHBzNVQ1aFkvNjFvMFY1R2ZNb1YwUkFFTWhzVW5vNVhBUkN6V2tv?=
 =?utf-8?B?ZXY2d3YyUFlhZWpGeFFQVFErME5aQXExNHlBTCtxL3dkMkUvakFCYk53WDRq?=
 =?utf-8?B?cEMvWkJmUUY4RTZtOFIvOEhjNzJqZVFCMDB5RDFrZ3dRZ1VIL0dBMUFmSFY2?=
 =?utf-8?B?NnR6MHVSdTlsU1cxSlZCWkFQZHM1WG9xZFp1ei9jWU4zV3NxRDJQeng4OWRi?=
 =?utf-8?B?V3ltVkpsa2d4eHkxcjdjVlJhOHJrQ3ZIY2JabGk4ZEpqYU5tK3pkWHFmMGhB?=
 =?utf-8?B?RTlnMzRwMXUwZCt6eHlmaVY3eTdWQ1BvcWNFWWVEN0U0V2dqTFp3dWdnYml3?=
 =?utf-8?B?VDVjUkVMWVFVN0Q0MHRVbWxvVnRYYnlVeGJBOG9GZ1d2Y044d0xVeHJ2dkJU?=
 =?utf-8?B?bmVEUFpRbm9yZkVpOXR4K1VGeVprUkRVd1F2UkQyWWxML0ZhNmlLQnVRTTFy?=
 =?utf-8?B?anZzOUFTbFdpN3ZGQVAvRnovU3FZMXV6TkNzMmdqQW5FV0Y1c2FNSlRxSXk3?=
 =?utf-8?B?aDVZYnNwNnRtaHlxMU8xWXdFb2hrcDJXZ1ZsMWhwZnlnMjJ1U3UxZGhLTUdL?=
 =?utf-8?B?ZzZxTEU4MDlScnJwMW1MdDhBc3hPMWRUOFJMNlo2dkxhbnFsZ0VsMFFleUR1?=
 =?utf-8?B?MVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <234FF1AD73BE204B8BECE34BBAB358DA@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4f57a76a-31c4-4fc2-cf67-08db731065c6
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jun 2023 11:04:06.7127
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 PD9RnAjoQPS3A2r8HjuX673ew+q4xQIreVAjMT/q+UQrzUUvVOR2fARKihybirr9atura9GsrwndHm6eKLrf0ulSIAxOIRSpqFJO333z8ng=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8418
Message-ID-Hash: VCBA6W5E6X72RORAUTZB6CSOGHGDFYTW
X-Message-ID-Hash: VCBA6W5E6X72RORAUTZB6CSOGHGDFYTW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VCBA6W5E6X72RORAUTZB6CSOGHGDFYTW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

T24gMjIuMDYuMjAyMyAwMjoxMCwgUm9iIEhlcnJpbmcgd3JvdGU6DQo+IEVYVEVSTkFMIEVNQUlM
OiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IGtub3cg
dGhlIGNvbnRlbnQgaXMgc2FmZQ0KPiANCj4gImVudW0iIHZhbHVlcyBzaG91bGQgYmUgaW50ZWdl
cnMgb3Igc3RyaW5ncywgbm90IGFycmF5cyAodGhvdWdoIGpzb24tc2NoZW1hDQo+IGRvZXMgYWxs
b3cgYXJyYXlzLCB3ZSBkbyBub3QpLiBJbiB0aGlzIGNhc2UsIGFsbCBwb3NzaWJsZSBjb21iaW5h
dGlvbnMgYXJlDQo+IGFsbG93ZWQgYW55d2F5cywgc28gdGhlcmUncyBsaXR0bGUgcG9pbnQgaW4g
ZXhwcmVzc2luZyBhcyBhbiBhcnJheS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFJvYiBIZXJyaW5n
IDxyb2JoQGtlcm5lbC5vcmc+DQoNClJldmlld2VkLWJ5OiBDbGF1ZGl1IEJlem5lYSA8Y2xhdWRp
dS5iZXpuZWFAbWljcm9jaGlwLmNvbT4NCg0KDQo+IC0tLQ0KPiAgLi4uL2RldmljZXRyZWUvYmlu
ZGluZ3Mvc291bmQvbWljcm9jaGlwLHNhbWE3ZzUtcGRtYy55YW1sIHwgOCArKy0tLS0tLQ0KPiAg
MSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkNCj4gDQo+IGRp
ZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc291bmQvbWljcm9j
aGlwLHNhbWE3ZzUtcGRtYy55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L3NvdW5kL21pY3JvY2hpcCxzYW1hN2c1LXBkbWMueWFtbA0KPiBpbmRleCA5YjQwMjY4NTM3Y2Iu
LjlhYTY1Yzk3NWM0ZSAxMDA2NDQNCj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL3NvdW5kL21pY3JvY2hpcCxzYW1hN2c1LXBkbWMueWFtbA0KPiArKysgYi9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc291bmQvbWljcm9jaGlwLHNhbWE3ZzUtcGRtYy55
YW1sDQo+IEBAIC01NiwxMyArNTYsOSBAQCBwcm9wZXJ0aWVzOg0KPiAgICAgIGl0ZW1zOg0KPiAg
ICAgICAgaXRlbXM6DQo+ICAgICAgICAgIC0gZGVzY3JpcHRpb246IHZhbHVlIGZvciBEUyBsaW5l
DQo+ICsgICAgICAgICAgZW51bTogWzAsIDFdDQo+ICAgICAgICAgIC0gZGVzY3JpcHRpb246IHZh
bHVlIGZvciBzYW1wbGluZyBlZGdlDQo+IC0gICAgICBhbnlPZjoNCj4gLSAgICAgICAgLSBlbnVt
Og0KPiAtICAgICAgICAgICAgLSBbMCwgMF0NCj4gLSAgICAgICAgICAgIC0gWzAsIDFdDQo+IC0g
ICAgICAgICAgICAtIFsxLCAwXQ0KPiAtICAgICAgICAgICAgLSBbMSwgMV0NCj4gKyAgICAgICAg
ICBlbnVtOiBbMCwgMV0NCj4gICAgICBtaW5JdGVtczogMQ0KPiAgICAgIG1heEl0ZW1zOiA0DQo+
ICAgICAgdW5pcXVlSXRlbXM6IHRydWUNCj4gLS0NCj4gMi40MC4xDQo+IA0KDQo=
