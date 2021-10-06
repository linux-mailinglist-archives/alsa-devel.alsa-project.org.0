Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 789F5423C54
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Oct 2021 13:13:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 153519F6;
	Wed,  6 Oct 2021 13:12:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 153519F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633518822;
	bh=53A4AAjHrEqV1bYJBbWn9WK8RUcUnYK5sLIn3bcg7Yc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dOSA22SO9S63+cB3flno0KH/ozbb4S+1H80hGv/6YV1W7Yc3Cr42ScB/oi8Fxk/eD
	 WT0+gRVMXiOpWajHyCG0g9GXPtEAUhxLw+3yt1pilz/aRqh2+NqG1KZwckfrnPthMx
	 GrKat0OF9+i8wD09ARgLgCsYtGOpawzcNGRRqx+c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 07AF9F80566;
	Wed,  6 Oct 2021 13:07:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 22AA7F80563; Wed,  6 Oct 2021 13:07:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A5B5CF80516
 for <alsa-devel@alsa-project.org>; Wed,  6 Oct 2021 13:07:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A5B5CF80516
X-IronPort-AV: E=McAfee;i="6200,9189,10128"; a="223366490"
X-IronPort-AV: E=Sophos;i="5.85,350,1624345200"; d="scan'208";a="223366490"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 04:07:18 -0700
X-IronPort-AV: E=Sophos;i="5.85,350,1624345200"; d="scan'208";a="439081184"
Received: from byurovit-mobl1.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.249.39.239])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 04:07:15 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com
Subject: [PATCH 15/19] ASoC: SOF: intel: hda: Drop 'error' prefix from error
 dump functions
Date: Wed,  6 Oct 2021 14:06:41 +0300
Message-Id: <20211006110645.26679-16-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211006110645.26679-1-peter.ujfalusi@linux.intel.com>
References: <20211006110645.26679-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: guennadi.liakhovetski@linux.intel.com, alsa-devel@alsa-project.org,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com
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

Drop the 'error' prefix printed in hda_dsp_dump_ext_rom_status(),
hda_ipc_irq_dump() and hda_ipc_dump() as it gives no value to the
information we print.

The DSP and IPC dump is marked now, which makes the 'error' prefix more
redundant.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/intel/hda.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index c4dcab10e64b..2d715f48f599 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -532,7 +532,7 @@ static void hda_dsp_dump_ext_rom_status(struct snd_sof_dev *sdev, u32 flags)
 		len += snprintf(msg + len, sizeof(msg) - len, " 0x%x", value);
 	}
 
-	dev_err(sdev->dev, "error: extended rom status: %s", msg);
+	dev_err(sdev->dev, "extended rom status: %s", msg);
 
 }
 
@@ -575,12 +575,9 @@ void hda_ipc_irq_dump(struct snd_sof_dev *sdev)
 	ppsts = snd_sof_dsp_read(sdev, HDA_DSP_PP_BAR, SOF_HDA_REG_PP_PPSTS);
 	rirbsts = snd_hdac_chip_readb(bus, RIRBSTS);
 
-	dev_err(sdev->dev,
-		"error: hda irq intsts 0x%8.8x intlctl 0x%8.8x rirb %2.2x\n",
+	dev_err(sdev->dev, "hda irq intsts 0x%8.8x intlctl 0x%8.8x rirb %2.2x\n",
 		intsts, intctl, rirbsts);
-	dev_err(sdev->dev,
-		"error: dsp irq ppsts 0x%8.8x adspis 0x%8.8x\n",
-		ppsts, adspis);
+	dev_err(sdev->dev, "dsp irq ppsts 0x%8.8x adspis 0x%8.8x\n", ppsts, adspis);
 }
 
 void hda_ipc_dump(struct snd_sof_dev *sdev)
@@ -598,8 +595,7 @@ void hda_ipc_dump(struct snd_sof_dev *sdev)
 
 	/* dump the IPC regs */
 	/* TODO: parse the raw msg */
-	dev_err(sdev->dev,
-		"error: host status 0x%8.8x dsp status 0x%8.8x mask 0x%8.8x\n",
+	dev_err(sdev->dev, "host status 0x%8.8x dsp status 0x%8.8x mask 0x%8.8x\n",
 		hipcie, hipct, hipcctl);
 }
 
-- 
2.33.0

