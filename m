Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F5385F1F
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Aug 2019 12:00:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6079D1664;
	Thu,  8 Aug 2019 11:59:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6079D1664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565258446;
	bh=I5RLh6KgLGlzj3SqvoGN1mpl/zD7kMuH0uwCyRH02fQ=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=izmevIaGWRjKCUjYp4He4Swg3+HBW3PUNv7VOQHqjziam/DBdMrQn2bujQml2CjRx
	 5xx0Um0SBjvlZgAwHWEcd49P12xgrcobFib5R8xT0npaIZuJKUj4DALvcwxQwM4+wn
	 uLUMnRzGrOIuWygIFp2lGSM0Ba5HcdFMEPp2QzKg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A1AD0F805AF;
	Thu,  8 Aug 2019 11:57:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EF3A8F803F3; Thu,  8 Aug 2019 11:57:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 892E6F80534
 for <alsa-devel@alsa-project.org>; Thu,  8 Aug 2019 11:57:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 892E6F80534
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id DC0CEB5EC;
 Thu,  8 Aug 2019 09:57:18 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Thu,  8 Aug 2019 11:57:15 +0200
Message-Id: <20190808095715.29713-4-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190808095715.29713-1-tiwai@suse.de>
References: <20190808095715.29713-1-tiwai@suse.de>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Mark Brown <broonie@kernel.org>, Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Thierry Reding <thierry.reding@gmail.com>
Subject: [alsa-devel] [PATCH 3/3] ASoC: SOF: Intel: Initialize hdaudio bus
	properly
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The SOF HD-audio bus has its house-made initialization code.  It's
supposedly for making the code independent from HD-audio bus drivers.
However, this is error-prone, and above all, the SOF driver has
already dependency on HD-audio bus driver when CONFIG_SND_SOF_HDA is
set.  That is, if this Kconfig is set, there is no reason to avoid the
call to the proper bus init function.

Also, the ext_ops that is set at bus initialization can be better
handled inside sof_hda_bus_init().  We don't need to refer this
outside the bus initialization.

So this patch addresses these issues:
- sof_hda_bus_init() calls nothing but snd_hdac_ext_bus_init()
  when CONFIG_SND_SOF_HDA is set.  Otherwise some fields are
  initialized locally like before for avoiding the dependency.
- ext_ops is referred inside sof_hda_bus_init().  The ext_ops argument
  of snd_hda_bus_init() is dropped.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/sof/intel/hda-bus.c | 31 +++++++++----------------------
 sound/soc/sof/intel/hda.c     |  6 +-----
 sound/soc/sof/intel/hda.h     |  3 +--
 3 files changed, 11 insertions(+), 29 deletions(-)

diff --git a/sound/soc/sof/intel/hda-bus.c b/sound/soc/sof/intel/hda-bus.c
index 438121c70f99..0caec3a070d3 100644
--- a/sound/soc/sof/intel/hda-bus.c
+++ b/sound/soc/sof/intel/hda-bus.c
@@ -12,28 +12,26 @@
 #include "../sof-priv.h"
 #include "hda.h"
 
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
-
-static const struct hdac_bus_ops bus_ops = {
-	.command = snd_hdac_bus_send_cmd,
-	.get_response = snd_hdac_bus_get_response,
-};
-
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_AUDIO_CODEC)
+#define sof_hda_ext_ops	snd_soc_hdac_hda_get_ops()
+#else
+#define sof_hda_ext_ops	NULL
 #endif
 
 /*
  * This can be used for both with/without hda link support.
  */
-void sof_hda_bus_init(struct hdac_bus *bus, struct device *dev,
-		      const struct hdac_ext_bus_ops *ext_ops)
+void sof_hda_bus_init(struct hdac_bus *bus, struct device *dev)
 {
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
+	snd_hdac_ext_bus_init(bus, dev, NULL, sof_hda_ext_ops);
+#else /* CONFIG_SND_SOC_SOF_HDA */
 	memset(bus, 0, sizeof(*bus));
 	bus->dev = dev;
 
 	INIT_LIST_HEAD(&bus->stream_list);
 
 	bus->irq = -1;
-	bus->ext_ops = ext_ops;
 
 	/*
 	 * There is only one HDA bus atm. keep the index as 0.
@@ -42,16 +40,5 @@ void sof_hda_bus_init(struct hdac_bus *bus, struct device *dev,
 	bus->idx = 0;
 
 	spin_lock_init(&bus->reg_lock);
-
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
-	INIT_LIST_HEAD(&bus->codec_list);
-	INIT_LIST_HEAD(&bus->hlink_list);
-
-	mutex_init(&bus->cmd_mutex);
-	mutex_init(&bus->lock);
-	bus->ops = &bus_ops;
-	INIT_WORK(&bus->unsol_work, snd_hdac_bus_process_unsol_events);
-	bus->cmd_dma_state = true;
-#endif
-
+#endif /* CONFIG_SND_SOC_SOF_HDA */
 }
diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 7f665392618f..7ca27000c34d 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -236,7 +236,6 @@ static int hda_init(struct snd_sof_dev *sdev)
 {
 	struct hda_bus *hbus;
 	struct hdac_bus *bus;
-	struct hdac_ext_bus_ops *ext_ops = NULL;
 	struct pci_dev *pci = to_pci_dev(sdev->dev);
 	int ret;
 
@@ -244,10 +243,7 @@ static int hda_init(struct snd_sof_dev *sdev)
 	bus = sof_to_bus(sdev);
 
 	/* HDA bus init */
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_AUDIO_CODEC)
-	ext_ops = snd_soc_hdac_hda_get_ops();
-#endif
-	sof_hda_bus_init(bus, &pci->dev, ext_ops);
+	sof_hda_bus_init(bus, &pci->dev);
 
 	/* Workaround for a communication error on CFL (bko#199007) and CNL */
 	if (IS_CFL(pci) || IS_CNL(pci))
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index d9c17146200b..75b096050fa2 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -549,8 +549,7 @@ void hda_dsp_ctrl_stop_chip(struct snd_sof_dev *sdev);
 /*
  * HDA bus operations.
  */
-void sof_hda_bus_init(struct hdac_bus *bus, struct device *dev,
-		      const struct hdac_ext_bus_ops *ext_ops);
+void sof_hda_bus_init(struct hdac_bus *bus, struct device *dev);
 
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
 /*
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
