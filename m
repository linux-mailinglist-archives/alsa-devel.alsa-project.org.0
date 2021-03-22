Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E23AF343F05
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Mar 2021 12:08:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6ADB1852;
	Mon, 22 Mar 2021 12:07:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6ADB1852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616411300;
	bh=7AFk6asbqtSEcFL0SrIOMAYd5Of4Tuipw4aIp6KHnHM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=aAiL+9aH8h6cXKB+WpdxxBU/HXs59A3dcE6rckb5Ssw2vc+VWvzfGg6KvfUhscDXD
	 1HhovB/ipvpYQGxQxmLAVW5JQmqQVuf7dYAZLLIMsZF9BZArLs68Y8zSLx+zeUu1H1
	 2L+SfpJA5A1nT1rV8w4aqNxw5u/jzhzBgGwkoNgI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BDDD6F801D5;
	Mon, 22 Mar 2021 12:06:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 76F33F8016B; Mon, 22 Mar 2021 12:06:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 34929F80107
 for <alsa-devel@alsa-project.org>; Mon, 22 Mar 2021 12:06:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 34929F80107
IronPort-SDR: 14LhJ76jnyo2QL9ABrAHE/GDkZ1WpyVTzmJ7ePqDaaKtEhFfPbMO3IXsvFV2XLp4d3g7CCwZs+
 w9kcKuXs1gcg==
X-IronPort-AV: E=McAfee;i="6000,8403,9930"; a="186928989"
X-IronPort-AV: E=Sophos;i="5.81,268,1610438400"; d="scan'208";a="186928989"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2021 04:06:27 -0700
IronPort-SDR: RrajTORRYE1vsu2K4GS1pF36jNF/FsF8cZqEGA2btT7WM2zhIF5m+lFO2gaKQJwa4whLrkmRP6
 HejJt2vFNzYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,268,1610438400"; d="scan'208";a="513268650"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
 by fmsmga001.fm.intel.com with ESMTP; 22 Mar 2021 04:06:24 -0700
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH] ASoC: Intel: Handle device properties with software node API
Date: Mon, 22 Mar 2021 14:06:38 +0300
Message-Id: <20210322110638.2681-1-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Cezary Rojewski <cezary.rojewski@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, linux-kernel@vger.kernel.org,
 Jie Yang <yang.jie@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

The function device_add_properties() is going to be removed.
Replacing it with software node API equivalents.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
Hi,

This patch depends on a fix from mainline, available in v5.12-rc4:

	2a92c90f2ecc ("software node: Fix device_add_software_node()")

Cheers,
---
 sound/soc/intel/boards/bytcht_es8316.c      |  2 +-
 sound/soc/intel/boards/bytcr_rt5640.c       |  2 +-
 sound/soc/intel/boards/bytcr_rt5651.c       |  2 +-
 sound/soc/intel/boards/sof_sdw_rt711.c      | 20 +++++++++++++++-----
 sound/soc/intel/boards/sof_sdw_rt711_sdca.c | 20 +++++++++++++++-----
 5 files changed, 33 insertions(+), 13 deletions(-)

