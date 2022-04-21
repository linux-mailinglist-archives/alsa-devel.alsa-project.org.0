Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D55C50AA0A
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Apr 2022 22:35:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2E00C1711;
	Thu, 21 Apr 2022 22:35:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2E00C1711
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650573353;
	bh=sQu9jhm4eg9QN53l9oLEDPOXKBPs5Nh7hcAitnpDpGw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oJC6zdpEuISiqUzBKTbECRjT5zqtkv1w8kBzPq/ZPn07dI+dnnqwbxsPR9Ynr3Khd
	 HbFjdG8fyMugbVjnzuF91hGy3WfeQb2P1KOTV3jEMeHa5koODKGFPJSxkJUgJ0vt++
	 ibVdBXV0P8chhlDD0CK6EnI6MyfKlxvdgT4mUceQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ED763F80543;
	Thu, 21 Apr 2022 22:33:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7CF84F8053B; Thu, 21 Apr 2022 22:32:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0534EF8050F
 for <alsa-devel@alsa-project.org>; Thu, 21 Apr 2022 22:32:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0534EF8050F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="B0tAYa7f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650573167; x=1682109167;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sQu9jhm4eg9QN53l9oLEDPOXKBPs5Nh7hcAitnpDpGw=;
 b=B0tAYa7faXcNG9Tn1CVXizmjp8HPG5sXJ0stMNlVz0y3mXKzyAsNoewi
 8wseCXyC4Bbltfji2W/PSravq0QH+i0001PjsSvtCVbwlFdq0SSYTljAq
 bPAvRRdWhcenRKrgsYuD03B7nHDeFELEQ6yQadEpKuA3guyfDzmqBrSYh
 C8Hax97B06Zs3qZ9UPgpshRGdIHKX/FyAnTiN2QU1WrlIEp2QayBTBDsN
 xcO1K7x7dlaBWxnE+Pnb9C7qGgoFKtigTMxRUKKTJNKUPmwkXqbVny5RK
 4dIo8tX7tPobP0SCCcM8j9HicQciau9ZLzk4UCtXPG+GJTg5r2C0AHA// w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10324"; a="245047635"
X-IronPort-AV: E=Sophos;i="5.90,279,1643702400"; d="scan'208";a="245047635"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2022 13:32:18 -0700
X-IronPort-AV: E=Sophos;i="5.90,279,1643702400"; d="scan'208";a="577455798"
Received: from qingsu-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.212.148.250])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2022 13:32:17 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 10/14] ASoC: SOF: Intel: hda-dai: move code to deal with hda
 dai/dailink suspend
Date: Thu, 21 Apr 2022 15:31:57 -0500
Message-Id: <20220421203201.1550328-11-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220421203201.1550328-1-pierre-louis.bossart@linux.intel.com>
References: <20220421203201.1550328-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, Rander Wang <rander.wang@intel.com>,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
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

The location of the code was not optimal and prevents us from using
helpers, let's move it to hda-dai.c.

No functionality change in this patch.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/intel/hda-dai.c | 58 +++++++++++++++++++++++++++++++++++
 sound/soc/sof/intel/hda-dsp.c | 42 ++++---------------------
 sound/soc/sof/intel/hda.h     |  1 +
 3 files changed, 65 insertions(+), 36 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dai.c b/sound/soc/sof/intel/hda-dai.c
index 0521cb755a8af..c1ff7145745bc 100644
--- a/sound/soc/sof/intel/hda-dai.c
+++ b/sound/soc/sof/intel/hda-dai.c
@@ -448,6 +448,45 @@ static const struct snd_soc_dai_ops ipc3_hda_dai_ops = {
 	.prepare = ipc3_hda_dai_prepare,
 };
 
