Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC6D188C891
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Mar 2024 17:08:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 192F22BD7;
	Tue, 26 Mar 2024 17:07:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 192F22BD7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711469283;
	bh=fZxnibU93p/ekxAxl4/k7QCGk+QjngNBvoyRs5ReYv4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eXSq4N2TpODJNNTRVWigu5j6wwio810oW0SSjVJNU93GgDSwbx1zAVyJm9NpPL0TR
	 +WyZhNvKmknn1unpd3qpn6vCoG/YgzMkYxGA541fSlUdcmrquuQ21+uWmjVKZXMogl
	 FaML2/k76uiFGG5D86R9zBEZ+N633eqwU4ytMdGI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 08073F80587; Tue, 26 Mar 2024 17:06:21 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C520CF80698;
	Tue, 26 Mar 2024 17:06:20 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 26697F805B4; Tue, 26 Mar 2024 17:05:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0EC12F80564
	for <alsa-devel@alsa-project.org>; Tue, 26 Mar 2024 17:05:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0EC12F80564
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=aKlyApk1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711469132; x=1743005132;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fZxnibU93p/ekxAxl4/k7QCGk+QjngNBvoyRs5ReYv4=;
  b=aKlyApk1KwK3tSMjooXca0J0DpTlObLac97nipvWuuBbV3qMMhZXvURb
   dC77kAcFO4Y/Rvbk6rplNhsCfCE7tPo5iP9HSaq7+DeN4UtFgJj7ew3ci
   ipbi9zIo/+8f9/Imc6Y54OGx8ZxW+MNdYtti84igbwAWINuBTgMfKlMOS
   vpP0zEK34/yR9DeJLVJnTuglc16CPNJs0VXzbuPCGF+dJTvbcLjZI9aGA
   3IqE5l4+jsjjflbsgnU1rLjMiv/wetD94EFsPYEkxAHBiUV0Itn/ez2S2
   sWMZZ+AJiEu5ky09xe0gzFaLjn6kNdTDuYEnyQz/YlG2IdgsjnrAT2scH
   g==;
X-CSE-ConnectionGUID: 8MyMDICDSZ2nIuYrAPn53A==
X-CSE-MsgGUID: mwGshM3OSPeNB7AkJz2lHA==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="17260363"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000";
   d="scan'208";a="17260363"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 09:04:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000";
   d="scan'208";a="20482166"
Received: from bhubbert-mobl.amr.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.212.65.108])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 09:04:46 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Shuming Fan <shumingf@realtek.com>,
	Jack Yu <jack.yu@realtek.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Bard liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 06/34] ASoC: Intel: sof_sdw: Move get_codec_dai_by_name() into
 sof_sdw itself
Date: Tue, 26 Mar 2024 11:04:01 -0500
Message-Id: <20240326160429.13560-7-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240326160429.13560-1-pierre-louis.bossart@linux.intel.com>
References: <20240326160429.13560-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 42L2CXR36KF3SRQ2U7SQO734VYZZJVEP
X-Message-ID-Hash: 42L2CXR36KF3SRQ2U7SQO734VYZZJVEP
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/42L2CXR36KF3SRQ2U7SQO734VYZZJVEP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Charles Keepax <ckeepax@opensource.cirrus.com>

Currently sof_sdw relies on sof_board_helpers to provide
get_codec_dai_by_name(), but that is the only function from
sof_board_helpers it uses and no other machine driver requires
that function. There is no reason for sof_sdw to select SSP_COMMON
but more and more functions in sof_board_helpers are gaining
dependencies on functions that would require stubs for sof_sdw to
build without it.  Firstly it was sof_ssp_get_codec_name(), as was
fixed in commit c1469c3a8a30 ("ASoC: Intel: ssp-common: Add stub for
sof_ssp_get_codec_name"), now it is:

ERROR: modpost: "sof_ssp_detect_amp_type"
[sound/soc/intel/boards/snd-soc-intel-sof-board-helpers.ko] undefined!
ERROR: modpost: "sof_ssp_detect_codec_type"
[sound/soc/intel/boards/snd-soc-intel-sof-board-helpers.ko] undefined!

Rather than adding more stubs, simply move the affected function
to the sof_sdw machine driver itself and no longer select
SND_SOC_INTEL_SOF_BOARD_HELPERS at all. This should allow work on
SSP_COMMON to progress without affecting sof_sdw.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/Kconfig                 |  1 -
 sound/soc/intel/boards/sof_board_helpers.c     | 18 ------------------
 sound/soc/intel/boards/sof_board_helpers.h     |  3 ---
 sound/soc/intel/boards/sof_sdw.c               | 18 ++++++++++++++++++
 sound/soc/intel/boards/sof_sdw_common.h        |  4 ++++
 sound/soc/intel/boards/sof_sdw_cs42l42.c       |  1 -
 sound/soc/intel/boards/sof_sdw_rt5682.c        |  1 -
 sound/soc/intel/boards/sof_sdw_rt700.c         |  1 -
 sound/soc/intel/boards/sof_sdw_rt711.c         |  1 -
 sound/soc/intel/boards/sof_sdw_rt712_sdca.c    |  1 -
 .../intel/boards/sof_sdw_rt_sdca_jack_common.c |  1 -
 sound/soc/intel/boards/sof_ssp_common.h        |  7 -------
 12 files changed, 22 insertions(+), 35 deletions(-)

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index e5df64fec319..b7a6ac4b6c0c 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -678,7 +678,6 @@ config SND_SOC_INTEL_SOUNDWIRE_SOF_MACH
 	depends on MFD_INTEL_LPSS || COMPILE_TEST
 	depends on SND_SOC_INTEL_USER_FRIENDLY_LONG_NAMES || COMPILE_TEST
 	depends on SOUNDWIRE
-	select SND_SOC_INTEL_SOF_BOARD_HELPERS
 	select SND_SOC_MAX98363
 	select SND_SOC_MAX98373_I2C
 	select SND_SOC_MAX98373_SDW
diff --git a/sound/soc/intel/boards/sof_board_helpers.c b/sound/soc/intel/boards/sof_board_helpers.c
index a5135be94f32..586600680e84 100644
--- a/sound/soc/intel/boards/sof_board_helpers.c
+++ b/sound/soc/intel/boards/sof_board_helpers.c
@@ -630,24 +630,6 @@ sof_intel_board_get_ctx(struct device *dev, unsigned long board_quirk)
 }
 EXPORT_SYMBOL_NS(sof_intel_board_get_ctx, SND_SOC_INTEL_SOF_BOARD_HELPERS);
 
