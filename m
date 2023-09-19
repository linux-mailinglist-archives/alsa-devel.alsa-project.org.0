Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A627A5FF2
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Sep 2023 12:46:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 45605E86;
	Tue, 19 Sep 2023 12:45:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 45605E86
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695120379;
	bh=aaMLuEiP7TVXj7E8zb9XY4W/RIc703I1jPOLEd+vB3I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lnCKh24QkBTwTPhjXj5BOW290g4MdDZiyMsTg70FrPEUNTbZxBy+hMy5fWvvpLJkr
	 gTr45PaeAylXD1TnNkhHPYfLf3C7h0/aEH01fKz79P7cA7A8BIlb0DCymuPNRgTmPz
	 e9ToTm9gynBAxxJzSfgJ4TSsQChChJjGxMek9p1c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E7FEDF805FD; Tue, 19 Sep 2023 12:42:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7896FF805F4;
	Tue, 19 Sep 2023 12:42:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 24993F805CA; Tue, 19 Sep 2023 12:42:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8E249F805C2
	for <alsa-devel@alsa-project.org>; Tue, 19 Sep 2023 12:42:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E249F805C2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=JrSY10fM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695120167; x=1726656167;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=aaMLuEiP7TVXj7E8zb9XY4W/RIc703I1jPOLEd+vB3I=;
  b=JrSY10fMmENV2s6PyxuQfD9g7ZqQLvZj16j7bMVNkRwwkap7aO+0hzvg
   HEnMuRPLgsCFQD4eIPLzm6QcA3hbDyXOg8pc6wko31LUmVZU10TjjxbLj
   oLkbik+eO3SvtGCu+MP3/3Yo7WgRrTu2cfdu9pRGmQhntjYLJwojGJJ6F
   EAtlZcVtCKYoQ0IivvAL7I9BbFCXaN86g68/5v4JtRJNO82g4yFvJUd5s
   t6D0/oSUbmUYVqPQoneYFKFKS21VHo/KdDf/lDDRLc1CR8ccuKOKIBjHO
   RIhx17qUx9COegrXRN1nYdgOBpGAwKqy02QuBNUlUPhsZfx0UG7XlDLMD
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="382658514"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000";
   d="scan'208";a="382658514"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 03:42:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="722823302"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000";
   d="scan'208";a="722823302"
Received: from mokashi-mobl1.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.50.26])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 03:42:40 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	pierre-louis.bossart@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	daniel.baluta@nxp.com,
	rander.wang@intel.com
Subject: [PATCH 8/9] ASoC: SOF: mediatek: Use generic names for IPC types
Date: Tue, 19 Sep 2023 13:42:25 +0300
Message-ID: <20230919104226.32239-9-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230919104226.32239-1-peter.ujfalusi@linux.intel.com>
References: <20230919104226.32239-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: KTFGNG37HBM6MNOO3B4A2ULPO5EAQ4KZ
X-Message-ID-Hash: KTFGNG37HBM6MNOO3B4A2ULPO5EAQ4KZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KTFGNG37HBM6MNOO3B4A2ULPO5EAQ4KZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Use the new SOF_IPC_TYPE_3 in core code.

No functional changes, just renaming.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/mediatek/mt8186/mt8186.c | 20 ++++++++++----------
 sound/soc/sof/mediatek/mt8195/mt8195.c | 10 +++++-----
 2 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/sound/soc/sof/mediatek/mt8186/mt8186.c b/sound/soc/sof/mediatek/mt8186/mt8186.c
index f587edf9e0a7..8544d65bc2cf 100644
--- a/sound/soc/sof/mediatek/mt8186/mt8186.c
+++ b/sound/soc/sof/mediatek/mt8186/mt8186.c
@@ -607,16 +607,16 @@ static struct snd_sof_of_mach sof_mt8186_machs[] = {
 
 static const struct sof_dev_desc sof_of_mt8186_desc = {
 	.of_machines = sof_mt8186_machs,
-	.ipc_supported_mask	= BIT(SOF_IPC),
-	.ipc_default		= SOF_IPC,
+	.ipc_supported_mask	= BIT(SOF_IPC_TYPE_3),
+	.ipc_default		= SOF_IPC_TYPE_3,
 	.default_fw_path = {
-		[SOF_IPC] = "mediatek/sof",
+		[SOF_IPC_TYPE_3] = "mediatek/sof",
 	},
 	.default_tplg_path = {
-		[SOF_IPC] = "mediatek/sof-tplg",
+		[SOF_IPC_TYPE_3] = "mediatek/sof-tplg",
 	},
 	.default_fw_filename = {
-		[SOF_IPC] = "sof-mt8186.ri",
+		[SOF_IPC_TYPE_3] = "sof-mt8186.ri",
 	},
 	.nocodec_tplg_filename = "sof-mt8186-nocodec.tplg",
 	.ops = &sof_mt8186_ops,
@@ -681,16 +681,16 @@ static struct snd_sof_of_mach sof_mt8188_machs[] = {
 
 static const struct sof_dev_desc sof_of_mt8188_desc = {
 	.of_machines = sof_mt8188_machs,
-	.ipc_supported_mask	= BIT(SOF_IPC),
-	.ipc_default		= SOF_IPC,
+	.ipc_supported_mask	= BIT(SOF_IPC_TYPE_3),
+	.ipc_default		= SOF_IPC_TYPE_3,
 	.default_fw_path = {
-		[SOF_IPC] = "mediatek/sof",
+		[SOF_IPC_TYPE_3] = "mediatek/sof",
 	},
 	.default_tplg_path = {
-		[SOF_IPC] = "mediatek/sof-tplg",
+		[SOF_IPC_TYPE_3] = "mediatek/sof-tplg",
 	},
 	.default_fw_filename = {
-		[SOF_IPC] = "sof-mt8188.ri",
+		[SOF_IPC_TYPE_3] = "sof-mt8188.ri",
 	},
 	.nocodec_tplg_filename = "sof-mt8188-nocodec.tplg",
 	.ops = &sof_mt8188_ops,
diff --git a/sound/soc/sof/mediatek/mt8195/mt8195.c b/sound/soc/sof/mediatek/mt8195/mt8195.c
index 7d6a568556ea..fab2d5af8610 100644
--- a/sound/soc/sof/mediatek/mt8195/mt8195.c
+++ b/sound/soc/sof/mediatek/mt8195/mt8195.c
@@ -635,16 +635,16 @@ static struct snd_sof_of_mach sof_mt8195_machs[] = {
 
 static const struct sof_dev_desc sof_of_mt8195_desc = {
 	.of_machines = sof_mt8195_machs,
-	.ipc_supported_mask	= BIT(SOF_IPC),
-	.ipc_default		= SOF_IPC,
+	.ipc_supported_mask	= BIT(SOF_IPC_TYPE_3),
+	.ipc_default		= SOF_IPC_TYPE_3,
 	.default_fw_path = {
-		[SOF_IPC] = "mediatek/sof",
+		[SOF_IPC_TYPE_3] = "mediatek/sof",
 	},
 	.default_tplg_path = {
-		[SOF_IPC] = "mediatek/sof-tplg",
+		[SOF_IPC_TYPE_3] = "mediatek/sof-tplg",
 	},
 	.default_fw_filename = {
-		[SOF_IPC] = "sof-mt8195.ri",
+		[SOF_IPC_TYPE_3] = "sof-mt8195.ri",
 	},
 	.nocodec_tplg_filename = "sof-mt8195-nocodec.tplg",
 	.ops = &sof_mt8195_ops,
-- 
2.42.0

