Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2147124E1CF
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Aug 2020 22:06:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B0B2B166D;
	Fri, 21 Aug 2020 22:05:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B0B2B166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598040365;
	bh=AQr8EvlmRrzMS5aYj2waT1sqErmcMeq6sL8nPbOpmQ4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=g7Uy7VZI2zhzsbw6Tvj0RA0JkjiFf0S5qh/Gvyy7aQN6PGdmRdyjrPW38uSbpqQBL
	 08EQQEySmBpTjGDhV6cMBcwfFYMuxN1h3X44ZctByajCmyPaJ9BiYsSyiLiXgV+R/i
	 K3lgotkPQ1H2QVFe6wzkHpdG6+RzGqKJ1OyUGHmQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A267F80347;
	Fri, 21 Aug 2020 21:56:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2C07BF802F9; Fri, 21 Aug 2020 21:56:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 58AA7F802DC
 for <alsa-devel@alsa-project.org>; Fri, 21 Aug 2020 21:56:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 58AA7F802DC
IronPort-SDR: jN5ewjxrVYs2DYJ/qwYU1dDKPbjwni4gW6DcHq3s/5ljk8++P1xmHk/wfwlZuuHB/jIWhVtsmO
 ZfvCilT4o7Kw==
X-IronPort-AV: E=McAfee;i="6000,8403,9720"; a="217158571"
X-IronPort-AV: E=Sophos;i="5.76,338,1592895600"; d="scan'208";a="217158571"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2020 12:56:24 -0700
IronPort-SDR: qKcRtSEjdI8s6LXdQXiOkV7ocvgnnrW6tmncP49jvYXN2o8HbBpdee24+swz3SzRnaYV8S2SNy
 beEpR9l/7zRg==
X-IronPort-AV: E=Sophos;i="5.76,338,1592895600"; d="scan'208";a="279002440"
Received: from pahnn-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.254.176.176])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2020 12:56:23 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 12/14] ASoC: SOF: Add topology filename override based on dmi
 data match
Date: Fri, 21 Aug 2020 14:56:00 -0500
Message-Id: <20200821195603.215535-14-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200821195603.215535-1-pierre-louis.bossart@linux.intel.com>
References: <20200821195603.215535-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 tiwai@suse.de, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 vinod.koul@intel.com, broonie@kernel.org,
 Sathyanarayana Nujella <sathyanarayana.nujella@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
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

From: Sathyanarayana Nujella <sathyanarayana.nujella@intel.com>

Add topology filename override based on system DMI data matching,
typically to account for a different hardware layout.

In ACPI based systems, the tplg_filename is pre-defined in an ACPI
machine table. When a DMI quirk is detected, the
sof_pdata->tplg_filename is not set with the hard-coded ACPI value,
and instead is set with the DMI-specific filename.

Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: Sathyanarayana Nujella <sathyanarayana.nujella@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/hda.c   |  8 +++++++-
 sound/soc/sof/sof-pci-dev.c | 24 ++++++++++++++++++++++++
 2 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index c0b75d682750..b8157c1f37f3 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -1179,7 +1179,13 @@ void hda_machine_select(struct snd_sof_dev *sdev)
 
 	mach = snd_soc_acpi_find_machine(desc->machines);
 	if (mach) {
-		sof_pdata->tplg_filename = mach->sof_tplg_filename;
+		/*
+		 * If tplg file name is overridden, use it instead of
+		 * the one set in mach table
+		 */
+		if (!sof_pdata->tplg_filename)
+			sof_pdata->tplg_filename = mach->sof_tplg_filename;
+
 		sof_pdata->machine = mach;
 
 		if (mach->link_mask) {
diff --git a/sound/soc/sof/sof-pci-dev.c b/sound/soc/sof/sof-pci-dev.c
index aa3532ba1434..f3a8140773db 100644
--- a/sound/soc/sof/sof-pci-dev.c
+++ b/sound/soc/sof/sof-pci-dev.c
@@ -35,8 +35,28 @@ static int sof_pci_debug;
 module_param_named(sof_pci_debug, sof_pci_debug, int, 0444);
 MODULE_PARM_DESC(sof_pci_debug, "SOF PCI debug options (0x0 all off)");
 
+static const char *sof_override_tplg_name;
+
 #define SOF_PCI_DISABLE_PM_RUNTIME BIT(0)
 
+static int sof_tplg_cb(const struct dmi_system_id *id)
+{
+	sof_override_tplg_name = id->driver_data;
+	return 1;
+}
+
+static const struct dmi_system_id sof_tplg_table[] = {
+	{
+		.callback = sof_tplg_cb,
+		.matches = {
+			DMI_MATCH(DMI_PRODUCT_FAMILY, "Google_Volteer"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Terrador"),
+		},
+		.driver_data = "sof-tgl-rt5682-ssp0-max98373-ssp2.tplg",
+	},
+	{}
+};
+
 static const struct dmi_system_id community_key_platforms[] = {
 	{
 		.ident = "Up Squared",
@@ -347,6 +367,10 @@ static int sof_pci_probe(struct pci_dev *pci,
 		sof_pdata->tplg_filename_prefix =
 			sof_pdata->desc->default_tplg_path;
 
+	dmi_check_system(sof_tplg_table);
+	if (sof_override_tplg_name)
+		sof_pdata->tplg_filename = sof_override_tplg_name;
+
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_PROBE_WORK_QUEUE)
 	/* set callback to enable runtime_pm */
 	sof_pdata->sof_probe_complete = sof_pci_probe_complete;
-- 
2.25.1

