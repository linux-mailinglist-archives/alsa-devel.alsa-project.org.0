Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5924E894BCE
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Apr 2024 08:50:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 612662BC2;
	Tue,  2 Apr 2024 08:49:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 612662BC2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712040608;
	bh=x2MB+Hj9EDgae7as2NT+HRmMCEPSltPqzfNCNRycI7w=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QGuK2mRRZWKs4Q6yFXtQna4nq2NpeL9mrdsgqtprDf/gh7oogQ6d9eNoijmVoLl3S
	 4Y+48bxGcLwxv2BBt/JSHvQue9laqbpsTPaNl5U0vbPeLvWNQSezipFSWYJCdiWlrd
	 oYboYNwaGliQbb3hhKlnHPWFSlOuVrMYJSicwp4c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 48E7BF80616; Tue,  2 Apr 2024 08:47:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BA607F806A8;
	Tue,  2 Apr 2024 08:47:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 751E8F8025F; Tue, 26 Mar 2024 03:04:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn
 (mail-bjschn02on20701.outbound.protection.partner.outlook.cn
 [IPv6:2406:e500:4440:2::701])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 58CD9F801EB
	for <alsa-devel@alsa-project.org>; Tue, 26 Mar 2024 03:04:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 58CD9F801EB
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OpPhOUZGJUY7ntAaU9CGq787h3ddXq9q9jYh8Hxqk1aExdBxh0ve+JVriQ7WvjlzzM+7T0E0u8FI5d5LDauuz5PgfjOIQS2OoRiL9n/ns/fo3js4IykkPDoYX0q46v3XUmN20XygCJxbNdy7meruxuAowkTLJbOWvEzdoq0b6Kxyg2CjjZfINWSu8HqtXorr/xnru7i8xz+wwAcGaFnRwhoXsbStLhMPMnIixzxSciHEK/ylLnMVLJNLOgG1Y8cioXNjVuaKzhjztQAD1t3ZkMiNCahAGvSxXoXik1e3Kk7fe1ngVK1AiinV6DCfTw/J6jI6A6b8lH9rsNFzB89fRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x2MB+Hj9EDgae7as2NT+HRmMCEPSltPqzfNCNRycI7w=;
 b=lPU+o2H7Ye5J8pyPStDlLdaeWwbrMVkvkfsFWDIOV/DZM/uOWY0dYaCVhbjfps/35/0zxOYrtgaU8+B95s4VRqEBAJazkKAoihGnSaUu0ODdOf8pGC1LOl8IwRq80uDgs1ElfI5lGyiJU2fljV47z4PfkjtT+OOf4j3o94wUIS/Wmjy5yEPC4zNexMLYVaEDWyfMVBL08PNXexG6M0BgTTLS2ovMjGdP0gKwFnGVL4jzYxs1puU67WoQF0CTGVd4/L4pviqhPtZ6PutKoOGoSrFKN6JehlAjUbMpwy6G0Y4B0qwSQUepIzg8cOw+xrCXBckG95qa/4i21fK8N2tMQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:8::10) by NTZPR01MB1036.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:8::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.26; Tue, 26 Mar
 2024 02:04:28 +0000
Received: from NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn
 ([fe80::9a50:2c82:c5d4:2b3d]) by
 NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn ([fe80::9a50:2c82:c5d4:2b3d%4])
 with mapi id 15.20.7409.028; Tue, 26 Mar 2024 02:04:27 +0000
From: Xingyu Wu <xingyu.wu@starfivetech.com>
To: Mark Brown <broonie@kernel.org>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.intel.com>
CC: Liam Girdwood <lgirdwood@gmail.com>, Claudiu Beznea
	<Claudiu.Beznea@microchip.com>, Jaroslav Kysela <perex@perex.cz>, Takashi
 Iwai <tiwai@suse.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor.dooley@microchip.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "alsa-devel@alsa-project.org"
	<alsa-devel@alsa-project.org>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>
