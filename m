Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B136ADA89
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Mar 2023 10:41:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 550E113F7;
	Tue,  7 Mar 2023 10:40:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 550E113F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678182065;
	bh=44lyN9QvbJMA4E1dwnPvR2552dOS0k9VsiX+H0NqCp4=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=l9Eg3hmduuWQwXLGj6d9GWb5kCefl3JNNwPhyDlhP3exFFXjICxjpXqsng6MOrb2B
	 DnwJzy3dKkq/Es6tRDYudEUk1GK7nAVPBZhsfxseYWSCcwy3VuyyDjO4aesxQ+B3jf
	 7G/hxyFl78nllAGDWf0eTl17S/82gcM5H7vGwciU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B9014F80482;
	Tue,  7 Mar 2023 10:39:24 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 803B5F804B1; Tue,  7 Mar 2023 10:39:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E0459F8042F
	for <alsa-devel@alsa-project.org>; Tue,  7 Mar 2023 10:39:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0459F8042F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=S/xWVMnR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678181944; x=1709717944;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=44lyN9QvbJMA4E1dwnPvR2552dOS0k9VsiX+H0NqCp4=;
  b=S/xWVMnRd4n3Z9LjYIxVfVLSx+xAndp3so4yBI4/Bnjxgu16JAOVXDXj
   aFVbvfE3ZgfnrhqVT0+PO2d3hJ7vALM1iSsgGvDd4v2VQYJPGXr6vIDdf
   Kk1OHsV6V+5Wbxa1r4iW9byrH5P5KKj5uAst2BkRGBY9KkDWqJ6Qwgpha
   dQPFtC2V+eAasuN/wpb0ONm1g1N6ZgA6h1Fj7WfsJL3FbnFzMJECC7W4V
   W1be4e0p4RdJ9jyKUeLJeR7Ok5urbqX6eJTlOfv1gCuf5a1uvU8F2Trd/
   a5yyXUt2FkGviDK+OXQqaGsVHgO4Sv7FDGzJANwj8U923JZt8HoRdw7zd
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="338132613"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400";
   d="scan'208";a="338132613"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 01:39:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="676504887"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400";
   d="scan'208";a="676504887"
Received: from rganesh-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.47.75])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 01:38:58 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 2/4] ASoC: SOF: Intel: HDA: Fix device description
Date: Tue,  7 Mar 2023 11:39:12 +0200
Message-Id: <20230307093914.25409-3-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230307093914.25409-1-peter.ujfalusi@linux.intel.com>
References: <20230307093914.25409-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: WHCA3AST5WEES2OUWC6G6GO6UATD5IC2
X-Message-ID-Hash: WHCA3AST5WEES2OUWC6G6GO6UATD5IC2
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 yung-chuan.liao@linux.intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WHCA3AST5WEES2OUWC6G6GO6UATD5IC2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

Add the missing ops_free callback for APL/CNL/CML/JSL/TGL/EHL platforms.

Fixes: 1da51943725f ("ASoC: SOF: Intel: hda: init NHLT for IPC4")

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/intel/pci-apl.c | 1 +
 sound/soc/sof/intel/pci-cnl.c | 2 ++
 sound/soc/sof/intel/pci-icl.c | 1 +
 sound/soc/sof/intel/pci-tgl.c | 5 +++++
 4 files changed, 9 insertions(+)

diff --git a/sound/soc/sof/intel/pci-apl.c b/sound/soc/sof/intel/pci-apl.c
index 69279dcc92dc..aff6cb573c27 100644
--- a/sound/soc/sof/intel/pci-apl.c
+++ b/sound/soc/sof/intel/pci-apl.c
@@ -78,6 +78,7 @@ static const struct sof_dev_desc glk_desc = {
 	.nocodec_tplg_filename = "sof-glk-nocodec.tplg",
 	.ops = &sof_apl_ops,
 	.ops_init = sof_apl_ops_init,
+	.ops_free = hda_ops_free,
 };
 
 /* PCI IDs */
