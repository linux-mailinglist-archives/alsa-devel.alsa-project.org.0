Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BCD3423C18
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Oct 2021 13:10:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A3FF0836;
	Wed,  6 Oct 2021 13:09:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A3FF0836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633518620;
	bh=MNGG4egBYx4ueqAumaNV+CTyKaQIEE5N/Ja9drzwqjQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gpbR7aolTo3DcL7TqjPyYrp3ZBFm3uV2suP9NvFQ0y+bNvM/zu7oDCQ/tn9IkkhMR
	 zaX2JGzO6Xv4tsPn3TP18ILyRA6zK0jhzhKnGAQPxtR1EQFI6Ncb6Zcx/BsFSX1JSz
	 R5NDTQhWfu1gpgyzsycb+7GLzm9pLcO/B9P7ugJQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C2040F8051C;
	Wed,  6 Oct 2021 13:07:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EC39EF8051A; Wed,  6 Oct 2021 13:07:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B1590F804FB
 for <alsa-devel@alsa-project.org>; Wed,  6 Oct 2021 13:07:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B1590F804FB
X-IronPort-AV: E=McAfee;i="6200,9189,10128"; a="223366460"
X-IronPort-AV: E=Sophos;i="5.85,350,1624345200"; d="scan'208";a="223366460"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 04:07:03 -0700
X-IronPort-AV: E=Sophos;i="5.85,350,1624345200"; d="scan'208";a="439081078"
Received: from byurovit-mobl1.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.249.39.239])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 04:07:01 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com
Subject: [PATCH 09/19] ASoC: SOF: intel: hda-loader: Use
 snd_sof_dsp_dbg_dump() for DSP dump
Date: Wed,  6 Oct 2021 14:06:35 +0300
Message-Id: <20211006110645.26679-10-peter.ujfalusi@linux.intel.com>
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

Do not call directly the hda_dsp_dump(), use the generic wrapper instead
to provide consistent output.

Mark the DSP dumps as optional to not spam the kernel log with the
exception of the last dump in case the DSP fails to run.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/hda-loader.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/sound/soc/sof/intel/hda-loader.c b/sound/soc/sof/intel/hda-loader.c
index 6f4771bf9de3..d2be02dc2801 100644
--- a/sound/soc/sof/intel/hda-loader.c
+++ b/sound/soc/sof/intel/hda-loader.c
@@ -177,13 +177,19 @@ static int cl_dsp_init(struct snd_sof_dev *sdev, int stream_tag)
 			__func__);
 
 err:
-	flags = SOF_DBG_DUMP_REGS | SOF_DBG_DUMP_PCI | SOF_DBG_DUMP_MBOX;
+	flags = SOF_DBG_DUMP_REGS | SOF_DBG_DUMP_PCI | SOF_DBG_DUMP_MBOX |
+		SOF_DBG_DUMP_OPTIONAL;
 
-	/* force error log level after max boot attempts */
-	if (hda->boot_iteration == HDA_FW_BOOT_ATTEMPTS)
+	/*
+	 * after max boot attempts make sure that the dump is printed and error
+	 * log level is used
+	 */
+	if (hda->boot_iteration == HDA_FW_BOOT_ATTEMPTS) {
 		flags |= SOF_DBG_DUMP_FORCE_ERR_LEVEL;
+		flags &= ~SOF_DBG_DUMP_OPTIONAL;
+	}
 
-	hda_dsp_dump(sdev, flags);
+	snd_sof_dsp_dbg_dump(sdev, flags);
 	snd_sof_dsp_core_power_down(sdev, chip->host_managed_cores_mask);
 
 	return ret;
@@ -414,8 +420,8 @@ int hda_dsp_cl_boot_firmware(struct snd_sof_dev *sdev)
 	if (!ret) {
 		dev_dbg(sdev->dev, "Firmware download successful, booting...\n");
 	} else {
-		hda_dsp_dump(sdev, SOF_DBG_DUMP_REGS | SOF_DBG_DUMP_PCI | SOF_DBG_DUMP_MBOX |
-			     SOF_DBG_DUMP_FORCE_ERR_LEVEL);
+		snd_sof_dsp_dbg_dump(sdev, SOF_DBG_DUMP_REGS | SOF_DBG_DUMP_PCI |
+				     SOF_DBG_DUMP_MBOX | SOF_DBG_DUMP_FORCE_ERR_LEVEL);
 		dev_err(sdev->dev, "error: load fw failed ret: %d\n", ret);
 	}
 
-- 
2.33.0

