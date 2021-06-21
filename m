Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D483AF668
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Jun 2021 21:46:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2699E16C5;
	Mon, 21 Jun 2021 21:45:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2699E16C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624304778;
	bh=h1qRFOKfidt3gGcfU0kLzkn4fHSbToyyPnPCJR1dxJA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZDU8GAyeTK92modmj0bGmMD5ZXwHFbQDB6cVIVeOrHdpSp3ab1tk/KQ09QPWi2PuG
	 KZir5h+gUfhq3vCmQ1mT77sEhNj3ES2z+ZhGEi5bLYYz4NeCBFYvudnyUWRYYKslbq
	 5yyi7QqxJTvHuzuu6QS72JMiWKSdnsKxvYPIEF2w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 93541F80518;
	Mon, 21 Jun 2021 21:41:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E2958F804E0; Mon, 21 Jun 2021 21:41:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1CADDF804D2
 for <alsa-devel@alsa-project.org>; Mon, 21 Jun 2021 21:41:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1CADDF804D2
IronPort-SDR: eRDc3xz0y2IOg42h8gN7m1fxqU+IM5HYuHUSpiIXREmXd8iBVjHjbih3ifGDTGgx3qGHOu2Nd5
 08VvNRzG0qWg==
X-IronPort-AV: E=McAfee;i="6200,9189,10022"; a="203903343"
X-IronPort-AV: E=Sophos;i="5.83,289,1616482800"; d="scan'208";a="203903343"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2021 12:41:25 -0700
IronPort-SDR: tYoIbnUtN8tMnNjZPbnErmCMdrrMP5955N+vRTspSqSfaAMTI6HEaW2jItERC1/n8yt62vJ1AI
 b2axYyctUYtw==
X-IronPort-AV: E=Sophos;i="5.83,289,1616482800"; d="scan'208";a="486619089"
Received: from gwhaugh-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.209.175.53])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2021 12:41:23 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 08/10] ASoC: Intel: soc-acpi: add ull suffix for SoundWire
 _ADR values
Date: Mon, 21 Jun 2021 14:40:55 -0500
Message-Id: <20210621194057.21711-9-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210621194057.21711-1-pierre-louis.bossart@linux.intel.com>
References: <20210621194057.21711-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, tiwai@suse.de,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
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

