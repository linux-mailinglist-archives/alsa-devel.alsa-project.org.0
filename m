Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1C62179A4
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jul 2020 22:43:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7525C16B1;
	Tue,  7 Jul 2020 22:42:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7525C16B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594154614;
	bh=P4rjFq9RM450JZwexphx30vRY8KU6kk19xu6dsHURyU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hkxWLmQsB7L9gUlP+xbzP9Kdw4HHD/4i7l9TPgWaN3WrmHRwXHSt6Qh/taT6axn13
	 OliJD/cUHoUTKfdCUI1AeaR4EAMhG6SOEffeE1SlIAOl0VDX63DO+8JSibWM6r9Bg2
	 D2F1lY3YQIUNmt/q3NH2Qyu4v+AkJqH5MglHHvp8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 38F61F800DF;
	Tue,  7 Jul 2020 22:40:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9B853F80264; Tue,  7 Jul 2020 22:40:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 449B7F800DF
 for <alsa-devel@alsa-project.org>; Tue,  7 Jul 2020 22:40:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 449B7F800DF
IronPort-SDR: PWLW35csurW8Xg/fjYrN8ipkhOsgIJl/gXCm/VtmwfD1cWtFGqqmyOnwxxZ+QwNX2Ilduse3yO
 gGnxtmWNbcXQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9675"; a="149213129"
X-IronPort-AV: E=Sophos;i="5.75,325,1589266800"; d="scan'208";a="149213129"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2020 13:40:35 -0700
IronPort-SDR: dyMt0OMyL2OzWKQhBXG0BsJy/PHmYQXCxY3dKVjoAkDClhO1C2c9dL4l8ciMJjffUnJR2g6jC9
 lFjMf8eI+rrQ==
X-IronPort-AV: E=Sophos;i="5.75,325,1589266800"; d="scan'208";a="427602724"
Received: from colvinch-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.255.229.3])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2020 13:40:35 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: SOF: core: fix null-ptr-deref bug during device removal
Date: Tue,  7 Jul 2020 15:40:27 -0500
Message-Id: <20200707204027.114169-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
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

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

The DSP should be notified for device removal only if the
probe was successful. Fixes the following KASAN bug:
BUG: KASAN: null-ptr-deref in sof_ipc_tx_message+0x80/0x160 [snd_sof]

Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/core.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/sof/core.c b/sound/soc/sof/core.c
index 339c4930b0c0..adc7c37145d6 100644
--- a/sound/soc/sof/core.c
+++ b/sound/soc/sof/core.c
@@ -345,15 +345,15 @@ int snd_sof_device_remove(struct device *dev)
 	struct snd_sof_pdata *pdata = sdev->pdata;
 	int ret;
 
-	ret = snd_sof_dsp_power_down_notify(sdev);
-	if (ret < 0)
-		dev_warn(dev, "error: %d failed to prepare DSP for device removal",
-			 ret);
-
 	if (IS_ENABLED(CONFIG_SND_SOC_SOF_PROBE_WORK_QUEUE))
 		cancel_work_sync(&sdev->probe_work);
 
 	if (sdev->fw_state > SOF_FW_BOOT_NOT_STARTED) {
+		ret = snd_sof_dsp_power_down_notify(sdev);
+		if (ret < 0)
+			dev_warn(dev, "error: %d failed to prepare DSP for device removal",
+				 ret);
+
 		snd_sof_fw_unload(sdev);
 		snd_sof_ipc_free(sdev);
 		snd_sof_free_debug(sdev);
-- 
2.25.1

