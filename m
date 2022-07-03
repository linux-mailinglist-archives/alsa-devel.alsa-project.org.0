Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9705C56481D
	for <lists+alsa-devel@lfdr.de>; Sun,  3 Jul 2022 16:36:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F178416FF;
	Sun,  3 Jul 2022 16:36:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F178416FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656859011;
	bh=nkpPchW34EvDdWNFL8m8ydINV2xi5ujMpaIGIa4Vt2w=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=q4wgw4QWIK+6jlCtqLoJDrUJFjuxdC0pSrI45XEHq0moOleJqDxGi55JicAyBfYx2
	 piHwDh1gHchGOywTxc6t0r9Z5gDWPQLULNuvra9gts9sUOcbzJg2Le2j9CDakA/IaG
	 vmeoVC822x1lIhIXi10UJuaslhrLR8MsBWAV8tp4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5002CF80310;
	Sun,  3 Jul 2022 16:35:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 01E41F80249; Sun,  3 Jul 2022 16:35:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1DD15F80089;
 Sun,  3 Jul 2022 16:35:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1DD15F80089
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="jiGymMQ2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656858941; x=1688394941;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nkpPchW34EvDdWNFL8m8ydINV2xi5ujMpaIGIa4Vt2w=;
 b=jiGymMQ2vtqXLD4sYDV9ZlpRflaBsmk6Jwnd5Vmr85Ksy8Tp+G3hS95E
 V8CP3JQLQn/wp6pz8IC936DRDo2D6/+bc8baAbyzj7mS9rn2k9c6gC30/
 pXQzVMKUmWKZI0PcxtZor1Vlsz8YM+kG2xPnHsUH7tfWOCr9giOCyDMEI
 R0E4nm54SJTawhejS2pslxuzU/G1SQby8VYRSZvUBzUWegOuK8xZNxxG+
 Vq/08hefTkQfQ4loc/jYTFmSBVCqyngvDhpQEcmqDzNJo1PpY7aMbxx3w
 GUqsLL1wsDOXuBAKOYOK1hZS/dN9h1BYSKhaeFbNctNW1jLLX4IcBwpMV Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10396"; a="281714382"
X-IronPort-AV: E=Sophos;i="5.92,241,1650956400"; d="scan'208";a="281714382"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2022 07:35:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,241,1650956400"; d="scan'208";a="659928882"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga004.fm.intel.com with ESMTP; 03 Jul 2022 07:35:29 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id D4C4E11D; Sun,  3 Jul 2022 17:35:35 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 sound-open-firmware@alsa-project.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/1] ASoC: SOF: Intel: bdw: remove duplicating driver data
 retrieval
Date: Sun,  3 Jul 2022 17:35:33 +0300
Message-Id: <20220703143533.62173-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>
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

device_get_match_data() in ACPI case calls similar to acpi_match_device().
Hence there is no need to duplicate the call. Just assign what is in
the id->driver_data.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 sound/soc/sof/intel/bdw.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/sound/soc/sof/intel/bdw.c b/sound/soc/sof/intel/bdw.c
index 26df780c702e..346813aa3768 100644
--- a/sound/soc/sof/intel/bdw.c
+++ b/sound/soc/sof/intel/bdw.c
@@ -674,6 +674,7 @@ static int sof_broadwell_probe(struct platform_device *pdev)
 	id = acpi_match_device(dev->driver->acpi_match_table, dev);
 	if (!id)
 		return -ENODEV;
+	desc = (const struct sof_dev_desc *)id->driver_data;
 
 	ret = snd_intel_acpi_dsp_driver_probe(dev, id->id);
 	if (ret != SND_INTEL_DSP_DRIVER_ANY && ret != SND_INTEL_DSP_DRIVER_SOF) {
@@ -681,11 +682,7 @@ static int sof_broadwell_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	desc = device_get_match_data(dev);
-	if (!desc)
-		return -ENODEV;
-
-	return sof_acpi_probe(pdev, device_get_match_data(dev));
+	return sof_acpi_probe(pdev, desc);
 }
 
 /* acpi_driver definition */
-- 
2.35.1

