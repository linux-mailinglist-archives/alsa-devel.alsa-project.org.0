Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 125652127B
	for <lists+alsa-devel@lfdr.de>; Fri, 17 May 2019 05:24:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 78E3D16B4;
	Fri, 17 May 2019 05:23:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 78E3D16B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558063453;
	bh=O0ot2fvw0+T5NtsFWznp8wLnWEg2jxXz6fo9sbaxi7Q=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=q8AaNcKarHynY0A3MKB02MW2ywjxHHsB5Lk2Ey7jcCqf2mwINGSy2YOAR/QZOY7Yw
	 MdH6yP3WGeKJo1R6oqU+/7NraLl58gNyj+PRlUGIaB2efkc9JyWerAB8pZkCaZCs2z
	 QpL6M6DhbGbIDTqhG88es98E9KrumHVFVzzb4CUc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 908A6F89700;
	Fri, 17 May 2019 05:22:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 72760F896B2; Fri, 17 May 2019 05:22:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150055.outbound.protection.outlook.com [40.107.15.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4C3C2F89684
 for <alsa-devel@alsa-project.org>; Fri, 17 May 2019 05:22:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4C3C2F89684
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com
 header.b="iMEg2Y0p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KZm7lWpJjhDmiQ7fwwrYZcKVGp4JO1oOfZKBIfTUZQM=;
 b=iMEg2Y0pgVgzgzrl7w4c0Y59sPFVuxWAzg6hB7aqRZEiXDEq2tfNJq6OELofG9wR0UVjaeCIUw3/DXTABY/AV2ZxHyJ4XPYuO3FEFC+U79UHCLBaJdz0M6iKOC+4bFgXmHGjngqVHIySAfN4E5NsjZrfJMgyfy7P60tTdGZo2sc=
Received: from VE1PR04MB6479.eurprd04.prod.outlook.com (20.179.233.80) by
 VE1PR04MB6640.eurprd04.prod.outlook.com (20.179.235.83) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.16; Fri, 17 May 2019 03:22:48 +0000
Received: from VE1PR04MB6479.eurprd04.prod.outlook.com
 ([fe80::a5b5:13f5:f89c:9a30]) by VE1PR04MB6479.eurprd04.prod.outlook.com
 ([fe80::a5b5:13f5:f89c:9a30%7]) with mapi id 15.20.1900.010; Fri, 17 May 2019
 03:22:48 +0000
From: "S.j. Wang" <shengjiu.wang@nxp.com>
To: "brian.austin@cirrus.com" <brian.austin@cirrus.com>,
 "Paul.Handrigan@cirrus.com" <Paul.Handrigan@cirrus.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "broonie@kernel.org"
 <broonie@kernel.org>, "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com"
 <tiwai@suse.com>, "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Thread-Topic: [PATCH V2] ASoC: cs42xx8: Add regcache mask dirty
Thread-Index: AQHVDF/NkmTtx09i40uM0x+rPzELzg==
Date: Fri, 17 May 2019 03:22:48 +0000
Message-ID: <a81cd72c3356768df70d6ae052a48a5f92e41ce5.1558063199.git.shengjiu.wang@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.21.0
x-clientproxiedby: HK0PR03CA0080.apcprd03.prod.outlook.com
 (2603:1096:203:72::20) To VE1PR04MB6479.eurprd04.prod.outlook.com
 (2603:10a6:803:11e::16)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=shengjiu.wang@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6711de96-fe39-4cbd-4358-08d6da76efb2
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR04MB6640; 
x-ms-traffictypediagnostic: VE1PR04MB6640:
x-microsoft-antispam-prvs: <VE1PR04MB6640A341695C8DF96BB522AEE30B0@VE1PR04MB6640.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:248;
x-forefront-prvs: 0040126723
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(376002)(396003)(366004)(136003)(346002)(199004)(189003)(66446008)(186003)(102836004)(6506007)(386003)(486006)(6512007)(99286004)(316002)(14454004)(66476007)(476003)(2616005)(6436002)(25786009)(64756008)(66946007)(26005)(66556008)(118296001)(110136005)(68736007)(52116002)(73956011)(66066001)(81166006)(2906002)(2501003)(305945005)(7736002)(53936002)(50226002)(6486002)(6116002)(36756003)(5660300002)(8936002)(3846002)(81156014)(478600001)(2201001)(256004)(14444005)(4744005)(4326008)(86362001)(71190400001)(8676002)(71200400001)(14143004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR04MB6640;
 H:VE1PR04MB6479.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: QQxMXvtmcUolt8215P/YhdmJfjd3PtMFr9y7RwoOdmWJRDYXHnVtSb/ZytteY80daT3EoPGvD/paoVN/2IXVkxTX83I2SL1GxSK41aJbkAZPQl+3LO6ajWK+JxeZzz8tWfED0xb4ikSbzzuxtbTFw5KircgGD+YSqfPCsAOdgGKnnCEzTxSDLCIpxSkd1UXmphwnPOUC3inJ4Ns/H+KHOXijckq1x23v45mjX/6l6bOa4tCHRJRLciIOi2OcFbqGrMezl73MyV5JODyB0Vj3nG87H1S5d4CUSV2opYpHCu9dvRfsH6b6EG5qBL4ZQWLWe75wvJGrHoxEc36zupva07sruis4wwqj+RulROt7X3RffM36EmJTmX3TJuyKA9/AlKWmJt20jKaNxLCOY0pYo66Jih7qjx+qGgQdMbhOkSI=
Content-ID: <778F5B7AE505E94CBE4D7E1A85E36435@eurprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6711de96-fe39-4cbd-4358-08d6da76efb2
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2019 03:22:48.6244 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6640
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [alsa-devel] [PATCH V2] ASoC: cs42xx8: Add regcache mask dirty
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

Fixes: 0c516b4ff85c ("ASoC: cs42xx8: Add codec driver support for CS42448/CS42888")
Cc: <stable@vger.kernel.org>
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
Changs in V2
- Don't split Fixes tag.

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
