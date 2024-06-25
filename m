Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F1091DF4B
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Jul 2024 14:30:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3294E23D5;
	Mon,  1 Jul 2024 14:30:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3294E23D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719837058;
	bh=5J5ZNAAJbWkqzsag62Y82/cg4YZqgDN0MGp8CKzv1Bo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=T3jP73X9Ys6uHobAyIP/fO+Ui6ka7Z6Rcu1qP8bATED4X5I4gpyJ9nv8q9XHcdbeS
	 ku3ZUwUIX4D/9B1CYsLnnJN/eVK41XiU2/tEYbZAEIdBy+W2ST+kkbojusAMtjz3Ld
	 iyjFrZC4VNm+PkOCo+Zs1Yyx4aoMJbYauOS1QeTg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B0C42F898D9; Mon,  1 Jul 2024 14:22:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EA658F898DF;
	Mon,  1 Jul 2024 14:22:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 01609F8049C; Tue, 25 Jun 2024 10:46:07 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id D13FFF80495
	for <alsa-devel@alsa-project.org>; Tue, 25 Jun 2024 10:41:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D13FFF80495
Received: from unknown (HELO zy-virtual-machine.localdomain)([116.227.101.59])
	by sina.net (10.75.30.239) with ESMTP
	id 667A82A40003052C; Tue, 25 Jun 2024 16:41:11 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: 497D618406DB483D9F6B597236DEACE6
X-SMAIL-UIID: 497D618406DB483D9F6B597236DEACE6-20240625-164111
From: Zhang Yi <zhangyi@everest-semi.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Cc: tiwai@suse.com,
	amadeuszx.slawinski@linux.intel.com,
	yangxiaohua@everest-semi.com,
	zhuning@everest-semi.com,
	zhangyi@everest-semi.com
Subject: [PATCH v1 1/4] ASoC: codecs: ES8326: Slove headphone detection issue
Date: Tue, 25 Jun 2024 16:41:04 +0800
Message-Id: <20240625084107.3177-2-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240625084107.3177-1-zhangyi@everest-semi.com>
References: <20240625084107.3177-1-zhangyi@everest-semi.com>
X-MailFrom: zhangyi@everest-semi.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: VRDAHVKVYYFI2NCBFL2G45WVM5FBKLP7
X-Message-ID-Hash: VRDAHVKVYYFI2NCBFL2G45WVM5FBKLP7
X-Mailman-Approved-At: Mon, 01 Jul 2024 12:21:45 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VRDAHVKVYYFI2NCBFL2G45WVM5FBKLP7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

We modified the headphone detection setting to avoid an error button state
after codec resume from suspend state

Signed-off-by: Zhang Yi <zhangyi@everest-semi.com>
---
 sound/soc/codecs/es8326.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/es8326.c b/sound/soc/codecs/es8326.c
index 4d87bebca5c1..8c9d79686185 100755
--- a/sound/soc/codecs/es8326.c
+++ b/sound/soc/codecs/es8326.c
@@ -877,6 +877,8 @@ static void es8326_jack_detect_handler(struct work_struct *work)
 		if (es8326->jack->status & SND_JACK_HEADSET) {
 			/* detect button */
 			dev_dbg(comp->dev, "button pressed\n");
+			regmap_write(es8326->regmap, ES8326_INT_SOURCE,
+					(ES8326_INT_SRC_PIN9 | ES8326_INT_SRC_BUTTON));
 			queue_delayed_work(system_wq, &es8326->button_press_work, 10);
 			goto exit;
 		}
@@ -1052,11 +1054,6 @@ static int es8326_resume(struct snd_soc_component *component)
 
 	regmap_write(es8326->regmap, ES8326_ADC_MUTE, 0x0f);
 
-	es8326->jack_remove_retry = 0;
-	es8326->hp = 0;
-	es8326->hpl_vol = 0x03;
-	es8326->hpr_vol = 0x03;
-
 	es8326_irq(es8326->irq, es8326);
 	return 0;
 }
@@ -1211,6 +1208,10 @@ static int es8326_i2c_probe(struct i2c_client *i2c)
 	}
 
 	es8326->irq = i2c->irq;
+	es8326->jack_remove_retry = 0;
+	es8326->hp = 0;
+	es8326->hpl_vol = 0x03;
+	es8326->hpr_vol = 0x03;
 	INIT_DELAYED_WORK(&es8326->jack_detect_work,
 			  es8326_jack_detect_handler);
 	INIT_DELAYED_WORK(&es8326->button_press_work,
-- 
2.17.1

