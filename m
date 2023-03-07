Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 495ED6ADB66
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Mar 2023 11:08:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 72A771407;
	Tue,  7 Mar 2023 11:07:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 72A771407
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678183694;
	bh=JNsieOpaOS/dFOPQ5VOR1/sKUl6juzRq5h5lHKjXo6s=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=pthuZSBdWVdDegvEH6+X+yfWm9JfA7TY2fgQCoIdiHkX3CRpXhk1wHSpOKnFqvjcL
	 VeosoIJ171PllGBeEUZcA3+sunFuAW6GZQoRWpbddqBdDCOSK+j2O6rZXhDoF31Qdg
	 FTIyS6ah6CZnqbmONLtK94AgQQbwmxwvDR9ME75Y=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B73BEF80236;
	Tue,  7 Mar 2023 11:07:23 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B632DF8042F; Tue,  7 Mar 2023 11:07:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 82B55F80093
	for <alsa-devel@alsa-project.org>; Tue,  7 Mar 2023 11:07:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 82B55F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ThBj1JhG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678183637; x=1709719637;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=JNsieOpaOS/dFOPQ5VOR1/sKUl6juzRq5h5lHKjXo6s=;
  b=ThBj1JhGWuH/tcz6pQHMaGTIR9TuNfRIK1iNVf3LqSUfcyxPydvtD0xW
   wW43sCQr3qmTqYfzhUjDy2hLPyhM4MZREAlJUbzk1IW2u6efXHxIysUNk
   /oITs4t8O9U7EQPL5eJaRNwrgmouA7epwnb7Dyzyd9uklXPIrUWWt7S+v
   C/teA+VNG8QUDRyKDBNr64bSOT8hX+X/o45bX1F502YUbIg8bxswLBRhx
   gai6gmci/SLffuFemD2u+tzRE2QH2w9734+r+gpET52S7TUW3D0ucqjo5
   Cp3mf/9MOZXO2No4BjiO0EZSgrvTF9/FNl0XiDVTcpviygxQQWnIJS+5p
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="335835943"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400";
   d="scan'208";a="335835943"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 02:07:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="922297688"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400";
   d="scan'208";a="922297688"
Received: from rganesh-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.47.75])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 02:07:12 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH] ASoC: Intel: soc-acpi: fix copy-paste issue in topology names
Date: Tue,  7 Mar 2023 12:07:33 +0200
Message-Id: <20230307100733.15025-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: MLC2C4IDDHCYV5N6MFSIX3W7WM5U33Z2
X-Message-ID-Hash: MLC2C4IDDHCYV5N6MFSIX3W7WM5U33Z2
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 yung-chuan.liao@linux.intel.com, stable@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MLC2C4IDDHCYV5N6MFSIX3W7WM5U33Z2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

For some reason the convention for topology names was not followed and
the name inspired by another unrelated hardware configuration. As a
result, the kernel will request a non-existent topology file.

Link: https://github.com/thesofproject/sof/pull/6878
Fixes: 2ec8b081d59f ("ASoC: Intel: soc-acpi: Add entry for sof_es8336 in ADL match table")
Cc: stable@vger.kernel.org
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/intel/common/soc-acpi-intel-adl-match.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/common/soc-acpi-intel-adl-match.c b/sound/soc/intel/common/soc-acpi-intel-adl-match.c
index 56ee5fef66a8..28dd2046e4ac 100644
--- a/sound/soc/intel/common/soc-acpi-intel-adl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-adl-match.c
@@ -559,7 +559,7 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_adl_machines[] = {
 	{
 		.comp_ids = &essx_83x6,
 		.drv_name = "sof-essx8336",
-		.sof_tplg_filename = "sof-adl-es83x6", /* the tplg suffix is added at run time */
+		.sof_tplg_filename = "sof-adl-es8336", /* the tplg suffix is added at run time */
 		.tplg_quirk_mask = SND_SOC_ACPI_TPLG_INTEL_SSP_NUMBER |
 					SND_SOC_ACPI_TPLG_INTEL_SSP_MSB |
 					SND_SOC_ACPI_TPLG_INTEL_DMIC_NUMBER,
-- 
2.39.2

