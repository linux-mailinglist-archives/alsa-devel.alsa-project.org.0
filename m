Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 86FC41379B3
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jan 2020 23:31:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2647516C1;
	Fri, 10 Jan 2020 23:30:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2647516C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578695496;
	bh=1o6eJFbTK6YS5n205QBysUdzBrwPKG/4hnyIBZdfXII=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MPLuZ8HMRAZ12adaa+zQW7WxkzP++hO68dQrvuP+c3U+N3a3IT80bmATY4O3V3l2G
	 1hWzVUU3kczOcQr6ifihp6qBGnGhqjfQW/a6oGVcnvy4yHg+d+4vKNDrlQPO5UUMpi
	 F8SOJUuVrsC63yyczPWRDGJdjPOSMlg+bAkZBW0c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B984F802A8;
	Fri, 10 Jan 2020 23:25:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A59E2F8011C; Fri, 10 Jan 2020 23:25:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2FA05F80116
 for <alsa-devel@alsa-project.org>; Fri, 10 Jan 2020 23:25:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2FA05F80116
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Jan 2020 14:25:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,418,1571727600"; d="scan'208";a="216813300"
Received: from ewronsha-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.255.66.226])
 by orsmga008.jf.intel.com with ESMTP; 10 Jan 2020 14:25:38 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Fri, 10 Jan 2020 16:25:30 -0600
Message-Id: <20200110222530.30303-7-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200110222530.30303-1-pierre-louis.bossart@linux.intel.com>
References: <20200110222530.30303-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 6/6] ASoC: SOF: Intel: reference SoundWire
	machine lists
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Use static tables to automatically select the relevant configurations.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/sof-pci-dev.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/soc/sof/sof-pci-dev.c b/sound/soc/sof/sof-pci-dev.c
index 9993be36d105..d855bc2b76ad 100644
--- a/sound/soc/sof/sof-pci-dev.c
+++ b/sound/soc/sof/sof-pci-dev.c
@@ -118,6 +118,7 @@ static const struct sof_dev_desc tng_desc = {
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_CANNONLAKE)
 static const struct sof_dev_desc cnl_desc = {
 	.machines		= snd_soc_acpi_intel_cnl_machines,
+	.alt_machines		= snd_soc_acpi_intel_cnl_sdw_machines,
 	.resindex_lpe_base	= 0,
 	.resindex_pcicfg_base	= -1,
 	.resindex_imr_base	= -1,
@@ -135,6 +136,7 @@ static const struct sof_dev_desc cnl_desc = {
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_COFFEELAKE)
 static const struct sof_dev_desc cfl_desc = {
 	.machines		= snd_soc_acpi_intel_cfl_machines,
+	.alt_machines		= snd_soc_acpi_intel_cfl_sdw_machines,
 	.resindex_lpe_base	= 0,
 	.resindex_pcicfg_base	= -1,
 	.resindex_imr_base	= -1,
@@ -154,6 +156,7 @@ static const struct sof_dev_desc cfl_desc = {
 
 static const struct sof_dev_desc cml_desc = {
 	.machines		= snd_soc_acpi_intel_cml_machines,
+	.alt_machines		= snd_soc_acpi_intel_cml_sdw_machines,
 	.resindex_lpe_base	= 0,
 	.resindex_pcicfg_base	= -1,
 	.resindex_imr_base	= -1,
@@ -171,6 +174,7 @@ static const struct sof_dev_desc cml_desc = {
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_ICELAKE)
 static const struct sof_dev_desc icl_desc = {
 	.machines               = snd_soc_acpi_intel_icl_machines,
+	.alt_machines		= snd_soc_acpi_intel_icl_sdw_machines,
 	.resindex_lpe_base      = 0,
 	.resindex_pcicfg_base   = -1,
 	.resindex_imr_base      = -1,
@@ -188,6 +192,7 @@ static const struct sof_dev_desc icl_desc = {
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_TIGERLAKE)
 static const struct sof_dev_desc tgl_desc = {
 	.machines               = snd_soc_acpi_intel_tgl_machines,
+	.alt_machines		= snd_soc_acpi_intel_tgl_sdw_machines,
 	.resindex_lpe_base      = 0,
 	.resindex_pcicfg_base   = -1,
 	.resindex_imr_base      = -1,
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
