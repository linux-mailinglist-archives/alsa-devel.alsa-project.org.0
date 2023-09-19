Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E587A5FE3
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Sep 2023 12:44:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C30D4E9C;
	Tue, 19 Sep 2023 12:43:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C30D4E9C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695120274;
	bh=5aPqRwS9HzU+UyICnDpRorXvsOQZcrWdQg7DWc1YMsw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XPuEYi7E1brxryxbIIGJ+Du+GJ/LS8jQV2tsgYC7XCtDGKo0ij+SNp61Jy/iC1SCh
	 equqNRYeb/1ejDWMtQcuK3hwYMTEX8wq61KckawkPgAdSVa/4xW0aqPvllqVWJvIal
	 CfMrqlgLL3O1+UdZmhJsZY7YWrgN1i92ndcotTo4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 44EBAF80589; Tue, 19 Sep 2023 12:42:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B64B8F80589;
	Tue, 19 Sep 2023 12:42:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B5E82F80587; Tue, 19 Sep 2023 12:42:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3C740F8055A
	for <alsa-devel@alsa-project.org>; Tue, 19 Sep 2023 12:42:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C740F8055A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=A9iFEriW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695120152; x=1726656152;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5aPqRwS9HzU+UyICnDpRorXvsOQZcrWdQg7DWc1YMsw=;
  b=A9iFEriWFwDtbJ5Ba00htNB+LYw/KSDaI6lHZ1W5uQ8vNy7EV3u+xzAU
   +mXFjGITPDBIxuHDlWeVghMl6uNDDsNcuGgbqQ8lv82p144+i4jdh0HLN
   ciA+/HLW5Cd5BCQczAC7q7piXKMGirwps/MkXQbkCnUE5wct23oHocQGf
   GtOk5jpsCfxUok0pmpsALFW/z5o48oLSjbGYo4svS8aJQiMrjAXGP7FQo
   vSiN60G7NVZowc9A6VzFTr4/KNCl7E9eTr0rYaEoXeWEWdtTH2VN2Wsp4
   Ujon1YnHtRfTEj9tuQdvZiWzPWObM/xn2Y2X7J2wTkJLK40dG0buW3Wbi
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="382658463"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000";
   d="scan'208";a="382658463"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 03:42:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="722823239"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000";
   d="scan'208";a="722823239"
Received: from mokashi-mobl1.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.50.26])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 03:42:26 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	pierre-louis.bossart@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	daniel.baluta@nxp.com,
	rander.wang@intel.com
Subject: [PATCH 3/9] ASoC: SOF: Kconfig: Rename SND_SOC_SOF_INTEL_IPC4 to
 SND_SOC_SOF_IPC4
Date: Tue, 19 Sep 2023 13:42:20 +0300
Message-ID: <20230919104226.32239-4-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230919104226.32239-1-peter.ujfalusi@linux.intel.com>
References: <20230919104226.32239-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: SV6OUZXJNCIV6LBJVGME23SRLRNZC7NW
X-Message-ID-Hash: SV6OUZXJNCIV6LBJVGME23SRLRNZC7NW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SV6OUZXJNCIV6LBJVGME23SRLRNZC7NW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Drop the Intel from the IPC type Kconfig option

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/Kconfig             |  2 +-
 sound/soc/sof/Makefile            |  4 ++--
 sound/soc/sof/intel/Kconfig       | 14 +++++++-------
 sound/soc/sof/ipc.c               |  2 +-
 sound/soc/sof/sof-client-probes.c |  2 +-
 sound/soc/sof/sof-client.c        |  2 +-
 6 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/sound/soc/sof/Kconfig b/sound/soc/sof/Kconfig
index 80361139a49a..a741ed96e789 100644
--- a/sound/soc/sof/Kconfig
+++ b/sound/soc/sof/Kconfig
@@ -283,7 +283,7 @@ config SND_SOC_SOF_PROBE_WORK_QUEUE
 config SND_SOC_SOF_IPC3
 	bool
 
-config SND_SOC_SOF_INTEL_IPC4
+config SND_SOC_SOF_IPC4
 	bool
 
 source "sound/soc/sof/amd/Kconfig"
diff --git a/sound/soc/sof/Makefile b/sound/soc/sof/Makefile
index 744d40bd8c8b..58f8d468d967 100644
--- a/sound/soc/sof/Makefile
+++ b/sound/soc/sof/Makefile
@@ -8,7 +8,7 @@ ifneq ($(CONFIG_SND_SOC_SOF_IPC3),)
 snd-sof-objs +=	ipc3.o ipc3-loader.o ipc3-topology.o ipc3-control.o ipc3-pcm.o\
 		ipc3-dtrace.o
 endif
-ifneq ($(CONFIG_SND_SOC_SOF_INTEL_IPC4),)
+ifneq ($(CONFIG_SND_SOC_SOF_IPC4),)
 snd-sof-objs += ipc4.o ipc4-loader.o ipc4-topology.o ipc4-control.o ipc4-pcm.o\
 		ipc4-mtrace.o
 endif
@@ -31,7 +31,7 @@ snd-sof-probes-objs := sof-client-probes.o
 ifneq ($(CONFIG_SND_SOC_SOF_IPC3),)
 snd-sof-probes-objs += sof-client-probes-ipc3.o
 endif
-ifneq ($(CONFIG_SND_SOC_SOF_INTEL_IPC4),)
+ifneq ($(CONFIG_SND_SOC_SOF_IPC4),)
 snd-sof-probes-objs += sof-client-probes-ipc4.o
 endif
 