diff --git a/sound/soc/sof/intel/pci-cnl.c b/sound/soc/sof/intel/pci-cnl.c
index 8db3f8d15b55..4c0c1c369dcd 100644
--- a/sound/soc/sof/intel/pci-cnl.c
+++ b/sound/soc/sof/intel/pci-cnl.c
@@ -48,6 +48,7 @@ static const struct sof_dev_desc cnl_desc = {
 	.nocodec_tplg_filename = "sof-cnl-nocodec.tplg",
 	.ops = &sof_cnl_ops,
 	.ops_init = sof_cnl_ops_init,
+	.ops_free = hda_ops_free,
 };
 
 static const struct sof_dev_desc cfl_desc = {
@@ -111,6 +112,7 @@ static const struct sof_dev_desc cml_desc = {
 	.nocodec_tplg_filename = "sof-cnl-nocodec.tplg",
 	.ops = &sof_cnl_ops,
 	.ops_init = sof_cnl_ops_init,
+	.ops_free = hda_ops_free,
 };
 
 /* PCI IDs */
diff --git a/sound/soc/sof/intel/pci-icl.c b/sound/soc/sof/intel/pci-icl.c
index d6cf75e357db..6785669113b3 100644
--- a/sound/soc/sof/intel/pci-icl.c
+++ b/sound/soc/sof/intel/pci-icl.c
@@ -79,6 +79,7 @@ static const struct sof_dev_desc jsl_desc = {
 	.nocodec_tplg_filename = "sof-jsl-nocodec.tplg",
 	.ops = &sof_cnl_ops,
 	.ops_init = sof_cnl_ops_init,
+	.ops_free = hda_ops_free,
 };
 
 /* PCI IDs */
diff --git a/sound/soc/sof/intel/pci-tgl.c b/sound/soc/sof/intel/pci-tgl.c
index e80c4dfef85a..adc7314a1b57 100644
--- a/sound/soc/sof/intel/pci-tgl.c
+++ b/sound/soc/sof/intel/pci-tgl.c
@@ -48,6 +48,7 @@ static const struct sof_dev_desc tgl_desc = {
 	.nocodec_tplg_filename = "sof-tgl-nocodec.tplg",
 	.ops = &sof_tgl_ops,
 	.ops_init = sof_tgl_ops_init,
+	.ops_free = hda_ops_free,
 };
 
 static const struct sof_dev_desc tglh_desc = {
@@ -110,6 +111,7 @@ static const struct sof_dev_desc ehl_desc = {
 	.nocodec_tplg_filename = "sof-ehl-nocodec.tplg",
 	.ops = &sof_tgl_ops,
 	.ops_init = sof_tgl_ops_init,
+	.ops_free = hda_ops_free,
 };
 
 static const struct sof_dev_desc adls_desc = {
@@ -141,6 +143,7 @@ static const struct sof_dev_desc adls_desc = {
 	.nocodec_tplg_filename = "sof-adl-nocodec.tplg",
 	.ops = &sof_tgl_ops,
 	.ops_init = sof_tgl_ops_init,
+	.ops_free = hda_ops_free,
 };
 
 static const struct sof_dev_desc adl_desc = {
@@ -172,6 +175,7 @@ static const struct sof_dev_desc adl_desc = {
 	.nocodec_tplg_filename = "sof-adl-nocodec.tplg",
 	.ops = &sof_tgl_ops,
 	.ops_init = sof_tgl_ops_init,
+	.ops_free = hda_ops_free,
 };
 
 static const struct sof_dev_desc adl_n_desc = {
@@ -203,6 +207,7 @@ static const struct sof_dev_desc adl_n_desc = {
 	.nocodec_tplg_filename = "sof-adl-nocodec.tplg",
 	.ops = &sof_tgl_ops,
 	.ops_init = sof_tgl_ops_init,
+	.ops_free = hda_ops_free,
 };
 
 static const struct sof_dev_desc rpls_desc = {
-- 
2.39.2

