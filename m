Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E005C275251
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Sep 2020 09:33:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1B9621706;
	Wed, 23 Sep 2020 09:32:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1B9621706
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600846392;
	bh=D3OP+pyBjqc36JePvjQmvWRVDq5xMzuDefsAaM5bm7s=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=s4yGkUR24h+EhSETt510IAP2/wSsblafLXMwrW+Xlsi0zVtwuHUme5Q9wGjVCc73E
	 e231XQJkLVeMjcnLnZC3AfwfEXbUeVKQjGRf0sguCve3pki7nkiIIIJXCL3NfE65o1
	 USkuuuFbnJTPmCQ1cZRgcY2a3cHxg2HtIop4ykt4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 20C96F80162;
	Wed, 23 Sep 2020 09:31:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 93BC4F80171; Wed, 23 Sep 2020 09:31:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 14943F800B4
 for <alsa-devel@alsa-project.org>; Wed, 23 Sep 2020 09:31:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 14943F800B4
IronPort-SDR: CZslRaf535WTNmmZvium/jSuIAENmkcV+Lgu366OPtpFFIO+R3YA+wv/dNN7EaZKLS6Hk88R7K
 isEzTKP3sdUw==
X-IronPort-AV: E=McAfee;i="6000,8403,9752"; a="140285247"
X-IronPort-AV: E=Sophos;i="5.77,293,1596524400"; d="scan'208";a="140285247"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2020 00:31:12 -0700
IronPort-SDR: QBfPKMLWTUj3N267vODLl1gE4wZQPs2lYvgImXCj8Uso4e8DT2fbafMZI8jGl78bpYvO2PtOAh
 hmw3f/n2do1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,293,1596524400"; d="scan'208";a="338566774"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga008.jf.intel.com with ESMTP; 23 Sep 2020 00:31:10 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH] ASoC: Intel: hda_dsp_common: use static function in
 conditional block
Date: Wed, 23 Sep 2020 10:29:39 +0300
Message-Id: <20200923072939.3100468-1-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Jaska Uimonen <jaska.uimonen@intel.com>, kai.vehmanen@linux.intel.com,
 lgirdwood@gmail.com, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, daniel.baluta@nxp.com
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

cppcheck reports the following warning:

sound/soc/intel/boards/hda_dsp_common.c:17:0: style: The function
'hda_dsp_hdmi_pcm_handle' is never used. [unusedFunction]

Fix by moving to static inside compilation block.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Jaska Uimonen <jaska.uimonen@intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/intel/boards/hda_dsp_common.c | 7 ++++---
 sound/soc/intel/boards/hda_dsp_common.h | 3 ---
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/sound/soc/intel/boards/hda_dsp_common.c b/sound/soc/intel/boards/hda_dsp_common.c
index 244b57fba64c..91ad2a0ad1ce 100644
--- a/sound/soc/intel/boards/hda_dsp_common.c
+++ b/sound/soc/intel/boards/hda_dsp_common.c
@@ -10,12 +10,14 @@
 
 #include "hda_dsp_common.h"
 
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_AUDIO_CODEC)
+
 /*
  * Search card topology and return PCM device number
  * matching Nth HDMI device (zero-based index).
  */
-struct snd_pcm *hda_dsp_hdmi_pcm_handle(struct snd_soc_card *card,
-					int hdmi_idx)
+static struct snd_pcm *hda_dsp_hdmi_pcm_handle(struct snd_soc_card *card,
+					       int hdmi_idx)
 {
 	struct snd_soc_pcm_runtime *rtd;
 	struct snd_pcm *spcm;
@@ -34,7 +36,6 @@ struct snd_pcm *hda_dsp_hdmi_pcm_handle(struct snd_soc_card *card,
 	return NULL;
 }
 
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_AUDIO_CODEC)
 /*
  * Search card topology and register HDMI PCM related controls
  * to codec driver.
diff --git a/sound/soc/intel/boards/hda_dsp_common.h b/sound/soc/intel/boards/hda_dsp_common.h
index 727edd256962..ea4ae9285cf0 100644
--- a/sound/soc/intel/boards/hda_dsp_common.h
+++ b/sound/soc/intel/boards/hda_dsp_common.h
@@ -15,9 +15,6 @@
 #include <sound/hda_i915.h>
 #include "../../codecs/hdac_hda.h"
 
-struct snd_pcm *hda_dsp_hdmi_pcm_handle(struct snd_soc_card *card,
-					int hdmi_idx);
-
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_AUDIO_CODEC)
 int hda_dsp_hdmi_build_controls(struct snd_soc_card *card,
 				struct snd_soc_component *comp);
-- 
2.27.0

