Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2942A702AA2
	for <lists+alsa-devel@lfdr.de>; Mon, 15 May 2023 12:34:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8F4EA1EF;
	Mon, 15 May 2023 12:34:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8F4EA1EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684146895;
	bh=PzQ1+C3Lh0ZemRTOUhxLoLdIDWF6WwW4mkxtnL6k3f0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vVEwSQpfSrcBGOGwZFErcIK/a6gKvtpZa4JGlf0ej+siKEfs0TzLfLKbaVZFf2Dbc
	 fW4t9ePlqREg5peJ80CRLdJa5AZrsKp9/YU4XA8ONlr4Z4MfvoNlEg+hLkEE+43Nyl
	 9HDfBQYGatk3CWZvGY3G+63MnWDn+HXyFT1a1s5k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D1600F805A8; Mon, 15 May 2023 12:33:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D7FDBF80589;
	Mon, 15 May 2023 12:33:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1C0EDF8016D; Mon, 15 May 2023 12:32:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 109D6F8016D
	for <alsa-devel@alsa-project.org>; Mon, 15 May 2023 12:32:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 109D6F8016D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=jjwa39ez
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684146770; x=1715682770;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PzQ1+C3Lh0ZemRTOUhxLoLdIDWF6WwW4mkxtnL6k3f0=;
  b=jjwa39ezUc+NA36gZozk0ihkZYTYrzbYyO/dPB5e3O1Gk+vXvh3sIz+P
   RmGFFo51SmdrCym+LRcwdbrr5lFWq5sSDXPq3h3+FQb11AQZlpSfsPZkH
   aBOAXQWpDPke5ymrfWXDLG3d8yjqt4jiYxvndYNSd253/BH82pN6Uaeeh
   qwpnOExQTbjfzEez/E0CR4fcn5is8VLD/pIKOyOKvRFSuOUvo5KcjNWuJ
   bssG9CppdCcY2Y4GTOg5phMJIP8p2dfiFG8QwIYMPZJlUyJZprYm9wGnW
   OtDiQG2FuzPS6NQEsw8TsFJtXltj5fnfcSawQjOBIAWhcRG0oV1GRVurf
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10710"; a="351200343"
X-IronPort-AV: E=Sophos;i="5.99,276,1677571200";
   d="scan'208";a="351200343"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2023 03:32:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10710"; a="694967638"
X-IronPort-AV: E=Sophos;i="5.99,276,1677571200";
   d="scan'208";a="694967638"
Received: from lpilolli-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.48.230])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2023 03:32:43 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	pierre-louis.bossart@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	yung-chuan.liao@linux.intel.com
Subject: [PATCH 1/9] ASoC: SOF: ipc4-topology: Handle input/output audio
 format special case
Date: Mon, 15 May 2023 13:33:28 +0300
Message-Id: <20230515103336.16132-2-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230515103336.16132-1-peter.ujfalusi@linux.intel.com>
References: <20230515103336.16132-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: AVGN6KOA7TFY54QJFPFPZ72WFC6IVLGS
X-Message-ID-Hash: AVGN6KOA7TFY54QJFPFPZ72WFC6IVLGS
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
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

When there is only one input/output format specified in topology, there
is no need to search for a matching format, simply pick the available
one. This is in preparation to modify and split the selection logic for
the input and output audio formats.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/ipc4-topology.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index 059eebf0a687..3e59551b2367 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -1039,7 +1039,7 @@ static int sof_ipc4_init_audio_fmt(struct snd_sof_dev *sdev,
 	u32 channels;
 	u32 rate;
 	int sample_valid_bits;
-	int i;
+	int i = 0;
 
 	if (!pin_fmts) {
 		dev_err(sdev->dev, "no reference formats for %s\n", swidget->widget->name);
@@ -1066,6 +1066,10 @@ static int sof_ipc4_init_audio_fmt(struct snd_sof_dev *sdev,
 		return -EINVAL;
 	}
 
+	/* pick the only available input format */
+	if (available_fmt->num_input_formats == 1)
+		goto in_fmt;
+
 	/*
 	 * Search supported audio formats with pin index 0 to match rate, channels ,and
 	 * sample_valid_bytes from runtime params
@@ -1093,6 +1097,7 @@ static int sof_ipc4_init_audio_fmt(struct snd_sof_dev *sdev,
 		return -EINVAL;
 	}
 
+in_fmt:
 	/* copy input format */
 	if (available_fmt->num_input_formats && i < available_fmt->num_input_formats) {
 		memcpy(&base_config->audio_fmt, &available_fmt->input_pin_fmts[i].audio_fmt,
@@ -1105,6 +1110,10 @@ static int sof_ipc4_init_audio_fmt(struct snd_sof_dev *sdev,
 		sof_ipc4_dbg_audio_format(sdev->dev, &available_fmt->input_pin_fmts[i], 1);
 	}
 
+	/* pick the only available output format */
+	if (available_fmt->num_output_formats == 1)
+		i = 0;
+
 	if (available_fmt->num_output_formats && i < available_fmt->num_output_formats)
 		base_config->obs = available_fmt->output_pin_fmts[i].buffer_size;
 
-- 
2.40.1

