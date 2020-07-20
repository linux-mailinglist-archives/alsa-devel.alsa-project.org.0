Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C7946226E1A
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jul 2020 20:14:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6988D1665;
	Mon, 20 Jul 2020 20:14:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6988D1665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595268895;
	bh=Ws3I8aIOahjdO7sI9GVkTH71vRV27xHdSz6hogjODMQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=okoHD0Ai3PfvZIQSjD9V4UHiQBxN63LB7jhmSuNoQZGoLrlUyyQqiJ1x6CeB9bv03
	 gNi3mRy972WZa+AFej0h8VuOrd1j9iUYJqYJRi8LTZNPapsRSKF1l1kvzwvd9Xx42H
	 lsKxDN+v5LtGwEsCNSkdxLNDCzahf6U4afB2TrTE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B1DF7F8015A;
	Mon, 20 Jul 2020 20:12:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E5BAAF8014C; Mon, 20 Jul 2020 20:12:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 41FABF800CE
 for <alsa-devel@alsa-project.org>; Mon, 20 Jul 2020 20:12:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 41FABF800CE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="kMmJlhlJ"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 06KICESd057699;
 Mon, 20 Jul 2020 13:12:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1595268734;
 bh=7tyvgaL+fW83SAUmCUViLrsnXQp4Obzw1ixykaV8ISI=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=kMmJlhlJy1WGDQkBsH0rhk1gjbXR46eDnqxStJo9yR8e4XCwYmGToZAVzASCBP1ap
 Zwj8fcEuBSfB/3IQDcbdF9NkrjPeF52a626LqwoKSRehTDiA4uIhQBdUQaBVHwieZk
 VPR3y0MW1Qc98QUs6Vm/0vqk5piLefkipNQiQux0=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 06KICE8Q091024;
 Mon, 20 Jul 2020 13:12:14 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 20
 Jul 2020 13:12:14 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 20 Jul 2020 13:12:14 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 06KICEuK064305;
 Mon, 20 Jul 2020 13:12:14 -0500
From: Dan Murphy <dmurphy@ti.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>
Subject: [PATCH v3 2/2] ASoC: tas2770: Fix reset gpio property name
Date: Mon, 20 Jul 2020 13:12:02 -0500
Message-ID: <20200720181202.31000-2-dmurphy@ti.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200720181202.31000-1-dmurphy@ti.com>
References: <20200720181202.31000-1-dmurphy@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Dan Murphy <dmurphy@ti.com>
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

Fix the reset property name when allocating the GPIO descriptor.
The gpiod_get_optional appends either the -gpio or -gpios suffix to the
name.

Fixes: 1a476abc723e6 ("tas2770: add tas2770 smart PA kernel driver")
Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 sound/soc/codecs/tas2770.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/codecs/tas2770.c b/sound/soc/codecs/tas2770.c
index 4538b2d0216f..1eb9b77439eb 100644
--- a/sound/soc/codecs/tas2770.c
+++ b/sound/soc/codecs/tas2770.c
@@ -759,8 +759,7 @@ static int tas2770_i2c_probe(struct i2c_client *client,
 		}
 	}
 
-	tas2770->reset_gpio = devm_gpiod_get_optional(tas2770->dev,
-							  "reset-gpio",
+	tas2770->reset_gpio = devm_gpiod_get_optional(tas2770->dev, "reset",
 						      GPIOD_OUT_HIGH);
 	if (IS_ERR(tas2770->reset_gpio)) {
 		if (PTR_ERR(tas2770->reset_gpio) == -EPROBE_DEFER) {
-- 
2.27.0

