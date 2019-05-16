Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 04174204A4
	for <lists+alsa-devel@lfdr.de>; Thu, 16 May 2019 13:26:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7CC1916CE;
	Thu, 16 May 2019 13:25:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7CC1916CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558005966;
	bh=uIal8HRNT0ssSeSo1lBevv/mN4gek3b7SEFXQ2b760I=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=DHqhDVvvBMipl+ODNzNKgA0zY5IDHe+GIkG3GKJTqmtsfTMFaOzW1LqwG1aiwkdoC
	 ymMSxy3iBta5EDec9eUyEkYW+BuF8nrx4CdqBw/tS/HOFxGRP2Nd9N4B4HNVOBOBSN
	 EEObQnBW+pvgTh1bVuplIlqHAbu+g6QwZdWnsUf8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D688BF896B6;
	Thu, 16 May 2019 13:24:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0284EF896B6; Thu, 16 May 2019 13:24:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30044.outbound.protection.outlook.com [40.107.3.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2760AF806E7
 for <alsa-devel@alsa-project.org>; Thu, 16 May 2019 13:24:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2760AF806E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com
 header.b="Sltg+6Ii"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o5Pmafg8pm32hRxJ/xCqaP5OyzTxAvzFiL42BtQ5F8I=;
 b=Sltg+6Iih30t/wMTRaOQjsMoL+TUi1LvS1Kb5sr39hgUWoSZ6mzdk+tdBeOF37Bu3S6mYrCiNp26l+X7T9ZJNr73w982PgWt0puvOQrAOL8JnykoP0kOQ1qWsT3v0hoAdn5Ft5JSpzdUCIKo11vNy8oZJb+6wV4C6DQEwZokvac=
Received: from VE1PR04MB6479.eurprd04.prod.outlook.com (20.179.233.80) by
 VE1PR04MB6766.eurprd04.prod.outlook.com (20.179.235.219) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.16; Thu, 16 May 2019 11:24:12 +0000
Received: from VE1PR04MB6479.eurprd04.prod.outlook.com
 ([fe80::a5b5:13f5:f89c:9a30]) by VE1PR04MB6479.eurprd04.prod.outlook.com
 ([fe80::a5b5:13f5:f89c:9a30%7]) with mapi id 15.20.1900.010; Thu, 16 May 2019
 11:24:12 +0000
From: "S.j. Wang" <shengjiu.wang@nxp.com>
To: "brian.austin@cirrus.com" <brian.austin@cirrus.com>,
 "Paul.Handrigan@cirrus.com" <Paul.Handrigan@cirrus.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "broonie@kernel.org"
 <broonie@kernel.org>, "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com"
 <tiwai@suse.com>, "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Thread-Topic: [PATCH RESEND V3] ASoC: cs42xx8: add reset-gpio in binding
 document
Thread-Index: AQHVC9njdHFVpoMQJkaGKICvqNXQ+Q==
Date: Thu, 16 May 2019 11:24:12 +0000
Message-ID: <c2118efa4ee6c915473060405805e6c6c6db681f.1558005661.git.shengjiu.wang@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.21.0
x-clientproxiedby: HK0PR03CA0023.apcprd03.prod.outlook.com
 (2603:1096:203:2e::35) To VE1PR04MB6479.eurprd04.prod.outlook.com
 (2603:10a6:803:11e::16)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=shengjiu.wang@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ab6873ed-afa8-4ad8-01ee-08d6d9f1059b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR04MB6766; 
x-ms-traffictypediagnostic: VE1PR04MB6766:
x-microsoft-antispam-prvs: <VE1PR04MB67666A70FBA61614FB0AC262E30A0@VE1PR04MB6766.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 0039C6E5C5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(39860400002)(346002)(396003)(136003)(366004)(189003)(199004)(66066001)(2201001)(71190400001)(6486002)(305945005)(6506007)(386003)(36756003)(7736002)(5660300002)(86362001)(256004)(66946007)(99286004)(52116002)(6436002)(14444005)(476003)(486006)(66556008)(66476007)(64756008)(66446008)(2616005)(73956011)(6116002)(3846002)(478600001)(68736007)(6512007)(102836004)(2501003)(53936002)(8676002)(25786009)(8936002)(81156014)(50226002)(14454004)(81166006)(4326008)(316002)(118296001)(71200400001)(110136005)(2906002)(26005)(186003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR04MB6766;
 H:VE1PR04MB6479.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: OWHMZcPDtVaPFrYVdYy2dJ4RSA6rzDPyG+CnCrrUrpzy2w8IG+sGTLmYebleKSC8vJmJNyZ97GqxzfJ75IuRzyMLz/+UODAqstcCUUVlI2f7UEgvI949HtQwvnzJEuyWxNPYBJfzUYOvvGse40buYf2fhUvMV2zm4PbKXLlGonr6tLicfJr4GLu01s90d6CUIlT8k/trSfMyAovDubvIZYAfpeVtaLakkF7Ng8mzt69Y9IHG5hqSisKVcO9G9wyeV8zLapuJz5eKhJDvwiHjJ01Bu1FjlPU+1gP7a7zKVLuzAMn4SJRRlxQk9OyQ07uPvMBeNqauetTndIXn9ncKVX+UiOadchH84GHI9sGt4T07ZPRK/2G4O9cGMcFdZhli1Gotzeq0VSVgNeLA14jVmQMva/YHmcvBoe5J4u7ELmQ=
Content-ID: <B540429D4C6352488F3D67CDEADD7BBC@eurprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab6873ed-afa8-4ad8-01ee-08d6d9f1059b
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 May 2019 11:24:12.8371 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6766
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [alsa-devel] [PATCH RESEND V3] ASoC: cs42xx8: add reset-gpio in
	binding document
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

Add reset-gpio property, which is an optional option

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
Changes in RESEND v3
- send updated binding document only

Changes in v3
- update binding document.

Changes in v2
- use devm_gpiod_get_optional instead of of_get_named_gpio

 Documentation/devicetree/bindings/sound/cs42xx8.txt | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/cs42xx8.txt b/Documentation/devicetree/bindings/sound/cs42xx8.txt
index 8619a156d038..ab8f54095269 100644
--- a/Documentation/devicetree/bindings/sound/cs42xx8.txt
+++ b/Documentation/devicetree/bindings/sound/cs42xx8.txt
@@ -14,6 +14,11 @@ Required properties:
   - VA-supply, VD-supply, VLS-supply, VLC-supply: power supplies for the device,
     as covered in Documentation/devicetree/bindings/regulator/regulator.txt
 
+Optional properties:
+
+  - reset-gpio : a GPIO spec to define which pin is connected to the chip's
+    !RESET pin
+
 Example:
 
 cs42888: codec@48 {
@@ -25,4 +30,5 @@ cs42888: codec@48 {
 	VD-supply = <&reg_audio>;
 	VLS-supply = <&reg_audio>;
 	VLC-supply = <&reg_audio>;
+	reset-gpio = <&pca9557_b 1 1>;
 };
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
