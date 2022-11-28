Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 24DF463AA19
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Nov 2022 14:52:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B78E316F6;
	Mon, 28 Nov 2022 14:51:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B78E316F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669643563;
	bh=cBG13C+fPS/DJeUsnf0v/AEnFrjuy57sBmvYSvNH+dk=;
	h=From:Date:Subject:To:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=nhFjE4chPObSvoArACm3fasE2ajk5KCH4KUuyJ4swS0zXsVscyJKCrlTzvth7rFQW
	 NqN9xlnh4jhtS/ZlZpzGIP1FuDj0BcaVPPLMcmxqrrYoxDobjrOW+0o47/uavjLxz9
	 OWCptA6fvwwLcCbLMZzlRuJDw6AjW7NUJJ7mnkVc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B31FF804D8;
	Mon, 28 Nov 2022 14:51:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1BF5AF8027D; Mon, 28 Nov 2022 14:51:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A09E0F8024C
 for <alsa-devel@alsa-project.org>; Mon, 28 Nov 2022 14:51:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A09E0F8024C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="cqcFidLC"
Received: by mail-ej1-x634.google.com with SMTP id fy37so25891442ejc.11
 for <alsa-devel@alsa-project.org>; Mon, 28 Nov 2022 05:51:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=u0aFE9hwoiDA9DAFcyLG3BFl8PO/QcXwrWjXOf4VrKU=;
 b=cqcFidLCG7P1nRRXUrY6Wczsjq+vlOMWQBWRKAGQAJag9JhXDGCStVKjB3evQ1osTP
 5o/VWgcvkSpum0KuPN8l5n8g77R1N4Wg9LlC6r60Dlu5M/nIWhmu1So0Icm1+qXsvBmv
 lro6OCQdo1XMwWXbdPOeDa0WzWQTT/QFTFBT0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=u0aFE9hwoiDA9DAFcyLG3BFl8PO/QcXwrWjXOf4VrKU=;
 b=wp5zq5aWni/VvzeyeAEHITUXJxkmOk8pOYtAP7X5yBicfp80Rfy+GpJohulSTSM6p9
 O2K4e7iQHn5vid13Sba3iQrp4YcoGxQWgja1fGQ8VCW/MQebe2E6wr46JOH+EezDd1Qn
 qMJ5bmvF40kg/ccuzOz4DBiiQGLRneURJLeVn5K8m66qbA5rNDKo2p0HMqCMrgHUgUiI
 HUWDX2BDba/643SFrkoUmTpZ7I15L/2k1dF4/R9s9Ve9K4BBMswm30+eVtIO7zCK8CCt
 gTmyW0aVhdQijjrZWDiRgTv6WDOqBt8TZSED1MfPVk6zhnlgHYvDJygM6AVjAhKlcR7p
 1rqg==
X-Gm-Message-State: ANoB5pm4vOK7ytPHuTsmDwhRJ5p24Oaxc0cWsvvP3OIN8w8VrRAWm1Xa
 KAD8i5KgxltBv6V9QawFb9Npww==
X-Google-Smtp-Source: AA0mqf7Rmen/HaHAQVDi1zQLlrY4aMrBvWcHVRGZepkeZXRyYpvN5BIoFVuZLsusAELdX8Y6vakWTg==
X-Received: by 2002:a17:906:9e20:b0:7af:206:9327 with SMTP id
 fp32-20020a1709069e2000b007af02069327mr43793648ejc.154.1669643485755; 
 Mon, 28 Nov 2022 05:51:25 -0800 (PST)
Received: from alco.roam.corp.google.com (80.71.134.83.ipv4.parknet.dk.
 [80.71.134.83]) by smtp.gmail.com with ESMTPSA id
 p10-20020aa7cc8a000000b0045b4b67156fsm5184139edt.45.2022.11.28.05.51.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Nov 2022 05:51:25 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 28 Nov 2022 14:51:17 +0100
Subject: [PATCH v5] ASoC: SOF: Fix deadlock when shutdown a frozen userspace
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221127-snd-freeze-v5-0-4ededeb08ba0@chromium.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Daniel Baluta <daniel.baluta@nxp.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
X-Mailer: b4 0.11.0-dev-696ae
X-Developer-Signature: v=1; a=openpgp-sha256; l=3662; i=ribalda@chromium.org; 
 h=from:subject:message-id;
 bh=cBG13C+fPS/DJeUsnf0v/AEnFrjuy57sBmvYSvNH+dk=; 
 b=owEBbQKS/ZANAwAKAdE30T7POsSIAcsmYgBjhLza87LzpLuJ3ZQRnkqEP+vHTB3FYi2nW0tShU23
 chrKhb+JAjMEAAEKAB0WIQREDzjr+/4oCDLSsx7RN9E+zzrEiAUCY4S82gAKCRDRN9E+zzrEiPqyD/
 0UDRVIY44q4CF1+moNWAABqGFppwuGECc97NFAtgwaKhT8UaRwgDuN6puIQPR75vU0IHk4tf66+aG7
 yeN5RZS4XLUchnB0HBDGEatHGpPKaJjR5ZLtMDHYws9kIT30lz2nvvpPey96hYptEiT+/M2ym3s1NZ
 fIg+rOEI/5mdUY0FOI4IKTfxXuaclcgyi/qJujr/Ev6mAXZk0IEeBmlh/8cyMviVy030gihr2St+j+
 Q3QlZpTu+pgNtlCLMUHiiO5kO5DquovKi34iL9VRzzLyyhX9xK0O0t7oq0zmKLyKbsD2S8cOD13UBC
 BSC6Siw2vn1KsyHazGdNYJm3dzMtYvCVVFw+QyJNzZss+e4fS6+WEZqgVjq83Ce/Qq8FyPtmG4odSP
 cNS/T3yiF+jEtYxSk2uZ70LxHU+6/7fGezKQRO3t1fW2baKXzPWmSYBK4VsTuWbBFgWUyz2wtSaPkW
 9cO4RUuuUcwL3b4UnIhZHFMrT/eoCBhh82MKVqEkd+0yw3LysZy2QCkYMKaAgAGh2RFfS3mmURDn8A
 w4+3mRPv2CATgQtd+lwrXjjsWttGZUGAz029xaJwGEtShXy5eVlizKVfrAFMT7+sqY+g3/XFJv1/QT
 2ITQGtymEzbnlWS7JzlF9YW9YW62UKJuKlhmGRJw4yAfzqxhGMxwg7hzQ6Og==