-struct snd_soc_dai *get_codec_dai_by_name(struct snd_soc_pcm_runtime *rtd,
-					  const char * const dai_name[], int num_dais)
-{
-	struct snd_soc_dai *dai;
-	int index;
-	int i;
-
-	for (index = 0; index < num_dais; index++)
-		for_each_rtd_codec_dais(rtd, i, dai)
-			if (strstr(dai->name, dai_name[index])) {
-				dev_dbg(rtd->card->dev, "get dai %s\n", dai->name);
-				return dai;
-			}
-
-	return NULL;
-}
-EXPORT_SYMBOL_NS(get_codec_dai_by_name, SND_SOC_INTEL_SOF_BOARD_HELPERS);
-
 MODULE_DESCRIPTION("ASoC Intel SOF Machine Driver Board Helpers");
 MODULE_AUTHOR("Brent Lu <brent.lu@intel.com>");
 MODULE_LICENSE("GPL");
diff --git a/sound/soc/intel/boards/sof_board_helpers.h b/sound/soc/intel/boards/sof_board_helpers.h
index 2f27ad8726f8..b6a83ca14fa8 100644
--- a/sound/soc/intel/boards/sof_board_helpers.h
+++ b/sound/soc/intel/boards/sof_board_helpers.h
@@ -167,7 +167,4 @@ int sof_intel_board_set_dai_link(struct device *dev, struct snd_soc_card *card,
 struct sof_card_private *
 sof_intel_board_get_ctx(struct device *dev, unsigned long board_quirk);
 
-struct snd_soc_dai *get_codec_dai_by_name(struct snd_soc_pcm_runtime *rtd,
-					  const char * const dai_name[], int num_dais);
-
 #endif /* __SOF_INTEL_BOARD_HELPERS_H */
diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index e2c1822b185f..45732884e310 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -514,6 +514,24 @@ static struct snd_soc_dai_link_component platform_component[] = {
 	}
 };
 
