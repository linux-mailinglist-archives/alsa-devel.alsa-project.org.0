Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB2E894C69
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Apr 2024 09:15:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B5D332D36;
	Tue,  2 Apr 2024 09:14:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B5D332D36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712042103;
	bh=P6hNH+rlfZsGROyjCcuro4TKqs9KJiNZT7GUoJjRKtU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=okoC9P1FalnA8C+A5WrgaVRyRSYezvrlnIwp01ms1yFxNEJVoEMpSh/ewN8SVY44r
	 2zdh64xT1TQhEgRDpb+r05oFYbiH8Y0IY28qfikQrb9zWhs4uCJkC/tTbWJiaH29af
	 1vb/bMWUQd/l/1VHPJOCCV4PP5yEjFwdlZh9PaGg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2E4BAF89C8B; Tue,  2 Apr 2024 08:58:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BBCB9F89CD4;
	Tue,  2 Apr 2024 08:58:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 56B36F8016E; Tue,  2 Apr 2024 08:23:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail78-60.sinamail.sina.com.cn (mail78-60.sinamail.sina.com.cn
 [219.142.78.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D4890F80238
	for <alsa-devel@alsa-project.org>; Tue,  2 Apr 2024 08:20:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D4890F80238
Received: from unknown (HELO zy-virtual-machine.localdomain)([116.232.53.71])
	by sina.net (10.75.30.234) with ESMTP
	id 660BA3B800029E89; Tue, 2 Apr 2024 14:20:48 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: 4D3522080A1740AE95AE2BE424155A14
X-SMAIL-UIID: 4D3522080A1740AE95AE2BE424155A14-20240402-142048
From: Zhang Yi <zhangyi@everest-semi.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Cc: tiwai@suse.com,
	amadeuszx.slawinski@linux.intel.com,
	yangxiaohua@everest-semi.com,
	zhuning@everest-semi.com,
	zhangyi@everest-semi.com
Subject: [PATCH 4/4] ASoC: codecs: ES8326: Removing the control of ADC_SCALE
Date: Tue,  2 Apr 2024 14:20:43 +0800
Message-Id: <20240402062043.20608-5-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240402062043.20608-1-zhangyi@everest-semi.com>
References: <20240402062043.20608-1-zhangyi@everest-semi.com>
X-MailFrom: zhangyi@everest-semi.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 3ZN4J6BX3P6SO7XING7THOQMEZ7Q6YQX
X-Message-ID-Hash: 3ZN4J6BX3P6SO7XING7THOQMEZ7Q6YQX
X-Mailman-Approved-At: Tue, 02 Apr 2024 06:55:02 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3ZN4J6BX3P6SO7XING7THOQMEZ7Q6YQX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

We removed the configuration of ES8326_ADC_SCALE
in es8326_jack_detect_handler because user changed
the configuration by snd_controls

Signed-off-by: Zhang Yi <zhangyi@everest-semi.com>
---
 sound/soc/codecs/es8326.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/codecs/es8326.c b/sound/soc/codecs/es8326.c
index 17711dc5df0a..93385f181d2c 100755
--- a/sound/soc/codecs/es8326.c
+++ b/sound/soc/codecs/es8326.c
@@ -827,7 +827,6 @@ static void es8326_jack_detect_handler(struct work_struct *work)
 			dev_dbg(comp->dev, "Report hp remove event\n");
 			snd_soc_jack_report(es8326->jack, 0, SND_JACK_HEADSET);
 			/* mute adc when mic path switch */
-			regmap_write(es8326->regmap, ES8326_ADC_SCALE, 0x33);
 			regmap_write(es8326->regmap, ES8326_ADC1_SRC, 0x44);
 			regmap_write(es8326->regmap, ES8326_ADC2_SRC, 0x66);
 			es8326->hp = 0;
@@ -886,7 +885,6 @@ static void es8326_jack_detect_handler(struct work_struct *work)
 			snd_soc_jack_report(es8326->jack,
 					SND_JACK_HEADSET, SND_JACK_HEADSET);
 
-			regmap_write(es8326->regmap, ES8326_ADC_SCALE, 0x33);
 			regmap_update_bits(es8326->regmap, ES8326_PGA_PDN,
 					0x08, 0x08);
 			regmap_update_bits(es8326->regmap, ES8326_PGAGAIN,
-- 
2.17.1

