Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C712C7B6
	for <lists+alsa-devel@lfdr.de>; Tue, 28 May 2019 15:23:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4BF3A1654;
	Tue, 28 May 2019 15:22:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4BF3A1654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559049815;
	bh=vo836AfuDvAzKejVfkgJXjpMKKwhpjRx0iVNj6Wsdm4=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ev9a+JJAy3N9rxnImejQm8Vw0zoeoqn98N+3rxhRB3pVFTCpCJIBVvixeihApWd+6
	 sMqPxpkVlEH8cGlivLir4SRrieG4KrEIEAV2JLw2Wm6oB8J/T0sAjoGwg27kb5MkGE
	 hjwqUNUxgaITuHlNSD6FaMbLjcMgztNkLsGFa1oI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D2722F89728;
	Tue, 28 May 2019 15:21:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A3D02F89708; Tue, 28 May 2019 15:21:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10042.outbound.protection.outlook.com [40.107.1.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A7528F896B8
 for <alsa-devel@alsa-project.org>; Tue, 28 May 2019 15:21:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A7528F896B8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com
 header.b="m6apjXKm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BKUF/38t3JvrhBzQwWyGv1OYkinZkbHKvfd5nsuppKU=;
 b=m6apjXKmn0nvswGpreEZZyHpsCTqwQ1dt44xZ7FyBe4xRV4lDoLJxsvc7akBBCbjC7mtwUSg9CcO0qyd6iqTe60TDUndqfzfCbx7zMsWkYk0ItdvAeyKn2BSsAO3L358ia5n0U+lNjA4V2O9FhBdUNmqxBG8VVHx4vDg7B477aw=
Received: from AM6PR04MB5207.eurprd04.prod.outlook.com (20.177.35.159) by
 AM6PR04MB4261.eurprd04.prod.outlook.com (52.135.168.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.15; Tue, 28 May 2019 13:21:01 +0000
Received: from AM6PR04MB5207.eurprd04.prod.outlook.com
 ([fe80::fd2a:e078:f9d7:cb6b]) by AM6PR04MB5207.eurprd04.prod.outlook.com
 ([fe80::fd2a:e078:f9d7:cb6b%7]) with mapi id 15.20.1922.021; Tue, 28 May 2019
 13:21:01 +0000
From: Daniel Baluta <daniel.baluta@nxp.com>
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, "shawnguo@kernel.org"
 <shawnguo@kernel.org>, "timur@kernel.org" <timur@kernel.org>,
 "nicoleotsuka@gmail.com" <nicoleotsuka@gmail.com>, "broonie@kernel.org"
 <broonie@kernel.org>
Thread-Topic: [PATCH 1/3] ARM: dts: imx: Add mclk0 clock for SAI
Thread-Index: AQHVFVgwyNst+ZOF4kWBUcHYo9G8SQ==
Date: Tue, 28 May 2019 13:21:00 +0000
Message-ID: <20190528132034.3908-2-daniel.baluta@nxp.com>
References: <20190528132034.3908-1-daniel.baluta@nxp.com>
In-Reply-To: <20190528132034.3908-1-daniel.baluta@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR09CA0114.eurprd09.prod.outlook.com
 (2603:10a6:803:78::37) To AM6PR04MB5207.eurprd04.prod.outlook.com
 (2603:10a6:20b:e::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=daniel.baluta@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [89.37.124.34]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f7504bd8-91ea-4145-3933-08d6e36f4c48
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:AM6PR04MB4261; 
x-ms-traffictypediagnostic: AM6PR04MB4261:
x-microsoft-antispam-prvs: <AM6PR04MB4261974012779F3CB7D262E0F91E0@AM6PR04MB4261.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-forefront-prvs: 00514A2FE6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(136003)(39860400002)(396003)(346002)(376002)(199004)(189003)(66066001)(71190400001)(305945005)(71200400001)(8676002)(81156014)(102836004)(2906002)(386003)(2501003)(6116002)(3846002)(7416002)(478600001)(53936002)(68736007)(50226002)(5660300002)(81166006)(7736002)(1076003)(14454004)(8936002)(86362001)(256004)(186003)(26005)(6512007)(486006)(446003)(11346002)(476003)(2616005)(54906003)(110136005)(44832011)(73956011)(64756008)(66946007)(66556008)(66476007)(66446008)(316002)(52116002)(25786009)(36756003)(6506007)(99286004)(6486002)(76176011)(14444005)(6436002)(4326008)(2201001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR04MB4261;
 H:AM6PR04MB5207.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: O6zim8eacVvwS6STlB1/12H1kAyDvoa3ZgoqGMa/VPZPU+CmlVRZTxe0XrjlNuFbVXjAE8O8RbCGFMOHqeZYWEfWkk0NcKihfIc/sAqiXWjUV9BF2Ux+NPA2ehYh2AscUe5lRpqtkF6wwZlvemfGlWN50LOxA8qcfYcXUs/W8neWAoLFdBm5fU9cQKie8bVRTPjZ8qotkAyqoUdUbz7Sxne3EmTZ8DtbFnb0e3fP4rKdXc88KoXgMaJQCc/9Peo+K4cTmwlyJjy2DJEsmKFZtrZR/hxzCKqGQ/ROPSt8SPf+hrEZZzBl0y2KNZvsvwVZx4HOpNMf+1HSeSXQvHaT0vti97PqyyxFK+qGiDXP18tTuxiBTPZ8UxO87QNNdihNPUel+kGzUkiiu7lONyaMCAogJigdXvUbmtoR49cymJs=
Content-ID: <20D3443DBB6CC84981BDDFDA2756471E@eurprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7504bd8-91ea-4145-3933-08d6e36f4c48
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2019 13:21:00.0763 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: daniel.baluta@nxp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4261
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "Xiubo.Lee@gmail.com" <Xiubo.Lee@gmail.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "tiwai@suse.com" <tiwai@suse.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>, dl-linux-imx <linux-imx@nxp.com>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "festevam@gmail.com" <festevam@gmail.com>, "S.j. Wang" <shengjiu.wang@nxp.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: [alsa-devel] [PATCH 1/3] ARM: dts: imx: Add mclk0 clock for SAI
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Shengjiu Wang <shengjiu.wang@nxp.com>

Audio MCLK source option is selected with a 4:1 MUX
controller using MCLK Select bits in SAI xCR2 register.

On imx6/7 mclk0 and mclk1 always point to the same clock
source. Anyhow, this is no longer true for imx8.

For this reason, we need to add mclk0 and handle it
in a generic way in SAI driver.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 arch/arm/boot/dts/imx6sx.dtsi | 6 ++++--
 arch/arm/boot/dts/imx6ul.dtsi | 9 ++++++---
 arch/arm/boot/dts/imx7s.dtsi  | 9 ++++++---
 3 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/imx6sx.dtsi b/arch/arm/boot/dts/imx6sx.dtsi
index b16a123990a2..682207b5d868 100644
--- a/arch/arm/boot/dts/imx6sx.dtsi
+++ b/arch/arm/boot/dts/imx6sx.dtsi
@@ -1071,9 +1071,10 @@
 				reg = <0x021d4000 0x4000>;
 				interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clks IMX6SX_CLK_SAI1_IPG>,
+					 <&clks IMX6SX_CLK_SAI1>,
 					 <&clks IMX6SX_CLK_SAI1>,
 					 <&clks 0>, <&clks 0>;
-				clock-names = "bus", "mclk1", "mclk2", "mclk3";
+				clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3";
 				dma-names = "rx", "tx";
 				dmas = <&sdma 31 24 0>, <&sdma 32 24 0>;
 				status = "disabled";
@@ -1090,9 +1091,10 @@
 				reg = <0x021dc000 0x4000>;
 				interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clks IMX6SX_CLK_SAI2_IPG>,
+					 <&clks IMX6SX_CLK_SAI2>,
 					 <&clks IMX6SX_CLK_SAI2>,
 					 <&clks 0>, <&clks 0>;
-				clock-names = "bus", "mclk1", "mclk2", "mclk3";
+				clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3";
 				dma-names = "rx", "tx";
 				dmas = <&sdma 33 24 0>, <&sdma 34 24 0>;
 				status = "disabled";
diff --git a/arch/arm/boot/dts/imx6ul.dtsi b/arch/arm/boot/dts/imx6ul.dtsi
index bbf010c73336..e9691306f557 100644
--- a/arch/arm/boot/dts/imx6ul.dtsi
+++ b/arch/arm/boot/dts/imx6ul.dtsi
@@ -304,9 +304,10 @@
 					reg = <0x02028000 0x4000>;
 					interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
 					clocks = <&clks IMX6UL_CLK_SAI1_IPG>,
+						 <&clks IMX6UL_CLK_SAI1>,
 						 <&clks IMX6UL_CLK_SAI1>,
 						 <&clks IMX6UL_CLK_DUMMY>, <&clks IMX6UL_CLK_DUMMY>;
-					clock-names = "bus", "mclk1", "mclk2", "mclk3";
+					clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3";
 					dmas = <&sdma 35 24 0>,
 					       <&sdma 36 24 0>;
 					dma-names = "rx", "tx";
@@ -319,9 +320,10 @@
 					reg = <0x0202c000 0x4000>;
 					interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
 					clocks = <&clks IMX6UL_CLK_SAI2_IPG>,
+						 <&clks IMX6UL_CLK_SAI2>,
 						 <&clks IMX6UL_CLK_SAI2>,
 						 <&clks IMX6UL_CLK_DUMMY>, <&clks IMX6UL_CLK_DUMMY>;
-					clock-names = "bus", "mclk1", "mclk2", "mclk3";
+					clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3";
 					dmas = <&sdma 37 24 0>,
 					       <&sdma 38 24 0>;
 					dma-names = "rx", "tx";
@@ -334,9 +336,10 @@
 					reg = <0x02030000 0x4000>;
 					interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
 					clocks = <&clks IMX6UL_CLK_SAI3_IPG>,
+						 <&clks IMX6UL_CLK_SAI3>,
 						 <&clks IMX6UL_CLK_SAI3>,
 						 <&clks IMX6UL_CLK_DUMMY>, <&clks IMX6UL_CLK_DUMMY>;
-					clock-names = "bus", "mclk1", "mclk2", "mclk3";
+					clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3";
 					dmas = <&sdma 39 24 0>,
 					       <&sdma 40 24 0>;
 					dma-names = "rx", "tx";
diff --git a/arch/arm/boot/dts/imx7s.dtsi b/arch/arm/boot/dts/imx7s.dtsi
index 106711d2c01b..c345a2e6d824 100644
--- a/arch/arm/boot/dts/imx7s.dtsi
+++ b/arch/arm/boot/dts/imx7s.dtsi
@@ -886,10 +886,11 @@
 					reg = <0x308a0000 0x10000>;
 					interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
 					clocks = <&clks IMX7D_SAI1_IPG_CLK>,
+						 <&clks IMX7D_SAI1_ROOT_CLK>,
 						 <&clks IMX7D_SAI1_ROOT_CLK>,
 						 <&clks IMX7D_CLK_DUMMY>,
 						 <&clks IMX7D_CLK_DUMMY>;
-					clock-names = "bus", "mclk1", "mclk2", "mclk3";
+					clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3";
 					dma-names = "rx", "tx";
 					dmas = <&sdma 8 24 0>, <&sdma 9 24 0>;
 					status = "disabled";
@@ -901,10 +902,11 @@
 					reg = <0x308b0000 0x10000>;
 					interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
 					clocks = <&clks IMX7D_SAI2_IPG_CLK>,
+						 <&clks IMX7D_SAI2_ROOT_CLK>,
 						 <&clks IMX7D_SAI2_ROOT_CLK>,
 						 <&clks IMX7D_CLK_DUMMY>,
 						 <&clks IMX7D_CLK_DUMMY>;
-					clock-names = "bus", "mclk1", "mclk2", "mclk3";
+					clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3";
 					dma-names = "rx", "tx";
 					dmas = <&sdma 10 24 0>, <&sdma 11 24 0>;
 					status = "disabled";
@@ -916,10 +918,11 @@
 					reg = <0x308c0000 0x10000>;
 					interrupts = <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;
 					clocks = <&clks IMX7D_SAI3_IPG_CLK>,
+						 <&clks IMX7D_SAI3_ROOT_CLK>,
 						 <&clks IMX7D_SAI3_ROOT_CLK>,
 						 <&clks IMX7D_CLK_DUMMY>,
 						 <&clks IMX7D_CLK_DUMMY>;
-					clock-names = "bus", "mclk1", "mclk2", "mclk3";
+					clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3";
 					dma-names = "rx", "tx";
 					dmas = <&sdma 12 24 0>, <&sdma 13 24 0>;
 					status = "disabled";
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
