Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C845782813
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Aug 2023 13:38:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A45A5850;
	Mon, 21 Aug 2023 13:37:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A45A5850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692617914;
	bh=ZJamRoPfjENawaLhuGG/BhwprsoGYIleGLq3xO33130=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ejq4NIYnkNxhBtkcjKnpIqbemqhPrBNwR8ZpwbnZTdaJUV3AErCTz7KnKvPG96RhX
	 w3yF1d+g5/dHcH72qqiYabdec8BXIIoXYRyLGw6rQZYaJHCQ6tq/SMDyOiuNPGsNJ0
	 YzakDeOxuSLlpA5Qd6Wg8U14goba1EE/FSQGSAnc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C0F0EF80508; Mon, 21 Aug 2023 13:37:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 40683F8055C;
	Mon, 21 Aug 2023 13:37:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 78946F80563; Mon, 21 Aug 2023 13:37:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 51D21F80557
	for <alsa-devel@alsa-project.org>; Mon, 21 Aug 2023 13:37:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 51D21F80557
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=XFTW9p3v
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692617830; x=1724153830;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZJamRoPfjENawaLhuGG/BhwprsoGYIleGLq3xO33130=;
  b=XFTW9p3vTVwsL/v+S/bBI13kUG8q2JLbZXl9NdyMpcxsLzUedn8SZArQ
   ND9mVv9O8HLipulCm1yzLX8lFLbOR0ek1XkU9aapCFtWzACBBscHx+3yH
   OoBvq9/wuTp0tvvIESurGqKjP7AIl2JeuTwN7IzBIVsId1mah7niWL+1Q
   HvCILgPuQjuYRXzNy3ssMHtk/kcq0/YojsHd6ScFKvt3SuPh4xzFU9/w2
   xKZi5vHcJZ6wmeZYFvhzT8JrFHSU6JCxTKtcj8nJ3zz8KqRiosFAE134J
   DI734jdDZ5JU2AIJw++2pYbTtujOkqjqg39SoBmEEPf+UdrBOBCigJsj0
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10808"; a="459933107"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200";
   d="scan'208";a="459933107"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2023 04:36:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10808"; a="770911395"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200";
   d="scan'208";a="770911395"
Received: from yabolano-mobl.amr.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.44.22])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2023 04:36:38 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	pierre-louis.bossart@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	seppo.ingalsuo@linux.intel.com
Subject: [PATCH 2/4] ASoC: SOF: ipc4-topology: Fix the output reference params
 for SRC
Date: Mon, 21 Aug 2023 14:36:27 +0300
Message-ID: <20230821113629.5017-3-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230821113629.5017-1-peter.ujfalusi@linux.intel.com>
References: <20230821113629.5017-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: IVNPSEIZ4LZ2CHSEHYHTM7EN7WBN4PH6
X-Message-ID-Hash: IVNPSEIZ4LZ2CHSEHYHTM7EN7WBN4PH6
X-MailFrom: peter.ujfalusi@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IVNPSEIZ4LZ2CHSEHYHTM7EN7WBN4PH6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

For playback, the SRC sink rate must be configured based on the requested
output format which is restricted to only handle DAI's that support a
single audio format for now. For capture, the SRC module should convert
the rate to match the rate requested by the PCM hw_params.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Seppo Ingalsuo <seppo.ingalsuo@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/ipc4-topology.c | 40 ++++++++++++++++++++++++++---------
 1 file changed, 30 insertions(+), 10 deletions(-)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index 8bc12f12888d..39649fddf16a 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -1839,19 +1839,39 @@ static int sof_ipc4_prepare_src_module(struct snd_sof_widget *swidget,
 	struct sof_ipc4_src *src = swidget->private;
 	struct sof_ipc4_available_audio_format *available_fmt = &src->available_fmt;
 	struct sof_ipc4_audio_format *out_audio_fmt;
-	struct sof_ipc4_audio_format *in_fmt;
+	struct sof_ipc4_audio_format *in_audio_fmt;
 	u32 out_ref_rate, out_ref_channels, out_ref_valid_bits;
-	int ret, output_format_index;
+	int output_format_index, input_format_index;
 
-	ret = sof_ipc4_init_input_audio_fmt(sdev, swidget, &src->base_config,
-					    pipeline_params, available_fmt);
-	if (ret < 0)
-		return ret;
+	input_format_index = sof_ipc4_init_input_audio_fmt(sdev, swidget, &src->base_config,
+							   pipeline_params, available_fmt);
+	if (input_format_index < 0)
+		return input_format_index;
 
-	in_fmt = &available_fmt->input_pin_fmts[ret].audio_fmt;
-	out_ref_rate = in_fmt->sampling_frequency;
-	out_ref_channels = SOF_IPC4_AUDIO_FORMAT_CFG_CHANNELS_COUNT(in_fmt->fmt_cfg);
-	out_ref_valid_bits = SOF_IPC4_AUDIO_FORMAT_CFG_V_BIT_DEPTH(in_fmt->fmt_cfg);
+	/*
+	 * For playback, the SRC sink rate will be configured based on the requested output
+	 * format, which is restricted to only deal with DAI's with a single format for now.
+	 */
+	if (dir == SNDRV_PCM_STREAM_PLAYBACK && available_fmt->num_output_formats > 1) {
+		dev_err(sdev->dev, "Invalid number of output formats: %d for SRC %s\n",
+			available_fmt->num_output_formats, swidget->widget->name);
+		return -EINVAL;
+	}
+
+	/*
+	 * SRC does not perform format conversion, so the output channels and valid bit depth must
+	 * be the same as that of the input.
+	 */
+	in_audio_fmt = &available_fmt->input_pin_fmts[input_format_index].audio_fmt;
+	out_ref_channels = SOF_IPC4_AUDIO_FORMAT_CFG_CHANNELS_COUNT(in_audio_fmt->fmt_cfg);
+	out_ref_valid_bits = SOF_IPC4_AUDIO_FORMAT_CFG_V_BIT_DEPTH(in_audio_fmt->fmt_cfg);
+
+	/*
+	 * For capture, the SRC module should convert the rate to match the rate requested by the
+	 * PCM hw_params. Set the reference params based on the fe_params unconditionally as it
+	 * will be ignored for playback anyway.
+	 */
+	out_ref_rate = params_rate(fe_params);
 
 	output_format_index = sof_ipc4_init_output_audio_fmt(sdev, &src->base_config,
 							     available_fmt, out_ref_rate,
-- 
2.41.0

