Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D042C53B2EE
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jun 2022 07:24:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DCBF4173C;
	Thu,  2 Jun 2022 07:23:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DCBF4173C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654147486;
	bh=R7muiVv/9fpCE6xhaxI4/K+31SjhHgOvwPjMsc4fiJo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lYtNSRM+T60+XiRy2h4gEhKg0ZYy8Qt5x5W/YAWWwGI3Qd15Ow/lEvWvbI+hiaT+U
	 dJcopndc8vXxVo+lU1qQnfjrAU6czmcOfGmeclgIYJgUevwfVMxIptirkxgd2zXth3
	 Wao/f4DLMynRKxX2FBfNH5mJZYcR2MklatrqK1nw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 939D0F8025E;
	Thu,  2 Jun 2022 07:23:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CEA9FF80236; Thu,  2 Jun 2022 07:23:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A819CF80089
 for <alsa-devel@alsa-project.org>; Thu,  2 Jun 2022 07:23:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A819CF80089
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="g4pPatsO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654147419; x=1685683419;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=R7muiVv/9fpCE6xhaxI4/K+31SjhHgOvwPjMsc4fiJo=;
 b=g4pPatsODWqxjJ7yfwR9XbCOMBWFO5z2yXiqZGqAfuVmRxdRPaZ5AMgT
 vZW+BSs6HcIThv6u2ByTIiZS/npzZ9qFM9szQYPkg5zyqHKPddzySkKFy
 F29B70jAdDCZFPDBZwlqEtHAl0qw1jLfnWbn7s0KSlpMjIa6P6UtX65oe
 jBifxcbcUlFfX9lC9hK+1VOMN4z1f+jG4Ba2DGu/4IJkjj4E68ykhihMT
 hkrS9WLpNV2whkBv1MXt5pbAIgLZisTZyBo5BdBAK0r8VL9/Q2On/DelT
 R8jDqR3ZJOouAdxTBgE4PZyZvJAU/fEhaN7MfBsgbNBnoxm6OJtqlyHTj Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10365"; a="263464526"
X-IronPort-AV: E=Sophos;i="5.91,270,1647327600"; d="scan'208";a="263464526"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2022 22:23:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,270,1647327600"; d="scan'208";a="563136430"
Received: from brentlu-brix.itwn.intel.com ([10.5.253.25])
 by orsmga002.jf.intel.com with ESMTP; 01 Jun 2022 22:23:31 -0700
From: Brent Lu <brent.lu@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2] ASoC: Intel: cirrus-common: fix incorrect channel mapping
Date: Thu,  2 Jun 2022 13:19:22 +0800
Message-Id: <20220602051922.1232457-1-brent.lu@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, xliu <xiang.liu@cirrus.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Brent Lu <brent.lu@intel.com>
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

The default mapping of ASPRX1 (DAC source) is slot 0. Change the slot
mapping of right amplifiers (WR and TR) to slot 1 to receive right
channel data. Also update the ACPI instance ID mapping according to HW
configuration.

Signed-off-by: xliu <xiang.liu@cirrus.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
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
2.25.1

