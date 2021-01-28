Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B6FF30744C
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Jan 2021 12:02:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2D00A1669;
	Thu, 28 Jan 2021 12:02:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2D00A1669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611831773;
	bh=I0E+3JzCcuBUeyFy+NZqSUOyz/XxVKiWzh0iC8C13ss=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=djh1GMOdeklzWGD8btc9NmfA9W1uLBY+HYmb7BccrN9D6u4IL6h9ZFF7hnCKkX9LO
	 OS12iO17+0qwSVBxfmuPkrE52b81y5bXcw7e6GfgaCGpZuG6qhBoN/1ymssU4kWR04
	 9kq8O/vTNqhTj0hUGPugMumqW7BlfSny4cdysIjk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 787AEF800BE;
	Thu, 28 Jan 2021 12:01:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C2FE2F8015B; Thu, 28 Jan 2021 12:01:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EFF8DF800E9
 for <alsa-devel@alsa-project.org>; Thu, 28 Jan 2021 12:01:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EFF8DF800E9
IronPort-SDR: K3bzSDsisHNfV0v7qpckEOPTtRva2d1iN39RRe+/EpuPSVVOxEh3LPlNYllDj2SizNwJ0hX0aA
 XKOPmrofJ7Sw==
X-IronPort-AV: E=McAfee;i="6000,8403,9877"; a="177651922"
X-IronPort-AV: E=Sophos;i="5.79,382,1602572400"; d="scan'208";a="177651922"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2021 03:01:07 -0800
IronPort-SDR: J+ZANl/r8vO2VNMj46CsUPU8Kg9dBodLN3t9fMuzrl1uDPeck9ubOnpKeS9+do3xbrwP9hdJCp
 2sE/zvB/XwDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,382,1602572400"; d="scan'208";a="351388269"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga007.fm.intel.com with ESMTP; 28 Jan 2021 03:01:05 -0800
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH] ASoC: Intel: remove duplicate MODULE_LICENSE/DESCRIPTION tags
Date: Thu, 28 Jan 2021 12:57:51 +0200
Message-Id: <20210128105751.1049837-1-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: cezary.rojewski@intel.com, kai.vehmanen@linux.intel.com,
 yang.jie@linux.intel.com, pierre-louis.bossart@linux.intel.com,
 lgirdwood@gmail.com, Rander Wang <rander.wang@linux.intel.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The snd-soc-acpi-intel-match has duplicate module tags for all
platforms separately. Remove all but one and save some storage
space and cleanup modinfo output.

Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/common/soc-acpi-intel-bxt-match.c     | 3 ---
 sound/soc/intel/common/soc-acpi-intel-byt-match.c     | 3 ---
 sound/soc/intel/common/soc-acpi-intel-cfl-match.c     | 3 ---
 sound/soc/intel/common/soc-acpi-intel-cht-match.c     | 3 ---
 sound/soc/intel/common/soc-acpi-intel-cml-match.c     | 3 ---
 sound/soc/intel/common/soc-acpi-intel-cnl-match.c     | 3 ---
 sound/soc/intel/common/soc-acpi-intel-ehl-match.c     | 3 ---
 sound/soc/intel/common/soc-acpi-intel-glk-match.c     | 3 ---
 sound/soc/intel/common/soc-acpi-intel-hsw-bdw-match.c | 3 ---
 sound/soc/intel/common/soc-acpi-intel-icl-match.c     | 3 ---
 sound/soc/intel/common/soc-acpi-intel-jsl-match.c     | 3 ---
 sound/soc/intel/common/soc-acpi-intel-kbl-match.c     | 3 ---
 sound/soc/intel/common/soc-acpi-intel-skl-match.c     | 3 ---
 sound/soc/intel/common/soc-acpi-intel-tgl-match.c     | 3 ---
 14 files changed, 42 deletions(-)

