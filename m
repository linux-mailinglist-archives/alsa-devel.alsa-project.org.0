Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A09A39E9C9
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Jun 2021 00:51:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C9ED91675;
	Tue,  8 Jun 2021 00:50:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C9ED91675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623106292;
	bh=h1qRFOKfidt3gGcfU0kLzkn4fHSbToyyPnPCJR1dxJA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=k4q7K3GzQ6AVrmiKHODC1pkY5I4eMr2zQgQJWeQ5WxJLvh594eBuD8oKQh34GgDQw
	 tx/bqWvRYzfiWnjCiUVnH2r9f+ZoKL7RteXpZqmXUHZGl2bxyQjWWrGlIrPHWqMKys
	 0unx6VWUk2As7wFHXpxA8YG10P0tPv7t8sLYUErs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B1B2CF804FE;
	Tue,  8 Jun 2021 00:47:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 40A9FF804E0; Tue,  8 Jun 2021 00:47:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A2E49F802DF
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 00:47:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A2E49F802DF
IronPort-SDR: 1JvPhw3EysyofHaE21RceTvHsKAT/AXz5vWCr5C8hlAq2ZELkBxj6qLGBjzEkN+CFR6xUUKOch
 OW2mKTWMf7Cw==
X-IronPort-AV: E=McAfee;i="6200,9189,10008"; a="185102188"
X-IronPort-AV: E=Sophos;i="5.83,256,1616482800"; d="scan'208";a="185102188"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 15:46:53 -0700
IronPort-SDR: 0A+MdkUjzsh7Vom/JhabBTB0vpquWP94dIEvOGTdUVfBHflI4z8+bujWPkTVmR1+w3luOI5Z8m
 pyjJQZzdLZRQ==
X-IronPort-AV: E=Sophos;i="5.83,256,1616482800"; d="scan'208";a="637437129"
Received: from marocham-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.108.70])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 15:46:52 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 08/10] ASoC: Intel: soc-acpi: add ull suffix for SoundWire
 _ADR values
Date: Mon,  7 Jun 2021 17:46:36 -0500
Message-Id: <20210607224638.585486-9-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210607224638.585486-1-pierre-louis.bossart@linux.intel.com>
References: <20210607224638.585486-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, tiwai@suse.de,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>, Paul Olaru <paul.olaru@oss.nxp.com>
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

Sparse throws the following type of warnings:

sound/soc/intel/common/soc-acpi-intel-adl-match.c:34:24: error:
constant 0x000020025D071100 is so big it is long

Let's add the 'ull' suffix to make this go away and find real issues.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Paul Olaru <paul.olaru@oss.nxp.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
---
 .../intel/common/soc-acpi-intel-adl-match.c   | 24 ++++++-------
 .../intel/common/soc-acpi-intel-cml-match.c   | 20 +++++------
 .../intel/common/soc-acpi-intel-cnl-match.c   |  2 +-
 .../intel/common/soc-acpi-intel-icl-match.c   | 12 +++----
 .../intel/common/soc-acpi-intel-tgl-match.c   | 34 +++++++++----------
 5 files changed, 46 insertions(+), 46 deletions(-)

