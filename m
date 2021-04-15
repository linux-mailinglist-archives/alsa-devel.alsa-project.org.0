Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DA68B36117C
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Apr 2021 19:54:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 76E681678;
	Thu, 15 Apr 2021 19:53:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 76E681678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618509242;
	bh=AsaRI9L0g5w0cCYfN9robNPe5WBDCJhNf9UjgV6xWK8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=D5YG6FDvUl//N+RXBYQECPBXFJ5UvvUaTm3ib1MQVQVDW7xVEePVh8LcamrQoc6IZ
	 UudilF5apL8gue8/DZ4L080FEi+z0PGb55kinTPHj/tr8SJcYotqBcWWZlLBxGzCbz
	 fId5xETNI6zg+G+XsJ3PXCM+2EO0EubcffyrUcZQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C3A26F804AD;
	Thu, 15 Apr 2021 19:50:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A495EF80260; Thu, 15 Apr 2021 19:50:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 59F92F8022D
 for <alsa-devel@alsa-project.org>; Thu, 15 Apr 2021 19:50:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59F92F8022D
IronPort-SDR: bMUhH1b6RzfnegOJLgLpLSR5aicQDEjq0sAaw8hiJppXtE5zJ2VkTbdItGcqqcJGW/khzun6UD
 p8A1RbuJ9jaw==
X-IronPort-AV: E=McAfee;i="6200,9189,9955"; a="174400802"
X-IronPort-AV: E=Sophos;i="5.82,225,1613462400"; d="scan'208";a="174400802"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2021 10:50:38 -0700
IronPort-SDR: 50iagfS4YoYJB8/6RPugaUjNeKYGWiqqCVIwR/CDL6V9jtMsZP78Z3id+YpFRhkrAKFPviUY1n
 XPsns+TgL5eA==
X-IronPort-AV: E=Sophos;i="5.82,225,1613462400"; d="scan'208";a="382804664"
Received: from lesterhu-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.33.4])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2021 10:50:37 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 4/9] ASoC: Intel: soc-acpi: add entries for i2s machines in
 ADL match table
Date: Thu, 15 Apr 2021 12:50:08 -0500
Message-Id: <20210415175013.192862-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210415175013.192862-1-pierre-louis.bossart@linux.intel.com>
References: <20210415175013.192862-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>, tiwai@suse.de,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, Vamshi Krishna Gopal <vamshi.krishna.gopal@intel.com>,
 Bard Liao <bard.liao@intel.com>
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

From: Vamshi Krishna Gopal <vamshi.krishna.gopal@intel.com>

There are currently 2 customer boards of ADL
Board 1 : RT5682 + MAX98373
Board 2 : RT5682 + MAX98357A

Reviewed-by: Bard Liao <bard.liao@intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Vamshi Krishna Gopal <vamshi.krishna.gopal@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 .../intel/common/soc-acpi-intel-adl-match.c   | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-adl-match.c b/sound/soc/intel/common/soc-acpi-intel-adl-match.c
index 692c4c479ed8..39ac6d52106f 100644
--- a/sound/soc/intel/common/soc-acpi-intel-adl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-adl-match.c
@@ -232,7 +232,33 @@ static const struct snd_soc_acpi_link_adr adl_rvp[] = {
 	{}
 };
 
+static const struct snd_soc_acpi_codecs adl_max98373_amp = {
+	.num_codecs = 1,
+	.codecs = {"MX98373"}
+};
+
+static const struct snd_soc_acpi_codecs adl_max98357a_amp = {
+	.num_codecs = 1,
+	.codecs = {"MX98357A"}
+};
+
 struct snd_soc_acpi_mach snd_soc_acpi_intel_adl_machines[] = {
+	{
+		.id = "10EC5682",
+		.drv_name = "adl_max98373_rt5682",
+		.machine_quirk = snd_soc_acpi_codec_list,
+		.quirk_data = &adl_max98373_amp,
+		.sof_fw_filename = "sof-adl.ri",
+		.sof_tplg_filename = "sof-adl-max98373-rt5682.tplg",
+	},
+	{
+		.id = "10EC5682",
+		.drv_name = "adl_max98357a_rt5682",
+		.machine_quirk = snd_soc_acpi_codec_list,
+		.quirk_data = &adl_max98357a_amp,
+		.sof_fw_filename = "sof-adl.ri",
+		.sof_tplg_filename = "sof-adl-max98357a-rt5682.tplg",
+	},
 	{},
 };
 EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_adl_machines);
-- 
2.25.1

