Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F1BFA90C12
	for <lists+alsa-devel@lfdr.de>; Sat, 17 Aug 2019 04:22:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 797961665;
	Sat, 17 Aug 2019 04:21:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 797961665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566008553;
	bh=KLM72e3AGBuMHrNaxdy7wNQiIxFz/vUt0r3zs4wZSYY=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=RxFS4MprABwlWu8xaT+haI8RqAIV/SXq4SzDYlNQ9mIOdtBv9QM6MtRumWJ936eY6
	 D1T7EthvQdtZuG0SE4a5c+qWBbUupYzt5Bwf53LdarDHVYscLURf1dgV1ozZUhNK6d
	 O5yZn4gCAzpXgqeyUEfHegvqKjpa4pPbDnexgQkA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C0196F801DB;
	Sat, 17 Aug 2019 04:20:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BCC4EF8044C; Sat, 17 Aug 2019 04:20:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr40059.outbound.protection.outlook.com [40.107.4.59])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EDF5DF8011F
 for <alsa-devel@alsa-project.org>; Sat, 17 Aug 2019 04:20:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EDF5DF8011F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com
 header.b="JyzmhBfV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k3fbzZumeBMh2IQEKy85/mZyofUsnbLe3/YXvFsArYlEhajvZ4p1m3jQhkXnb1R39DxgcX4D0RajnrkTPqv2xoIJscm0rHNKQ0c297s9XTIDGWIhyq8F3HQdBMH0yRx1sz5xfE150+KMiVNSGzp2hIimymhTB5BC3OTGWdmKE27xMLZzN+2uE+9+YKm4wNqYb6WQbCi0wLS7LzIdy22OmAt/6L+6JiVxpfefPjnn5ngW60+gBJLRbXaEwSyT7ffiuGSVcMGpiNu2QZ6RD2mqcyDn+RjplisFcgec0bxLS4qdfYFR2Kfz5Onjul58ionea0BBtQg03SHSZ0hzBt3lfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Q1xBVBBXj93m2DRzS5NYonMxuZ35iNr245vEHBXFTY=;
 b=eB1dZFkPIOR0vBOFUTT2YlNLInFPyNgLWXdyEq3+BPJuF6NoDi4p/5ZpuyjRgoZJYX4g1Ep8tIIqSGb4nRJHWiyvSMN8mbFWu68fmqeVF7YfKuOr0A72yYurWm+/R0+c4mJC/LLyvrRRFjrs5wDafaypYHWACbAu9MZIDhdrCXs/7BFZiyEJugG4OsNKtepVgzSy4jk7QgFil18G9r8ekR0foVnNm6W6HPFOwZhq4iT24lfJqAXod1+vSzotVqPb73130cRHowfSgXCz2pOyPKJrpWFLlvGfKn/rQltJO/hrEEzrMZ5N3OCgoSLIByreoeTniFALuo9PABLpGWkorQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Q1xBVBBXj93m2DRzS5NYonMxuZ35iNr245vEHBXFTY=;
 b=JyzmhBfVH50LleNtTKasP4bf1z7K6nbJye/ZEbzizzsooQEHoq4UBkxAms5MTX1ggYz+XhKr11iJhqGiHjK8A3JBrvxx+lvyqjaxHihWPi9sD6kUj3tm9rrOlaPKIxTKQKqFZKYZ4LzcRDaHiD6IjSosMJu31Ukc0yL19GQ287U=