+static int hda_dai_suspend(struct hdac_bus *bus)
+{
+	struct snd_soc_pcm_runtime *rtd;
+	struct hdac_ext_stream *hext_stream;
+	struct hdac_ext_link *link;
+	struct hdac_stream *s;
+	const char *name;
+	int stream_tag;
+
+	/* set internal flag for BE */
+	list_for_each_entry(s, &bus->stream_list, list) {
+		hext_stream = stream_to_hdac_ext_stream(s);
+
+		/*
+		 * clear stream. This should already be taken care for running
+		 * streams when the SUSPEND trigger is called. But paused
+		 * streams do not get suspended, so this needs to be done
+		 * explicitly during suspend.
+		 */
+		if (hext_stream->link_substream) {
+			rtd = asoc_substream_to_rtd(hext_stream->link_substream);
+			name = asoc_rtd_to_codec(rtd, 0)->component->name;
+			link = snd_hdac_ext_bus_get_link(bus, name);
+			if (!link)
+				return -EINVAL;
+
+			hext_stream->link_prepared = 0;
+
+			if (hdac_stream(hext_stream)->direction ==
+				SNDRV_PCM_STREAM_CAPTURE)
+				continue;
+
+			stream_tag = hdac_stream(hext_stream)->stream_tag;
+			snd_hdac_ext_link_clear_stream_id(link, stream_tag);
+		}
+	}
+
+	return 0;
+}
 #endif
 
 /* only one flag used so far to harden hw_params/hw_free/trigger/prepare */
@@ -733,3 +772,22 @@ struct snd_soc_dai_driver skl_dai[] = {
 },
 #endif
 };
+
+int hda_dsp_dais_suspend(struct snd_sof_dev *sdev)
+{
+	/*
+	 * In the corner case where a SUSPEND happens during a PAUSE, the ALSA core
+	 * does not throw the TRIGGER_SUSPEND. This leaves the DAIs in an unbalanced state.
+	 * Since the component suspend is called last, we can trap this corner case
+	 * and force the DAIs to release their resources.
+	 */
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
+	int ret;
+
+	ret = hda_dai_suspend(sof_to_bus(sdev));
+	if (ret < 0)
+		return ret;
+#endif
+
+	return 0;
+}
diff --git a/sound/soc/sof/intel/hda-dsp.c b/sound/soc/sof/intel/hda-dsp.c
index ad11df345be75..c068a3f2f6df3 100644
--- a/sound/soc/sof/intel/hda-dsp.c
+++ b/sound/soc/sof/intel/hda-dsp.c
@@ -894,44 +894,14 @@ int hda_dsp_shutdown(struct snd_sof_dev *sdev)
 
 int hda_dsp_set_hw_params_upon_resume(struct snd_sof_dev *sdev)
 {
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
-	struct hdac_bus *bus = sof_to_bus(sdev);
-	struct snd_soc_pcm_runtime *rtd;
-	struct hdac_ext_stream *hext_stream;
-	struct hdac_ext_link *link;
-	struct hdac_stream *s;
-	const char *name;
-	int stream_tag;
-
-	/* set internal flag for BE */
-	list_for_each_entry(s, &bus->stream_list, list) {
-		hext_stream = stream_to_hdac_ext_stream(s);
-
-		/*
-		 * clear stream. This should already be taken care for running
-		 * streams when the SUSPEND trigger is called. But paused
-		 * streams do not get suspended, so this needs to be done
-		 * explicitly during suspend.
-		 */
-		if (hext_stream->link_substream) {
-			rtd = asoc_substream_to_rtd(hext_stream->link_substream);
-			name = asoc_rtd_to_codec(rtd, 0)->component->name;
-			link = snd_hdac_ext_bus_get_link(bus, name);
-			if (!link)
-				return -EINVAL;
-
-			hext_stream->link_prepared = 0;
+	int ret;
 
-			if (hdac_stream(hext_stream)->direction ==
-				SNDRV_PCM_STREAM_CAPTURE)
-				continue;
+	/* make sure all DAI resources are freed */
+	ret = hda_dsp_dais_suspend(sdev);
+	if (ret < 0)
+		dev_warn(sdev->dev, "%s: failure in hda_dsp_dais_suspend\n", __func__);
 
-			stream_tag = hdac_stream(hext_stream)->stream_tag;
-			snd_hdac_ext_link_clear_stream_id(link, stream_tag);
-		}
-	}
-#endif
-	return 0;
+	return ret;
 }
 
 void hda_dsp_d0i3_work(struct work_struct *work)
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index f520d1cf70c90..e52cade756179 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -697,6 +697,7 @@ static inline bool hda_common_check_sdw_irq(struct snd_sof_dev *sdev)
 
 /* common dai driver */
 extern struct snd_soc_dai_driver skl_dai[];
+int hda_dsp_dais_suspend(struct snd_sof_dev *sdev);
 
 /*
  * Platform Specific HW abstraction Ops.
-- 
2.30.2

