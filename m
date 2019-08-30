Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D844AA3511
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Aug 2019 12:41:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D13B81678;
	Fri, 30 Aug 2019 12:40:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D13B81678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567161668;
	bh=UrdDrYTmo4mBFxPgEV00gU7z0C2kIWsP/mdKb62mcM8=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tGt/xDL8vQkniT0YROdvM5zyUXxdb7ukiyUhqZXClnlB5vZB82D0jDtTse+FNkghP
	 T7W2YYg4YLqEcPthc9MU1dot5zU0MF5HS3ZMJlOOJwNV39MBPBEBmklG0aMmD+CAh0
	 z6e6FobvH/zRFM0Y65hrImBSWUvrY5hr4U3iV25o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 09F12F80369;
	Fri, 30 Aug 2019 12:38:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 94D82F805F7; Fri, 30 Aug 2019 12:38:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_78,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DDEBEF80096
 for <alsa-devel@alsa-project.org>; Fri, 30 Aug 2019 12:38:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DDEBEF80096
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="hzwiPefD"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7UAcMCe099240;
 Fri, 30 Aug 2019 05:38:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1567161502;
 bh=cth5moBVr5JEg/LWscsP/TMizn2YnQ/SAS6cxHDzCcM=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=hzwiPefDtMK3hxDt+/UDY4VGcOOHGFFWMhSEiDidGiJiLtAb1jhDg08iDErO66Ssr
 LLJK7G+b0mg2/GGOzIDSi5e5aeejJq/8Wfp6bQkGMi5CvW3HfiurSL9LL02FOC5m9I
 v1LlZuWmpV+Obz3oGfcoAPmx57EKf54qeL1SjiwU=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7UAcMJH024857
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 30 Aug 2019 05:38:22 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 30
 Aug 2019 05:38:22 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 30 Aug 2019 05:38:22 -0500
Received: from feketebors.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7UAcG3a076275;
 Fri, 30 Aug 2019 05:38:21 -0500
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Date: Fri, 30 Aug 2019 13:38:39 +0300
Message-ID: <20190830103841.25128-3-peter.ujfalusi@ti.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190830103841.25128-1-peter.ujfalusi@ti.com>
References: <20190830103841.25128-1-peter.ujfalusi@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: alsa-devel@alsa-project.org, nsekhar@ti.com,
 kuninori.morimoto.gx@renesas.com
Subject: [alsa-devel] [PATCH 2/4] ASoC: ti: davinci-i2s: Move the XSYNCERR
	workaround to .prepare callback
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

Currently the driver uses snd_soc_rtdcom_lookup() in it's mcbsp_start
function to try to stop/restart the DMA as the initial XSYNCERR workaround
need to be done before the DMA is armed.

There are couple of things wrong with this:
- the driver crashes with NULL pointer dereference as the
  component->driver->ops is actually NULL
- the driver should not use snd_soc_rtdcom_lookup() in the first place
- Fiddling with DMA is never a good thing

Move the workaround handling to .prepare which is called before the DMA is
armed, so it complies with the requirements.

Reported-by (usage of snd_soc_rtdcom_lookup): Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
---
 sound/soc/ti/davinci-i2s.c | 82 ++++++++++++++++----------------------
 1 file changed, 34 insertions(+), 48 deletions(-)

