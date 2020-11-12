Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C9372B11FB
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Nov 2020 23:44:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 179BD181E;
	Thu, 12 Nov 2020 23:43:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 179BD181E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605221077;
	bh=UGqNxkLN71duygvosIuhckBqyM7DlfyvBNz+vvyqny8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hxiXl+AgTiprPvG7785x2W25Gg0C0N+FJZLOiuO0ijGTpLN+ukjK00juI573AGt/Q
	 /gCMAtRc24NWCatRz6yE52ZSF/yll2RJvL0HQS5VrzAg1U0vBRwrxP+iCadTeTpYyu
	 R1ghxpiJl/6dW9k1WBb0fS+OcS8niPRyjmQxTCT8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AE3CAF80518;
	Thu, 12 Nov 2020 23:39:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9956EF804F1; Thu, 12 Nov 2020 23:39:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 80D5DF800D1
 for <alsa-devel@alsa-project.org>; Thu, 12 Nov 2020 23:38:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 80D5DF800D1
IronPort-SDR: 1IzikGjjdfNz/hvqXCQshHZ+KujGaKSll65MVI+fJgnFFeizoXhaFoNWK/ap/Q2LqpUBcA0qCN
 SBQXfSzq4uRw==
X-IronPort-AV: E=McAfee;i="6000,8403,9803"; a="166885012"
X-IronPort-AV: E=Sophos;i="5.77,473,1596524400"; d="scan'208";a="166885012"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2020 14:38:59 -0800
IronPort-SDR: Czhpc/tZdflciaPpNNxoxy0zwGYbENchA/7w2yOjASrU7Ze6Tl3poqAZd7odKSzRMlnMTMC0re
 4f5/rC5gt6kA==
X-IronPort-AV: E=Sophos;i="5.77,473,1596524400"; d="scan'208";a="323797496"
Received: from gjshield-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.213.180.118])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2020 14:38:58 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 10/14] ALSA: hda: intel-dsp-config: add Broadwell ACPI DSP
 driver selection
Date: Thu, 12 Nov 2020 16:38:21 -0600
Message-Id: <20201112223825.39765-11-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201112223825.39765-1-pierre-louis.bossart@linux.intel.com>
References: <20201112223825.39765-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 tiwai@suse.de, Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>, broonie@kernel.org,
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

Add ACPI IDs for Broadwell (and Haswell for consistency). This
addition is required for dynamic selection of drivers on those
devices.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
---
 sound/hda/intel-dsp-config.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/sound/hda/intel-dsp-config.c b/sound/hda/intel-dsp-config.c
index 7e6b8571c138..0dc079ba02ff 100644
--- a/sound/hda/intel-dsp-config.c
+++ b/sound/hda/intel-dsp-config.c
@@ -466,6 +466,26 @@ static const struct config_entry acpi_config_table[] = {
 		.acpi_hid = "808622A8",
 	},
 #endif
+/* Broadwell */
+#if IS_ENABLED(CONFIG_SND_SOC_INTEL_CATPT)
+	{
+		.flags = FLAG_SST,
+		.acpi_hid = "INT3438"
+	},
+#endif
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_BROADWELL)
+	{
+		.flags = FLAG_SOF,
+		.acpi_hid = "INT3438"
+	},
+#endif
+/* Haswell - not supported by SOF but added for consistency */
+#if IS_ENABLED(CONFIG_SND_SOC_INTEL_CATPT)
+	{
+		.flags = FLAG_SST,
+		.acpi_hid = "INT33C8"
+	},
+#endif
 };
 
 static const struct config_entry *snd_intel_acpi_dsp_find_config(const u8 acpi_hid[ACPI_ID_LEN],
-- 
2.25.1