Subject: 
 =?gb2312?B?u9i4tDogW1BBVENIIHYyIDIvMl0gQVNvQzogY2RuczogQWRkIGRyaXZlcnMg?=
 =?gb2312?Q?of_Cadence_Multi-Channel_I2S_Controller?=
Thread-Topic: [PATCH v2 2/2] ASoC: cdns: Add drivers of Cadence Multi-Channel
 I2S Controller
Thread-Index: AQHaeqVhb5UxutBmeUyJ/qlePUaJGrFAuWEAgAAFwQCACI4WIA==
Date: Tue, 26 Mar 2024 02:04:27 +0000
Message-ID: 
 <NTZPR01MB0956B68B8213F329FD8817BB9F35A@NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn>
References: <20240320090239.168743-1-xingyu.wu@starfivetech.com>
 <20240320090239.168743-3-xingyu.wu@starfivetech.com>
 <1d0399d2-684f-490e-8711-f636e987a0b8@linux.intel.com>
 <aeac0262-1054-4bc9-b5e9-653785305162@sirena.org.uk>
In-Reply-To: <aeac0262-1054-4bc9-b5e9-653785305162@sirena.org.uk>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: NTZPR01MB0956:EE_|NTZPR01MB1036:EE_
x-ms-office365-filtering-correlation-id: c38d73a1-e8dc-4cb7-f979-08dc4d391159
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 mlgs/SzIuhUmigUqW0GYeO78/swJ603xwzxIIM5J6uAh6pv8gROMFlnRkHqE3D++X5kyqSby9Hwj4H3XDGYgCVDODITxTVBTUiOOmBRQq3SooNfBWjFIZfW08CZrkEkyK3u89PAwA6npv/4W3lh5oi7M8qFVpSPh8s8Hvy/83NNyBMyyps3hwg+ouZMvqqA/bG5zvzoqmz3wB45p8Pb/zuqL0JhhDko7V0yYQmgUJ6LiMMvhUsPF6Qmamw3Bu4R64lgvDhQw9UnNRZnkqYxGPwiz+V40TNijOGsPdXWaXYBV477Z+Spt8DNsfBmcIb5R2Ll8eYZZL9i2E4+kUmT0wKqLmYmM6aWw2UN4sq19++HYXMCaR/T3fCdFTVsC3JX4R9aN8Hlx+E1dMZpmn00eS7lbkGY/qIMDRO8wPhMV4SQrUkGUzwg0EhXH8ZOkDHyts0XmnajHYHEki2KqdY1LahFsS0MOXIRRu3y5vxOEF6C1b67ThiX6+zhGQDoCbubH158SyhsLWI/ecuUcrcME7wiKacTwiq3OWHgtCdNc9EsVGGtmp17pHdn5xZYoFCg0GYIPghPznlH7bB0+kt2SVAxJzHigWC6d2rF/n1P7tm3s3/3xONSAddy0O4Ai+LqZ
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230031)(41320700004)(7416005)(1800799015)(366007)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?gb2312?B?emR3Mzl4VzJFMytBMFBFU0hmNFJIZmt3WUw1NlpjbHExdTcxTUhIUFNKd1hM?=
 =?gb2312?B?dVJMU0l1V00vV0hhenk4MHhOUFZOQkU2YkhwUFhVVThtNGx5NnlVQjkraEJr?=
 =?gb2312?B?VU1NYWZrYmMwdVE5L3lLZTcwdVg3aDM4b2ExR0ZYemU3L0xYQk1ETkRSWnE1?=
 =?gb2312?B?NXlIT0pvajFkeklsakVmSk9vWGxVNWpjc1FUZjN6eG0rbFFQajgyL3hlenQ3?=
 =?gb2312?B?RWYrd3hJOEV4aGxxTDhjWk50MmdRalhWYXBQL1Q5NzVsTlBBbWVkRXFuWExB?=
 =?gb2312?B?ZTBYQkhSci9LWUUyNWpwVXE5ck9oM1F2NlhFclV6NXA5YnNQYmh3OEsrOUpH?=
 =?gb2312?B?NDh5N1h3SEc1ZVlKZ3h5UTh1SDVFWHpIaURUWE1yUmVOYUN1UzdZRSt0ME1Q?=
 =?gb2312?B?aTJQcGQ4NHVIMkY5TFd4KzZxUitLTjd2azBKQjJQTnZHNUNidkM5Ri8xWHhL?=
 =?gb2312?B?MlBScXd1MFV4cE9vOU90cTlFaE9JL1RlM1laU1Fzd29RTitleTlQUDF2MzJX?=
 =?gb2312?B?Slk0cVJjYzR4RkVzSXRoZlVUWERvWW52aWlZUm9hOHYvc3lnUVIrWWdFSjhw?=
 =?gb2312?B?MXlBRzdEOVJPTnFjaXMzakdGTVNYMFJwait6ZXduTVhhVG15R3h2cytGc3Q2?=
 =?gb2312?B?VEtQemVPUmE4M2ZTMmI1UDhSM0lKNUZ6T2J2ck82eCtjT2prMUowTVFkNkpO?=
 =?gb2312?B?WmFoZHpKc1ZCd3FkZEUyUHMzZ3BqUDFaUEprYjFSMC9TNHlDT0ZqVU54d0pR?=
 =?gb2312?B?VnNoR21FMG83OGJUdW5XRWZNSXo4TzFsZHc1ZnE3b1dzNFM2TG1VODQwMFRZ?=
 =?gb2312?B?K0l0bmFiUVYvd3drL2hhaWhyekRuL1BhMHpvakV4N1pVMk1NRnF2NFVxdGNa?=
 =?gb2312?B?ZDlhMTYxUmdOWU1KdHIxNFZvUWpaWm9jVTV6R2RGaW5tT0tDNUdQcDZuaW81?=
 =?gb2312?B?RGFNS1JWaFFQYm1wYnIxZ3RUalRqNjd4bjlwWjJLS1NXOEJ6YXJYem85a1Zp?=
 =?gb2312?B?anh0V3VHeVJTQUVlK056YlViK0E4ZEp4RHRLbVlKZHpkRzBUMG54NzkvZkV4?=
 =?gb2312?B?YmVyc0dDbVNBUVR0ZDdUSUVBb05PL08xelRoOU93dDc2aHdMOHFEYnZHVDlx?=
 =?gb2312?B?MnRZR3BjdDY1TXlEMnN6Y1lSMzlKYzJzVkVMK3E3WThGZ1hEbmloK0cvWnJw?=
 =?gb2312?B?b013UDA1bjJFcnJ6NVFya2lVTC9lblJSdlFoL01GMHVSQU13SU9KMjNJQk40?=
 =?gb2312?B?bCtuSHNRR3YwYTRuTTlYVDVyMnVUTnBpNkdzUlE2VmdNMUJONXVlVjAyV0wy?=
 =?gb2312?B?N2tLK1hUaWFxNVFsQW1wVTBMcG9YT2s5cjU3Z3dwVnlOWDlyQnlBbEZrTENq?=
 =?gb2312?B?R2M1eWdPWmJhMEExN0xLZlQzcmFudnI4TVIrNU9hMDVQS2d5dDVwTkpJTDk0?=
 =?gb2312?B?T1Z4RGNsUC9saUU5UGpBWlQ0OWs1WGs3RXRYODdWRktWZThKQlJWUTRyVWxN?=
 =?gb2312?B?VkthOWIyaGs1cXBxS1Ewa3hlZngrdnVCWDcwN1diUHZKVkx0NVVrQVRMNnBl?=
 =?gb2312?B?b21nZlRHbE85RHF4VnZhby9lOUZNck1tdUJFbSs4V3ZPTUhqdmROT1lWT3Ay?=
 =?gb2312?B?NVVZNXYzWDhvQVpJMVpVSGlCdVBXWTNnaHN0ZmgzTEp6T2k1bzBRcXlmZGFV?=
 =?gb2312?B?S3lxZERFWmhQT2k1OHRFVzM4Tm1kR3BmNTZUSEpBNmhsVkw4eFNEUUJGMXRu?=
 =?gb2312?B?MVFVZEJEdStoT21HMTJ3L2Fva1l4Tk8xZGtKNFNEaFhSU21KaHgydlNEei9T?=
 =?gb2312?B?b2xQMzhsWGNVMTc0UkdDUEswdWhyazJaaXZZQ1lqTDlvNVdudUlESGZ2ZlN4?=
 =?gb2312?B?a0U1YkRGWlJoKzZEWHhVSHZvMnY2eTI2TkE1YXF5dXNHclRrYm8xNzk4UUdh?=
 =?gb2312?B?Z0NGRENXUExkc2o2eXFSbWNPNUlxN3FuenZNc2hJVHNRaFFOU1NPeDBWL1ph?=
 =?gb2312?B?YzFrY3pFeHpJRUx3RG54U09Vak84cW1Oc3hzcWNocGlKNGFVTnZCclpQMWNl?=
 =?gb2312?B?MjdDQm0rQjV1NlZ6S0pzNWpBb2hZVnZaU0VQenRYeXJDQ3NNR0tvRDRJN1dM?=
 =?gb2312?Q?k93yUx8/DW6q/mT4IDY2negOf?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: 
 NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c38d73a1-e8dc-4cb7-f979-08dc4d391159
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Mar 2024 02:04:27.9293
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 rdftkrDAL+6mBMVdIS2MNWJGaS15bimGn70w8JtEzrA4Q+8czYDa0RHGZXOHtu1aL33GTrD9/vDh/9pB0JF17yHkVgJDVlvPq6wyl+3P/mA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: NTZPR01MB1036
X-MailFrom: xingyu.wu@starfivetech.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: DV3LIMKUTZBGRZGRWRMBHTXFO3TSZ5FA
X-Message-ID-Hash: DV3LIMKUTZBGRZGRWRMBHTXFO3TSZ5FA
X-Mailman-Approved-At: Tue, 02 Apr 2024 06:47:34 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

