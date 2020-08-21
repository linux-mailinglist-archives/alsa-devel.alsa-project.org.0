Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FDC224E189
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Aug 2020 21:58:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F3F951692;
	Fri, 21 Aug 2020 21:58:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F3F951692
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598039931;
	bh=yuoDDJljcVgMU1sJ2KSdUP+sLXWAxQoctdRWVUNO7ys=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jaEUqDWdEDSyJinYFv3ZtsWKTqdAJnrR9Yjbmi9BHVdtB9aSj3k/QhqgVVXv0tVMb
	 +CCpaZht3/9+O1sTkJhq4JTBlcEnwIG8HivehjrJZLByguoTgIN0b7yB8eDy1z7OSx
	 2bTsV9/nPUPTT640uMRP3RDaXpu3vpm8SRdnRSXs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D443F802DF;
	Fri, 21 Aug 2020 21:56:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 32716F802C4; Fri, 21 Aug 2020 21:56:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 80301F800D3
 for <alsa-devel@alsa-project.org>; Fri, 21 Aug 2020 21:56:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 80301F800D3
IronPort-SDR: eVap+yVEngRz2+/GoXAMUD/Dlht2n6+ysVpyodR+8zwWdqrb+Wd+Ttz98j1sI8UaU5SBWZn0rV
 8CcRF+2L442g==
X-IronPort-AV: E=McAfee;i="6000,8403,9720"; a="217158536"
X-IronPort-AV: E=Sophos;i="5.76,338,1592895600"; d="scan'208";a="217158536"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2020 12:56:14 -0700
IronPort-SDR: 8mPVYV+Tduth0FN/zYFsoq9xcnn6jGK+jHG1nixNF3yYmEK80JeQYjGJGMDWXz1swTmHB/ymYC
 Fa8XRa+8VQlg==
X-IronPort-AV: E=Sophos;i="5.76,338,1592895600"; d="scan'208";a="279002389"
Received: from pahnn-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.254.176.176])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2020 12:56:14 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 01/14] ASoC: Intel: modify SoundWire version id in acpi match
 table
Date: Fri, 21 Aug 2020 14:55:48 -0500
Message-Id: <20200821195603.215535-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200821195603.215535-1-pierre-louis.bossart@linux.intel.com>
References: <20200821195603.215535-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 vinod.koul@intel.com, broonie@kernel.org,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
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

From: Bard Liao <yung-chuan.liao@linux.intel.com>

The SoundWire version id of the existing RT1308, RT711, and RT715
codecs should be 2 (index for SoundWire 1.1), it was mistakenly set as
1 which pointed to the wrong version (SoundWire 1.0).

This off-by-one error had no functional impact so far since the
version number was not used, however in future patches this version
will be required.

