Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B7BA1AC083
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Apr 2020 13:59:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CF0331662;
	Thu, 16 Apr 2020 13:58:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CF0331662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587038339;
	bh=ZdnCqNRO9owwkVrvROjzR7ZFOAEIGwXebJHmRoT/HLo=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UxDW2nx1jY1/zU0Okge+GrRu7etNOQdVNYkzwhjBIh/dkoIv7OH1KQzpcxSXTjBZT
	 frzFeP0TAJafSz2WW1+RLyq7T6i+wWCLgga8S70Eu49NEluI7laWAk0MZZRBtKoh3p
	 oa3ppgUG2CvcilSzc2KFPa3AIkz6xI1DZZagjNFk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EB832F8016F;
	Thu, 16 Apr 2020 13:57:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 54A8AF8014E; Thu, 16 Apr 2020 13:57:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com
 [148.163.135.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 23410F80115
 for <alsa-devel@alsa-project.org>; Thu, 16 Apr 2020 13:57:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23410F80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=analog.onmicrosoft.com
 header.i=@analog.onmicrosoft.com header.b="DVskSv5V"
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
 by mx0a-00128a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03GBqFTa019187; Thu, 16 Apr 2020 07:57:10 -0400
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2173.outbound.protection.outlook.com [104.47.56.173])
 by mx0a-00128a01.pphosted.com with ESMTP id 30dn9adggu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Apr 2020 07:57:10 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lwa6nbITHiUTot9BMDm7VoNh7/xCFVvNrEAv1OSApZrK/QTRimuoq7HHa52/XiNwS7d7WP0xzmOQ2q3MDtn9dn/C0tqvhrIr6hLHfswFF9S55RrWpIJNGlqjrmeo3O7hpdigV/j+t9OJXb85GUqCLDtiPTZlBxxpR7uMMUn/mbLSb7WurJYfCfCUst41aTdnUrzx+gDRdFIErrddi2MCA6tW9E6YPPicyLLFG7E/7cuFSXyDVcKOfNlV5sOFW99yyj4zbN/4VnYZwqvoysoHL+4UICzq6qb3g8noMYxVJwnk3Qo1wdyvHVj6mHOGFOE096H4RfbtapH6IfVivMsU/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZdnCqNRO9owwkVrvROjzR7ZFOAEIGwXebJHmRoT/HLo=;
 b=EAOWpy4kEe09sBXtIaQax95VcpApAIE/M9rDtwW7hrgXKQt0+pX78L3hAajeQKfTxGoL8HhdAO4gAozTr7dvQV9T/YuE+N/120FwkqVomOx53GL17hwqUt3aipbUMJzWfu6nmWPOOy/1SMvobcyhEAu0HH37tJ+KwuT/tF+WIZBx9suFdw/yAbyGnpKLwjxecoW5F2WQ45w4of38GTqIPeXEfJMgp9lUAGhF3r5sLPJozRdB4MypX0WygPwX2cAi9r5gDDRI0u4oBDoMJS89PzggQdPq/Qa8nempe0puZf/T+ShXsdCS6kV43DIX1Rfzlpzqdro6yPXGfVzNQ+xOMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZdnCqNRO9owwkVrvROjzR7ZFOAEIGwXebJHmRoT/HLo=;
 b=DVskSv5VEX7a2+gBgetuK7xmII6guIen/iAuXAhMAuRfxwVfHZRxnjO38HAV5Gi1PrJLVCeDE5/flBtCo9B8Jp3E3SBLrUXFq324OMuNn6w3FaWrhKpJux8piXQJP6JbKqknVThRsYAgEnBWq9a2QNAvGskdMnPasG8hlh3b89M=
