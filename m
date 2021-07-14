Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 692DD3C7CE6
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Jul 2021 05:25:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EDFCD16B4;
	Wed, 14 Jul 2021 05:25:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EDFCD16B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626233152;
	bh=7VcW85F1U1l4VW/2405A1JBzi2YLIbH1KQCkZfD+kIs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=T6E5Q03NKM/Islzzgp1LXwYFBzSeRkrvUp/Wn2GS+szNSvzxJfFOShbCc+Oc8vl1M
	 LuIfZg5d00JglQaD9fXr03yO+t2LQVImn7A5zcb1b3yN/56kSogsnR9Y9xix9nuv1O
	 c6jMSTkRdw6HFUG+tBu/ideKWZXTSqRj8BaNHcW0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B916F804F2;
	Wed, 14 Jul 2021 05:22:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C3C4BF804E0; Wed, 14 Jul 2021 05:22:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 31DF5F8025B
 for <alsa-devel@alsa-project.org>; Wed, 14 Jul 2021 05:22:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 31DF5F8025B
X-IronPort-AV: E=McAfee;i="6200,9189,10044"; a="232086423"
X-IronPort-AV: E=Sophos;i="5.84,238,1620716400"; d="scan'208";a="232086423"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2021 20:22:33 -0700
X-IronPort-AV: E=Sophos;i="5.84,238,1620716400"; d="scan'208";a="459818155"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2021 20:22:31 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 04/10] ASoC: Intel: boards: sof_sdw: add SoundWire mockup
 codecs for tests
Date: Wed, 14 Jul 2021 11:22:03 +0800
Message-Id: <20210714032209.11284-5-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210714032209.11284-1-yung-chuan.liao@linux.intel.com>
References: <20210714032209.11284-1-yung-chuan.liao@linux.intel.com>
Cc: vinod.koul@linaro.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 broonie@kernel.org, sanyog.r.kale@intel.com, bard.liao@intel.com
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

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Add support for SoundWire mockup devices. The configurations assume the
same topology as the CML SoundWire devices and can be used to test the
SOF firmware on a development board (RVP, UpExtreme) without any
hardware connected.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/intel/boards/Kconfig   |  1 +
 sound/soc/intel/boards/sof_sdw.c | 41 ++++++++++++++++++++++++++++++++
 2 files changed, 42 insertions(+)

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index 7e29b0d911e2..046955bf717c 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -602,6 +602,7 @@ config SND_SOC_INTEL_SOUNDWIRE_SOF_MACH
 	select SND_SOC_DMIC
 	select SND_SOC_INTEL_HDA_DSP_COMMON
 	select SND_SOC_INTEL_SOF_MAXIM_COMMON
+	select SND_SOC_SDW_MOCKUP
 	help
 	  Add support for Intel SoundWire-based platforms connected to
 	  MAX98373, RT700, RT711, RT1308 and RT715
diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 1a867c73a48e..82d909ef7a97 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -328,6 +328,19 @@ static const struct snd_soc_ops sdw_ops = {
 	.shutdown = sdw_shutdown,
 };
 
+static int sof_sdw_mic_codec_mockup_init(const struct snd_soc_acpi_link_adr *link,
+					 struct snd_soc_dai_link *dai_links,
+					 struct sof_sdw_codec_info *info,
+					 bool playback)
+{
+	/*
+	 * force DAI link to use same ID as RT715 and DMIC
+	 * to reuse topologies
+	 */
+	dai_links->id = SDW_DMIC_DAI_ID;
+	return 0;
+}
+
 static struct sof_sdw_codec_info codec_info_list[] = {
 	{
 		.part_id = 0x700,
@@ -410,6 +423,34 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 		.dai_name = "rt5682-sdw",
 		.init = sof_sdw_rt5682_init,
 	},
+	{
+		.part_id = 0xaaaa, /* generic codec mockup */
+		.version_id = 0,
+		.direction = {true, true},
+		.dai_name = "sdw-mockup-aif1",
+		.init = NULL,
+	},
+	{
+		.part_id = 0xaa55, /* headset codec mockup */
+		.version_id = 0,
+		.direction = {true, true},
+		.dai_name = "sdw-mockup-aif1",
+		.init = NULL,
+	},
+	{
+		.part_id = 0x55aa, /* amplifier mockup */
+		.version_id = 0,
+		.direction = {true, false},
+		.dai_name = "sdw-mockup-aif1",
+		.init = NULL,
+	},
+	{
+		.part_id = 0x5555,
+		.version_id = 0,
+		.direction = {false, true},
+		.dai_name = "sdw-mockup-aif1",
+		.init = sof_sdw_mic_codec_mockup_init,
+	},
 };
 
 static inline int find_codec_info_part(u64 adr)
-- 
2.17.1

