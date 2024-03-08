Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD2D876A3E
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Mar 2024 18:53:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 43E8982A;
	Fri,  8 Mar 2024 18:53:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 43E8982A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709920403;
	bh=CC0/RCTb+2f+2nhQeQ5oOucovLX12mdG/Mq7v006+JM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sU/C2XfNI35JYhzAG7o5qbQXF/0I9Ho+tcTkGdoQnEqApzDB+4PGWav/wXhDyP58S
	 cWUujYwsEXL43tB1axyLw5CdiQYZIy0Onv080pT9WwgjtWZTd9CbgNf1ldNbzcQW4B
	 aLAQ7otVwwH6jyevyJwW/AKo218uj5xpj0uFJEME=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C7D8BF8062D; Fri,  8 Mar 2024 18:52:04 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B5A64F8063B;
	Fri,  8 Mar 2024 18:51:59 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DB7ADF801F5; Fri,  8 Mar 2024 18:46:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from irl.hu (irl.hu [95.85.9.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with UTF8SMTPS id 4741AF80494
	for <alsa-devel@alsa-project.org>; Fri,  8 Mar 2024 18:42:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4741AF80494
Received: from fedori.lan (51b693e7.dsl.pool.telekom.hu
 [::ffff:81.182.147.231])
  (AUTH: CRAM-MD5 soyer@irl.hu, )
  by irl.hu with ESMTPSA
  id 0000000000076811.0000000065EB4DF0.0020A5CD;
 Fri, 08 Mar 2024 18:42:07 +0100
From: Gergo Koteles <soyer@irl.hu>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
  Baojun Xu <baojun.xu@ti.com>, Jaroslav Kysela <perex@perex.cz>,
  Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
  linux-kernel@vger.kernel.org, Gergo Koteles <soyer@irl.hu>
Subject: [PATCH 3/5] ALSA: hda/tas2781: do not reset cur_* values in
 runtime_suspend
Date: Fri,  8 Mar 2024 18:41:42 +0100
Message-ID: 
 <aa27ae084150988bf6a0ead7e3403bc485d790f8.1709918447.git.soyer@irl.hu>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1709918447.git.soyer@irl.hu>
References: <cover.1709918447.git.soyer@irl.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mime-Autoconverted: from 8bit to 7bit by courier 1.0
Message-ID-Hash: ATUPM7YV2YX3N7DV3K2MUCJOTXAYXLHZ
X-Message-ID-Hash: ATUPM7YV2YX3N7DV3K2MUCJOTXAYXLHZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ATUPM7YV2YX3N7DV3K2MUCJOTXAYXLHZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The amplifier doesn't loose register state in software shutdown mode, so
there is no need to reset the cur_* values.

Without these resets, the amplifier can be turned on after
runtime_suspend without waiting for the program and
profile to be restored.

Fixes: 5be27f1e3ec9 ("ALSA: hda/tas2781: Add tas2781 HDA driver")
Signed-off-by: Gergo Koteles <soyer@irl.hu>
---
 sound/pci/hda/tas2781_hda_i2c.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/sound/pci/hda/tas2781_hda_i2c.c b/sound/pci/hda/tas2781_hda_i2c.c
index 750e49fbb91e..0e61e872bb71 100644
--- a/sound/pci/hda/tas2781_hda_i2c.c
+++ b/sound/pci/hda/tas2781_hda_i2c.c
@@ -832,7 +832,6 @@ static void tas2781_hda_i2c_remove(struct i2c_client *clt)
 static int tas2781_runtime_suspend(struct device *dev)
 {
 	struct tas2781_hda *tas_hda = dev_get_drvdata(dev);
-	int i;
 
 	dev_dbg(tas_hda->dev, "Runtime Suspend\n");
 
@@ -843,12 +842,6 @@ static int tas2781_runtime_suspend(struct device *dev)
 		tas_hda->priv->playback_started = false;
 	}
 
-	for (i = 0; i < tas_hda->priv->ndev; i++) {
-		tas_hda->priv->tasdevice[i].cur_book = -1;
-		tas_hda->priv->tasdevice[i].cur_prog = -1;
-		tas_hda->priv->tasdevice[i].cur_conf = -1;
-	}
-
 	mutex_unlock(&tas_hda->priv->codec_lock);
 
 	return 0;
-- 
2.44.0

