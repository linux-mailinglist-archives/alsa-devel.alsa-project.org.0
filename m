Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D8299077BC
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jun 2024 18:04:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 96ADFDE5;
	Thu, 13 Jun 2024 18:04:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 96ADFDE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718294654;
	bh=7CCd+ELQS0Pw7I+mbe5/2yK4WvO7RYXmFWE2193Egq4=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=spwdfg/8krGf9xSjiLsTcFvrH9ev/E8N+p6OIeQ2SI9eQ1Lv1tohZWDEe14M3g9Pf
	 UXXyko0WAMf9KXURs1Q38IB84VDhoPCJksYpLCaOefFyXg0A/NHC3YjuAGHyHnykHj
	 odoWQhM4cTDRFXaruLtEbK06T0G1ifkJF8FOyGa0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5BF28F8062D; Thu, 13 Jun 2024 18:01:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 67A93F80722;
	Thu, 13 Jun 2024 18:01:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B5864F802DB; Tue,  4 Jun 2024 04:20:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=5.0 tests=RCVD_IN_DNSWL_LOW,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail78-39.sinamail.sina.com.cn (mail78-39.sinamail.sina.com.cn
 [219.142.78.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2B2C5F80088
	for <alsa-devel@alsa-project.org>; Tue,  4 Jun 2024 04:19:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B2C5F80088
Received: from unknown (HELO zy-virtual-machine.localdomain)([116.233.72.63])
	by sina.net (10.75.30.235) with ESMTP
	id 665E79C30002F642; Tue, 4 Jun 2024 10:19:49 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: F5FA6652DF9A444D9A15FF87BE51FAD7
X-SMAIL-UIID: F5FA6652DF9A444D9A15FF87BE51FAD7-20240604-101949
From: Zhang Yi <zhangyi@everest-semi.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Cc: tiwai@suse.com,
	amadeuszx.slawinski@linux.intel.com,
	yangxiaohua@everest-semi.com,
	zhuning@everest-semi.com,
	zhangyi@everest-semi.com
Subject: [PATCH] ASoC: codecs: ES8326: Slove headphone detection issue
Date: Tue,  4 Jun 2024 10:19:46 +0800
Message-Id: <20240604021946.2911-1-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
X-MailFrom: zhangyi@everest-semi.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: NPRUU5FCIGI3ZEDSRYAS7LSRTPPZSU6Q
X-Message-ID-Hash: NPRUU5FCIGI3ZEDSRYAS7LSRTPPZSU6Q
X-Mailman-Approved-At: Thu, 13 Jun 2024 16:01:38 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NPRUU5FCIGI3ZEDSRYAS7LSRTPPZSU6Q/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

When switching between OMTP and CTIA headset, we can hear pop noise.
To solve this issue, We modified the configuration for headphone detection

Signed-off-by: Zhang Yi <zhangyi@everest-semi.com>
---
 sound/soc/codecs/es8326.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/es8326.c b/sound/soc/codecs/es8326.c
index 3031699a14c4..4d87bebca5c1 100755
--- a/sound/soc/codecs/es8326.c
+++ b/sound/soc/codecs/es8326.c
@@ -857,12 +857,16 @@ static void es8326_jack_detect_handler(struct work_struct *work)
 			 * set auto-check mode, then restart jack_detect_work after 400ms.
 			 * Don't report jack status.
 			 */
-			regmap_write(es8326->regmap, ES8326_INT_SOURCE,
-					(ES8326_INT_SRC_PIN9 | ES8326_INT_SRC_BUTTON));
+			regmap_write(es8326->regmap, ES8326_INT_SOURCE, 0x00);
 			regmap_update_bits(es8326->regmap, ES8326_HPDET_TYPE, 0x03, 0x01);
+			regmap_update_bits(es8326->regmap, ES8326_HPDET_TYPE, 0x10, 0x00);
 			es8326_enable_micbias(es8326->component);
 			usleep_range(50000, 70000);
 			regmap_update_bits(es8326->regmap, ES8326_HPDET_TYPE, 0x03, 0x00);
+			regmap_update_bits(es8326->regmap, ES8326_HPDET_TYPE, 0x10, 0x10);
+			usleep_range(50000, 70000);
+			regmap_write(es8326->regmap, ES8326_INT_SOURCE,
+					(ES8326_INT_SRC_PIN9 | ES8326_INT_SRC_BUTTON));
 			regmap_write(es8326->regmap, ES8326_SYS_BIAS, 0x1f);
 			regmap_update_bits(es8326->regmap, ES8326_HP_DRIVER_REF, 0x0f, 0x08);
 			queue_delayed_work(system_wq, &es8326->jack_detect_work,
-- 
2.17.1

