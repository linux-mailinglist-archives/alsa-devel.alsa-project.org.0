Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 65995952A5E
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Aug 2024 10:25:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 857D7238F;
	Thu, 15 Aug 2024 10:25:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 857D7238F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723710311;
	bh=32W4A5Lw9Ssds0txqJb5PjKZKXEXUOdMbL3wPuOoxHI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YXtY+11RhPMR4z2XjJIHSttlHW0gH24z7+uOu3e1gNxmM69uq3qBhgwgVRDQ72VMY
	 +ahLm+lSj+a1pSThBG9hbYDW6QU6jhyMmxvc9NN0GU0fSYD0oNH05eTONcFp9aYv1d
	 eB+s5Cjgf3uU08BXFsmDoocunGCDRRZU25bbSGpw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C11DCF8065A; Thu, 15 Aug 2024 10:23:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A20A1F80651;
	Thu, 15 Aug 2024 10:23:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E933FF80448; Wed,  7 Aug 2024 04:54:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp134-91.sina.com.cn (smtp134-91.sina.com.cn
 [180.149.134.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B9A7AF800BF
	for <alsa-devel@alsa-project.org>; Wed,  7 Aug 2024 04:54:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B9A7AF800BF
Received: from unknown (HELO zy-virtual-machine.localdomain)([180.172.39.131])
	by sina.net (10.185.250.31) with ESMTP
	id 66B2E1C800005724; Wed, 7 Aug 2024 10:54:04 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: E89D1ABF27A34DDC913154FD24B6656F
X-SMAIL-UIID: E89D1ABF27A34DDC913154FD24B6656F-20240807-105404
From: Zhang Yi <zhangyi@everest-semi.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Cc: tiwai@suse.com,
	amadeuszx.slawinski@linux.intel.com,
	yangxiaohua@everest-semi.com,
	zhuning@everest-semi.com,
	zhangyi@everest-semi.com
Subject: [PATCH 1/2] ASoC: codecs: ES8326: button detect issue
Date: Wed,  7 Aug 2024 10:53:55 +0800
Message-Id: <20240807025356.24904-2-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240807025356.24904-1-zhangyi@everest-semi.com>
References: <20240807025356.24904-1-zhangyi@everest-semi.com>
X-MailFrom: zhangyi@everest-semi.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 3JBN3JBZU5JXRGIPJV6QT6J5OP44N2TZ
X-Message-ID-Hash: 3JBN3JBZU5JXRGIPJV6QT6J5OP44N2TZ
X-Mailman-Approved-At: Thu, 15 Aug 2024 08:21:42 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3JBN3JBZU5JXRGIPJV6QT6J5OP44N2TZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

We find that we need to set snd_jack_types to 0. If not,
there will be a probability of button detection errors

Signed-off-by: Zhang Yi <zhangyi@everest-semi.com>
---
 sound/soc/codecs/es8326.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/es8326.c b/sound/soc/codecs/es8326.c
index 60877116c0ef..519bcd2ed00e 100755
--- a/sound/soc/codecs/es8326.c
+++ b/sound/soc/codecs/es8326.c
@@ -844,6 +844,8 @@ static void es8326_jack_detect_handler(struct work_struct *work)
 		es8326_disable_micbias(es8326->component);
 		if (es8326->jack->status & SND_JACK_HEADPHONE) {
 			dev_dbg(comp->dev, "Report hp remove event\n");
+			snd_soc_jack_report(es8326->jack, 0,
+				    SND_JACK_BTN_0 | SND_JACK_BTN_1 | SND_JACK_BTN_2);
 			snd_soc_jack_report(es8326->jack, 0, SND_JACK_HEADSET);
 			/* mute adc when mic path switch */
 			regmap_write(es8326->regmap, ES8326_ADC1_SRC, 0x44);
-- 
2.17.1

