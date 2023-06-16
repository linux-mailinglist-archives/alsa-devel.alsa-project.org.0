Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C9E732CA9
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Jun 2023 12:02:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 42F28829;
	Fri, 16 Jun 2023 12:02:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 42F28829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686909772;
	bh=Bk2q3iAAiKycn2Ls9NCUI96RekuI5lfq81JLCALIQyw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hwwB0q5ajrtbWtUeHCMawTbD9TNfJp/bjLJdxmhsnLeL9XAt/4RNddGLoYnwPSfiZ
	 aCEkDGTmVOz0SooBrQkRwzwrM2X1ZeNSTSFIQ2TliwvJefwlotxhLDvG1XrTciQVKN
	 38NxSb+kNIWc3uHpK/excTB9SHIjfMk0AiTKQrEU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6B2ABF80552; Fri, 16 Jun 2023 12:01:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8ED9FF80549;
	Fri, 16 Jun 2023 12:01:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 641A1F80246; Fri, 16 Jun 2023 12:01:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1973FF80132
	for <alsa-devel@alsa-project.org>; Fri, 16 Jun 2023 12:00:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1973FF80132
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=nn1BiNhC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686909661; x=1718445661;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Bk2q3iAAiKycn2Ls9NCUI96RekuI5lfq81JLCALIQyw=;
  b=nn1BiNhCNBxDp/TovIPzGiRzgf4wrIBWssoHbzR7rJB/XzdZkcxz1SVC
   mctwGVnjpJpJ8QbqorFgmojXDzjlQ3FNfBn7ygvXcrKLOOK+nAaWp8YQ4
   oG5xn1q/d0mtEJ74LpxvrVwqfXbOkEM/jYhNjafLw17Z88lBoJZLH5Txw
   FaoiBx/a4JhyVWBPG897PjuluCpmpDfvfa7S4K8S7LX7UkXJy0LUMyHRy
   1Xm6XCEaWhQFCbKZ3M1Mna4hRMv6bNSBaS5xkdM6idnH6T012Qz0YKqeJ
   tJhYmoPbedK2SFncFvtl0O8nKfuyRWGTPBbISB2q5TFG5aF95XybvT6pD
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="362591580"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400";
   d="scan'208";a="362591580"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2023 03:00:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="825689338"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400";
   d="scan'208";a="825689338"
Received: from kjaffe-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.254.114.132])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2023 03:00:54 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 1/8] ASoC: SOF: sof-audio: add is_virtual_widget helper
Date: Fri, 16 Jun 2023 12:00:32 +0200
Message-Id: <20230616100039.378150-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230616100039.378150-1-pierre-louis.bossart@linux.intel.com>
References: <20230616100039.378150-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: HC33MM6WZFNGCTEBZVRN2JXT4TXFRXZN
X-Message-ID-Hash: HC33MM6WZFNGCTEBZVRN2JXT4TXFRXZN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HC33MM6WZFNGCTEBZVRN2JXT4TXFRXZN/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Bard Liao <yung-chuan.liao@linux.intel.com>

Testing virtual widget is required in many functions. No function
changed in this commit.

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/sof-audio.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
index 1cbda595c518..c77d07d62517 100644
--- a/sound/soc/sof/sof-audio.c
+++ b/sound/soc/sof/sof-audio.c
@@ -14,6 +14,20 @@
 #include "sof-of-dev.h"
 #include "ops.h"
 
+static bool is_virtual_widget(struct snd_sof_dev *sdev, struct snd_soc_dapm_widget *widget,
+			      const char *func)
+{
+	switch (widget->id) {
+	case snd_soc_dapm_out_drv:
+	case snd_soc_dapm_output:
+	case snd_soc_dapm_input:
+		dev_dbg(sdev->dev, "%s: %s is a virtual widget\n", func, widget->name);
+		return true;
+	default:
+		return false;
+	}
+}
+
 static void sof_reset_route_setup_status(struct snd_sof_dev *sdev, struct snd_sof_widget *widget)
 {
 	const struct sof_ipc_tplg_ops *tplg_ops = sof_ipc_get_ops(sdev, tplg);
@@ -231,23 +245,9 @@ int sof_route_setup(struct snd_sof_dev *sdev, struct snd_soc_dapm_widget *wsourc
 	bool route_found = false;
 
 	/* ignore routes involving virtual widgets in topology */
-	switch (src_widget->id) {
-	case snd_soc_dapm_out_drv:
-	case snd_soc_dapm_output:
-	case snd_soc_dapm_input:
+	if (is_virtual_widget(sdev, src_widget->widget, __func__) ||
+	    is_virtual_widget(sdev, sink_widget->widget, __func__))
 		return 0;
-	default:
-		break;
-	}
-
-	switch (sink_widget->id) {
-	case snd_soc_dapm_out_drv:
-	case snd_soc_dapm_output:
-	case snd_soc_dapm_input:
-		return 0;
-	default:
-		break;
-	}
 
 	/* find route matching source and sink widgets */
 	list_for_each_entry(sroute, &sdev->route_list, list)
-- 
2.37.2

