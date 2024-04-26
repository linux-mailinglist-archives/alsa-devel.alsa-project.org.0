Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 227CD8B3BCC
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Apr 2024 17:41:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B3EA6210D;
	Fri, 26 Apr 2024 17:41:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B3EA6210D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714146081;
	bh=wI9fs7bgOEAA0afP8UWfMGEmXEEIps2sXvmF8aVgK6g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CLTgaSrwIheszntcFOrEIFiBOuqFw4WcNBzUA/AmLGV4olvzfO0V4tTTXVg0G1L8n
	 RBk8z40+cctpD1Ag8sFgMfdMA8YhbPHy+dMiwDIqb8VyHci8PhAOzxR6KB4U6qlZ31
	 tn58fh4cQusktOlVwtPW/6jW/SOezn2hV6d0UjrI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 48E7AF80675; Fri, 26 Apr 2024 17:39:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8575BF8067F;
	Fri, 26 Apr 2024 17:39:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B6DA3F8045D; Fri, 26 Apr 2024 17:39:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 28310F8045D
	for <alsa-devel@alsa-project.org>; Fri, 26 Apr 2024 17:39:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28310F8045D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Az52asu/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714145961; x=1745681961;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wI9fs7bgOEAA0afP8UWfMGEmXEEIps2sXvmF8aVgK6g=;
  b=Az52asu/9dnAYtGWivQnnWXfYFsPhd9jkTrYkgNuqfmhLh8urNlg4OT7
   DwKnxh4qBNQYnfi6b3KJkqYqkNvfXAVYd8EoNLQ4wB2uKIIe/0wCPjSJ5
   7a9Testb0lV1pqcDs8iScwW5Opg2Joh9PPPObIbqmWt/PD5sJ5jXcN9gC
   BEz6uviso9O3mNnGYaZ4R6yQfQkh7LvaXVaBUmnn98FGWnpxFBPEkiQUE
   LEjQb2uwYp1l9CveCGJn+HAetV52DxDXGcgG8wkCpzRwta96kgBUmUFev
   3wthJDbB3I05BU352a+zwyzHi1gRypzRYYRdhQMre0Q7sIJJqcAw00aQv
   g==;
X-CSE-ConnectionGUID: MLyFtFNtS7iD2cwxYJb6KA==
X-CSE-MsgGUID: DIahIW9VTmKE/Mvu6CokWw==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="9718452"
X-IronPort-AV: E=Sophos;i="6.07,233,1708416000";
   d="scan'208";a="9718452"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 08:39:12 -0700
X-CSE-ConnectionGUID: fX3s3AjXS8KoheNEiPO6EQ==
X-CSE-MsgGUID: hdG1BTC5TUCJVMdKkP2OEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,233,1708416000";
   d="scan'208";a="56623543"
Received: from atarkhan-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.212.33.33])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 08:39:12 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 5/5] ASoC: SOF: ipc4-topology: Advertise passthrough capable
 PCMs (using ChainDMA)
Date: Fri, 26 Apr 2024 10:39:02 -0500
Message-Id: <20240426153902.39560-6-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240426153902.39560-1-pierre-louis.bossart@linux.intel.com>
References: <20240426153902.39560-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: W3D75SEQVMGNRRDLIGSSPO34R2QWC7AH
X-Message-ID-Hash: W3D75SEQVMGNRRDLIGSSPO34R2QWC7AH
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/W3D75SEQVMGNRRDLIGSSPO34R2QWC7AH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

If a PCM is set to use ChainDMA then add it to the card->components string
after a marker of iec61937-pcm:, for example on current HDA platforms where
HDMI is set to use ChainDMA:
iec61937-pcm:5,4,3 (the order of the PCM ids can differ)

UCM is expected to parse and use this property to allow applications to
use bytestream passthrough in a standard way.

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/ipc4-topology.c | 50 +++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index c29c1de4e925..a972b2b5122a 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -407,6 +407,52 @@ static void sof_ipc4_widget_update_kcontrol_module_id(struct snd_sof_widget *swi
 	}
 }
 
+static int
+sof_ipc4_update_card_components_string(struct snd_sof_widget *swidget,
+				       struct snd_sof_pcm *spcm, int dir)
+{
+	struct snd_sof_widget *pipe_widget = swidget->spipe->pipe_widget;
+	struct sof_ipc4_pipeline *pipeline = pipe_widget->private;
+	struct snd_soc_component *scomp = spcm->scomp;
+	struct snd_soc_card *card = scomp->card;
+	const char *pt_marker = "iec61937-pcm";
+
+	/*
+	 * Update the card's components list with iec61937-pcm and a list of PCM
+	 * ids where ChainDMA is enabled.
+	 * These PCMs can be used for bytestream passthrough.
+	 */
+	if (!pipeline->use_chain_dma)
+		return 0;
+
+	if (card->components) {
+		const char *tmp = card->components;
+
+		if (strstr(card->components, pt_marker))
+			card->components = devm_kasprintf(card->dev, GFP_KERNEL,
+							  "%s,%d",
+							  card->components,
+							  spcm->pcm.pcm_id);
+		else
+			card->components = devm_kasprintf(card->dev, GFP_KERNEL,
+							  "%s %s:%d",
+							  card->components,
+							  pt_marker,
+							  spcm->pcm.pcm_id);
+
+		devm_kfree(card->dev, tmp);
+	} else {
+		card->components = devm_kasprintf(card->dev, GFP_KERNEL,
+						  "%s:%d", pt_marker,
+						  spcm->pcm.pcm_id);
+	}
+
+	if (!card->components)
+		return -ENOMEM;
+
+	return 0;
+}
+
 static int sof_ipc4_widget_setup_pcm(struct snd_sof_widget *swidget)
 {
 	struct sof_ipc4_available_audio_format *available_fmt;
@@ -452,6 +498,10 @@ static int sof_ipc4_widget_setup_pcm(struct snd_sof_widget *swidget)
 	if (!spcm)
 		goto skip_gtw_cfg;
 
+	ret = sof_ipc4_update_card_components_string(swidget, spcm, dir);
+	if (ret)
+		goto free_available_fmt;
+
 	if (dir == SNDRV_PCM_STREAM_PLAYBACK) {
 		struct snd_sof_pcm_stream *sps = &spcm->stream[dir];
 
-- 
2.40.1

