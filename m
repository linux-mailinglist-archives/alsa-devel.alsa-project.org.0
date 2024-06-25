Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F1C791DF49
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Jul 2024 14:30:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C48E421B4;
	Mon,  1 Jul 2024 14:30:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C48E421B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719837036;
	bh=hD9Ab+HfXfGOvAqBWF5s8fwCb2tGmr7wdoyYaduMs0Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Z6XJOgcuVQkbb1ZPXxYrQJLDUufcjnGq9ULo9UTl1n8+xzjA5IGxiUpcT6z3FvBLA
	 vkjsxhHMl9ufPkei0r9//HHROcnYoMJqK9aXU/fuIGaEOeUlbCAgldak2G20mdYAvf
	 nOrxWDu/kYU8l78QOSce4oEwQd8beyqKBcbY0VoU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8F190F898BE; Mon,  1 Jul 2024 14:22:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 00BB4F898C7;
	Mon,  1 Jul 2024 14:22:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 42369F804D6; Tue, 25 Jun 2024 10:46:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail78-63.sinamail.sina.com.cn (mail78-63.sinamail.sina.com.cn
 [219.142.78.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 08A2FF8049C
	for <alsa-devel@alsa-project.org>; Tue, 25 Jun 2024 10:41:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 08A2FF8049C
Received: from unknown (HELO zy-virtual-machine.localdomain)([116.227.101.59])
	by sina.net (10.75.30.239) with ESMTP
	id 667A82A40003052C; Tue, 25 Jun 2024 16:41:13 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: 9CC450839B4B46AD9B1EFC86151FA016
X-SMAIL-UIID: 9CC450839B4B46AD9B1EFC86151FA016-20240625-164113
From: Zhang Yi <zhangyi@everest-semi.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Cc: tiwai@suse.com,
	amadeuszx.slawinski@linux.intel.com,
	yangxiaohua@everest-semi.com,
	zhuning@everest-semi.com,
	zhangyi@everest-semi.com
Subject: [PATCH v1 3/4] ASoC: codecs: ES8326: Minimize the pop noise
Date: Tue, 25 Jun 2024 16:41:06 +0800
Message-Id: <20240625084107.3177-4-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240625084107.3177-1-zhangyi@everest-semi.com>
References: <20240625084107.3177-1-zhangyi@everest-semi.com>
X-MailFrom: zhangyi@everest-semi.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: P62QN4QXSJUHA5YRNCYSBAJYYGRRV3MA
X-Message-ID-Hash: P62QN4QXSJUHA5YRNCYSBAJYYGRRV3MA
X-Mailman-Approved-At: Mon, 01 Jul 2024 12:21:45 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/P62QN4QXSJUHA5YRNCYSBAJYYGRRV3MA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Executing regcache_sync at initialization time, we can hear a pop noise.
So we created es8326_init instead of executing es8326_resume

Signed-off-by: Zhang Yi <zhangyi@everest-semi.com>
---
 sound/soc/codecs/es8326.c | 31 ++++++++++++++++++++++++-------
 1 file changed, 24 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/es8326.c b/sound/soc/codecs/es8326.c
index e103ba5405b4..51ca17b779c2 100755
--- a/sound/soc/codecs/es8326.c
+++ b/sound/soc/codecs/es8326.c
@@ -975,14 +975,10 @@ static int es8326_calibrate(struct snd_soc_component *component)
 	return 0;
 }
 
-static int es8326_resume(struct snd_soc_component *component)
+static void es8326_init(struct snd_soc_component *component)
 {
 	struct es8326_priv *es8326 = snd_soc_component_get_drvdata(component);
 
-	regcache_cache_only(es8326->regmap, false);
-	regcache_sync(es8326->regmap);
-
-	/* reset internal clock state */
 	regmap_write(es8326->regmap, ES8326_RESET, 0x1f);
 	regmap_write(es8326->regmap, ES8326_VMIDSEL, 0x0E);
 	regmap_write(es8326->regmap, ES8326_ANA_LP, 0xf0);
@@ -1038,7 +1034,6 @@ static int es8326_resume(struct snd_soc_component *component)
 	es8326_enable_micbias(es8326->component);
 	usleep_range(50000, 70000);
 	regmap_update_bits(es8326->regmap, ES8326_HPDET_TYPE, 0x03, 0x00);
-	regmap_write(es8326->regmap, ES8326_INT_SOURCE, ES8326_INT_SRC_PIN9);
 	regmap_write(es8326->regmap, ES8326_INTOUT_IO,
 		     es8326->interrupt_clk);
 	regmap_write(es8326->regmap, ES8326_SDINOUT1_IO,
@@ -1054,8 +1049,30 @@ static int es8326_resume(struct snd_soc_component *component)
 			   ES8326_MUTE);
 
 	regmap_write(es8326->regmap, ES8326_ADC_MUTE, 0x0f);
+	regmap_write(es8326->regmap, ES8326_CLK_DIV_LRCK, 0xff);
 	es8326_disable_micbias(es8326->component);
 
+	msleep(200);
+	regmap_write(es8326->regmap, ES8326_INT_SOURCE, ES8326_INT_SRC_PIN9);
+}
+
+static int es8326_resume(struct snd_soc_component *component)
+{
+	struct es8326_priv *es8326 = snd_soc_component_get_drvdata(component);
+	unsigned int reg;
+
+	regcache_cache_only(es8326->regmap, false);
+	regcache_cache_bypass(es8326->regmap, true);
+	regmap_read(es8326->regmap, ES8326_CLK_RESAMPLE, &reg);
+	regcache_cache_bypass(es8326->regmap, false);
+	/* reset internal clock state */
+	if (reg == 0x05)
+		regmap_write(es8326->regmap, ES8326_CLK_CTL, ES8326_CLK_ON);
+	else
+		es8326_init(component);
+
+	regcache_sync(es8326->regmap);
+
 	es8326_irq(es8326->irq, es8326);
 	return 0;
 }
@@ -1114,7 +1131,7 @@ static int es8326_probe(struct snd_soc_component *component)
 	}
 	dev_dbg(component->dev, "interrupt-clk %x", es8326->interrupt_clk);
 
-	es8326_resume(component);
+	es8326_init(component);
 	return 0;
 }
 
-- 
2.17.1