diff --git a/sound/soc/ti/davinci-i2s.c b/sound/soc/ti/davinci-i2s.c
index f04d9fb5130f..d89b5c928c4d 100644
--- a/sound/soc/ti/davinci-i2s.c
+++ b/sound/soc/ti/davinci-i2s.c
@@ -187,57 +187,9 @@ static void toggle_clock(struct davinci_mcbsp_dev *dev, int playback)
 static void davinci_mcbsp_start(struct davinci_mcbsp_dev *dev,
 		struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_component *component = snd_soc_rtdcom_lookup(rtd, DRV_NAME);
 	int playback = (substream->stream == SNDRV_PCM_STREAM_PLAYBACK);
 	u32 spcr;
 	u32 mask = playback ? DAVINCI_MCBSP_SPCR_XRST : DAVINCI_MCBSP_SPCR_RRST;
-	spcr = davinci_mcbsp_read_reg(dev, DAVINCI_MCBSP_SPCR_REG);
-	if (spcr & mask) {
-		/* start off disabled */
-		davinci_mcbsp_write_reg(dev, DAVINCI_MCBSP_SPCR_REG,
-				spcr & ~mask);
-		toggle_clock(dev, playback);
-	}
-	if (dev->pcr & (DAVINCI_MCBSP_PCR_FSXM | DAVINCI_MCBSP_PCR_FSRM |
-			DAVINCI_MCBSP_PCR_CLKXM | DAVINCI_MCBSP_PCR_CLKRM)) {
-		/* Start the sample generator */
-		spcr |= DAVINCI_MCBSP_SPCR_GRST;
-		davinci_mcbsp_write_reg(dev, DAVINCI_MCBSP_SPCR_REG, spcr);
-	}
-
-	if (playback) {
-		/* Stop the DMA to avoid data loss */
-		/* while the transmitter is out of reset to handle XSYNCERR */
-		if (component->driver->ops->trigger) {
-			int ret = component->driver->ops->trigger(substream,
-				SNDRV_PCM_TRIGGER_STOP);
-			if (ret < 0)
-				printk(KERN_DEBUG "Playback DMA stop failed\n");
-		}
-
-		/* Enable the transmitter */
-		spcr = davinci_mcbsp_read_reg(dev, DAVINCI_MCBSP_SPCR_REG);
-		spcr |= DAVINCI_MCBSP_SPCR_XRST;
-		davinci_mcbsp_write_reg(dev, DAVINCI_MCBSP_SPCR_REG, spcr);
-
-		/* wait for any unexpected frame sync error to occur */
-		udelay(100);
-
-		/* Disable the transmitter to clear any outstanding XSYNCERR */
-		spcr = davinci_mcbsp_read_reg(dev, DAVINCI_MCBSP_SPCR_REG);
-		spcr &= ~DAVINCI_MCBSP_SPCR_XRST;
-		davinci_mcbsp_write_reg(dev, DAVINCI_MCBSP_SPCR_REG, spcr);
-		toggle_clock(dev, playback);
-
-		/* Restart the DMA */
-		if (component->driver->ops->trigger) {
-			int ret = component->driver->ops->trigger(substream,
-				SNDRV_PCM_TRIGGER_START);
-			if (ret < 0)
-				printk(KERN_DEBUG "Playback DMA start failed\n");
-		}
-	}
 
 	/* Enable transmitter or receiver */
 	spcr = davinci_mcbsp_read_reg(dev, DAVINCI_MCBSP_SPCR_REG);
@@ -575,7 +527,41 @@ static int davinci_i2s_prepare(struct snd_pcm_substream *substream,
 {
 	struct davinci_mcbsp_dev *dev = snd_soc_dai_get_drvdata(dai);
 	int playback = (substream->stream == SNDRV_PCM_STREAM_PLAYBACK);
+	u32 spcr;
+	u32 mask = playback ? DAVINCI_MCBSP_SPCR_XRST : DAVINCI_MCBSP_SPCR_RRST;
+
 	davinci_mcbsp_stop(dev, playback);
+
+	spcr = davinci_mcbsp_read_reg(dev, DAVINCI_MCBSP_SPCR_REG);
+	if (spcr & mask) {
+		/* start off disabled */
+		davinci_mcbsp_write_reg(dev, DAVINCI_MCBSP_SPCR_REG,
+					spcr & ~mask);
+		toggle_clock(dev, playback);
+	}
+	if (dev->pcr & (DAVINCI_MCBSP_PCR_FSXM | DAVINCI_MCBSP_PCR_FSRM |
+			DAVINCI_MCBSP_PCR_CLKXM | DAVINCI_MCBSP_PCR_CLKRM)) {
+		/* Start the sample generator */
+		spcr |= DAVINCI_MCBSP_SPCR_GRST;
+		davinci_mcbsp_write_reg(dev, DAVINCI_MCBSP_SPCR_REG, spcr);
+	}
+
+	if (playback) {
+		/* Enable the transmitter */
+		spcr = davinci_mcbsp_read_reg(dev, DAVINCI_MCBSP_SPCR_REG);
+		spcr |= DAVINCI_MCBSP_SPCR_XRST;
+		davinci_mcbsp_write_reg(dev, DAVINCI_MCBSP_SPCR_REG, spcr);
+
+		/* wait for any unexpected frame sync error to occur */
+		udelay(100);
+
+		/* Disable the transmitter to clear any outstanding XSYNCERR */
+		spcr = davinci_mcbsp_read_reg(dev, DAVINCI_MCBSP_SPCR_REG);
+		spcr &= ~DAVINCI_MCBSP_SPCR_XRST;
+		davinci_mcbsp_write_reg(dev, DAVINCI_MCBSP_SPCR_REG, spcr);
+		toggle_clock(dev, playback);
+	}
+
 	return 0;
 }
 
-- 
Peter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
