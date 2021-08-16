Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E553EDC08
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Aug 2021 19:07:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7FB0316B2;
	Mon, 16 Aug 2021 19:06:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7FB0316B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629133667;
	bh=RqtLLxjhArx5SjpA3TPXxx9wDrXchUk1IyEKImrVjaA=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YbpbO87qhGAz4m+a6IQ+XHkW6yUMW7nqcFeskA654RnyDylO9r5+kZo0FE3bPYGYS
	 rwuep2lYUqpE7MlIZqR6T6Euy3AcCERqG3kRA0kk7Uac7y5B/DhrmbszEOp/IFccGy
	 Rou0VQH+pHIQcksay7IOEKxo4TGjfY8vY5sE2zrs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E1989F804E5;
	Mon, 16 Aug 2021 19:05:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3A35BF804E4; Mon, 16 Aug 2021 19:05:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from JPN01-OS2-obe.outbound.protection.outlook.com
 (mail-eopbgr1410107.outbound.protection.outlook.com [40.107.141.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DD5CBF804DA
 for <alsa-devel@alsa-project.org>; Mon, 16 Aug 2021 19:05:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DD5CBF804DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com
 header.i=@renesasgroup.onmicrosoft.com header.b="KzxeVqNZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DumwnzrK3i12Un/8uWOTKLMNLUBs5ZX8RpiJRZHtH9hGjH3H2Ii0lTCbxXG0CdJBEOZN2Twyfie97yDz3DqgktGuR1HaxCES8Gy5/HDlqaZcxXVyYAJXhe+KfISot2dshXQystGgkBuNdcSt5n5FZ/1YLqIHuqh38VyRtredlSF7PQRCo09ibmrU/mZP8MQgJLEHA1VtvHIL6cp8ntc7ZJed9rt4IHDkK5t4eosbGmJYa6eh477N4cu/hMezubNVmev1Yac5NS05w2ao0/W7Z907G71EL1Q1bYHoYQjtsQG7iuYN0s1xg8R6kPR4TkKi4HVmTk9Y9C+yLpz3/vRn6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RqtLLxjhArx5SjpA3TPXxx9wDrXchUk1IyEKImrVjaA=;
 b=QYFtkgFFl2M9hRqu+dX/1hN+aXh/wMM9yepy2mnpbhW9Xegk0K7VdhH4Tx6jCS3OilKvS+89yo2Fb5O4/Eb21BtdGHhEXQPPw0cpcwqip2PtPO6MOK830wv6nucmk02VRTh4yBHAT5HyxAaw3AlWdKYbS7Zrp6IC5IqM9XjRWfSocgOI3+Hz8XQLSLtoidLENd6Wr77aVFqcEbWhKOowoQ2nxfT60Q4p65bDRyiHaVbaBlyMLmNszo/i3X47TlTp9XPKX/+EPbcu6Z3GAhHJ7qAhd8oTG2tCIhopN6tXbvEnNGtBVO7oGwArE+SWmdPgdQWYenvwu9vyZ5atBmeQkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RqtLLxjhArx5SjpA3TPXxx9wDrXchUk1IyEKImrVjaA=;
 b=KzxeVqNZD3uD6SPjmj48/6f2VfBA5E6iZP1WNmg7xIGsOPRLnZhSTrmew0A3JTQaY/YUXbn1ZeyYLws+2kxRwLD5FEJAut7gPyrD18kCMEo3IFzHXbq3XRPvaSiCFL6AyQ7lYNS4vlqwEYMMFAoEIr0J2jQUUvLca3Z6hXFEEio=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSBPR01MB3861.jpnprd01.prod.outlook.com (2603:1096:604:44::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.20; Mon, 16 Aug
 2021 17:05:16 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c6f:e31f:eaa9:60fe]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c6f:e31f:eaa9:60fe%9]) with mapi id 15.20.4415.023; Mon, 16 Aug 2021
 17:05:16 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Colin Ian King <colin.king@canonical.com>
Subject: RE: ASoC: sh: Add RZ/G2L SSIF-2 driver
Thread-Topic: ASoC: sh: Add RZ/G2L SSIF-2 driver
Thread-Index: AQHXkr3MqeFqMJPSFUuuuVFkPSKspqt2W1hQ
Date: Mon, 16 Aug 2021 17:05:16 +0000
Message-ID: <OS0PR01MB59221D8DA43C12E5838EBC7386FD9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <962029d0-d001-f85c-1676-262372faeb34@canonical.com>
In-Reply-To: <962029d0-d001-f85c-1676-262372faeb34@canonical.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: canonical.com; dkim=none (message not signed)
 header.d=none;canonical.com; dmarc=none action=none
 header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d7e85e08-1995-4be3-68b4-08d960d80547
