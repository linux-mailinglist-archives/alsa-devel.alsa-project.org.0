Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E4510613AB3
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Oct 2022 16:51:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DAF62167E;
	Mon, 31 Oct 2022 16:50:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DAF62167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667231493;
	bh=zVza61ODT+oGt5B80NGqLzU3XwebMfpluHyEQSk6bS8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NrrsNScLNyCxadFLhlsAWPhPq5HBL50z0D5p/lCzn4rz2JBxMAezCp3UAx2DAZdi5
	 Vp2h0v07sIRY5XDku9eOnDBho57/cBl82M1CHpaduRuipSFjvymCRYorklUKhgmOvb
	 bJDg3fGrIsFUV4Zd4AhphJXwP3bbnNdNKSpOFlg4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A769F80558;
	Mon, 31 Oct 2022 16:49:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E923EF80553; Mon, 31 Oct 2022 16:49:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BD404F80163
 for <alsa-devel@alsa-project.org>; Mon, 31 Oct 2022 16:49:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BD404F80163
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="cBKXBPrr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667231389; x=1698767389;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zVza61ODT+oGt5B80NGqLzU3XwebMfpluHyEQSk6bS8=;
 b=cBKXBPrr7fNrXN5RWjduSi3w09uuoKSX8dgT5VIfRg4FWFbaK+EjJPKs
 GgeNZdTALhKYJUku23M9aK9lTSrOuyf7wZl/15IPtBENhwLzTWiPijB0D
 MGStAfMAQY6wPPj1+zP4zhGYlKU/OeXohYXjQum4AjWAXEU5ObDOktDNN
 1YnHNhwzSfrppd90n5kxDdxYdPcBYvaNN1dV6BJ1XgsJ1tm53H39PhwzY
 SGW2iRF1PGH+0I2clc7u6SIjmmgYi42aPqqIO1ik/fcr8Mv7o3+WVBkaz
 KUFAQrlftoZ3GIAwx5J0Dhf6Qr8RdGpvt+fWC5K3u08sxYT+4qdhpPDYg w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10517"; a="308929912"
X-IronPort-AV: E=Sophos;i="5.95,228,1661842800"; d="scan'208";a="308929912"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2022 08:49:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10517"; a="776178900"
X-IronPort-AV: E=Sophos;i="5.95,228,1661842800"; d="scan'208";a="776178900"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga001.fm.intel.com with ESMTP; 31 Oct 2022 08:49:38 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 2/7] ASoC: Intel: Drop da7219_aad_jack_det() usage
Date: Mon, 31 Oct 2022 17:02:22 +0100
Message-Id: <20221031160227.2352630-3-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221031160227.2352630-1-cezary.rojewski@intel.com>
References: <20221031160227.2352630-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, Vijendar.Mukunda@amd.com,
 heiko@sntech.de, AjitKumar.Pandey@amd.com, linux-rockchip@lists.infradead.org,
 tiwai@suse.com, pierre-louis.bossart@linux.intel.com, jiaxin.yu@mediatek.com,
 lgirdwood@gmail.com, hdegoede@redhat.com, Syed.SabaKareem@amd.com,
 amadeuszx.slawinski@linux.intel.com, trevor.wu@mediatek.com
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

Do not access the internal function directly, do so through
component->set_jack() instead.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/boards/bxt_da7219_max98357a.c | 3 +--
 sound/soc/intel/boards/kbl_da7219_max98357a.c | 3 +--
 sound/soc/intel/boards/kbl_da7219_max98927.c  | 3 +--
 sound/soc/intel/boards/sof_da7219_max98373.c  | 4 ++--
 4 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/sound/soc/intel/boards/bxt_da7219_max98357a.c b/sound/soc/intel/boards/bxt_da7219_max98357a.c
index 7c6c95e99ade..c593995facaa 100644
--- a/sound/soc/intel/boards/bxt_da7219_max98357a.c
+++ b/sound/soc/intel/boards/bxt_da7219_max98357a.c
@@ -19,7 +19,6 @@
 #include <sound/soc-acpi.h>
 #include "../../codecs/hdac_hdmi.h"
 #include "../../codecs/da7219.h"
-#include "../../codecs/da7219-aad.h"
 #include "../common/soc-intel-quirks.h"
 #include "hda_dsp_common.h"
 
@@ -259,7 +258,7 @@ static int broxton_da7219_codec_init(struct snd_soc_pcm_runtime *rtd)
 	snd_jack_set_key(broxton_headset.jack, SND_JACK_BTN_3,
 			 KEY_VOICECOMMAND);
 