diff --git a/sound/soc/sof/intel/Kconfig b/sound/soc/sof/intel/Kconfig
index 9d0107932117..9de86aaa8d07 100644
--- a/sound/soc/sof/intel/Kconfig
+++ b/sound/soc/sof/intel/Kconfig
@@ -98,7 +98,7 @@ config SND_SOC_SOF_MERRIFIELD
 config SND_SOC_SOF_INTEL_SKL
 	tristate
 	select SND_SOC_SOF_HDA_COMMON
-	select SND_SOC_SOF_INTEL_IPC4
+	select SND_SOC_SOF_IPC4
 
 config SND_SOC_SOF_SKYLAKE
 	tristate "SOF support for SkyLake"
@@ -124,7 +124,7 @@ config SND_SOC_SOF_INTEL_APL
 	tristate
 	select SND_SOC_SOF_HDA_COMMON
 	select SND_SOC_SOF_IPC3
-	select SND_SOC_SOF_INTEL_IPC4
+	select SND_SOC_SOF_IPC4
 
 config SND_SOC_SOF_APOLLOLAKE
 	tristate "SOF support for Apollolake"
@@ -151,7 +151,7 @@ config SND_SOC_SOF_INTEL_CNL
 	select SND_SOC_SOF_HDA_COMMON
 	select SND_SOC_SOF_INTEL_SOUNDWIRE_LINK_BASELINE
 	select SND_SOC_SOF_IPC3
-	select SND_SOC_SOF_INTEL_IPC4
+	select SND_SOC_SOF_IPC4
 
 config SND_SOC_SOF_CANNONLAKE
 	tristate "SOF support for Cannonlake"
@@ -187,7 +187,7 @@ config SND_SOC_SOF_INTEL_ICL
 	select SND_SOC_SOF_HDA_COMMON
 	select SND_SOC_SOF_INTEL_SOUNDWIRE_LINK_BASELINE
 	select SND_SOC_SOF_IPC3
-	select SND_SOC_SOF_INTEL_IPC4
+	select SND_SOC_SOF_IPC4
 
 config SND_SOC_SOF_ICELAKE
 	tristate "SOF support for Icelake"
@@ -214,7 +214,7 @@ config SND_SOC_SOF_INTEL_TGL
 	select SND_SOC_SOF_HDA_COMMON
 	select SND_SOC_SOF_INTEL_SOUNDWIRE_LINK_BASELINE
 	select SND_SOC_SOF_IPC3
-	select SND_SOC_SOF_INTEL_IPC4
+	select SND_SOC_SOF_IPC4
 
 config SND_SOC_SOF_TIGERLAKE
 	tristate "SOF support for Tigerlake"
@@ -250,7 +250,7 @@ config SND_SOC_SOF_INTEL_MTL
 	tristate
 	select SND_SOC_SOF_HDA_COMMON
 	select SND_SOC_SOF_INTEL_SOUNDWIRE_LINK_BASELINE
-	select SND_SOC_SOF_INTEL_IPC4
+	select SND_SOC_SOF_IPC4
 
 config SND_SOC_SOF_METEORLAKE
 	tristate "SOF support for Meteorlake"
@@ -266,7 +266,7 @@ config SND_SOC_SOF_INTEL_LNL
 	tristate
 	select SND_SOC_SOF_HDA_COMMON
 	select SND_SOC_SOF_INTEL_SOUNDWIRE_LINK_BASELINE
-	select SND_SOC_SOF_INTEL_IPC4
+	select SND_SOC_SOF_IPC4
 
 config SND_SOC_SOF_LUNARLAKE
 	tristate "SOF support for Lunarlake"
diff --git a/sound/soc/sof/ipc.c b/sound/soc/sof/ipc.c
index b53abc923026..8a7eb3cb019a 100644
--- a/sound/soc/sof/ipc.c
+++ b/sound/soc/sof/ipc.c
@@ -169,7 +169,7 @@ struct snd_sof_ipc *snd_sof_ipc_init(struct snd_sof_dev *sdev)
 		ops = &ipc3_ops;
 		break;
 #endif
-#if defined(CONFIG_SND_SOC_SOF_INTEL_IPC4)
+#if defined(CONFIG_SND_SOC_SOF_IPC4)
 	case SOF_INTEL_IPC4:
 		ops = &ipc4_ops;
 		break;
diff --git a/sound/soc/sof/sof-client-probes.c b/sound/soc/sof/sof-client-probes.c
index 740b637822db..390cdb8423ef 100644
--- a/sound/soc/sof/sof-client-probes.c
+++ b/sound/soc/sof/sof-client-probes.c
@@ -423,7 +423,7 @@ static int sof_probes_client_probe(struct auxiliary_device *auxdev,
 	priv->host_ops = ops;
 
 	switch (sof_client_get_ipc_type(cdev)) {
-#ifdef CONFIG_SND_SOC_SOF_INTEL_IPC4
+#ifdef CONFIG_SND_SOC_SOF_IPC4
 	case SOF_INTEL_IPC4:
 		priv->ipc_ops = &ipc4_probe_ops;
 		break;
diff --git a/sound/soc/sof/sof-client.c b/sound/soc/sof/sof-client.c
index 284de96e779c..e1a8edbefff7 100644
--- a/sound/soc/sof/sof-client.c
+++ b/sound/soc/sof/sof-client.c
@@ -340,7 +340,7 @@ int sof_client_ipc_set_get_data(struct sof_client_dev *cdev, void *ipc_msg,
 }
 EXPORT_SYMBOL_NS_GPL(sof_client_ipc_set_get_data, SND_SOC_SOF_CLIENT);
 
-#ifdef CONFIG_SND_SOC_SOF_INTEL_IPC4
+#ifdef CONFIG_SND_SOC_SOF_IPC4
 struct sof_ipc4_fw_module *sof_client_ipc4_find_module(struct sof_client_dev *c, const guid_t *uuid)
 {
 	struct snd_sof_dev *sdev = c->sdev;
-- 
2.42.0