x-ms-traffictypediagnostic: OSBPR01MB3861:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSBPR01MB38610F7BBA1C8DFE31EBCFB586FD9@OSBPR01MB3861.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2887;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jrCQW6bK4gTAGTUEE6eze83QwrUVg5bwJUDwT2Kty+WIrq7boA6yabWWWTHKK6QQ8UaqSrGgTQ2HSAG0DrZOWWg1GwuZYmCdE2abtdFQbC8ae71UAurk4MqK4Z/rCyJFY/50yR8VDSGAgzeFHdGtAt3ugoWTvatLH6Awd7Jv13gjUxaf4IpBC50HAWWn430OsfcKdwaMmfBDRixtuAwE+uU9e0yfb/xiYWivY9snwBTsTHs/lkGMb5wb0iRBJ4S/cDDhScjR9ceXRSSgoyTLesYtiEB7Kf99VAJpziRNutkgiQ81H+EuPCRSfP5W8G8yEyZ0fmMYofzenYgcaQ87LZIygqXXqdsdtgjFd5zd0HDen/qsQFFSrBxcJ+11BLRXzQhJg6CmG5ynO7V3ad8Yxv0kPJKRZnU+RV+teWNIzBx7oGQofcOSOzaJaYA8moTEXxwmSXZzSRQn0hpz/uSIT0XDDq87wEf2FkVksbTHoGAGTgm8sWadQ/uf7mbt2Voum1XzaYzLtRMwdIceHyhEAhRk26IGKBwoTnEQrsWKFGVP8LRCZLc2otaf+BH+egdDt+y5Lgw6pM34EzODW4Y0dzQMft3lOXriYxiMKb8pkniZySs0wOzqj9eQvNT9ExOIpfoDluSQBz+wmn/XZlRrshn6BmenNWRYmdZTzoFWBLBkeR5GKBPa7TXf6ernvYBRhZ2GWsYfsRhH6BuvHO+TYg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS0PR01MB5922.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39850400004)(366004)(136003)(396003)(376002)(76116006)(38100700002)(66946007)(55016002)(64756008)(66556008)(66446008)(2906002)(66476007)(33656002)(52536014)(71200400001)(316002)(8676002)(6916009)(478600001)(8936002)(4326008)(7696005)(5660300002)(6506007)(122000001)(9686003)(54906003)(83380400001)(186003)(38070700005)(86362001)(26005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YU13N1dnUG9qeDhyS2JiUzU4RUxLeGhycXY5VDB2Ui9VYzczZWNhMlByRmRQ?=
 =?utf-8?B?SVBmaVlrd2pHcGJEZXk5Z1hMTHpYVWhMY2lMdGU1MmJjV0ZDTVZCd0JZa0JB?=
 =?utf-8?B?RVo5VFlyMHdNVUpncGp5T0o5YTNyMUdUcHVuTWp5WDJYV2JpV0trN1RqNGk3?=
 =?utf-8?B?bndRMS9NSG02UTl5cGpPcVhiZHJlRUFWb1JHRkpJbkxaaGNGdFFoY0xTSUw5?=
 =?utf-8?B?Q1ZlQ0JzVjVDMzNHL1hHdHUwV04zZWRNMGdRVlB2MzNTcmpOcVcvVzBUYjNB?=
 =?utf-8?B?REM2NVNoQVdLY2h5UFp1ZDVTWnMvK0JkMlVEZU1wMmhJZ21Bb3BvOFV0NEpM?=
 =?utf-8?B?VU9ld0lVeXNwY0JrcSt3WkRXQlVyRk05dVdnZTRMajRSZWlUS3hDU2MvbWNI?=
 =?utf-8?B?endVUFQ2T2c3Y2I3V2srOFV3bkFXZDQ0a1p3RUpob3lJSmFLOEZMZWRIWVJq?=
 =?utf-8?B?VzJVSDBDR0Foc1F1eHZldUsrVFE1WUk5bVFJRDFlbW1nWlE4TkR1T1FFR1RK?=
 =?utf-8?B?cDdSS0tiWktIelJUSTFoUzRRWTFLaGVKNllkNG9kbGtjajVCMTJSVzQrOHgy?=
 =?utf-8?B?K1pxcjNPMGNCTlp6Nkd6cWZUUW5kd3I2dkFjQ1lweklNTU5neWh3MFNVZ3Jl?=
 =?utf-8?B?NGpmTjlzZjNrQVJSUWZ6Q08wT2p3LzFDNURpTEowbWQ5L3I4ZitqRVpuVUpY?=
 =?utf-8?B?bFFZSERYKzdRUzhIZzhsSkhXbi9OWXNZdlAzOUFyUG5OVWgzWFBqODNmSVVG?=
 =?utf-8?B?dGJvSXhScTRxZ1lKa1RnZ3VhSkhoOHV3MWxncFY0WHdrL0FFTHBsMDVubUN1?=
 =?utf-8?B?UFZibXJuZnFaYjJWb2tsaVJIUXI5S0VvZGVnZnlyZHYyN2I4aEV5dHBYbzF3?=
 =?utf-8?B?R0cyYXBqZk8xeEJKazd6c0QxZnZsNWNUWEFmZWZqQ1YvRlE3WVF4ZGFCRE9E?=
 =?utf-8?B?QlAzbXZYdkNmQ3lMQlcvRnlwaEU1MzZna3lUOXlpNWxsUXA3ZkYrQUwzelhX?=
 =?utf-8?B?MzZpOG1sY1JURENlUDFZRU1oY2ZlNTlPa0hVMHZOYkhIWWkxM1BpdFA4Ukdx?=
 =?utf-8?B?ME9Sc1MwK2JNblNsZmRvZVhSWDNzQWtxN1U5eGMyV01KRTJPV29kVkdQUUx5?=
 =?utf-8?B?Qmg5S25wQlVvRTlIQTUvbzF0M3I4YXBxRVhyR2IrTVdSSDdjZUo3a3FmSmND?=
 =?utf-8?B?VEQxU0dZdVMwajlxYXlXMjlpQ3Q3VFdiYWF5TitMOWplVnJxb1d4ajMyVU1G?=
 =?utf-8?B?ZmtDRzR4cDhqVWQ3c1JlckFsTFMvYjh5S292cFdIU1IyZEZqN2d0U3F1MWQx?=
 =?utf-8?B?QmhLQWJNK25iMWtmUUttQzNqSFJJQ0o2aHBSenppSDVzRllKWmRZelM4Ylpo?=
 =?utf-8?B?c2ZrNUU5VTdpZG1kUGpldTlnODNhOTVWM1JqWUFPTVo0c1ZRM2J6eGhidzdr?=
 =?utf-8?B?ZnlsNW1ma25LYlZRY3IrVVF1OFR4MUNPMUw5dEYzY3oxanRtcHByVE5XOW4v?=
 =?utf-8?B?dFZ0Z1F1NEF3dzNROGtDdHJEQmFJN2lGclNHWFVUbWF3ZEhPTEZmU1RXdDVF?=
 =?utf-8?B?Zlp3QWpwUENPRWVHcjJpMm5WZ2dBaVE1WUxFRjFYV2JaNWhJN1RoNGR5REtE?=
 =?utf-8?B?NzFNZzFhZmQycTBCZVBxdWFlYkJMcE9pNlI3MUpEbHIzTW9mYUQyd3p2dUlO?=
 =?utf-8?B?eVZFWDQwUUFZL3dhZDhCNjRwNVIwKzhrNUk5VGZVSTRFbkdjV2VpeUJYMXZG?=
 =?utf-8?Q?35QS0TmXBC9IV85sHpd0owCjZsFuzvjsZNCVF80?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7e85e08-1995-4be3-68b4-08d960d80547
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2021 17:05:16.5900 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DGaoEy1h9XZg73xmGwmNh6nRwM9JeFT/q0wPpAj0S6VEDqUyGmn0yp0ma6oHbbVb8XyyRgGAAm+dPAkvU3kP2Sckek7mbme14hdh1KU3cAs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB3861
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
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

SGkgQ29saW4sDQoNClRoYW5rcyBmb3IgdGhlIHJlcG9ydC4NCg0KPiBTdWJqZWN0OiByZTogQVNv
Qzogc2g6IEFkZCBSWi9HMkwgU1NJRi0yIGRyaXZlcg0KPiANCj4gSGksDQo+IA0KPiBTdGF0aWMg
YW5hbHlzaXMgb24gbGludXgtbmV4dCB3aXRoIENvdmVyaXR5IGhhcyBkZXRlY3RlZCBhbiBpc3N1
ZSBpbg0KPiByel9zc2lfc3RvcCwgc291bmQvc29jL3NoL3J6LXNzaS5jIHdpdGggdGhlIGZvbGxv
d2luZyBjb21taXQ6DQo+IA0KPiBjb21taXQgMDNlNzg2YmQ0MzQxMGZhOTNlNWQyNDU5ZjdhNDNl
OTBmZjBhZTgwMQ0KPiBBdXRob3I6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNv
bT4NCj4gRGF0ZTogICBGcmkgQXVnIDEzIDEwOjExOjU0IDIwMjEgKzAxMDANCj4gDQo+ICAgICBB
U29DOiBzaDogQWRkIFJaL0cyTCBTU0lGLTIgZHJpdmVyDQo+IA0KPiANCj4gVGhlIGFuYWx5c2lz
IGlzIGFzIGZvbGxvd3M6DQo+IA0KPiAzNjcNCj4gMzY4ICAgICAgICAvKiBXYWl0IGZvciBpZGxl
ICovDQo+IDM2OSAgICAgICAgdGltZW91dCA9IDEwMDsNCj4gMzcwICAgICAgICB3aGlsZSAoLS10
aW1lb3V0KSB7DQo+IA0KPiBXcm9uZyBvcGVyYXRvciB1c2VkIChDT05TVEFOVF9FWFBSRVNTSU9O
X1JFU1VMVCkNCj4gDQo+IG9wZXJhdG9yX2NvbmZ1c2lvbjogcnpfc3NpX3JlZ19yZWFkbChzc2ks
IDQpIHwgKDMzNTU0NDMyVUwgLyogMVVMIDw8IDI1DQo+ICovKSBpcyBhbHdheXMgMS90cnVlIHJl
Z2FyZGxlc3Mgb2YgdGhlIHZhbHVlcyBvZiBpdHMgb3BlcmFuZC4gVGhpcyBvY2N1cnMNCj4gYXMg
dGhlIGxvZ2ljYWwgb3BlcmFuZCBvZiBpZi4NCg0KPiANCj4gMzcxICAgICAgICAgICAgICAgIGlm
IChyel9zc2lfcmVnX3JlYWRsKHNzaSwgU1NJU1IpIHwgU1NJU1JfSUlSUSkNCj4gMzcyICAgICAg
ICAgICAgICAgICAgICAgICAgYnJlYWs7DQo+IDM3MyAgICAgICAgICAgICAgICB1ZGVsYXkoMSk7
DQo+IDM3NCAgICAgICAgfQ0KPiANCj4gSSBzdXNwZWN0IHRoZSAmIG9wZXJhdG9yIHdhcyBpbnRl
bmRlZCB0byBtYXNrIHRoZSBzcGVjaWZpYyBiaXQuIA0KSG93ZXZlcg0KPiBJJ20gbm90IHN1cmUg
aWYgdGhlIGludGVudCBpcyB0byBkZXRlY3QgaWYgdGhlIFNTSVNSX0lJUlEgYml0IHNob3VsZCBi
ZQ0KPiB6ZXJvIG9yIG9uZSBhdCB0aGUgcG9pbnQgd2hlcmUgdGhlIGJyZWFrIHNob3VsZCBvY2N1
ciwgaGVuY2UgSSdtIHJlcG9ydGluZw0KPiB0aGlzIGlzc3VlLg0KDQpZb3UgYXJlIGNvcnJlY3Qs
IGl0IGlzIHN1cHBvc2VkIHRvIGJlICYuIA0KVGhlIGlkbGUgY29uZGl0aW9uIGlzIHNldCBieSBo
dyBvbiB0aGUgQklUKDI1KSBvZiB0aGlzIHJlZ2lzdGVyLg0KU28gaXQgc2hvdWxkIGJlICYuDQoN
Ckkgd2lsbCBhZGQgeW91ciBSZXBvcnRlZC1ieSB0YWcsIHdoZW4gSSBzZW5kIHRoZSBwYXRjaC4N
Cg0KVGhhbmtzLA0KQmlqdQ0K
