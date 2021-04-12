Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8947E35CAE5
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Apr 2021 18:17:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D6DB166F;
	Mon, 12 Apr 2021 18:16:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D6DB166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618244245;
	bh=n21mR6dtHHeli3TTIB/TXingKw6jRAyKSlJOGqUV8H8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ELDUar5nyimDDXPaWaGpfi/ZrAWevu9BiCBbO1ue8CXQpJSOj0BH6rQxlpyqcyvoF
	 HxMsYaKxd7JrtLsGLxcIMkP2AEL4fC9146MId7GuCbNr1VXTv51QmOCLI9f5RRviLE
	 09FKJxtL9sbxaZTYld9qRq0YIOCLrLh/8aELPWts=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 74402F802A9;
	Mon, 12 Apr 2021 18:15:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9E822F8013D; Mon, 12 Apr 2021 18:15:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EA520F8013D
 for <alsa-devel@alsa-project.org>; Mon, 12 Apr 2021 18:15:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EA520F8013D
IronPort-SDR: 4CfmiBoF+8/yPyhnt1XtgGOsS0UlQ629nZvlE4bbQY2gtZRtL2ijMn6P2Sph9g7BXEzXCCgETh
 xZEEbxKtuOUw==
X-IronPort-AV: E=McAfee;i="6200,9189,9952"; a="181355512"
X-IronPort-AV: E=Sophos;i="5.82,216,1613462400"; d="scan'208";a="181355512"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2021 09:15:30 -0700
IronPort-SDR: q7TzRFQmjFg/pxHU8IIelMk6YOK53HBATnSRprIjnXra9TMHV64SHurW0Lw3LQPILz2qix/Wj9
 A7B3uREi3/0w==
X-IronPort-AV: E=Sophos;i="5.82,216,1613462400"; d="scan'208";a="398428910"
Received: from pvquach-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.212.124.143])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2021 09:15:29 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/2] ASoC: SOF: Intel: add missing use_acpi_target_states for
 TGL platforms
Date: Mon, 12 Apr 2021 11:15:18 -0500
Message-Id: <20210412161519.13508-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210412161519.13508-1-pierre-louis.bossart@linux.intel.com>
References: <20210412161519.13508-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Libin Yang <libin.yang@intel.com>, broonie@kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
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

All Intel TigerLake platforms should support the feature of getting
the system state from acpi to deal with S0ix support.

This was missed in previous commits, likely due to copy/paste from
older code.

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Libin Yang <libin.yang@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/pci-tgl.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/sof/intel/pci-tgl.c b/sound/soc/sof/intel/pci-tgl.c
index 38bc353f7313..77cc037655f1 100644
--- a/sound/soc/sof/intel/pci-tgl.c
+++ b/sound/soc/sof/intel/pci-tgl.c
@@ -39,6 +39,7 @@ static const struct sof_dev_desc tgl_desc = {
 static const struct sof_dev_desc tglh_desc = {
 	.machines               = snd_soc_acpi_intel_tgl_machines,
 	.alt_machines		= snd_soc_acpi_intel_tgl_sdw_machines,
+	.use_acpi_target_states	= true,
 	.resindex_lpe_base      = 0,
 	.resindex_pcicfg_base   = -1,
 	.resindex_imr_base      = -1,
@@ -71,6 +72,7 @@ static const struct sof_dev_desc ehl_desc = {
 static const struct sof_dev_desc adls_desc = {
 	.machines               = snd_soc_acpi_intel_adl_machines,
 	.alt_machines           = snd_soc_acpi_intel_adl_sdw_machines,
+	.use_acpi_target_states	= true,
 	.resindex_lpe_base      = 0,
 	.resindex_pcicfg_base   = -1,
 	.resindex_imr_base      = -1,
-- 
2.25.1

