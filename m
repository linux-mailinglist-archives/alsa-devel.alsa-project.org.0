Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 64ECB1B70CC
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Apr 2020 11:27:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F32E816C0;
	Fri, 24 Apr 2020 11:26:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F32E816C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587720440;
	bh=GBMacHd/NEVGLvQ+RJcmBIsaSVue7zcxMLV1cSPEnBE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=K3+I5XLEbO8RT2IXSo6RcPR2dmmn098I30Sr8jszvXkBjbUWo44V5eFeDc4Ya1AzZ
	 mrhANAslnY2sXfB+A0iD68Z6BfipnyQbJeoACbrc/YWrGb30Jy/oDrHtRHsrTGqB0P
	 8GVp3ozu9IgPPGpSPCeMgIhygOq0guVSbXCdPICo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 18034F80142;
	Fri, 24 Apr 2020 11:25:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C60E4F80142; Fri, 24 Apr 2020 11:25:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 31ABEF800BE
 for <alsa-devel@alsa-project.org>; Fri, 24 Apr 2020 11:25:29 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 1EB7BA003F;
 Fri, 24 Apr 2020 11:25:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 1EB7BA003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1587720329; bh=l9XMzpX6RnpoE1Olki7hk/hh+FEduAT2CidMxI9CWBs=;
 h=From:To:Cc:Subject:Date:From;
 b=tikh7Y43bW+1yC85emaX5Ewq2/4dPlNMkIx7rTFS7dcPJIo3U36slxQC13Almc9oz
 nqMt0bRoqDD77Skc6D164Ix7x6CJIJ5tecs4o9TVT7V3ms1UAUjplOSpQoUlgIAncf
 jREmwCXm1NyXVCmZ/b1EJRWXSwqzKAipnSOVd0fY=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Fri, 24 Apr 2020 11:25:24 +0200 (CEST)
From: Jaroslav Kysela <perex@perex.cz>
To: ALSA development <alsa-devel@alsa-project.org>
Subject: [PATCH] ASoC: snd-sof-intel-hda-common - add hda_model parameter and
 pass it to HDA codec driver
Date: Fri, 24 Apr 2020 11:25:20 +0200
Message-Id: <20200424092520.23989-1-perex@perex.cz>
X-Mailer: git-send-email 2.25.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>,
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

It may be useful to pass the specific model to the generic HDA codec
routines like the legacy HDA driver (snd-hda-intel) allows.
The model name "sofbus" is tricky anyway.

Original proposal: https://lore.kernel.org/alsa-devel/20191203161908.7496-1-perex@perex.cz/

Signed-off-by: Jaroslav Kysela <perex@perex.cz>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/intel/hda.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 211e91e79eae..ea0189ee8939 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -282,6 +282,10 @@ module_param_named(use_msi, hda_use_msi, bool, 0444);
 MODULE_PARM_DESC(use_msi, "SOF HDA use PCI MSI mode");
 #endif
 
+static char *hda_model;
+module_param(hda_model, charp, 0444);
+MODULE_PARM_DESC(hda_model, "Use the given HDA board model.");
+
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
 static int hda_dmic_num = -1;
 module_param_named(dmic_num, hda_dmic_num, int, 0444);
@@ -503,7 +507,7 @@ static int hda_init(struct snd_sof_dev *sdev)
 	mutex_init(&hbus->prepare_mutex);
 	hbus->pci = pci;
 	hbus->mixer_assigned = -1;
-	hbus->modelname = "sofbus";
+	hbus->modelname = hda_model;
 
 	/* initialise hdac bus */
 	bus->addr = pci_resource_start(pci, 0);
-- 
2.25.3
