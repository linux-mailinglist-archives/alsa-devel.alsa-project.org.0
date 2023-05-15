Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D6A702AA7
	for <lists+alsa-devel@lfdr.de>; Mon, 15 May 2023 12:36:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 522E31E4;
	Mon, 15 May 2023 12:35:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 522E31E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684146970;
	bh=XaCcsrZC1fu18z47oMCaGJLl9zQRZDNwSvV8kwO4fS4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=P2/a4TmqcEOzG7aeBfwshX9k6O6PtlNkhCzVmtnx3C1VfgCpiHhzfIQagsD9KvJ0S
	 DxHfkDlQ2cBp4NmzD8hQXKOJU1Cdjd5UDDwYvWWttNu5lZgb3gi7sSlXWNS9nb8Ykv
	 f6dSbjw9l6DN9Hy0USjOEpyK0bwCq4y/DkPhmXic=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7ABB6F805D7; Mon, 15 May 2023 12:33:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 382A8F805D4;
	Mon, 15 May 2023 12:33:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D7F6DF8058C; Mon, 15 May 2023 12:33:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DCDC2F80570
	for <alsa-devel@alsa-project.org>; Mon, 15 May 2023 12:33:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DCDC2F80570
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=PD7jafD5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684146785; x=1715682785;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XaCcsrZC1fu18z47oMCaGJLl9zQRZDNwSvV8kwO4fS4=;
  b=PD7jafD5AGndovokuOQfF52jRvg9UQmzj22Xhr145LEKjGCR4Gv6N93W
   8LOF5OUdOHYqIPZqZRnJr9NpIgZBlgzIvBxgYI59+Ytrjf8yORE68MJOG
   8jL8XWOIpBNpPCQtM0rZUPyFjD7B/1M9bLmmHmgDuYeY4ijK5nJ0ajXlw
   ZwD2AejC0RmNbSOuGPzZNUCZvwGIjbf6aYRcwZw4hXPyQWJh9tZXDn+5u
   Zhq80s63DevKuMUcyTV6xTwJnwJlHs2gS22czLzyThfzPLUSpv/rE6KY9
   FzKuVSHpsirXLDsG++s/zbgGA1OLDiEHKtmU/WLQO45GRfFpiLSQgfBpd
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10710"; a="351200422"
X-IronPort-AV: E=Sophos;i="5.99,276,1677571200";
   d="scan'208";a="351200422"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2023 03:33:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10710"; a="694967719"
X-IronPort-AV: E=Sophos;i="5.99,276,1677571200";
   d="scan'208";a="694967719"
Received: from lpilolli-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.48.230])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2023 03:33:00 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	pierre-louis.bossart@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	yung-chuan.liao@linux.intel.com
Subject: [PATCH 8/9] ASoC: SOF: ipc4-topology: New helper to check if all
 output formats are the same
Date: Mon, 15 May 2023 13:33:35 +0300
Message-Id: <20230515103336.16132-9-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230515103336.16132-1-peter.ujfalusi@linux.intel.com>
References: <20230515103336.16132-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: TQB53SPHNYMERGN7EACBP7LLK6EL62BY
X-Message-ID-Hash: TQB53SPHNYMERGN7EACBP7LLK6EL62BY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TQB53SPHNYMERGN7EACBP7LLK6EL62BY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

Add a helper function to check if all formats are identical.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/ipc4-topology.c | 53 ++++++++++++++++++++---------------
 1 file changed, 31 insertions(+), 22 deletions(-)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index 7f5400612bf8..723e72d2d325 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -1028,6 +1028,34 @@ static int sof_ipc4_update_hw_params(struct snd_sof_dev *sdev, struct snd_pcm_hw
 	return 0;
 }
 
+static bool sof_ipc4_is_single_format(struct snd_sof_dev *sdev,
+				      struct sof_ipc4_pin_format *pin_fmts, u32 pin_fmts_size)
+{
+	struct sof_ipc4_audio_format *fmt;
+	u32 rate, channels, valid_bits;
+	int i;
+
+	fmt = &pin_fmts[0].audio_fmt;
+	rate = fmt->sampling_frequency;
+	channels = SOF_IPC4_AUDIO_FORMAT_CFG_CHANNELS_COUNT(fmt->fmt_cfg);
+	valid_bits = SOF_IPC4_AUDIO_FORMAT_CFG_V_BIT_DEPTH(fmt->fmt_cfg);
+
+	/* check if all output formats in topology are the same */
+	for (i = 1; i < pin_fmts_size; i++) {
+		u32 _rate, _channels, _valid_bits;
+
+		fmt = &pin_fmts[i].audio_fmt;
+		_rate = fmt->sampling_frequency;
+		_channels = SOF_IPC4_AUDIO_FORMAT_CFG_CHANNELS_COUNT(fmt->fmt_cfg);
+		_valid_bits = SOF_IPC4_AUDIO_FORMAT_CFG_V_BIT_DEPTH(fmt->fmt_cfg);
+
+		if (_rate != rate || _channels != channels || _valid_bits != valid_bits)
+			return false;
+	}
+
+	return true;
+}
+
 static int sof_ipc4_init_output_audio_fmt(struct snd_sof_dev *sdev,
 					  struct sof_ipc4_base_module_cfg *base_config,
 					  struct sof_ipc4_available_audio_format *available_fmt,
@@ -1035,33 +1063,14 @@ static int sof_ipc4_init_output_audio_fmt(struct snd_sof_dev *sdev,
 					  u32 out_ref_valid_bits)
 {
 	struct sof_ipc4_audio_format *out_fmt;
-	u32 out_rate, out_channels, out_valid_bits;
-	bool single_format = true;
+	bool single_format;
 	int i;
 
 	if (!available_fmt->num_output_formats)
 		return -EINVAL;
 
-	out_fmt = &available_fmt->output_pin_fmts[0].audio_fmt;
-	out_rate = out_fmt->sampling_frequency;
-	out_channels = SOF_IPC4_AUDIO_FORMAT_CFG_CHANNELS_COUNT(out_fmt->fmt_cfg);
-	out_valid_bits = SOF_IPC4_AUDIO_FORMAT_CFG_V_BIT_DEPTH(out_fmt->fmt_cfg);
-
-	/* check if all output formats in topology are the same */
-	for (i = 1; i < available_fmt->num_output_formats; i++) {
-		u32 _out_rate, _out_channels, _out_valid_bits;
-
-		out_fmt = &available_fmt->output_pin_fmts[i].audio_fmt;
-		_out_rate = out_fmt->sampling_frequency;
-		_out_channels = SOF_IPC4_AUDIO_FORMAT_CFG_CHANNELS_COUNT(out_fmt->fmt_cfg);
-		_out_valid_bits = SOF_IPC4_AUDIO_FORMAT_CFG_V_BIT_DEPTH(out_fmt->fmt_cfg);
-
-		if (_out_rate != out_rate || _out_channels != out_channels ||
-		    _out_valid_bits != out_valid_bits) {
-			single_format = false;
-			break;
-		}
-	}
+	single_format = sof_ipc4_is_single_format(sdev, available_fmt->output_pin_fmts,
+						  available_fmt->num_output_formats);
 
 	/* pick the first format if there's only one available or if all formats are the same */
 	if (single_format) {
-- 
2.40.1

