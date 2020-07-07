Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B4822179F1
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jul 2020 23:02:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 01044167B;
	Tue,  7 Jul 2020 23:02:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 01044167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594155770;
	bh=N4AZz/lj8mf0uPAKpS2+wcrzPj3FHgCsj60hJP+9g+w=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PsqZ3++U0nBuLAnafcUd2QUGKqAfD0DXkqpnV4K/PJ+wNAAN8B7E0SPJusAYZ2Cgw
	 jnW2qEYrHxEXUoHGnq9W9x4k+/Kl5qmaeKrEBf3RXJEqU+Qr/BCfqBL4OABjCd7Db2
	 GHPqAasSyjlrPIPZr1lW/Ps9SJbuKLlFr8Dvms2Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 58693F802EB;
	Tue,  7 Jul 2020 22:58:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7605FF802DD; Tue,  7 Jul 2020 22:58:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C83CCF80216
 for <alsa-devel@alsa-project.org>; Tue,  7 Jul 2020 22:58:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C83CCF80216
IronPort-SDR: qQyOAQCogTknKs6kS6VUMy+Bn0MfFjeA+kCj31L6LUcLjqfd93t9/1D8Pgl0jmya0uLAl+mlH4
 61nXB9vXdI2w==
X-IronPort-AV: E=McAfee;i="6000,8403,9675"; a="146762921"
X-IronPort-AV: E=Sophos;i="5.75,325,1589266800"; d="scan'208";a="146762921"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2020 13:57:56 -0700
IronPort-SDR: n4/oifpWhCZv6war4h+JsBgqFc4kCJXgOxjhZgQ9BQl75zZyCIsldmkIo374pb1KI9O5pcfQzN
 nDaPi4j674TA==
X-IronPort-AV: E=Sophos;i="5.75,325,1589266800"; d="scan'208";a="305796658"
Received: from colvinch-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.255.229.3])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2020 13:57:55 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 6/6] ASoC: Intel: sdw_max98373: add card_late_probe support
Date: Tue,  7 Jul 2020 15:57:40 -0500
Message-Id: <20200707205740.114927-7-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200707205740.114927-1-pierre-louis.bossart@linux.intel.com>
References: <20200707205740.114927-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 randerwang <rander.wang@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

From: randerwang <rander.wang@linux.intel.com>

Disable Left and Right Spk pin after boot so that sof can
get suspended. Please check patch: ASoC: Intel: Boards:
tgl_max98373: add dai_trigger function

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: randerwang <rander.wang@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c          | 19 ++++++++++++++++++-
 sound/soc/intel/boards/sof_sdw_common.h   |  6 ++++++
 sound/soc/intel/boards/sof_sdw_max98373.c | 12 ++++++++++++
 3 files changed, 36 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 45be9ec6d4ef..be8eccb50450 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -237,6 +237,7 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 		.direction = {true, true},
 		.dai_name = "max98373-aif1",
 		.init = sof_sdw_mx8373_init,
+		.codec_card_late_probe = sof_sdw_mx8373_late_probe,
 	},
 	{
 		.id = 0x5682,
@@ -927,13 +928,29 @@ static int sof_card_dai_links_create(struct device *dev,
 	return 0;
 }
 
+static int sof_sdw_card_late_probe(struct snd_soc_card *card)
+{
+	int i, ret;
+
+	for (i = 0; i < ARRAY_SIZE(codec_info_list); i++) {
+		if (!codec_info_list[i].late_probe)
+			continue;
+
+		ret = codec_info_list[i].codec_card_late_probe(card);
+		if (ret < 0)
+			return ret;
+	}
+
+	return sof_sdw_hdmi_card_late_probe(card);
+}
+
 /* SoC card */
 static const char sdw_card_long_name[] = "Intel Soundwire SOF";
 
 static struct snd_soc_card card_sof_sdw = {
 	.name = "soundwire",
 	.owner = THIS_MODULE,
-	.late_probe = sof_sdw_hdmi_card_late_probe,
+	.late_probe = sof_sdw_card_late_probe,
 	.codec_conf = codec_conf,
 	.num_configs = ARRAY_SIZE(codec_conf),
 };
diff --git a/sound/soc/intel/boards/sof_sdw_common.h b/sound/soc/intel/boards/sof_sdw_common.h
index 3f820cf99a89..426017626b16 100644
--- a/sound/soc/intel/boards/sof_sdw_common.h
+++ b/sound/soc/intel/boards/sof_sdw_common.h
@@ -11,6 +11,7 @@
 
 #include <linux/bits.h>
 #include <linux/types.h>
+#include <sound/soc.h>
 
 #define MAX_NO_PROPS 2
 #define MAX_HDMI_NUM 4
@@ -61,6 +62,9 @@ struct sof_sdw_codec_info {
 		     struct snd_soc_dai_link *dai_links,
 		     struct sof_sdw_codec_info *info,
 		     bool playback);
+
+	bool late_probe;
+	int (*codec_card_late_probe)(struct snd_soc_card *card);
 };
 
 struct mc_private {
@@ -114,6 +118,8 @@ int sof_sdw_mx8373_init(const struct snd_soc_acpi_link_adr *link,
 			struct sof_sdw_codec_info *info,
 			bool playback);
 
+int sof_sdw_mx8373_late_probe(struct snd_soc_card *card);
+
 /* RT5682 support */
 int sof_sdw_rt5682_init(const struct snd_soc_acpi_link_adr *link,
 			struct snd_soc_dai_link *dai_links,
diff --git a/sound/soc/intel/boards/sof_sdw_max98373.c b/sound/soc/intel/boards/sof_sdw_max98373.c
index a38ddc099a95..6437872a9b3d 100644
--- a/sound/soc/intel/boards/sof_sdw_max98373.c
+++ b/sound/soc/intel/boards/sof_sdw_max98373.c
@@ -68,7 +68,19 @@ int sof_sdw_mx8373_init(const struct snd_soc_acpi_link_adr *link,
 	if (info->amp_num == 2)
 		dai_links->init = spk_init;
 
+	info->late_probe = true;
+
 	dai_links->ops = &max_98373_sdw_ops;
 
 	return 0;
 }
+
+int sof_sdw_mx8373_late_probe(struct snd_soc_card *card)
+{
+	struct snd_soc_dapm_context *dapm = &card->dapm;
+
+	/* Disable Left and Right Spk pin after boot */
+	snd_soc_dapm_disable_pin(dapm, "Left Spk");
+	snd_soc_dapm_disable_pin(dapm, "Right Spk");
+	return snd_soc_dapm_sync(dapm);
+}
-- 
2.25.1

