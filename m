Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C0B6AE1AC
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Mar 2023 15:07:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F31B1467;
	Tue,  7 Mar 2023 15:06:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F31B1467
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678198022;
	bh=Xi87gwDxsFTuko3iYt47/SSgIYOoVkFC5zEMqdEOOHY=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SYSBdCMsKsG61O1Da6PjJGOy1JrzR7DjIQ5AwxD69GZYrjpkFil0eWOB4+ib2ISP9
	 HK+pT/+NBUsAeDCLLrmItfLQiSOGd9zE8GrWYCpt133TEWCo23Bfv2CV49cIyx4S4B
	 NKTh+44eFA/2E+0+9Jz5zyXY9Tn2EF71l58Zya7I=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 40219F8052D;
	Tue,  7 Mar 2023 15:04:49 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 58720F80482; Tue,  7 Mar 2023 15:04:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E003AF80431
	for <alsa-devel@alsa-project.org>; Tue,  7 Mar 2023 15:04:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E003AF80431
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=mlqAwnH0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678197872; x=1709733872;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Xi87gwDxsFTuko3iYt47/SSgIYOoVkFC5zEMqdEOOHY=;
  b=mlqAwnH0oOE6YVvE50I1ZB6VOG+Hs7/XKPk4bKoeOLTu1CzKuFjYDm6N
   YmO1J0ZcOC9TMvmqtE/rE2HXNeAP+PZxDE/zONaSW75SnEUe6J+MjfSJp
   IQlopIBxtHEY8EWOcywOGS/oteMiYbIdOS14czIlWJy8EqwEj1nQ89Sk2
   JSM/z7FZW1vFPh/lp9uwDgWphBxoc/J9Pa3k7m/jBthObBFqr+27H8NLO
   jWfk2/bi9ICk0djQTUsMJueglUwnZ4rOpFHERGlvbI8ahwdOR5ygnvfMP
   GszXqOiv7zhoQ/NqkF0ciY8MqrOfO6PeUZfTNcVss6IXwGmhyUdFCTmrU
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="316255216"
X-IronPort-AV: E=Sophos;i="5.98,241,1673942400";
   d="scan'208";a="316255216"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 06:04:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="786706946"
X-IronPort-AV: E=Sophos;i="5.98,241,1673942400";
   d="scan'208";a="786706946"
Received: from rganesh-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.47.75])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 06:04:23 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 04/14] ASoC: SOF: Intel: hda-dai: Modify the signature of
 hda_link_dma_cleanup()
Date: Tue,  7 Mar 2023 16:04:25 +0200
Message-Id: <20230307140435.2808-5-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230307140435.2808-1-peter.ujfalusi@linux.intel.com>
References: <20230307140435.2808-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: IS4U4CLFNGFASGJ7AAV7MLWAAWECFF3U
X-Message-ID-Hash: IS4U4CLFNGFASGJ7AAV7MLWAAWECFF3U
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 rander.wang@intel.com, yung-chuan.liao@linux.intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IS4U4CLFNGFASGJ7AAV7MLWAAWECFF3U/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

Remove the trigger_suspend_stop argument from hda_link_dma_cleanup() and
move the call to snd_hdac_ext_stream_clear() into
snd_hdac_ext_stream_clear(). This is a preparatory step to unify the
trigger ops for IPC3 and IPC4.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/intel/hda-dai.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dai.c b/sound/soc/sof/intel/hda-dai.c
index 009299c6de40..d4b98bfe2adf 100644
--- a/sound/soc/sof/intel/hda-dai.c
+++ b/sound/soc/sof/intel/hda-dai.c
@@ -129,8 +129,7 @@ hda_link_stream_assign(struct hdac_bus *bus,
 static int hda_link_dma_cleanup(struct snd_pcm_substream *substream,
 				struct hdac_ext_stream *hext_stream,
 				struct snd_soc_dai *cpu_dai,
-				struct snd_soc_dai *codec_dai,
-				bool trigger_suspend_stop)
+				struct snd_soc_dai *codec_dai)
 {
 	struct hdac_stream *hstream = &hext_stream->hstream;
 	struct hdac_bus *bus = hstream->bus;
@@ -142,9 +141,6 @@ static int hda_link_dma_cleanup(struct snd_pcm_substream *substream,
 	if (!hlink)
 		return -EINVAL;
 
-	if (trigger_suspend_stop)
-		snd_hdac_ext_stream_clear(hext_stream);
-
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
 		stream_tag = hdac_stream(hext_stream)->stream_tag;
 		snd_hdac_ext_bus_link_clear_stream_id(hlink, stream_tag);
@@ -246,7 +242,8 @@ static int hda_link_dma_trigger(struct snd_pcm_substream *substream, int cmd)
 		break;
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 	case SNDRV_PCM_TRIGGER_STOP:
-		ret = hda_link_dma_cleanup(substream, hext_stream, cpu_dai, codec_dai, true);
+		snd_hdac_ext_stream_clear(hext_stream);
+		ret = hda_link_dma_cleanup(substream, hext_stream, cpu_dai, codec_dai);
 		if (ret < 0)
 			return ret;
 
@@ -272,7 +269,7 @@ static int hda_link_dma_hw_free(struct snd_pcm_substream *substream)
 	if (!hext_stream)
 		return 0;
 
-	return hda_link_dma_cleanup(substream, hext_stream, cpu_dai, codec_dai, false);
+	return hda_link_dma_cleanup(substream, hext_stream, cpu_dai, codec_dai);
 }
 
 static int hda_dai_widget_update(struct snd_soc_dapm_widget *w,
@@ -483,7 +480,7 @@ static int ipc4_hda_dai_trigger(struct snd_pcm_substream *substream,
 
 		pipeline->state = SOF_IPC4_PIPE_RESET;
 
-		ret = hda_link_dma_cleanup(substream, hext_stream, cpu_dai, codec_dai, false);
+		ret = hda_link_dma_cleanup(substream, hext_stream, cpu_dai, codec_dai);
 		if (ret < 0) {
 			dev_err(sdev->dev, "%s: failed to clean up link DMA\n", __func__);
 			return ret;
@@ -557,7 +554,7 @@ static int hda_dai_suspend(struct hdac_bus *bus)
 
 			ret = hda_link_dma_cleanup(hext_stream->link_substream,
 						   hext_stream,
-						   cpu_dai, codec_dai, false);
+						   cpu_dai, codec_dai);
 			if (ret < 0)
 				return ret;
 
-- 
2.39.2

