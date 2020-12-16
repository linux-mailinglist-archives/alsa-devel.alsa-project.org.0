Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F6772DBF79
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Dec 2020 12:33:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3214E17AC;
	Wed, 16 Dec 2020 12:32:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3214E17AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608118412;
	bh=zKXUQcp8ZN7hpYfqkvXlIGRX+6/DJJ+2vDEcvwDusmo=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sydGrdrwRCMPaWASWXSAmj3fgYCTLr8gpI9bDx0i+jS5BC1m90/G2W6d7+93BmCD7
	 f9FH2bDuShfh9uKerZevjSwHf0j+Rp/MbroEvn/2VRn+fwBX9+UC06qI8AkrkQyXYO
	 Epv5oCdCI59IQMrf9x+q7UsJeGp9p+gS7YTeBslY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B703CF80171;
	Wed, 16 Dec 2020 12:31:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9F509F801F7; Wed, 16 Dec 2020 12:31:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D3C01F8014B
 for <alsa-devel@alsa-project.org>; Wed, 16 Dec 2020 12:31:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D3C01F8014B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.b="JSYvyC92"; 
 dkim=pass (1024-bit key) header.d=microchiptechnology.onmicrosoft.com
 header.i=@microchiptechnology.onmicrosoft.com header.b="E82f0bYk"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1608118304; x=1639654304;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=zKXUQcp8ZN7hpYfqkvXlIGRX+6/DJJ+2vDEcvwDusmo=;
 b=JSYvyC92VBiY/jIOcBnzccFX8n9wJpeIeDsIvG8V+4rP7Bq8RwIwKQC9
 5WLkonoiw77uP/NGZSAEBavdk5z6z57LLpcP8P0DRwOsPNsdBB7kEgWVV
 /lx8+zkbQWJMl5QQmT95oew2CqeiUPiuyaJqofqSliOrQSgyC9/pQVYTI
 jBZ9AgQ4kwSr+B1kUFc05p7skQ6f8l0yif4Bzlal3GP5SZPaNVIJKW6u0
 OntpWZSrz3Oex8p3G/e+pd64oVrpsDtT+N8PdFHTSh4Tc4pw+AvmQFLOr
 24w7qjmryXaqmbwLE2VCbm7qiWFklG4NJCb8dMaLrW5bIR1a/fnzdkdXF g==;
IronPort-SDR: 94wvyJj7GIX4imE+fTtQncBT4ls1zG1HLSSK69rnwV69pg4G+20ES7QZijAsUslaOJR8YgEUT0
 r2r+v24SrngUf2a5XNgUdLi0lXy0G/fxttECwkjxOZGgyOZW5Rswc8g3kyRkvh/8ZX37fs4vda
 r1rKLdWEbXpbodvV5CFugY1QkGL4158f7Nqn/yOPa+H23i8nzCjTj3qLMBAxKcoztWVi+w/zEU
 suqUDlbBKiIuCHp2nShKp8hG8JKBgRzEKIVcSkjJUg8T1kSl29HneLXkZLHYe72Ki8x7QxKhIG
 koo=
X-IronPort-AV: E=Sophos;i="5.78,424,1599548400"; d="scan'208";a="102986941"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 16 Dec 2020 04:31:40 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Wed, 16 Dec 2020 04:31:40 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3 via Frontend
 Transport; Wed, 16 Dec 2020 04:31:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OhDWEYo2+drQFI8d0o/yfMayQjaQFL1DWxhmJcwRkIoHf4XO4DM8XHoHE5yKWElJLpZIBlVgxPc7xYOB520OK1Kwd3WytoU5Xh/vkQmY4s+GBKHYLnrChiGVBLWrZY89AiZAvBf12P6GfUerDn3RqokOyOxA+5fx0qLailAkK72wZiamf7HM7ZqRPGAzGGzASPrZgrlUo5sSXx48FjIN7WIpX+XxNQLu3pq7kdoZztAO7dIITh/+ZTGpeUCpMHcvOVe7ynFgyPNq/nx/kT/IjG9ttRaEVYcCXaZZuoF9OnhTcR6zpBRCogBIWvtzsUuw+Uf+5hS1OyMn4BSlHaKPdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zKXUQcp8ZN7hpYfqkvXlIGRX+6/DJJ+2vDEcvwDusmo=;
 b=HlihbuYBoXgbdNxpxkjOkLOpaTSnLRNDE1XrWXM4PgavCKN2mE4Ci1ZRlLAAbYmkbVOpRPef9dWIvBT1R4nHOdKtajAkcX1iXEc3A/lEKTSMDhs5js57Bb29eZqpzbOL8+VjTCR5Rz5ecSkeXS+QEpMBql737qZvtkb+TFbUdGVxu0SMcqUP+lm8kR2RvamogICoi7f1BUGH+IgYTvjcCuElVJ0g1xxAebn2wE9Qtjclo8ymgx4h2owAo4QtPlh3U6yKkFSli3i+ACHIXwnZm5/0lo3HQWD9JsV8UlZKQgiM7mmE+x1uVBp7Kr198dwyia5aLXZ5WDhRHZEUUxMPmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zKXUQcp8ZN7hpYfqkvXlIGRX+6/DJJ+2vDEcvwDusmo=;
 b=E82f0bYkx7D41ZUlHucIvc7UZ5F4lk+MdDmdrKzMV9nWTByEOsHoeL4uT3iQeFLyeq+faNskZZG9hULiMvNOyplsElL86DkkBV0ImtdC3e4Hnh6bTNOLkn/hfh2hys6ev2IOopam8UfN95eGidlTjbXWezU8sOul3Ru0XR52n7c=
