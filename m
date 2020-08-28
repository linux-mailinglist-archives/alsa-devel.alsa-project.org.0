Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 776A4255225
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Aug 2020 03:10:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DB5191837;
	Fri, 28 Aug 2020 03:09:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DB5191837
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598577022;
	bh=2jTsrPy2qaaLUfnTvAh4JCFmLD27nsmBZroEwxI8iL0=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nT4c2IEydfLAI6jIdJh99GHZYb7/O9RAR8AErVG9DBLq/eW3nlJlVd3hJOqsZDaEo
	 8ThHolb/7pnF1AD1zPNUNiWd9MY7IS2zvL1QLJl5jwBOJzA6dZsdxF8A/SiLxUoPwf
	 RWMWDb67v4WQIYj5fE/zKLzZrulv6pn+3wO0rnjI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D5C71F801D9;
	Fri, 28 Aug 2020 03:08:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AB67AF8016F; Fri, 28 Aug 2020 03:08:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-eopbgr1300093.outbound.protection.outlook.com [40.107.130.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A36C9F800EB
 for <alsa-devel@alsa-project.org>; Fri, 28 Aug 2020 03:08:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A36C9F800EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com
 header.i=@renesasgroup.onmicrosoft.com header.b="HM5twwfj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O3GFciwvMstHx7diSumN7kmJWJmHbx6wSUvPnyt+YXxx4UTBzdHjp50XYzBUomEjYf/Gv9+0gbo41SI0mjavoHcnI3eOgRUbtQWQmtUidF375y8eZj24KRb+7NMs1HWPxG27DgVw7mO7SGf3ZSqSGw17dag9yfeNH4UTM+1SfTeyUP3lBWUenu3VS7lcaQFWGgq/H4M3PSB35hhb5hCBpk80eQyBTl9/eJzqs5vheQ/jzfTJpI0AtkSzT4ZgR55YHTz1mR0pty+3QW9la/rXF+97lWakMpVC1d81rtTZFYW7nTk6wpHEDey7TRZkSHYm9moCuUQ/K32P4jhtQRY58Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2jTsrPy2qaaLUfnTvAh4JCFmLD27nsmBZroEwxI8iL0=;
 b=R1qQcnPkKmfV/RE5DHKA0/FhKDDrLCE4UmXuC7kV5ln3kV1tiGxCRrlaw5pOi+Nja/Ug6aIk3QZGRTLfw99uf3n51bpZ0mY5T589dAhUjCWnP3M7qhg4xyTcSrYHWCl3sId4geAFe4MJuq12N2BMUqJSzBbZP7bbDD6gwOSrGJ3cIG1SQMM/dIUfGwIIs7ygAmIzEDMidVZPWvSAWX70iDdOi76lx86eiLzk8XjlM1rKWjT0zRAT+MLUMCgEWyEeBhWAkECQBCUuIIZVgHRNm0XzfH3Bc5W2Cruxr2A6oEub+30jAluhaSS2vkLYtCbAUUlGFkE8BxR5m2ffPD3QiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2jTsrPy2qaaLUfnTvAh4JCFmLD27nsmBZroEwxI8iL0=;
 b=HM5twwfjB8GyDtplMXq8j4Jy3hlYd6VLpldHKpKvgwokNMuWZoh7dDZFA0xJJ8AemLwc2uIspmGsZ3PYSfrZ5L0v6D/JM1TJLMux2BjPU7w0fkVHoNciA2UBZ2p1W750+ctt6B+2DSN29oxlfwiUz5b6Co1Ly/n4sI08Ar975PY=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TY2PR01MB4715.jpnprd01.prod.outlook.com (2603:1096:404:114::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.26; Fri, 28 Aug
 2020 01:08:07 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::9083:6001:8090:9f3]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::9083:6001:8090:9f3%6]) with mapi id 15.20.3305.032; Fri, 28 Aug 2020
 01:08:07 +0000
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Subject: RE: [PATCH 11/20] dt-bindings: usb: renesas,usbhs: Add r8a774e1
 support
Thread-Topic: [PATCH 11/20] dt-bindings: usb: renesas,usbhs: Add r8a774e1
 support
