Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 267FE732CAA
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Jun 2023 12:02:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F3D684C;
	Fri, 16 Jun 2023 12:02:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F3D684C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686909774;
	bh=srAy1YN4H6qredt/xC47GYnMbSJvwGaU4Fld0p7l8IU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=onrInm54EnLzgvlcRJ1oluyQR3nvM1VeyhZu4K4eobpQoM+1XTR/RDuFpkL9vead+
	 awlrbjGrV+EDNH821qb4HrWUKHs7+hueZF+e36llahnLcw12VkySC8hebbz637pCJl
	 w5uBdU7+ZYGkbgBYv/AyKQgFoqFfsq9tkq6vzsNs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 76E47F8057A; Fri, 16 Jun 2023 12:01:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 155E1F80568;
	Fri, 16 Jun 2023 12:01:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 13FB2F80301; Fri, 16 Jun 2023 12:01:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0BAD4F800BA
	for <alsa-devel@alsa-project.org>; Fri, 16 Jun 2023 12:01:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0BAD4F800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=RkSNTxcY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686909663; x=1718445663;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=srAy1YN4H6qredt/xC47GYnMbSJvwGaU4Fld0p7l8IU=;
  b=RkSNTxcYAZfecdj4dt6bPAIE3YQqAg7M43wGfxkX6LungNmva+TxXk5w
   rzuySrXLKfK8rzGvDtokWCCLx6aFkdEEBJPOZCErK+FUga6Z9gsJDKnSp
   uNoRIie37czSIRerwEuBXWsT8wPu32hNBSPxjWAK2SX/6eddtTa0y9Buf
   NowPmHg+WrnOZ78m/QDiSaikHjn9Gt8Td6Nrz3Q6tKb8wa5MlQRqDjWT5
   NlhXA/lWqShgOBlOZlGBJvrsN05IS6FUgz3y9QxdApsjO/hQgcF1geruA
   rTSp5dcMPHoaTdg0lCXHrCwCrkFuZVXG6IXPNufIiA4ukEpdFlb7bon2K
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="362591591"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400";
   d="scan'208";a="362591591"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2023 03:00:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="825689347"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400";
   d="scan'208";a="825689347"
Received: from kjaffe-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.254.114.132])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2023 03:00:57 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 2/8] ASoC: SOF: sof-audio: test virtual widget in
 sof_walk_widgets_in_order
Date: Fri, 16 Jun 2023 12:00:33 +0200
Message-Id: <20230616100039.378150-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230616100039.378150-1-pierre-louis.bossart@linux.intel.com>
References: <20230616100039.378150-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: NBZ4CTDZJM46TU4GKCEPZS2I5NG4PFCS
X-Message-ID-Hash: NBZ4CTDZJM46TU4GKCEPZS2I5NG4PFCS
X-MailFrom: pierre-louis.bossart@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NBZ4CTDZJM46TU4GKCEPZS2I5NG4PFCS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Bard Liao <yung-chuan.liao@linux.intel.com>

Virtual widgets are added for the purpose of showing connections between
aggregated DAIs in SDW topologies. However, we shouldn't touch them in
SOF.

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/sof-audio.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
index c77d07d62517..e7ef77012c35 100644
--- a/sound/soc/sof/sof-audio.c
+++ b/sound/soc/sof/sof-audio.c
@@ -396,6 +396,9 @@ sof_unprepare_widgets_in_path(struct snd_sof_dev *sdev, struct snd_soc_dapm_widg
 	const struct sof_ipc_tplg_widget_ops *widget_ops;
 	struct snd_soc_dapm_path *p;
 
+	if (is_virtual_widget(sdev, widget, __func__))
+		return;
+
 	/* skip if the widget is in use or if it is already unprepared */
 	if (!swidget || !swidget->prepared || swidget->use_count > 0)
 		goto sink_unprepare;
@@ -433,6 +436,9 @@ sof_prepare_widgets_in_path(struct snd_sof_dev *sdev, struct snd_soc_dapm_widget
 	struct snd_soc_dapm_path *p;
 	int ret;
 
+	if (is_virtual_widget(sdev, widget, __func__))
+		return 0;
+
 	widget_ops = tplg_ops ? tplg_ops->widget : NULL;
 	if (!widget_ops)
 		return 0;
@@ -488,6 +494,9 @@ static int sof_free_widgets_in_path(struct snd_sof_dev *sdev, struct snd_soc_dap
 	int err;
 	int ret = 0;
 
+	if (is_virtual_widget(sdev, widget, __func__))
+		return 0;
+
 	if (widget->dobj.private) {
 		err = sof_widget_free(sdev, widget->dobj.private);
 		if (err < 0)
@@ -527,6 +536,9 @@ static int sof_set_up_widgets_in_path(struct snd_sof_dev *sdev, struct snd_soc_d
 	struct snd_soc_dapm_path *p;
 	int ret;
 
+	if (is_virtual_widget(sdev, widget, __func__))
+		return 0;
+
 	if (swidget) {
 		int i;
 
@@ -592,6 +604,9 @@ sof_walk_widgets_in_order(struct snd_sof_dev *sdev, struct snd_sof_pcm *spcm,
 		return 0;
 
 	for_each_dapm_widgets(list, i, widget) {
+		if (is_virtual_widget(sdev, widget, __func__))
+			continue;
+
 		/* starting widget for playback is AIF type */
 		if (dir == SNDRV_PCM_STREAM_PLAYBACK && widget->id != snd_soc_dapm_aif_in)
 			continue;
-- 
2.37.2

