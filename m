Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C1AAC6AE1BB
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Mar 2023 15:08:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 196C31473;
	Tue,  7 Mar 2023 15:07:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 196C31473
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678198100;
	bh=o0UIPzvFgSy6M8mjWweAfemsX2zR6ujQsB9r5LFcsho=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VOqnKFcUVJ3AmW8voVuBx0u04qPlIa21FmBZ0IgRGrxIq0JHuhAqw/8gGU1VczCMa
	 1uworqv0Y2ImvfTsMEvBck0NjeB1x76nPWUcOo5wxu6EHKhhRBGSI3Pemmm48LpfUR
	 bJBZ9OENfw+vmExcjIuTJ6nieNHrpCvNqiRmthwY=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C35BF8057E;
	Tue,  7 Mar 2023 15:05:03 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 43658F8053D; Tue,  7 Mar 2023 15:04:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5B93FF80527
	for <alsa-devel@alsa-project.org>; Tue,  7 Mar 2023 15:04:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B93FF80527
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=gj/zqlgu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678197879; x=1709733879;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=o0UIPzvFgSy6M8mjWweAfemsX2zR6ujQsB9r5LFcsho=;
  b=gj/zqlguiLE1+sgMtPAiFkq+GGdvF6hJrQOewN8LhFKE4mcXZAnyzitA
   Fip0iPOhUkuIkeWD0j5fPSDPt+mY+/AaocFMsKvMWJhEhdnQXNssEe7d5
   Z6jwoHo9dXYMw6JSyGcq47dEtFS4ULMYjOcOmYi2727CXBc4RLAnlesLN
   Np81qDuQ/VoN6cgsOziXmq1hYb2U2cqltrWhtBJuZYIMj3wtlGf4+6asK
   xxhCSNC5dhSs41SnZtz/Im90ZGV1xe2dkl5vDN4YyB3fLapLeUMscKpz4
   utprPXPOFQ5lpp5dccoyl92kqAHNh22I7o9BAZanhqlu3RYX92soGyWaq
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="316255276"
X-IronPort-AV: E=Sophos;i="5.98,241,1673942400";
   d="scan'208";a="316255276"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 06:04:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="786706976"
X-IronPort-AV: E=Sophos;i="5.98,241,1673942400";
   d="scan'208";a="786706976"
Received: from rganesh-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.47.75])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 06:04:35 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 09/14] ASoC: SOF: Intel: hda-dai: Add
 setup_hext_stream/reset_hext_stream DMA ops
Date: Tue,  7 Mar 2023 16:04:30 +0200
Message-Id: <20230307140435.2808-10-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230307140435.2808-1-peter.ujfalusi@linux.intel.com>
References: <20230307140435.2808-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 42VRPE7SMWCG445TYGMQS4XNEFR5GQWY
X-Message-ID-Hash: 42VRPE7SMWCG445TYGMQS4XNEFR5GQWY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/42VRPE7SMWCG445TYGMQS4XNEFR5GQWY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

Define and use the setup_hext_stream/reset_hext_stream DMA ops during link
hw_params and cleanup.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/intel/hda-dai-ops.c | 13 +++++++++++++
 sound/soc/sof/intel/hda-dai.c     |  6 ++++--
 2 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dai-ops.c b/sound/soc/sof/intel/hda-dai-ops.c
index 9dfcafeab9e4..57db589906db 100644
--- a/sound/soc/sof/intel/hda-dai-ops.c
+++ b/sound/soc/sof/intel/hda-dai-ops.c
@@ -144,10 +144,23 @@ static void hda_release_hext_stream(struct snd_sof_dev *sdev, struct snd_soc_dai
 	snd_hdac_ext_stream_release(hext_stream, HDAC_EXT_STREAM_TYPE_LINK);
 }
 
+static void hda_setup_hext_stream(struct snd_sof_dev *sdev, struct hdac_ext_stream *hext_stream,
+				  unsigned int format_val)
+{
+	snd_hdac_ext_stream_setup(hext_stream, format_val);
+}
+
+static void hda_reset_hext_stream(struct snd_sof_dev *sdev, struct hdac_ext_stream *hext_stream)
+{
+	snd_hdac_ext_stream_reset(hext_stream);
+}
+
 static const struct hda_dai_widget_dma_ops hda_dma_ops = {
 	.get_hext_stream = hda_get_hext_stream,
 	.assign_hext_stream = hda_assign_hext_stream,
 	.release_hext_stream = hda_release_hext_stream,
+	.setup_hext_stream = hda_setup_hext_stream,
+	.reset_hext_stream = hda_reset_hext_stream,
 };
 
 #endif
diff --git a/sound/soc/sof/intel/hda-dai.c b/sound/soc/sof/intel/hda-dai.c
index 963c40d8a10b..9616cdba79b6 100644
--- a/sound/soc/sof/intel/hda-dai.c
+++ b/sound/soc/sof/intel/hda-dai.c
@@ -135,7 +135,8 @@ static int hda_link_dma_hw_params(struct snd_pcm_substream *substream,
 	else
 		link_bps = codec_dai->driver->capture.sig_bits;
 
-	snd_hdac_ext_stream_reset(hext_stream);
+	if (ops->reset_hext_stream)
+		ops->reset_hext_stream(sdev, hext_stream);
 
 	format_val = snd_hdac_calc_stream_format(params_rate(params), params_channels(params),
 						 params_format(params), link_bps, 0);
@@ -143,7 +144,8 @@ static int hda_link_dma_hw_params(struct snd_pcm_substream *substream,
 	dev_dbg(bus->dev, "format_val=%d, rate=%d, ch=%d, format=%d\n",
 		format_val, params_rate(params), params_channels(params), params_format(params));
 
-	snd_hdac_ext_stream_setup(hext_stream, format_val);
+	if (ops->setup_hext_stream)
+		ops->setup_hext_stream(sdev, hext_stream, format_val);
 
 	hext_stream->link_prepared = 1;
 
-- 
2.39.2

