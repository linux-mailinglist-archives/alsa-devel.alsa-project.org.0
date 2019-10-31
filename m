Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C1EFEAFF7
	for <lists+alsa-devel@lfdr.de>; Thu, 31 Oct 2019 13:14:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 06F0420C7;
	Thu, 31 Oct 2019 13:13:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 06F0420C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572524080;
	bh=VbLj43p+fpL8jFd/uQrjkjsG++z0cw1xEUS3fytXD98=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fe88J+aihYtLaEl4nJzx5HCH/j1daWu6ucWOzpgwWam3ybj1VAPzFg/ArLEN1Z2sY
	 SPd12srCH6R8YbnLvAW4YOrDOrTiHojFsNR/I7qzxvl+qVrPyzR+T4iZCTZxNnEQT1
	 ntsF8XQWXxE0dADezDUPB4ThzrKwjg3t58GJXI1M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 996FAF80600;
	Thu, 31 Oct 2019 13:12:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2804FF8015A; Thu, 31 Oct 2019 13:05:02 +0100 (CET)
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E8FC9F8044B
 for <alsa-devel@alsa-project.org>; Thu, 31 Oct 2019 12:54:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8FC9F8044B
Authenticated-By: 
X-SpamFilter-By: BOX Solutions SpamTrap 5.62 with qID x9VBspv3002015,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (RTITCAS11.realtek.com.tw[172.21.6.12])
 by rtits2.realtek.com.tw (8.15.2/2.57/5.78) with ESMTPS id x9VBspv3002015
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 31 Oct 2019 19:54:51 +0800
Received: from localhost.localdomain (172.22.102.1) by
 RTITCAS11.realtek.com.tw (172.21.6.12) with Microsoft SMTP Server id
 14.3.468.0; Thu, 31 Oct 2019 19:54:50 +0800
From: <shumingf@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Date: Thu, 31 Oct 2019 19:54:46 +0800
Message-ID: <20191031115446.21108-1-shumingf@realtek.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Originating-IP: [172.22.102.1]
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, tzungbi@google.com, derek.fang@realtek.com,
 Shuming Fan <shumingf@realtek.com>, flove@realtek.com
Subject: [alsa-devel] [PATCH 5/5] ASoC: rt1011: some minor changes to
	improve readability
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

There is no other code use the RT1011_INIT_REG_LEN definition,
except rt1011_reg_init().
Hence, we remove it and fix the typo.

Signed-off-by: Shuming Fan <shumingf@realtek.com>
---
 sound/soc/codecs/rt1011.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/rt1011.c b/sound/soc/codecs/rt1011.c
index f2c581b66d32..2552073e54ce 100644
--- a/sound/soc/codecs/rt1011.c
+++ b/sound/soc/codecs/rt1011.c
@@ -61,7 +61,6 @@ static const struct reg_sequence init_list[] = {
 	{ RT1011_DAC_SET_1, 0xe702 },
 	{ RT1011_DAC_SET_3, 0x2004 },
 };
-#define RT1011_INIT_REG_LEN ARRAY_SIZE(init_list)
 
 static const struct reg_default rt1011_reg[] = {
 	{0x0000, 0x0000},
@@ -684,7 +683,8 @@ static int rt1011_reg_init(struct snd_soc_component *component)
 {
 	struct rt1011_priv *rt1011 = snd_soc_component_get_drvdata(component);
 
-	regmap_multi_reg_write(rt1011->regmap, init_list, RT1011_INIT_REG_LEN);
+	regmap_multi_reg_write(rt1011->regmap,
+		init_list, ARRAY_SIZE(init_list));
 	return 0;
 }
 
@@ -1773,7 +1773,8 @@ static int rt1011_set_component_pll(struct snd_soc_component *component,
 
 	ret = rl6231_pll_calc(freq_in, freq_out, &pll_code);
 	if (ret < 0) {
-		dev_err(component->dev, "Unsupport input clock %d\n", freq_in);
+		dev_err(component->dev, "Unsupported input clock %d\n",
+			freq_in);
 		return ret;
 	}
 
@@ -2384,7 +2385,7 @@ static int rt1011_i2c_probe(struct i2c_client *i2c,
 
 	rt1011 = devm_kzalloc(&i2c->dev, sizeof(struct rt1011_priv),
 				GFP_KERNEL);
-	if (rt1011 == NULL)
+	if (!rt1011)
 		return -ENOMEM;
 
 	i2c_set_clientdata(i2c, rt1011);
-- 
2.23.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
