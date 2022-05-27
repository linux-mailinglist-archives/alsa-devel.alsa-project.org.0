Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E9CC5364AC
	for <lists+alsa-devel@lfdr.de>; Fri, 27 May 2022 17:30:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A4E411757;
	Fri, 27 May 2022 17:29:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A4E411757
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653665429;
	bh=qATorrVZ1io5put0EXPFRpWpkSdYY5pqT7t7zQFfpEc=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vuWkw0QrijNLZ9UOIyldJ2MnG/cp5Jwqk7Z8nePM9CfiyaQdNpp0Vd9mknKSNi9Jp
	 qSQTF5AyYrPJTVmulvaKULTjh6MI4unES2ba31Xkd3NXDeeAHGUGB55fLBUr7vadl8
	 oSiChB+6c9U8w97NtQtxA0RRfPCN1BEB7CMjCNg4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8DEF6F80520;
	Fri, 27 May 2022 17:28:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 634EBF800D0; Fri, 27 May 2022 10:49:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2072a.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::72a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8D23FF800D0
 for <alsa-devel@alsa-project.org>; Fri, 27 May 2022 10:49:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D23FF800D0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=dm.renesas.com header.i=@dm.renesas.com
 header.b="PZBaGj0L"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WwtNJ5i2xYjzcqmqdMjtIhS1fgsGy6wg2yGomPx7ldeuDxOksb+/RgalQY4VziQcvG5t3wzq2Cq5O3+9w28lE+WUE0d2nCWzAWfGCuzwd8FcbI0wRKKiLh6GzgZ2MHU+QvifqGYyEA+oOgLBKfqgjzishrYoILy94aS5RS9vit1eTp7/1ByKFht5zBRzRUNsnbQ3xuP2wqWPj7UqNX5SpR2dYCsw+KGwRVTtO/t5Yf0AgMXtgEsn97VWZb6+29Psy+QI7CGVQZBi12hgngzHDoxJypQLv9ZGOcF6FHrm2NGxRvRDJPLwVDyzRFGln8EsJnu3V8iPpx+ueVLTKxK2SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qATorrVZ1io5put0EXPFRpWpkSdYY5pqT7t7zQFfpEc=;
 b=HOcGq3cAGeNOOY12IErpw/u0H3+1MS4fBg6oObNhigjxQSQeLJf+ct1/sv4oOOvPTgWCFSXQRgkOH1LTG2ptD3X53r3pQ133m9T8sTqOLD3wWx6lo0tXP2Xc4HvEWEmBKy6k4SaijyComMbv+i2NGu59XWzXDsbwvs2NuJAtNP7WYtKI3xnR0D/revMmfedvuDoJamclkhgrrIxOWkQ1qBMzUSjFQPPudpwbVh/WMtFlT9dKTcVCqTDzy50IBjIfOOHEiDYXacnd/KrUBM25I/Md2bdasB7YFE3APLXbd9USqmlQSdsj4tgWedJYLu1zvYpscNM1sR1b+acVxSIqcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dm.renesas.com; dmarc=pass action=none
 header.from=dm.renesas.com; dkim=pass header.d=dm.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dm.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qATorrVZ1io5put0EXPFRpWpkSdYY5pqT7t7zQFfpEc=;
 b=PZBaGj0LfPff4grMu94IpJIiq1j+QCHgifXYjk4vBzrxCPZmOxSjs9iwphmif0dOSvqEs+t37QRd4vp3FqghtF9iSuzr2etJio5LOrDObHX5PFH6xANKAP2VxazaMOthK4pTW7a+0ZGFy3k0pAVbIy0Q1Lw1WBOmwaeD5a79E1M=
