Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E30718CE525
	for <lists+alsa-devel@lfdr.de>; Fri, 24 May 2024 14:19:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 92DDC85D;
	Fri, 24 May 2024 14:19:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 92DDC85D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716553179;
	bh=3fJV0N8bcBPb/6WGn5245Vl+9oKKPv/7ckCd+Cu+vlQ=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kqBFC+L1p4K7DzU9tOz7MRHQ+S7x6wXE3DIFBPMDQ7m0M1qD7jfKyEwOdNRwFqL4U
	 dCL3o06ZtURm25OAYjVu7a2srwSzkoymXs7HjgQuuddC5g+Dq+N6/qjhYfYhWCHktd
	 Yu5o0ndQQmeCFbCo5enUyqPgsL/OGwiv81o7z2Ms=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4A10EF80630; Fri, 24 May 2024 14:18:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 196DBF80615;
	Fri, 24 May 2024 14:18:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0C206F8026A; Wed, 22 May 2024 10:32:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn
 (mail-sh0chn02on2072d.outbound.protection.partner.outlook.cn
 [IPv6:2406:e500:4420:2::72d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4B2F2F800BA
	for <alsa-devel@alsa-project.org>; Wed, 22 May 2024 10:31:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4B2F2F800BA
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QxKBfDRkKJJV4g3Iqx7EdWMHiwLiMWdfU5OXGsf/rU0rynAUgMtVbloBsLTxBbr8yoQL1lK9/caKDH4x97T6CKhav532erh2kp9uz9vRftLPUEEShEbZ5c1tTW29YIQP0aVG+/PjCN60O9GxChE+KuT58yvfSfLO+X7hZ8h+mxd8Pg7hMoVK39dpdt3EmN/yTMmOoGhZZ+9GFLTO1/MAUowIsEf9tzG72uVAFwMwNFbOo8/UF5sU8Ze1za5TMNCuyiBoJsNiz+TnVePdD+k+O1VO9kAC2E9e+rZcgNc9hyrrv+JqS4RYRt+JgFmlhD9zOnQ4B5UR+qZP70AfPyw9lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3fJV0N8bcBPb/6WGn5245Vl+9oKKPv/7ckCd+Cu+vlQ=;
 b=EkJFMzzfCYdyC9BpNRXaAp1KAgrm/uXeomq9eqGRx7zGP5ZoNBQy7z5ql9yziD657DETXfM8636Un2AH7sDppLWsijpIgE8v+5coneSOjarVLMWIQA0drZvCeah7etLg1cUOQHDMYPZm9yaVuOgXGF0mGDYQtGiH90bcMZgEHqQDx7DMTuvlRGXaWka720AwVIUncJw5+tVDQdL/lab0Us67iapMDhpHyVtBJoLkFZq0EjJj00Psg7RPJp+7nanFim2QNRGiHt2jZEt23/TxPWMuGvZgdeFeO1hbZAuFbOJ6nGUp4xZFIBlkhgJBDhzOrHMNrJlSR2p70HulPJfiKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:8::10) by NTZPR01MB1067.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:9::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Wed, 22 May
 2024 08:31:48 +0000
Received: from NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn
 ([fe80::e903:99a6:10b7:304d]) by
 NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn ([fe80::e903:99a6:10b7:304d%6])
 with mapi id 15.20.7472.044; Wed, 22 May 2024 08:31:48 +0000
From: Xingyu Wu <xingyu.wu@starfivetech.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Liam Girdwood
	<lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Takashi Iwai
	<tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor.dooley@microchip.com>
CC: Walker Chen <walker.chen@starfivetech.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "alsa-devel@alsa-project.org"
	<alsa-devel@alsa-project.org>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>
Subject: RE: [PATCH v2 1/2] ASoC: dt-bindings: Add PDM controller for the
 StarFive JH8100 SoC
Thread-Topic: [PATCH v2 1/2] ASoC: dt-bindings: Add PDM controller for the
 StarFive JH8100 SoC
Thread-Index: AQHalVkH07xuCGa5y0qrTe+ETpKiv7F1nF4AgC17FaA=
Date: Wed, 22 May 2024 08:31:48 +0000
Message-ID: 
 <NTZPR01MB09568BEFB1ACE78D2F5347099FEB2@NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn>
References: <20240423083405.263912-1-xingyu.wu@starfivetech.com>
 <20240423083405.263912-2-xingyu.wu@starfivetech.com>
 <a5f8746f-14f8-4e56-9ac7-30c7ba6fad30@linaro.org>
In-Reply-To: <a5f8746f-14f8-4e56-9ac7-30c7ba6fad30@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: NTZPR01MB0956:EE_|NTZPR01MB1067:EE_
x-ms-office365-filtering-correlation-id: 4fa0534f-5dbb-4c9f-0c71-08dc7a399f19
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: 
 BCL:0;ARA:13230031|366007|41320700004|7416005|1800799015|38070700009;
x-microsoft-antispam-message-info: 
 MQ8dRYBFi9wee0f/lijvmNYz9CCMpHgVA3w3lukwiClZBqIAcPNmBvXRs1QdNJf5v07EKluATZhVcmzVgZkqxZ5/LoFc+d2Kz6/DTjbUdYyGdTTYCkUsiKUCmHHLaAxvbV+f8RHDveW528Tkp3zYQCCRVYbl8FQm6IM9W9PDLs1WiVqzpt38MqagvfiIvp3XMmFRoy4xPNJb6+W4EaJDryyqpqlaUzLL99kQ6wcJemedq1EVmiy+w+yH+Bh85EfKfsCiWNlp4GJPcUvkZcq2cUT7jZF9E3sZ6E3ZQY1Gi4cEOfMDfhPRymDKdW4HdDIFVNcS7p+waXApfqrOG3ZdBJ3St1Ou0TfzzOc8Ctv0J733mUK66UyNHKlIkp3XFi7xaSryqzcHEISKgb26ISueYr8eyfFpbKY0ongcb5pWvTYM2ougBxebmTMnq72YwzneWZDg8DHBlz0+iJQN+dOmnC42UBlKMFa5x26k0wKIEha6dEOtYCyH+LE1Z+IRlIxCk9wbDnGqvWzpufGD1x4DBkTCm4pfnZ6ol1UmvMXAM0C9Qjw6WY4USJ6cHoInWD3V/T0VEfHS9tkc30Sqooj4sTLXOKqSXeHwv6uo86TfvsxGrddSgLRDiyArWI6FY2kN
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230031)(366007)(41320700004)(7416005)(1800799015)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?WlRWL2xOZzdLeVY3Q1J4YkN4VXZYMHpjK0IyZ1VxWmVPdHNvTkV1Zk5ZOFBJ?=
 =?utf-8?B?eHpJaGJDRlM0YnBaS1RjbnVLS2h3WGRwWFBxOW5rY1JXZDhoZE5lT0I1QXl0?=
 =?utf-8?B?NzdpMUdiMkptWjNMK0Z5UUZCVkI5T2oxcEd0aVBYUjZzeWRMRDJIRXgvM0JY?=
 =?utf-8?B?U2RhamRrS3RtdjYzb0poRWlEYXBFaTFVKzB0eTNlZG11R0laNUJqY0srSnlq?=
 =?utf-8?B?ZzhvNXV1UE82cytCdU0rVnBtdG4zYmNIMFVCang3RTNhdUVrNkEyVVdQZmNU?=
 =?utf-8?B?bUduVnVNdXlKM2VvME5iMnphOGlYMlFFOFBxYk9SVmxyRlFMaU1QTUVyVVBr?=
 =?utf-8?B?MlJLYzdLZkFvUEpXSGNxSm1NVHZXY0tSOG43cWRUOVBHWFpQWXBBVytWMG1p?=
 =?utf-8?B?UmYrOHZvTGlNNXBZV0VaN1hlMUltdERKT3YvTnhMc25TaEgvOXFMb3hzMHZH?=
 =?utf-8?B?bzJ0NWUzYUllRUJEMjliSVF5dFdXMXFrWXMwYjZhRFYzdjEvUDQxU29pV0xC?=
 =?utf-8?B?ZHk4M3FpM2o0NldLcG1mT0l6Sjg5STNqZGdBblRBVnFCTmQ1QmIrQmFIaGdP?=
 =?utf-8?B?anJSTFFyU3I4NnRYWWJqNDh2WDBJbStEeVh1bFNKZjFhdkxnOGVSM3h3SzFV?=
 =?utf-8?B?UWU1eGVoZDZhSFF4MmE3MVhxSjJsdWxmbXhKZFN2KzJ4Q09LWlg1VVg5OG9P?=
 =?utf-8?B?bk9uUXEyY044a0NPbXUzK1lJZjNJU3Q0ajVvYWJ3dGFVbENQYTFSUG1PcVpo?=
 =?utf-8?B?VnR2d3diS0pBajJPZUZ4Y2UxTUpGQUd1UjdMRHQwdUVZRFJpK21BVUpKOG9P?=
 =?utf-8?B?OWhBNFZQbGlXY0lucTlSNlZKT2pEUGtzeXNqVm00eFo1aXlJUlk0Vzl5R0tm?=
 =?utf-8?B?L25TSG5GejNBWlREZjkyam1FdVlmZlhBdGw1QkxxaHBnVHc5dmNVV3EyQzRR?=
 =?utf-8?B?ZVJWblZLSTkxcEVITDJSRmxLMDMxazBjYkNrMWpCUzZtaksrcTFmVk05QTlk?=
 =?utf-8?B?MzdXdGxhM2FPS29jOGE2MTFKVlNySEVIQVFIRGt4dnpub1hOMDltanN2bk9o?=
 =?utf-8?B?K0xBYXYxeU44T1l4RDRnNFZqdUVNcHdkWnlzWXByRW5GdnltZWY3MUNhdEJx?=
 =?utf-8?B?MjlSMFozNVdUVy9FemxjNEM3TUVTaSs2bXFPa2NyMGtkakdwRGRWZUhNTFdy?=
 =?utf-8?B?aWNiQmpFSkpGZi9uR3JtWWJCTkwxVE9pTTRxRG5qcDlMOFR5aTFPOUVlbEV5?=
 =?utf-8?B?dDF3eFZVN1BMVGkvYXNhdFFJZjdrTUd3OTFnSWswWndKS2RmL2hUeVZNcjBL?=
 =?utf-8?B?VmFUMUdIckdaMkExbFNvelNGd1dOdW53YW1CQkd3UC9VTmVCRCtHMGdyUzF3?=
 =?utf-8?B?YzBwbEFVVU1qbGsvcFl5Ui9QTS9vbTZxUTVKbTNJdVd5Y3FsSE1zN1B1cVNY?=
 =?utf-8?B?cC9Eam1FY2s2VEJINDFPYzUxakJNd3RabXdVTURuK0FTaFZJYXVKUGFuRGJ2?=
 =?utf-8?B?VU85SEk0TjJzWUFPN2RhbCtPaUNCZlBBQnZFL2JFbHRKU3l6dkwyeDF5ZEtw?=
 =?utf-8?B?cXhEZDBSeWlKNkxYT0dWMFZpaStJV3cwR3ZTRDFzUkNpOVF6M01QblZUTU5z?=
 =?utf-8?B?cE15SmdLT2Y3Z0s5eFoyNmx0WTI4cVFGaTVndHMyMmNIQnEwaW9JMm16N0hq?=
 =?utf-8?B?WmF2MmpCV0RTWG5kaXNneTBDbGJGcUJrTmxDSXRJZmZSY1E4WFZCTG9JV0dp?=
 =?utf-8?B?L1pQZDFGTVk5UXRiK0VmZllrd3Q2UmRVanR5b0dlU3QvOFZqWGh4eDArZWda?=
 =?utf-8?B?Vk5ucHZoczJJU2RYQmgwSHFMcXdRREFwK0pIT2ZRS0JMcEFlemc5RW5uY29j?=
 =?utf-8?B?Q0RaMVAyWXBYcXg5ZTM1UmJCUDNBR1NQYU9MZkZINXNCbEF4dGp0OWlWNTNE?=
 =?utf-8?B?TjhaUzlSa1VDVzF5U01EYmt1S2ZxVVNib1BrU2hTQjc3c2tWODBvQU5TdHBH?=
 =?utf-8?B?NVg2dGt4MkFUSjdxN1ZLV2dqK0UzR1VxWk9hKzlGNUxzMHRQTkdDUEN0T0xF?=
 =?utf-8?B?Vyszbk5TdG1UWDdiMzNFb2VORWxyUjh2Y29Cc3BYUUE5RDl0QXVpbUtaeDd2?=
 =?utf-8?Q?cwbRvNuFwOzBi1yP++DTpwhFF?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: 
 NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4fa0534f-5dbb-4c9f-0c71-08dc7a399f19
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2024 08:31:48.0677
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 UCJnUvayjCw0ePxKsnyfwH36dOa5IggNP0q8V5ZwI3NvfEZlh1vbXtxjnhmMhJN/WENPxaweyQ3FcydRr8vP1EXt4ALenfPjqCqRWzN8yCA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: NTZPR01MB1067
X-MailFrom: xingyu.wu@starfivetech.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: FCX6HJVKL6HWJWAYBJCRUYLLFKFMEFE2
X-Message-ID-Hash: FCX6HJVKL6HWJWAYBJCRUYLLFKFMEFE2
X-Mailman-Approved-At: Fri, 24 May 2024 12:16:24 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SNM6N2V7LSJMQA7V4D5ZA7URONTLUWYT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

