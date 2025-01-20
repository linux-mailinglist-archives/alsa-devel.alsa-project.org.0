Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 61582A1791A
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Jan 2025 09:14:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C621603C8;
	Tue, 21 Jan 2025 09:14:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C621603C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1737447275;
	bh=dyw6WxkcXRQ6kae7WtfQYP2kSXG9+SMOK/v2HnzNsno=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=olEssJXKUFJylYlViXLsspLq5iJsqybXBGCzyMAykMtJ2rUt+enQaRA0+jdUfg+gh
	 wVQ9azOWEacpJ1Xs7h7160dmb5jlVnNKE0je13vRilFMkUIjhFMOEhhWr7DMa2E4vi
	 Yn9qMnRsXD6xP04pnkkg5dL1Tqt2qOL529fKd8y8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 65BA4F80602; Tue, 21 Jan 2025 09:13:55 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E38DFF805FB;
	Tue, 21 Jan 2025 09:13:54 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0EFF3F80571; Mon, 20 Jan 2025 11:18:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail78-60.sinamail.sina.com.cn (mail78-60.sinamail.sina.com.cn
 [219.142.78.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BA063F8051E
	for <alsa-devel@alsa-project.org>; Mon, 20 Jan 2025 11:18:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA063F8051E
Received: from unknown (HELO
 zy-virtual-machine.localdomain)([180.159.108.222])
	by sina.net (10.185.250.30) with ESMTP
	id 678E22D8000040B3; Mon, 20 Jan 2025 18:18:01 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: 53ABA6FF2E194F8DAB339DDAE6BA8BFF
X-SMAIL-UIID: 53ABA6FF2E194F8DAB339DDAE6BA8BFF-20250120-181801
From: Zhang Yi <zhangyi@everest-semi.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Cc: tiwai@suse.com,
	amadeuszx.slawinski@linux.intel.com,
	yangxiaohua@everest-semi.com,
	zhuning@everest-semi.com,
	zhangyi@everest-semi.com
Subject: [PATCH] ASoC: codecs: ES8326: Improved PSRR
Date: Mon, 20 Jan 2025 18:17:58 +0800
Message-Id: <20250120101758.13347-1-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
X-MailFrom: zhangyi@everest-semi.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: IH3Y2476IZL2VB55JXWPENLWDMI4YVCN
X-Message-ID-Hash: IH3Y2476IZL2VB55JXWPENLWDMI4YVCN
X-Mailman-Approved-At: Tue, 21 Jan 2025 08:13:50 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IH3Y2476IZL2VB55JXWPENLWDMI4YVCN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Modified configuration to improve PSSR when ES8326 is working

Signed-off-by: Zhang Yi <zhangyi@everest-semi.com>
---
 sound/soc/codecs/es8326.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/es8326.c b/sound/soc/codecs/es8326.c
index b06eead7e0f6..066d92b54312 100755
--- a/sound/soc/codecs/es8326.c
+++ b/sound/soc/codecs/es8326.c
@@ -911,7 +911,7 @@ static void es8326_jack_detect_handler(struct work_struct *work)
 			regmap_write(es8326->regmap, ES8326_INT_SOURCE,
 					(ES8326_INT_SRC_PIN9 | ES8326_INT_SRC_BUTTON));
 			regmap_write(es8326->regmap, ES8326_SYS_BIAS, 0x1f);
-			regmap_update_bits(es8326->regmap, ES8326_HP_DRIVER_REF, 0x0f, 0x08);
+			regmap_update_bits(es8326->regmap, ES8326_HP_DRIVER_REF, 0x0f, 0x0d);
 			queue_delayed_work(system_wq, &es8326->jack_detect_work,
 					msecs_to_jiffies(400));
 			es8326->hp = 1;
@@ -1023,7 +1023,7 @@ static void es8326_init(struct snd_soc_component *component)
 	struct es8326_priv *es8326 = snd_soc_component_get_drvdata(component);
 
 	regmap_write(es8326->regmap, ES8326_RESET, 0x1f);
-	regmap_write(es8326->regmap, ES8326_VMIDSEL, 0x0E);
+	regmap_write(es8326->regmap, ES8326_VMIDSEL, 0x3E);
 	regmap_write(es8326->regmap, ES8326_ANA_LP, 0xf0);
 	usleep_range(10000, 15000);
 	regmap_write(es8326->regmap, ES8326_HPJACK_TIMER, 0xd9);
-- 
2.17.1

