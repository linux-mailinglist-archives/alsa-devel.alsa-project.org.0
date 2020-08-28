Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F602255273
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Aug 2020 03:14:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0DAD4183C;
	Fri, 28 Aug 2020 03:14:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0DAD4183C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598577295;
	bh=UYmEGKCVmLNsbbTGMfyfW2oU1G7ZaSu7LmztrSay1M0=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GbL/0aFPxegfZj/dYXKf1fDOL02hL0ln3VeB4vUiN+AAV+jM5ENfxcnMOY6KamnN+
	 sdhTWClL5hu4RSb3weho/BuIHDRvvfGg6xPmRHeSNX3pGPLYjON7BGz6YCGDKsa8a6
	 4kMPa0hmdalnZAvclvu5nfj+Sr7U2IKcFWYp6GXo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 773DDF801F2;
	Fri, 28 Aug 2020 03:14:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 503E2F801F2; Fri, 28 Aug 2020 03:14:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sg2apc01on0723.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:febd::723])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BED09F80143
 for <alsa-devel@alsa-project.org>; Fri, 28 Aug 2020 03:13:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BED09F80143
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com
 header.i=@renesasgroup.onmicrosoft.com header.b="fYlgrgw7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wk1PxVMYZVQ+OZhekVKg0tMC5I9RNHtUbFMaa2bcPMqkDM9bWly1FYVrE3IuPyYhL0pS7VpCWv1VPiIt2rH/Ccuhgn3lBKYvrsw2+cBse4jGSz8pNugczpNl4DykRGePR+1OyE4JHNFyBflDzg0ykrF2dzi6KP0cycqUUn+8E3YgoxzP/sA7+pHHVVXnSBZvKc5b5AAmxBot5Vl9f5SgOyOd3/u0+7viWYSo+pnuzy5bk4BfQvRyxA3Uwa+lmTVJyB8hZu5FNJPxC9q93EBnf4ZiU5GHa8bc+HWYgTuLnY0UWsBl7KABVOlBWWPcnGmpwr5H9L4gz0jJbtwxfKnZwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UYmEGKCVmLNsbbTGMfyfW2oU1G7ZaSu7LmztrSay1M0=;
 b=E6TzSFiexcW2KuXxJCV4yuTdhV7IOkUe96cZzlPrMK/tTzd/kDeDdvSXiAWDHcilUyTfmQ+nXYJEW8Awp4MgrT7Q7tLV03r+BqGKAqMAWucBMcRqpmxVLNZiMG+TZqQq81AZnFGLY7PHmJD/RfqywPgPlGvEXihtHU8Up3Cd/8PFFsbgBqWOZ/MbfmkzYlrpAflGn0vGrIwjO7FUpb0g6Ffz2oXpCxU3D0y6Bt4A+vCJCwoteXtqVkl1E3qZQ7PbJ3dyZUPCnE7Jd4etVFu0d/ZFYtJe8j27nbxugpY9jwzF5li1cSG61w0LkHBNbVBXp//5HbQsSHk3+1ihUyUd+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UYmEGKCVmLNsbbTGMfyfW2oU1G7ZaSu7LmztrSay1M0=;
 b=fYlgrgw7tZrgNRiFZVpJ61ZJRcHK3yjHvarMR76yVEPAWaH32qr/1O7eC3ws9Ub6ea6phhXgHg/LF0hH+jnBddufWcExDPzm4LSzbbqjp+zW+D1zoUDDx1NqQhVpA8KYboKwVxLmR4dvZdKhPSCGjcqsR4c/T4mbUxGCnS5jyhU=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TY2PR01MB3292.jpnprd01.prod.outlook.com (2603:1096:404:7a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.26; Fri, 28 Aug
 2020 01:13:34 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::9083:6001:8090:9f3]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::9083:6001:8090:9f3%6]) with mapi id 15.20.3305.032; Fri, 28 Aug 2020
 01:13:34 +0000
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>, Bjorn Helgaas
 <bhelgaas@google.com>
Subject: RE: [PATCH 01/20] dt-bindings: pci: rcar-pci: Add device tree support
 for r8a774e1
Thread-Topic: [PATCH 01/20] dt-bindings: pci: rcar-pci: Add device tree
 support for r8a774e1
