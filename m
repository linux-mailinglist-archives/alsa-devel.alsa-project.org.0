Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9461C6903E9
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Feb 2023 10:35:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC2CE868;
	Thu,  9 Feb 2023 10:34:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC2CE868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675935335;
	bh=xgcFuEOyzKm/zsUnpfWK9LelEmvwNvYH1hbXDb8ZC0k=;
	h=From:To:Subject:Date:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UEBVyjvJ1z3oygpEaX0+YYNduXcK5jIBOie6uro42+5Dl+LSSH/+jadwHXxZW+CvP
	 FDOjCiIeGYIhKk1tua2otgR8nr+HoXlB3QLmfU6EPAzQVuBgFgJ9PnC8+xnLUiWTUe
	 HdDkUZOaPYWlCWqCHnfmUE6DC0SX6dDB+uPMwImU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7D147F800B8;
	Thu,  9 Feb 2023 10:34:44 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B382BF800E4; Thu,  9 Feb 2023 10:34:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2062c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feae::62c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DC097F80094
	for <alsa-devel@alsa-project.org>; Thu,  9 Feb 2023 10:34:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DC097F80094
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RL9mtHkO+iLMNBJHhDQt7e6ZGHdFPVYdKwgcC3rn0meUJbM3ii6xCTc3UVzHYi6FKDDzb+Tg9IFdmVy04b4ItA2qcuAohx2+2NGKDrX0uvn5UZkz1l9r4TwvCaYVWOSbzyZMjLkKjjOLmJjWP+DFCDKb/Rlhx3WIBeP9xieoaRBpRVjijYo7W+8QwuYmK6hkpt6sCEpSJic3/mquHrPBiqw5AetNQy8CMlnZBLUluxNUSwN1FuTOuvSkI3Dq2JC+78fIRD2bHK/LwiOu0pPQLKYL56n4M/O0BM+jajeTmGHfHa9x6FkMPZK4v6EuX91AWOrpH8NAGHV3vrdE/FRzyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xgcFuEOyzKm/zsUnpfWK9LelEmvwNvYH1hbXDb8ZC0k=;
 b=SN3ZwhrHDpk4qDc02cdYorYY1ko2myFk+wVcoTnyRzGO1hFZklwCEpEybX2LEj10w96I/DcrdFn60UMmVmYA7IaD7gpsxv57G0/zZp6G1TUaRYC4AYG1+/ooOJoAKMwI5iAtLrnEd3z7W3xBLkT5U1oRiChJndM/0zh9BxCFcRJI18hVcx0z2dfeKT2Rht9O3CIAS1dR4ayKyU74Oo0RQBucPHBfHv/N2BsiE6SaZez+14H/bI0KZdtOQV8ECEOeKfe4DfFE2lPEBJ4uwSMxnWchWh1ezgB/r0PAK2AFz0WLd6mE1xdONMMr0UxIwYUnUdLS94ebrB0CvY/YJTEOHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=irondevice.com; dmarc=pass action=none
 header.from=irondevice.com; dkim=pass header.d=irondevice.com; arc=none