+struct snd_soc_dai *get_codec_dai_by_name(struct snd_soc_pcm_runtime *rtd,
+					  const char * const dai_name[],
+					  int num_dais)
+{
+	struct snd_soc_dai *dai;
+	int index;
+	int i;
+
+	for (index = 0; index < num_dais; index++)
+		for_each_rtd_codec_dais(rtd, i, dai)
+			if (strstr(dai->name, dai_name[index])) {
+				dev_dbg(rtd->card->dev, "get dai %s\n", dai->name);
+				return dai;
+			}
+
+	return NULL;
+}
+
 /* these wrappers are only needed to avoid typecast compilation errors */
 int sdw_startup(struct snd_pcm_substream *substream)
 {
diff --git a/sound/soc/intel/boards/sof_sdw_common.h b/sound/soc/intel/boards/sof_sdw_common.h
index b1d57034361c..a04cbab9bc70 100644
--- a/sound/soc/intel/boards/sof_sdw_common.h
+++ b/sound/soc/intel/boards/sof_sdw_common.h
@@ -107,6 +107,10 @@ struct mc_private {
 
 extern unsigned long sof_sdw_quirk;
 
+struct snd_soc_dai *get_codec_dai_by_name(struct snd_soc_pcm_runtime *rtd,
+					  const char * const dai_name[],
+					  int num_dais);
+
 int sdw_startup(struct snd_pcm_substream *substream);
 int sdw_prepare(struct snd_pcm_substream *substream);
 int sdw_trigger(struct snd_pcm_substream *substream, int cmd);
diff --git a/sound/soc/intel/boards/sof_sdw_cs42l42.c b/sound/soc/intel/boards/sof_sdw_cs42l42.c
index 0dc297f7de01..b999f4e7901a 100644
--- a/sound/soc/intel/boards/sof_sdw_cs42l42.c
+++ b/sound/soc/intel/boards/sof_sdw_cs42l42.c
@@ -15,7 +15,6 @@
 #include <sound/soc-acpi.h>
 #include <sound/soc-dapm.h>
 #include <sound/jack.h>
-#include "sof_board_helpers.h"
 #include "sof_sdw_common.h"
 
 static const struct snd_soc_dapm_widget cs42l42_widgets[] = {
diff --git a/sound/soc/intel/boards/sof_sdw_rt5682.c b/sound/soc/intel/boards/sof_sdw_rt5682.c
index 6b008a5a343b..f812aea64322 100644
--- a/sound/soc/intel/boards/sof_sdw_rt5682.c
+++ b/sound/soc/intel/boards/sof_sdw_rt5682.c
@@ -15,7 +15,6 @@
 #include <sound/soc-acpi.h>
 #include <sound/soc-dapm.h>
 #include <sound/jack.h>
-#include "sof_board_helpers.h"
 #include "sof_sdw_common.h"
 
 static const struct snd_soc_dapm_widget rt5682_widgets[] = {
diff --git a/sound/soc/intel/boards/sof_sdw_rt700.c b/sound/soc/intel/boards/sof_sdw_rt700.c
index 88e785a54b16..a2648c900e74 100644
--- a/sound/soc/intel/boards/sof_sdw_rt700.c
+++ b/sound/soc/intel/boards/sof_sdw_rt700.c
@@ -13,7 +13,6 @@
 #include <sound/soc-acpi.h>
 #include <sound/soc-dapm.h>
 #include <sound/jack.h>
-#include "sof_board_helpers.h"
 #include "sof_sdw_common.h"
 
 static const struct snd_soc_dapm_widget rt700_widgets[] = {
diff --git a/sound/soc/intel/boards/sof_sdw_rt711.c b/sound/soc/intel/boards/sof_sdw_rt711.c
index cdd1587b246c..9762c48ba7a9 100644
--- a/sound/soc/intel/boards/sof_sdw_rt711.c
+++ b/sound/soc/intel/boards/sof_sdw_rt711.c
@@ -15,7 +15,6 @@
 #include <sound/soc-acpi.h>
 #include <sound/soc-dapm.h>
 #include <sound/jack.h>
-#include "sof_board_helpers.h"
 #include "sof_sdw_common.h"
 
 /*
diff --git a/sound/soc/intel/boards/sof_sdw_rt712_sdca.c b/sound/soc/intel/boards/sof_sdw_rt712_sdca.c
index ebb4b58c198b..9c898c7286af 100644
--- a/sound/soc/intel/boards/sof_sdw_rt712_sdca.c
+++ b/sound/soc/intel/boards/sof_sdw_rt712_sdca.c
@@ -13,7 +13,6 @@
 #include <sound/soc.h>
 #include <sound/soc-acpi.h>
 #include <sound/soc-dapm.h>
-#include "sof_board_helpers.h"
 #include "sof_sdw_common.h"
 
 static const struct snd_soc_dapm_widget rt712_spk_widgets[] = {
diff --git a/sound/soc/intel/boards/sof_sdw_rt_sdca_jack_common.c b/sound/soc/intel/boards/sof_sdw_rt_sdca_jack_common.c
index 5253d8332780..fe59a144efef 100644
--- a/sound/soc/intel/boards/sof_sdw_rt_sdca_jack_common.c
+++ b/sound/soc/intel/boards/sof_sdw_rt_sdca_jack_common.c
@@ -15,7 +15,6 @@
 #include <sound/soc-acpi.h>
 #include <sound/soc-dapm.h>
 #include <sound/jack.h>
-#include "sof_board_helpers.h"
 #include "sof_sdw_common.h"
 
 /*
diff --git a/sound/soc/intel/boards/sof_ssp_common.h b/sound/soc/intel/boards/sof_ssp_common.h
index d24888bc99fd..ff84154ce60a 100644
--- a/sound/soc/intel/boards/sof_ssp_common.h
+++ b/sound/soc/intel/boards/sof_ssp_common.h
@@ -68,13 +68,6 @@ enum sof_ssp_codec {
 enum sof_ssp_codec sof_ssp_detect_codec_type(struct device *dev);
 enum sof_ssp_codec sof_ssp_detect_amp_type(struct device *dev);
 
-#if IS_ENABLED(CONFIG_SND_SOC_INTEL_SOF_SSP_COMMON)
 const char *sof_ssp_get_codec_name(enum sof_ssp_codec codec_type);
-#else
-static inline const char *sof_ssp_get_codec_name(enum sof_ssp_codec codec_type)
-{
-	return NULL;
-}
-#endif
 
 #endif /* __SOF_SSP_COMMON_H */
-- 
2.40.1

