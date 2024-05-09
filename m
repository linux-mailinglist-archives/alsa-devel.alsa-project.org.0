Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 299BE8C1325
	for <lists+alsa-devel@lfdr.de>; Thu,  9 May 2024 18:40:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2B29BEC1;
	Thu,  9 May 2024 18:40:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2B29BEC1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715272818;
	bh=EXu9QcKEMn/CqZbqLu+eep+NrrtdHmA8M7Xs+D0jXjM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=o3bPO3k6nHVfEzhvlojvev7bi41VyiXJ0UWoAyfMIKmMKPdCyBtN4Vh4ZNNaYYH4V
	 ebY0admuDPujCuT27mysCtn3MqYOUoDFgNiHW2jUXFtv+5lb/jDy0DP9hSOhDfKP6p
	 b4nCAlLZXBRExhf9Oo3HPX6C2AubwSZ0oEeEEu9c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 909E8F805F7; Thu,  9 May 2024 18:36:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E2941F805F5;
	Thu,  9 May 2024 18:36:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9EC9FF805C5; Thu,  9 May 2024 18:36:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4F9EBF804FB
	for <alsa-devel@alsa-project.org>; Thu,  9 May 2024 18:34:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4F9EBF804FB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=eizh8+/M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715272477; x=1746808477;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EXu9QcKEMn/CqZbqLu+eep+NrrtdHmA8M7Xs+D0jXjM=;
  b=eizh8+/Mt9q9wubXhGgvq9llOkguhYpOsE8SV9N4joKGb4Dpg6HzuEQA
   mu+Cfz5maD4DRbTPGUeaxBCYiPWiALNx+rHvJwxRmHJdZvzbbjX9XgXCw
   xU3DG/1O3ziUCMtk0VElSwBLI6Rk/NR7+9q8ggoK9WMgDvd30/1A1sooo
   q5UNMiB24o/fDUj35kVSZXW76PBRYMHE/qvoPaJ6WIHXxvkSko7XUfTrm
   gA0vdkl9yP3t4nxsz+3bBEmV/ZEgFeLNThIKcqNOZ5cbSW6bA6k17qGs4
   Rbsub8RsVJOxPtBW28NZr0C0/eEA4JqaYS8PVCZTk7s8smpJWUVzWHomy
   g==;
X-CSE-ConnectionGUID: NiIbBnsYQWa6kyaA+OH8fQ==
X-CSE-MsgGUID: ussECqZnRs6WBlYTOXJ5KQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="15017540"
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000";
   d="scan'208";a="15017540"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2024 09:34:28 -0700
X-CSE-ConnectionGUID: wMEklsq8TPeOGYq3SOOfrg==
X-CSE-MsgGUID: WuRWkeVITH60ZlVRfCzrPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000";
   d="scan'208";a="33760991"
Received: from ajunnare-mobl.amr.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.213.181.85])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2024 09:34:27 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 05/18] ASoC: Intel: soc-acpi-intel-mtl-match: add cs42l43 only
 support
Date: Thu,  9 May 2024 11:34:05 -0500
Message-Id: <20240509163418.67746-6-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240509163418.67746-1-pierre-louis.bossart@linux.intel.com>
References: <20240509163418.67746-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: O7EQVGPX2G676BGJ3OGTEU6PKTY6ZQOA
X-Message-ID-Hash: O7EQVGPX2G676BGJ3OGTEU6PKTY6ZQOA
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/O7EQVGPX2G676BGJ3OGTEU6PKTY6ZQOA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Bard Liao <yung-chuan.liao@linux.intel.com>

cs42l43 is on link 0. No amp in this configuration, will use cs42l43
speaker or bridge.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/common/soc-acpi-intel-mtl-match.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
index 0bff91317768..48252fa9e39e 100644
--- a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
@@ -668,6 +668,14 @@ static const struct snd_soc_acpi_link_adr cs42l42_link0_max98363_link2[] = {
 	{}
 };
 
+static const struct snd_soc_acpi_link_adr mtl_cs42l43_l0[] = {
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(cs42l43_0_adr),
+		.adr_d = cs42l43_0_adr,
+	},
+};
+
 static const struct snd_soc_acpi_link_adr mtl_cs42l43_cs35l56[] = {
 	{
 		.mask = BIT(0),
@@ -782,6 +790,12 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_mtl_sdw_machines[] = {
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-mtl-cs42l43-l0-cs35l56-l12.tplg",
 	},
+	{
+		.link_mask = BIT(0),
+		.links = mtl_cs42l43_l0,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-mtl-cs42l43-l0.tplg",
+	},
 	{
 		.link_mask = GENMASK(3, 0),
 		.links = mtl_3_in_1_sdca,
-- 
2.40.1

