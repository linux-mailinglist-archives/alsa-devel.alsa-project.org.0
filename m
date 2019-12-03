Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 01ABB11020C
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Dec 2019 17:21:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 42D011662;
	Tue,  3 Dec 2019 17:20:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 42D011662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575390076;
	bh=24GCQ0QL3wfd0ewgy+um0fDx5dd2v/pmyRClx0Ibt70=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=b3NqXQG8cu2PTXWK9MojnU2Z8QT69zruxhgV8KXz/3doUifTqEU+SMIepDNxL4al/
	 wd6aPzPPHbupfxUinpzS20caNmcNaLIc4PoxIHtRUdmORGxt1EPiv4NDX/Hc7nVlH8
	 JLquEX4+H85dY8XRQnFcdfZazse0ziLiHa3l2XSo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DD2D4F8015A;
	Tue,  3 Dec 2019 17:19:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3B011F80227; Tue,  3 Dec 2019 17:19:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2146CF800B4
 for <alsa-devel@alsa-project.org>; Tue,  3 Dec 2019 17:19:26 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 227BEA003F;
 Tue,  3 Dec 2019 17:19:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 227BEA003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1575389966; bh=wM9kSSxmnbuKDOXYaS28kItdTBjeLknkWbOpl8npTJc=;
 h=From:To:Cc:Subject:Date:From;
 b=VGLdCWCxV90wdKcnkQSaVM+KNrdM9+QSkY67yV8pnBPlAzbsQ8NIybqSQsfZXr+1B
 CJJEpIo0gvFMMYaCgI1/PV9gcP+LB/XDu3VmAtg+MSkbsgRaAFQ79yPWbGOt2wEASA
 6/IkMvzaK1ZLYgIg4oN/HaxFS2SlHPNNQ1KYbesA=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Tue,  3 Dec 2019 17:19:21 +0100 (CET)
From: Jaroslav Kysela <perex@perex.cz>
To: ALSA development <alsa-devel@alsa-project.org>
Date: Tue,  3 Dec 2019 17:19:08 +0100
Message-Id: <20191203161908.7496-1-perex@perex.cz>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH] ASoC: snd-sof-pci - add model parameter and
	pass it to HDA codec driver
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

It may be useful to pass the specific model to the generic HDA codec
routines like the legacy HDA driver (snd-hda-intel) allows.
The model name "sofbus" is tricky anyway.

Signed-off-by: Jaroslav Kysela <perex@perex.cz>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Mark Brown <broonie@kernel.org>
---
 include/sound/sof.h         | 1 +
 sound/soc/sof/intel/hda.c   | 2 +-
 sound/soc/sof/sof-pci-dev.c | 5 +++++
 3 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/include/sound/sof.h b/include/sound/sof.h
index 479101736ee0..a62686baa95d 100644
--- a/include/sound/sof.h
+++ b/include/sound/sof.h
@@ -25,6 +25,7 @@ struct snd_sof_pdata {
 	const char *drv_name;
 	const char *name;
 	const char *platform;
+	const char *modelname;
 
 	struct device *dev;
 
diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 91bd88fddac7..ccb640bacc99 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -271,7 +271,7 @@ static int hda_init(struct snd_sof_dev *sdev)
 	mutex_init(&hbus->prepare_mutex);
 	hbus->pci = pci;
 	hbus->mixer_assigned = -1;
-	hbus->modelname = "sofbus";
+	hbus->modelname = sdev->pdata->modelname;
 
 	/* initialise hdac bus */
 	bus->addr = pci_resource_start(pci, 0);
diff --git a/sound/soc/sof/sof-pci-dev.c b/sound/soc/sof/sof-pci-dev.c
index bbeffd932de7..c01ad85aad2a 100644
--- a/sound/soc/sof/sof-pci-dev.c
+++ b/sound/soc/sof/sof-pci-dev.c
@@ -34,6 +34,10 @@ static int sof_pci_debug;
 module_param_named(sof_pci_debug, sof_pci_debug, int, 0444);
 MODULE_PARM_DESC(sof_pci_debug, "SOF PCI debug options (0x0 all off)");
 
+static char *model;
+module_param(model, charp, 0444);
+MODULE_PARM_DESC(model, "Use the given HDA board model.");
+
 #define SOF_PCI_DISABLE_PM_RUNTIME BIT(0)
 
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_APOLLOLAKE)
@@ -326,6 +330,7 @@ static int sof_pci_probe(struct pci_dev *pci,
 	sof_pdata->desc = (struct sof_dev_desc *)pci_id->driver_data;
 	sof_pdata->dev = dev;
 	sof_pdata->platform = dev_name(dev);
+	sof_pdata->modelname = model;
 
 	/* alternate fw and tplg filenames ? */
 	if (fw_path)
-- 
2.20.1
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