Thread-Index: AQHWW5VL75Cylfwbw0CeuEtODQ3LM6lMciyAgACEukA=
Date: Fri, 28 Aug 2020 01:08:06 +0000
Message-ID: <TY2PR01MB3692453A78085512107AC95AD8520@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <1594919915-5225-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1594919915-5225-12-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CA+V-a8t9p9U5oeTp-QNmp2uGHMOvXpo+VhRvp5hv5oDEWUh5QA@mail.gmail.com>
In-Reply-To: <CA+V-a8t9p9U5oeTp-QNmp2uGHMOvXpo+VhRvp5hv5oDEWUh5QA@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [240f:60:5f3e:1:b16e:b7b1:d350:3c9a]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 6f42d449-3ce5-46e6-bae7-08d84aeed2c7
x-ms-traffictypediagnostic: TY2PR01MB4715:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TY2PR01MB4715D394AF0B3A5494CD758AD8520@TY2PR01MB4715.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2803;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: m0eOtqJ5elI8nm4JPGFLGS3Tg0yL5vwAad+2KbqoabAH63qTF5DUdnv1zfmPTNueskUG/6MpY1NCP/jQAzpUpWDfDKh6vTLEjH+hqA05tsegCIidnyqAPVpBPnZkYlJ+/eBzmXK4b88gwf/Qz3/Vbz1D8JmuNUaWQaCd3mAcqqjG7nlHBjw2t8B6fqXRKmvTzN9oJZmDquuO1NwRjaYxuPjuKMQ5rScYdkLoaCcAvJ+HKIK6fv5HmbV9glxRkR7f7WOmo2CD8Ojc7JxlfVdrLieOpAD3I6kmADRixwCiVjH/aS75N9vYlpIIoHNjNDFSiA4erpegt6S++jErlxV1su9EATBeLE3UodS9PshpuxKiqerEN6VH1W4OK5hFo+z7
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY2PR01MB3692.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(136003)(396003)(366004)(376002)(316002)(8936002)(8676002)(4744005)(33656002)(7416002)(66446008)(64756008)(66946007)(76116006)(2906002)(66556008)(66476007)(71200400001)(53546011)(52536014)(86362001)(5660300002)(54906003)(186003)(478600001)(7696005)(4326008)(55016002)(6506007)(110136005)(9686003)(142933001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: NpSThQVfnR99A1+8yIACElNKL3Nevk2mDyeiMdVwO5BfUvkbnxdg2EkhIlWskZQjNYdMN6pgwUBOR6BVJlLZJ2lUUTBvUQRkY6I4GvZXY5zlEDDoKF/3woE2rzc1/xHrpgMTK0ftJpB9ab4jh3iwVDiBM/YEp8EtiMf5+uIxkX4xPcE84vbl8tCdm79DWSdJ2Fb8iwWV/sRacBhXqvu/5tTj0tQMdGdx9tn1qx3oACfC8pYe6+I5kJ1W2TG1kQEou0nTCndKvUsVKEt2IV76lz6BMQ9Brgk2egakWlMy6k7TEu9spWi9cJqU0s+MWWEbP3BltuAToVaUb0DGcyKGjZCl5cqcAfbTOLCRvmB8ZnXTVRcuLU4bPzEH/Ksw8QDybSavHbsKKqLHDertJ6uqfUq7XjszCbGTwK8iytilZ4E3YX9W7gfl1JT1RdiwRLFFQPRsu3OslymC8tDJKZ211AVHaB4UhrYu3r1NzENWSe+6xVgRnCw1ZkFQE93jdR6BHl/kJhGY8Viywo6vL2JUHE5bErQ7cxmO+UNgT8kIe7VZd0aM3vThfDVlFGEqvxDznMfaGm057Ra0HZ9qXt9hxbgKFY9pVB3A9deVvfInwXKro/WICCODUNYkwdH8TJrYHellM8rVIg8nV0yrmVtirQW0GitFMGJBOwUUwNpa7LGvig5mHNhINyX3boSKnRdDdNq0rGGru3EJP+36YvnUZQ==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f42d449-3ce5-46e6-bae7-08d84aeed2c7
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2020 01:08:07.0042 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aRG3h4DdPbZ5xz7fvQwvQ4ZmFY+zp7FweGbyMujv6amdAlLDVCDGe8fD/w5FMclY0L5eHZktZ4EQjtba8WsI8DN8Si2FBeocpTwKS+sWwY4loI1/2w62XOgXWe2307kL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB4715
Cc: alsa-devel <alsa-devel@alsa-project.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 linux-pci <linux-pci@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 "linux-ide@vger.kernel.org" <linux-ide@vger.kernel.org>,
 Linux I2C <linux-i2c@vger.kernel.org>,
 Marek Vasut <marek.vasut+renesas@gmail.com>,
 Magnus Damm <magnus.damm@gmail.com>, Kishon Vijay Abraham I <kishon@ti.com>,
 linux-media <linux-media@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED
 DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Niklas <niklas.soderlund@ragnatech.se>, Mark Brown <broonie@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Jens Axboe <axboe@kernel.dk>,
 USB list <linux-usb@vger.kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 dmaengine <dmaengine@vger.kernel.org>
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

SGkgTGFkLXNhbiwNCg0KPiBGcm9tOiBMYWQsIFByYWJoYWthciwgU2VudDogRnJpZGF5LCBBdWd1
c3QgMjgsIDIwMjAgMjowOCBBTQ0KPiANCj4gSGkgR3JlZywNCj4gDQo+IE9uIFRodSwgSnVsIDE2
LCAyMDIwIGF0IDY6MTkgUE0gTGFkIFByYWJoYWthciwgd3JvdGU6DQo+ID4NCj4gPiBEb2N1bWVu
dCBSWi9HMkggKFI4QTc3NEUxKSBTb0MgYmluZGluZ3MuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5
OiBMYWQgUHJhYmhha2FyIDxwcmFiaGFrYXIubWFoYWRldi1sYWQucmpAYnAucmVuZXNhcy5jb20+
DQo+ID4gUmV2aWV3ZWQtYnk6IE1hcmlhbi1DcmlzdGlhbiBSb3Rhcml1IDxtYXJpYW4tY3Jpc3Rp
YW4ucm90YXJpdS5yYkBicC5yZW5lc2FzLmNvbT4NCj4gPiAtLS0NCj4gPiAgRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi9yZW5lc2FzLHVzYmhzLnlhbWwgfCAxICsNCj4gPiAg
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspDQo+ID4NCj4gR2VudGxlIHBpbmcuDQoNClRo
YW5rIHlvdSBmb3IgdGhlIHBpbmcuDQoNClJldmlld2VkLWJ5OiBZb3NoaWhpcm8gU2hpbW9kYSA8
eW9zaGloaXJvLnNoaW1vZGEudWhAcmVuZXNhcy5jb20+DQoNCkJlc3QgcmVnYXJkcywNCllvc2hp
aGlybyBTaGltb2RhDQoNCg==