diff --git a/sound/soc/intel/common/soc-acpi-intel-bxt-match.c b/sound/soc/intel/common/soc-acpi-intel-bxt-match.c
index 32f77e29c2ff..398cc771c835 100644
--- a/sound/soc/intel/common/soc-acpi-intel-bxt-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-bxt-match.c
@@ -85,6 +85,3 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_bxt_machines[] = {
 	{},
 };
 EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_bxt_machines);
-
-MODULE_LICENSE("GPL v2");
-MODULE_DESCRIPTION("Intel Common ACPI Match module");
diff --git a/sound/soc/intel/common/soc-acpi-intel-byt-match.c b/sound/soc/intel/common/soc-acpi-intel-byt-match.c
index c348607b49a5..31e60df131c3 100644
--- a/sound/soc/intel/common/soc-acpi-intel-byt-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-byt-match.c
@@ -233,6 +233,3 @@ struct snd_soc_acpi_mach  snd_soc_acpi_intel_baytrail_machines[] = {
 	{},
 };
 EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_baytrail_machines);
-
-MODULE_LICENSE("GPL v2");
-MODULE_DESCRIPTION("Intel Common ACPI Match module");
diff --git a/sound/soc/intel/common/soc-acpi-intel-cfl-match.c b/sound/soc/intel/common/soc-acpi-intel-cfl-match.c
index 27b4b73d94d4..1733dfb23e79 100644
--- a/sound/soc/intel/common/soc-acpi-intel-cfl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-cfl-match.c
@@ -18,6 +18,3 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_cfl_sdw_machines[] = {
 	{}
 };
 EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_cfl_sdw_machines);
-
-MODULE_LICENSE("GPL v2");
-MODULE_DESCRIPTION("Intel Common ACPI Match module");
diff --git a/sound/soc/intel/common/soc-acpi-intel-cht-match.c b/sound/soc/intel/common/soc-acpi-intel-cht-match.c
index 2752dc955733..227424236fd5 100644
--- a/sound/soc/intel/common/soc-acpi-intel-cht-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-cht-match.c
@@ -196,6 +196,3 @@ struct snd_soc_acpi_mach  snd_soc_acpi_intel_cherrytrail_machines[] = {
 	{},
 };
 EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_cherrytrail_machines);
-
-MODULE_LICENSE("GPL v2");
-MODULE_DESCRIPTION("Intel Common ACPI Match module");
diff --git a/sound/soc/intel/common/soc-acpi-intel-cml-match.c b/sound/soc/intel/common/soc-acpi-intel-cml-match.c
index adddc91918df..2161b3b85b4a 100644
--- a/sound/soc/intel/common/soc-acpi-intel-cml-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-cml-match.c
@@ -309,6 +309,3 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_cml_sdw_machines[] = {
 	{}
 };
 EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_cml_sdw_machines);
-
-MODULE_LICENSE("GPL v2");
-MODULE_DESCRIPTION("Intel Common ACPI Match module");
diff --git a/sound/soc/intel/common/soc-acpi-intel-cnl-match.c b/sound/soc/intel/common/soc-acpi-intel-cnl-match.c
index b80f032a8b76..ec77a57a07ba 100644
--- a/sound/soc/intel/common/soc-acpi-intel-cnl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-cnl-match.c
@@ -63,6 +63,3 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_cnl_sdw_machines[] = {
 	{}
 };
 EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_cnl_sdw_machines);
-
-MODULE_LICENSE("GPL v2");
-MODULE_DESCRIPTION("Intel Common ACPI Match module");
diff --git a/sound/soc/intel/common/soc-acpi-intel-ehl-match.c b/sound/soc/intel/common/soc-acpi-intel-ehl-match.c
index 5c7a1214403d..6222708a98e7 100644
--- a/sound/soc/intel/common/soc-acpi-intel-ehl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-ehl-match.c
@@ -20,6 +20,3 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_ehl_machines[] = {
 	{},
 };
 EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_ehl_machines);
