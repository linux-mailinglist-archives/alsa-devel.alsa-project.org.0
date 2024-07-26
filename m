Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F2D942981
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Jul 2024 10:47:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B6B66231B;
	Wed, 31 Jul 2024 10:47:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B6B66231B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722415663;
	bh=swHYojslKRZrYvYSpfXsgW3+8SF1RW/G017862frP0k=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Tm43u3BdvdBpMSGBjc8G90iuUDeNer4hoc0ixFiQVvzMN6gJAPoA867O3sneuDqr8
	 WJ2s3aZ4p91Rh7SngTfMbxgpRZofTuKr4BVDQLv/g+IuA1X4M/HFPXgETX/edmH7re
	 /GSs2ssBxZci7GEU6j54tdGo1o0nJARagIwZxPGo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2ADF2F805AC; Wed, 31 Jul 2024 10:47:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5F4E9F805B1;
	Wed, 31 Jul 2024 10:47:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AF5E4F8026D; Fri, 26 Jul 2024 05:10:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp134-79.sina.com.cn (smtp134-79.sina.com.cn
 [180.149.134.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 014E4F8013D
	for <alsa-devel@alsa-project.org>; Fri, 26 Jul 2024 05:10:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 014E4F8013D
Received: from unknown (HELO zy-virtual-machine.localdomain)([180.158.30.43])
	by sina.net (10.185.250.29) with ESMTP
	id 66A3138700005ABC; Fri, 26 Jul 2024 11:10:01 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: 67593C547E44403DAA068D793FFD423A
X-SMAIL-UIID: 67593C547E44403DAA068D793FFD423A-20240726-111001
From: Zhang Yi <zhangyi@everest-semi.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Cc: tiwai@suse.com,
	amadeuszx.slawinski@linux.intel.com,
	yangxiaohua@everest-semi.com,
	zhuning@everest-semi.com,
	zhangyi@everest-semi.com
Subject: [RESEND] ASoC: codecs: ES8326: suspend issue
Date: Fri, 26 Jul 2024 11:10:02 +0800
Message-Id: <20240726031002.35055-1-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
X-MailFrom: zhangyi@everest-semi.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: KJIFHACCUDKGTS5FXQA3XPNLPU2RENAV
X-Message-ID-Hash: KJIFHACCUDKGTS5FXQA3XPNLPU2RENAV
X-Mailman-Approved-At: Wed, 31 Jul 2024 08:47:05 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KJIFHACCUDKGTS5FXQA3XPNLPU2RENAV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

We find that we need to disable micbias for the codec to enter suspend
So We modify the trigger conditions for enable_micbias and disable_micbias

Signed-off-by: Zhang Yi <zhangyi@everest-semi.com>
---
 sound/soc/codecs/es8326.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/es8326.c b/sound/soc/codecs/es8326.c
index b246694ebb4f..60877116c0ef 100755
--- a/sound/soc/codecs/es8326.c
+++ b/sound/soc/codecs/es8326.c
@@ -805,6 +805,7 @@ static void es8326_jack_button_handler(struct work_struct *work)
 				    SND_JACK_BTN_0 | SND_JACK_BTN_1 | SND_JACK_BTN_2);
 			button_to_report = 0;
 		}
+		es8326_disable_micbias(es8326->component);
 	}
 	mutex_unlock(&es8326->lock);
 }
@@ -878,7 +879,6 @@ static void es8326_jack_detect_handler(struct work_struct *work)
 			regmap_write(es8326->regmap, ES8326_INT_SOURCE, 0x00);
 			regmap_update_bits(es8326->regmap, ES8326_HPDET_TYPE, 0x03, 0x01);
 			regmap_update_bits(es8326->regmap, ES8326_HPDET_TYPE, 0x10, 0x00);
-			es8326_enable_micbias(es8326->component);
 			usleep_range(50000, 70000);
 			regmap_update_bits(es8326->regmap, ES8326_HPDET_TYPE, 0x03, 0x00);
 			regmap_update_bits(es8326->regmap, ES8326_HPDET_TYPE, 0x10, 0x10);
@@ -897,6 +897,7 @@ static void es8326_jack_detect_handler(struct work_struct *work)
 			dev_dbg(comp->dev, "button pressed\n");
 			regmap_write(es8326->regmap, ES8326_INT_SOURCE,
 					(ES8326_INT_SRC_PIN9 | ES8326_INT_SRC_BUTTON));
+			es8326_enable_micbias(es8326->component);
 			queue_delayed_work(system_wq, &es8326->button_press_work, 10);
 			goto exit;
 		}
@@ -1067,6 +1068,7 @@ static void es8326_init(struct snd_soc_component *component)
 
 	regmap_write(es8326->regmap, ES8326_ADC_MUTE, 0x0f);
 	regmap_write(es8326->regmap, ES8326_CLK_DIV_LRCK, 0xff);
+	es8326_disable_micbias(es8326->component);
 
 	msleep(200);
 	regmap_write(es8326->regmap, ES8326_INT_SOURCE, ES8326_INT_SRC_PIN9);
-- 
2.17.1

