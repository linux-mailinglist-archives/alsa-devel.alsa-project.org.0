Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C7BA391DF47
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Jul 2024 14:30:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C308B2369;
	Mon,  1 Jul 2024 14:30:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C308B2369
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719837024;
	bh=D9Krw6R+FYzCRW8XcrVlA9PLDW7HTv12q0tpo3qgTS4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ODOkGOPfLF6GtMkf22+NvsArkGDZ5Twc8IBoV+IyK9EvnNnwhJGR3XdkPLEAKnDJe
	 Vtzxp40XEOy4X/VD1YsC6cTwioQMBWIunMWA9cyxIsyhzUMU99RtZShJEr1KYeAsql
	 1jwcGscCMLcvKS4jow8DE+sjLRj3a3Tm1uJfnUes=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 048A0F898B5; Mon,  1 Jul 2024 14:22:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 161FBF8989B;
	Mon,  1 Jul 2024 14:22:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0A021F804F2; Tue, 25 Jun 2024 10:45:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail78-66.sinamail.sina.com.cn (mail78-66.sinamail.sina.com.cn
 [219.142.78.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CEF03F80423
	for <alsa-devel@alsa-project.org>; Tue, 25 Jun 2024 10:41:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CEF03F80423
Received: from unknown (HELO zy-virtual-machine.localdomain)([116.227.101.59])
	by sina.net (10.75.30.239) with ESMTP
	id 667A82A40003052C; Tue, 25 Jun 2024 16:41:12 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: CDBCB5CEBB664DEAA96A8C6ECD8AD3FA
X-SMAIL-UIID: CDBCB5CEBB664DEAA96A8C6ECD8AD3FA-20240625-164112
From: Zhang Yi <zhangyi@everest-semi.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Cc: tiwai@suse.com,
	amadeuszx.slawinski@linux.intel.com,
	yangxiaohua@everest-semi.com,
	zhuning@everest-semi.com,
	zhangyi@everest-semi.com
Subject: [PATCH v1 2/4] ASoC: codecs: ES8326: codec can't enter suspend issue
Date: Tue, 25 Jun 2024 16:41:05 +0800
Message-Id: <20240625084107.3177-3-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240625084107.3177-1-zhangyi@everest-semi.com>
References: <20240625084107.3177-1-zhangyi@everest-semi.com>
X-MailFrom: zhangyi@everest-semi.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: PAQBXUSQGTAQ7GX5XQ2ALBNGG6VHQKPH
X-Message-ID-Hash: PAQBXUSQGTAQ7GX5XQ2ALBNGG6VHQKPH
X-Mailman-Approved-At: Mon, 01 Jul 2024 12:21:45 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PAQBXUSQGTAQ7GX5XQ2ALBNGG6VHQKPH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

We modify the trigger conditions for enable_micbias and disable_micbias
to make sure the codec can enter suspend

Signed-off-by: Zhang Yi <zhangyi@everest-semi.com>
---
 sound/soc/codecs/es8326.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/es8326.c b/sound/soc/codecs/es8326.c
index 8c9d79686185..e103ba5405b4 100755
--- a/sound/soc/codecs/es8326.c
+++ b/sound/soc/codecs/es8326.c
@@ -787,6 +787,7 @@ static void es8326_jack_button_handler(struct work_struct *work)
 				    SND_JACK_BTN_0 | SND_JACK_BTN_1 | SND_JACK_BTN_2);
 			button_to_report = 0;
 		}
+		es8326_disable_micbias(es8326->component);
 	}
 	mutex_unlock(&es8326->lock);
 }
@@ -860,7 +861,6 @@ static void es8326_jack_detect_handler(struct work_struct *work)
 			regmap_write(es8326->regmap, ES8326_INT_SOURCE, 0x00);
 			regmap_update_bits(es8326->regmap, ES8326_HPDET_TYPE, 0x03, 0x01);
 			regmap_update_bits(es8326->regmap, ES8326_HPDET_TYPE, 0x10, 0x00);
-			es8326_enable_micbias(es8326->component);
 			usleep_range(50000, 70000);
 			regmap_update_bits(es8326->regmap, ES8326_HPDET_TYPE, 0x03, 0x00);
 			regmap_update_bits(es8326->regmap, ES8326_HPDET_TYPE, 0x10, 0x10);
@@ -879,6 +879,7 @@ static void es8326_jack_detect_handler(struct work_struct *work)
 			dev_dbg(comp->dev, "button pressed\n");
 			regmap_write(es8326->regmap, ES8326_INT_SOURCE,
 					(ES8326_INT_SRC_PIN9 | ES8326_INT_SRC_BUTTON));
+			es8326_enable_micbias(es8326->component);
 			queue_delayed_work(system_wq, &es8326->button_press_work, 10);
 			goto exit;
 		}
@@ -1053,6 +1054,7 @@ static int es8326_resume(struct snd_soc_component *component)
 			   ES8326_MUTE);
 
 	regmap_write(es8326->regmap, ES8326_ADC_MUTE, 0x0f);
+	es8326_disable_micbias(es8326->component);
 
 	es8326_irq(es8326->irq, es8326);
 	return 0;
-- 
2.17.1

