Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E59361171
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Apr 2021 19:52:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 65DFF1680;
	Thu, 15 Apr 2021 19:51:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 65DFF1680
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618509152;
	bh=7PIF6xsRjTLZbZJ/5d9nTT9XZuLnPTOKL2B+QyNSXz0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=J5xQ24LBn4JyOmHZN8scY/h+kZ1Sv8KkQ5znXceUyH6pjVjikOs4GLr6ELmr5Uftx
	 Z+BEYpVCQOdSdZDzthUR4eRmZFQojtwQi/NGrREr8EjvxMWSZZGAT++QoO4cJKFYmY
	 PIyTLtgHaE6jRNjPuWaZEd7+AlicqYkvTQzY41go=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 321DFF8021D;
	Thu, 15 Apr 2021 19:50:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 95CA8F8025C; Thu, 15 Apr 2021 19:50:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5E739F8021D
 for <alsa-devel@alsa-project.org>; Thu, 15 Apr 2021 19:50:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5E739F8021D
IronPort-SDR: nVp12JRmyKNa4CfTi11FMifo/dk1s3z9bG9jXUewD1Hbml4X11RVMjBY07zhwE0aYgmFCXNLzl
 W97sfEOz+cbA==
X-IronPort-AV: E=McAfee;i="6200,9189,9955"; a="174400792"
X-IronPort-AV: E=Sophos;i="5.82,225,1613462400"; d="scan'208";a="174400792"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2021 10:50:36 -0700
IronPort-SDR: ghlp9fIQuZ9Lr0q2IncO0mp9nrGtUqU0JUrHZZ2UiO/qR1yRF+JPJAC+2WkLYyIYYLoy6G8lMh
 0QaKcM6NYSYQ==
X-IronPort-AV: E=Sophos;i="5.82,225,1613462400"; d="scan'208";a="382804646"
Received: from lesterhu-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.33.4])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2021 10:50:34 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/9] ASoC: Intel: soc-acpi: add ADL jack-less SoundWire
 configurations
Date: Thu, 15 Apr 2021 12:50:06 -0500
Message-Id: <20210415175013.192862-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210415175013.192862-1-pierre-louis.bossart@linux.intel.com>
References: <20210415175013.192862-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Libin Yang <libin.yang@intel.com>, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>
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

Add one configuration with no RT711.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Libin Yang <libin.yang@intel.com>
---
 .../intel/common/soc-acpi-intel-adl-match.c   | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-adl-match.c b/sound/soc/intel/common/soc-acpi-intel-adl-match.c
index d935745322b6..692c4c479ed8 100644
--- a/sound/soc/intel/common/soc-acpi-intel-adl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-adl-match.c
@@ -101,6 +101,24 @@ static const struct snd_soc_acpi_adr_device rt1316_3_group1_adr[] = {
 	}
 };
 
+static const struct snd_soc_acpi_adr_device rt1316_2_single_adr[] = {
+	{
+		.adr = 0x000230025D131601,
+		.num_endpoints = 1,
+		.endpoints = &single_endpoint,
+		.name_prefix = "rt1316-1"
+	}
+};
+
+static const struct snd_soc_acpi_adr_device rt714_0_adr[] = {
+	{
+		.adr = 0x000030025D071401,
+		.num_endpoints = 1,
+		.endpoints = &single_endpoint,
+		.name_prefix = "rt714"
+	}
+};
+
 static const struct snd_soc_acpi_adr_device rt714_2_adr[] = {
 	{
 		.adr = 0x000230025D071401,
@@ -191,6 +209,20 @@ static const struct snd_soc_acpi_link_adr adl_sdca_3_in_1[] = {
 	{}
 };
 
+static const struct snd_soc_acpi_link_adr adl_sdw_rt1316_link2_rt714_link0[] = {
+	{
+		.mask = BIT(2),
+		.num_adr = ARRAY_SIZE(rt1316_2_single_adr),
+		.adr_d = rt1316_2_single_adr,
+	},
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(rt714_0_adr),
+		.adr_d = rt714_0_adr,
+	},
+	{}
+};
+
 static const struct snd_soc_acpi_link_adr adl_rvp[] = {
 	{
 		.mask = BIT(0),
@@ -225,6 +257,12 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_adl_sdw_machines[] = {
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-adl-rt711-l0-rt1316-l13-rt714-l2.tplg",
 	},
+	{
+		.link_mask = 0x5, /* 2 active links required */
+		.links = adl_sdw_rt1316_link2_rt714_link0,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-adl-rt1316-l2-mono-rt714-l0.tplg",
+	},
 	{
 		.link_mask = 0x1, /* link0 required */
 		.links = adl_rvp,
-- 
2.25.1

