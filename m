Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B8D05B9805
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Sep 2022 11:48:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B05F417F9;
	Thu, 15 Sep 2022 11:47:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B05F417F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663235321;
	bh=qxjB53bCQfEdI9j3a5hmM4BrPFZY5PDfJxVZuFF9XcE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BRmk1s0Ku691nF34b7TRSy2XClen69CxPx3ws3ihIJ+w7NrYvvzoOw+xYTP1tWASF
	 E4UwkqD5q+E6VFeSeNhXbwKRcsrJYRlM+eiEyhdbhlHIBezwQXdmo84zMa7WDPRLp4
	 Ayt7w9LUgfyqo/6w1mRe0tziRFS3mtP2Asg8OEsQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 41DACF8057A;
	Thu, 15 Sep 2022 11:45:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 09D37F8055B; Thu, 15 Sep 2022 11:45:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RDNS_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from hutie.ust.cz (unknown [IPv6:2a03:3b40:fe:f0::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 19C1EF800FE
 for <alsa-devel@alsa-project.org>; Thu, 15 Sep 2022 11:45:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 19C1EF800FE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=cutebit.org header.i=@cutebit.org
 header.b="ILCBgd+d"
From: =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
 t=1663235136; bh=5iADcUyCkoKBLtPlXxKURQhY4TmQ9CXYiJ51cQuH6qI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=ILCBgd+d2F1xL5yu8ExrZbyMrdANyfkHWDDq1OYbz9YKhvikJan6iTzh+1Qji5Z7x
 jEnAyyGRvAKxwoE+PdMbGByP02azv2pzva2VVwhm2zJmP8JGQ4cO4e9GPnxhxWNgKh
 84TYPjlcgAAsejYG1goLel0jkxdD0OrBBH36NYBk=
To: James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Lucas Tanure <tanureal@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>
Subject: [PATCH v2 08/11] ASoC: cs42l42: Export regmap elements to core
 namespace
Date: Thu, 15 Sep 2022 11:44:41 +0200
Message-Id: <20220915094444.11434-9-povik+lin@cutebit.org>
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

Export the regmap callbacks for indicating readable/volatile registers,
also the range structure, to the CS42L42 core namespace. This is in
advance of reusing these bits in a CS42L83 driver frontend.

Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
---
 sound/soc/codecs/cs42l42.c | 9 ++++++---
 sound/soc/codecs/cs42l42.h | 4 ++++
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
index 3ace16259d1a..7b9237f0ce78 100644
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

