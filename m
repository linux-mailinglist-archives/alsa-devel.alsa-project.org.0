Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1890D57AC1B
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Jul 2022 03:18:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B03741753;
	Wed, 20 Jul 2022 03:18:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B03741753
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658279933;
	bh=uEx/lQnt88bfKacdxJLtZ8QwRBOFjoshJkYSRoTXmew=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QsGrQdhcIQpH6OQGuKxl4KmMpJ8YUUqkSRJRjvqS0WW91Y/rfiZAz63BT5oBpUs+k
	 +kQdZfxrCaeD+UNmiktroRcCpl0dbAQZJd1zP199QEj0je/BrZsScBYNvW0PBIyZe4
	 wDLQ4p1qXNV73ragqhCY16WGhH8PjTBxnC+5VieE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 28773F80559;
	Wed, 20 Jul 2022 03:17:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DD01EF80559; Wed, 20 Jul 2022 03:17:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B2FA5F80125
 for <alsa-devel@alsa-project.org>; Wed, 20 Jul 2022 03:17:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B2FA5F80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="B4QMqPo4"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 327F06176F;
 Wed, 20 Jul 2022 01:17:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E715C385A2;
 Wed, 20 Jul 2022 01:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658279833;
 bh=uEx/lQnt88bfKacdxJLtZ8QwRBOFjoshJkYSRoTXmew=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=B4QMqPo450KRZWBvclH9YehdYCpQs1JlMUwyVAsV1gMNomJEX/7TDSDsgCoZJxaV6
 aVKBCfwhwZgY1DPQAHfLlmdqqQPq16/llH4AYuhp70iWDDFLm3Lb5bbafCDkS+GoED
 aVwJ5Fbg1id6Bu549iA7bI6MXqQN3hAStQPHzLzKGBknD6BZUWiUM92BvDvpxnbJl0
 CldnzzkqryonWMh7qmBsv8F9qNcsGOUAShfcYcfafZtwaEW8aLkhFZd5VAVxxPX4k7
 srB9QmStjgnZnMgxgePjSS4eRBFJ1iT/SI1S4EnSPJh15xK1sAm8Ywn3DkJzgBV2nb
 miBUcKTJjsKPQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 17/25] ASoC: wm8998: Fix event generation for
 input mux
Date: Tue, 19 Jul 2022 21:16:08 -0400
Message-Id: <20220720011616.1024753-17-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220720011616.1024753-1-sashal@kernel.org>
References: <20220720011616.1024753-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Charles Keepax <ckeepax@opensource.cirrus.com>, patches@opensource.cirrus.com,
 tiwai@suse.com, lgirdwood@gmail.com, Mark Brown <broonie@kernel.org>
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

From: Charles Keepax <ckeepax@opensource.cirrus.com>

[ Upstream commit 15b2e5d10ccf32a1a1ae7c636511e2f51320fdb5 ]

wm8998_inmux_put returns the value of snd_soc_dapm_mux_update_power,
which returns a 1 if a path was found for the kcontrol. This is
obviously different to the expected return a 1 if the control
was updated value. This results in spurious notifications to
user-space. Update the handling to only return a 1 when the value is
changed.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Link: https://lore.kernel.org/r/20220628153409.3266932-2-ckeepax@opensource.cirrus.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/wm8998.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/wm8998.c b/sound/soc/codecs/wm8998.c
index 5413254295b7..2491212579f1 100644
--- a/sound/soc/codecs/wm8998.c
+++ b/sound/soc/codecs/wm8998.c
@@ -108,6 +108,7 @@ static int wm8998_inmux_put(struct snd_kcontrol *kcontrol,
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
 	unsigned int mode_reg, mode_index;
 	unsigned int mux, inmode, src_val, mode_val;
+	int change, ret;
 
 	mux = ucontrol->value.enumerated.item[0];
 	if (mux > 1)
@@ -137,14 +138,20 @@ static int wm8998_inmux_put(struct snd_kcontrol *kcontrol,
 	snd_soc_component_update_bits(component, mode_reg,
 				      ARIZONA_IN1_MODE_MASK, mode_val);
 
-	snd_soc_component_update_bits(component, e->reg,
-				      ARIZONA_IN1L_SRC_MASK |
-				      ARIZONA_IN1L_SRC_SE_MASK,
-				      src_val);
+	change = snd_soc_component_update_bits(component, e->reg,
+					       ARIZONA_IN1L_SRC_MASK |
+					       ARIZONA_IN1L_SRC_SE_MASK,
+					       src_val);
 
-	return snd_soc_dapm_mux_update_power(dapm, kcontrol,
-					     ucontrol->value.enumerated.item[0],
-					     e, NULL);
+	ret = snd_soc_dapm_mux_update_power(dapm, kcontrol,
+					    ucontrol->value.enumerated.item[0],
+					    e, NULL);
+	if (ret < 0) {
+		dev_err(arizona->dev, "Failed to update demux power state: %d\n", ret);
+		return ret;
+	}
+
+	return change;
 }
 
 static const char * const wm8998_inmux_texts[] = {
-- 
2.35.1

