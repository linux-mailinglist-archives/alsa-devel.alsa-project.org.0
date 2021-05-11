Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 90AB237B0EC
	for <lists+alsa-devel@lfdr.de>; Tue, 11 May 2021 23:42:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2DDA318C5;
	Tue, 11 May 2021 23:41:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2DDA318C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620769330;
	bh=S0SASGroq7Z3JIbrxPkDkmc/ag9/CYanhotaiCz8Yao=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=D6mpv03AQZ5qCtoSMnHjvxMQ6B1mIWkPg20Dqse58yPLG7/lBDucqe83ty+NMI8z8
	 05WBm6+H7dAQq1vMjU392CDQYe6qPkfqnw8FExR4ARBbNVS+/doH0Ymnk7ZHtbFsZN
	 yfIUfG0wrTTSoqKHGRM8JJQkbmdwtFeGknKKfdQ4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0AAAFF804F1;
	Tue, 11 May 2021 23:37:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6BB01F804EC; Tue, 11 May 2021 23:37:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 915EDF80430
 for <alsa-devel@alsa-project.org>; Tue, 11 May 2021 23:37:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 915EDF80430
IronPort-SDR: 8rRZnQh2pjbceB3e8B/ZTB1c+ZGY0go9cgD6dGMQnDvdOgsDRMt+0WYQvEfDEcDcbklRDlNPTY
 A6F9UGsUe9QQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9981"; a="186992090"
X-IronPort-AV: E=Sophos;i="5.82,291,1613462400"; d="scan'208";a="186992090"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 14:37:38 -0700
IronPort-SDR: EU0/nqQOMOh1IXv6+3Ngb0UjLlA9/HSw23nfCsMjnfLD9dDNQ3btNsp/sxv6eRiBYmswQXhhX2
 vayJBE9Z2HRw==
X-IronPort-AV: E=Sophos;i="5.82,291,1613462400"; d="scan'208";a="469098999"
Received: from seanwol-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.212.100.14])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 14:37:37 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 9/9] ASoC: Intel: soc-acpi: add ull suffix for SoundWire _ADR
 values
Date: Tue, 11 May 2021 16:37:07 -0500
Message-Id: <20210511213707.32958-10-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210511213707.32958-1-pierre-louis.bossart@linux.intel.com>
References: <20210511213707.32958-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 tiwai@suse.de, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>, broonie@kernel.org,
 Paul Olaru <paul.olaru@oss.nxp.com>
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
index b01aa6ba050f..6b4d000bebbb 100644
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

