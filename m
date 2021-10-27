Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BCFA43BFF3
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Oct 2021 04:35:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CFC4C16F5;
	Wed, 27 Oct 2021 04:34:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CFC4C16F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635302102;
	bh=hgSdSxBZu5xj1j4t1DTadFlsmp94xNxOeqiUi/phHEI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Q+8q9M+SLUGM46vFiFViNn1ndwnA/forZma5wslv6iWW1OnzWxD93FuDJ2EroDxoC
	 6EM1wOiesM42zD628DFE5YFAxYVwDrf5HVHKqgPUWuOFhKI4owcLGU1n2QSBmpVZal
	 VUvZsG0IiQzBaX7XC5ChxDxsWrSzL4j07y/I0XO8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 30599F804D0;
	Wed, 27 Oct 2021 04:33:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CC54FF804E5; Wed, 27 Oct 2021 04:33:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 293BCF804D0
 for <alsa-devel@alsa-project.org>; Wed, 27 Oct 2021 04:33:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 293BCF804D0
X-IronPort-AV: E=McAfee;i="6200,9189,10149"; a="290896163"
X-IronPort-AV: E=Sophos;i="5.87,184,1631602800"; d="scan'208";a="290896163"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2021 19:33:24 -0700
X-IronPort-AV: E=Sophos;i="5.87,184,1631602800"; d="scan'208";a="497638325"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2021 19:33:22 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Subject: [PATCH] ASoC: Intel: soc-acpi: add entry for ESSX8336 on JSL
Date: Wed, 27 Oct 2021 10:33:11 +0800
Message-Id: <20211027023311.25005-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 bard.liao@intel.com
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

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

We have configurations for this codec on APL, GLK and TGL, somehow the
information that some designs rely on JasperLake was not shared.

BugLink: https://github.com/thesofproject/linux/issues/3210
Fixes: 790049fb6623 ('ASoC: Intel: soc-acpi: apl/glk/tgl: add entry for devices based on ES8336 codec')
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/intel/common/soc-acpi-intel-jsl-match.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-jsl-match.c b/sound/soc/intel/common/soc-acpi-intel-jsl-match.c
index 20fd9dcc74af..e7d22e397299 100644
--- a/sound/soc/intel/common/soc-acpi-intel-jsl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-jsl-match.c
@@ -105,6 +105,12 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_jsl_machines[] = {
 		.quirk_data = &mx98360a_spk,
 		.sof_tplg_filename = "sof-jsl-rt5682-mx98360a.tplg",
 	},
+	{
+		.id = "ESSX8336",
+		.drv_name = "sof-essx8336",
+		.sof_fw_filename = "sof-jsl.ri",
+		.sof_tplg_filename = "sof-jsl-es8336.tplg",
+	},
 	{},
 };
 EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_jsl_machines);
-- 
2.17.1

