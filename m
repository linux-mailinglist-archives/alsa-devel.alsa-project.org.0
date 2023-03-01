Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A00F86A6BDB
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Mar 2023 12:40:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D59B832;
	Wed,  1 Mar 2023 12:39:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D59B832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677670845;
	bh=clQO14yQ+ltRDG+JAi8cfBFkK9rtlbuvlOm22OW9SxU=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rblAbn9HTVdo6A3DD1NXWuaS0IUGL8Or/QbBB9haIhpB9fw/JkQIkEQ54ni2JeQ20
	 e2VK2Sh9w39zAVY/g36tTL6F6nxIizBVtjRhbbb5NIQrGpGUcyExj3h0KAcKLIOVV1
	 W2zmSiWZAez/UyBuo5ek3FoAIH/XngxF85Af9Jpg=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A77E9F8052E;
	Wed,  1 Mar 2023 12:38:54 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 428FEF80533; Wed,  1 Mar 2023 12:38:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 58FB1F80527
	for <alsa-devel@alsa-project.org>; Wed,  1 Mar 2023 12:38:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 58FB1F80527
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=eVI5cQiS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1677670727; x=1709206727;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=clQO14yQ+ltRDG+JAi8cfBFkK9rtlbuvlOm22OW9SxU=;
  b=eVI5cQiSzzjJaOPBUPeM5aQp4MdmdXguxHAQCqR9H+ExV5wKM2gUILuf
   1mlrfzWicnCBRWbitjpACWjlZLpEg3sKeU9rlA+CilouCFsFZ8OId+bG8
   xbpEPjzZCmVBrBXjemOK9HTH7oVohxl+sfcAFDeoLlJmBpqv2VaZ9Osa8
   YZvOcnRCIU1MfdOl2lXGxDEORWVAlTn20hNb14/eSp98hMOnYfrWXxP8e
   oDo+2aiPELYY2FrHino8WOPEREXDisxO+gMWlUB0drazf6LSDDYcPnvHv
   q0X0AO7kv9bxJAyUgqhDPpfD5LNyG8i6/X9geY1fCm8aRXUBqIhONK+Zm
   g==;
X-IronPort-AV: E=Sophos;i="5.98,224,1673938800";
   d="scan'208";a="202995020"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 01 Mar 2023 04:38:44 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 1 Mar 2023 04:38:33 -0700
Received: from m18063-ThinkPad-T460p.mchp-main.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Wed, 1 Mar 2023 04:38:30 -0700
From: Claudiu Beznea <claudiu.beznea@microchip.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
	<tiwai@suse.com>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>
Subject: [PATCH 2/8] ASoC: mchp-spdiftx: use regmap_update_bits()
Date: Wed, 1 Mar 2023 13:38:01 +0200
Message-ID: <20230301113807.24036-3-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230301113807.24036-1-claudiu.beznea@microchip.com>
References: <20230301113807.24036-1-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Message-ID-Hash: EOV27HQEBMJZ6IDMJE6QZ4A65G7L4H6Y
X-Message-ID-Hash: EOV27HQEBMJZ6IDMJE6QZ4A65G7L4H6Y
X-MailFrom: Claudiu.Beznea@microchip.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-arm-kernel@lists.infradead.org,
 Claudiu Beznea <claudiu.beznea@microchip.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EOV27HQEBMJZ6IDMJE6QZ4A65G7L4H6Y/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Use regmap_update_bits() instead of regmap_read(), running variable,
regmap_write(). There is no need for extra variables and checks around
it as regmap_update_bits() already does this. With this code becomes
simpler.

Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
---
 sound/soc/atmel/mchp-spdiftx.c | 22 +++++-----------------
 1 file changed, 5 insertions(+), 17 deletions(-)

diff --git a/sound/soc/atmel/mchp-spdiftx.c b/sound/soc/atmel/mchp-spdiftx.c
index bf4252412f9f..e7241d819748 100644
--- a/sound/soc/atmel/mchp-spdiftx.c
+++ b/sound/soc/atmel/mchp-spdiftx.c
@@ -306,15 +306,10 @@ static int mchp_spdiftx_trigger(struct snd_pcm_substream *substream, int cmd,
 {
 	struct mchp_spdiftx_dev *dev = snd_soc_dai_get_drvdata(dai);
 	struct mchp_spdiftx_mixer_control *ctrl = &dev->control;
-	u32 mr;
-	int running;
 	int ret;
 
 	/* do not start/stop while channel status or user data is updated */
 	spin_lock(&ctrl->lock);
-	regmap_read(dev->regmap, SPDIFTX_MR, &mr);
-	running = !!(mr & SPDIFTX_MR_TXEN_ENABLE);
-
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_RESUME:
 	case SNDRV_PCM_TRIGGER_START:
@@ -323,10 +318,8 @@ static int mchp_spdiftx_trigger(struct snd_pcm_substream *substream, int cmd,
 		dev->suspend_irq = 0;
 		fallthrough;
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
-		if (!running) {
-			mr &= ~SPDIFTX_MR_TXEN_MASK;
-			mr |= SPDIFTX_MR_TXEN_ENABLE;
-		}
+		ret = regmap_update_bits(dev->regmap, SPDIFTX_MR, SPDIFTX_MR_TXEN_MASK,
+					 SPDIFTX_MR_TXEN_ENABLE);
 		break;
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 		regmap_read(dev->regmap, SPDIFTX_IMR, &dev->suspend_irq);
@@ -336,17 +329,12 @@ static int mchp_spdiftx_trigger(struct snd_pcm_substream *substream, int cmd,
 			     SPDIFTX_IR_TXUDR | SPDIFTX_IR_TXOVR);
 		fallthrough;
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
-		if (running) {
-			mr &= ~SPDIFTX_MR_TXEN_MASK;
-			mr |= SPDIFTX_MR_TXEN_DISABLE;
-		}
+		ret = regmap_update_bits(dev->regmap, SPDIFTX_MR, SPDIFTX_MR_TXEN_MASK,
+					 SPDIFTX_MR_TXEN_DISABLE);
 		break;
 	default:
-		spin_unlock(&ctrl->lock);
-		return -EINVAL;
+		ret = -EINVAL;
 	}
-
-	ret = regmap_write(dev->regmap, SPDIFTX_MR, mr);
 	spin_unlock(&ctrl->lock);
 	if (ret)
 		dev_err(dev->dev, "unable to disable TX: %d\n", ret);
-- 
2.34.1

