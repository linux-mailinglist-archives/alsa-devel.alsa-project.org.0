Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 754C354A415
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jun 2022 04:06:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB4EC1877;
	Tue, 14 Jun 2022 04:05:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB4EC1877
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655172400;
	bh=2Z1+VyDmSP217IlxogHI6k4uHyug/J80iBfbbftIv3M=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=W2ndWIvCCSAVd78fhYTzUR/kEUK/8ktycOApGNlf1NWVRwI12TF79TAWAD9yFY8Ca
	 ieqvvWWxsFpLUWTDxEocNurdKjpgf3E/OUnu6+F8rhrFuSKn2gCUBoVw9JQsAQnkaE
	 +T2H4CVcA16UUEBdn6hP9/XIPv5Ddmb/u0yRdiso=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 62622F80535;
	Tue, 14 Jun 2022 04:05:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E117FF80529; Tue, 14 Jun 2022 04:05:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C39A4F80217
 for <alsa-devel@alsa-project.org>; Tue, 14 Jun 2022 04:04:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C39A4F80217
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="qv5Pzz0R"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6E29D60AD8;
 Tue, 14 Jun 2022 02:04:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4B57C34114;
 Tue, 14 Jun 2022 02:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655172297;
 bh=2Z1+VyDmSP217IlxogHI6k4uHyug/J80iBfbbftIv3M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qv5Pzz0RvKnbC7m13Kh3aeo/9YE4supSLeENYWHt/cwYjbwwNu5hn7IbecnYDfQIZ
 JSgm8jGmXvasgd2CNNbG3izPrTNUoXrs10kfmZESicz/vJU+xGEHeZR9qfO3Wd+ME3
 UyT413hhr9o3wcXFL6zv4utIhW5tswm0sQDFSs504CmckV+e0m4BXU2NxBwK05XYPV
 oihVK5KuapA7Rnfw/5MUvPECwJYYSeM/+V+lXGdtf+ZKCdJF/RJYQwSMwVv4iwCfPX
 O23rpyvpN+oUb5ty3M0Q06Ns+FJJ+hik11izg6a8A2r+EXVPi02BYkbt+Akxf+RQ9z
 vtXwExcrCvyNg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.18 08/47] ASoC: Intel: cirrus-common: fix incorrect
 channel mapping
Date: Mon, 13 Jun 2022 22:04:01 -0400
Message-Id: <20220614020441.1098348-8-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220614020441.1098348-1-sashal@kernel.org>
References: <20220614020441.1098348-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 tiwai@suse.com, lgirdwood@gmail.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, xliu <xiang.liu@cirrus.com>,
 Brent Lu <brent.lu@intel.com>
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

From: xliu <xiang.liu@cirrus.com>

[ Upstream commit d69a155555c9d57463b788c400f6b452d976bacd ]

The default mapping of ASPRX1 (DAC source) is slot 0. Change the slot
mapping of right amplifiers (WR and TR) to slot 1 to receive right
channel data. Also update the ACPI instance ID mapping according to HW
configuration.

Signed-off-by: xliu <xiang.liu@cirrus.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20220602051922.1232457-1-brent.lu@intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/intel/boards/sof_cirrus_common.c | 40 +++++++++++++++++++---
 1 file changed, 36 insertions(+), 4 deletions(-)

diff --git a/sound/soc/intel/boards/sof_cirrus_common.c b/sound/soc/intel/boards/sof_cirrus_common.c
index e71d74ec1b0b..f4192df962d6 100644
--- a/sound/soc/intel/boards/sof_cirrus_common.c
+++ b/sound/soc/intel/boards/sof_cirrus_common.c
@@ -54,22 +54,29 @@ static struct snd_soc_dai_link_component cs35l41_components[] = {
 	},
 };
 
+/*
+ * Mapping between ACPI instance id and speaker position.
+ *
+ * Four speakers:
+ *         0: Tweeter left, 1: Woofer left
+ *         2: Tweeter right, 3: Woofer right
+ */
 static struct snd_soc_codec_conf cs35l41_codec_conf[] = {
 	{
 		.dlc = COMP_CODEC_CONF(CS35L41_DEV0_NAME),
-		.name_prefix = "WL",
+		.name_prefix = "TL",
 	},
 	{
 		.dlc = COMP_CODEC_CONF(CS35L41_DEV1_NAME),
-		.name_prefix = "WR",
+		.name_prefix = "WL",
 	},
 	{
 		.dlc = COMP_CODEC_CONF(CS35L41_DEV2_NAME),
-		.name_prefix = "TL",
+		.name_prefix = "TR",
 	},
 	{
 		.dlc = COMP_CODEC_CONF(CS35L41_DEV3_NAME),
-		.name_prefix = "TR",
+		.name_prefix = "WR",
 	},
 };
 
@@ -101,6 +108,21 @@ static int cs35l41_init(struct snd_soc_pcm_runtime *rtd)
 	return ret;
 }
 
+/*
+ * Channel map:
+ *
+ * TL/WL: ASPRX1 on slot 0, ASPRX2 on slot 1 (default)
+ * TR/WR: ASPRX1 on slot 1, ASPRX2 on slot 0
+ */
+static const struct {
+	unsigned int rx[2];
+} cs35l41_channel_map[] = {
+	{.rx = {0, 1}}, /* TL */
+	{.rx = {0, 1}}, /* WL */
+	{.rx = {1, 0}}, /* TR */
+	{.rx = {1, 0}}, /* WR */
+};
+
 static int cs35l41_hw_params(struct snd_pcm_substream *substream,
 			     struct snd_pcm_hw_params *params)
 {
@@ -134,6 +156,16 @@ static int cs35l41_hw_params(struct snd_pcm_substream *substream,
 				ret);
 			return ret;
 		}
+
+		/* setup channel map */
+		ret = snd_soc_dai_set_channel_map(codec_dai, 0, NULL,
+						  ARRAY_SIZE(cs35l41_channel_map[i].rx),
+						  (unsigned int *)cs35l41_channel_map[i].rx);
+		if (ret < 0) {
+			dev_err(codec_dai->dev, "fail to set channel map, ret %d\n",
+				ret);
+			return ret;
+		}
 	}
 
 	return 0;
-- 
2.35.1

