Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5492774D9F5
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Jul 2023 17:35:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 413B9A4D;
	Mon, 10 Jul 2023 17:34:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 413B9A4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689003302;
	bh=XPW2zA0I3vGKcGlszYAYYFT2rPLttXyv9YidR+RuKus=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PVG49KITJcjM5Qi7Xs2ecIN/8qgyfsA69B4DjwdkJsisgHwaGrk7uA6Khk5Ax3gI1
	 F0q5T7c0WRL1lVk84hPHZuhcMbJGjJFKLKaGvE52G1TUG286mxpV5ItBTF05rDqDYU
	 10sSApjv3PSoX3Tay3xM12COViXDCo9CnHUDDItg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B7D54F805BE; Mon, 10 Jul 2023 17:32:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1539AF805C1;
	Mon, 10 Jul 2023 17:32:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DA61EF80249; Mon, 10 Jul 2023 12:22:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on2072f.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:704b::72f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1B93AF800D2
	for <alsa-devel@alsa-project.org>; Mon, 10 Jul 2023 12:22:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1B93AF800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=vivo.com header.i=@vivo.com header.a=rsa-sha256
 header.s=selector2 header.b=KitjI+ag
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LukFKu1Iju3+rL8thG9toGamYye6pPr+19UyYqxpuVzx8gl0Ni//AOIdFjVvieohb/0DPoLEJ64HpuaUxqxAn1eczDxp3nmBxVkWX3gHrhGFLKf3WwqOLeix+xgWMRiEkzKAMYBhWlTsDT2fULWPS97YJdiYRVUd4Wr/n+xxysPDTFZFIqT4BI6iiL2jkLciUUGYATX5FYP4dLyXBRpIDm8x6qFBAsKAeDChCt97VzpprbgCApObwM5zpsJR9ReGvJXyWq3WwnLwamqiVTzw439qNbccanQCM2FKhHplu3baQP506rziQZ0X2MY4akusey+5YlPCxmOSBuYqNjXZJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XPW2zA0I3vGKcGlszYAYYFT2rPLttXyv9YidR+RuKus=;
 b=Paq9p81r+hyzij4q0xydzhWS4OYzTy8unQjv+f4EVOs9islFL1PNxPo3322t9rUUbLtOO5XBNVqlUubWQzwBaTZ4hXmFb/5ZOIp9kQZaIyxzun6rzDOx71f6E9Lo6yv5kQQZwZqNPZofbG0/cdiYmb1mM4EHVHM8MvXACwMga58TR51tUzipGQNxe9uEJw09eXUJ3YE9NYIq11iE5izCTjLwuJSoU4wLgKBngb7ap7d4zwwmS9yL1B6fLvPoTFzG7RtlUu0EI9f+lXV++fOr0sovyVvWfU2K7u+EcelWbB/qRwziRUNM80UiybCF8alWVvfVlffhaiMHTem8JOBo1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XPW2zA0I3vGKcGlszYAYYFT2rPLttXyv9YidR+RuKus=;
 b=KitjI+ag+rmqVtGma1BkzO+Cvg0SX+g41xIHPDs3IysGye6EYAMrIEAagnH2SGRNkCSUSQWlBWKRyUZ++/8nZlTbFR+6F9UcZTKl2pTyUUziGyTkH9qA2+yQKQnNme01IhBy7Wqd8Vu0soVrRXUmo/dBqlysI7FAOtnpqlYVXYIFaR7z+M0wjWe7w55P44bvxediXBS+7YRxP12tl/XiEKGuj0KFgTHgLVi14En+vcOT5KDXCrnGSbDIBhtoZll0r3xpH49dZrOLI2utuxrhMogcDJb6l61POJ4tTn63MABVhZDehblZwkdstscUfFLy05/DXS8fx+8VD0fg2a/Nkw==