diff --git a/sound/soc/intel/common/soc-acpi-intel-adl-match.c b/sound/soc/intel/common/soc-acpi-intel-adl-match.c
index 8905f1a1ec91..a0f6a69c7038 100644
--- a/sound/soc/intel/common/soc-acpi-intel-adl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-adl-match.c
@@ -31,7 +31,7 @@ static const struct snd_soc_acpi_endpoint spk_r_endpoint = {
 
 static const struct snd_soc_acpi_adr_device rt711_0_adr[] = {
 	{
-		.adr = 0x000020025D071100,
+		.adr = 0x000020025D071100ull,
 		.num_endpoints = 1,
 		.endpoints = &single_endpoint,
 		.name_prefix = "rt711"
@@ -40,7 +40,7 @@ static const struct snd_soc_acpi_adr_device rt711_0_adr[] = {
 
 static const struct snd_soc_acpi_adr_device rt1308_1_group1_adr[] = {
 	{
-		.adr = 0x000120025D130800,
+		.adr = 0x000120025D130800ull,
 		.num_endpoints = 1,
 		.endpoints = &spk_l_endpoint,
 		.name_prefix = "rt1308-1"
@@ -49,7 +49,7 @@ static const struct snd_soc_acpi_adr_device rt1308_1_group1_adr[] = {
 
 static const struct snd_soc_acpi_adr_device rt1308_2_group1_adr[] = {
 	{
-		.adr = 0x000220025D130800,
+		.adr = 0x000220025D130800ull,
 		.num_endpoints = 1,
 		.endpoints = &spk_r_endpoint,
 		.name_prefix = "rt1308-2"
@@ -58,7 +58,7 @@ static const struct snd_soc_acpi_adr_device rt1308_2_group1_adr[] = {
 
 static const struct snd_soc_acpi_adr_device rt715_3_adr[] = {
 	{
-		.adr = 0x000320025D071500,
+		.adr = 0x000320025D071500ull,
 		.num_endpoints = 1,
 		.endpoints = &single_endpoint,
 		.name_prefix = "rt715"
@@ -67,7 +67,7 @@ static const struct snd_soc_acpi_adr_device rt715_3_adr[] = {
 
 static const struct snd_soc_acpi_adr_device rt711_sdca_0_adr[] = {
 	{
-		.adr = 0x000030025D071101,
+		.adr = 0x000030025D071101ull,
 		.num_endpoints = 1,
 		.endpoints = &single_endpoint,
 		.name_prefix = "rt711"
@@ -76,7 +76,7 @@ static const struct snd_soc_acpi_adr_device rt711_sdca_0_adr[] = {
 
 static const struct snd_soc_acpi_adr_device rt1316_1_group1_adr[] = {
 	{
-		.adr = 0x000131025D131601, /* unique ID is set for some reason */
+		.adr = 0x000131025D131601ull, /* unique ID is set for some reason */
 		.num_endpoints = 1,
 		.endpoints = &spk_l_endpoint,
 		.name_prefix = "rt1316-1"
@@ -85,7 +85,7 @@ static const struct snd_soc_acpi_adr_device rt1316_1_group1_adr[] = {
 
 static const struct snd_soc_acpi_adr_device rt1316_2_group1_adr[] = {
 	{
-		.adr = 0x000230025D131601,
+		.adr = 0x000230025D131601ull,
 		.num_endpoints = 1,
 		.endpoints = &spk_r_endpoint,
 		.name_prefix = "rt1316-2"
@@ -94,7 +94,7 @@ static const struct snd_soc_acpi_adr_device rt1316_2_group1_adr[] = {
 
 static const struct snd_soc_acpi_adr_device rt1316_3_group1_adr[] = {
 	{
-		.adr = 0x000330025D131601,
+		.adr = 0x000330025D131601ull,
 		.num_endpoints = 1,
 		.endpoints = &spk_r_endpoint,
 		.name_prefix = "rt1316-2"
@@ -103,7 +103,7 @@ static const struct snd_soc_acpi_adr_device rt1316_3_group1_adr[] = {
 
 static const struct snd_soc_acpi_adr_device rt1316_2_single_adr[] = {
 	{
-		.adr = 0x000230025D131601,
+		.adr = 0x000230025D131601ull,
 		.num_endpoints = 1,
 		.endpoints = &single_endpoint,
 		.name_prefix = "rt1316-1"
@@ -112,7 +112,7 @@ static const struct snd_soc_acpi_adr_device rt1316_2_single_adr[] = {
 
 static const struct snd_soc_acpi_adr_device rt714_0_adr[] = {
 	{
-		.adr = 0x000030025D071401,
+		.adr = 0x000030025D071401ull,
 		.num_endpoints = 1,
 		.endpoints = &single_endpoint,
 		.name_prefix = "rt714"
@@ -121,7 +121,7 @@ static const struct snd_soc_acpi_adr_device rt714_0_adr[] = {
 
 static const struct snd_soc_acpi_adr_device rt714_2_adr[] = {
 	{
-		.adr = 0x000230025D071401,
+		.adr = 0x000230025D071401ull,
 		.num_endpoints = 1,
 		.endpoints = &single_endpoint,
 		.name_prefix = "rt714"
@@ -130,7 +130,7 @@ static const struct snd_soc_acpi_adr_device rt714_2_adr[] = {
 
 static const struct snd_soc_acpi_adr_device rt714_3_adr[] = {
 	{
-		.adr = 0x000330025D071401,
+		.adr = 0x000330025D071401ull,
 		.num_endpoints = 1,
 		.endpoints = &single_endpoint,
 		.name_prefix = "rt714"
diff --git a/sound/soc/intel/common/soc-acpi-intel-cml-match.c b/sound/soc/intel/common/soc-acpi-intel-cml-match.c
index 459ac89f401b..42ef51c3fb4f 100644
--- a/sound/soc/intel/common/soc-acpi-intel-cml-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-cml-match.c
@@ -108,7 +108,7 @@ static const struct snd_soc_acpi_endpoint spk_r_endpoint = {
 
 static const struct snd_soc_acpi_adr_device rt700_1_adr[] = {
 	{
-		.adr = 0x000110025D070000,
+		.adr = 0x000110025D070000ull,
 		.num_endpoints = 1,
 		.endpoints = &single_endpoint,
 		.name_prefix = "rt700"
@@ -126,7 +126,7 @@ static const struct snd_soc_acpi_link_adr cml_rvp[] = {
 
 static const struct snd_soc_acpi_adr_device rt711_0_adr[] = {
 	{
-		.adr = 0x000020025D071100,
+		.adr = 0x000020025D071100ull,
 		.num_endpoints = 1,
 		.endpoints = &single_endpoint,
 		.name_prefix = "rt711"
@@ -135,7 +135,7 @@ static const struct snd_soc_acpi_adr_device rt711_0_adr[] = {
 
 static const struct snd_soc_acpi_adr_device rt1308_1_single_adr[] = {
 	{
-		.adr = 0x000120025D130800,
+		.adr = 0x000120025D130800ull,
 		.num_endpoints = 1,
 		.endpoints = &single_endpoint,
 		.name_prefix = "rt1308-1"
@@ -144,7 +144,7 @@ static const struct snd_soc_acpi_adr_device rt1308_1_single_adr[] = {
 
 static const struct snd_soc_acpi_adr_device rt1308_1_group1_adr[] = {
 	{
-		.adr = 0x000120025D130800,
+		.adr = 0x000120025D130800ull,
 		.num_endpoints = 1,
 		.endpoints = &spk_l_endpoint,
 		.name_prefix = "rt1308-1"
@@ -153,7 +153,7 @@ static const struct snd_soc_acpi_adr_device rt1308_1_group1_adr[] = {
 
 static const struct snd_soc_acpi_adr_device rt1308_2_group1_adr[] = {
 	{
-		.adr = 0x000220025D130800,
+		.adr = 0x000220025D130800ull,
 		.num_endpoints = 1,
 		.endpoints = &spk_r_endpoint,
 		.name_prefix = "rt1308-2"
@@ -162,7 +162,7 @@ static const struct snd_soc_acpi_adr_device rt1308_2_group1_adr[] = {
 
 static const struct snd_soc_acpi_adr_device rt715_3_adr[] = {
 	{
-		.adr = 0x000320025D071500,
+		.adr = 0x000320025D071500ull,
 		.num_endpoints = 1,
 		.endpoints = &single_endpoint,
 		.name_prefix = "rt715"
@@ -171,7 +171,7 @@ static const struct snd_soc_acpi_adr_device rt715_3_adr[] = {
 
 static const struct snd_soc_acpi_adr_device rt711_sdca_0_adr[] = {
 	{
-		.adr = 0x000030025D071101,
+		.adr = 0x000030025D071101ull,
 		.num_endpoints = 1,
 		.endpoints = &single_endpoint,
 		.name_prefix = "rt711"
@@ -180,7 +180,7 @@ static const struct snd_soc_acpi_adr_device rt711_sdca_0_adr[] = {
 
 static const struct snd_soc_acpi_adr_device rt1316_1_group1_adr[] = {
 	{
-		.adr = 0x000131025D131601, /* unique ID is set for some reason */
+		.adr = 0x000131025D131601ull, /* unique ID is set for some reason */
 		.num_endpoints = 1,
 		.endpoints = &spk_l_endpoint,
 		.name_prefix = "rt1316-1"
@@ -189,7 +189,7 @@ static const struct snd_soc_acpi_adr_device rt1316_1_group1_adr[] = {
 
 static const struct snd_soc_acpi_adr_device rt1316_2_group1_adr[] = {
 	{
-		.adr = 0x000230025D131601,
+		.adr = 0x000230025D131601ull,
 		.num_endpoints = 1,
 		.endpoints = &spk_r_endpoint,
 		.name_prefix = "rt1316-2"
@@ -198,7 +198,7 @@ static const struct snd_soc_acpi_adr_device rt1316_2_group1_adr[] = {
 
 static const struct snd_soc_acpi_adr_device rt714_3_adr[] = {
 	{
-		.adr = 0x000330025D071401,
+		.adr = 0x000330025D071401ull,
 		.num_endpoints = 1,
 		.endpoints = &single_endpoint,
 		.name_prefix = "rt714"
diff --git a/sound/soc/intel/common/soc-acpi-intel-cnl-match.c b/sound/soc/intel/common/soc-acpi-intel-cnl-match.c
index ec77a57a07ba..39dad32564e6 100644
--- a/sound/soc/intel/common/soc-acpi-intel-cnl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-cnl-match.c
@@ -36,7 +36,7 @@ static const struct snd_soc_acpi_endpoint single_endpoint = {
 
 static const struct snd_soc_acpi_adr_device rt5682_2_adr[] = {
 	{
-		.adr = 0x000220025D568200,
+		.adr = 0x000220025D568200ull,
 		.num_endpoints = 1,
 		.endpoints = &single_endpoint,
 		.name_prefix = "rt5682"
diff --git a/sound/soc/intel/common/soc-acpi-intel-icl-match.c b/sound/soc/intel/common/soc-acpi-intel-icl-match.c
index d38ff7d187c4..768ed538c4ea 100644
--- a/sound/soc/intel/common/soc-acpi-intel-icl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-icl-match.c
@@ -56,7 +56,7 @@ static const struct snd_soc_acpi_endpoint spk_r_endpoint = {
 
 static const struct snd_soc_acpi_adr_device rt700_0_adr[] = {
 	{
-		.adr = 0x000010025D070000,
+		.adr = 0x000010025D070000ull,
 		.num_endpoints = 1,
 		.endpoints = &single_endpoint,
 		.name_prefix = "rt700"
@@ -74,7 +74,7 @@ static const struct snd_soc_acpi_link_adr icl_rvp[] = {
 
 static const struct snd_soc_acpi_adr_device rt711_0_adr[] = {
 	{
-		.adr = 0x000020025D071100,
+		.adr = 0x000020025D071100ull,
 		.num_endpoints = 1,
 		.endpoints = &single_endpoint,
 		.name_prefix = "rt711"
@@ -83,7 +83,7 @@ static const struct snd_soc_acpi_adr_device rt711_0_adr[] = {
 
 static const struct snd_soc_acpi_adr_device rt1308_1_adr[] = {
 	{
-		.adr = 0x000120025D130800,
+		.adr = 0x000120025D130800ull,
 		.num_endpoints = 1,
 		.endpoints = &single_endpoint,
 		.name_prefix = "rt1308-1"
@@ -92,7 +92,7 @@ static const struct snd_soc_acpi_adr_device rt1308_1_adr[] = {
 
 static const struct snd_soc_acpi_adr_device rt1308_1_group1_adr[] = {
 	{
-		.adr = 0x000120025D130800,
+		.adr = 0x000120025D130800ull,
 		.num_endpoints = 1,
 		.endpoints = &spk_l_endpoint,
 		.name_prefix = "rt1308-1"
@@ -101,7 +101,7 @@ static const struct snd_soc_acpi_adr_device rt1308_1_group1_adr[] = {
 
 static const struct snd_soc_acpi_adr_device rt1308_2_group1_adr[] = {
 	{
-		.adr = 0x000220025D130800,
+		.adr = 0x000220025D130800ull,
 		.num_endpoints = 1,
 		.endpoints = &spk_r_endpoint,
 		.name_prefix = "rt1308-2"
@@ -110,7 +110,7 @@ static const struct snd_soc_acpi_adr_device rt1308_2_group1_adr[] = {
 
 static const struct snd_soc_acpi_adr_device rt715_3_adr[] = {
 	{
-		.adr = 0x000320025D071500,
+		.adr = 0x000320025D071500ull,
 		.num_endpoints = 1,
 		.endpoints = &single_endpoint,
 		.name_prefix = "rt715"
diff --git a/sound/soc/intel/common/soc-acpi-intel-tgl-match.c b/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
index 91cffc3d2f18..66595e3ab13f 100644
--- a/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
@@ -37,7 +37,7 @@ static const struct snd_soc_acpi_endpoint spk_r_endpoint = {
 
 static const struct snd_soc_acpi_adr_device rt711_0_adr[] = {
 	{
-		.adr = 0x000020025D071100,
+		.adr = 0x000020025D071100ull,
 		.num_endpoints = 1,
 		.endpoints = &single_endpoint,
 		.name_prefix = "rt711"
@@ -46,7 +46,7 @@ static const struct snd_soc_acpi_adr_device rt711_0_adr[] = {
 
 static const struct snd_soc_acpi_adr_device rt711_1_adr[] = {
 	{
-		.adr = 0x000120025D071100,
+		.adr = 0x000120025D071100ull,
 		.num_endpoints = 1,
 		.endpoints = &single_endpoint,
 		.name_prefix = "rt711"
@@ -55,13 +55,13 @@ static const struct snd_soc_acpi_adr_device rt711_1_adr[] = {
 
 static const struct snd_soc_acpi_adr_device rt1308_1_dual_adr[] = {
 	{
-		.adr = 0x000120025D130800,
+		.adr = 0x000120025D130800ull,
 		.num_endpoints = 1,
 		.endpoints = &spk_l_endpoint,
 		.name_prefix = "rt1308-1"
 	},
 	{
-		.adr = 0x000122025D130800,
+		.adr = 0x000122025D130800ull,
 		.num_endpoints = 1,
 		.endpoints = &spk_r_endpoint,
 		.name_prefix = "rt1308-2"
@@ -70,7 +70,7 @@ static const struct snd_soc_acpi_adr_device rt1308_1_dual_adr[] = {
 
 static const struct snd_soc_acpi_adr_device rt1308_1_single_adr[] = {
 	{
-		.adr = 0x000120025D130800,
+		.adr = 0x000120025D130800ull,
 		.num_endpoints = 1,
 		.endpoints = &single_endpoint,
 		.name_prefix = "rt1308-1"
@@ -79,7 +79,7 @@ static const struct snd_soc_acpi_adr_device rt1308_1_single_adr[] = {
 
 static const struct snd_soc_acpi_adr_device rt1308_2_single_adr[] = {
 	{
-		.adr = 0x000220025D130800,
+		.adr = 0x000220025D130800ull,
 		.num_endpoints = 1,
 		.endpoints = &single_endpoint,
 		.name_prefix = "rt1308-1"
@@ -88,7 +88,7 @@ static const struct snd_soc_acpi_adr_device rt1308_2_single_adr[] = {
 
 static const struct snd_soc_acpi_adr_device rt1308_1_group1_adr[] = {
 	{
-		.adr = 0x000120025D130800,
+		.adr = 0x000120025D130800ull,
 		.num_endpoints = 1,
 		.endpoints = &spk_l_endpoint,
 		.name_prefix = "rt1308-1"
@@ -97,7 +97,7 @@ static const struct snd_soc_acpi_adr_device rt1308_1_group1_adr[] = {
 
 static const struct snd_soc_acpi_adr_device rt1308_2_group1_adr[] = {
 	{
-		.adr = 0x000220025D130800,
+		.adr = 0x000220025D130800ull,
 		.num_endpoints = 1,
 		.endpoints = &spk_r_endpoint,
 		.name_prefix = "rt1308-2"
@@ -106,7 +106,7 @@ static const struct snd_soc_acpi_adr_device rt1308_2_group1_adr[] = {
 
 static const struct snd_soc_acpi_adr_device rt715_0_adr[] = {
 	{
-		.adr = 0x000021025D071500,
+		.adr = 0x000021025D071500ull,
 		.num_endpoints = 1,
 		.endpoints = &single_endpoint,
 		.name_prefix = "rt715"
@@ -115,7 +115,7 @@ static const struct snd_soc_acpi_adr_device rt715_0_adr[] = {
 
 static const struct snd_soc_acpi_adr_device rt715_3_adr[] = {
 	{
-		.adr = 0x000320025D071500,
+		.adr = 0x000320025D071500ull,
 		.num_endpoints = 1,
 		.endpoints = &single_endpoint,
 		.name_prefix = "rt715"
@@ -124,13 +124,13 @@ static const struct snd_soc_acpi_adr_device rt715_3_adr[] = {
 
 static const struct snd_soc_acpi_adr_device mx8373_1_adr[] = {
 	{
-		.adr = 0x000123019F837300,
+		.adr = 0x000123019F837300ull,
 		.num_endpoints = 1,
 		.endpoints = &spk_l_endpoint,
 		.name_prefix = "Right"
 	},
 	{
-		.adr = 0x000127019F837300,
+		.adr = 0x000127019F837300ull,
 		.num_endpoints = 1,
 		.endpoints = &spk_r_endpoint,
 		.name_prefix = "Left"
@@ -139,7 +139,7 @@ static const struct snd_soc_acpi_adr_device mx8373_1_adr[] = {
 
 static const struct snd_soc_acpi_adr_device rt5682_0_adr[] = {
 	{
-		.adr = 0x000021025D568200,
+		.adr = 0x000021025D568200ull,
 		.num_endpoints = 1,
 		.endpoints = &single_endpoint,
 		.name_prefix = "rt5682"
@@ -148,7 +148,7 @@ static const struct snd_soc_acpi_adr_device rt5682_0_adr[] = {
 
 static const struct snd_soc_acpi_adr_device rt711_sdca_0_adr[] = {
 	{
-		.adr = 0x000030025D071101,
+		.adr = 0x000030025D071101ull,
 		.num_endpoints = 1,
 		.endpoints = &single_endpoint,
 		.name_prefix = "rt711"
@@ -157,7 +157,7 @@ static const struct snd_soc_acpi_adr_device rt711_sdca_0_adr[] = {
 
 static const struct snd_soc_acpi_adr_device rt1316_1_group1_adr[] = {
 	{
-		.adr = 0x000131025D131601, /* unique ID is set for some reason */
+		.adr = 0x000131025D131601ull, /* unique ID is set for some reason */
 		.num_endpoints = 1,
 		.endpoints = &spk_l_endpoint,
 		.name_prefix = "rt1316-1"
@@ -166,7 +166,7 @@ static const struct snd_soc_acpi_adr_device rt1316_1_group1_adr[] = {
 
 static const struct snd_soc_acpi_adr_device rt1316_2_group1_adr[] = {
 	{
-		.adr = 0x000230025D131601,
+		.adr = 0x000230025D131601ull,
 		.num_endpoints = 1,
 		.endpoints = &spk_r_endpoint,
 		.name_prefix = "rt1316-2"
@@ -175,7 +175,7 @@ static const struct snd_soc_acpi_adr_device rt1316_2_group1_adr[] = {
 
 static const struct snd_soc_acpi_adr_device rt714_3_adr[] = {
 	{
-		.adr = 0x000330025D071401,
+		.adr = 0x000330025D071401ull,
 		.num_endpoints = 1,
 		.endpoints = &single_endpoint,
 		.name_prefix = "rt714"
-- 
2.25.1

