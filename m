Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 825E8655EF5
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Dec 2022 02:04:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 73B5A5590;
	Mon, 26 Dec 2022 02:03:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 73B5A5590
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672016645;
	bh=RsmiUjpT/vcAsulXzr37tHeDg54prpDpKNSyMsLu3bE=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=CT4YMm4yRrWY2bwVkTK0orMpSyI3OCHmtUKeVJ6ibFCY0KPHDA0UodfNeGnNJ7YvX
	 RvB4rglFAWbzgI3D8JEv8mmdAVRnnWBNkhdD6S2sEGvcSY51RgZ6LxhEp2oCSbH5+Z
	 TjKaqMh6NYUGK+U7psUtGoAm3Gz/GruJZ7c5D10w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0B3CEF800F0;
	Mon, 26 Dec 2022 02:03:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 25D05F800F0; Mon, 26 Dec 2022 02:03:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6979AF800F0
 for <alsa-devel@alsa-project.org>; Mon, 26 Dec 2022 02:03:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6979AF800F0
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=DTcEx1NL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1672016583; x=1703552583;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RsmiUjpT/vcAsulXzr37tHeDg54prpDpKNSyMsLu3bE=;
 b=DTcEx1NLTS7DnSWrTlmE7Wd9+6QdGNbMXxhYYfjV0WlFiBHOpoHGklG2
 eDfRSNSlOTykOzLpMknoYJoHeJOp2vo7FB/rDrmdbAaC4c4HJS9eCxKOV
 YLe6UDQ3SVKe4MkaDqa6kdHElOPEjX7ZYsAS1HSrqmPR4DSpXmzKqwirU
 eXKRU8APM97U7u5nwMEL84Sqoo+XGozZ8Qt/9tjodbRMApbdrn/vCN4lS
 PKyY5gzParEOdTeg2EcmDJZBtydMwdL1PaZQNJ/Fd+HOrJA7PCMYKaCy5
 5LWWH0wdieNHAVpKiKlJx6voArSTVMpEPs7s1sbEMDP5N+GE8ijitjLGS g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10571"; a="320591405"
X-IronPort-AV: E=Sophos;i="5.96,274,1665471600"; d="scan'208";a="320591405"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Dec 2022 17:02:57 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10571"; a="741354808"
X-IronPort-AV: E=Sophos;i="5.96,274,1665471600"; d="scan'208";a="741354808"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Dec 2022 17:02:55 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Subject: [PATCH 1/2] ASoC: Intel: soc-acpi: add configuration for variant of
 0C40 product
Date: Mon, 26 Dec 2022 09:09:16 +0800
Message-Id: <20221226010917.2632973-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, Zorro.Zhang@dell.com,
 pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com,
 peter.ujfalusi@linux.intel.com, bard.liao@intel.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Gongjun Song <gongjun.song@intel.com>

Support configuration with SoundWire RT1316 amplifiers on link0 and
link1, and RT711 on link2 for headphone/headset. This product does
not support local microphones.

Signed-off-by: Gongjun Song <gongjun.song@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 .../intel/common/soc-acpi-intel-rpl-match.c   | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-rpl-match.c b/sound/soc/intel/common/soc-acpi-intel-rpl-match.c
index 31b43116e3d8..c70d85bfedbf 100644
--- a/sound/soc/intel/common/soc-acpi-intel-rpl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-rpl-match.c
@@ -203,6 +203,25 @@ static const struct snd_soc_acpi_link_adr rpl_sdw_rt711_link2_rt1316_link01_rt71
 	{}
 };
 
+static const struct snd_soc_acpi_link_adr rpl_sdw_rt711_link2_rt1316_link01[] = {
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
 static const struct snd_soc_acpi_link_adr rpl_sdw_rt711_link0_rt1318_link12_rt714_link3[] = {
 	{
 		.mask = BIT(0),
@@ -277,6 +296,12 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_rpl_sdw_machines[] = {
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-rpl-rt1316-l12-rt714-l0.tplg",
 	},
+	{
+		.link_mask = 0x7, /* rt711 on link2 & two rt1316s on link0 and link1 */
+		.links = rpl_sdw_rt711_link2_rt1316_link01,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-rpl-rt711-l2-rt1316-l01.tplg",
+	},
 	{
 		.link_mask = 0x1, /* link0 required */
 		.links = rpl_rvp,
-- 
2.25.1