X-Developer-Key: i=ribalda@chromium.org; a=openpgp;
 fpr=9EC3BB66E2FC129A6F90B39556A0D81F9F782DA9
Cc: alsa-devel@alsa-project.org, Ricardo Ribalda <ribalda@chromium.org>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 sound-open-firmware@alsa-project.org
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

During kexec(), the userspace is frozen. Therefore we cannot wait for it
to complete.

Avoid running snd_sof_machine_unregister during shutdown.

This fixes:

[   84.943749] Freezing user space processes ... (elapsed 0.111 seconds) done.
[  246.784446] INFO: task kexec-lite:5123 blocked for more than 122 seconds.
[  246.819035] Call Trace:
[  246.821782]  <TASK>
[  246.824186]  __schedule+0x5f9/0x1263
[  246.828231]  schedule+0x87/0xc5
[  246.831779]  snd_card_disconnect_sync+0xb5/0x127
...
[  246.889249]  snd_sof_device_shutdown+0xb4/0x150
[  246.899317]  pci_device_shutdown+0x37/0x61
[  246.903990]  device_shutdown+0x14c/0x1d6
[  246.908391]  kernel_kexec+0x45/0xb9

And:

[  246.893222] INFO: task kexec-lite:4891 blocked for more than 122 seconds.
[  246.927709] Call Trace:
[  246.930461]  <TASK>
[  246.932819]  __schedule+0x5f9/0x1263
[  246.936855]  ? fsnotify_grab_connector+0x5c/0x70
[  246.942045]  schedule+0x87/0xc5
[  246.945567]  schedule_timeout+0x49/0xf3
[  246.949877]  wait_for_completion+0x86/0xe8
[  246.954463]  snd_card_free+0x68/0x89
...
[  247.001080]  platform_device_unregister+0x12/0x35

Cc: stable@vger.kernel.org
Fixes: 83bfc7e793b5 ("ASoC: SOF: core: unregister clients and machine drivers in .shutdown")
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: Liam Girdwood <lgirdwood@gmail.com>
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
To: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: Daniel Baluta <daniel.baluta@nxp.com>
To: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>
To: Takashi Iwai <tiwai@suse.com>
Cc: sound-open-firmware@alsa-project.org
Cc: alsa-devel@alsa-project.org
Cc: linux-kernel@vger.kernel.org
---
Changes in v5:
- Edit subject prefix
- Link to v4: https://lore.kernel.org/r/20221127-snd-freeze-v4-0-51ca64b7f2ab@chromium.org

Changes in v4:
- Do not call snd_sof_machine_unregister from shutdown.
- Link to v3: https://lore.kernel.org/r/20221127-snd-freeze-v3-0-a2eda731ca14@chromium.org

Changes in v3:
- Wrap pm_freezing in a function
- Link to v2: https://lore.kernel.org/r/20221127-snd-freeze-v2-0-d8a425ea9663@chromium.org

Changes in v2:
- Only use pm_freezing if CONFIG_FREEZER 
- Link to v1: https://lore.kernel.org/r/20221127-snd-freeze-v1-0-57461a366ec2@chromium.org
---
 sound/soc/sof/core.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/sound/soc/sof/core.c b/sound/soc/sof/core.c
index 3e6141d03770..9616ba607ded 100644
--- a/sound/soc/sof/core.c
+++ b/sound/soc/sof/core.c
@@ -475,19 +475,16 @@ EXPORT_SYMBOL(snd_sof_device_remove);
 int snd_sof_device_shutdown(struct device *dev)
 {
 	struct snd_sof_dev *sdev = dev_get_drvdata(dev);
-	struct snd_sof_pdata *pdata = sdev->pdata;
 
 	if (IS_ENABLED(CONFIG_SND_SOC_SOF_PROBE_WORK_QUEUE))
 		cancel_work_sync(&sdev->probe_work);
 
 	/*
-	 * make sure clients and machine driver(s) are unregistered to force
-	 * all userspace devices to be closed prior to the DSP shutdown sequence
+	 * make sure clients are unregistered prior to the DSP shutdown
+	 * sequence.
 	 */
 	sof_unregister_clients(sdev);
 
-	snd_sof_machine_unregister(sdev, pdata);
-
 	if (sdev->fw_state == SOF_FW_BOOT_COMPLETE)
 		return snd_sof_shutdown(sdev);
 

---
base-commit: 4312098baf37ee17a8350725e6e0d0e8590252d4
change-id: 20221127-snd-freeze-1ee143228326

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>
