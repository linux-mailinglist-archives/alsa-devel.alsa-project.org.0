Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E80E5B39F6
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Sep 2022 15:57:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C24CD16A4;
	Fri,  9 Sep 2022 15:56:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C24CD16A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662731867;
	bh=JD4zUMnGGwwl8/5VTjKcH/k8sZEy9pMbur8Sb4TqRpg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=l28HexXzRjZcFd2R+sLZF/CCS/kXWSWEXOshTool/Z5hu9qEIIgfKVw24TcasH8D0
	 qgZLsKHeeSbeBmFj01fjT4dyXdHaIUs8ytqjcwJg/DYh200hKy9XuKpG25Fpo8mthJ
	 DW+mmmUVV4PQs/Zgjr3/EJtf4MlTgaUUFPBmmiWQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7072AF8057B;
	Fri,  9 Sep 2022 15:54:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 82CBEF80571; Fri,  9 Sep 2022 15:54:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from hutie.ust.cz (hutie.ust.cz [185.8.165.127])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 23421F804B4
 for <alsa-devel@alsa-project.org>; Fri,  9 Sep 2022 15:54:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23421F804B4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=cutebit.org header.i=@cutebit.org
 header.b="rNVALXYE"
From: =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
 t=1662731680; bh=7ptJCN9nATn9uDBcMGbXpo6rfRfMfA+dgnRJT7fm8AA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=rNVALXYEVGITpfBIDipXLXlJW8g3bx6rGwNFvMaCmnxz3mP4qrE88O7z0WFlKDfPa
 0+VDmBrBRKOurY1q3pOvPrgX6DUVq3n8M5Tl8ydcPny0ZrgggUfB/ewtfdFfDjpiJZ
 WtPpaEseAWnVTZolM2azQ2Sr5oGmrAuMqm8R1LvE=
To: James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Lucas Tanure <tanureal@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>
Subject: [PATCH 08/10] ASoC: cs42l42: Export regmap elements to core namespace
Date: Fri,  9 Sep 2022 15:53:32 +0200
Message-Id: <20220909135334.98220-9-povik+lin@cutebit.org>
In-Reply-To: <20220909135334.98220-1-povik+lin@cutebit.org>
References: <20220909135334.98220-1-povik+lin@cutebit.org>
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

Export the regmap callbacks for indicating readable/volatile registers,
also the range structure, in the CS42L42 core namespace. This is in
advance of reusing these bits in a CS42L83 driver frontend.

Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
---
 sound/soc/codecs/cs42l42.c | 9 ++++++---
 sound/soc/codecs/cs42l42.h | 4 ++++
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
index a22d84db356c..f7a4d51538dd 100644
--- a/sound/soc/codecs/cs42l42.c
+++ b/sound/soc/codecs/cs42l42.c
@@ -171,7 +171,7 @@ static const struct reg_default cs42l42_reg_defaults[] = {
 	{ CS42L42_ASP_RX_DAI1_CH2_BIT_LSB,	0x00 },
 };
 
-static bool cs42l42_readable_register(struct device *dev, unsigned int reg)
+bool cs42l42_readable_register(struct device *dev, unsigned int reg)
 {
 	switch (reg) {
 	case CS42L42_PAGE_REGISTER:
@@ -330,8 +330,9 @@ static bool cs42l42_readable_register(struct device *dev, unsigned int reg)
 		return false;
 	}
 }
+EXPORT_SYMBOL_NS_GPL(cs42l42_readable_register, SND_SOC_CS42L42_CORE);
 
-static bool cs42l42_volatile_register(struct device *dev, unsigned int reg)
+bool cs42l42_volatile_register(struct device *dev, unsigned int reg)
 {
 	switch (reg) {
 	case CS42L42_DEVID_AB:
@@ -362,8 +363,9 @@ static bool cs42l42_volatile_register(struct device *dev, unsigned int reg)
 		return false;
 	}
 }
+EXPORT_SYMBOL_NS_GPL(cs42l42_volatile_register, SND_SOC_CS42L42_CORE);
 
-static const struct regmap_range_cfg cs42l42_page_range = {
+const struct regmap_range_cfg cs42l42_page_range = {
 	.name = "Pages",
 	.range_min = 0,
 	.range_max = CS42L42_MAX_REGISTER,
@@ -373,6 +375,7 @@ static const struct regmap_range_cfg cs42l42_page_range = {
 	.window_start = 0,
 	.window_len = 256,
 };
+EXPORT_SYMBOL_NS_GPL(cs42l42_page_range, SND_SOC_CS42L42_CORE);
 
 const struct regmap_config cs42l42_regmap = {
 	.reg_bits = 8,
diff --git a/sound/soc/codecs/cs42l42.h b/sound/soc/codecs/cs42l42.h
index 2a9f178f6190..be6f979c82ec 100644
--- a/sound/soc/codecs/cs42l42.h
+++ b/sound/soc/codecs/cs42l42.h
@@ -52,10 +52,14 @@ struct  cs42l42_private {
 	bool init_done;
 };
 
+extern const struct regmap_range_cfg cs42l42_page_range;
 extern const struct regmap_config cs42l42_regmap;
 extern const struct snd_soc_component_driver cs42l42_soc_component;
 extern struct snd_soc_dai_driver cs42l42_dai;
 
+bool cs42l42_readable_register(struct device *dev, unsigned int reg);
+bool cs42l42_volatile_register(struct device *dev, unsigned int reg);
+
 int cs42l42_suspend(struct device *dev);
 int cs42l42_resume(struct device *dev);
 void cs42l42_resume_restore(struct device *dev);
-- 
2.33.0

