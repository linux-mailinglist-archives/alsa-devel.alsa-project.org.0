Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A33381FF54
	for <lists+alsa-devel@lfdr.de>; Thu, 16 May 2019 08:06:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 308E016AC;
	Thu, 16 May 2019 08:05:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 308E016AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557986782;
	bh=GNYAD7fPstpNlszIecHZpxXCvjB4eSk1Imdrdb9LjZU=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=gqzlpf/Tn1j+/RGljFwqiDNdleLxTPv+zpQnUm0LeLK5caNW0GF98f8qZxHs7lkwh
	 sZK1jxlAxgO325MFJJE6sWnhIe/VS/gLmweHzj8Laejg/mSZnAH4mVcDfBezwe4/Uk
	 PoZul/B2+sUhqfWKQ593+JfqAejIGbxLksImfumg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 972B6F896B9;
	Thu, 16 May 2019 08:04:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1115EF8078F; Thu, 16 May 2019 08:04:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60067.outbound.protection.outlook.com [40.107.6.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 81657F8078F
 for <alsa-devel@alsa-project.org>; Thu, 16 May 2019 08:04:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81657F8078F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com
 header.b="PNXWJJbE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ljiq/1PTiA8Mr2syMDR+fu5fVN7nMjGs2Y3fxmRYdCE=;
 b=PNXWJJbED1I69b1aAK/wymFmeLJ4WzlySjQqXGCw9iTqHrLePyCC6O3e1UZgRtH0GjoMZ1eYuF+MUGuObz1s2+jbTApxWXc7zC2RDp2YAuiifiWW/kfQRDrlb9IuqvpA0ulMnJ//JVPi/lgbeqpepsbXMRP2UhJ4MsHh6Vyfp34=
Received: from VE1PR04MB6479.eurprd04.prod.outlook.com (20.179.233.80) by
 VE1PR04MB6527.eurprd04.prod.outlook.com (20.179.233.224) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.16; Thu, 16 May 2019 06:04:29 +0000
Received: from VE1PR04MB6479.eurprd04.prod.outlook.com
 ([fe80::a5b5:13f5:f89c:9a30]) by VE1PR04MB6479.eurprd04.prod.outlook.com
 ([fe80::a5b5:13f5:f89c:9a30%7]) with mapi id 15.20.1900.010; Thu, 16 May 2019
 06:04:29 +0000
From: "S.j. Wang" <shengjiu.wang@nxp.com>
To: "brian.austin@cirrus.com" <brian.austin@cirrus.com>,
 "Paul.Handrigan@cirrus.com" <Paul.Handrigan@cirrus.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "broonie@kernel.org"
 <broonie@kernel.org>, "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com"
 <tiwai@suse.com>, "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Thread-Topic: [PATCH] ASoC: cs42xx8: Add regcache mask dirty
Thread-Index: AQHVC605E7iIehgt5kyF+I4ocng7XA==
Date: Thu, 16 May 2019 06:04:29 +0000
Message-ID: <e6fb6598dd863b74241e10d14652d12fe701845d.1557986478.git.shengjiu.wang@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.21.0
x-clientproxiedby: HK0PR01CA0064.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::28) To VE1PR04MB6479.eurprd04.prod.outlook.com
 (2603:10a6:803:11e::16)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=shengjiu.wang@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0c244b77-d618-4694-4175-08d6d9c45bad
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR04MB6527; 
x-ms-traffictypediagnostic: VE1PR04MB6527:
x-microsoft-antispam-prvs: <VE1PR04MB65270C44C1438168BD617BE1E30A0@VE1PR04MB6527.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:376;
x-forefront-prvs: 0039C6E5C5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(346002)(396003)(39860400002)(376002)(136003)(199004)(189003)(6506007)(66066001)(386003)(36756003)(81156014)(81166006)(52116002)(68736007)(14454004)(71190400001)(305945005)(2501003)(2906002)(4744005)(26005)(99286004)(71200400001)(53936002)(8936002)(6512007)(4326008)(8676002)(102836004)(5660300002)(7736002)(256004)(14444005)(2616005)(6486002)(2201001)(86362001)(110136005)(476003)(3846002)(6116002)(50226002)(25786009)(316002)(6436002)(118296001)(478600001)(186003)(64756008)(66446008)(66946007)(66476007)(66556008)(73956011)(486006)(14143004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR04MB6527;
 H:VE1PR04MB6479.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: uIZLgW5BY0kjMyqwQQpOhpQri2X/dzBYfFmlMvT6UDOKnFoR69cmHbaalfWI1sX2JXDEUXvxV0t/HbXn2UUkwNIHaX8n/rtv+oqzuP/kMtjddpfK7eO1gZ66OJq5ApB+U01b2VMxPRh7s59EFLiVaoAdUbIjyoszz42mONf7UcDc3FERmoRxfcbsLRIXh9gqrXiOP4gsO+XGCP6Hadnq8UGF5mYZCde/LOvgnUn+3VY4H3O0t4C4aZdr6bRkDH0yNUiAU6B2Uh2T2KvVbDqz++vSFwI6z8EvSXchDyduKutqKs8rEOYlpuzyvheh4Gxnr3XF7K6SzOd3vcoK4UD9vI58x12uZbrU6JpdJKgQaghBaUk0h/Bw7uP9WRa1YZ7qHLnxUJL7KzcPXAlfhPgyNkjzWAu7Tjq98uf8R63cZpk=
Content-ID: <A4BAEF50433E494E9F020FFAEEF925DD@eurprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c244b77-d618-4694-4175-08d6d9c45bad
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 May 2019 06:04:29.8540 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6527
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [alsa-devel] [PATCH] ASoC: cs42xx8: Add regcache mask dirty
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

Add regcache_mark_dirty before regcache_sync for power
of codec may be lost at suspend, then all the register
need to be reconfigured.

Fixes: 0c516b4ff85c ("ASoC: cs42xx8: Add codec driver
support for CS42448/CS42888")
Cc: <stable@vger.kernel.org>
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/codecs/cs42xx8.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/cs42xx8.c b/sound/soc/codecs/cs42xx8.c
index ebb9e0cf8364..28a4ac36c4f8 100644
--- a/sound/soc/codecs/cs42xx8.c
+++ b/sound/soc/codecs/cs42xx8.c
@@ -558,6 +558,7 @@ static int cs42xx8_runtime_resume(struct device *dev)
 	msleep(5);
 
 	regcache_cache_only(cs42xx8->regmap, false);
+	regcache_mark_dirty(cs42xx8->regmap);
 
 	ret = regcache_sync(cs42xx8->regmap);
 	if (ret) {
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