Received: from DM6PR03MB4411.namprd03.prod.outlook.com (2603:10b6:5:10f::14)
 by DM6PR03MB4186.namprd03.prod.outlook.com (2603:10b6:5:5d::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.26; Thu, 16 Apr
 2020 11:57:08 +0000
Received: from DM6PR03MB4411.namprd03.prod.outlook.com
 ([fe80::c47f:ceee:cfda:6a7f]) by DM6PR03MB4411.namprd03.prod.outlook.com
 ([fe80::c47f:ceee:cfda:6a7f%3]) with mapi id 15.20.2921.027; Thu, 16 Apr 2020
 11:57:08 +0000
From: "Ardelean, Alexandru" <alexandru.Ardelean@analog.com>
To: "vkoul@kernel.org" <vkoul@kernel.org>, "airlied@linux.ie"
 <airlied@linux.ie>, "Sa, Nuno" <Nuno.Sa@analog.com>,
 "stefan.popa@analog.com" <stefan.popa@analog.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "trivial@kernel.org" <trivial@kernel.org>, "jic23@kernel.org"
 <jic23@kernel.org>, "lars@metafoo.de" <lars@metafoo.de>,
 "Hennerich, Michael" <Michael.Hennerich@analog.com>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "tiwai@suse.com" <tiwai@suse.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "perex@perex.cz" <perex@perex.cz>
Subject: Re: [PATCH trivial 0/6] Fix misspellings of "Analog Devices"
Thread-Topic: [PATCH trivial 0/6] Fix misspellings of "Analog Devices"
Thread-Index: AQHWE+TlxWwioFJLmkWlJ0KLdTxLOqh7pIIA
Date: Thu, 16 Apr 2020 11:57:07 +0000
Message-ID: <9adccf5b3d7e812912c969f3c758d9ef96a47a0b.camel@analog.com>
References: <20200416103058.15269-1-geert+renesas@glider.be>
In-Reply-To: <20200416103058.15269-1-geert+renesas@glider.be>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [188.27.130.47]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: f34af2d4-037d-4cb7-4d43-08d7e1fd4a20
x-ms-traffictypediagnostic: DM6PR03MB4186:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR03MB4186A84F45C15412C091CD7DF9D80@DM6PR03MB4186.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0375972289
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR03MB4411.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10009020)(39860400002)(366004)(136003)(376002)(346002)(396003)(8936002)(7416002)(64756008)(66446008)(66556008)(66476007)(2616005)(66946007)(8676002)(316002)(71200400001)(5660300002)(54906003)(2906002)(91956017)(76116006)(478600001)(26005)(6506007)(86362001)(6486002)(36756003)(186003)(4326008)(110136005)(81156014)(966005)(6512007)(921003)(1121003);
 DIR:OUT; SFP:1101; 
