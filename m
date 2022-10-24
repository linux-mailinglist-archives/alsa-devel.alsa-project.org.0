Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7792160B306
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Oct 2022 18:56:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 10AFF6FA4;
	Mon, 24 Oct 2022 18:55:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 10AFF6FA4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666630563;
	bh=WaEHOrByEy6uz+ROLmxKoq62qHhD84ak9A+FVc5bVRE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EJB9n9P3UG+sKXtGYW0HqBHLsqjcsC9iLlagQPyeeSNL6Q6x1xJr1rzBecuDguIT9
	 V7pcxLttj0tlbren6q8cXLHiiodiEN4njZRcM11wo9sHqdvG7MyJpBwRVQxU8H0udT
	 dFFmvhHqlhZGA4xCHQ+HSu5S31gdmHi+DpBcqsto=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CCFA9F80533;
	Mon, 24 Oct 2022 18:53:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AB0DFF80578; Mon, 24 Oct 2022 18:53:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D7D64F80551
 for <alsa-devel@alsa-project.org>; Mon, 24 Oct 2022 18:53:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D7D64F80551
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="b8WTMFhj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666630412; x=1698166412;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WaEHOrByEy6uz+ROLmxKoq62qHhD84ak9A+FVc5bVRE=;
 b=b8WTMFhjoTNGJopUKI69k0XukpRIHawwm+h8YWUkV9rbURmD9v8RT+ZD
 +yOTaMVq+s7Pc/cd/7Z6knS2gushv0Y72ywG7Ln02J/zl51xyA7kGBQtZ
 HTpTYJZenUrFyQDh339zj4POpGlvkeLXafz5z2EnTXS37ge3NQlyzNXix
 1JP9lmYU4U4Qxn/vGyfpViHUMgGdGJrmS82YlI0qxvIKeJzhCOrdPL2mr
 Y9feFXbt5p6MIaj3Befycbg8yz1jmEsst93Ur8BfMBLz3Ucb60SsScBHM
 cFB1OGulfs5TE5hVWt1cqWZ87O7fVtkEhti9reO7DWSUzswEuabQQZpQZ g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="287868635"
X-IronPort-AV: E=Sophos;i="5.95,209,1661842800"; d="scan'208";a="287868635"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2022 09:53:26 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="609263058"
X-IronPort-AV: E=Sophos;i="5.95,209,1661842800"; d="scan'208";a="609263058"
Received: from tdsilva-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.213.186.236])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2022 09:53:25 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 06/16] ASoC: SOF: Intel: hda-dai: start removing the use of
 runtime->private_data in BE
Date: Mon, 24 Oct 2022 11:53:00 -0500
Message-Id: <20221024165310.246183-7-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221024165310.246183-1-pierre-louis.bossart@linux.intel.com>
References: <20221024165310.246183-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
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

The SOF HDAudio code stores the Host DMA hdac_stream structure in the
FE substream->runtime->private_data. The BE dailink also uses the
substream->runtime->private_data to allocate the link DMA stream tag.

This really works by accident: the DPCM core copies the FE runtime
information in the BE, which has the side-effect of sharing the
FE-specific private_data with the BE.

To avoid more uses of the private_data with potential issues such as
accessing stale information or use-after-free cases, this patch
removes most of the usages of this private_data at the BE level. We
can directly use the existing dma_data to access the relevant
information.

However the hw_params still uses the information, mainly to go back to
the 'bus' structure required for the link dma stream tag
allocation. This is safe in that the 'bus' is not stream or PCM
specific.

