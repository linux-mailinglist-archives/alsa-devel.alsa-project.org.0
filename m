Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA107BB546
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Oct 2023 12:31:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 412A41E3;
	Fri,  6 Oct 2023 12:30:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 412A41E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696588308;
	bh=qKe5lqpIsOppIWnRfQ2ltGmtnfrVLvhrsR/buwbiafI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RoiCUNxRaRzUmRpZKghVSAvMQvPvomwaBkrB3dk3rBZ6dGNeHJshlIIG0OTya0MRp
	 TCF/q4l+JzMhl32GIlyRm8iBj1w+12pmu687g+hzWfeUVZYQL+XedgwxJ0qHZ+MPlb
	 uSJmVhzeq69q6iDxsPWWK48qJnHavYvpYdfgGtAo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 59A9AF80580; Fri,  6 Oct 2023 12:29:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 04DC9F80580;
	Fri,  6 Oct 2023 12:29:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C4DD9F80588; Fri,  6 Oct 2023 12:29:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A4677F80564
	for <alsa-devel@alsa-project.org>; Fri,  6 Oct 2023 12:29:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4677F80564
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=SgIyS8o8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696588187; x=1728124187;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qKe5lqpIsOppIWnRfQ2ltGmtnfrVLvhrsR/buwbiafI=;
  b=SgIyS8o8T+I2mGTyBFKrTAwbjs/YKdt+PGiWV2GnSoLj19yWw3fjNdf2
   w5ClPvvTeq1gPJYoV39sv07GAS975s6rBFl926zZC1L0tgA4daK60p+hR
   8ONiVmQSGOhE9xXzR3Vm+T8kVRrFZGURdm81ZPiMaEx7Ca2bVIZpkwRJH
   X+IplyKdMPicx9p2ICLb6TKvG53rL3u8SRUuoAgnU1njwSJGo2KUpixRC
   rqtSiDQVFtNDxsueZHYAs4sQLoyQdr7EN+H2wON4IiXjyz0k69zBjJioL
   5c9N/3NZBwwmulJsiReP/Y6UqIJ1tFU9f5APuZeKM6HAZG4Lzi7IHLBrf
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="364002784"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200";
   d="scan'208";a="364002784"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2023 03:29:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="925928944"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200";
   d="scan'208";a="925928944"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by orsmga005.jf.intel.com with ESMTP; 06 Oct 2023 03:29:35 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: tiwai@suse.com
Cc: alsa-devel@alsa-project.org,
	broonie@kernel.org,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 3/3] ALSA: hda: Add code_loading parameter to stream setup
Date: Fri,  6 Oct 2023 12:28:57 +0200
Message-Id: <20231006102857.749143-4-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231006102857.749143-1-cezary.rojewski@intel.com>
References: <20231006102857.749143-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: N6RXNCNVF73SD5VASLEBIGVSDFJKLBFW
X-Message-ID-Hash: N6RXNCNVF73SD5VASLEBIGVSDFJKLBFW
X-MailFrom: cezary.rojewski@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/N6RXNCNVF73SD5VASLEBIGVSDFJKLBFW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

AudioDSP firmware is the one who kicks SDxFIFOS calculation when a
stream is decoupled mode. During firmware bring up procedure, there is
no firmware running and the code-loading stream is always a decoupled
one. So, there is none to trigger the calculation and we end up with
false-positive timeout (-110) messages.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 include/sound/hdaudio.h           |  2 +-
 include/sound/hdaudio_ext.h       |  4 ++--
 sound/hda/ext/hdac_ext_stream.c   | 12 +++++++-----
 sound/hda/hdac_stream.c           | 21 ++++++++++++---------
 sound/pci/hda/hda_controller.c    |  2 +-
 sound/soc/intel/avs/pcm.c         |  2 +-
 sound/soc/intel/avs/probes.c      |  2 +-
 sound/soc/intel/skylake/skl-pcm.c |  2 +-
 8 files changed, 26 insertions(+), 21 deletions(-)

diff --git a/include/sound/hdaudio.h b/include/sound/hdaudio.h
index 41d725babf53..dd7c87bbc613 100644
--- a/include/sound/hdaudio.h
+++ b/include/sound/hdaudio.h
@@ -573,7 +573,7 @@ void snd_hdac_stream_release(struct hdac_stream *azx_dev);
 struct hdac_stream *snd_hdac_get_stream(struct hdac_bus *bus,
 					int dir, int stream_tag);
 
