Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD6063A9D8
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Nov 2022 14:43:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E755516D2;
	Mon, 28 Nov 2022 14:43:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E755516D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669643039;
	bh=CuZgvNcaSIcLqEhNVxL+uczDhS4EM71Cxydwohy6ArE=;
	h=From:Date:Subject:To:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=K5wPyEmWDGSHuqyk+HGWfen/uYO8RkHUcNBQYgw6diwB3Q6zlz2HgictZahWSdQW7
	 vo3fH4d5uSmL9pOCTV9YCqwtmwGTBe53vJ+PPc+PaHVteoI/aylK6Es+Do5JNJ1bFE
	 BTihlmoZZ54l64NT2V5JkvdxOmA17Bs7HjVqCpVM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D1D96F800B6;
	Mon, 28 Nov 2022 14:43:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CBDB9F8024C; Mon, 28 Nov 2022 14:43:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 73B61F8016E
 for <alsa-devel@alsa-project.org>; Mon, 28 Nov 2022 14:42:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 73B61F8016E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="jEvKo4Xz"
Received: by mail-ej1-x62b.google.com with SMTP id td2so11777476ejc.5
 for <alsa-devel@alsa-project.org>; Mon, 28 Nov 2022 05:42:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8xdIjoOikGdAZKov94FlnwSjqEqsO1SC5byhX9Q9RLU=;
 b=jEvKo4Xz7BCEk5NFMOWgRBT/TrETg2qR5X6hoc/aB/wXvdRIsbpe2NAzulkGQxZrHu
 RLxjxQBfTIAxEHmK/FBOhhMItJbRKUaqD2gCLiH4qrTnyxOUpRQAAadH/5fX/rfkFySY
 ZCD3BJnuyzNHoFJOjRR5/RFZmhAM7rd9nHyvg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8xdIjoOikGdAZKov94FlnwSjqEqsO1SC5byhX9Q9RLU=;
 b=6piPYw8IwjnDp4/R+pMxoD8bXByV9kY89Ppp4oMXRDDrjg8FhRuEP6PdnH1OFLrSaM
 gtz8fSiAi7YE2HVEZYtmIKz36/ykUGq/Ahrz38IiKHZWNayXLQo7Aln/fc4g310I+BcQ
 WH/GAKegDnKCLM/LaLGTVY5rpmL3g1J61/MzKEBqHpI1wi1qaqvWLKS+GnxpD6hsz2gb
 vJzhxtNowFGUeAQQ7sMfMOdb7Yh137glNoDii4uoWW7UeuE6dgWfTVP9Xh7IggiMEOwd
 qJ39yU5HbZMC73vhZm/KwjO/oUrxzerXanGsgmr3GQe8Fr/5XxWg1GP4fbJuGHK/XjM3
 DwkQ==
X-Gm-Message-State: ANoB5pkkFQpCmGIOtvC+F9pDuMVTlMZgapFfwaQQfx4OdwV1+yJg1mXo
 AEwVOpDthK1XE+0bwFVGQG53/w==
X-Google-Smtp-Source: AA0mqf6G9vDib77cW89TEqFeVynYGAWhQXTzNKEAXZ/8an8V7OwVpUyq4BDFXkDyZblg+YlHgxqGCA==
X-Received: by 2002:a17:906:692:b0:7ad:49b8:1687 with SMTP id
 u18-20020a170906069200b007ad49b81687mr33385064ejb.407.1669642973563; 
 Mon, 28 Nov 2022 05:42:53 -0800 (PST)
Received: from alco.roam.corp.google.com (80.71.134.83.ipv4.parknet.dk.
 [80.71.134.83]) by smtp.gmail.com with ESMTPSA id
 vt4-20020a170907a60400b0073d7b876621sm4959667ejc.205.2022.11.28.05.42.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Nov 2022 05:42:53 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 28 Nov 2022 14:42:49 +0100
Subject: [PATCH v4] ALSA: core: Fix deadlock when shutdown a frozen userspace
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221127-snd-freeze-v4-0-51ca64b7f2ab@chromium.org>
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Jaroslav Kysela <perex@perex.cz>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Daniel Baluta <daniel.baluta@nxp.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>
X-Mailer: b4 0.11.0-dev-696ae
X-Developer-Signature: v=1; a=openpgp-sha256; l=3529; i=ribalda@chromium.org; 
 h=from:subject:message-id;
 bh=CuZgvNcaSIcLqEhNVxL+uczDhS4EM71Cxydwohy6ArE=; 
 b=owEBbQKS/ZANAwAKAdE30T7POsSIAcsmYgBjhLraAkpShzLacNLIjWc+7CfukKCbU2FcaQSEkkOd
 E8G3s4KJAjMEAAEKAB0WIQREDzjr+/4oCDLSsx7RN9E+zzrEiAUCY4S62gAKCRDRN9E+zzrEiGH7EA
 CNcjEMcS8oZDbadEJ0IDQyhibQPQceQUEVYKPeBv62cDgSKswxDoYu7I21X8O3OW/ETvQDNB35/q+/
 zePdiuhYJAeq1gaZ0ZIQp1gnjL9UXoYe06jde9gfB2aSfGhIhftVfaonKSf8Htyc/QMGq5D9oOZp4Q
 dYHsRJz4U/vgGfQH+jw6e9OTfOrMPK3eYsBGj5KoLFHloSVasKuWkhbUew0gkoUwQ/alk1/D2wnc3x
 +L7Hb+PaA81/r27oPmxZsAyS5j/b0a+MOZQHklYy057opBh2yFiBzxtHHVAaMkfWSDNkP1TlQb0G+k
 yGL+d1q6+Tr20HenI6fYnRlZqLSsemE71t/IDYLqaqBzw3rb5HSgOE4Rvoflp0rvehq7SbPg5a4nBV
 0xqBwSM0EhLUmkO8uelk8FP36MCIEqMgb1f2WZk1tnKow0opnWYhYxVEI+S+glbxB0M6PnIThE8v+t
 srJTQmnIL6SyHOYuPyixoYX74/acbjKa/aNBVtpVhI/9vImy2CcNVSJvs+iUfBcueS/D9bQd77BUb8
 rp84vTCAMUWPQRwbZPWXYf7XbUjWrBerTZKGq3rD6omJ6zuReFxmAHWhCtr0kk4SFFGCauSoGeN63s
 eaC7xewSghyIwwa1bFPaIqN0Hsd9ukkUo1nUInfZPdx3d5lQxv6NGnPBjCRg==
X-Developer-Key: i=ribalda@chromium.org; a=openpgp;
 fpr=9EC3BB66E2FC129A6F90B39556A0D81F9F782DA9
Cc: alsa-devel@alsa-project.org, sound-open-firmware@alsa-project.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Ricardo Ribalda <ribalda@chromium.org>
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