PiANCj4gT24gV2VkLCBNYXIgMjAsIDIwMjQgYXQgMTA6MDA6MjRBTSAtMDUwMCwgUGllcnJlLUxv
dWlzIEJvc3NhcnQgd3JvdGU6DQo+IA0KPiA+ID4gKwlmb3IgKGkgPSAwOyBpIDwgQ0ROU19JMlNf
RklGT19ERVBUSDsgaSsrKSB7DQo+ID4gPiArCQlpZiAoZm9ybWF0ID09IFNORFJWX1BDTV9GT1JN
QVRfUzE2X0xFKSB7DQo+ID4gPiArCQkJZGF0YVswXSA9IHAxNlt0eF9wdHJdWzBdOw0KPiA+ID4g
KwkJCWRhdGFbMV0gPSBwMTZbdHhfcHRyXVsxXTsNCj4gPiA+ICsJCX0gZWxzZSBpZiAoZm9ybWF0
ID09IFNORFJWX1BDTV9GT1JNQVRfUzMyX0xFKSB7DQo+ID4gPiArCQkJZGF0YVswXSA9IHAzMlt0
eF9wdHJdWzBdOw0KPiA+ID4gKwkJCWRhdGFbMV0gPSBwMzJbdHhfcHRyXVsxXTsNCj4gPiA+ICsJ
CX0NCj4gDQo+ID4gd2hhdCBhYm91dCBvdGhlciBmb3JtYXRzIGltcGxpZWQgYnkgdGhlIHVzZSBv
ZiAnZWxzZSBpZicgPw0KPiANCj4gSW4gZ2VuZXJhbCB0aGluZ3MgbGlrZSB0aGlzIHNob3VsZCBi
ZSB3cml0dGVuIGFzIHN3aXRjaCBzdGF0ZW1lbnRzLg0KDQpPSywgSSB3aWxsIGZpeCBpdCBpbiBu
ZXh0IHZlcnNpb24gb2YgdGhpcyBwYXRjaC4NCg0KVGhhbmtzLA0KWGluZ3l1IFd1DQo=
