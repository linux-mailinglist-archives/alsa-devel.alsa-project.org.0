Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6299A688ECF
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Feb 2023 06:09:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3008A826;
	Fri,  3 Feb 2023 06:08:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3008A826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675400940;
	bh=xW1L8KqF5xajctQejuWle2o7rab6Ju4n2vMldx347a8=;
	h=From:To:Subject:Date:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=nXeBubz7N6XSp0TO3k2XVpngq/L3ygyGhlhn7TCigyFBdjOcX8XCPeMWc5lSAuecv
	 R0P7OePoCLN/fT+P80lpeo1xJVVF8aCdAMjGPF/7uZ90OSelTVYH5gQincNPGifYIQ
	 Z9XYh5Bl1CMg3Gbb5+w7+tfxunsTBFZp+pbxlyjc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A6FDF800E3;
	Fri,  3 Feb 2023 06:08:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0D6DCF8032B; Fri,  3 Feb 2023 06:07:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
 SPF_HELO_PASS,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on20628.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feab::628])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8B7DAF800E3
 for <alsa-devel@alsa-project.org>; Fri,  3 Feb 2023 06:06:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8B7DAF800E3
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=msC2kwFhQi9BsFnoA+rDSB68Ey1PS80gJ/vlBADtMtxV6l/tevF8tr1ht2dnlnH/yxE/eMnM3zdHa5QLX5/b4Y6GzwThU0/C6lEVEg3lwveup1k9vQtxio0FD7rSC1We5JBoAea8iVFkPohIOnfa8dg6u6NF21byfQngxLKjgWhNAcU2cuAurWcFJskv0G8injIhAKGrNuzAaiM1C+NU5A1+zFw3PTcEvLY+kGzoRpumrNGCogN/QcSlN90VQHgQtX4aFLwLMk229SbSfpiMspzDgR3j4xt17TRd0HZExBv/rNbR3RmC59pMCPjNhjcX0s1nhI9PW3I2PDpmUPTymQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xW1L8KqF5xajctQejuWle2o7rab6Ju4n2vMldx347a8=;
 b=GRdD6Peg0narGGxvkq76XunzOjkoSXt4bRZcryX/m8GSRBAQy5sHLSSZWu38vBm1cYwEWoBfx/+tV4QbVPHzNylxL36z2i7HxunG0eVLYYJTscpc4ir3C3FS1nQp9jOecVJErhjVy/lMInT3u2GECgbfz0zfL8gpmRp9j97OocTBvZm1yzy6ImHLgA2bLOLXuMsC5XCnijaNzfbEsVZs/2Nt+baKBy+B7LwsPZcEz5U957TTXTsJx9znMKdezWzLuJ2McZ5o8ViLpeoed568JCSdg2FTVerahb8MXyBBsJGT68Py5djbhfAdTAsVGjUnH3rA6qj+KfqkUO7sDyjN/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=irondevice.com; dmarc=pass action=none
 header.from=irondevice.com; dkim=pass header.d=irondevice.com; arc=none
