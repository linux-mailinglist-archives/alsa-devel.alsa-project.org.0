Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B62489DFC05
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Dec 2024 09:37:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BE8EC1530;
	Mon,  2 Dec 2024 09:37:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BE8EC1530
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1733128650;
	bh=KrpQz6dN8/lgtmMHr38hk5Pp+VCcqiPeVUyW8CaqxM4=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=HyYbSSNTV3zXf5kDY0ldMuR3FP5RMAqAgzNzINokoOpYphgWXOrY7VtN94KJ2oxq2
	 fy7vM/Ww+1hv0oIwKAUfPRno/HoXpPZ5mgxZbUia4O7HeqR5ohJpP2WIQLZj5gLANs
	 0hbs9Ia42NEnXgYnOiH4+LkJ0hOA0V/IiNmqJgF4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7B839F80601; Mon,  2 Dec 2024 09:36:53 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C7630F80600;
	Mon,  2 Dec 2024 09:36:52 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 16102F80269; Thu, 31 Oct 2024 07:03:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail78-37.sinamail.sina.com.cn (mail78-37.sinamail.sina.com.cn
 [219.142.78.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C502FF80104
	for <alsa-devel@alsa-project.org>; Thu, 31 Oct 2024 07:03:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C502FF80104
Received: from unknown (HELO zy-virtual-machine.localdomain)([180.172.39.131])
	by sina.net (10.185.250.31) with ESMTP
	id 67231D8E00002C26; Thu, 31 Oct 2024 14:02:55 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: 6A4A267646FD443AB05D231171843B91
X-SMAIL-UIID: 6A4A267646FD443AB05D231171843B91-20241031-140255
From: Zhang Yi <zhangyi@everest-semi.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Cc: tiwai@suse.com,
	amadeuszx.slawinski@linux.intel.com,
	yangxiaohua@everest-semi.com,
	zhuning@everest-semi.com,
	zhangyi@everest-semi.com
Subject: [PATCH] ASoC: codecs: ES8326: Reduce pop noise
Date: Thu, 31 Oct 2024 14:02:53 +0800
Message-Id: <20241031060253.21001-1-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
X-MailFrom: zhangyi@everest-semi.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: QEXC324VGPOYI2ERBIUIHTMUM5VI72FB
X-Message-ID-Hash: QEXC324VGPOYI2ERBIUIHTMUM5VI72FB
X-Mailman-Approved-At: Mon, 02 Dec 2024 08:36:41 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QEXC324VGPOYI2ERBIUIHTMUM5VI72FB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

We modify the value of ES8326_ANA_MICBIAS to reduce the pop noise

Signed-off-by: Zhang Yi <zhangyi@everest-semi.com>
---
 sound/soc/codecs/es8326.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/es8326.c b/sound/soc/codecs/es8326.c
index aa3e364827c8..a5603b617688 100755
--- a/sound/soc/codecs/es8326.c
+++ b/sound/soc/codecs/es8326.c
@@ -616,7 +616,7 @@ static int es8326_mute(struct snd_soc_dai *dai, int mute, int direction)
 					0x0F, 0x0F);
 			if (es8326->version > ES8326_VERSION_B) {
 				regmap_update_bits(es8326->regmap, ES8326_VMIDSEL, 0x40, 0x40);
-				regmap_update_bits(es8326->regmap, ES8326_ANA_MICBIAS, 0x70, 0x00);
+				regmap_update_bits(es8326->regmap, ES8326_ANA_MICBIAS, 0x70, 0x10);
 			}
 		}
 	} else {
@@ -1082,7 +1082,7 @@ static void es8326_init(struct snd_soc_component *component)
 	regmap_write(es8326->regmap, ES8326_ADC2_SRC, 0x66);
 	es8326_disable_micbias(es8326->component);
 	if (es8326->version > ES8326_VERSION_B) {
-		regmap_update_bits(es8326->regmap, ES8326_ANA_MICBIAS, 0x73, 0x03);
+		regmap_update_bits(es8326->regmap, ES8326_ANA_MICBIAS, 0x73, 0x13);
 		regmap_update_bits(es8326->regmap, ES8326_VMIDSEL, 0x40, 0x40);
 	}
 
-- 
2.17.1