T24gMjMvMDQvMjAyNCAxMDozNCwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToNCj4gDQo+IE9u
IDIzLzA0LzIwMjQgMTA6MzQsIFhpbmd5dSBXdSB3cm90ZToNCj4gPiBBZGQgYmluZGluZ3MgYWJv
dXQgdGhlIFBETSBjb250cm9sbGVyIGZvciB0aGUgU3RhckZpdmUgSkg4MTAwIFNvQy4NCj4gPg0K
PiA+IFNpZ25lZC1vZmYtYnk6IFhpbmd5dSBXdSA8eGluZ3l1Lnd1QHN0YXJmaXZldGVjaC5jb20+
DQo+IA0KPiBJZiB0aGVyZSBpcyBnb2luZyB0byBiZSByZXNlbmQvbmV3IHZlcnNpb24sIHRocmVl
IG5pdHMuIEFueXdheToNCj4gDQo+IFJldmlld2VkLWJ5OiBLcnp5c3p0b2YgS296bG93c2tpIDxr
cnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+DQo+IA0KDQpJIHdpbGwgZml4IGl0IGluIG5l
eHQgdmVyc2lvbi4gVGhhbmtzLg0KDQo+IC4uLg0KPiANCj4gPiArDQo+ID4gK3RpdGxlOiBTdGFy
Rml2ZSBKSDgxMDAgUERNIGNvbnRyb2xsZXINCj4gPiArDQo+ID4gK2Rlc2NyaXB0aW9uOiB8DQo+
IA0KPiBEbyBub3QgbmVlZCAnfCcgdW5sZXNzIHlvdSBuZWVkIHRvIHByZXNlcnZlIGZvcm1hdHRp
bmcuDQoNCldpbGwgZHJvcC4NCg0KPiANCj4gPiArICBUaGUgUHVsc2UgRGVuc2l0eSBNb2R1bGF0
aW9uIChQRE0pIGNvbnRyb2xsZXIgaXMgYSBkaWdpdGFsIFBETSBvdXQNCj4gPiArIG1pY3JvcGhv
bmUgaW50ZXJmYWNlIGNvbnRyb2xsZXIgYW5kIGRlY29kZXIgdGhhdCBzdXBwb3J0cyBib3RoIHVw
IHRvDQo+ID4gKyA0ICBjaGFubmVscywgYW5kIGFuIEludGVyLUlDIFNvdW5kIChJMlMpIHRyYW5z
bWl0dGVyIHRoYXQgb3V0cHV0cw0KPiA+ICsgc3RhbmRhcmQgIHN0ZXJlbyBhdWRpbyBkYXRhIHRv
IGFub3RoZXIgZGV2aWNlLiBUaGUgSTJTIHRyYW5zbWl0dGVyDQo+ID4gKyBjYW4gYmUgIGNvbmZp
Z3VyZWQgdG8gb3BlcmF0ZSBlaXRoZXIgYSBtYXN0ZXIgb3IgYSBzbGF2ZSAoZGVmYXVsdA0KPiA+
ICsgbW9kZSkuIFRoZSBQRE0gIGNvbnRyb2xsZXIgaW5jbHVkZXMgdHdvIFBETSBibG9ja3MsIGVh
Y2ggUERNIGJsb2NrDQo+ID4gKyBjYW4gZHJpdmUgb25lICBiaXRzdHJlYW0gc2FtcGxpbmcgY2xv
Y2sgYW5kIHR3byBiaXRzdHJlYW0gY29taW5nDQo+ID4gKyBkYXRhIChtb25vL3N0ZXJlbykgIHdp
dGggc2FtcGxpbmcgY2xvY2sgcmlzaW5nIGFuZCBmYWxsaW5nIGVkZ2UuDQo+ID4gKw0KPiA+ICtt
YWludGFpbmVyczoNCj4gPiArICAtIFhpbmd5dSBXdSA8eGluZ3l1Lnd1QHN0YXJmaXZldGVjaC5j
b20+DQo+ID4gKyAgLSBXYWxrZXIgQ2hlbiA8d2Fsa2VyLmNoZW5Ac3RhcmZpdmV0ZWNoLmNvbT4N
Cj4gPiArDQo+ID4gK2FsbE9mOg0KPiA+ICsgIC0gJHJlZjogZGFpLWNvbW1vbi55YW1sIw0KPiA+
ICsNCj4gPiArcHJvcGVydGllczoNCj4gPiArICBjb21wYXRpYmxlOg0KPiA+ICsgICAgY29uc3Q6
IHN0YXJmaXZlLGpoODEwMC1wZG0NCj4gPiArDQo+ID4gKyAgcmVnOg0KPiA+ICsgICAgbWF4SXRl
bXM6IDENCj4gPiArDQo+ID4gKyAgY2xvY2tzOg0KPiA+ICsgICAgaXRlbXM6DQo+ID4gKyAgICAg
IC0gZGVzY3JpcHRpb246IERNSUMgb3V0cHV0IGNsb2NrDQo+ID4gKyAgICAgIC0gZGVzY3JpcHRp
b246IE1haW4gSUNHIGNsb2NrDQo+ID4gKw0KPiA+ICsgIGNsb2NrLW5hbWVzOg0KPiA+ICsgICAg
aXRlbXM6DQo+ID4gKyAgICAgIC0gY29uc3Q6IGRtaWMNCj4gPiArICAgICAgLSBjb25zdDogaWNn
DQo+ID4gKw0KPiA+ICsgIHJlc2V0czoNCj4gPiArICAgIG1heEl0ZW1zOiAxDQo+ID4gKw0KPiA+
ICsgICIjc291bmQtZGFpLWNlbGxzIjoNCj4gPiArICAgIGNvbnN0OiAwDQo+ID4gKw0KPiA+ICsg
IHN0YXJmaXZlLHN5c2NvbjoNCj4gPiArICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2Rl
ZmluaXRpb25zL3BoYW5kbGUtYXJyYXkNCj4gPiArICAgIGl0ZW1zOg0KPiA+ICsgICAgICAtIGl0
ZW1zOg0KPiA+ICsgICAgICAgICAgLSBkZXNjcmlwdGlvbjogcGhhbmRsZSB0byBTeXN0ZW0gUmVn
aXN0ZXIgQ29udHJvbGxlciBzeXNfc3lzY29uX25lIG5vZGUuDQo+ID4gKyAgICAgICAgICAtIGRl
c2NyaXB0aW9uOiBQRE0gc291cmNlIGVuYWJsZWQgY29udHJvbCBvZmZzZXQgb2YgU1lTX1NZU0NP
Tl9ORQ0KPiByZWdpc3Rlci4NCj4gPiArICAgICAgICAgIC0gZGVzY3JpcHRpb246IFBETSBzb3Vy
Y2UgZW5hYmxlZCBjb250cm9sIG1hc2sNCj4gPiArICAgIGRlc2NyaXB0aW9uOg0KPiA+ICsgICAg
ICBUaGUgcGhhbmRsZSB0byBTeXN0ZW0gUmVnaXN0ZXIgQ29udHJvbGxlciBzeXNjb24gbm9kZSBh
bmQgdGhlIFBETQ0KPiBzb3VyY2UNCj4gPiArICAgICAgZnJvbSBJMlMgZW5hYmxlZCBjb250cm9s
IG9mZnNldCBhbmQgbWFzayBvZiBTWVNfU1lTQ09OX05FIHJlZ2lzdGVyLg0KPiANCj4gVGhpcyBk
ZXNjcmlwdGlvbiBkdXBsaWNhdGVzIGl0ZW1zLiBEcm9wIHJlZHVuZGFudCBwYXJ0cyAodGhlcmUg
aXMgcmVhbGx5IG5ldmVyIGENCj4gbmVlZCB0byBzYXkgcGhhbmRsZSBpcyBhIHBoYW5kbGUgYmVj
YXVzZSBpdCBjYW5ub3QgYmUgYW55dGhpbmcgZWxzZSkuIEluc3RlYWQgc2F5DQo+IHdoYXQgaXMg
aXQgdXNlZCBmb3IuDQoNCldpbGwgZml4Lg0KDQo+IA0KPiANCj4gPiArDQo+ID4gK3JlcXVpcmVk
Og0KPiA+ICsgIC0gY29tcGF0aWJsZQ0KPiA+ICsgIC0gcmVnDQo+ID4gKyAgLSBjbG9ja3MNCj4g
PiArICAtIGNsb2NrLW5hbWVzDQo+ID4gKyAgLSByZXNldHMNCj4gPiArICAtICcjc291bmQtZGFp
LWNlbGxzJw0KPiANCj4gVXNlIGNvbnNpc3RlbnQgcXVvdGVzLCBlaXRoZXIgJyBvciAiDQo+IA0K
DQpXaWxsIGZpeC4NCg0KQmVzdCByZWdhcmRzLA0KWGluZ3l1IFd1DQo=
