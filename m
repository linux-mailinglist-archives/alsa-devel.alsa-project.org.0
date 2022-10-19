Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC538604D56
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Oct 2022 18:26:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7DD95AE7E;
	Wed, 19 Oct 2022 18:25:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7DD95AE7E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666196804;
	bh=GqtPhcrDC08Vu3lcDrgRl4MHtpK7MFwuWpYKUhrNXXc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oYZ4mUoYf484yetgqFWveolBa649zRIF93WV56LVgoU/uhipY8P+tgBFHLdEeNpXK
	 VL6B+R6z6UYFNqcIxA7oyHl12BjP9W2zJCa6GJh1RWxxjGI4z63U03kR5m3+E0oLNh
	 9TZhCjDsdZXb0yEG4JN029Q5ZcWtXLXv+sVsXuCk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D9039F80571;
	Wed, 19 Oct 2022 18:24:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 57E06F80578; Wed, 19 Oct 2022 18:24:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 697B8F80551
 for <alsa-devel@alsa-project.org>; Wed, 19 Oct 2022 18:23:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 697B8F80551
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="aiHihkTB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666196634; x=1697732634;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GqtPhcrDC08Vu3lcDrgRl4MHtpK7MFwuWpYKUhrNXXc=;
 b=aiHihkTBIengY13Eyf13gHh8WX7BgNiYvRHZPwhxRCl3Xs8p9wpWuS0u
 xtJqmD90O+4Y+jl3Rsq9yFI9NNRtgQXNlsgQUxAAUr1T629XxbzHQvCPn
 6KvMSWTbAc+/TI8HrTe9sunMr4TMWhSrdIw9I5x1dBBP5ukf1Mj0w5eFM
 f7UZnY57msVB0t2sepx4L6ekrehdwl5s9SuUFPKWovJKgwB4GmaMNBMBg
 qpO/WlkbFgh8i90KVbMddHO+fJwgMu2c6/xlioFs/SIwonFcwZuDVz8Ys
 o1rQbV8f3tV5lxYl+smkl7C6zL/6b+QAk5sJ/HEVTrI5DuWUYIuj9Se0k w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="286856244"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; d="scan'208";a="286856244"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2022 09:21:28 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="698153845"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; d="scan'208";a="698153845"
Received: from afsinurr-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.16.185])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2022 09:21:28 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 07/10] ALSA/ASoC: hda: ext: add 'bus' prefix for multi-link
 stream setting
Date: Wed, 19 Oct 2022 11:21:12 -0500
Message-Id: <20221019162115.185917-8-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221019162115.185917-1-pierre-louis.bossart@linux.intel.com>
References: <20221019162115.185917-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, tiwai@suse.de,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org,
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

All the helpers dealing with multi-link configurations are located in
the hdac_ext_controller.c, except the two set/clear routines that
modify the LOSIDV registers.

For consistency, move the two helpers and add the 'bus' prefix. One
could argue that the 'ml' prefix might be more relevant but that would
be a larger code change.

No functionality change, just move and rename.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 include/sound/hdaudio_ext.h         |  8 ++++----
 sound/hda/ext/hdac_ext_controller.c | 24 ++++++++++++++++++++++++
 sound/hda/ext/hdac_ext_stream.c     | 24 ------------------------
 sound/soc/intel/avs/pcm.c           |  4 ++--
 sound/soc/intel/skylake/skl-pcm.c   |  6 +++---
 sound/soc/sof/intel/hda-dai.c       |  6 +++---
 6 files changed, 36 insertions(+), 36 deletions(-)

diff --git a/include/sound/hdaudio_ext.h b/include/sound/hdaudio_ext.h
index 472fed072e985..79aea619adda4 100644
--- a/include/sound/hdaudio_ext.h
+++ b/include/sound/hdaudio_ext.h
@@ -121,10 +121,10 @@ int snd_hdac_ext_bus_link_power_up(struct hdac_ext_link *hlink);
 int snd_hdac_ext_bus_link_power_down(struct hdac_ext_link *hlink);
 int snd_hdac_ext_bus_link_power_up_all(struct hdac_bus *bus);
 int snd_hdac_ext_bus_link_power_down_all(struct hdac_bus *bus);