-
-MODULE_LICENSE("GPL v2");
-MODULE_DESCRIPTION("Intel Common ACPI Match module");
diff --git a/sound/soc/intel/common/soc-acpi-intel-glk-match.c b/sound/soc/intel/common/soc-acpi-intel-glk-match.c
index 26cb3b16cdd3..6ceaab19ccb6 100644
--- a/sound/soc/intel/common/soc-acpi-intel-glk-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-glk-match.c
@@ -43,6 +43,3 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_glk_machines[] = {
 	{},
 };
 EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_glk_machines);
-
-MODULE_LICENSE("GPL v2");
-MODULE_DESCRIPTION("Intel Common ACPI Match module");
diff --git a/sound/soc/intel/common/soc-acpi-intel-hsw-bdw-match.c b/sound/soc/intel/common/soc-acpi-intel-hsw-bdw-match.c
index 35958553652e..fe343a95b5ff 100644
--- a/sound/soc/intel/common/soc-acpi-intel-hsw-bdw-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-hsw-bdw-match.c
@@ -53,6 +53,3 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_broadwell_machines[] = {
 	{}
 };
 EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_broadwell_machines);
-
-MODULE_LICENSE("GPL v2");
-MODULE_DESCRIPTION("Intel Common ACPI Match module");
diff --git a/sound/soc/intel/common/soc-acpi-intel-icl-match.c b/sound/soc/intel/common/soc-acpi-intel-icl-match.c
index 9a529a785288..d38ff7d187c4 100644
--- a/sound/soc/intel/common/soc-acpi-intel-icl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-icl-match.c
@@ -185,6 +185,3 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_icl_sdw_machines[] = {
 	{},
 };
 EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_icl_sdw_machines);
-
-MODULE_LICENSE("GPL v2");
-MODULE_DESCRIPTION("Intel Common ACPI Match module");
diff --git a/sound/soc/intel/common/soc-acpi-intel-jsl-match.c b/sound/soc/intel/common/soc-acpi-intel-jsl-match.c
index 34f5fcad5701..52238db0bcb5 100644
--- a/sound/soc/intel/common/soc-acpi-intel-jsl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-jsl-match.c
@@ -63,6 +63,3 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_jsl_machines[] = {
 	{},
 };
 EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_jsl_machines);
-
-MODULE_LICENSE("GPL v2");
-MODULE_DESCRIPTION("Intel Common ACPI Match module");
diff --git a/sound/soc/intel/common/soc-acpi-intel-kbl-match.c b/sound/soc/intel/common/soc-acpi-intel-kbl-match.c
index a4fbe6707ca7..47dadc9d5d2a 100644
--- a/sound/soc/intel/common/soc-acpi-intel-kbl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-kbl-match.c
@@ -128,6 +128,3 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_kbl_machines[] = {
 	{},
 };
 EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_kbl_machines);
-
-MODULE_LICENSE("GPL v2");
-MODULE_DESCRIPTION("Intel Common ACPI Match module");
diff --git a/sound/soc/intel/common/soc-acpi-intel-skl-match.c b/sound/soc/intel/common/soc-acpi-intel-skl-match.c
index 26f9ce146523..961df8d6b5e4 100644
--- a/sound/soc/intel/common/soc-acpi-intel-skl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-skl-match.c
@@ -42,6 +42,3 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_skl_machines[] = {
 	{},
 };
 EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_skl_machines);
-
-MODULE_LICENSE("GPL v2");
-MODULE_DESCRIPTION("Intel Common ACPI Match module");
diff --git a/sound/soc/intel/common/soc-acpi-intel-tgl-match.c b/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
index 4933184df5f5..ee25451dfdd0 100644
--- a/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
@@ -411,6 +411,3 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_tgl_sdw_machines[] = {
 	{},
 };
 EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_tgl_sdw_machines);
-
-MODULE_LICENSE("GPL v2");
-MODULE_DESCRIPTION("Intel Common ACPI Match module");

base-commit: e32df142359fb6f4d27977b7652549f0844aa62f
-- 
2.29.2