-	da7219_aad_jack_det(component, &broxton_headset);
+	snd_soc_component_set_jack(component, &broxton_headset, NULL);
 
 	snd_soc_dapm_ignore_suspend(&rtd->card->dapm, "SoC DMIC");
 
diff --git a/sound/soc/intel/boards/kbl_da7219_max98357a.c b/sound/soc/intel/boards/kbl_da7219_max98357a.c
index 329457e3e3a2..18365ce6bcba 100644
--- a/sound/soc/intel/boards/kbl_da7219_max98357a.c
+++ b/sound/soc/intel/boards/kbl_da7219_max98357a.c
@@ -19,7 +19,6 @@
 #include <sound/soc.h>
 #include "../../codecs/da7219.h"
 #include "../../codecs/hdac_hdmi.h"
-#include "../../codecs/da7219-aad.h"
 
 #define KBL_DIALOG_CODEC_DAI "da7219-hifi"
 #define KBL_MAXIM_CODEC_DAI "HiFi"
@@ -207,7 +206,7 @@ static int kabylake_da7219_codec_init(struct snd_soc_pcm_runtime *rtd)
 	snd_jack_set_key(jack->jack, SND_JACK_BTN_1, KEY_VOLUMEUP);
 	snd_jack_set_key(jack->jack, SND_JACK_BTN_2, KEY_VOLUMEDOWN);
 	snd_jack_set_key(jack->jack, SND_JACK_BTN_3, KEY_VOICECOMMAND);
-	da7219_aad_jack_det(component, &ctx->kabylake_headset);
+	snd_soc_component_set_jack(component, &ctx->kabylake_headset, NULL);
 
 	ret = snd_soc_dapm_ignore_suspend(&rtd->card->dapm, "SoC DMIC");
 	if (ret)
diff --git a/sound/soc/intel/boards/kbl_da7219_max98927.c b/sound/soc/intel/boards/kbl_da7219_max98927.c
index 362579f25835..ad4223fee0c5 100644
--- a/sound/soc/intel/boards/kbl_da7219_max98927.c
+++ b/sound/soc/intel/boards/kbl_da7219_max98927.c
@@ -19,7 +19,6 @@
 #include <sound/soc.h>
 #include "../../codecs/da7219.h"
 #include "../../codecs/hdac_hdmi.h"
-#include "../../codecs/da7219-aad.h"
 
 #define KBL_DIALOG_CODEC_DAI	"da7219-hifi"
 #define MAX98927_CODEC_DAI	"max98927-aif1"
@@ -382,7 +381,7 @@ static int kabylake_da7219_codec_init(struct snd_soc_pcm_runtime *rtd)
 	snd_jack_set_key(jack->jack, SND_JACK_BTN_2, KEY_VOLUMEDOWN);
 	snd_jack_set_key(jack->jack, SND_JACK_BTN_3, KEY_VOICECOMMAND);
 
-	da7219_aad_jack_det(component, &ctx->kabylake_headset);
+	snd_soc_component_set_jack(component, &ctx->kabylake_headset, NULL);
 
 	return 0;
 }
diff --git a/sound/soc/intel/boards/sof_da7219_max98373.c b/sound/soc/intel/boards/sof_da7219_max98373.c
index e048e789e633..740aa11cb019 100644
--- a/sound/soc/intel/boards/sof_da7219_max98373.c
+++ b/sound/soc/intel/boards/sof_da7219_max98373.c
@@ -7,13 +7,13 @@
 
 #include <linux/input.h>
 #include <linux/module.h>
+#include <sound/jack.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
 #include <linux/platform_device.h>
 #include <sound/soc.h>
 #include <sound/soc-acpi.h>
 #include "../../codecs/da7219.h"
-#include "../../codecs/da7219-aad.h"
 #include "hda_dsp_common.h"
 
 #define DIALOG_CODEC_DAI	"da7219-hifi"
@@ -184,7 +184,7 @@ static int da7219_codec_init(struct snd_soc_pcm_runtime *rtd)
 	snd_jack_set_key(jack->jack, SND_JACK_BTN_1, KEY_VOLUMEUP);
 	snd_jack_set_key(jack->jack, SND_JACK_BTN_2, KEY_VOLUMEDOWN);
 	snd_jack_set_key(jack->jack, SND_JACK_BTN_3, KEY_VOICECOMMAND);
-	da7219_aad_jack_det(component, jack);
+	snd_soc_component_set_jack(component, jack, NULL);
 
 	return ret;
 }
-- 
2.25.1