-int snd_hdac_stream_setup(struct hdac_stream *azx_dev);
+int snd_hdac_stream_setup(struct hdac_stream *azx_dev, bool code_loading);
 void snd_hdac_stream_cleanup(struct hdac_stream *azx_dev);
 int snd_hdac_stream_setup_periods(struct hdac_stream *azx_dev);
 int snd_hdac_stream_set_params(struct hdac_stream *azx_dev,
diff --git a/include/sound/hdaudio_ext.h b/include/sound/hdaudio_ext.h
index d32959cb71d2..a8bebac1e4b2 100644
--- a/include/sound/hdaudio_ext.h
+++ b/include/sound/hdaudio_ext.h
@@ -60,7 +60,7 @@ struct hdac_ext_stream {
 	bool link_locked:1;
 	bool link_prepared;
 
-	int (*host_setup)(struct hdac_stream *);
+	int (*host_setup)(struct hdac_stream *, bool);
 
 	struct snd_pcm_substream *link_substream;
 };
@@ -88,7 +88,7 @@ void snd_hdac_ext_stream_start(struct hdac_ext_stream *hext_stream);
 void snd_hdac_ext_stream_clear(struct hdac_ext_stream *hext_stream);
 void snd_hdac_ext_stream_reset(struct hdac_ext_stream *hext_stream);
 int snd_hdac_ext_stream_setup(struct hdac_ext_stream *hext_stream, int fmt);
-int snd_hdac_ext_host_stream_setup(struct hdac_ext_stream *hext_stream);
+int snd_hdac_ext_host_stream_setup(struct hdac_ext_stream *hext_stream, bool code_loading);
 
 struct hdac_ext_link {
 	struct hdac_bus *bus;
diff --git a/sound/hda/ext/hdac_ext_stream.c b/sound/hda/ext/hdac_ext_stream.c
index 186e95bffb28..a3ac738f1130 100644
--- a/sound/hda/ext/hdac_ext_stream.c
+++ b/sound/hda/ext/hdac_ext_stream.c
@@ -21,12 +21,13 @@
 /**
  * snd_hdac_ext_host_stream_setup - Setup a HOST stream.
  * @hext_stream: HDAudio stream to set up.
+ * @code_loading: Whether the stream is for PCM or code-loading.
  *
  * Return: Zero on success or negative error code.
  */
-int snd_hdac_ext_host_stream_setup(struct hdac_ext_stream *hext_stream)
+int snd_hdac_ext_host_stream_setup(struct hdac_ext_stream *hext_stream, bool code_loading)
 {
-	return hext_stream->host_setup(hdac_stream(hext_stream));
+	return hext_stream->host_setup(hdac_stream(hext_stream), code_loading);
 }
 EXPORT_SYMBOL_GPL(snd_hdac_ext_host_stream_setup);
 
@@ -34,16 +35,17 @@ EXPORT_SYMBOL_GPL(snd_hdac_ext_host_stream_setup);
  * snd_hdac_apl_host_stream_setup - Setup a HOST stream following procedure
  *                                  recommended for ApolloLake devices.
  * @hstream: HDAudio stream to set up.
+ * @code_loading: Whether the stream is for PCM or code-loading.
  *
  * Return: Zero on success or negative error code.
  */
-static int snd_hdac_apl_host_stream_setup(struct hdac_stream *hstream)
+static int snd_hdac_apl_host_stream_setup(struct hdac_stream *hstream, bool code_loading)
 {
 	struct hdac_ext_stream *hext_stream = stream_to_hdac_ext_stream(hstream);
 	int ret;
 
 	snd_hdac_ext_stream_decouple(hstream->bus, hext_stream, false);
-	ret = snd_hdac_stream_setup(hstream);
+	ret = snd_hdac_stream_setup(hstream, code_loading);
 	snd_hdac_ext_stream_decouple(hstream->bus, hext_stream, true);
 
 	return ret;
@@ -89,7 +91,7 @@ int snd_hdac_ext_stream_init_all(struct hdac_bus *bus, int start_idx,
 				 int num_stream, int dir)
 {
 	struct pci_dev *pci = to_pci_dev(bus->dev);
-	int (*setup_op)(struct hdac_stream *);
+	int (*setup_op)(struct hdac_stream *, bool);
 	int stream_tag = 0;
 	int i, tag, idx = start_idx;
 
diff --git a/sound/hda/hdac_stream.c b/sound/hda/hdac_stream.c
index a784fd77cd4b..6ce24e248f8e 100644
--- a/sound/hda/hdac_stream.c
+++ b/sound/hda/hdac_stream.c
@@ -252,8 +252,9 @@ EXPORT_SYMBOL_GPL(snd_hdac_stream_reset);
 /**
  * snd_hdac_stream_setup -  set up the SD for streaming
  * @azx_dev: HD-audio core stream to set up
+ * @code_loading: Whether the stream is for PCM or code-loading.
  */
-int snd_hdac_stream_setup(struct hdac_stream *azx_dev)
+int snd_hdac_stream_setup(struct hdac_stream *azx_dev, bool code_loading)
 {
 	struct hdac_bus *bus = azx_dev->bus;
 	struct snd_pcm_runtime *runtime;
@@ -302,13 +303,15 @@ int snd_hdac_stream_setup(struct hdac_stream *azx_dev)
 	/* set the interrupt enable bits in the descriptor control register */
 	snd_hdac_stream_updatel(azx_dev, SD_CTL, 0, SD_INT_MASK);
 
-	/* Once SDxFMT is set, the controller programs SDxFIFOS to non-zero value. */
-	ret = snd_hdac_stream_readw_poll(azx_dev, SD_FIFOSIZE, reg, reg & AZX_SD_FIFOSIZE_MASK,
-					 3, 300);
-	if (ret)
-		dev_dbg(bus->dev, "polling SD_FIFOSIZE 0x%04x failed: %d\n",
-			AZX_REG_SD_FIFOSIZE, ret);
-	azx_dev->fifo_size = snd_hdac_stream_readw(azx_dev, SD_FIFOSIZE);
+	if (!code_loading) {
+		/* Once SDxFMT is set, the controller programs SDxFIFOS to non-zero value. */
+		ret = snd_hdac_stream_readw_poll(azx_dev, SD_FIFOSIZE, reg,
+						 reg & AZX_SD_FIFOSIZE_MASK, 3, 300);
+		if (ret)
+			dev_dbg(bus->dev, "polling SD_FIFOSIZE 0x%04x failed: %d\n",
+				AZX_REG_SD_FIFOSIZE, ret);
+		azx_dev->fifo_size = reg;
+	}
 
 	/* when LPIB delay correction gives a small negative value,
 	 * we ignore it; currently set the threshold statically to
@@ -953,7 +956,7 @@ int snd_hdac_dsp_prepare(struct hdac_stream *azx_dev, unsigned int format,
 	if (err < 0)
 		goto error;
 
-	snd_hdac_stream_setup(azx_dev);
+	snd_hdac_stream_setup(azx_dev, true);
 	snd_hdac_dsp_unlock(azx_dev);
 	return azx_dev->stream_tag;
 
diff --git a/sound/pci/hda/hda_controller.c b/sound/pci/hda/hda_controller.c
index 406779625fb5..c42e9ffff9db 100644
--- a/sound/pci/hda/hda_controller.c
+++ b/sound/pci/hda/hda_controller.c
@@ -182,7 +182,7 @@ static int azx_pcm_prepare(struct snd_pcm_substream *substream)
 	if (err < 0)
 		goto unlock;
 
-	snd_hdac_stream_setup(azx_stream(azx_dev));
+	snd_hdac_stream_setup(azx_stream(azx_dev), false);
 
 	stream_tag = azx_dev->core.stream_tag;
 	/* CA-IBG chips need the playback stream starting from 1 */
diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
index e628fdfdc018..9b0b4d700675 100644
--- a/sound/soc/intel/avs/pcm.c
+++ b/sound/soc/intel/avs/pcm.c
@@ -625,7 +625,7 @@ static int avs_dai_fe_prepare(struct snd_pcm_substream *substream, struct snd_so
 	if (ret < 0)
 		return ret;
 
-	ret = snd_hdac_ext_host_stream_setup(host_stream);
+	ret = snd_hdac_ext_host_stream_setup(host_stream, false);
 	if (ret < 0)
 		return ret;
 
diff --git a/sound/soc/intel/avs/probes.c b/sound/soc/intel/avs/probes.c
index 4cab8c6c4576..bdc6b30dc009 100644
--- a/sound/soc/intel/avs/probes.c
+++ b/sound/soc/intel/avs/probes.c
@@ -145,7 +145,7 @@ static int avs_probe_compr_set_params(struct snd_compr_stream *cstream,
 	ret = snd_hdac_stream_set_params(hdac_stream(host_stream), format_val);
 	if (ret < 0)
 		return ret;
-	ret = snd_hdac_stream_setup(hdac_stream(host_stream));
+	ret = snd_hdac_stream_setup(hdac_stream(host_stream), false);
 	if (ret < 0)
 		return ret;
 
diff --git a/sound/soc/intel/skylake/skl-pcm.c b/sound/soc/intel/skylake/skl-pcm.c
index 7502b2e70e46..2cbcba7c1dbc 100644
--- a/sound/soc/intel/skylake/skl-pcm.c
+++ b/sound/soc/intel/skylake/skl-pcm.c
@@ -148,7 +148,7 @@ int skl_pcm_host_dma_prepare(struct device *dev, struct skl_pipe_params *params)
 	if (err < 0)
 		return err;
 
-	err = snd_hdac_ext_host_stream_setup(stream);
+	err = snd_hdac_ext_host_stream_setup(stream, false);
 	if (err < 0)
 		return err;
 
-- 
2.25.1