Received: from VE1PR04MB6479.eurprd04.prod.outlook.com (20.179.233.80) by
 VE1PR04MB6383.eurprd04.prod.outlook.com (20.179.232.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.23; Sat, 17 Aug 2019 02:20:38 +0000
Received: from VE1PR04MB6479.eurprd04.prod.outlook.com
 ([fe80::dcf3:49f4:c31b:e8cd]) by VE1PR04MB6479.eurprd04.prod.outlook.com
 ([fe80::dcf3:49f4:c31b:e8cd%5]) with mapi id 15.20.2178.016; Sat, 17 Aug 2019
 02:20:38 +0000
From: "S.j. Wang" <shengjiu.wang@nxp.com>
To: Mark Brown <broonie@kernel.org>
Thread-Topic: [PATCH] ASoC: imx-audmux: Add driver suspend and resume to
 support MEGA Fast
Thread-Index: AdVUoehM0BPZ6qg6Rjq+cB6TmVVTDQ==
Date: Sat, 17 Aug 2019 02:20:38 +0000
Message-ID: <VE1PR04MB64791EC6FADFB2655D8074D0E3AE0@VE1PR04MB6479.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=shengjiu.wang@nxp.com; 
x-originating-ip: [116.230.228.239]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f135a6ca-8bb3-49e7-21bf-08d722b97ed4
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR04MB6383; 
x-ms-traffictypediagnostic: VE1PR04MB6383:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VE1PR04MB6383B6689CF8A5D1B0BB5D80E3AE0@VE1PR04MB6383.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2958;
x-forefront-prvs: 0132C558ED
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(39860400002)(366004)(136003)(396003)(189003)(199004)(66446008)(186003)(74316002)(55016002)(14454004)(102836004)(71190400001)(4326008)(229853002)(52536014)(71200400001)(86362001)(33656002)(25786009)(54906003)(5660300002)(99286004)(476003)(6506007)(478600001)(53936002)(316002)(305945005)(6116002)(7696005)(66556008)(66066001)(6916009)(7736002)(64756008)(2906002)(76116006)(6246003)(66946007)(66476007)(7416002)(4744005)(3846002)(81156014)(81166006)(26005)(8676002)(8936002)(486006)(9686003)(6436002)(256004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR04MB6383;
 H:VE1PR04MB6479.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: y9i7uPH3ZqWpg09Ho9ZrNIyPL110yW0nam0J2oKiRi9j+hMZFcWfqpco6+H341HlfDoBeI8F20RYzbIw0RakEzlH2TJUA3VkhqTJY64Px2JBCTABAfaCsCBeizQ3PPyiCvI8BD0wNzVx15U0g7XIREbsCUt/MlBK0pjkOvyhYoQxhCVU5zPKFtPk0C+IPjjyu+1DOGWfr8wam0sATS4GVlI2OmFmxneefAMMbGM+GBsoG9g7/rFuNoaaf0joai9hU0+o0rKXpala1L54jscBl2MR1KAoFPWkRS3ShLLq9ipJsBf8POVR3eYekTUifkxeoWqqvwe6zMAhblT+k/bRyGqKdK638jssapOGwEYP0XocczY+o7tX+veFX/4O1IoBsAbXeEt5PbCyjWy2iuxNTwjhEpWljO2aTs4jg9d0uRA=
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f135a6ca-8bb3-49e7-21bf-08d722b97ed4
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Aug 2019 02:20:38.7110 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: d4fAXOp9m9q1xx4csBC1jms054QbvnU43mJuEROTjGW7d/1yCQa63NrA8V/UWE3LpYfrkOMq9P4pXo0yu2QaIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6383
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "timur@kernel.org" <timur@kernel.org>,
 "Xiubo.Lee@gmail.com" <Xiubo.Lee@gmail.com>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "tiwai@suse.com" <tiwai@suse.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "nicoleotsuka@gmail.com" <nicoleotsuka@gmail.com>,
 dl-linux-imx <linux-imx@nxp.com>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "festevam@gmail.com" <festevam@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [alsa-devel] [PATCH] ASoC: imx-audmux: Add driver suspend and
 resume to support MEGA Fast
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

SGkgTWFyaw0KDQo+IA0KPiBPbiBGcmksIEF1ZyAxNiwgMjAxOSBhdCAwMTowMzoxNEFNIC0wNDAw
LCBTaGVuZ2ppdSBXYW5nIHdyb3RlOg0KPiANCj4gPiArCWZvciAoaSA9IDA7IGkgPCByZWdfbWF4
OyBpKyspDQo+ID4gKwkJcmVnY2FjaGVbaV0gPSByZWFkbChhdWRtdXhfYmFzZSArIGkgKiA0KTsN
Cj4gDQo+IElmIG9ubHkgdGhlcmUgd2VyZSBzb21lIGZyYW1ld29yayB3aGljaCBwcm92aWRlZCBh
IHJlZ2lzdGVyIGNhY2hlISAg8J+YnQ0KDQpZZXMsIG5leHQgc3RlcCBJIGNhbiByZWZpbmUgdGhp
cyBkcml2ZXIgdG8gdXNlIHRoZSByZWdtYXAuDQoNCkJlc3QgcmVnYXJkcw0KV2FuZyBzaGVuZ2pp
dQ0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1k
ZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFp
bG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
