Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A37176E107
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Jul 2019 08:34:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DCFD11691;
	Fri, 19 Jul 2019 08:33:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DCFD11691
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563518086;
	bh=bedX+gy8tLz4AtBi8QxV9D0oBVV2MEZuatVtnATFCaA=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=pXaFTpqyNVjRdbURbDic9ma/VPUTWdGzTSjnpXZxWs9mELMp9E9Eww50F833Kv6kH
	 izI1oKAvs12+ydk14/LxV06HGgxigf61N3sUVmyJ4aQmePvKlCQ7vfHaNz9DY8WtUL
	 WJLHFRahnGttmEd0zju0E9aNNtvgr1YXDKRkmd7E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C9D38F8015B;
	Fri, 19 Jul 2019 08:33:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1576DF80363; Fri, 19 Jul 2019 08:32:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9A633F8015B
 for <alsa-devel@alsa-project.org>; Fri, 19 Jul 2019 08:32:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A633F8015B
Authenticated-By: 
X-SpamFilter-By: BOX Solutions SpamTrap 5.62 with qID x6J6WglQ016054,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (RTITCASV01.realtek.com.tw[172.21.6.18])
 by rtits2.realtek.com.tw (8.15.2/2.57/5.78) with ESMTPS id x6J6WglQ016054
 (version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 19 Jul 2019 14:32:42 +0800
Received: from localhost.localdomain (172.22.102.1) by
 RTITCASV01.realtek.com.tw (172.21.6.18) with Microsoft SMTP Server id
 14.3.439.0; Fri, 19 Jul 2019 14:32:42 +0800
From: <shumingf@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Date: Fri, 19 Jul 2019 14:32:35 +0800
Message-ID: <20190719063235.18757-1-shumingf@realtek.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-Originating-IP: [172.22.102.1]
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, derek.fang@realtek.com, Shuming Fan <shumingf@realtek.com>,
 flove@realtek.com
Subject: [alsa-devel] [PATCH 1/3] ASoC: rt1308: simplify the EFUSE read
	function
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

From: Shuming Fan <shumingf@realtek.com>

The rt1308_efuse function contains many redundant settings.
We remove the redundant settings and the function still works.

Signed-off-by: Shuming Fan <shumingf@realtek.com>
---
 sound/soc/codecs/rt1308.c | 22 ----------------------
 1 file changed, 22 deletions(-)

diff --git a/sound/soc/codecs/rt1308.c b/sound/soc/codecs/rt1308.c
index d673506c7c39..19d255e01827 100644
--- a/sound/soc/codecs/rt1308.c
+++ b/sound/soc/codecs/rt1308.c
@@ -808,33 +808,11 @@ static void rt1308_efuse(struct rt1308_priv *rt1308)
 {
 	regmap_write(rt1308->regmap, RT1308_RESET, 0);
 
-	regmap_write(rt1308->regmap, RT1308_POWER, 0xff371600);
-	regmap_write(rt1308->regmap, RT1308_CLK_1, 0x52100000);
-	regmap_write(rt1308->regmap, RT1308_I2C_I2S_SDW_SET, 0x01014005);
-	regmap_write(rt1308->regmap, RT1308_CLASS_D_SET_2, 0x227f5501);
-	regmap_write(rt1308->regmap, RT1308_PADS_1, 0x50150505);
-	regmap_write(rt1308->regmap, RT1308_VREF, 0x18100000);
-	regmap_write(rt1308->regmap, RT1308_IV_SENSE, 0x87010000);
-	regmap_write(rt1308->regmap, RT1308_DUMMY_REG, 0x00000200);
-	regmap_write(rt1308->regmap, RT1308_SIL_DET, 0x61c30000);
-	regmap_write(rt1308->regmap, RT1308_CLK_DET, 0x03700000);
-	regmap_write(rt1308->regmap, RT1308_SINE_TONE_GEN_1, 0x50022f00);
 	regmap_write(rt1308->regmap, RT1308_POWER_STATUS, 0x01800000);
-	regmap_write(rt1308->regmap, RT1308_DC_CAL_2, 0x00ffff00);
-	regmap_write(rt1308->regmap, RT1308_CLASS_D_SET_2, 0x607e5501);
-
-	regmap_write(rt1308->regmap, RT1308_CLK_2, 0x0060e000);
-	regmap_write(rt1308->regmap, RT1308_EFUSE_1, 0x04fe0f00);
 	msleep(100);
 	regmap_write(rt1308->regmap, RT1308_EFUSE_1, 0x44fe0f00);
 	msleep(20);
 	regmap_write(rt1308->regmap, RT1308_PVDD_OFFSET_CTL, 0x10000000);
-
-	regmap_write(rt1308->regmap, RT1308_POWER_STATUS, 0x00800000);
-	regmap_write(rt1308->regmap, RT1308_POWER, 0x0);
-	regmap_write(rt1308->regmap, RT1308_CLK_1, 0x52000000);
-	regmap_write(rt1308->regmap, RT1308_CLASS_D_SET_2, 0x227f5501);
-	regmap_write(rt1308->regmap, RT1308_SINE_TONE_GEN_1, 0x10022f00);
 }
 
 static int rt1308_i2c_probe(struct i2c_client *i2c,
-- 
2.22.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
