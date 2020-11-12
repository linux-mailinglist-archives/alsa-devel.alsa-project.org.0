Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B20FB2B11EC
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Nov 2020 23:41:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 49565185A;
	Thu, 12 Nov 2020 23:40:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 49565185A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605220893;
	bh=SiLQDl74rOLOJT76K5kK5NakZcfhcP4C0klEi/+PDm4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IFTNU3iTzBrP0MRl6WZJ5FhJtUSiHkX2WfP3pdjddnbvyUnxRDi8gn7eOv9Oa80Lb
	 kA3Vy4feHELlQDskhJ532kcgQ1oQj9HfqO9h0x+LpJ27gH/JZ0EpHntl3UzGk3axJP
	 ohF9L9QfPokbgPxX9xQQ4hC+PmihdQPn4tXyTfIY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 560FDF801D5;
	Thu, 12 Nov 2020 23:39:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 56D8CF804DF; Thu, 12 Nov 2020 23:39:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 78304F801EC
 for <alsa-devel@alsa-project.org>; Thu, 12 Nov 2020 23:38:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 78304F801EC
IronPort-SDR: cAAoLlmKex03X30Wym9Ba1vfKdMnzDn4lgICj/H//HWk0nS5RQNe9f94qRiksntwZ1i0rt8tZR
 OY5ewDTV//Pw==
X-IronPort-AV: E=McAfee;i="6000,8403,9803"; a="166885000"
X-IronPort-AV: E=Sophos;i="5.77,473,1596524400"; d="scan'208";a="166885000"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2020 14:38:53 -0800
IronPort-SDR: ww3fvxe94odOw/10Lio1Nx7f56m4AD97XkLNRjOSyZTNyxXdO2S7Eykc42QddukYNvLNO3JtEJ
 a7zZQ4kRYARw==
X-IronPort-AV: E=Sophos;i="5.77,473,1596524400"; d="scan'208";a="323797465"
Received: from gjshield-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.213.180.118])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2020 14:38:52 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 04/14] ASoC: soc-acpi: add helper to identify parent driver.
Date: Thu, 12 Nov 2020 16:38:15 -0600
Message-Id: <20201112223825.39765-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201112223825.39765-1-pierre-louis.bossart@linux.intel.com>
References: <20201112223825.39765-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, tiwai@suse.de,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>, broonie@kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
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

Intel machine drivers are used by parent platform drivers based on
closed-source firmware (Atom/SST and catpt) and SOF-based ones.

In some cases for ACPI-based platforms, the behavior of machine
drivers needs to be modified depending on the parent type, typically
for card names and power management.

An initial solution based on passing a boolean flag as a platform
device parameter was tested earlier. Since it looked overkill, this
patch suggests instead a simple string comparison to identify an SOF
parent device/driver.

Suggested-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
---
 include/sound/soc-acpi.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/sound/soc-acpi.h b/include/sound/soc-acpi.h
index b16a844d16ef..9a43c44dcbbb 100644
--- a/include/sound/soc-acpi.h
+++ b/include/sound/soc-acpi.h
@@ -171,4 +171,10 @@ struct snd_soc_acpi_codecs {
 	u8 codecs[SND_SOC_ACPI_MAX_CODECS][ACPI_ID_LEN];
 };
 
+static inline bool snd_soc_acpi_sof_parent(struct device *dev)
+{
+	return dev->parent && dev->parent->driver && dev->parent->driver->name &&
+		!strcmp(dev->parent->driver->name, "sof-audio-acpi");
+}
+
 #endif
-- 
2.25.1