Received: from SLXP216MB0077.KORP216.PROD.OUTLOOK.COM (2603:1096:100:7::23) by
 PU4P216MB1238.KORP216.PROD.OUTLOOK.COM (2603:1096:301:aa::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6064.34; Thu, 9 Feb 2023 09:34:16 +0000
Received: from SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 ([fe80::2007:efb4:28b0:758a]) by SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 ([fe80::2007:efb4:28b0:758a%9]) with mapi id 15.20.6086.018; Thu, 9 Feb 2023
 09:34:16 +0000
From: Ki-Seok Jo <kiseok.jo@irondevice.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring
	<robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>, Liam Girdwood
	<lgirdwood@gmail.com>
Subject: Re: [PATCH v3] ASoC: SMA1303: Remove the sysclk setting in devicetree
Thread-Topic: [PATCH v3] ASoC: SMA1303: Remove the sysclk setting in
 devicetree
Thread-Index: AQHZPGNzHE3k8owPakG50LXf9xOb+67GT4GAgAAB/jCAAABrAIAABLSQgAAD9uA=
Date: Thu, 9 Feb 2023 09:34:16 +0000
Message-ID: 
 <SLXP216MB007705EA280A2C5D344F25338CD99@SLXP216MB0077.KORP216.PROD.OUTLOOK.COM>
References: <20230209084903.13000-2-kiseok.jo@irondevice.com>
 <da3e7391-ee89-3089-8501-91e9411161a7@linaro.org>
 <SLXP216MB00777BF2377ECE2366F694228CD99@SLXP216MB0077.KORP216.PROD.OUTLOOK.COM>
 <e5bcad37-c7d3-9c3c-4947-d3f2f6d9fc60@linaro.org>
 <SLXP216MB0077E5E2FC4A8CAA3B9D8A4F8CD99@SLXP216MB0077.KORP216.PROD.OUTLOOK.COM>
In-Reply-To: 
 <SLXP216MB0077E5E2FC4A8CAA3B9D8A4F8CD99@SLXP216MB0077.KORP216.PROD.OUTLOOK.COM>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=irondevice.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SLXP216MB0077:EE_|PU4P216MB1238:EE_
x-ms-office365-filtering-correlation-id: dfe0580d-97a9-4dff-71bb-08db0a80d01d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 MGY3DbnRHvrVoe8aZw6yqj7HJO2UhelC1O+1vcC+1gqD+oM7mvXelBX6B2Z0SbShNIzO5oL5pYIxvVdDp/IDQWruozA3UskrHLIzzPp/neKUZgvywCkVBBYGXPHVpq/epYF5B59mbtF1zJpktjpCgFaVZfohtfED3i8+A6B45paM3p50YA+kjFuD5T4P46gUBCUMRm6JlMolsM8/IfZPBH8g65LXh7lUFAI0XcvR49NjvxQLpTNXXVdpqdzMfm6rXNaV6+RVql3BwVLN4hW9d62NmsJqzYInnd/Wi/SnQa2WZV+LD44u0ygcj3HA4qpTkovRVa4P0QnQMR1uVN7hGao2YVTHh8qErteeGKkF8A9oXOkN3v+KolEOmmo0vgepxnK6d7T/Exl/wQ2Myu/I4Jti6rfkMkMwAb1JEPmUUjuwSUs3KeM9HxYbgPZ3n9Y05NEsun2v/vJVGEqP7cn3LXA1mcWrxnf+1EZ2VIUZ2K/bn5QwhJn56IJ5QvaCtzNFk9jpAmKradCaZqfOEDfyWws6IuUtzJZMMX/kkMRbwCDIbCVcYEniZhUj6AWLQBxDcmfvtieCqar6ynVKJVlxHw1A8dUbMXLzXvyvt3zGmpe0w7Dykt2muU8u0WuqB3fQSb+Rp9AzWmqnMW4iCBrQvKFHuPWwijLVUM4XeM79e7uP6uA4EvqWUi3B3gXc2vcFfKZIWVwoXKb6F6q2Xr06Dg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SLXP216MB0077.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(346002)(376002)(39840400004)(366004)(396003)(136003)(451199018)(478600001)(38070700005)(41300700001)(5660300002)(33656002)(8936002)(4744005)(26005)(6506007)(2940100002)(186003)(9686003)(52536014)(55016003)(53546011)(66946007)(8676002)(66556008)(76116006)(66446008)(4326008)(64756008)(66476007)(2906002)(71200400001)(122000001)(7696005)(38100700002)(316002)(54906003)(86362001)(110136005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Q2JJOHhBOGtuOWtBeU82MHVMUk94MFpiYkxEYmNHcit0Q3lLTmRaSkdIMEpw?=
 =?utf-8?B?bWdCSmhWaUF2cllQb2VpOWJzNnRJMU5TbDZIOGVIU1hURnpsdVRGazJ1MTI5?=
 =?utf-8?B?Z2dMNFJ6VHc5M1BTNXM5VzRZaWU1M0tnSnVVYkxDU0orZkZKVU5yaVpaYzBk?=
 =?utf-8?B?Vm5NV2N3QytKSzNUN0ttZ1dobFdnak9wQzJkZHNPNXo5WW0rOVZDRDNqTnVZ?=
 =?utf-8?B?TExtTFhCeU5lR0VJUit5aTZ4ZjFabThJc05qTFlGTmZXMjR6YUVFZU1VTzVy?=
 =?utf-8?B?YVpmNTRtZ28rekZ3K3hXN2M4SFFPdTFlUCsydS9ERkZadXdyclcxL1FyVllr?=
 =?utf-8?B?ZHVVL25BRGJZcTVJTlBvU1MvZHM5b21EcWVqbEUyOUgxRVNHbkNHVzlzVFE5?=
 =?utf-8?B?VExzdTRpL0JtelhtbnVJOWtVZjZpay8vcHV5MVVxQTFtd3hISXFHTk0vRVJ1?=
 =?utf-8?B?YWdrNDZLb1k4RGZwMEhiSnVoNjFJelRrUkl0TjgxczNGYlhZa0dPNGJxY3Y2?=
 =?utf-8?B?NDdjV1pvTVBkQlNCSGU3a1oxQjdVNlJMSGZWWXdCM2VCMld5U2xJUkdBNmtw?=
 =?utf-8?B?dEJVeUhoMlM5c1BFTjduZk04R0lJbGUvT1k0SVBMK1hCbU9VUnpXeEJFNzNU?=
 =?utf-8?B?L05LSnBLazgyM1pmUkkyNnpvMkQvYTgrb3kwdnU0RnJRTXhVUWI3UlJaY3pG?=
 =?utf-8?B?QmQ5aFEyeVBLS3NWczFQV1BWNjlJbVJzcHVsNmF4bWJSd2RyTHZwMkRPYS9z?=
 =?utf-8?B?amlLbXh2d29sZGtnQzJGNDVVSGZ5ZG5laVB3SEt5VmZiRnlUVDd2OWlPNnVI?=
 =?utf-8?B?blhBeVRUM1pzd1pNOXBjVklXT1cxY0JEM0txOTQ2WlBnMEdWRUdtaWszQzZK?=
 =?utf-8?B?QTdiYkpJZkd0dUZqZGJlYUs1a09uajFwYStOdTZOV2ZIeVVUbVVJZmlrSmND?=
 =?utf-8?B?UUZ4Smw5c3laai8yQTQzQlR1NDVEbEV5OXZrc2hyNlpPdWF4UVpDV3NhUUJm?=
 =?utf-8?B?N3lHZ3JqemUvUGROUFVjNUtMR0dETmM4blVuSlcwTjNVRVVyM2sweGoyUUk0?=
 =?utf-8?B?RFNTVEhOc0VoYjQvbjNxSTdyVDNCYlpnTDlZcENMbzlVcFlha2VoZkdsMFMz?=
 =?utf-8?B?M2JDOW1rNU9RUmkwdlZlVnBNQjBnNENBVlB0MW05R1ZVTlJDWFZVM3JMRVZV?=
 =?utf-8?B?eTEwQXB0NUhpcjkzVkc1dDRMV29TbndQL1VXRHFyMDlLQlFaRUh0NTQybWts?=
 =?utf-8?B?dE1xTkU1SjFVYnZ6aUhMTW15Vm9SOERnU0E3UTZ1RjVlQWQ5OC8wQkRGdDNK?=
 =?utf-8?B?MnZtWk5OOGlVaHk2R1BEN2VrNXprdkhWL3dKdU0zUVJadHp6dkdWSTJ3VWZm?=
 =?utf-8?B?YkZzOCtVeDNjOGRYWGVONHBpUVRWOXRoTkpiMlZ4b2xlZWhUS2RYRGdtOGFR?=
 =?utf-8?B?L0tVaVViQ1NXS2pwSWFFanIvK1U4RjkwOUhWUUlCeUpaZ1pkaElOVjJ4Q0lw?=
 =?utf-8?B?R3VYZlRJR1k4VXl5MkZ3YmNMbzNoZFc2R2xRZEMxb1I1SUMvL05iQ1FjbTdH?=
 =?utf-8?B?WElaUGwrRFFwNi9LTjNBNEhtOFhJU1l3ZVY3dUMyN2YvaXAxTGhhZVlMY3pP?=
 =?utf-8?B?YWF0K3liaC9aSER5RnZMb1RvanVUZlYreW52Sk5tUzc5anZ2YXlHclA1K2xX?=
 =?utf-8?B?czBtSHdZb2ZXN3piZFJGUmdwU1EyWE4xTEVTRzdYNFF0Y2puSXVPTHplSlBl?=
 =?utf-8?B?Wm5zb05oQkwvRVdRUGVCaEpabCsyTVgyUldmV3BPTUx5UDVNMEZUSDhEL29U?=
 =?utf-8?B?WGdYMk4zUmV5MnZ2NmplbkVOVjlhakhRbjdrZW1GT2FIVWVKek5MM0NpNW1Q?=
 =?utf-8?B?dEtDTjZZdE0vLy8xclVlcENwelhzcnhuL0l0WWltRDFOeXFGWXp4UWNIcWxt?=
 =?utf-8?B?SndNNW9Jb3VuMWYwZ2VSQ20xcmtDNVRXUk81bUZxaXVSNndJOVZJeU93MVZ2?=
 =?utf-8?B?ckdrNFBManZ3cnoySXRJbzZRKzdOM2p0OVRFS0h0cks4UC9PRiszcHVOMEo3?=
 =?utf-8?B?Nzd2QlN6RG5Mb25ZaFNTWjNMM2dWY1l0aXpvNGJvNWpIWFBmMFVUZFQwL2Fm?=
 =?utf-8?Q?p5MX+T79OKEo5+45sxaOYoBFR?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: irondevice.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 dfe0580d-97a9-4dff-71bb-08db0a80d01d
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Feb 2023 09:34:16.6426
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b4849faa-3337-494e-a76a-cb25a3b3d7d1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 aYEfzf1fritiyVKvoy8mGh6DIoWBtKH+5sxoGNZz8lg3qH2QaaML884wkaJ28EXwxGqCsyBkuVS2uB9/I18G1ojQAipcW5zrbfOjAbrUrYo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU4P216MB1238
Message-ID-Hash: KL67TNSZJYJSBFC2Q7LM4FCHUGJA6YNI
X-Message-ID-Hash: KL67TNSZJYJSBFC2Q7LM4FCHUGJA6YNI
X-MailFrom: kiseok.jo@irondevice.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IRRKHMBBIK2E6QGQEX3VO2YWZHY3QNIS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

PiANCj4gPiBPbiAwOS8wMi8yMDIzIDEwOjAxLCBLaS1TZW9rIEpvIHdyb3RlOg0KPiA+ID4NCj4g
PiA+Pj4gSW4gU01BMTMwMywgdGhpcyBkZXZpY2UgZG9lcyBub3Qgc3VwcG9ydCBNQ0xLLg0KPiA+
ID4+PiBTbyBpdCBuZWVkIHRvIHJlbW92ZSBzeXNjbGsgc2V0dGluZyBpbiBkZXZpY2V0cmVlLg0K
PiA+ID4+PiB2MjogTW9kaWZ5IHRoZSBzeXNjbGsgc2V0dGluZyAtIHVzaW5nIGRldm1fY2xrX2dl
dCBmb3IgbWNsay4NCj4gPiA+Pj4NCj4gPiA+Pj4gU2lnbmVkLW9mZi1ieTogS2lzZW9rIEpvIDxr
aXNlb2suam9AaXJvbmRldmljZS5jb20+DQo+ID4gPj4+IFJldmlld2VkLWJ5OiBLcnp5c3p0b2Yg
S296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+DQo+ID4gPj4NCj4gPiA+
PiBXaGVyZT8gV2hlcmUgZGlkIHlvdSBnZXQgdGhpcyB0YWc/DQo+ID4gPj4NCj4gPiA+PiBCZXN0
IHJlZ2FyZHMsDQo+ID4gPj4gS3J6eXN6dG9mDQo+ID4gPg0KPiA+ID4gSSdtIHNvcnJ5LCBJIGRv
buKAmXQnIGtub3cgd2hhdCB5b3UncmUgdGFsa2luZyBhYm91dC4NCj4gPiA+IFdoYXQgdGFnIGFy
ZSB5b3UgdGFsa2luZyBhYm91dD8NCj4gPiA+IFNvcnJ5LCBjb3VsZCB5b3UgcGxlYXNlIGVsYWJv
cmF0ZT8NCj4gPg0KPiA+IEZyb20gd2hlcmUgdGhlIHRhZyAiUmV2aWV3ZWQtYnk6IEtyenlzenRv
Zi4uLiIgYXBwZWFyPw0KPiA+DQo+ID4gQmVzdCByZWdhcmRzLA0KPiA+IEtyenlzenRvZg0KPiAN
Cj4gSSdtIHNvcnJ5IEkgbWlzdW5kZXJzdG9vZCB0aGUgd29yZC4gOigNCj4gT3JpZ2luYWxseSwg
SSB3YXMgZ29pbmcgdG8gdXNlIHJlcG9ydGVkLWJ5Lg0KPiBJIHNob3VkIGhhdmUgcmV2aWV3ZWQg
aXQgb25lIG1vcmUgdGltZSwgSSdtIHJlYWxseSBzb3JyeS4NCj4gDQo+IFRoYW5rIHlvdSBmb3Ig
dGVsbGluZyBtZS4NCj4gDQo+IEJlc3QgcmVnYXJkcywNCj4gS2lzZW9rIEpvDQoNCkknbSBzb3Jy
eS4gSXQncyBteSBtaXN0YWtlLi4NCg0KQ2FuIEkganVzdCBjaGFuZ2UgdGhlIHRhZyBhbmQgc2Vu
ZCBpdCBiYWNrIGFnYWluIHRvIHY0Pw0KUmV2aWV3ZC1ieSAtPiBSZXBvcnRlZC1ieQ0KDQpCZXN0
IFJlZ2FyZHMsDQpLaXNlb2sgSm8NCg==