Received: from SG2PR06MB5288.apcprd06.prod.outlook.com (2603:1096:4:1dc::9) by
 TYZPR06MB6657.apcprd06.prod.outlook.com (2603:1096:400:451::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6565.26; Mon, 10 Jul 2023 10:22:07 +0000
Received: from SG2PR06MB5288.apcprd06.prod.outlook.com
 ([fe80::f9b8:80b5:844e:f49a]) by SG2PR06MB5288.apcprd06.prod.outlook.com
 ([fe80::f9b8:80b5:844e:f49a%6]) with mapi id 15.20.6565.028; Mon, 10 Jul 2023
 10:22:07 +0000
From: =?gb2312?B?tsXD9L3c?= <duminjie@vivo.com>
To: Takashi Iwai <tiwai@suse.de>
CC: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Stephen
 Rothwell <sfr@canb.auug.org.au>, "moderated list:SOUND"
	<alsa-devel@alsa-project.org>, open list <linux-kernel@vger.kernel.org>,
	opensource.kernel <opensource.kernel@vivo.com>
Subject: 
 =?gb2312?B?u9i4tDogW1BBVENIIHYyXSBzb3VuZDogc2VxOiBmaXggdHlwbyBpbiBzeXN0?=
 =?gb2312?B?ZW1fMnBfZXZfdG9fdW1wX21pZGkxKCk=?=
Thread-Topic: [PATCH v2] sound: seq: fix typo in system_2p_ev_to_ump_midi1()
Thread-Index: AQHZryQXSyQrZ001V0OpfGd4Qm/WsK+q7p+AgAfjLfA=
Date: Mon, 10 Jul 2023 10:22:06 +0000
Message-ID: 
 <SG2PR06MB5288F701BE98E12D07FAAA22AE30A@SG2PR06MB5288.apcprd06.prod.outlook.com>
References: <20230705093545.14695-1-duminjie@vivo.com>
 <87wmze65xs.wl-tiwai@suse.de>
In-Reply-To: <87wmze65xs.wl-tiwai@suse.de>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SG2PR06MB5288:EE_|TYZPR06MB6657:EE_
x-ms-office365-filtering-correlation-id: 63e61cf5-427f-4d8f-94df-08db812f8349
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 ffrGvp3XlLkuLgwxZlMykzY+v40Gj3uP/C3uU19itAvDT0jLDGG7YcJOhZdVPKfkDQbfYF49KO5LvZZ2p1i6x5nZclfvlbxz963OQgnUx3CIVhmvXe6J0wwpR5UmmcRaH/BYhOXLGgByyw1hL/EUoV7GO5Jm4k/1/gBIsitIUgVzSvvB0vqi6pAbQsAcw44nqzJh3y2lGbqEMXXwm2gB35cfE2cKSeiiWNinfgnfMYz2FqQjTbbI9gXLnDY7cC2nJU4L/vXdYGK59vXYPw+5X0/oml1oIw0HNJ6cwLdSVZSyOV82YQdbCyf8q6iIe9e3fE6CNDYXCikfsQyH3atZsUgTkabMl0OGbG/VtfbdYD8tWoYWUmhPLxtB1JULqklFz3qRBHhcyWqvPps5T2b1xJBcys+FyFgYegwuYMfpe60K5vzxm0gDfDOB89DFVLMohPriXM2t8mkkvxgVQxusEqEB95BPiCFKY2gCDQNxXoDwDlMg4wBPiobmHPgB3EBhR1d6oNIq0hwt0djs5fSUggCdpPkzOiP3kDMqNhDkorjrFknxayPckIyN4YrC2KhjDsvxX7t8PdarvagkzhXujcv+Go2/LYYpZ5JMKc9RnB6KMZbox/OQ8yIZ0/ktOesA
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SG2PR06MB5288.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(136003)(346002)(376002)(396003)(39850400004)(451199021)(64756008)(66476007)(66946007)(86362001)(66446008)(66556008)(4326008)(4744005)(316002)(2906002)(76116006)(6916009)(41300700001)(38070700005)(478600001)(52536014)(5660300002)(54906003)(8936002)(38100700002)(122000001)(7696005)(71200400001)(966005)(55016003)(9686003)(83380400001)(107886003)(6506007)(26005)(186003)(224303003)(33656002)(85182001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?gb2312?B?anpwRHpiR2VYOGVUbk5hdjhXRFZ1VlkxbTdPd0R0VkFxbU9QZE9MeWp2RGNl?=
 =?gb2312?B?QTM2azh0Z2lMR1QrNHRsV1RrSmJPZXlvRVFXcHQzWEpZTE9wbnZidjRFRFd3?=
 =?gb2312?B?RjNLLyt2Z2VTcUYyM09STFBNalpGSm91VmQrSVhBVjJqK1pGdDRXcTN1OENJ?=
 =?gb2312?B?OCtNSGxwTENJc0tSVys3Z2IyYjhhNm1pcnEvSlpiSFo5Vnpha08wamZVdW1r?=
 =?gb2312?B?ZkR4QVMrT1JBVExBZDk1b3R6bk5LTC9hYlZuM2o3ZTluL3FNL2RRTVVFOEZk?=
 =?gb2312?B?STlVZlQwaTRIM21qcHI0cjJ2UGVwanBGdzlsV1g2b0I4OTRDSTBybFRQSE5U?=
 =?gb2312?B?aG0xUk9qYUNFUkF6ZVhwNlgwL1ZycHdNWmo5Y2xLZWkrdkxkUk16L2VKUXcv?=
 =?gb2312?B?OW5jVDhkaWU5WGw2eWY2TWJTMGJzeXhCSWFnZCtFTmlDdGdSMm1mKzZBcnBU?=
 =?gb2312?B?cndEdmJXTlhWdmxKeW5WM1BrN0hZQ3h3ZVFuS2JrTC8vVVYrb3lvS21jWFk2?=
 =?gb2312?B?SUNrQzREenBCU2lvMkxLdVVROGZDV1dkTHFBb0NGT0o2VGdVY0tsS04rRGZj?=
 =?gb2312?B?d2ZXRlprSXdzUURRMlVubW8xK3JjMGtoN2YxNVoyWWU0K0tObHRTQnRGRlBB?=
 =?gb2312?B?OFlxSkZXd0h6L3NWdmhJSkpPS1dFRXBrT2FHVlRpN1VITDNPNW9mVEZpZXJ4?=
 =?gb2312?B?VlhvNWxWaDRBMmpOSWxEd252eXhaZzBCR0tHZ2phMGN5RUZKSFQyWk1JM0VR?=
 =?gb2312?B?cFlhUWMyUkVYSTlnd2dRMmwvcEpaNmtlaExEV3QvQUxpdFM4L2VMeWsyVDdy?=
 =?gb2312?B?ZzdWYkFGbndyTm9TT2tmRGpJbi9IYUpCekV5WHFNU3pMTTdEYU16aUt2TEpW?=
 =?gb2312?B?cEF1dE1vN2pQWmtaRG5SYVE0Ly9OYzZQU05CejQxV1JkMUx5OFRQMGpBMEpK?=
 =?gb2312?B?NmJPWkJBcUlTOERERjJ6VjJuOTVSaGpuVlZ3QUNpZGNXTWZWcDBSNFVHZGU5?=
 =?gb2312?B?N3hNZ1MwRWYraHRDU3pUMnVuK2wyb2psdkVocFV1eVZ2TGdhNlJoRThVaE5n?=
 =?gb2312?B?REFJYUVSdjhKM05kUExYZjJIdVdyTlZOY0xXbDhNSis5NnRHRE1yd2FjcmNv?=
 =?gb2312?B?M0hjdjR1N1doMFRBZEk1cWJUaWFiMVRUWDNwZENEd29sWnJ3d3hPdU9YcEJv?=
 =?gb2312?B?TkJTWlA0Ny9NTkZYc0dLb1Nzekt0c28rbG1sQlFJdmcxci9WWlpJNjNvVjND?=
 =?gb2312?B?UzdrR2Q0SGpuSFA5Zm9zbWVWa2U0UU9ZQVpJLzRiT1hHWDllWkdSZUVQc3VY?=
 =?gb2312?B?ck9mNllNZ3RmUlozMTZiWGFacGdyQ3ZFeitxRDFQclVoR1ljanZCMFhMYXVa?=
 =?gb2312?B?ZGZvVnJsQ0I3RGJZeGoyUEtQakJmMmtnUVJ5VmlJc3pVR1hJUUJhSHZRY0ov?=
 =?gb2312?B?SU9KaDFJZWh5VHlSYWFxM1lKZ05SMXpZeDFraTJSeWZzT2Z0OE5oZ0FjQ2gy?=
 =?gb2312?B?bTFsd0RYZTh2Uzl3aHE5dWF3VGlLS0psL3lVaGdBd2VobmtpMHkwaEplTGdp?=
 =?gb2312?B?Uk5GZkRnVTQrVEtjT0ZyS1hXa21aS1ZCbm9QNDZzMStQYzZ3Y2ZicFArbWMy?=
 =?gb2312?B?Y25qeFU1dkJtcXhKNUlieXpHUEJsOWlJSzllRm4xank3eE1hK09CM1E2OFh3?=
 =?gb2312?B?cWs4MHVSM004T01pNTdTZ2NuK281SlVWZ2FxNUtEOU4zQ0s5K2FsRHNzZVJK?=
 =?gb2312?B?dGt4ZTVGaC9LL2UrU1NYY1p5TkNKcTZDcngzQ1hidzRGMWR2WENMTFZpcmUz?=
 =?gb2312?B?N3VLYVZTVDNTNGJJQVU5c1ZHVGIwMjFhdi92V3JieVlJMTl2d0hRZEZ5UVh6?=
 =?gb2312?B?Y251Y0wybWNkTkEzZFovNTIzeFo5aFNtclJaNjIyWDg5ckxJKzF3RDdrcTlN?=
 =?gb2312?B?T2x0bllITmdoVC96QWVSaThJTXNGNUlnTWVFVWc4WGp3bGxZVC9iR3lzUUZr?=
 =?gb2312?B?aC9WZ2dxak1BR2RJN2JFNFNGTC8rYXluOG5zVFJ4NERIT3VnTFFCQis5d3pU?=
 =?gb2312?B?ZTF0ejROZTBsOVkwc1lKb2VGbE40WENCbVVURnRiczhGSjN3NU81eUdTdXFN?=
 =?gb2312?Q?Lx68=3D?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SG2PR06MB5288.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 63e61cf5-427f-4d8f-94df-08db812f8349
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2023 10:22:06.9057
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 x0lx0JFuNbJKcqF5ud/bBttsQ5duTIg+MIbVsB+58EmO8VFKJzksRjG4pfB6NjweZyOAYumJUiX9T9ecZBIQHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6657
X-MailFrom: duminjie@vivo.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: MMX3FFRZMJAZ35G6RY5BW7R2YNU6NRME
X-Message-ID-Hash: MMX3FFRZMJAZ35G6RY5BW7R2YNU6NRME
X-Mailman-Approved-At: Mon, 10 Jul 2023 15:32:22 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7ZHVCXVNYFLYGBVT35GWT3LIJEU3DWTL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

PiBBdCB0aGUgbmV4dCB0aW1lLCB0aG91Z2gsIGl0J2QgYmUgYXBwcmVjaWF0ZWQgaWYgeW91IGdp
dmUgdGhlIGNvcnJlc3BvbmRpbmcgRml4ZXMgdGFnLCB0b28uDQpTb3JyeSBpdCB3YXMgbXkgbWlz
dGFrZSwgdGhhbmtzDQoNCi0tLS0t08q8/tStvP4tLS0tLQ0Kt6K8/sjLOiBUYWthc2hpIEl3YWkg
PHRpd2FpQHN1c2UuZGU+IA0Kt6LLzcqxvOQ6IDIwMjPE6jfUwjXI1SAxNzo1Mw0KytW8/sjLOiC2
xcP0vdwgPGR1bWluamllQHZpdm8uY29tPg0Ks63LzTogSmFyb3NsYXYgS3lzZWxhIDxwZXJleEBw
ZXJleC5jej47IFRha2FzaGkgSXdhaSA8dGl3YWlAc3VzZS5jb20+OyBTdGVwaGVuIFJvdGh3ZWxs
IDxzZnJAY2FuYi5hdXVnLm9yZy5hdT47IG1vZGVyYXRlZCBsaXN0OlNPVU5EIDxhbHNhLWRldmVs
QGFsc2EtcHJvamVjdC5vcmc+OyBvcGVuIGxpc3QgPGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5v
cmc+OyBvcGVuc291cmNlLmtlcm5lbCA8b3BlbnNvdXJjZS5rZXJuZWxAdml2by5jb20+DQrW98zi
OiBSZTogW1BBVENIIHYyXSBzb3VuZDogc2VxOiBmaXggdHlwbyBpbiBzeXN0ZW1fMnBfZXZfdG9f
dW1wX21pZGkxKCkNCg0KW1NvbWUgcGVvcGxlIHdobyByZWNlaXZlZCB0aGlzIG1lc3NhZ2UgZG9u
J3Qgb2Z0ZW4gZ2V0IGVtYWlsIGZyb20gdGl3YWlAc3VzZS5kZS4gTGVhcm4gd2h5IHRoaXMgaXMg
aW1wb3J0YW50IGF0IGh0dHBzOi8vYWthLm1zL0xlYXJuQWJvdXRTZW5kZXJJZGVudGlmaWNhdGlv
biBdDQoNCk9uIFdlZCwgMDUgSnVsIDIwMjMgMTE6MzU6NDUgKzAyMDAsDQpNaW5qaWUgRHUgd3Jv
dGU6DQo+DQo+IEZpeCBkYXRhLT5zeXN0ZW0ucGFybTIgdHlwby4NCj4NCj4gU2lnbmVkLW9mZi1i
eTogTWluamllIER1IDxkdW1pbmppZUB2aXZvLmNvbT4NCg0KVGhhbmtzLCBhcHBsaWVkIG5vdy4N
Cg0KQXQgdGhlIG5leHQgdGltZSwgdGhvdWdoLCBpdCdkIGJlIGFwcHJlY2lhdGVkIGlmIHlvdSBn
aXZlIHRoZSBjb3JyZXNwb25kaW5nIEZpeGVzIHRhZywgdG9vLiAgSSBhZGRlZCBtYW51YWxseSBm
b3Igbm93Lg0KDQoNClRha2FzaGkNCg==