-void snd_hdac_ext_link_set_stream_id(struct hdac_ext_link *hlink,
-				     int stream);
-void snd_hdac_ext_link_clear_stream_id(struct hdac_ext_link *hlink,
-				       int stream);
+void snd_hdac_ext_bus_link_set_stream_id(struct hdac_ext_link *hlink,
+					 int stream);
+void snd_hdac_ext_bus_link_clear_stream_id(struct hdac_ext_link *hlink,
+					   int stream);
 
 int snd_hdac_ext_bus_link_get(struct hdac_bus *bus, struct hdac_ext_link *hlink);
 int snd_hdac_ext_bus_link_put(struct hdac_bus *bus, struct hdac_ext_link *hlink);
diff --git a/sound/hda/ext/hdac_ext_controller.c b/sound/hda/ext/hdac_ext_controller.c
index c0b801fa93c09..08d3313f2df7e 100644
--- a/sound/hda/ext/hdac_ext_controller.c
+++ b/sound/hda/ext/hdac_ext_controller.c
@@ -253,6 +253,30 @@ int snd_hdac_ext_bus_link_power_down_all(struct hdac_bus *bus)
 }
 EXPORT_SYMBOL_GPL(snd_hdac_ext_bus_link_power_down_all);
 
+/**
+ * snd_hdac_ext_bus_link_set_stream_id - maps stream id to link output
+ * @link: HD-audio ext link to set up
+ * @stream: stream id
+ */
+void snd_hdac_ext_bus_link_set_stream_id(struct hdac_ext_link *link,
+					 int stream)
+{
+	snd_hdac_updatew(link->ml_addr, AZX_REG_ML_LOSIDV, (1 << stream), 1 << stream);
+}
+EXPORT_SYMBOL_GPL(snd_hdac_ext_bus_link_set_stream_id);
+
+/**
+ * snd_hdac_ext_bus_link_clear_stream_id - maps stream id to link output
+ * @link: HD-audio ext link to set up
+ * @stream: stream id
+ */
+void snd_hdac_ext_bus_link_clear_stream_id(struct hdac_ext_link *link,
+					   int stream)
+{
+	snd_hdac_updatew(link->ml_addr, AZX_REG_ML_LOSIDV, (1 << stream), 0);
+}
+EXPORT_SYMBOL_GPL(snd_hdac_ext_bus_link_clear_stream_id);
+
 int snd_hdac_ext_bus_link_get(struct hdac_bus *bus,
 				struct hdac_ext_link *hlink)
 {
diff --git a/sound/hda/ext/hdac_ext_stream.c b/sound/hda/ext/hdac_ext_stream.c
index c06beaaffe0a1..da2a9b54a5bea 100644
--- a/sound/hda/ext/hdac_ext_stream.c
+++ b/sound/hda/ext/hdac_ext_stream.c
@@ -223,30 +223,6 @@ int snd_hdac_ext_stream_setup(struct hdac_ext_stream *hext_stream, int fmt)
 }
 EXPORT_SYMBOL_GPL(snd_hdac_ext_stream_setup);
 
-/**
- * snd_hdac_ext_link_set_stream_id - maps stream id to link output
- * @link: HD-audio ext link to set up
- * @stream: stream id
- */
-void snd_hdac_ext_link_set_stream_id(struct hdac_ext_link *link,
-				     int stream)
-{
-	snd_hdac_updatew(link->ml_addr, AZX_REG_ML_LOSIDV, (1 << stream), 1 << stream);
-}
-EXPORT_SYMBOL_GPL(snd_hdac_ext_link_set_stream_id);
-
-/**
- * snd_hdac_ext_link_clear_stream_id - maps stream id to link output
- * @link: HD-audio ext link to set up
- * @stream: stream id
- */
-void snd_hdac_ext_link_clear_stream_id(struct hdac_ext_link *link,
-				 int stream)
-{
-	snd_hdac_updatew(link->ml_addr, AZX_REG_ML_LOSIDV, (1 << stream), 0);
-}
-EXPORT_SYMBOL_GPL(snd_hdac_ext_link_clear_stream_id);
-
 static struct hdac_ext_stream *
 hdac_ext_link_stream_assign(struct hdac_bus *bus,
 			    struct snd_pcm_substream *substream)
diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
index d77afe5c65b96..95cb87339400b 100644
--- a/sound/soc/intel/avs/pcm.c
+++ b/sound/soc/intel/avs/pcm.c
@@ -297,7 +297,7 @@ static int avs_dai_hda_be_hw_free(struct snd_pcm_substream *substream, struct sn
 		return -EINVAL;
 
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
-		snd_hdac_ext_link_clear_stream_id(link, hdac_stream(link_stream)->stream_tag);
+		snd_hdac_ext_bus_link_clear_stream_id(link, hdac_stream(link_stream)->stream_tag);
 
 	return 0;
 }
@@ -330,7 +330,7 @@ static int avs_dai_hda_be_prepare(struct snd_pcm_substream *substream, struct sn
 		return -EINVAL;
 
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
-		snd_hdac_ext_link_set_stream_id(link, hdac_stream(link_stream)->stream_tag);
+		snd_hdac_ext_bus_link_set_stream_id(link, hdac_stream(link_stream)->stream_tag);
 
 	ret = avs_dai_prepare(to_avs_dev(dai->dev), substream, dai);
 	if (ret)
diff --git a/sound/soc/intel/skylake/skl-pcm.c b/sound/soc/intel/skylake/skl-pcm.c
index f7e97b5a449fc..27b03c34abd09 100644
--- a/sound/soc/intel/skylake/skl-pcm.c
+++ b/sound/soc/intel/skylake/skl-pcm.c
@@ -198,8 +198,8 @@ int skl_pcm_link_dma_prepare(struct device *dev, struct skl_pipe_params *params)
 	if (stream->hstream.direction == SNDRV_PCM_STREAM_PLAYBACK) {
 		list_for_each_entry(link, &bus->hlink_list, list) {
 			if (link->index == params->link_index)
-				snd_hdac_ext_link_set_stream_id(link,
-								stream_tag);
+				snd_hdac_ext_bus_link_set_stream_id(link,
+								    stream_tag);
 		}
 	}
 
@@ -649,7 +649,7 @@ static int skl_link_hw_free(struct snd_pcm_substream *substream,
 
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
 		stream_tag = hdac_stream(link_dev)->stream_tag;
-		snd_hdac_ext_link_clear_stream_id(link, stream_tag);
+		snd_hdac_ext_bus_link_clear_stream_id(link, stream_tag);
 	}
 
 	snd_hdac_ext_stream_release(link_dev, HDAC_EXT_STREAM_TYPE_LINK);
diff --git a/sound/soc/sof/intel/hda-dai.c b/sound/soc/sof/intel/hda-dai.c
index 575adf3133c27..64e8ca016b216 100644
--- a/sound/soc/sof/intel/hda-dai.c
+++ b/sound/soc/sof/intel/hda-dai.c
@@ -158,7 +158,7 @@ static int hda_link_dma_cleanup(struct snd_pcm_substream *substream,
 
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
 		stream_tag = hdac_stream(hext_stream)->stream_tag;
-		snd_hdac_ext_link_clear_stream_id(hlink, stream_tag);
+		snd_hdac_ext_bus_link_clear_stream_id(hlink, stream_tag);
 	}
 	snd_soc_dai_set_dma_data(cpu_dai, substream, NULL);
 	snd_hdac_ext_stream_release(hext_stream, HDAC_EXT_STREAM_TYPE_LINK);
@@ -194,8 +194,8 @@ static int hda_link_dma_params(struct hdac_ext_stream *hext_stream,
 	if (hext_stream->hstream.direction == SNDRV_PCM_STREAM_PLAYBACK) {
 		list_for_each_entry(hlink, &bus->hlink_list, list) {
 			if (hlink->index == params->link_index)
-				snd_hdac_ext_link_set_stream_id(hlink,
-								stream_tag);
+				snd_hdac_ext_bus_link_set_stream_id(hlink,
+								    stream_tag);
 		}
 	}
 
-- 
2.34.1

