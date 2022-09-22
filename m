Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E34F5E6E92
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Sep 2022 23:40:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0715A1EB;
	Thu, 22 Sep 2022 23:39:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0715A1EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663882802;
	bh=KwnRL2MpKaH7HgRcoBy2rVGaIvt9f3DiD1PNXsDJQFI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PWY7bpqNFItKfnEGEZUC06WD326TwaHrjOtSZ0KJONlqTerC9xYZ8thGhDGhvrmUO
	 eoNiKTXBhSHwh92L0misDMSrOU1yIoztdH5I66XMpOCqhjY2eD3ieasQWnh5luNhZU
	 vwzAg+Bab+h8qIH9M4cGEN525IcFlYdCwTr7k/uQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2544BF80571;
	Thu, 22 Sep 2022 23:37:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 574D0F80548; Thu, 22 Sep 2022 23:37:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 86F38F8053A
 for <alsa-devel@alsa-project.org>; Thu, 22 Sep 2022 23:37:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 86F38F8053A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="WuwWqKHz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663882621; x=1695418621;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KwnRL2MpKaH7HgRcoBy2rVGaIvt9f3DiD1PNXsDJQFI=;
 b=WuwWqKHzeocRK7FcSGYuxQOK4LpajGR3NLdgfViLiswCPxt1yERu+ZcH
 jLUVoybI3u0Nyg6zfHspLBI/5+xXFhA2Q62e8/A9VSScsabbohbMVfmyQ
 Hrji1wyNRNV6IiBrPFRxu+x+e8QsRV7oMywh35MVCYaWR3cCojtUt4/3x
 GsjNYa8zYZVxYt3YVB03mpR86NSEgqVCb0WW+CbcDy2fuqR1YcXCGES5J
 VoTpPaNFzR9ogaQoSYEaT9MLfAfuwtbY8MR6zSkZuRBxAlqVc2NYXECcn
 kEXgWfZmp/lmtCLqsG7KzEkouFeN11p2qa57Eqj6GdkFzqRjCdW49Mo5d g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10478"; a="386725796"
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; d="scan'208";a="386725796"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2022 14:36:52 -0700
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; d="scan'208";a="745550863"
Received: from jpwarner-mobl2.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.254.13.62])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2022 14:36:52 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 08/10] ASoC: SOF: Intel: HDA: use IPC version-specific ops
Date: Thu, 22 Sep 2022 14:36:42 -0700
Message-Id: <20220922213644.666315-9-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220922213644.666315-1-ranjani.sridharan@linux.intel.com>
References: <20220922213644.666315-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 Rander Wang <rander.wang@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

Use the IP-specific ops for disabling interrupts and powering down the
DSP in hda_suspend.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/hda-dsp.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dsp.c b/sound/soc/sof/intel/hda-dsp.c
index 2ab2200fc44a..3c76f843454b 100644
--- a/sound/soc/sof/intel/hda-dsp.c
+++ b/sound/soc/sof/intel/hda-dsp.c
@@ -629,10 +629,9 @@ static int hda_suspend(struct snd_sof_dev *sdev, bool runtime_suspend)
 	    sdev->fw_state == SOF_FW_BOOT_FAILED)
 		hda->skip_imr_boot = true;
 
-	hda_sdw_int_enable(sdev, false);
-
-	/* disable IPC interrupts */
-	hda_dsp_ipc_int_disable(sdev);
+	ret = chip->disable_interrupts(sdev);
+	if (ret < 0)
+		return ret;
 
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
 	hda_codec_jack_wake_enable(sdev, runtime_suspend);
@@ -641,11 +640,9 @@ static int hda_suspend(struct snd_sof_dev *sdev, bool runtime_suspend)
 	snd_hdac_ext_bus_link_power_down_all(bus);
 #endif
 
-	/* power down DSP */
-	ret = hda_dsp_core_reset_power_down(sdev, chip->host_managed_cores_mask);
+	ret = chip->power_down_dsp(sdev);
 	if (ret < 0) {
-		dev_err(sdev->dev,
-			"error: failed to power down core during suspend\n");
+		dev_err(sdev->dev, "failed to power down DSP during suspend\n");
 		return ret;
 	}
 
-- 
2.25.1

