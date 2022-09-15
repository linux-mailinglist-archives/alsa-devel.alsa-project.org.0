Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E3D5B9803
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Sep 2022 11:48:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 402181677;
	Thu, 15 Sep 2022 11:47:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 402181677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663235295;
	bh=Vwy5b9Pmkr5WUWLxWQLHE6L6yoHGH8pH274DIwcAevY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OZEINiGv1UTy2boRKLeH/pVjnvizRDtkOGxEY2s6g6AcuLZNUa/iy4lZIDiWOmDmU
	 bWRSHkC/RQBxvK8YRI8eYx9ehuKeCNajEZ+bjXfHmtpN44ljVSWDO+23GS1+jKVF16
	 i0XVZ7fxeX8TokgfI5Ao+ST1CQSNOmzksW/cQDL0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E498F80566;
	Thu, 15 Sep 2022 11:45:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 428E9F8054A; Thu, 15 Sep 2022 11:45:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RDNS_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from hutie.ust.cz (unknown [IPv6:2a03:3b40:fe:f0::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0BAC2F80238
 for <alsa-devel@alsa-project.org>; Thu, 15 Sep 2022 11:45:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0BAC2F80238
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=cutebit.org header.i=@cutebit.org
 header.b="rZAk85JG"
From: =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
 t=1663235133; bh=RnoRkuWr8/cOTZp+UVU+8HJliq7IWrJl0jk4wjs4inI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=rZAk85JGtc7RNq70RU9onoXNJ366+U5FbkK8JLMpr/xsiR1vTr1dgcNidX9cZMkyP
 GnWoEbFNOvDnCLvf/uYdpfCNCMvEl5r0CLcGxWMpKoqP5FkA9AVPJTIiKRYt/Q8rxN
 QoJSA1TcyNpBBa0HkSmwbdoINGWZflsnEMjvflIY=
To: James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Lucas Tanure <tanureal@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>
Subject: [PATCH v2 02/11] ASoC: cs42l42: Add bitclock frequency argument to
 cs42l42_pll_config()
Date: Thu, 15 Sep 2022 11:44:35 +0200
Message-Id: <20220915094444.11434-3-povik+lin@cutebit.org>
In-Reply-To: <20220915094444.11434-1-povik+lin@cutebit.org>
References: <20220915094444.11434-1-povik+lin@cutebit.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 - <patches@opensource.cirrus.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 linux-kernel@vger.kernel.org, ChiYuan Huang <cy_huang@richtek.com>,
 asahi@lists.linux.dev, Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Matt Flax <flatmax@flatmax.com>
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

From: Richard Fitzgerald <rf@opensource.cirrus.com>

Clean up the handling of bitclock frequency by keeping all the logic
in cs42l42_pcm_hw_params(), which then simply passes the frequency as
an argument to cs42l42_pll_config().

The previous code had become clunky as a legacy of earlier versions of
the clock handling. The logic was split across cs42l42_pcm_hw_params()
and cs42l42_pll_config(), with the params-derived bclk stashed in
struct cs42l42_private only to pass it to cs42l42_pll_config().

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
---
 sound/soc/codecs/cs42l42.c | 32 ++++++++++++++++----------------
 sound/soc/codecs/cs42l42.h |  1 -
 2 files changed, 16 insertions(+), 17 deletions(-)

diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
index 162540c153f9..4b92ee0e67c4 100644
--- a/sound/soc/codecs/cs42l42.c
+++ b/sound/soc/codecs/cs42l42.c
@@ -647,18 +647,12 @@ static const struct cs42l42_pll_params pll_ratio_table[] = {
 	{ 24576000, 1, 0x03, 0x40, 0x000000, 0x03, 0x10, 12288000, 128, 1}
 };
 
-static int cs42l42_pll_config(struct snd_soc_component *component)
+static int cs42l42_pll_config(struct snd_soc_component *component, unsigned int clk)
 {
 	struct cs42l42_private *cs42l42 = snd_soc_component_get_drvdata(component);
 	int i;
-	u32 clk;
 	u32 fsync;
 
-	if (!cs42l42->sclk)
-		clk = cs42l42->bclk;
-	else
-		clk = cs42l42->sclk;
-
 	/* Don't reconfigure if there is an audio stream running */
 	if (cs42l42->stream_use) {
 		if (pll_ratio_table[cs42l42->pll_config].sclk == clk)
@@ -895,19 +889,25 @@ static int cs42l42_pcm_hw_params(struct snd_pcm_substream *substream,
 	unsigned int width = (params_width(params) / 8) - 1;
 	unsigned int slot_width = 0;
 	unsigned int val = 0;
+	unsigned int bclk;
 	int ret;
 
 	cs42l42->srate = params_rate(params);
 
-	/*
-	 * Assume 24-bit samples are in 32-bit slots, to prevent SCLK being
-	 * more than assumed (which would result in overclocking).
-	 */
-	if (params_width(params) == 24)
-		slot_width = 32;
+	if (cs42l42->sclk) {
+		/* machine driver has set the SCLK */
+		bclk = cs42l42->sclk;
+	} else {
+		/*
+		 * Assume 24-bit samples are in 32-bit slots, to prevent SCLK being
+		 * more than assumed (which would result in overclocking).
+		 */
+		if (params_width(params) == 24)
+			slot_width = 32;
 
-	/* I2S frame always has multiple of 2 channels */
-	cs42l42->bclk = snd_soc_tdm_params_to_bclk(params, slot_width, 0, 2);
+		/* I2S frame always has multiple of 2 channels */
+		bclk = snd_soc_tdm_params_to_bclk(params, slot_width, 0, 2);
+	}
 
 	switch (substream->stream) {
 	case SNDRV_PCM_STREAM_CAPTURE:
@@ -947,7 +947,7 @@ static int cs42l42_pcm_hw_params(struct snd_pcm_substream *substream,
 		break;
 	}
 
-	ret = cs42l42_pll_config(component);
+	ret = cs42l42_pll_config(component, bclk);
 	if (ret)
 		return ret;
 
diff --git a/sound/soc/codecs/cs42l42.h b/sound/soc/codecs/cs42l42.h
index 50299c9f283a..b4ba1467c558 100644
--- a/sound/soc/codecs/cs42l42.h
+++ b/sound/soc/codecs/cs42l42.h
@@ -30,7 +30,6 @@ struct  cs42l42_private {
 	struct snd_soc_jack *jack;
 	struct mutex irq_lock;
 	int pll_config;
-	int bclk;
 	u32 sclk;
 	u32 srate;
 	u8 plug_state;
-- 
2.33.0