The next patch will completely remove this last use of private_data by
using the component_drvdata - which is how SOF passes a global context
around.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/intel/hda-dai.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dai.c b/sound/soc/sof/intel/hda-dai.c
index 64e8ca016b216..c7b07c2693653 100644
--- a/sound/soc/sof/intel/hda-dai.c
+++ b/sound/soc/sof/intel/hda-dai.c
@@ -138,12 +138,12 @@ hda_link_stream_assign(struct hdac_bus *bus,
 }
 
 static int hda_link_dma_cleanup(struct snd_pcm_substream *substream,
-				struct hdac_stream *hstream,
+				struct hdac_ext_stream *hext_stream,
 				struct snd_soc_dai *cpu_dai,
 				struct snd_soc_dai *codec_dai,
 				bool trigger_suspend_stop)
 {
-	struct hdac_ext_stream *hext_stream = snd_soc_dai_get_dma_data(cpu_dai, substream);
+	struct hdac_stream *hstream = &hext_stream->hstream;
 	struct hdac_bus *bus = hstream->bus;
 	struct sof_intel_hda_stream *hda_stream;
 	struct hdac_ext_link *hlink;
@@ -257,7 +257,6 @@ static int hda_link_dma_prepare(struct snd_pcm_substream *substream)
 
 static int hda_link_dma_trigger(struct snd_pcm_substream *substream, int cmd)
 {
-	struct hdac_stream *hstream = substream->runtime->private_data;
 	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
 	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
 	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
@@ -274,7 +273,7 @@ static int hda_link_dma_trigger(struct snd_pcm_substream *substream, int cmd)
 		break;
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 	case SNDRV_PCM_TRIGGER_STOP:
-		ret = hda_link_dma_cleanup(substream, hstream, cpu_dai, codec_dai, true);
+		ret = hda_link_dma_cleanup(substream, hext_stream, cpu_dai, codec_dai, true);
 		if (ret < 0)
 			return ret;
 
@@ -291,7 +290,6 @@ static int hda_link_dma_trigger(struct snd_pcm_substream *substream, int cmd)
 
 static int hda_link_dma_hw_free(struct snd_pcm_substream *substream)
 {
-	struct hdac_stream *hstream = substream->runtime->private_data;
 	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
 	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
 	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
@@ -301,7 +299,7 @@ static int hda_link_dma_hw_free(struct snd_pcm_substream *substream)
 	if (!hext_stream)
 		return 0;
 
-	return hda_link_dma_cleanup(substream, hstream, cpu_dai, codec_dai, false);
+	return hda_link_dma_cleanup(substream, hext_stream, cpu_dai, codec_dai, false);
 }
 
 static int hda_dai_widget_update(struct snd_soc_dapm_widget *w,
@@ -458,14 +456,12 @@ static int ipc4_hda_dai_trigger(struct snd_pcm_substream *substream,
 	struct snd_sof_widget *swidget;
 	struct snd_soc_dapm_widget *w;
 	struct snd_soc_dai *codec_dai;
-	struct hdac_stream *hstream;
 	struct snd_soc_dai *cpu_dai;
 	int ret;
 
 	dev_dbg(dai->dev, "cmd=%d dai %s direction %d\n", cmd,
 		dai->name, substream->stream);
 
-	hstream = substream->runtime->private_data;
 	rtd = asoc_substream_to_rtd(substream);
 	cpu_dai = asoc_rtd_to_cpu(rtd, 0);
 	codec_dai = asoc_rtd_to_codec(rtd, 0);
@@ -500,7 +496,7 @@ static int ipc4_hda_dai_trigger(struct snd_pcm_substream *substream,
 
 		pipeline->state = SOF_IPC4_PIPE_RESET;
 
-		ret = hda_link_dma_cleanup(substream, hstream, cpu_dai, codec_dai, false);
+		ret = hda_link_dma_cleanup(substream, hext_stream, cpu_dai, codec_dai, false);
 		if (ret < 0) {
 			dev_err(sdev->dev, "%s: failed to clean up link DMA\n", __func__);
 			return ret;
@@ -575,7 +571,8 @@ static int hda_dai_suspend(struct hdac_bus *bus)
 			cpu_dai = asoc_rtd_to_cpu(rtd, 0);
 			codec_dai = asoc_rtd_to_codec(rtd, 0);
 
-			ret = hda_link_dma_cleanup(hext_stream->link_substream, s,
+			ret = hda_link_dma_cleanup(hext_stream->link_substream,
+						   hext_stream,
 						   cpu_dai, codec_dai, false);
 			if (ret < 0)
 				return ret;
-- 
2.34.1

