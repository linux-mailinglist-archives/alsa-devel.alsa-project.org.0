Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F3192BEC0
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Jul 2024 17:49:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4B4EAE9D;
	Tue,  9 Jul 2024 17:49:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4B4EAE9D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720540188;
	bh=swHYojslKRZrYvYSpfXsgW3+8SF1RW/G017862frP0k=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=CRBi9Siz94CePSdlIGeHslqPs5PpTQT75FZ567aCE5rXBeZmdfZSdKhcEtr3KzLUy
	 Xx5RCvi/eT7TcnwDxTQN4MRBLuo2HQKt24OcvWeUTutN8G1XYS2YfAnZ2B/oChW5oH
	 wY/VCqtl+58yH0kGYbxFIG2H+0pHXkwND86K8odI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3775FF80699; Tue,  9 Jul 2024 17:48:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B87CEF8068E;
	Tue,  9 Jul 2024 17:48:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CF356F8025E; Tue,  2 Jul 2024 07:26:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail78-66.sinamail.sina.com.cn (mail78-66.sinamail.sina.com.cn
 [219.142.78.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 133B3F800FE
	for <alsa-devel@alsa-project.org>; Tue,  2 Jul 2024 07:26:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 133B3F800FE
Received: from unknown (HELO zy-virtual-machine.localdomain)([116.227.101.59])
	by sina.net (10.185.250.32) with ESMTP
	id 66838F73000051E7; Tue, 2 Jul 2024 13:26:13 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: 34D11BAF456A45FF8D78D8C2497CBD65
X-SMAIL-UIID: 34D11BAF456A45FF8D78D8C2497CBD65-20240702-132613
From: Zhang Yi <zhangyi@everest-semi.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Cc: tiwai@suse.com,
	amadeuszx.slawinski@linux.intel.com,
	yangxiaohua@everest-semi.com,
	zhuning@everest-semi.com,
	zhangyi@everest-semi.com
Subject: [PATCH] ASoC: codecs: ES8326: suspend issue
Date: Tue,  2 Jul 2024 13:26:10 +0800
Message-Id: <20240702052610.24259-1-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
X-MailFrom: zhangyi@everest-semi.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: SLN3LYOHECUS3EMZR6FLS46LQD6RTF5D
X-Message-ID-Hash: SLN3LYOHECUS3EMZR6FLS46LQD6RTF5D
X-Mailman-Approved-At: Tue, 09 Jul 2024 15:47:04 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SLN3LYOHECUS3EMZR6FLS46LQD6RTF5D/>
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

