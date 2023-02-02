Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F7F687997
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Feb 2023 10:57:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5EA0C11C;
	Thu,  2 Feb 2023 10:56:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5EA0C11C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675331833;
	bh=GT2aXiYJgEtS1ICzCGe9FgyMrR/zdulL2+MANfNkR1E=;
	h=From:To:Subject:Date:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=cEKtGhZ5mqgMXb1brhyOYRdcG6RVj8vtzSW6URXIs4ShKDLTy7CjKwRkCeVKKeGvY
	 p6EYMenDAncqQwE3tfcRWU5zxI7ZYq2M2kRYyjyc5H6ryXgyfmn7xK/SjA4FjDKMet
	 gFMSm2ceP42vTC5msTuOYfOLz9ASSyPZprFMdXho=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F9E8F804DF;
	Thu,  2 Feb 2023 10:56:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BA2B1F804C2; Thu,  2 Feb 2023 10:56:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
 SPF_HELO_PASS,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on20617.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feab::617])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B488DF800E3
 for <alsa-devel@alsa-project.org>; Thu,  2 Feb 2023 10:55:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B488DF800E3
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KtapLIUTNpk5bmoiMRQe8Bk1i9xfdieg6YBJzSM1wL48AVg4iRwygd/pvv+B9hUC8OTFOMygSPENDoJYCDbqind8lVS2Wfugw+70tmS2fmEN7BHuK04clOJX/queDA4mAdKKU9AKlEF2Nx2k+gK0dlnfxSJXdZ9o339okGU+ErKRbZn40ky73AnBE+gDmQmqD7+gC/slCvxEZE7c48mgyxMEVEVRM84gVOMsY2mME5r5HSqS1l6dk+3tr1Yp+EI+ucycxzoh86dF46/mgVY+gJH/W/bjsuo+fNjZveDmb2d1fZvP69hFUSD14E528LHJIEumE4+v3xG12/bzAkSxVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GT2aXiYJgEtS1ICzCGe9FgyMrR/zdulL2+MANfNkR1E=;
 b=XvmqE6YJdqwkuAHTGnWC/t2Jxi6QdoGPmEx5nVNb/jhSikY7sPUh3178Pzxs2yOce/zD3Da56jC1zTj8S+Iy9RbwzMyrS1Vqd8obxFesgaxnovWGUdV/81wuULko/KbHVnUG4JxuYDrJYKKtiJgbJGgsBXk+WEh5DJ3o0MegwStvBIr2xbcup0pyxKQTEtf2vo8OK+lM5nWIxjxPuqPCZ2MdsywaPCnALvVbg2PnPYMYiTYaFqbNcB0+vS25U8RwK8Rv/2cHYQEFvHz+2hE/Sc42FcQXHHX7QVfqdXIRl7Uv5FBLJDZjABF1hs3sb//hVB6o3JR70rwkDv4scIJ4+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=irondevice.com; dmarc=pass action=none
 header.from=irondevice.com; dkim=pass header.d=irondevice.com; arc=none
