Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D6D4C9517
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Mar 2022 20:52:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A4AA71B21;
	Tue,  1 Mar 2022 20:51:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A4AA71B21
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646164361;
	bh=3z18+5yi03PXQK2DSzQZuyeBz9HJJ9Zl/2i/WzkctFg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IyUUQgyy3YYrpp9syoWX6K7l/ODnJ1X3748+PGgzL0S0v17RlqKfELB3G0fS4Lwbh
	 KaRJA3CI/h244qdUghY8MtTadZp+gxzUtriDO7IqnoK59a0fHryLE8PSxz9ptUOAkB
	 8X+3JhNYOe7hakodJAZ8Uthiu2Y3gUU2ON/oxo/E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F1A1F80539;
	Tue,  1 Mar 2022 20:49:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3882DF80526; Tue,  1 Mar 2022 20:49:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C7DD0F80516
 for <alsa-devel@alsa-project.org>; Tue,  1 Mar 2022 20:49:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C7DD0F80516
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="EhucvS9M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646164164; x=1677700164;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3z18+5yi03PXQK2DSzQZuyeBz9HJJ9Zl/2i/WzkctFg=;
 b=EhucvS9MkLfnUCVjdii3ztoPE8s2b0WdacVMuNAzwEjJJB3+O67WDcKE
 ED6JJB78toCSzhyCmuWz+QMG9l/B2Dwb7+Q15o32JaR5Vk7cgMMJx18yj
 EguLuyIkY1cjGz4Mv/2WQzcltiDemGlKZF8tLH+xlmdG5BRqsS7QF9rKO
 qqHbo+5iyyUhUaudjZD/GVFavbqDKMwfLJyqR/hW/W6QSO+d5mULFd1tJ
 KR5f7PWwI9kLAX3+ZEwqT3VwfuXjcRnBDzacUUdQxqDiu/blCuUBy0K39
 wTCa2IwJNY0Dr478x4O2skCuJedmMQZmVvvGDZkPPgaXzXyNVRGK8pjBH g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10273"; a="233841076"
X-IronPort-AV: E=Sophos;i="5.90,146,1643702400"; d="scan'208";a="233841076"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2022 11:49:17 -0800
X-IronPort-AV: E=Sophos;i="5.90,146,1643702400"; d="scan'208";a="630131871"
Received: from rbrosius-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.209.131.146])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2022 11:49:17 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 8/8] ASoC: Intel: soc-acpi: add entries in ADL match table
Date: Tue,  1 Mar 2022 13:49:03 -0600
Message-Id: <20220301194903.60859-9-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220301194903.60859-1-pierre-louis.bossart@linux.intel.com>
References: <20220301194903.60859-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Libin Yang <libin.yang@intel.com>, broonie@kernel.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

From: Libin Yang <libin.yang@intel.com>

Support configuration with SoundWire RT1316 amplifiers on link0 and
link1, and RT711 on link2 for headphone/headset. This product does not
support local microphones.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Libin Yang <libin.yang@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 .../intel/common/soc-acpi-intel-adl-match.c   | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-adl-match.c b/sound/soc/intel/common/soc-acpi-intel-adl-match.c
index f120d7e2aecb..7c89a974b59f 100644
--- a/sound/soc/intel/common/soc-acpi-intel-adl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-adl-match.c
@@ -260,6 +260,25 @@ static const struct snd_soc_acpi_link_adr adl_sdw_rt711_link2_rt1316_link01_rt71
 	{}
 };
 
+static const struct snd_soc_acpi_link_adr adl_sdw_rt711_link2_rt1316_link01[] = {
+	{
+		.mask = BIT(2),
+		.num_adr = ARRAY_SIZE(rt711_sdca_2_adr),
+		.adr_d = rt711_sdca_2_adr,
+	},
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(rt1316_0_group2_adr),
+		.adr_d = rt1316_0_group2_adr,
+	},
+	{
+		.mask = BIT(1),
+		.num_adr = ARRAY_SIZE(rt1316_1_group2_adr),
+		.adr_d = rt1316_1_group2_adr,
+	},
+	{}
+};
+
 static const struct snd_soc_acpi_link_adr adl_sdw_rt1316_link12_rt714_link0[] = {
 	{
 		.mask = BIT(1),
@@ -480,6 +499,12 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_adl_sdw_machines[] = {
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-adl-rt711-l2-rt1316-l01-rt714-l3.tplg",
 	},
+	{
+		.link_mask = 0x7, /* rt1316 on link0 and link1 & rt711 on link2*/
+		.links = adl_sdw_rt711_link2_rt1316_link01,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-adl-rt711-l2-rt1316-l01.tplg",
+	},
 	{
 		.link_mask = 0xC, /* rt1316 on link2 & rt714 on link3 */
 		.links = adl_sdw_rt1316_link2_rt714_link3,
-- 
2.25.1