Reviewed-by: Rander Wang <rander.wang@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/common/soc-acpi-intel-cml-match.c | 10 +++++-----
 sound/soc/intel/common/soc-acpi-intel-icl-match.c | 10 +++++-----
 sound/soc/intel/common/soc-acpi-intel-tgl-match.c |  2 +-
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/sound/soc/intel/common/soc-acpi-intel-cml-match.c b/sound/soc/intel/common/soc-acpi-intel-cml-match.c
index dee1f0fa998b..51535cd60a0a 100644
--- a/sound/soc/intel/common/soc-acpi-intel-cml-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-cml-match.c
@@ -112,7 +112,7 @@ static const struct snd_soc_acpi_link_adr cml_rvp[] = {
 
 static const struct snd_soc_acpi_adr_device rt711_0_adr[] = {
 	{
-		.adr = 0x000010025D071100,
+		.adr = 0x000020025D071100,
 		.num_endpoints = 1,
 		.endpoints = &single_endpoint,
 	}
@@ -120,7 +120,7 @@ static const struct snd_soc_acpi_adr_device rt711_0_adr[] = {
 
 static const struct snd_soc_acpi_adr_device rt1308_1_adr[] = {
 	{
-		.adr = 0x000110025D130800,
+		.adr = 0x000120025D130800,
 		.num_endpoints = 1,
 		.endpoints = &single_endpoint,
 	}
@@ -128,7 +128,7 @@ static const struct snd_soc_acpi_adr_device rt1308_1_adr[] = {
 
 static const struct snd_soc_acpi_adr_device rt1308_1_group1_adr[] = {
 	{
-		.adr = 0x000110025D130800,
+		.adr = 0x000120025D130800,
 		.num_endpoints = 1,
 		.endpoints = &spk_l_endpoint,
 	}
@@ -136,7 +136,7 @@ static const struct snd_soc_acpi_adr_device rt1308_1_group1_adr[] = {
 
 static const struct snd_soc_acpi_adr_device rt1308_2_group1_adr[] = {
 	{
-		.adr = 0x000210025D130800,
+		.adr = 0x000220025D130800,
 		.num_endpoints = 1,
 		.endpoints = &spk_r_endpoint,
 	}
@@ -144,7 +144,7 @@ static const struct snd_soc_acpi_adr_device rt1308_2_group1_adr[] = {
 
 static const struct snd_soc_acpi_adr_device rt715_3_adr[] = {
 	{
-		.adr = 0x000310025D071500,
+		.adr = 0x000320025D071500,
 		.num_endpoints = 1,
 		.endpoints = &single_endpoint,
 	}
diff --git a/sound/soc/intel/common/soc-acpi-intel-icl-match.c b/sound/soc/intel/common/soc-acpi-intel-icl-match.c
index 6927bbbc66fc..ebe13197410f 100644
--- a/sound/soc/intel/common/soc-acpi-intel-icl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-icl-match.c
@@ -73,7 +73,7 @@ static const struct snd_soc_acpi_link_adr icl_rvp[] = {
 
 static const struct snd_soc_acpi_adr_device rt711_0_adr[] = {
 	{
-		.adr = 0x000010025D071100,
+		.adr = 0x000020025D071100,
 		.num_endpoints = 1,
 		.endpoints = &single_endpoint,
 	}
@@ -81,7 +81,7 @@ static const struct snd_soc_acpi_adr_device rt711_0_adr[] = {
 
 static const struct snd_soc_acpi_adr_device rt1308_1_adr[] = {
 	{
-		.adr = 0x000110025D130800,
+		.adr = 0x000120025D130800,
 		.num_endpoints = 1,
 		.endpoints = &single_endpoint,
 	}
@@ -89,7 +89,7 @@ static const struct snd_soc_acpi_adr_device rt1308_1_adr[] = {
 
 static const struct snd_soc_acpi_adr_device rt1308_1_group1_adr[] = {
 	{
-		.adr = 0x000110025D130800,
+		.adr = 0x000120025D130800,
 		.num_endpoints = 1,
 		.endpoints = &spk_l_endpoint,
 	}
@@ -97,7 +97,7 @@ static const struct snd_soc_acpi_adr_device rt1308_1_group1_adr[] = {
 
 static const struct snd_soc_acpi_adr_device rt1308_2_group1_adr[] = {
 	{
-		.adr = 0x000210025D130800,
+		.adr = 0x000220025D130800,
 		.num_endpoints = 1,
 		.endpoints = &spk_r_endpoint,
 	}
@@ -105,7 +105,7 @@ static const struct snd_soc_acpi_adr_device rt1308_2_group1_adr[] = {
 
 static const struct snd_soc_acpi_adr_device rt715_3_adr[] = {
 	{
-		.adr = 0x000310025D071500,
+		.adr = 0x000320025D071500,
 		.num_endpoints = 1,
 		.endpoints = &single_endpoint,
 	}
diff --git a/sound/soc/intel/common/soc-acpi-intel-tgl-match.c b/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
index 2ffa608d987d..472f58ddda1f 100644
--- a/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
@@ -37,7 +37,7 @@ static const struct snd_soc_acpi_endpoint spk_r_endpoint = {
 
 static const struct snd_soc_acpi_adr_device rt711_0_adr[] = {
 	{
-		.adr = 0x000010025D071100,
+		.adr = 0x000020025D071100,
 		.num_endpoints = 1,
 		.endpoints = &single_endpoint,
 	}
-- 
2.25.1

