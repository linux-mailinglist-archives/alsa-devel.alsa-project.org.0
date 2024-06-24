Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FDFF91DF39
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Jul 2024 14:28:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4BECA279C;
	Mon,  1 Jul 2024 14:28:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4BECA279C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719836903;
	bh=v4pEOq2KyOczU7HAYfd6jAGUPqtbLowFOyH3Gcsf68k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QCHLzt5gtWIUqdQCJC8+IpxC2WJJZeUn3iVaKhpjj2MV0vgnlxZeZ57vS2/vcDmAH
	 CvQfaL1OdLxQxenGzl9GwTbgTK/8ej1Hejrhl/epDShjIAtzga+cLLRpaM59JmAsvb
	 jURx/HYLZXmby70+P7jSHWsn21y+zT6mPs/h4roA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 963B9F897F7; Mon,  1 Jul 2024 14:21:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 369A1F897D5;
	Mon,  1 Jul 2024 14:21:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5713EF804F2; Mon, 24 Jun 2024 05:06:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0
	tests=RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail78-63.sinamail.sina.com.cn (mail78-63.sinamail.sina.com.cn
 [219.142.78.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4C20AF80495
	for <alsa-devel@alsa-project.org>; Mon, 24 Jun 2024 05:06:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4C20AF80495
Received: from unknown (HELO zy-virtual-machine.localdomain)([116.227.101.59])
	by sina.net (10.75.30.239) with ESMTP
	id 6678E2A10002B8DA; Mon, 24 Jun 2024 11:06:15 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: 3E50B45B19E54113901157FF9F7EC4AC
X-SMAIL-UIID: 3E50B45B19E54113901157FF9F7EC4AC-20240624-110615
From: Zhang Yi <zhangyi@everest-semi.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Cc: tiwai@suse.com,
	amadeuszx.slawinski@linux.intel.com,
	yangxiaohua@everest-semi.com,
	zhuning@everest-semi.com,
	zhangyi@everest-semi.com
Subject: [PATCH 3/4] ASoC: codecs: ES8326: Minimize the pop noise
Date: Mon, 24 Jun 2024 11:06:06 +0800
Message-Id: <20240624030607.4307-4-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240624030607.4307-1-zhangyi@everest-semi.com>
References: <20240624030607.4307-1-zhangyi@everest-semi.com>
X-MailFrom: zhangyi@everest-semi.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: ANTSRAFWE4IVZL4SGNA5GVYVVDF2TNYM
X-Message-ID-Hash: ANTSRAFWE4IVZL4SGNA5GVYVVDF2TNYM
X-Mailman-Approved-At: Mon, 01 Jul 2024 12:21:21 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ANTSRAFWE4IVZL4SGNA5GVYVVDF2TNYM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Executing regcache_sync at initialization, we can hear a gentle pop
noise. So we created es8326_init for initialization instead of
executing es8326_resume

Signed-off-by: Zhang Yi <zhangyi@everest-semi.com>
---
 sound/soc/codecs/es8326.c | 31 ++++++++++++++++++++++++-------
 1 file changed, 24 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/es8326.c b/sound/soc/codecs/es8326.c
index 95bf751d8bab..4f10ab5394ec 100755
--- a/sound/soc/codecs/es8326.c
+++ b/sound/soc/codecs/es8326.c
@@ -950,14 +950,10 @@ static int es8326_calibrate(struct snd_soc_component *component)
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
@@ -1013,7 +1009,6 @@ static int es8326_resume(struct snd_soc_component *component)
 	regmap_update_bits(es8326->regmap, ES8326_ANA_MICBIAS, 0x0C, 0x0C);
 	usleep_range(50000, 70000);
 	regmap_update_bits(es8326->regmap, ES8326_HPDET_TYPE, 0x03, 0x00);
-	regmap_write(es8326->regmap, ES8326_INT_SOURCE, ES8326_INT_SRC_PIN9);
 	regmap_write(es8326->regmap, ES8326_INTOUT_IO,
 		     es8326->interrupt_clk);
 	regmap_write(es8326->regmap, ES8326_SDINOUT1_IO,
@@ -1029,6 +1024,28 @@ static int es8326_resume(struct snd_soc_component *component)
 			   ES8326_MUTE);
 
 	regmap_write(es8326->regmap, ES8326_ADC_MUTE, 0x0f);
+	regmap_write(es8326->regmap, ES8326_CLK_DIV_LRCK, 0xff);
+
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
 
 	es8326_irq(es8326->irq, es8326);
 	return 0;
@@ -1088,7 +1105,7 @@ static int es8326_probe(struct snd_soc_component *component)
 	}
 	dev_dbg(component->dev, "interrupt-clk %x", es8326->interrupt_clk);
 
-	es8326_resume(component);
+	es8326_init(component);
 	return 0;
 }
 
-- 
2.17.1

