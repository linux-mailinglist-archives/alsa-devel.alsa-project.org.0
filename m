Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CBAED2CEA88
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Dec 2020 10:13:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5819C1859;
	Fri,  4 Dec 2020 10:12:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5819C1859
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607073209;
	bh=oyuTdsO+6bjPxY6kw/xVBOz5nccM+0wA290kPHM1ftE=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=o6NnzIfAKTYocAV9pHNTOpy+AQDnABa+2w6aymCR5UR6lp+kinUuObizpYK/axl5O
	 1zH0papts/GnnOwDpaKv9QBKLghzCPo273RaNqqFvWUmO0YTHouO7jnccmTig406RE
	 ab8tsBiUbKX5CO/2VzHFPLmES+3wGuNbh4A8Hw/E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DAFB1F80273;
	Fri,  4 Dec 2020 10:11:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0E3ACF80278; Fri,  4 Dec 2020 10:11:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, NICE_REPLY_A, RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL,
 SPF_HELO_PASS, 
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from esa3.microchip.iphmx.com (esa3.microchip.iphmx.com
 [68.232.153.233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 35B85F8012A
 for <alsa-devel@alsa-project.org>; Fri,  4 Dec 2020 10:11:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 35B85F8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.b="S6qVBM5M"; 
 dkim=pass (1024-bit key) header.d=microchiptechnology.onmicrosoft.com
 header.i=@microchiptechnology.onmicrosoft.com header.b="pY8WSVvO"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1607073107; x=1638609107;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=oyuTdsO+6bjPxY6kw/xVBOz5nccM+0wA290kPHM1ftE=;
 b=S6qVBM5MFNlFLDvUg9M/5bjcGDXS5TZ1j1I6e1kW07Lyfij9S98qftw8
 5BIfNhpwR9+Tx2xJx5esWkQexQGLmQir9oHKS+tca/t9KgoBC+usvTaw9
 v8o+oNgRCkQW2+TIaQFwtHRQXiuW9x7DPjNQWTIOFjG1g4zpOZ5hjW5nK
 RnLR/b1EoddR5sj0a5MhNhX89LCyA9QJB/yV8Xs0phr82coUGAp4nPU5k
 Nts2hPFMR/rcGKkiQggQbdFhbuoMrDhwsX86r2bOJb+vY/2AiMFFwa7hF
 kYir5ikeJbiDI/CzHkTsPEAcYB4xW8NWAcPmb2Vut2GniV0cVl1tcd6kj w==;
IronPort-SDR: 5mk0UW4F5K7zYSHH+Wrad3gEg+HcecGzI438T3k4IHZ8wbzT2Dr4buOqgMCkY8zZ+Z507456Gy
 sMxjkVDXsQrP9yKnR78hgzvNddCI5mv3n/h2wVmQj76ilatDxJJojAV8/0uRWpauolAkBFMMUY
 QNYyRaRxMvrURz3DjCAOr8jky159fjaB2BMdw3RPOkEfFDiwteD5TLH64V+UnO2CHt6SNxHzHD
 +wtfhDVBAAtTT4kWnXEf2CFnjO/RMoM/lUr27SSH7apG8UubCkBPFkBBIkZM5JCoWIEpvGYXDw
 l1Y=
X-IronPort-AV: E=Sophos;i="5.78,392,1599548400"; d="scan'208";a="101449517"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 04 Dec 2020 02:11:42 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Fri, 4 Dec 2020 02:11:42 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3 via Frontend
 Transport; Fri, 4 Dec 2020 02:11:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W9qUJFDpTGLlZN3d0yvHxejdX8j0AMu3KJSdcjPORM6Mp5AfuvHOdwc07yx4TKaJsO+oSzJA7vOn1qmC95sPbT5bP45upznExyhiFasPzWx/zL3auI8YOMkN4m86N0iAa9GAz/R6iGFpe5BFj3kV3wpp21hMi1X4QoOPNotK5Y58oCnzmpbNnhZ204NfogsJ+nCdA6N42RKCyVtsHkW5qlyDPxXz2bVGNs/GMuQxwIDSXaUEA3iFIbrR1hKnjXCIC4/BtgTGkeZx3qi4U/hIuxWO/+OHsDu/xUpDSIeie9FEy2v7WoZQglzYavocfCS1zZ8j1zTa62T0+y4LbgRl2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oyuTdsO+6bjPxY6kw/xVBOz5nccM+0wA290kPHM1ftE=;
 b=nC7VKk0j/QiU3Q9YRT92dkoVzd3EB9R4dsbXEUs+iVjgd3KIu4zSYAVNT5R7o6Js5mfONEC3p2EBQy2Pendi5dGiousm8OwDLWc34C1CwceVUTxkAyOcPwV43EqqrunqRk5f3AaVlTfVrt0ouqryAZ/FwBakObQpxRteBiiiefsdd89FEqGdsF+hcrbRVAyRD2sAMQty8ZCU3pf5U+XCfcU5ElsvZtYBCC7ysr77X+yLpIMUKgj4j6n/rC+uWj7/XjN0b3Y52aPKvGms0WBA1IpTNyYBeeMA7IDH07jizGa+flFJnrtUoL7UaExJYrkQSUjajWvp0tld/tRtUVdOyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oyuTdsO+6bjPxY6kw/xVBOz5nccM+0wA290kPHM1ftE=;
 b=pY8WSVvOeaHI3u2VXCyIxsvTad3sF4eADZtzX7uv4TKTCHmdqV3HJOGD4Vawpj6sHrIYgZsAsJonNhgKQ6pvsbOgQCnq3BflVOLin8X+80MI8NZ5C8FcI0qc0pmC09eRhq7rdirMcwQ9iWV1FeUeQNNPOVAct3BfQUjXrvTUhxY=
Received: from CY4PR1101MB2341.namprd11.prod.outlook.com
 (2603:10b6:903:b1::22) by CY4PR11MB1830.namprd11.prod.outlook.com
 (2603:10b6:903:125::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Fri, 4 Dec
 2020 09:11:40 +0000
Received: from CY4PR1101MB2341.namprd11.prod.outlook.com
 ([fe80::a52e:2a1b:e5d9:4fdb]) by CY4PR1101MB2341.namprd11.prod.outlook.com
 ([fe80::a52e:2a1b:e5d9:4fdb%5]) with mapi id 15.20.3611.025; Fri, 4 Dec 2020
 09:11:40 +0000
From: <Codrin.Ciubotariu@microchip.com>
To: <arnd@kernel.org>, <lgirdwood@gmail.com>, <broonie@kernel.org>,
 <perex@perex.cz>, <tiwai@suse.com>, <Nicolas.Ferre@microchip.com>,
 <alexandre.belloni@bootlin.com>, <Ludovic.Desroches@microchip.com>
Subject: Re: [PATCH] ASoC: atmel: mchp-spdifrx needs COMMON_CLK
Thread-Topic: [PATCH] ASoC: atmel: mchp-spdifrx needs COMMON_CLK
Thread-Index: AQHWycUFqRbWQECp40qQ4QBYahpOtKnmp2iA
Date: Fri, 4 Dec 2020 09:11:40 +0000
Message-ID: <7a0f2513-b694-e5c7-6048-b1eba915bba5@microchip.com>
References: <20201203223815.1353451-1-arnd@kernel.org>
In-Reply-To: <20201203223815.1353451-1-arnd@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.2
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [188.27.102.19]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7e714211-0439-42c0-8788-08d898349c5f
x-ms-traffictypediagnostic: CY4PR11MB1830:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR11MB18303E40D2F0742F6DEF42D7E7F10@CY4PR11MB1830.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:983;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TnRbh0cdLoMMX/1bQE7ccUt/21/3V3Gppexu/ILtuMh2a2o47IKLkgM+LJk1FzELwQ/PWDmx7fTvismLhhSCqLUa9ogGDf1eK8aE2kMCy5EW41jxMS9gdhnQeJbaQhhtaNIFRkbHTJutYlbJODyDdmJTUwpEuF4rQReeWHBT8NRUcqqN+1IbBV3Gsj5xCt2e/9UBCAdYFrI4PuDxHXlvCLFoe9WgN33iChhhjFmBm8/4FOw7iW1jfOGlmXrdqT9cO1c+8VdylZEE6tuoUl49HiIx2Ou6CQP6HD/iIJqo3Qvvf8pfNnRg2pXx+PeNOy79EGjPGjtKEun5ED3aTptyFZDQsT+RFzZJo3+YZv+/E6X3h64zDS8YO1tMDPvVNM5W9ZDqOSeBjRVYZ2tShDTt5gk2FLeuwC60F8mPQ9Oxy7I=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR1101MB2341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(136003)(376002)(346002)(39860400002)(366004)(53546011)(66946007)(54906003)(110136005)(478600001)(2616005)(8676002)(66476007)(6512007)(6506007)(4744005)(64756008)(71200400001)(66556008)(66446008)(2906002)(316002)(31696002)(36756003)(5660300002)(31686004)(26005)(91956017)(6636002)(7416002)(186003)(76116006)(4326008)(86362001)(6486002)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?aWUrUzRnZU1aVFlSZzBYdkJwSVZ2bHgxd2h6dXZZdjFEcjFGRStINVRFWVZs?=
 =?utf-8?B?SlBxTVFIV3UwRnZsLzYyU2w2d2pwTHhSWlNtbkR0YjZ4VHZabE5uWlhnOUND?=
 =?utf-8?B?SmtPaWJBTVdNejdlQk1QVU8rMEtiM253NlhVVmtCb1g5TXByT1N3NGRvSjF6?=
 =?utf-8?B?V1ZYRERvRFZOWXVVa3hXczlrZkFMYjVSSjFlZkFLTk9oenJFRm9tYWpJVE1D?=
 =?utf-8?B?UG83ZEVaZFhVa2RBVERyRW1SSVB3SGh1YVpTMi9qQVVGYlZ3THltK0h3ZGJ3?=
 =?utf-8?B?MWdXVUxwRmxZTFhQR0lsTlVlcUVOMUU4OTdtdzNNemFmdVF3NkNzdUxYTU9C?=
 =?utf-8?B?TUY4bkxLcndUSFVobjUvcjdraEp4dzh6UXVQTklwOFRrdThEV05lc2ZRRWZm?=
 =?utf-8?B?VDQwdkJabDNWOWdMbVltUHUzRHltMk9jQWJ5QUp1ZlE5WW5vU2s5TjhzcVVt?=
 =?utf-8?B?Z25MK2RuL2pqK21sRmNzMit5Sy90VC82NEREK2tzbG84dEpSQ0V4V1RxVlFa?=
 =?utf-8?B?bVZyUS82SDdzdDBFS1QyQnZ0M1RBTEd4ekV6SlM5Tlhhc25PNHlCU0JMOEd6?=
 =?utf-8?B?YzNPVmo3YWhYYU9veTVKcDV4R3NGeWtJbTU3ZWdnR1pKMTZTYTVKQ2NTZHdG?=
 =?utf-8?B?Rit3OHA2OE5KcGdJeTJlZzFBd0Z5aU9tc1NSeTZPOFNGTlZ1TzVScUQybTEw?=
 =?utf-8?B?dFY4Nlc0SGVEZy92d3VDaTU5ekhxM2V4blVtSVY0NC9BUGNidW9xZkovc2V4?=
 =?utf-8?B?Y0ZZZ0IvRWJqempGM1FET0hEMjhYOWJMM3kra0IycCtvTU5DM0cxSnhvSEIw?=
 =?utf-8?B?RG9hWXpFS3pXWFpZOWxDU01nUng4d3FpUXFReFFSVHVRVUE4SUFlU3NsT1o1?=
 =?utf-8?B?MUZnQ25RZE1RcldjN0crTTE0dlpzbVdyWHRCZmx5ZzFVeDErNHZvZ3lQWVEz?=
 =?utf-8?B?NzdzalFuVk9kcUtrcm13R1dBSzBTREQ0M2xmUUMxQkZadEJmNDJmQWVBc0hC?=
 =?utf-8?B?TUNTdUhtVWVyL3dKc2x4dHN0UnUxT1ZEZDAxd2JGOVJ5TWRKSDJ1eWMveVBR?=
 =?utf-8?B?RytSRWVuc3k0eDB6Z0lVUzVVMDF1bm5HNkY1eTNPdVd3ZmNxOTlKSkxKOG1Q?=
 =?utf-8?B?b2VEUTA5eUJjUGtPcy9IbmF2Sm4waWV1UUt3K1RQelI3T21mZ1g2YnV3T1Yr?=
 =?utf-8?B?T05oclNYemcvYjFhUmVxc3AxNVlIT1kxUVlTcmF2amxUT1NSU05IYU5GdU1p?=
 =?utf-8?B?V3dabVlnOEJzVnBNQUxVMTBCK0JmaVcyUVJSMCtXdm1EcE5hWk1jY1hwMTVW?=
 =?utf-8?Q?T7uz/GU169b1I=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DCAAB2D39F2E3441BA19AEBC7BCBCD40@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR1101MB2341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e714211-0439-42c0-8788-08d898349c5f
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2020 09:11:40.0513 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j0ug9nEM+xdvyMrI7hFVZKwERhcg2fpm8+j5S7HQ9gvTcjesdI3E0uvAZPdMaG7i0lnkukHY2HBZ/LCb0SgbhycpLMG9oZBnHa3iujHJCSg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1830
Cc: alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 arnd@arndb.de, linux-kernel@vger.kernel.org
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

T24gMDQuMTIuMjAyMCAwMDozOCwgQXJuZCBCZXJnbWFubiB3cm90ZToNCj4gRnJvbTogQXJuZCBC
ZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4NCj4gDQo+IENvbXBpbGUtdGVzdGluZyB0aGlzIGRyaXZl
ciBvbiBhbiBvbGRlciBwbGF0Zm9ybSB3aXRob3V0IENPTkZJR19DT01NT05fQ0xLIGZhaWxzIHdp
dGgNCj4gDQo+IEVSUk9SOiBtb2Rwb3N0OiAiY2xrX3NldF9taW5fcmF0ZSIgW3NvdW5kL3NvYy9h
dG1lbC9zbmQtc29jLW1jaHAtc3BkaWZyeC5rb10gdW5kZWZpbmVkIQ0KPiANCj4gTWFrZSB0aGlz
IGlzIGEgc3RyaWN0IGRlcGVuZGVuY3kuDQo+IA0KPiBGaXhlczogZWYyNjVjNTVjMWFjICgiQVNv
QzogbWNocC1zcGRpZnJ4OiBhZGQgZHJpdmVyIGZvciBTUERJRiBSWCIpDQo+IFNpZ25lZC1vZmYt
Ynk6IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+DQoNClJldmlld2VkLWJ5OiBDb2RyaW4g
Q2l1Ym90YXJpdSA8Y29kcmluLmNpdWJvdGFyaXVAbWljcm9jaGlwLmNvbT4NCg0KVGhhbmtzIQ0K
DQo+IC0tLQ0KPiAgIHNvdW5kL3NvYy9hdG1lbC9LY29uZmlnIHwgMSArDQo+ICAgMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvc291bmQvc29jL2F0bWVs
L0tjb25maWcgYi9zb3VuZC9zb2MvYXRtZWwvS2NvbmZpZw0KPiBpbmRleCBiZDg4NTRiZmQyZWUu
LjE0MjM3M2VjNDExYSAxMDA2NDQNCj4gLS0tIGEvc291bmQvc29jL2F0bWVsL0tjb25maWcNCj4g
KysrIGIvc291bmQvc29jL2F0bWVsL0tjb25maWcNCj4gQEAgLTE0OCw2ICsxNDgsNyBAQCBjb25m
aWcgU05EX01DSFBfU09DX1NQRElGVFgNCj4gICBjb25maWcgU05EX01DSFBfU09DX1NQRElGUlgN
Cj4gICAgICAgICAgdHJpc3RhdGUgIk1pY3JvY2hpcCBBU29DIGRyaXZlciBmb3IgYm9hcmRzIHVz
aW5nIFMvUERJRiBSWCINCj4gICAgICAgICAgZGVwZW5kcyBvbiBPRiAmJiAoQVJDSF9BVDkxIHx8
IENPTVBJTEVfVEVTVCkNCj4gKyAgICAgICBkZXBlbmRzIG9uIENPTU1PTl9DTEsNCj4gICAgICAg
ICAgc2VsZWN0IFNORF9TT0NfR0VORVJJQ19ETUFFTkdJTkVfUENNDQo+ICAgICAgICAgIHNlbGVj
dCBSRUdNQVBfTU1JTw0KPiAgICAgICAgICBoZWxwDQo+IC0tDQo+IDIuMjcuMA0KPiANCg0K