Received: from SLXP216MB0077.KORP216.PROD.OUTLOOK.COM (2603:1096:100:7::23) by
 SLXP216MB0063.KORP216.PROD.OUTLOOK.COM (2603:1096:100:10::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6064.23; Thu, 2 Feb 2023 09:55:47 +0000
Received: from SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 ([fe80::3d9:7f82:fa73:e727]) by SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 ([fe80::3d9:7f82:fa73:e727%7]) with mapi id 15.20.6064.022; Thu, 2 Feb 2023
 09:55:47 +0000
From: Ki-Seok Jo <kiseok.jo@irondevice.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [PATCH] Fixed the schema binding according to test
Thread-Topic: [PATCH] Fixed the schema binding according to test
Thread-Index: AQHZNuYvdGkbgSjfQEmX9bKJTMPyKK67YAkAgAALN7A=
Date: Thu, 2 Feb 2023 09:55:47 +0000
Message-ID: <SLXP216MB0077A1B1F744D74A5B338F0C8CD69@SLXP216MB0077.KORP216.PROD.OUTLOOK.COM>
References: <20230202090715.18384-1-kiseok.jo@irondevice.com>
 <ac140660-0df0-8b43-3585-17511a280830@linaro.org>
In-Reply-To: <ac140660-0df0-8b43-3585-17511a280830@linaro.org>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=irondevice.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SLXP216MB0077:EE_|SLXP216MB0063:EE_
x-ms-office365-filtering-correlation-id: 0d58a704-c28c-41a6-3f34-08db0503a8ae
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Akt9JOfB+a2sdBblYsPkr6V1bHhc2x6FZEHA+ah1dgBvXc6CFjfZfzpZLokHlQy/2BjXsfu0p0GK9/Bm2IlIkE/8wQgvoaYdpL5tgrAGFI3yPZaXpchUP1/6SiKDWPML3IHCOeyZiUYF7Uv7+OAiDFE60kgIjVmniT6ThAG5zQ33NZqBDsd6cQeH16FIcs3koaB63Lf2uzPlUZhDSyx8xc1szYcX8Ttq/Yni5cHUfSa3iTFQ4qDJLfs9f6z+aXhh8Nycxn4o4pAwKHxEX1wMOpit5LuNkmJTGZm2rR62XbqrzaZBU4eTUofYW3DzJRgUMtG2atxRvsnnaj1IblmVwQZ2tTq4ie9GXCk48L++Z7Vm4z07dmZX35pxWtcOmabAHts2m8UBX6DbsHeuPv2iZg9Dnawjk1l7XqKiU7GaAJDhZ59DwrqHhjveV3H4hK+mDLkH2lkRNAtNt+vdhAbJysIfa9UxA4Oc/Y6/8XfizSKLuPWukBktqANEYGFBaey3CgjJn++rdwHGTqCI0MUKTnRv9UOyOjI+hH0FcFcytCeGkKIVKNreW5rj1SPjFgAORuv5dAssB9xk4sLulyKEBzv3rDR6pN37J1ZR9PYbCuIghjQaoL0eJAbA1FCB1TZvWTmfgsUGEGDotBYeFoME/tZASPCCw4MIkFP2mBPPh5EnGU56I3QKas0n3PReh71TWISU7KYtPYNEsF4BULc2qg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SLXP216MB0077.KORP216.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(136003)(346002)(396003)(366004)(39840400004)(376002)(451199018)(71200400001)(54906003)(110136005)(83380400001)(2906002)(7696005)(33656002)(122000001)(316002)(26005)(38100700002)(66556008)(66476007)(76116006)(53546011)(66946007)(186003)(9686003)(478600001)(66446008)(6506007)(52536014)(8676002)(86362001)(41300700001)(55016003)(8936002)(64756008)(38070700005)(5660300002)(4326008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZXZXK245a3NvKy9CQ3pFQVIvejlwd3luZDh6cEQxWTg4aXNncnJrZ0p5R0FW?=
 =?utf-8?B?RUVNak1RS3pzVHRmSVA2bm1QNjg0d0sxODU3U0d4bjE3MVUwOGVCYkovZHdu?=
 =?utf-8?B?OHY5TVM3MGZ6MUw1azlIOWZUak9qQW1LSmNGdHVxL240R3I3Mm92T3FHQ3VK?=
 =?utf-8?B?dWlzM0w1ZU1wNGMrYW1NWFBBVkNyeVJ4a1dYR2FWYnV2MlNDSFQ3dkQ4R0Fw?=
 =?utf-8?B?c29YN2U3MnRqYTM2MjlYUGNYOFc4OUhpanNjTDVkV1NZOE0zWTR2cmVHVG5I?=
 =?utf-8?B?alM2TmJKTVpTajY0UFBRczRGR1U1bERTb0lKeWhSMlJ4SzVBYUlrRGdjNDBX?=
 =?utf-8?B?Y0QvV2RKWXBrTmd5TUpGRVVwVHliNStsNXVORU11NllzMWRkYW1UQnpnRkdE?=
 =?utf-8?B?Q1F4NVNocE5JcitISnhpc05YSE1PZXBJU2FjZlNMQVNFUVFKQ3dXVUtGNGJn?=
 =?utf-8?B?NkJtUmNTUUdPWDMxU0twYWlwVnNoL0xtNDV5OHYzajlRajhBT2pob0NqeVhI?=
 =?utf-8?B?K1FKYXd5TE5OZHFPdWJzd0Z4QmxVaGRwcHJ6ekNoQ091NGVUVHNpQ3duNHo3?=
 =?utf-8?B?K3V2a05yeW9QNFMvcnlVY1BqVkpUekw3WXFTR2N3bnBlTi9BWXBjeGRlUFR0?=
 =?utf-8?B?djR3dXdTNmpMV3grTXBDeUxWSGFtVC9SQ2piWHQvMTB2WEcvbkkyaXhVdmx0?=
 =?utf-8?B?S1J1MnJ4amxXakQ0dDI2OTNQZnZXN05paFFMd0pMQWZVa25tOTB2L2dkd2JQ?=
 =?utf-8?B?a2QxQXJrajhyQ05QYkl6cWhBdjcxSTVLclQ0QUJqWE1XeHhYMzlRbFNaV2dW?=
 =?utf-8?B?YmNwMmpiUW5IbEp6OVorYU0wVjVKS1FBZlVaQWl5azNoKzVDVjV1MHpnMW9u?=
 =?utf-8?B?Q3I4eTRBcTY0WCtrNWFZL3FIMnFsK3VpU2xoN25SRlVpQjJCZXhDdDNtL1RC?=
 =?utf-8?B?RVIrUVY5T1BkdzhMdkpnMWJ1V1NyRkVmTCtzQXVINVJOMHgxRGhzU1g1Z2s3?=
 =?utf-8?B?QjlLZlEydEp5ZXRWU1A0VjNrSnRLMWc1YU1uQUV2dDdObCtFWXMzeVNuK2ox?=
 =?utf-8?B?RGVJRFRlNDZOSTc5cVpLMGRvSjE3OUQ5UUNPbGJtbGIxelh1YklEdW52d2VL?=
 =?utf-8?B?cHg4NlZrbXIyTUx3WFRibERTdzdYRkpTQUEwTjhNc21zUVFXQWhwdUM2Wmdi?=
 =?utf-8?B?dFBJNEN4MXNvbnpmU1NZQndvbkVjbGRiMkpHdTRoUWQ4L2dCY2ZNc3hmRUUy?=
 =?utf-8?B?aTRvUFVzRHhYd0RzenhURDErTW5scUI4dFFPcDkyV25HSHpaeU5rcDhYMjE5?=
 =?utf-8?B?ZFZQTlo4c1lHYlZlY1RtbXduVHdJRGVBam1KMFFXV3Q1ajVkL3JCRGtZbEdC?=
 =?utf-8?B?V1ZBSlUzMmg2NVlyZ0twQ3hLSnRFOHFVSy84WU9GRDRKK3NkTTg1REVDWUk1?=
 =?utf-8?B?YVByYW1kNXRtZjMwR1hnVVJBNG44Y2IxOTkvR1pNYUZPWWlSdFhpaExGajNL?=
 =?utf-8?B?N1RZdEhOU0VIZHNvSUFreGgwSzJoamFJMkFiNGNSbTBLVTZaYUh5L3hWRkRL?=
 =?utf-8?B?V2IrS3IxTVk5UHZCazB4SVV6d3NiK2VnemJmOE9hUHVaQW5FaTNCKzBoOFo0?=
 =?utf-8?B?VmxFYzV1WTludDd0ZFJNMkZ4Z3hXZEY2N0R6U0U0ZC9rdmkzT1c1bTdTWkhh?=
 =?utf-8?B?ZWFOZmlaQlkwUHZUKzhudEZkZ0wvaGhSa0NHZEZIU3V1NzRpV2tCekFNY0w1?=
 =?utf-8?B?SjU3N1FwT3BuWGpVQ2hSbjMzVXltQmI0UWV6cFJKNU1kL25iZDB3bHVGbmxu?=
 =?utf-8?B?RHNSK2UxZHJMRDlWdFNkVXJNbGtOWXVMeU01ZmU5QkZwYkNwM2tqekx2WDAz?=
 =?utf-8?B?RjVJZjRhQXpFM0pydU1CNTgxeWdlc2NCTjd3WnlJd3U0S1VqWlFSYmhNT0Qw?=
 =?utf-8?B?ZGZVanRFYVIvdjJLQjdVTm96YTJYMnhxQU9Qd283SDVVMkptb0xHb2tvYlB4?=
 =?utf-8?B?TllMRmVVRmM5Kzc3OU9EcFZoT2xwbERiS0cvTndlVWVCS1psRXJoY0o0RGll?=
 =?utf-8?B?UzczOHdrQ2lpaUdDbDkwelR4MDZGTkxkRGJzY1hTTjU3Q21tUVgvUCtpR3FZ?=
 =?utf-8?Q?bZORWXPXIaRd6oLhmLamJ+ilV?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: irondevice.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d58a704-c28c-41a6-3f34-08db0503a8ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2023 09:55:47.5933 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b4849faa-3337-494e-a76a-cb25a3b3d7d1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9uJV5ujW0QBCFQ6PTeG3UZRG3q51ksuhByulGCN5pmuR5UOKT6lfCueDG+V3spxnQRqQ/ln77DfxmC69caUjZaF7hfR9uXWxXN6LNhph6vU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SLXP216MB0063
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

PiBUaGFuayB5b3UgZm9yIHlvdXIgcGF0Y2guIFRoZXJlIGlzIHNvbWV0aGluZyB0byBkaXNjdXNz
L2ltcHJvdmUuDQo+IA0KPiBPbiAwMi8wMi8yMDIzIDEwOjA3LCBLaXNlb2sgSm8gd3JvdGU6DQo+
ID4gTW9kaWZpZWQgYWNjb3JkaW5nIHRvIHRoZSB3cml0aW5nLXNjaGVtYS5yc3QgZmlsZSBhbmQg
dGVzdGVkLg0KPiANCj4gVXNlIGltcGVyYXRpdmUsIG5vdCBwYXN0IHRlbnNlIChGaXhlZC0+Rml4
LCBNb2RpZmllZC0+TW9kaWZ5KS4NCg0KT2theS4gSSBnb3QgaXQuIEknbGwgZG8gdGhhdCB3aGVu
IEkgcmV3cml0ZSBpdC4gVGhhbmtzLg0KDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBLaXNlb2sg
Sm8gPGtpc2Vvay5qb0Bpcm9uZGV2aWNlLmNvbT4NCj4gDQo+IFVzZSBzdWJqZWN0IHByZWZpeGVz
IG1hdGNoaW5nIHRoZSBzdWJzeXN0ZW0gKHdoaWNoIHlvdSBjYW4gZ2V0IGZvciBleGFtcGxlDQo+
IHdpdGggYGdpdCBsb2cgLS1vbmVsaW5lIC0tIERJUkVDVE9SWV9PUl9GSUxFYCBvbiB0aGUgZGly
ZWN0b3J5IHlvdXIgcGF0Y2gNCj4gaXMgdG91Y2hpbmcpLiBUaGVyZWZvcmUgaXQgc2hvdWxkIGJl
Og0KPiAiQVNvQzogZHQtYmluZGluZ3M6IGlyb25kZXZpY2Usc21hMTMwMzogUmV3b3JrIGJpbmRp
bmcgYW5kIGFkZCBtaXNzaW5nDQo+IHByb3BlcnRpZXMiDQo+IA0KDQpPaCwgdGhhbmsgeW91IGZv
ciBnb29kIGluZm9ybWF0aW9uLiBJIGZlZWwgbGlrZSBJIHN0aWxsIGxhY2sgYSBsb3QuDQpJJ2xs
IGFwcGx5IGl0LiBUaGFua3MhDQoNCj4gDQo+ID4gLS0tDQo+ID4gIC4uLi9iaW5kaW5ncy9zb3Vu
ZC9pcm9uZGV2aWNlLHNtYTEzMDMueWFtbCAgICB8IDQ2ICsrKysrKysrKysrKysrKysrLS0NCj4g
PiAgMSBmaWxlIGNoYW5nZWQsIDQzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+ID4N
Cj4gPiBkaWZmIC0tZ2l0DQo+ID4gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
c291bmQvaXJvbmRldmljZSxzbWExMzAzLnlhbWwNCj4gPiBiL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9zb3VuZC9pcm9uZGV2aWNlLHNtYTEzMDMueWFtbA0KPiA+IGluZGV4IDE2
MmM1MjYwNjYzNS4uMzVkOWEwNDZlZjc1IDEwMDY0NA0KPiA+IC0tLSBhL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9zb3VuZC9pcm9uZGV2aWNlLHNtYTEzMDMueWFtbA0KPiA+ICsr
KyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb3VuZC9pcm9uZGV2aWNlLHNt
YTEzMDMueWFtbA0KPiA+IEBAIC0xMCwyMiArMTAsNjIgQEAgbWFpbnRhaW5lcnM6DQo+ID4gICAg
LSBLaXNlb2sgSm8gPGtpc2Vvay5qb0Bpcm9uZGV2aWNlLmNvbT4NCj4gPg0KPiA+ICBkZXNjcmlw
dGlvbjoNCj4gPiAtICBTTUExMzAzIGRpZ2l0YWwgY2xhc3MtRCBhdWRpbyBhbXBsaWZpZXIgd2l0
aCBhbiBpbnRlZ3JhdGVkIGJvb3N0DQo+IGNvbnZlcnRlci4NCj4gPiArICBTTUExMzAzIGRpZ2l0
YWwgY2xhc3MtRCBhdWRpbyBhbXBsaWZpZXIgIHdpdGggYW4gaW50ZWdyYXRlZCBib29zdA0KPiA+
ICsgY29udmVydGVyLg0KPiA+DQo+ID4gIGFsbE9mOg0KPiA+IC0gIC0gJHJlZjogbmFtZS1wcmVm
aXgueWFtbCMNCj4gPiArICAtICRyZWY6IGRhaS1jb21tb24ueWFtbCMNCj4gPiArDQo+ID4gK3By
b3BlcnRpZXM6DQo+ID4gKyAgY29tcGF0aWJsZToNCj4gPiArICAgIGVudW06DQo+ID4gKyAgICAg
IC0gaXJvbmRldmljZSxzbWExMzAzDQo+ID4gKw0KPiA+ICsgIHJlZzoNCj4gPiArICAgIG1heEl0
ZW1zOiAxDQo+ID4gKw0KPiA+ICsgICcjc291bmQtZGFpLWNlbGxzJzoNCj4gPiArICAgIGNvbnN0
OiAxDQo+ID4gKw0KPiA+ICsgIGkyYy1yZXRyeToNCj4gPiArICAgIGRlc2NyaXB0aW9uOiBudW1i
ZXIgb2YgcmV0cmllcyBmb3IgSTJDIHJlZ21hcC4NCj4gDQo+IFdoeSBkbyB5b3UgbmVlZCB0aGlz
PyBXaHkgdGhpcyBmaXRzIHRoZSBwdXJwb3NlIG9mIERUIChvciBJT1cgd2h5IHRoaXMNCj4gZGlm
ZmVycyBiZXR3ZWVuIGJvYXJkcyk/DQoNCldoZW4gd29ya2luZyB3aXRoIGRyaXZlcnMgb24gbXVs
aXRpcGxlIHBsYXRmb3JtcywgdGhlcmUgd2VyZSBjYXNlcyB3aGVyZQ0KSTJDIGRpZCBub3Qgd29y
ayBwcm9wZXJseSBkcGVuZGluZyBvbiB0aGUgQVAgb3Igc2V0dGluZy4NClNvIEkgbWFkZSBpdCBw
b3NzaWJsZSB0byBzZXQgYSBmZXcgcmV0cnkgc2V0dGluZ3MsIGFuZCB0aGVuIGNoZWNrIG9yIGRv
DQpvdGhlciBhY3Rpb25zLiBSZXRyeSBpcyBwZXJmb3JtZWQgb25seSB3aGVuIEkyQyBmYWlscy4N
Cg0KQW5kIGVhY2ggZGV2aWNlIG1heSBoYXZlIGEgZGlmZmVyZW50IHB1bGwtdXAgcmVzaXNvciBv
ciBzdHJlbmd0aCwNCnNvIHRoZXJlIG1heSBiZSBkaWZmZXJlbmNlcyBiZXR3ZWVuIGJvYXJkcy4N
Cg0KQ291bGQgdGhhdCBwcm9wZXJ0eSBiZSBhIHByb2JsZW0/DQoNCj4gPiArICAgIG1heGltdW06
IDQ5DQo+ID4gKyAgICBkZWZhdWx0OiAzDQo+ID4gKw0KPiA+ICsgIHRkbS1zbG90LXJ4Og0KPiA+
ICsgICAgZGVzY3JpcHRpb246IHNldCB0aGUgdGRtIHJ4IHN0YXJ0IHNsb3QuDQo+IA0KPiBBcmVu
J3QgeW91IG5vdyByZS13cml0aW5nIGRhaS10ZG0tc2xvdC1yeC1tYXNrIHByb3BlcnR5PyBTYW1l
IGZvciB0eCBiZWxvdy4NCj4gDQoNCkl0IGNhbiBiZSB0aGUgc2FtZSBhcyBhdWRpbyBEQUkncyB0
ZG0gc2xvdCwgSSB0aGluayBidXQgdGhlcmUgYXJlIGNhc2VzDQp3aGVyZSBpdCBpcyBzZXQgZGlm
ZmVyZW50bHksIHNvIEkgb21pdHRlZCBpdCBzZXBhcmF0ZWx5Lg0KDQo+ID4gKyAgICBtYXhpbXVt
OiA3DQo+ID4gKyAgICBkZWZhdWx0OiAwDQo+ID4gKw0KPiA+ICsgIHRkbS1zbG90LXR4Og0KPiA+
ICsgICAgZGVzY3JpcHRpb246IHNldCB0aGUgdGRtIHR4IHN0YXJ0IHNsb3QuDQo+ID4gKyAgICBt
YXhpbXVtOiA3DQo+ID4gKyAgICBkZWZhdWx0OiAwDQo+ID4gKw0KPiA+ICsgIHN5cy1jbGstaWQ6
DQo+ID4gKyAgICBkZXNjcmlwdGlvbjogc2VsZWN0IHRoZSB1c2luZyBzeXN0ZW0gY2xvY2suDQo+
IA0KPiBXaGF0IGRvZXMgaXQgbWVhbj8gV2h5IGRvIHlvdSBuZWVkIHN1Y2ggcHJvcGVydHkgaW5z
dGVhZCBvZiBjbG9ja3M/DQoNClRoaXMgY2FuIHJlY2VpdmUgYW4gZXh0ZXJuYWwgY2xvY2ssIGJ1
dCBpdCBjYW4gdXNlIGludGVybmFsIGNsb2NrLg0KU2hvdWxkIEkgd3JpdGUgYWxsIHRoZSBjbG9j
ayBkZXNjcmlwdGlvbnMgaW4gY2FzZT8NCg0KPiA+ICsgICAgZGVmYXVsdDogMw0KPiA+DQo+ID4g
IHJlcXVpcmVkOg0KPiA+ICAgIC0gY29tcGF0aWJsZQ0KPiA+ICAgIC0gcmVnDQo+ID4gKyAgLSAn
I3NvdW5kLWRhaS1jZWxscycNCj4gPg0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiBLcnp5c3p0b2YN
Cg0KVGhhbmsgeW91IGZvciBxdWljayByZXNwb25zZSENCkknbGwgdGFrZSBhIGxvb2sgdG8gc2Vl
IGlmIHRoZXJlIGFyZSBhbnkgb3RoZXIgaXNzdWVzLg0KDQpUaGFua3MuDQoNCkJlc3QgcmVnYXJk
cywNCktpc2VvayBKbw0KDQo=
