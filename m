Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D4CFB56A304
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Jul 2022 14:58:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BA3F61670;
	Thu,  7 Jul 2022 14:57:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BA3F61670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657198706;
	bh=BLX4nPxP/PfKQ+GqHozmOYLg5BxuFUZOPahoRi+A6NE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SR84GNKyamOBxC1+bjK5jC+ZErTY6bmkYaMOQsp1zO0g8Qo6X+418wSLwu828flwm
	 mv28BXEwiAJMJkUHx7ec8qitpBv3mtStEvR5fr/8QrGcv97B5KDQCZOBvnwHM7mqju
	 zkuiz0PUDch/AwB0WZtgNxHmihn+8/TpatYEtd5k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 44411F80537;
	Thu,  7 Jul 2022 14:56:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 148D8F800C5; Thu,  7 Jul 2022 14:56:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3F7DCF800C5
 for <alsa-devel@alsa-project.org>; Thu,  7 Jul 2022 14:56:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3F7DCF800C5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="UfFoWt43"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657198603; x=1688734603;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BLX4nPxP/PfKQ+GqHozmOYLg5BxuFUZOPahoRi+A6NE=;
 b=UfFoWt434aDMEtyA64KqYFse9ql81ZiYQPqg60V9PcbexfDYx4lEQMZV
 iWFp6Vys8tAeHNVlK23UsRmC1dCy4LBaGJ8KYqhbdPXJKkffNHex1W3zv
 jux9VDcYHb/FgHRIbpnph8mWFJ39HYQwWqbuCNZbKJhUnGX7meSawzWWu
 MCnqWvEb4cDjhbeNO6ZlNNglQxm74e1tyH7K7HSdn+zSsQq9Y1LEjTiW0
 4O7g+f6kkJQTRTBzJPii83uWU9Q/UsEGgxSDP6xqvzmIVI/FCDNoi4gZx
 XiIai76rwjWo+liPq7M8elVsuplem4TVP+Tzwy58pSHwtWP431m8YPEQK g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10400"; a="272810612"
X-IronPort-AV: E=Sophos;i="5.92,252,1650956400"; d="scan'208";a="272810612"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2022 05:56:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,252,1650956400"; d="scan'208";a="620781738"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
 by orsmga008.jf.intel.com with ESMTP; 07 Jul 2022 05:56:39 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Oder Chiou <oder_chiou@realtek.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v2 2/5] ASoC: codecs: rt298: Fix jack detection
Date: Thu,  7 Jul 2022 14:56:58 +0200
Message-Id: <20220707125701.3518263-3-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220707125701.3518263-1-amadeuszx.slawinski@linux.intel.com>
References: <20220707125701.3518263-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On our RVP platforms using rt298 with combojack we've seen issues with
controls being in incorrect state after suspend/resume cycle. This is
caused by codec driver not setting pins to correct state and causing
codec suspend method to not be called. Which on resume caused codec
registers to be in undefined state. Fix this by setting pins correctly
in jack detect function.

Above problem is caused by the fact that when jack == NULL code doesn't
reach rt298_jack_detect() function which sets pins. Alternatively
problem could be fixed by just moving rt298_jack_detect, but as rt298
codec is similar to rt286, align the code by setting pins explicitly.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/codecs/rt298.c | 39 ++++++++++++++++++---------------------
 1 file changed, 18 insertions(+), 21 deletions(-)

diff --git a/sound/soc/codecs/rt298.c b/sound/soc/codecs/rt298.c
index 6a615943f983..e1d94f128fd9 100644
--- a/sound/soc/codecs/rt298.c
+++ b/sound/soc/codecs/rt298.c
@@ -329,34 +329,31 @@ static void rt298_jack_detect_work(struct work_struct *work)
 static int rt298_mic_detect(struct snd_soc_component *component,
 			    struct snd_soc_jack *jack, void *data)
 {
+	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
 	struct rt298_priv *rt298 = snd_soc_component_get_drvdata(component);
-	struct snd_soc_dapm_context *dapm;
-	bool hp = false;
-	bool mic = false;
-	int status = 0;
 
 	rt298->jack = jack;
 
-	/* If jack in NULL, disable HS jack */
-	if (!jack) {
+	if (jack) {
+		/* Enable IRQ */
+		if (rt298->jack->status & SND_JACK_HEADPHONE)
+			snd_soc_dapm_force_enable_pin(dapm, "LDO1");
+		if (rt298->jack->status & SND_JACK_MICROPHONE) {
+			snd_soc_dapm_force_enable_pin(dapm, "HV");
+			snd_soc_dapm_force_enable_pin(dapm, "VREF");
+		}
+		regmap_update_bits(rt298->regmap, RT298_IRQ_CTRL, 0x2, 0x2);
+		/* Send an initial empty report */
+		snd_soc_jack_report(rt298->jack, rt298->jack->status,
+				    SND_JACK_MICROPHONE | SND_JACK_HEADPHONE);
+	} else {
+		/* Disable IRQ */
 		regmap_update_bits(rt298->regmap, RT298_IRQ_CTRL, 0x2, 0x0);
-		dapm = snd_soc_component_get_dapm(component);
+		snd_soc_dapm_disable_pin(dapm, "HV");
+		snd_soc_dapm_disable_pin(dapm, "VREF");
 		snd_soc_dapm_disable_pin(dapm, "LDO1");
-		snd_soc_dapm_sync(dapm);
-		return 0;
 	}
-
-	regmap_update_bits(rt298->regmap, RT298_IRQ_CTRL, 0x2, 0x2);
-
-	rt298_jack_detect(rt298, &hp, &mic);
-	if (hp)
-		status |= SND_JACK_HEADPHONE;
-
-	if (mic)
-		status |= SND_JACK_MICROPHONE;
-
-	snd_soc_jack_report(rt298->jack, status,
-		SND_JACK_MICROPHONE | SND_JACK_HEADPHONE);
+	snd_soc_dapm_sync(dapm);
 
 	return 0;
 }
-- 
2.25.1