Received: from SLXP216MB0077.KORP216.PROD.OUTLOOK.COM (2603:1096:100:7::23) by
 SL2P216MB1327.KORP216.PROD.OUTLOOK.COM (2603:1096:101:11::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6064.28; Fri, 3 Feb 2023 05:06:51 +0000
Received: from SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 ([fe80::3d9:7f82:fa73:e727]) by SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 ([fe80::3d9:7f82:fa73:e727%7]) with mapi id 15.20.6064.028; Fri, 3 Feb 2023
 05:06:51 +0000
From: Ki-Seok Jo <kiseok.jo@irondevice.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [PATCH] Fixed the schema binding according to test
Thread-Topic: [PATCH] Fixed the schema binding according to test
Thread-Index: AQHZNuYvdGkbgSjfQEmX9bKJTMPyKK67YAkAgAALN7CAAK57gIAAkx1g
Date: Fri, 3 Feb 2023 05:06:50 +0000
Message-ID: <SLXP216MB00777901D3E60C271FB54E3E8CD79@SLXP216MB0077.KORP216.PROD.OUTLOOK.COM>
References: <20230202090715.18384-1-kiseok.jo@irondevice.com>
 <ac140660-0df0-8b43-3585-17511a280830@linaro.org>
 <SLXP216MB0077A1B1F744D74A5B338F0C8CD69@SLXP216MB0077.KORP216.PROD.OUTLOOK.COM>
 <4111d645-478a-e55f-60bd-4ecbef077183@linaro.org>
In-Reply-To: <4111d645-478a-e55f-60bd-4ecbef077183@linaro.org>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=irondevice.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SLXP216MB0077:EE_|SL2P216MB1327:EE_
x-ms-office365-filtering-correlation-id: 2ddc6c5f-718d-4092-7203-08db05a475b0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6R6fNy/GyHwGgnVTddDozUKrLG5oFXpXQ0Cn4Na4iMtxgixgAsWTsaQBKnr2+MlifeNsgd5llHJ26ZLWFMaLF48ByzbyCjBL9p2JwzXKaptNuZ1ZxwPoQYnoeXLtDvVl7FweBhJzakFc1CFlz6g+fCTGgYa2Fv/HIPpDUDxKk+c4sMKlAbNALO9TKikhXR2K6sSGkgvJj1yeV9XWfF0EwdnDn04JxYpDsS82jbThBZmwXoOxyMC43993/Nb/4d1pUfyonT9fAQgMfh5pnPPqZaZ9D1Ng/3vDaSV/gHIQNoGMDOo5B1xWOK5UBcUX1GuyydcuGs7w4cOWUt7sLxn635fbGkOLVf7riSRrQmlq7qZ3WLgEJWkvpQHPV63vHtG5vl5szd9lwMa91hCCy68PaObXTpI9/fP1IneBZphCTBAWB2lJ2KuH6Al3eFhNe2cz3dTH67k3pID9I7yiSazLjSiDVH/fNhtxnt8YN58j2OWZ8QUWjzJnLHyy99FOpDRIvVXeKnd1fcjcyDLXClQZU7WxJKHGqfEcSJKcyFbETobBE+Bg50ThnvdLPocvNnZNLgYGLaKKd51LS43jFIZqd3BDM6ri3zU4+hggZQnEbQQGoGi0PJiDg0jJNs6cui+0hqTEoNmlf/mCOiv6tHWXCAfCcTVat7XTcq4snRZewCVAQbWTfOdu+OhbRQXCezWIL5s404NkPxQNqHa72mGn1A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SLXP216MB0077.KORP216.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(366004)(376002)(396003)(39830400003)(136003)(451199018)(83380400001)(316002)(71200400001)(110136005)(54906003)(2906002)(33656002)(38100700002)(122000001)(64756008)(66946007)(66446008)(9686003)(66556008)(76116006)(66476007)(26005)(186003)(7696005)(478600001)(52536014)(86362001)(4326008)(41300700001)(8936002)(55016003)(6506007)(8676002)(5660300002)(38070700005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?azBzQ1JyR1ZuVkhQSFhsWllpajlZbmNHMXlVbi9VZDJ2VWllQVZNZzRJRjky?=
 =?utf-8?B?WFJSc0kycGMrU2VRVDV3UzlNMDZYLzF6SlJrZ1p4N3lNN09Vc1hiRzBYRytz?=
 =?utf-8?B?UEhIVWR5OWp2eHREUkoxWVIyZkFQMG9DNDlxeW5aUm95ek1CYkltLzh1dWdo?=
 =?utf-8?B?THoxaGtLK29UNndXRmlFU3M1Y29XbnlWZXkvZHBiTnl3Z3FoNVRyc1pOa0J0?=
 =?utf-8?B?V1pQNmZ4NXQzQzloSnVNcDZ4V3lCdlhjNkRQazFEM0tmQjRHamtXZWg2THY3?=
 =?utf-8?B?RkpMQ2xUYkdYMVFkNVU0WGlhcDBpREFHVGI1TGd6SGc4Ni93VGJya1Voc3Jk?=
 =?utf-8?B?RXk0OWtjcnFLdm5RNTVud2VmMkwvVHRpcEY3K3NjTlRCSmRYNWZFYUl4TEFW?=
 =?utf-8?B?TUM0dFA4aUpyaWdCVWlLRW9TQXFjWTF6MUNBakN0N0l5UXQ0S3BNZUJVM1NG?=
 =?utf-8?B?akZGZ1QrVCs1MXJjQS8yd0hOektoZWR1UkloWklTWmVoMjgvUmRkb25Jbmto?=
 =?utf-8?B?eVRHTWExYXpkYkRVZVAyd2R4dlNRWHdGdEJGVUFuTDY1dVZETVQ5SDJEdkZl?=
 =?utf-8?B?aG9raE1VbmE1c3M2TnlnQU1tOUJIUEUxMXl4Z2E2UkkxTEVxUTZoOEp2S2E0?=
 =?utf-8?B?RW92UllLQ2ZremhqNWZYMkhXTHRuMlRpdUpueGNzdUUzWWNPclJMbno5a3lR?=
 =?utf-8?B?dnhuTCt2bXZPRzZSemlqTU9ER25SZ21nb1R1VFN2UEVTSk8yYm15ei81cmc1?=
 =?utf-8?B?elFTZXpidGNJQlVKKzZFcTg1Nzh3NFI0ajA0d2oyYWVqSTNwSWo2RVZuVHN1?=
 =?utf-8?B?MlFYOTBreS9YRHhnSDd6UjVoSkE0SDRZVTAxdWpsNDA2RVlhZDh3Qm5uTllT?=
 =?utf-8?B?SnptSEJWdVM4eEpXLzc5R1hQMzNHeC83RzZkV0xYc1FwQ0MyM2xxQ0R3M3Fh?=
 =?utf-8?B?MjlmVmdUWDBPeDdYZ2drTFNYMzhzd0trYVpXM2dVMnl1RGlRN0FUNXljMkhn?=
 =?utf-8?B?QnNQbFFlS1Jsd09FSXdEYUxOOUZpYzBmOFJYUDJqOXp0bzVsaWttNis4QU1r?=
 =?utf-8?B?SjRUUUJmanlXclNveUZZZ21SZ0VYQnJDbzN1N1JpdmtxaFUzWmNWclNhZVdk?=
 =?utf-8?B?YjArNlEvSDRPYUpXdWYxWlhnQnVnMnRneHJaVFlHSEoxUkJ1dVpZeFIydDFY?=
 =?utf-8?B?SjFOMmR0V0ZnWUU4SkVPRUR1R0ROMzRJQlRQQnFWZVBKM3l1QVIzUVBDYXpK?=
 =?utf-8?B?MjBnKzZXZEJMb3RuRnphdHVETHBpWkNOZG5kT0t4MnBFckJBYkFTNGx3WnFk?=
 =?utf-8?B?aVl5ZnQvbnA1MkkwUmdLSERvOXpVYnU0QlI2R2R5SnpiQjhUOXVZQVI5NmlX?=
 =?utf-8?B?R2tRUnE5a2NyaXB2a1FKZjN5MWlnbWI5bUNFYXFBQksrUzFTRVRvNlZZMnQv?=
 =?utf-8?B?TC96Rmw4SVlMaU0vM1NwWkdSaFFRaFcwbkJOR05kUlVmN3orQmJ5bWZZNnlQ?=
 =?utf-8?B?NEMyenYrTTQzbm8rQjlza3VWSEkrM2RKNFVUeDFENjBJNWRISXpURmRuZkVX?=
 =?utf-8?B?dUthWDZmQUw5M2pVaUMwOXBacmlaeFl2c2RONGoxQmlyZEVHcVFKdnFxdDVK?=
 =?utf-8?B?L2tPRGlpdWI5VUdvV3JFTmpyNjdtd2xXS3JmaWwyd0llYmc2Ukxqak9rUHNx?=
 =?utf-8?B?RWVVem91Z3BmTXZLbVNKN0U3UGgvc0I1dE9kVmYvdVNQa09kSUQ0Ky9pVTAx?=
 =?utf-8?B?MWVEcnRBNkxqSmxlZm4vMHhQRUdPUFM4RStBZHdHaUY5SnJmY1B3Y2Y3N29S?=
 =?utf-8?B?N2twYlRWSUlvaE1VNm02T0ZTeU9ZcTlXTWZpNTVtN2pFQ0hHSDRVQllyaEx5?=
 =?utf-8?B?QnNyd1JHRmpIbFdPYnhXdkpiOVpib2drZm1xcEZERFRXOHdack1UcDlkeFlp?=
 =?utf-8?B?S2pCbitsaytzSFE4QVAvOEcvR3A5eEVhbmFSLzNQcVFIbXBqcXA3MElrMkF4?=
 =?utf-8?B?TmdLVEE0RW1TY1dqQlMxV2IzTVh6ZGxUNU1tOWNYOEN1bGlxNzVoOHhXOTVr?=
 =?utf-8?B?YUx5aGxldHZQeHZnOUlXWnJFQnpwai92Ry8ra2N1QlQ2V2trYmp0dDRJSjAw?=
 =?utf-8?Q?J2C4ogWQKQTBz6zoieLCGkZGC?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: irondevice.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ddc6c5f-718d-4092-7203-08db05a475b0
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2023 05:06:51.0017 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b4849faa-3337-494e-a76a-cb25a3b3d7d1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UszkEOkzHmYyK2bucuibbLxyzF2A7Pm81TaX2lfgsQJS98km3aRYSQ1U/6egaUyKjOV+FcAGhaDJTpMh3hGtjdaskATghgshoDyn/elcW4U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2P216MB1327
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

PiA+ID4gPiArDQo+ID4gPiA+ICsgIGkyYy1yZXRyeToNCj4gPiA+ID4gKyAgICBkZXNjcmlwdGlv
bjogbnVtYmVyIG9mIHJldHJpZXMgZm9yIEkyQyByZWdtYXAuDQo+ID4gPg0KPiA+ID4gV2h5IGRv
IHlvdSBuZWVkIHRoaXM/IFdoeSB0aGlzIGZpdHMgdGhlIHB1cnBvc2Ugb2YgRFQgKG9yIElPVyB3
aHkNCj4gPiA+IHRoaXMgZGlmZmVycyBiZXR3ZWVuIGJvYXJkcyk/DQo+ID4NCj4gPiBXaGVuIHdv
cmtpbmcgd2l0aCBkcml2ZXJzIG9uIG11bGl0aXBsZSBwbGF0Zm9ybXMsIHRoZXJlIHdlcmUgY2Fz
ZXMNCj4gPiB3aGVyZSBJMkMgZGlkIG5vdCB3b3JrIHByb3Blcmx5IGRwZW5kaW5nIG9uIHRoZSBB
UCBvciBzZXR0aW5nLg0KPiA+IFNvIEkgbWFkZSBpdCBwb3NzaWJsZSB0byBzZXQgYSBmZXcgcmV0
cnkgc2V0dGluZ3MsIGFuZCB0aGVuIGNoZWNrIG9yDQo+ID4gZG8gb3RoZXIgYWN0aW9ucy4gUmV0
cnkgaXMgcGVyZm9ybWVkIG9ubHkgd2hlbiBJMkMgZmFpbHMuDQo+ID4NCj4gPiBBbmQgZWFjaCBk
ZXZpY2UgbWF5IGhhdmUgYSBkaWZmZXJlbnQgcHVsbC11cCByZXNpc29yIG9yIHN0cmVuZ3RoLCBz
bw0KPiA+IHRoZXJlIG1heSBiZSBkaWZmZXJlbmNlcyBiZXR3ZWVuIGJvYXJkcy4NCj4gDQo+IE5v
bmUgb2YgSTJDIGRyaXZlcnMgbmVlZCBpdCAoZXhjZXB0IFNCUyBiYXR0ZXJ5KSwgc28gaXQgc2hv
dWxkIG5vdCBiZQ0KPiBuZWVkZWQgaGVyZS4gSWYgeW91IGhhdmUgd3JvbmcgcGluIHNldHVwLCB0
aGlzIG9uZSBzaG91bGQgYmUgY29ycmVjdGVkDQo+IGluc3RlYWQuDQoNCk9rYXksIEkgYWdyZWUu
IEl0IGRvZXNuJ3Qgc2VlbSBuZWNlc3NhcnkuDQpJJ2xsIHJlbW92ZSB0aGlzIHByb3BlcnR5LiBU
aGFua3MhDQoNCj4gPiA+ID4gKyAgdGRtLXNsb3Qtcng6DQo+ID4gPiA+ICsgICAgZGVzY3JpcHRp
b246IHNldCB0aGUgdGRtIHJ4IHN0YXJ0IHNsb3QuDQo+ID4gPg0KPiA+ID4gQXJlbid0IHlvdSBu
b3cgcmUtd3JpdGluZyBkYWktdGRtLXNsb3QtcngtbWFzayBwcm9wZXJ0eT8gU2FtZSBmb3IgdHgN
Cj4gYmVsb3cuDQo+ID4gPg0KPiA+DQo+ID4gSXQgY2FuIGJlIHRoZSBzYW1lIGFzIGF1ZGlvIERB
SSdzIHRkbSBzbG90LCBJIHRoaW5rIGJ1dCB0aGVyZSBhcmUNCj4gPiBjYXNlcyB3aGVyZSBpdCBp
cyBzZXQgZGlmZmVyZW50bHksIHNvIEkgb21pdHRlZCBpdCBzZXBhcmF0ZWx5Lg0KPiBVbmZvcnR1
bmF0ZWx5IEkgc3RpbGwgZG8gbm90IHVuZGVyc3RhbmQgd2h5IGRvIHlvdSBuZWVkIGl0LiBVc2Ug
Z2VuZXJpYw0KPiBEQUkvVERNIHByb3BlcnRpZXMuDQoNCkxvb2tpbmcgYmFjaywgaXQgc2VlbXMg
dG8gYmUgdGhlIHNhbWUgYXMgdGhlIGRhaS10ZG0tc2xvdC1yeC1tYXNrLg0KSXQgc2VlbXMgdG8g
YmUgY29ycmVjdCB0byBtYXAgdGhlIGFtcCBmdW5jdGlvbiBpbiB0aGUgZHJpdmVyLg0KDQpIb3dl
dmVyLCBJIGxvb2tlZCBmb3IgdGhlIG9uZXMgdXNlZCBpbiBvdGhlciBhbXBsaWZpZXIgZHJpdmVy
cywNCk1vc3Qgb2YgdGhlbSB3ZXJlIGFkZGVkIHRvIHRoZSB1c2VyIGNvbnRyb2wgdXNpbmcgbWl4
ZXIuDQoNCkNvbWUgdG8gdGhpbmsgb2YgaXQsIHRoZXJlIGFyZSBtYW55IGNhc2VzIHdoZXJlIHRo
ZSBURE0gc2xvdCBpcw0KY2hhbmdlZCBhZnRlciB0aGUgZHJpdmVyIGlzIGNvbm5lY3RlZC4NCg0K
PiA+ID4gPiArICBzeXMtY2xrLWlkOg0KPiA+ID4gPiArICAgIGRlc2NyaXB0aW9uOiBzZWxlY3Qg
dGhlIHVzaW5nIHN5c3RlbSBjbG9jay4NCj4gPiA+DQo+ID4gPiBXaGF0IGRvZXMgaXQgbWVhbj8g
V2h5IGRvIHlvdSBuZWVkIHN1Y2ggcHJvcGVydHkgaW5zdGVhZCBvZiBjbG9ja3M/DQo+ID4NCj4g
PiBUaGlzIGNhbiByZWNlaXZlIGFuIGV4dGVybmFsIGNsb2NrLCBidXQgaXQgY2FuIHVzZSBpbnRl
cm5hbCBjbG9jay4NCj4gPiBTaG91bGQgSSB3cml0ZSBhbGwgdGhlIGNsb2NrIGRlc2NyaXB0aW9u
cyBpbiBjYXNlPw0KPiANCj4gSG93IGRvIHlvdSBjb25maWd1cmUgYW5kIGVuYWJsZSBleHRlcm5h
bCBjbG9jayB3aXRoIHRoaXMgcHJvcGVydHk/IEkgZG9uJ3QNCj4gc2VlIGl0LiBJZiB0aGUgZGV2
aWNlIGhhcyBjbG9jayBpbnB1dCwgdGhpcyBzaG91bGQgYmUgImNsb2NrcyIuIElmIGl0IGlzDQo+
IG9taXR0ZWQsIHRoZW4gaW50ZXJuYWwgY2xvY2sgaXMgdXNlZC4NCj4gDQoNCkJhc2ljYWxseSwg
dGhpcyB2YWx1ZSBpcyBzZXQgd2l0aCBzZXRfc3lzY2xrIGluIHRoZSBkYWkgb3BlcmF0aW9ucy4N
ClNvLCBJIGFsc28gZ2V0IHRoZSBjbGtfaWQgZnJvbSB0aGlzIGZ1bmN0aW9uIGFuZCBzZXQgaXQu
DQpGcm9tIHRoZSBwb2ludCBvZiB2aWV3IG9mIHRoZSBjb2RlYyBkcml2ZXIsIHRoZXJlIGFyZSBj
YXNlIHdoZXJlIHRoZSBtYWNoaW5lDQpkcml2ZXIgZG9lcyBub3QgZ2l2ZSB0aGlzIHZhbHVlKGNs
a19pZCkuDQoNClNvIHRoaXMgaXMgYSBwcm9wZXJ0eSB0aGF0IGNhbiBzZXQgYW4gaW5pdGlhbCB2
YWx1ZS4NCkl0J3Mgbm90IHJlcXVpZWQgdmFsdWUuDQoNCkFsbCB0aHJlZSBwcm9wZXJ0aWVzIG1l
bnRpb25lZCBhYm92ZSBhcmUgb3B0aW9uYWwuDQpTbywgaWYgaXQgbmVlZCB0byBiZSByZW1vdmVk
LCBpdCdzIG9rYXkuDQpCdXQgSSB0aGluayBpdCBzZWVtcyBjb3JyZWN0IHRvIHJlZ2lzdGVyIHRo
ZSBzZWNvbmQgaXRlbSh0ZG0gc2xvdCkgYXMgYSBtaXhlci4NCg0KVGhhbmsgeW91IGZvciB5b3Vy
IGdvb2QgZmVlYmFjayENCg0KQmVzdCByZWdhcmRzLA0KS2lzZW9rIEpvDQo=
