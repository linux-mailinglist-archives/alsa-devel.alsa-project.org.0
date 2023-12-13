Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A7C812396
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Dec 2023 00:51:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4B2F1AE8;
	Thu, 14 Dec 2023 00:51:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4B2F1AE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702511518;
	bh=B7A9UE7X9wAVNIvr+jk7W/izxXZYxNBPjcvRJvvD170=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=PfabXyXCAMv+lngQa2LlMb0hFJVJnn60NJbT5IqEXV8XBRa73ivOdTDyFRAKFR5kJ
	 RJfUGs54xW2R5UWgU7si/QR2K5Ye6Eu3uhdNUtD4Km4mffD8fWOCKTYf34Mf3E23W6
	 hb7f+TV2/PihCLFvytXb4vHQFRMotbl4m9e+afhU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B32EFF80587; Thu, 14 Dec 2023 00:51:29 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 14F2AF80578;
	Thu, 14 Dec 2023 00:51:28 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 09812F8016A; Thu, 14 Dec 2023 00:49:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from irl.hu (irl.hu [95.85.9.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with UTF8SMTPS id 105C2F8001F
	for <alsa-devel@alsa-project.org>; Thu, 14 Dec 2023 00:49:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 105C2F8001F
Received: from fedori.lan (51b690cd.dsl.pool.telekom.hu
 [::ffff:81.182.144.205])
  (AUTH: CRAM-MD5 soyer@irl.hu, )
  by irl.hu with ESMTPSA
  id 0000000000071EA1.00000000657A4302.001284F3;
 Thu, 14 Dec 2023 00:49:22 +0100
From: Gergo Koteles <soyer@irl.hu>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
  Baojun Xu <baojun.xu@ti.com>, Jaroslav Kysela <perex@perex.cz>,
  Takashi Iwai <tiwai@suse.com>
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
  Gergo Koteles <soyer@irl.hu>, stable@vger.kernel.org
Subject: [PATCH] ALSA: hda/tas2781: reset the amp before component_add
Date: Thu, 14 Dec 2023 00:49:20 +0100
Message-ID: 
 <4d23bf58558e23ee8097de01f70f1eb8d9de2d15.1702511246.git.soyer@irl.hu>
X-Mailer: git-send-email 2.43.0
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mime-Autoconverted: from 8bit to 7bit by courier 1.0
Message-ID-Hash: M2MMAYDR4ILTEXV5WB3JYUW2UPO55L5S
X-Message-ID-Hash: M2MMAYDR4ILTEXV5WB3JYUW2UPO55L5S
X-MailFrom: soyer@irl.hu
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/M2MMAYDR4ILTEXV5WB3JYUW2UPO55L5S/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Calling component_add starts loading the firmware, the callback function
writes the program to the amplifiers. If the module resets the
amplifiers after component_add, it happens that one of the amplifiers
does not work because the reset and program writing are interleaving.

Call tas2781_reset before component_add to ensure reliable
initialization.

Fixes: 5be27f1e3ec9 ("ALSA: hda/tas2781: Add tas2781 HDA driver")
CC: stable@vger.kernel.org
Signed-off-by: Gergo Koteles <soyer@irl.hu>
---
 sound/pci/hda/tas2781_hda_i2c.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/pci/hda/tas2781_hda_i2c.c b/sound/pci/hda/tas2781_hda_i2c.c
index fb802802939e..0baaaff94c6f 100644
--- a/sound/pci/hda/tas2781_hda_i2c.c
+++ b/sound/pci/hda/tas2781_hda_i2c.c
@@ -675,14 +675,14 @@ static int tas2781_hda_i2c_probe(struct i2c_client *clt)
 
 	pm_runtime_put_autosuspend(tas_priv->dev);
 
+	tas2781_reset(tas_priv);
+
 	ret = component_add(tas_priv->dev, &tas2781_hda_comp_ops);
 	if (ret) {
 		dev_err(tas_priv->dev, "Register component failed: %d\n", ret);
 		pm_runtime_disable(tas_priv->dev);
-		goto err;
 	}
 
-	tas2781_reset(tas_priv);
 err:
 	if (ret)
 		tas2781_hda_remove(&clt->dev);

base-commit: ffc253263a1375a65fa6c9f62a893e9767fbebfa
-- 
2.43.0