Thread-Index: AQHWW5UrUbPIlHvQCUyWdxM4+VVmPqlMeWoAgACAI2A=
Date: Fri, 28 Aug 2020 01:13:33 +0000
Message-ID: <TY2PR01MB369299E1EA77E8BF87CA9E0DD8520@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <1594919915-5225-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1594919915-5225-2-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CA+V-a8sn1_fKbHt6cy-27+j2HWFp7Fjt8XBRZPLpvN47C3E3hQ@mail.gmail.com>
In-Reply-To: <CA+V-a8sn1_fKbHt6cy-27+j2HWFp7Fjt8XBRZPLpvN47C3E3hQ@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [240f:60:5f3e:1:b16e:b7b1:d350:3c9a]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 28242de6-c6ea-42e5-63ed-08d84aef959d
x-ms-traffictypediagnostic: TY2PR01MB3292:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TY2PR01MB3292C20694D4A37C64216936D8520@TY2PR01MB3292.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3513;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2LBuLFqe98XEZl4n65+e3rTeZw94cm0vFPZCWvPWQjVj4cq+2cBSliZHbcD/LYdzDpf8MxiRFnZm/SpC9WmS0+6Y87MW22iARYouHJsKsbMQuqP9dZzPhwdb3U5Vmxw8E6iryETCC7BYWqbWyZdwlGI9hMHbMdLiyqEyEDU2VUusCx8l3ZPTjjNdx22FhucccPUIfRz8cyooivq6FiqMFp2bCCSZjP6fUYYGobQLaO2b2IsAXwLGR0+hCd7be6s9DSwzioR7deogYC6whc/hvJDWPq3q6w9J1TSkId3p7dDz1U8bpNHiGIM3W0K9nXWDJ/IW6cxFzWpkOYtOFZP+VZROpEaEhmgACy9xI9nzGjk8RkJj6MVM4gXmE08d/Dp+iD+FWMkjlTj4DVR87XjGJg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY2PR01MB3692.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(376002)(136003)(346002)(39860400002)(4744005)(7696005)(110136005)(316002)(478600001)(76116006)(2906002)(7416002)(66946007)(66556008)(64756008)(52536014)(54906003)(66476007)(66446008)(8936002)(8676002)(71200400001)(4326008)(186003)(33656002)(6506007)(55016002)(5660300002)(53546011)(9686003)(86362001)(138113003)(98903001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: wkjAElkoPEIGXZx2OZ9Rc8Ze9DhHX3qoBKfdAUIhnQr9rCmTHqlS1l+ur4vuAid2RuHT24WNv9NS+N25tOWLHJHalKTsfw7hkkXIVa+sKToMIStbDYn6W9PHZjyGWlmjrpZe9XQhkUkIGDuc1beTlJPhUcgSm/K+H+7dsFebMu8oAFlOXIyMWivgjV5aIx3GgsD7v8CEIKxkumzKYZyPtN3ogy3z2ja8VLl0zo8zJp+b14ozYtqmEBPp4Cum9XCFUTUoW8Ag4XtrbcqBkRLK6i4visRyawTZU1FsNWNSRFNev64jnUG+tmFr7BR36YVZobabyvcFixYWyMC0oHgDdYGSOnrqktstsaDY4ooIUf9nm84w6nFsaIrsSzqj0D93FV9iHn/fgvUtUkwkBKMElFrCM60ueuHu6YlL19RnpR5obMBTdgIZfze/LjWzaEnazlJKCXggrDCOjI2+au89KxCPTs1RCq9gcLTw/h/y+PNT/66m2CVLM0TgDGiYSWCf1RwyG53ipvothrj4HKGHvcomfzHV8a9B93ZgBaUCgAwUkVsNu9bLJ36eGV8L52aILo6pdjJq+stpg6h8T0ZKGdD/J/lPzgaBUpO2G87oQoCECZB1aYXjD3mUcRU2jLtXssYIw0IqaPYjbeNz8x5MUKTXwqXyMknDE9oyFFLr2ycjTLU1unafQBbxLmOyMacuTZnH8OLT9hnVh6zf28mH+A==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28242de6-c6ea-42e5-63ed-08d84aef959d
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2020 01:13:33.9005 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KfYgyeSdWI1iU9VbAWztBqehvG1FuMiq6ojU6JAKWekcRiwYdyM0CBYTi8At31xibv+8Na9gaKnXnZ9GTgoYIUX+WiVc8L5CwYMG8kFdMuic74nfozw1dByj+3qRcR47
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB3292
Cc: alsa-devel <alsa-devel@alsa-project.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 linux-pci <linux-pci@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 "linux-ide@vger.kernel.org" <linux-ide@vger.kernel.org>,
 Linux I2C <linux-i2c@vger.kernel.org>,
 Marek Vasut <marek.vasut+renesas@gmail.com>,
 Magnus Damm <magnus.damm@gmail.com>, Kishon Vijay Abraham I <kishon@ti.com>,
 linux-media <linux-media@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE
 BINDINGS" <devicetree@vger.kernel.org>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Niklas <niklas.soderlund@ragnatech.se>, Mark Brown <broonie@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Jens Axboe <axboe@kernel.dk>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
c3QgMjgsIDIwMjAgMjozNCBBTQ0KPiANCj4gSGkgQmpvcm4sDQo+IA0KPiBPbiBUaHUsIEp1bCAx
NiwgMjAyMCBhdCA2OjE4IFBNIExhZCBQcmFiaGFrYXINCj4gPHByYWJoYWthci5tYWhhZGV2LWxh
ZC5yakBicC5yZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4NCj4gPiBBZGQgUENJZSBzdXBwb3J0IGZv
ciB0aGUgUlovRzJIIChhLmsuYS4gUjhBNzc0RTEpLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTog
TGFkIFByYWJoYWthciA8cHJhYmhha2FyLm1haGFkZXYtbGFkLnJqQGJwLnJlbmVzYXMuY29tPg0K
PiA+IFJldmlld2VkLWJ5OiBNYXJpYW4tQ3Jpc3RpYW4gUm90YXJpdSA8bWFyaWFuLWNyaXN0aWFu
LnJvdGFyaXUucmJAYnAucmVuZXNhcy5jb20+DQo+ID4gLS0tDQo+ID4gIERvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9wY2kvcmNhci1wY2kudHh0IHwgMSArDQo+ID4gIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKQ0KPiA+DQo+IEdlbnRsZSBwaW5nLg0KDQpUaGFuayB5b3Ug
Zm9yIHRoZSBwaW5nLg0KDQpSZXZpZXdlZC1ieTogWW9zaGloaXJvIFNoaW1vZGEgPHlvc2hpaGly
by5zaGltb2RhLnVoQHJlbmVzYXMuY29tPg0KDQpCZXN0IHJlZ2FyZHMsDQpZb3NoaWhpcm8gU2hp
bW9kYQ0KDQo=