received-spf: None (protection.outlook.com: analog.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6lx31jT2XYbD7iLXkYwjyN0HogQ9+bn2y7T5Db7d03dSRgURn/UesDacDENB3a2IezDi9ES5LU0NUJTJI83bgu5ex280A3VZGEznpyKuWG3VOndCjlkRFVaOtHt09tsZisnTRdNRH4ZoXYcxfygSHeXpsh4YnRBmA/02oW8Xc530T1r4LGQNCQsJsVDYt3iIoPfV2y9+ceVLH8mGgf0DWVXuB+AmcdVL4HJAcPSUxTT/Yo8lx/T8OO1eaLvVNayT3zZaumMw3HrrEPhKbdalIj84nLPGZt8BLMhH06WYJyiHNbjE8ajwQSczLpooZxQFFAYtDIhu1qrs1tFqCGgIJyRWJ06KZKwWLblej2KRiWtsYfAnYIRMBHlfYX9GYlPbWXP0pFN2cy4Fvl92A2JAUcxLJExorDIn8wnbCaWVxdkZJfWLm9rt5KmXMQabjONgZ0z4J5CtQkWrJLoxb7TkR2bE1yUV/U89UEEt0oTuobLoyiST7IY6aFguyORDOOu7ZKVsWX3RCEswcMSEIZTHMfQCVkjol6e8PFuFcTyySWhbJuc7Xe0ZONftDTwuoI7uUyMSMLjcxap5UsUrKc9AEQ==
x-ms-exchange-antispam-messagedata: MSy14ga/VWOxkPa3EgtAilO8BQSme3x+iON1zbJT7z4x6fnDhW7o8b5OVDbzVnUIpnx7JmyoJ3aboZ721XctaMzRo77XAEcMF0jx3znsGcOVnhupdWP9mm/8e/LoIMBxYneUfc9pnv9mJzWkZ91EFw==
Content-Type: text/plain; charset="utf-8"
Content-ID: <347BDF7D162C684494D4C1E982D12D0E@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f34af2d4-037d-4cb7-4d43-08d7e1fd4a20
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2020 11:57:08.0602 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nlCfkprmpvyIm/E5eE1joevHDZqqemvDkNvb4/eLxJNm14zyQryAacJSHO91fo/krme0jrMCGEFtmTZzm12DqVNZ5oPMewufTgXdlzkVR7M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4186
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-16_03:2020-04-14,
 2020-04-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 mlxlogscore=999 clxscore=1011
 mlxscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004160084
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>
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

T24gVGh1LCAyMDIwLTA0LTE2IGF0IDEyOjMwICswMjAwLCBHZWVydCBVeXR0ZXJob2V2ZW4gd3Jv
dGU6DQo+IFtFeHRlcm5hbF0NCj4gDQo+IAlIaSBhbGwsDQo+IA0KPiBJbiBzZXZlcmFsIGZpbGVz
IHRoZSBjb21wYW55IGFsc28ga25vd24gYXMgQURJIGlzIHNwZWxsZWQgYXMgIkFuYWxvZw0KPiBE
ZXZpY2UiLiAgSG93ZXZlciwgYWNjb3JkaW5nIHRvIGh0dHBzOi8vd3d3LmFuYWxvZy5jb20vLCB0
aGUgY29tcGFueQ0KPiBuYW1lIGlzIHNwZWxsZWQgIkFuYWxvZyBEZXZpY2VzIi4NCj4gDQo+IEhl
bmNlIHRoaXMgcGF0Y2ggc2VyaWVzLCBvbmUgcGVyIHN1YnN5c3RlbSwgZml4ZXMgdGhlc2UgbWlz
c3BlbGxpbmdzLg0KPiANCj4gVGhhbmtzIGZvciB5b3VyIGNvbW1lbnRzIQ0KDQpGb3IgdGhlIGVu
dGlyZSBzZXJpZXM6DQoNClJldmlld2VkLWJ5OiBBbGV4YW5kcnUgQXJkZWxlYW4gPGFsZXhhbmRy
dS5hcmRlbGVhbkBhbmFsb2cuY29tPg0KDQpNYW55IHRoYW5rcyA6KQ0KQWxleA0KDQo+IA0KPiBH
ZWVydCBVeXR0ZXJob2V2ZW4gKDYpOg0KPiAgIGR0LWJpbmRpbmdzOiBGaXggbWlzc3BlbGxpbmdz
IG9mICJBbmFsb2cgRGV2aWNlcyINCj4gICBkbWE6IEZpeCBtaXNzcGVsbGluZyBvZiAiQW5hbG9n
IERldmljZXMiDQo+ICAgZHJtOiBGaXggbWlzc3BlbGxpbmdzIG9mICJBbmFsb2cgRGV2aWNlcyIN
Cj4gICBpaW86IEZpeCBtaXNzcGVsbGluZ3Mgb2YgIkFuYWxvZyBEZXZpY2VzIg0KPiAgIEFMU0E6
IEZpeCBtaXNzcGVsbGluZ3Mgb2YgIkFuYWxvZyBEZXZpY2VzIg0KPiAgIEFTb0M6IEZpeCBtaXNz
cGVsbGluZ3Mgb2YgIkFuYWxvZyBEZXZpY2VzIg0KPiANCj4gIC4uLi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2Rpc3BsYXkvYnJpZGdlL2FkaSxhZHY3MTIzLnR4dCAgICAgICAgfCA0ICsrLS0NCj4gIC4u
Li9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL2FkaSxhZHY3NTExLnR4dCAgICAg
ICAgfCA0ICsrLS0NCj4gIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kbWEvYWRp
LGF4aS1kbWFjLnR4dCAgICAgICAgfCAyICstDQo+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvaWlvL2RhYy9hZDU3NTUudHh0ICAgICAgICAgIHwgMiArLQ0KPiAgZHJpdmVycy9k
bWEvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDIg
Ky0NCj4gIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYWR2NzUxMS9LY29uZmlnICAgICAgICAgICAg
ICAgICAgICAgICAgfCAyICstDQo+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2ZiX2NtYV9oZWxwZXIu
YyAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMiArLQ0KPiAgZHJpdmVycy9ncHUvZHJtL3Rl
Z3JhL2ZiLmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDIgKy0NCj4gIGRy
aXZlcnMvaWlvL2FkYy9hZDc3OTEuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgfCAyICstDQo+ICBkcml2ZXJzL2lpby90cmlnZ2VyL2lpby10cmlnLWhydGltZXIuYyAgICAg
ICAgICAgICAgICAgICAgICAgIHwgMiArLQ0KPiAgZHJpdmVycy9zdGFnaW5nL2lpby9Eb2N1bWVu
dGF0aW9uL292ZXJ2aWV3LnR4dCAgICAgICAgICAgICAgICB8IDIgKy0NCj4gIHNvdW5kL2lzYS9h
ZDE4MTZhL2FkMTgxNmEuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAyICst
DQo+ICBzb3VuZC9wY2kvYWM5Ny9hYzk3X3BhdGNoLmMgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHwgMiArLQ0KPiAgc291bmQvcGNpL2hkYS9LY29uZmlnICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB8IDQgKystLQ0KPiAgc291bmQvc29jL2NvZGVjcy9h
ZDE5ODAuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDIgKy0NCj4gIHNv
dW5kL3NvYy9jb2RlY3MvYWQ3MzMxMS5jICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgfCAyICstDQo+ICBzb3VuZC9zb2MvY29kZWNzL3dtODc4Mi5jICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHwgMiArLQ0KPiAgMTcgZmlsZXMgY2hhbmdlZCwgMjAgaW5zZXJ0
aW9ucygrKSwgMjAgZGVsZXRpb25zKC0pDQo+IA0K