diff --git a/sound/soc/intel/boards/bytcht_es8316.c b/sound/soc/intel/boards/bytcht_es8316.c
index 06df2d46d910b..4a9817a95928c 100644
--- a/sound/soc/intel/boards/bytcht_es8316.c
+++ b/sound/soc/intel/boards/bytcht_es8316.c
@@ -544,7 +544,7 @@ static int snd_byt_cht_es8316_mc_probe(struct platform_device *pdev)
 		props[cnt++] = PROPERTY_ENTRY_BOOL("everest,jack-detect-inverted");
 
 	if (cnt) {
-		ret = device_add_properties(codec_dev, props);
+		ret = device_create_managed_software_node(codec_dev, props, NULL);
 		if (ret) {
 			put_device(codec_dev);
 			return ret;
diff --git a/sound/soc/intel/boards/bytcr_rt5640.c b/sound/soc/intel/boards/bytcr_rt5640.c
index 59d6d47c8d829..661dad81e5bce 100644
--- a/sound/soc/intel/boards/bytcr_rt5640.c
+++ b/sound/soc/intel/boards/bytcr_rt5640.c
@@ -918,7 +918,7 @@ static int byt_rt5640_add_codec_device_props(const char *i2c_dev_name)
 	if (byt_rt5640_quirk & BYT_RT5640_JD_NOT_INV)
 		props[cnt++] = PROPERTY_ENTRY_BOOL("realtek,jack-detect-not-inverted");
 
-	ret = device_add_properties(i2c_dev, props);
+	ret = device_create_managed_software_node(i2c_dev, props, NULL);
 	put_device(i2c_dev);
 
 	return ret;
diff --git a/sound/soc/intel/boards/bytcr_rt5651.c b/sound/soc/intel/boards/bytcr_rt5651.c
index 148b7b1bd3e8c..4cb6ef4c3a3d9 100644
--- a/sound/soc/intel/boards/bytcr_rt5651.c
+++ b/sound/soc/intel/boards/bytcr_rt5651.c
@@ -547,7 +547,7 @@ static int byt_rt5651_add_codec_device_props(struct device *i2c_dev)
 	if (byt_rt5651_quirk & BYT_RT5651_JD_NOT_INV)
 		props[cnt++] = PROPERTY_ENTRY_BOOL("realtek,jack-detect-not-inverted");
 
-	return device_add_properties(i2c_dev, props);
+	return device_create_managed_software_node(i2c_dev, props, NULL);
 }
 
 static int byt_rt5651_init(struct snd_soc_pcm_runtime *runtime)
diff --git a/sound/soc/intel/boards/sof_sdw_rt711.c b/sound/soc/intel/boards/sof_sdw_rt711.c
index 04074c09dded9..b7c635c0fadd5 100644
--- a/sound/soc/intel/boards/sof_sdw_rt711.c
+++ b/sound/soc/intel/boards/sof_sdw_rt711.c
@@ -24,19 +24,29 @@
 static int rt711_add_codec_device_props(const char *sdw_dev_name)
 {
 	struct property_entry props[MAX_NO_PROPS] = {};
+	struct fwnode_handle *fwnode;
 	struct device *sdw_dev;
 	int ret;
 
+	if (!SOF_RT711_JDSRC(sof_sdw_quirk))
+		return 0;
+
 	sdw_dev = bus_find_device_by_name(&sdw_bus_type, NULL, sdw_dev_name);
 	if (!sdw_dev)
 		return -EPROBE_DEFER;
 
-	if (SOF_RT711_JDSRC(sof_sdw_quirk)) {
-		props[0] = PROPERTY_ENTRY_U32("realtek,jd-src",
-					      SOF_RT711_JDSRC(sof_sdw_quirk));
+	props[0] = PROPERTY_ENTRY_U32("realtek,jd-src",
+				      SOF_RT711_JDSRC(sof_sdw_quirk));
+
+	fwnode = fwnode_create_software_node(props, NULL);
+	if (IS_ERR(fwnode)) {
+		put_device(sdw_dev);
+		return PTR_ERR(fwnode);
 	}
 
-	ret = device_add_properties(sdw_dev, props);
+	ret = device_add_software_node(sdw_dev, to_software_node(fwnode));
+
+	fwnode_handle_put(fwnode);
 	put_device(sdw_dev);
 
 	return ret;
@@ -144,7 +154,7 @@ int sof_sdw_rt711_exit(struct device *dev, struct snd_soc_dai_link *dai_link)
 	if (!sdw_dev)
 		return -EINVAL;
 
-	device_remove_properties(sdw_dev);
+	device_remove_software_node(sdw_dev);
 	put_device(sdw_dev);
 
 	return 0;
diff --git a/sound/soc/intel/boards/sof_sdw_rt711_sdca.c b/sound/soc/intel/boards/sof_sdw_rt711_sdca.c
index 19496f0f9110c..300a52d155069 100644
--- a/sound/soc/intel/boards/sof_sdw_rt711_sdca.c
+++ b/sound/soc/intel/boards/sof_sdw_rt711_sdca.c
@@ -24,19 +24,29 @@
 static int rt711_sdca_add_codec_device_props(const char *sdw_dev_name)
 {
 	struct property_entry props[MAX_NO_PROPS] = {};
+	struct fwnode_handle *fwnode;
 	struct device *sdw_dev;
 	int ret;
 
+	if (!SOF_RT711_JDSRC(sof_sdw_quirk))
+		return 0;
+
 	sdw_dev = bus_find_device_by_name(&sdw_bus_type, NULL, sdw_dev_name);
 	if (!sdw_dev)
 		return -EPROBE_DEFER;
 
-	if (SOF_RT711_JDSRC(sof_sdw_quirk)) {
-		props[0] = PROPERTY_ENTRY_U32("realtek,jd-src",
-					      SOF_RT711_JDSRC(sof_sdw_quirk));
+	props[0] = PROPERTY_ENTRY_U32("realtek,jd-src",
+				      SOF_RT711_JDSRC(sof_sdw_quirk));
+
+	fwnode = fwnode_create_software_node(props, NULL);
+	if (IS_ERR(fwnode)) {
+		put_device(sdw_dev);
+		return PTR_ERR(fwnode);
 	}
 
-	ret = device_add_properties(sdw_dev, props);
+	ret = device_add_software_node(sdw_dev, to_software_node(fwnode));
+
+	fwnode_handle_put(fwnode);
 	put_device(sdw_dev);
 
 	return ret;
@@ -144,7 +154,7 @@ int sof_sdw_rt711_sdca_exit(struct device *dev, struct snd_soc_dai_link *dai_lin
 	if (!sdw_dev)
 		return -EINVAL;
 
-	device_remove_properties(sdw_dev);
+	device_remove_software_node(sdw_dev);
 	put_device(sdw_dev);
 
 	return 0;
-- 
2.30.2

