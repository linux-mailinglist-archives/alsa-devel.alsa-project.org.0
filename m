Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C75018C79F5
	for <lists+alsa-devel@lfdr.de>; Thu, 16 May 2024 18:00:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6937784D;
	Thu, 16 May 2024 18:00:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6937784D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715875245;
	bh=5vvTdF84HZ5Xj8N79djUvlGKFH96u+9TgIV5IIPavf8=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=UXmUNP9oWbZFkNXJYVViJtmp2I37uXJ+X/XyorI8YU9a7JH5gxLlYr8BKWLaTIhEA
	 0EWQwIh2iii89U3ZM+rXBvZAQrW7L5Ah6qdPf2sDzjVBT9QMfV59chJJHw2nRohMmR
	 sE8RUBwr2m+GGV02QyIMZZnx4gjAXXM87ZDaljVY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F3C06F805AB; Thu, 16 May 2024 18:00:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4D03DF805A8;
	Thu, 16 May 2024 18:00:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DE406F8024C; Wed, 15 May 2024 08:25:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail78-63.sinamail.sina.com.cn (mail78-63.sinamail.sina.com.cn
 [219.142.78.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D7061F800F5
	for <alsa-devel@alsa-project.org>; Wed, 15 May 2024 08:25:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D7061F800F5
Received: from unknown (HELO zy-virtual-machine.localdomain)([116.233.72.63])
	by sina.net (10.75.30.239) with ESMTP
	id 6644554E00027164; Wed, 15 May 2024 14:25:19 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: AB69DCD971BE4D3EB51851EB3211F295
X-SMAIL-UIID: AB69DCD971BE4D3EB51851EB3211F295-20240515-142519
From: Zhang Yi <zhangyi@everest-semi.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Cc: tiwai@suse.com,
	amadeuszx.slawinski@linux.intel.com,
	yangxiaohua@everest-semi.com,
	zhuning@everest-semi.com,
	zhangyi@everest-semi.com
Subject: [PATCH] ASoC: codecs: ES8326: solve hp and button detect issue
Date: Wed, 15 May 2024 14:25:17 +0800
Message-Id: <20240515062517.23661-1-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
X-MailFrom: zhangyi@everest-semi.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: OR7KHSYUHSEJGLBHIEOFOIO7QSXHRGOR
X-Message-ID-Hash: OR7KHSYUHSEJGLBHIEOFOIO7QSXHRGOR
X-Mailman-Approved-At: Thu, 16 May 2024 16:00:11 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OR7KHSYUHSEJGLBHIEOFOIO7QSXHRGOR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

We got an error report about headphone type detection and button detection.
We fixed the headphone type detection error by adjusting the condition
of setting es8326->hp to 0.And we fixed the button detection error by
adjusting micbias and vref.

Signed-off-by: Zhang Yi <zhangyi@everest-semi.com>
---
 sound/soc/codecs/es8326.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/es8326.c b/sound/soc/codecs/es8326.c
index 93385f181d2c..3031699a14c4 100755
--- a/sound/soc/codecs/es8326.c
+++ b/sound/soc/codecs/es8326.c
@@ -829,8 +829,8 @@ static void es8326_jack_detect_handler(struct work_struct *work)
 			/* mute adc when mic path switch */
 			regmap_write(es8326->regmap, ES8326_ADC1_SRC, 0x44);
 			regmap_write(es8326->regmap, ES8326_ADC2_SRC, 0x66);
-			es8326->hp = 0;
 		}
+		es8326->hp = 0;
 		regmap_update_bits(es8326->regmap, ES8326_HPDET_TYPE, 0x03, 0x01);
 		regmap_write(es8326->regmap, ES8326_SYS_BIAS, 0x0a);
 		regmap_update_bits(es8326->regmap, ES8326_HP_DRIVER_REF, 0x0f, 0x03);
@@ -981,7 +981,7 @@ static int es8326_resume(struct snd_soc_component *component)
 	regmap_write(es8326->regmap, ES8326_ANA_LP, 0xf0);
 	usleep_range(10000, 15000);
 	regmap_write(es8326->regmap, ES8326_HPJACK_TIMER, 0xd9);
-	regmap_write(es8326->regmap, ES8326_ANA_MICBIAS, 0xcb);
+	regmap_write(es8326->regmap, ES8326_ANA_MICBIAS, 0xd8);
 	/* set headphone default type and detect pin */
 	regmap_write(es8326->regmap, ES8326_HPDET_TYPE, 0x83);
 	regmap_write(es8326->regmap, ES8326_CLK_RESAMPLE, 0x05);
@@ -1018,7 +1018,7 @@ static int es8326_resume(struct snd_soc_component *component)
 
 	regmap_write(es8326->regmap, ES8326_ANA_VSEL, 0x7F);
 	/* select vdda as micbias source */
-	regmap_write(es8326->regmap, ES8326_VMIDLOW, 0x23);
+	regmap_write(es8326->regmap, ES8326_VMIDLOW, 0x03);
 	/* set dac dsmclip = 1 */
 	regmap_write(es8326->regmap, ES8326_DAC_DSM, 0x08);
 	regmap_write(es8326->regmap, ES8326_DAC_VPPSCALE, 0x15);
-- 
2.17.1

