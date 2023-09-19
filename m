Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 828C67A5FEA
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Sep 2023 12:45:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C7768EA6;
	Tue, 19 Sep 2023 12:44:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C7768EA6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695120322;
	bh=bm0/lTt3ptVgm/Vot3UN9XW6HF7nqm1rDRIIbpXT8ao=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=j78jgFRRk/x9jc01qWfkUnp5r/Xy72k7rOn2ihMLXgoihVdUNzhZLQX6Ur8F06uO9
	 ee+Scw+BJdvULgfJo2V5Bw/38tWEfabhsP+EFltO/NxMmKm/z5+WQEn2y0+nR+9Nd2
	 dy+Zc+P2knK1BEHCdanbxkIPaC3MqEAe3v614rt8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1F14CF805D4; Tue, 19 Sep 2023 12:42:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B9ED7F805C9;
	Tue, 19 Sep 2023 12:42:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E5E11F805BF; Tue, 19 Sep 2023 12:42:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E2649F805AE
	for <alsa-devel@alsa-project.org>; Tue, 19 Sep 2023 12:42:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2649F805AE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=kIQ7ii/w
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695120163; x=1726656163;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bm0/lTt3ptVgm/Vot3UN9XW6HF7nqm1rDRIIbpXT8ao=;
  b=kIQ7ii/w12FcGb3kvo1YjMGMyjatBKkvLJnhDX3nRXr63rHE83QEBa07
   qfnRpiHGlR47dXAJgeSBC5j1kgRFYz0kpF3hdJLn2gV2sX09T+aP14AFN
   R7/RfJ6I5ZECEbWASs3nUpwkC1LfWXOOL/k6Ylbl2k6XoWv3KpTlFjy5L
   v7xMpwDoqoptEjC5nLlvjfTy1DI1ltUEYvYYjtt251dko30WOTAaeWime
   +9Xsj4JfvA2GJT2wqTb/lNtyBqVemlVQnYYxl3JxLce5HllLdxWmN3LH7
   qj9VrXukfTaaK5bHfLr0rfYl8ZMVeAwSUK1A6SSjoxmrrxnu5ggwr/Diz
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="382658493"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000";
   d="scan'208";a="382658493"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 03:42:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="722823281"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000";
   d="scan'208";a="722823281"
Received: from mokashi-mobl1.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.50.26])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 03:42:35 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	pierre-louis.bossart@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	daniel.baluta@nxp.com,
	rander.wang@intel.com