Received: from BYAPR11MB3254.namprd11.prod.outlook.com (2603:10b6:a03:7c::19)
 by BYAPR11MB2951.namprd11.prod.outlook.com (2603:10b6:a03:90::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.20; Wed, 16 Dec
 2020 11:31:39 +0000
Received: from BYAPR11MB3254.namprd11.prod.outlook.com
 ([fe80::248b:a685:476a:fe55]) by BYAPR11MB3254.namprd11.prod.outlook.com
 ([fe80::248b:a685:476a:fe55%7]) with mapi id 15.20.3654.020; Wed, 16 Dec 2020
 11:31:39 +0000
From: <Codrin.Ciubotariu@microchip.com>
To: <colin.king@canonical.com>, <lgirdwood@gmail.com>, <broonie@kernel.org>,
 <perex@perex.cz>, <tiwai@suse.com>, <Nicolas.Ferre@microchip.com>,
 <alexandre.belloni@bootlin.com>, <Ludovic.Desroches@microchip.com>,
 <alsa-devel@alsa-project.org>, <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] ASoC: atmel: fix spelling mistake in Kconfig
 "programable" -> "programmable"
Thread-Topic: [PATCH] ASoC: atmel: fix spelling mistake in Kconfig
 "programable" -> "programmable"
Thread-Index: AQHW055LYoUnzqB6Mk6y8XQ/pxDNqan5lswA
Date: Wed, 16 Dec 2020 11:31:38 +0000
Message-ID: <e588b557-aaaf-221d-eea2-70fec172e23c@microchip.com>
References: <20201216112608.11385-1-colin.king@canonical.com>
In-Reply-To: <20201216112608.11385-1-colin.king@canonical.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.2
authentication-results: canonical.com; dkim=none (message not signed)
 header.d=none;canonical.com; dmarc=none action=none
 header.from=microchip.com;
