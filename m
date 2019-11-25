Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EAF5108AAF
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Nov 2019 10:21:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 88BD0189D;
	Mon, 25 Nov 2019 10:21:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 88BD0189D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574673711;
	bh=nl4w9rypSShs2+i/AyOXTLJtdF3aeDm6IC3O7iW3wKk=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Cy3KzbmUowo4SqXjV9J9CExWvU2Nw5tpsd+Bic1at/LVW6TJ34WNlleZX28CMUv0Z
	 PRaLn8nGkA2/K7bnTThJAvB7H7bEY1Hhyk6WAYr981w0PlDozuasfRnoahMhVwo30t
	 SPAOGxjeCr9QTydiaQwUjfWuRUFX12eIERniJe40=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6BDD1F8019B;
	Mon, 25 Nov 2019 10:20:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0F76BF8016F; Mon, 25 Nov 2019 10:20:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E64C5F800AB
 for <alsa-devel@alsa-project.org>; Mon, 25 Nov 2019 10:19:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E64C5F800AB
Authenticated-By: 
X-SpamFilter-By: BOX Solutions SpamTrap 5.62 with qID xAP9JoDx008601,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (RTITCASV01.realtek.com.tw[172.21.6.18])
 by rtits2.realtek.com.tw (8.15.2/2.57/5.78) with ESMTPS id xAP9JoDx008601
 (version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 25 Nov 2019 17:19:50 +0800
Received: from localhost.localdomain (172.22.102.1) by
 RTITCASV01.realtek.com.tw (172.21.6.18) with Microsoft SMTP Server id
 14.3.468.0; Mon, 25 Nov 2019 17:19:49 +0800
From: <shumingf@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Date: Mon, 25 Nov 2019 17:19:40 +0800
Message-ID: <20191125091940.11953-1-shumingf@realtek.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
X-Originating-IP: [172.22.102.1]
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, Shuming Fan <shumingf@realtek.com>, albertchen@realtek.com,
 derek.fang@realtek.com, sathya.prakash.m.r@intel.com, flove@realtek.com
Subject: [alsa-devel] [PATCH] ASoC: rt5682: fix i2c arbitration lost issue
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

This patch modified the HW initial setting to fix i2c arbitration lost issue.

Signed-off-by: Shuming Fan <shumingf@realtek.com>
---
 sound/soc/codecs/rt5682.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/rt5682.c b/sound/soc/codecs/rt5682.c
index b1713fffa3eb..ae6f6121bc1b 100644
--- a/sound/soc/codecs/rt5682.c
+++ b/sound/soc/codecs/rt5682.c
@@ -73,6 +73,7 @@ struct rt5682_priv {
 static const struct reg_sequence patch_list[] = {
 	{RT5682_HP_IMP_SENS_CTRL_19, 0x1000},
 	{RT5682_DAC_ADC_DIG_VOL1, 0xa020},
+	{RT5682_I2C_CTRL, 0x000f},
 };
 
 static const struct reg_default rt5682_reg[] = {
@@ -2474,6 +2475,7 @@ static void rt5682_calibrate(struct rt5682_priv *rt5682)
 	mutex_lock(&rt5682->calibrate_mutex);
 
 	rt5682_reset(rt5682->regmap);
+	regmap_write(rt5682->regmap, RT5682_I2C_CTRL, 0x000f);
 	regmap_write(rt5682->regmap, RT5682_PWR_ANLG_1, 0xa2af);
 	usleep_range(15000, 20000);
 	regmap_write(rt5682->regmap, RT5682_PWR_ANLG_1, 0xf2af);
-- 
2.24.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