Subject: [PATCH 6/9] ASoC: SOF: imx: Use generic names for IPC types
Date: Tue, 19 Sep 2023 13:42:23 +0300
Message-ID: <20230919104226.32239-7-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230919104226.32239-1-peter.ujfalusi@linux.intel.com>
References: <20230919104226.32239-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: RNF5DSKICUY4GAR2UDMQVXRZEXSJVQSO
X-Message-ID-Hash: RNF5DSKICUY4GAR2UDMQVXRZEXSJVQSO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RNF5DSKICUY4GAR2UDMQVXRZEXSJVQSO/>
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
 sound/soc/sof/imx/imx8.c    | 20 ++++++++++----------
 sound/soc/sof/imx/imx8m.c   | 10 +++++-----
 sound/soc/sof/imx/imx8ulp.c | 10 +++++-----
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/sound/soc/sof/imx/imx8.c b/sound/soc/sof/imx/imx8.c
index 2844d9a8040a..65a7041cbab9 100644
--- a/sound/soc/sof/imx/imx8.c
+++ b/sound/soc/sof/imx/imx8.c
@@ -609,32 +609,32 @@ static struct snd_sof_dsp_ops sof_imx8x_ops = {
 };
 
 static struct sof_dev_desc sof_of_imx8qxp_desc = {
-	.ipc_supported_mask	= BIT(SOF_IPC),
-	.ipc_default		= SOF_IPC,
+	.ipc_supported_mask	= BIT(SOF_IPC_TYPE_3),
+	.ipc_default		= SOF_IPC_TYPE_3,
 	.default_fw_path = {
-		[SOF_IPC] = "imx/sof",
+		[SOF_IPC_TYPE_3] = "imx/sof",
 	},
 	.default_tplg_path = {
-		[SOF_IPC] = "imx/sof-tplg",
+		[SOF_IPC_TYPE_3] = "imx/sof-tplg",
 	},
 	.default_fw_filename = {
-		[SOF_IPC] = "sof-imx8x.ri",
+		[SOF_IPC_TYPE_3] = "sof-imx8x.ri",
 	},
 	.nocodec_tplg_filename = "sof-imx8-nocodec.tplg",
 	.ops = &sof_imx8x_ops,
 };
 
 static struct sof_dev_desc sof_of_imx8qm_desc = {
-	.ipc_supported_mask	= BIT(SOF_IPC),
-	.ipc_default		= SOF_IPC,
+	.ipc_supported_mask	= BIT(SOF_IPC_TYPE_3),
+	.ipc_default		= SOF_IPC_TYPE_3,
 	.default_fw_path = {
-		[SOF_IPC] = "imx/sof",
+		[SOF_IPC_TYPE_3] = "imx/sof",
 	},
 	.default_tplg_path = {
-		[SOF_IPC] = "imx/sof-tplg",
+		[SOF_IPC_TYPE_3] = "imx/sof-tplg",
 	},
 	.default_fw_filename = {
-		[SOF_IPC] = "sof-imx8.ri",
+		[SOF_IPC_TYPE_3] = "sof-imx8.ri",
 	},
 	.nocodec_tplg_filename = "sof-imx8-nocodec.tplg",
 	.ops = &sof_imx8_ops,
diff --git a/sound/soc/sof/imx/imx8m.c b/sound/soc/sof/imx/imx8m.c
index 1243f8a6141e..9d58dda8f079 100644
--- a/sound/soc/sof/imx/imx8m.c
+++ b/sound/soc/sof/imx/imx8m.c
@@ -471,16 +471,16 @@ static struct snd_sof_dsp_ops sof_imx8m_ops = {
 };
 
 static struct sof_dev_desc sof_of_imx8mp_desc = {
-	.ipc_supported_mask	= BIT(SOF_IPC),
-	.ipc_default		= SOF_IPC,
+	.ipc_supported_mask	= BIT(SOF_IPC_TYPE_3),
+	.ipc_default		= SOF_IPC_TYPE_3,
 	.default_fw_path = {
-		[SOF_IPC] = "imx/sof",
+		[SOF_IPC_TYPE_3] = "imx/sof",
 	},
 	.default_tplg_path = {
-		[SOF_IPC] = "imx/sof-tplg",
+		[SOF_IPC_TYPE_3] = "imx/sof-tplg",
 	},
 	.default_fw_filename = {
-		[SOF_IPC] = "sof-imx8m.ri",
+		[SOF_IPC_TYPE_3] = "sof-imx8m.ri",
 	},
 	.nocodec_tplg_filename = "sof-imx8-nocodec.tplg",
 	.ops = &sof_imx8m_ops,
diff --git a/sound/soc/sof/imx/imx8ulp.c b/sound/soc/sof/imx/imx8ulp.c
index 4a562c9856e9..2673c1d4ddea 100644
--- a/sound/soc/sof/imx/imx8ulp.c
+++ b/sound/soc/sof/imx/imx8ulp.c
@@ -478,16 +478,16 @@ static struct snd_sof_dsp_ops sof_imx8ulp_ops = {
 };
 
 static struct sof_dev_desc sof_of_imx8ulp_desc = {
-	.ipc_supported_mask     = BIT(SOF_IPC),
-	.ipc_default            = SOF_IPC,
+	.ipc_supported_mask     = BIT(SOF_IPC_TYPE_3),
+	.ipc_default            = SOF_IPC_TYPE_3,
 	.default_fw_path = {
-		[SOF_IPC] = "imx/sof",
+		[SOF_IPC_TYPE_3] = "imx/sof",
 	},
 	.default_tplg_path = {
-		[SOF_IPC] = "imx/sof-tplg",
+		[SOF_IPC_TYPE_3] = "imx/sof-tplg",
 	},
 	.default_fw_filename = {
-		[SOF_IPC] = "sof-imx8ulp.ri",
+		[SOF_IPC_TYPE_3] = "sof-imx8ulp.ri",
 	},
 	.nocodec_tplg_filename = "sof-imx8ulp-nocodec.tplg",
 	.ops = &sof_imx8ulp_ops,
-- 
2.42.0