x-originating-ip: [188.27.102.19]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5223461d-1b8f-4688-666a-08d8a1b62766
x-ms-traffictypediagnostic: BYAPR11MB2951:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR11MB295100532B4EF51F3653964AE7C50@BYAPR11MB2951.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:3173;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aJ05OfhboWy14fsxuPvFrX4/TMtXMl7iLbfud4TCSNBnE/mtpIDdr4FnEWva1DookQWY5eO+CUxt6TU1vUr1KwVb3ppz1TMikDNlYHpWS/3QZzfVz8dkveahGT0CrsuoKON3nbIolC6+7VAVqVclY2SJumBD/ZOpPR5svqsBhhe5KsGw8En6Jvi7jESWb/2PM4WaNXu49kej33GLBA7hS2UuE9OANEfIOvxhZAXAVr3oOKO09FNXwbmK4vvY6OGacSdt3MzuBEBEV8YTCBU/SshX/gvm9tXpGTxrf2nDGC8jEFIdHu1o0ureHhmmP3tevFgWgMet9Te7mSnpDk7Bmo+Hlx5xFuuZwjPbcmfl0V0BxnNQsvqILsbGukdEy3YzSAphpkbqUkdvHWhvGU+qrTw6H9jCiS5YIwOr5kQA+qRh6fFfJD/y14yKNrvo8fGT
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3254.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(366004)(376002)(136003)(396003)(39860400002)(36756003)(66476007)(31686004)(86362001)(26005)(6486002)(71200400001)(4326008)(2616005)(186003)(478600001)(6506007)(53546011)(6512007)(66556008)(91956017)(8936002)(76116006)(5660300002)(316002)(4744005)(66446008)(2906002)(31696002)(921005)(64756008)(110136005)(7416002)(54906003)(66946007)(8676002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?QmxydjE1eGc2UzN4c1BKaWdyeGxlWG9kSndjV2c5bHNTTUNBK2dYK0JJZDhB?=
 =?utf-8?B?MWxjTXBsRjRoZlk3VC9UVXM5ZlkrQjdneU4zcWFVaXhRNzhJeVBWQ05DT0dr?=
 =?utf-8?B?V1ZYbndST0w0SmM0aTEvNWpOOFVVeVBZa2FYdk1GL0dqbTRMbTMzNVQ1ejV5?=
 =?utf-8?B?Mm0rWGdLVm5ZRVRHa09CajdPNnozalpRc0FkQmpxWUVBRDFoMU0wbmtvOUJT?=
 =?utf-8?B?R3FJT1pvbEl4Q0srQ1VHb0Uzc0Z2M21KbU9xUnVMZ1RPVWQzU2dHYzhYZnRQ?=
 =?utf-8?B?cllnUWpjOHl2b3Q4dEwxU3dZQ29aV0FGd0d1TWp3SktsS0FaNW9jRUNrUjRW?=
 =?utf-8?B?ZnIvUkhpUlVsM2pUUHhEWjkvSHdueitrMUtydXBzV214NGZJaE9XL1R6Rnhn?=
 =?utf-8?B?Q0VyS2I5NnVrdElkQitreHFHMFh1V29TWDFpWTBtT21rL1kwdm8vYnNwNXFX?=
 =?utf-8?B?TEdFVmJFRDM5VlNHdlQrMzlpS1FtOUI5bTcvOWZQTTd6S1ozNWNic1ZqRk8z?=
 =?utf-8?B?eHRYUXM5NzBLY0VXeGQvY1Q1RE80U25WM200MmhGeGl4RmRvUEQvdFNQZlk0?=
 =?utf-8?B?eGp2aHlSdnB6L1R4V2dkMExkdHYvaVlybG5Uby80dFh3MXQzNDAwNENxTFZq?=
 =?utf-8?B?LzUxS3ozVDFac0RMdWpiSnJ2Vlc0NEpUWU5Zcm9LZ1owNHpDVzFMVmdlczJo?=
 =?utf-8?B?ZVkxOGNlb0pjSUFFbjcwRzVYZU5HQ1h2bXM5Z0g2U2ZUaTZSYzJnYnU5STY0?=
 =?utf-8?B?YWlkUlU4aS9NQm53VyszM1hxNEJndzlLYklTYjB3RXlTYXZRWXZXYkQrM1ZV?=
 =?utf-8?B?TE5RcmJ3MG43V0E2Z2l0Z1RadXh1R0FCbm5EZEJBZUdaWVQ3K0lVRUhiSnVT?=
 =?utf-8?B?QzNIOVhCR3Q5eHF0ejJRdHR1dHI3SUxib3cxTnEwQ3JDY0FiMkY5VjJ2WkRv?=
 =?utf-8?B?Zis4ZzFHN2U5V2pEbUZ5ZXNkL2NoQWJhQU5oNHVMNXdpR21WYldwMHdTeHlJ?=
 =?utf-8?B?cldxWldZYk9IMkRmN1RieWdnLzVUcHBiZkpEcktoS3JWRG9IMGJla0dEMXlF?=
 =?utf-8?B?cVRnNFQzVS84RUp1eUc4Q1JLUmFsZGgrV0dGOW1vRXVtTGttNEluOUFjRVNw?=
 =?utf-8?B?VjFSYmJCMCt2ZXNNRzExb3dLMmNmUHBFcjl2eDlYWjB2QVllWkU0TkJHVDlC?=
 =?utf-8?B?K0Ywd3NXT1JNYlo3OVVnOFNRWTkvUElPTWluamJvTWttdm55cUo2VXZVVXdP?=
 =?utf-8?B?cVdSanZvNytKSFlpMzYzbDZtLy9lNUtyZlhYU0JZNGp5T1lzM1ErOGRiZ0NF?=
 =?utf-8?Q?lC+2iLoOkcIM4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B624F1CCFD51EC4D8DD81E6D999CE316@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3254.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5223461d-1b8f-4688-666a-08d8a1b62766
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2020 11:31:38.8578 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NErNstu3D1uBpbRXu3lk7ze96Ueg9CFzfUCUqB+i0LE/OYUQSCC2DGuhp1QZkpq5wigM5qrMBKhwUDZX/7Bm2wUIMS56P/87GF40dOjoXu4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2951
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
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

T24gMTYuMTIuMjAyMCAxMzoyNiwgQ29saW4gS2luZyB3cm90ZToNCj4gRVhURVJOQUwgRU1BSUw6
IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3Uga25vdyB0
aGUgY29udGVudCBpcyBzYWZlDQo+IA0KPiBGcm9tOiBDb2xpbiBJYW4gS2luZyA8Y29saW4ua2lu
Z0BjYW5vbmljYWwuY29tPg0KPiANCj4gVGhlcmUgYXJlIGEgY291cGxlIG9mIHNwZWxsaW5nIG1p
c3Rha2VzIGluIHRoZSBLY29uZmlnIGhlbHAgdGV4dC4gRml4IHRoZW0uDQo+IA0KPiBTaWduZWQt
b2ZmLWJ5OiBDb2xpbiBJYW4gS2luZyA8Y29saW4ua2luZ0BjYW5vbmljYWwuY29tPg0KDQpSZXZp
ZXdlZC1ieTogQ29kcmluIENpdWJvdGFyaXUgPGNvZHJpbi5jaXVib3Rhcml1QG1pY3JvY2hpcC5j
b20+DQoNClRoYW5rcyENCg==