Received: from OSAPR01MB5060.jpnprd01.prod.outlook.com (2603:1096:604:6e::17)
 by TY2PR01MB2699.jpnprd01.prod.outlook.com (2603:1096:404:7b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.19; Fri, 27 May
 2022 08:48:55 +0000
Received: from OSAPR01MB5060.jpnprd01.prod.outlook.com
 ([fe80::98da:f7c:9a11:f91d]) by OSAPR01MB5060.jpnprd01.prod.outlook.com
 ([fe80::98da:f7c:9a11:f91d%5]) with mapi id 15.20.5293.013; Fri, 27 May 2022
 08:48:55 +0000
From: DLG Adam Thomson <DLG-Adam.Thomson.Opensource@dm.renesas.com>
To: =?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= <u.kleine-koenig@pengutronix.de>,
 Support Opensource <support.opensource@diasemi.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Subject: RE: [PATCH] ASoC: da7219: Drop no-op remove function
Thread-Topic: [PATCH] ASoC: da7219: Drop no-op remove function
Thread-Index: AQHYcUEN5Rn0iWD3JEijqJdpdLfEDK0yanAQ
Date: Fri, 27 May 2022 08:48:55 +0000
Message-ID: <OSAPR01MB50603C2955313EE5A8F3D296B0D89@OSAPR01MB5060.jpnprd01.prod.outlook.com>
References: <20220526204145.1725323-1-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20220526204145.1725323-1-u.kleine-koenig@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=dm.renesas.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7508b8f6-29aa-40ac-3762-08da3fbdbb6f
x-ms-traffictypediagnostic: TY2PR01MB2699:EE_
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-microsoft-antispam-prvs: <TY2PR01MB269953A95D7D495D12D8D8C1C1D89@TY2PR01MB2699.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: D4eQXqlEZe0xI92Dpsw3RDBnpcds2rIzmL1ooef+CrgirXzNZK0mV0j3tVOoPAeP1gbAzsI+Mw8ccdezALv0+3HP259txVq8LzSvG3P6v1aRD0IxAStBr+ZtgYL9dyZpRBKOppjEHtV0ytsxSn3KLYZulACVJ4ThVBun8C235JAQDmxSWKrJb3eWHBBUBqcd/4y9GqROiFyzJ/q4XrsAzbtI6Z2bmz8dKhQUbFfu0B7MDpYXC6wi++cvlNLeXb5uRx8os7OrCEZlGPmDjjFR+CRtzY+iUmWq9q5Ypmk6IHtEO48sw2+VSjaV3srNybz/6OrwCT3p9zuV6xRkBdNOGk8AMtvoS+5ZjBgp37kB1aM3O0A3d8za6dJTlm0agatfEJ/CI2p3r1+l4kRFqDCJmTq7+/Qk2Nw95Urowy8fxFBHOiTVfuSGbjqAToBxbS7kb47M1ox3/wFzLhdKEeeemUcAuH0lUjy4Q7rTtedoxAxLBqK/AT+pDh3JP7xWGfWOTHO+V62KPVABvq3jKDxGKv+8uwkw2c8EeFNiLW74VZk/TfLao5QLR+8VGUljXp/kR3msSh9Qc4h7TlhdoxQTGruBeHchHImSVJFz7aaq6jjkRrhKcHbwMksaa1ffKguzTZwPafzkSlut+so0go/my7nCSDP93VsPigxCgoS/FZCOMJGalh+7HVCpfgUiKdS8np/RfBuNx/kBiykx4QB4OA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OSAPR01MB5060.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(7696005)(38100700002)(66946007)(86362001)(2906002)(55016003)(558084003)(66556008)(66446008)(8676002)(66476007)(76116006)(4326008)(64756008)(33656002)(316002)(8936002)(38070700005)(5660300002)(71200400001)(26005)(52536014)(9686003)(6506007)(508600001)(53546011)(110136005)(54906003)(122000001)(186003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SDhaSzhmd01hUlBPYmlacTVSWitvRHI0T0tOSmZSdUJ1WjFTclpBdy9rQm5E?=
 =?utf-8?B?dkZKK2h3cXkzUjZMRy9vNVRRaGhaV29Ja2w1dXRRd2h2aEdaMnVSbDl1bVRS?=
 =?utf-8?B?di90TTJ0TURvb2NWd2UvV1dKbHh1WlpUUEhtSW40QWFqSE8xY05MQXVmaGF1?=
 =?utf-8?B?ZktyZE9qRU9PMlRwejJLSitmbExMODA0UGh5bjdNOUk3ek4xMkU2YmxHQ0or?=
 =?utf-8?B?aUdmNmFKZmRiMTA2RnJaY0NGQ0lhT3hCaENxa2ZnWGhkOWtqS2x3VCtEYkJ5?=
 =?utf-8?B?MnlaekJmdHR2WGFDRllodFJ3NVNDcVAyaVRLYkJoeHhFZC93WDd0VXJVR0xW?=
 =?utf-8?B?Um5SOWQySzV6dXM0dUI5endpc2VCZ3kySjlsVTgxWEdDYUx4dGRnejk2cFBM?=
 =?utf-8?B?dGtFcFczbmZQRFpvZ2RpaWJvRDNwWVRxMXRSUGpTUnRjZzZHMk9LdStITmFM?=
 =?utf-8?B?RzBQekVXWnpRWFdlSXhvS2hvYng1N1ROZnh3aWlncmliUitkQWR1cWZLNzZH?=
 =?utf-8?B?RHd1SDdsMjArbVNYYzVZOHpCL3dBa3d0OGtUcEhYOEFmTTcvWjJsME5wdnlk?=
 =?utf-8?B?OG9Odk1LWkJWMVl2Z2xRVjhKOXF4bktneXB4U0o3NklrOUdZcjVHQk5EUFdP?=
 =?utf-8?B?c0x2YnBHb2kvNWFjSklYb2RJd2JlYzJIcEM5TWpaNjMvV05QOU1VYnAzMEZ5?=
 =?utf-8?B?dVJsd3BDd09oTzdOdkhteCtuZDVCTVkrcEVYejlZcitUN0pzb0FuRU92Vmla?=
 =?utf-8?B?MFdHY2I1YUtQT2YzZDZBWVM2ZENCSkM4RW91VmJqbWxncmxOR2FsTjl6eHhJ?=
 =?utf-8?B?RVpMTExIRHVSTDJOMDU0TkRoT2J0YWx6enEwUndoVllWY2s1UHYyU2R1eHM4?=
 =?utf-8?B?VDVJL0lNSlYrd21ETk5LNjVaMk1ZcDZTWDQ4R1ZPNlVmbUxHSm9ibmJRNi9K?=
 =?utf-8?B?c1BuRkkvT2V3V0JXN3FRYm1reXRlRGlRR3lHczljdFVVY1I2UFgvWWNENHQw?=
 =?utf-8?B?OElQK1BnRmNUSWdkbEROVzJ0bzlYS0FCUjhLdkkrNytuVU82T3doc3BaSng4?=
 =?utf-8?B?Z1JVTGsxTVZYU00wZmYwREVOUTNZTEZyaXNJa3JNaDJQRE55dVAvQ1JhUGM2?=
 =?utf-8?B?MUYyWWZyVkxBeTRnZEd4Sy9GL21jMmlCTjl4Q29aRmN5WkJiOFNIMDNFVXJG?=
 =?utf-8?B?VlltSzMwZTdtdnkyRytROWNlSXp0V0dYUk9VMjByODJnbXB6K1FvV3ZhMjUy?=
 =?utf-8?B?TUhTMWVjNm9Qa0kxSTh3cUVkcGozcDBWQ214K24yRTgwWTg5L2RCNkxwbjJy?=
 =?utf-8?B?enQrUU9VUTRkMDlpL0hwQ244cHRqemRQRDh2Zld5YXprdkgvSnpROE93bGxn?=
 =?utf-8?B?dnMwWXVIdlhWbVdvRXNBNHR4aXdveWQzUDdHSXRtaEhQL1BCLzRubTIrM0ZS?=
 =?utf-8?B?bUhzWE9yMnhSYUwyUzczZlJ6WVliVUkrT3l6RkxkR2dQVFRPUjk2QUdJdmh2?=
 =?utf-8?B?MEI4WDRRTU9xKytrYlB5ekU0U29IeHoydGJJaldLWURBNGdWQ3EwR2hpMUdn?=
 =?utf-8?B?TTZ3Ly9FLzcwSnZkdHpyWkJLdU91NUZzcVhtVkdIYnlQN2hubVdZS1E4OHNW?=
 =?utf-8?B?dzVaVjJ2bzdRWGtVelZNd3ArejZKVnhFLytQMWhOSzZaT2VPY0s2bVUvVU9l?=
 =?utf-8?B?VTdDakNsei9iZ1BLeWlvc1YwbWdreCtYZVdOY0w5aDdBWmg1N2VrR0Fobi9q?=
 =?utf-8?B?eVVtMnVhamJkUFduTFhHYldQRURmYjJhQ3psNlVvWThnRzNxcHNrYjVMZ0Fn?=
 =?utf-8?B?UmZYako1aFZaQ0lMNXV0Z2FsUjFCN0RxNE1Nd25QWU5zZmRnU3Z5ZEJSSFZI?=
 =?utf-8?B?a29PcjltQU90RlBBV3pTWm90bmpsWDBoQXA3bG5nTEpMczhLdjVaK1dpT1o0?=
 =?utf-8?B?SXY4cGpHS3cwSithNWRCeitLbXpwL2VOMkpzeXRQNnFJYUkxUm9xUUVYeW9z?=
 =?utf-8?B?b1dZK1lUQzNnZmZoTFFNQTNhdjltWVVFTnVvc1I4SDlnWEluVFcvWjNBY2U4?=
 =?utf-8?B?WGM3dVFDUUgySzNSbVpGMVlZTkxXdHNPVWlZTElTQXhpUng5RTZsZ1ZTb3Jk?=
 =?utf-8?B?MGp2bU9CbklTOXdjSkhEWVloV2wwR1ZQNU5tZXoxcHhpejZjSzM0cmtsRm9t?=
 =?utf-8?B?U2VRM2VJOFVHekQ0M0Z2QVB6aExCemhVNytUWFVVak5jOUZaaURyK2Z1NEph?=
 =?utf-8?B?VTcyUUJES3UwOXVocjBVL3I4K0xMM0Z4ekFGNmNQdGVLemZNa3Mwemk4eko3?=
 =?utf-8?B?RUpwdHZvZng2Z3BZN004MG9pWHhNVXBpdzNiQnRBR3RHMGJuNlJZWHNQOE90?=
 =?utf-8?Q?BYnkHnlwYc+DOSk4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: dm.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSAPR01MB5060.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7508b8f6-29aa-40ac-3762-08da3fbdbb6f
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 May 2022 08:48:55.1718 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DQpkvEoWMaHBWTi8HwCjifuu2kaIFKwEW6C4Lcito4o8IjQljnmbOL0VzSZTwi7ZVsmvAcQV287n2qAJec1zGe+Y8n2SfFS8shyh4WIu8dQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB2699
X-Mailman-Approved-At: Fri, 27 May 2022 17:28:30 +0200
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>
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

T24gMjYgTWF5IDIwMjIgMjE6NDIsIFV3ZSBLbGVpbmUtS8O2bmlnIHdyb3RlOg0KDQo+IEEgcmVt
b3ZlIGNhbGxiYWNrIHRoYXQganVzdCByZXR1cm5zIDAgaXMgZXF1aXZhbGVudCB0byBubyBjYWxs
YmFjayBhdCBhbGwNCj4gYXMgY2FuIGJlIHNlZW4gaW4gaTJjX2RldmljZV9yZW1vdmUoKS4gU28g
c2ltcGxpZnkgYWNjb3JkaW5nbHkuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBVd2UgS2xlaW5lLUvD
tm5pZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPg0KDQpSZXZpZXdlZC1ieTogQWRh
bSBUaG9tc29uIDxETEctQWRhbS5UaG9tc29uLk9wZW5zb3VyY2VAZG0ucmVuZXNhcy5jb20+DQo=
