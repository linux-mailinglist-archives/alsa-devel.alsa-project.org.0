Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A1517307286
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Jan 2021 10:28:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3407B1671;
	Thu, 28 Jan 2021 10:28:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3407B1671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611826137;
	bh=HuYaL9/2IKm7y30RCRiWuIFEb9eyszpqRGbn7IJhyTQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=a53JWQqsRcRNhMl5WGdWSBL06t0DeQk2UWemcSMtWv7pEIfE0cSzJ6nvAsjx1ZtEr
	 Kj/9ydGMW/K7BHP4kW0TKM4mW5uVYxj4xwvlxXPEOEyO+Rt3G+NeEwCDAH35PKMp0X
	 YwIQMOOdEm+sOPR/dhOhoSFAFeMb8jgVs0XhXdcU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 70BBFF800BE;
	Thu, 28 Jan 2021 10:27:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D3A4AF8015B; Thu, 28 Jan 2021 10:27:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 03680F800D1
 for <alsa-devel@alsa-project.org>; Thu, 28 Jan 2021 10:27:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03680F800D1
IronPort-SDR: N6yjTy+qPXTNfuuPEEQ4Se+XusDjiJ2EeyGdQgXWVvtBg7Iyyk/ruHvIBwS/Y10fLEx3uAlsGv
 cF/hKp+pdHzQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9877"; a="199036952"
X-IronPort-AV: E=Sophos;i="5.79,382,1602572400"; d="scan'208";a="199036952"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2021 01:27:08 -0800
IronPort-SDR: A3SEkzhBaOXwyDbR/6pE245opsXnoqML38sJqCvVGYZRDNlTIukc8n/5SoViaypSP5IlNb83Ic
 KaeqhFeRXOKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,382,1602572400"; d="scan'208";a="369783810"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga002.jf.intel.com with ESMTP; 28 Jan 2021 01:27:05 -0800
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH] ASoC: SOF: Intel: hda: cancel D0i3 work during runtime suspend
Date: Thu, 28 Jan 2021 11:23:45 +0200
Message-Id: <20210128092345.1033085-1-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, kai.vehmanen@linux.intel.com,
 ranjani.sridharan@linux.intel.com
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

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

Cancel the D0i3 work during runtime suspend as no streams are
active at this point anyway.

Fixes: 63e51fd33fef("ASoC: SOF: Intel: cnl: Implement feature to support DSP D0i3 in S0")
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/intel/hda-dsp.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/sof/intel/hda-dsp.c b/sound/soc/sof/intel/hda-dsp.c
index 2b001151fe37..9e8b3e542548 100644
--- a/sound/soc/sof/intel/hda-dsp.c
+++ b/sound/soc/sof/intel/hda-dsp.c
@@ -799,11 +799,15 @@ int hda_dsp_runtime_idle(struct snd_sof_dev *sdev)
 
 int hda_dsp_runtime_suspend(struct snd_sof_dev *sdev)
 {
+	struct sof_intel_hda_dev *hda = sdev->pdata->hw_pdata;
 	const struct sof_dsp_power_state target_state = {
 		.state = SOF_DSP_PM_D3,
 	};
 	int ret;
 
+	/* cancel any attempt for DSP D0I3 */
+	cancel_delayed_work_sync(&hda->d0i3_work);
+
 	/* stop hda controller and power dsp off */
 	ret = hda_suspend(sdev, true);
 	if (ret < 0)

base-commit: e32df142359fb6f4d27977b7652549f0844aa62f
-- 
2.29.2

