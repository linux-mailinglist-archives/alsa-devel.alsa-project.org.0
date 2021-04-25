Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 914B236A40E
	for <lists+alsa-devel@lfdr.de>; Sun, 25 Apr 2021 04:02:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 17E101770;
	Sun, 25 Apr 2021 04:01:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 17E101770
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1619316141;
	bh=DXGuMnRw1LlUhYTFB6qcP/VMe3OpCMIpgwr7tXm3vYo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=r6EM/XTObZWdPYnOq8l1ZIptnAqpYf4badne9TEeCppGqQC3K8/aTtZmprh/vkcWJ
	 +bYchKTXAckIow/ITZVpVaV9WGTdqCLohRVXZJpicoXlYqWCfRy8nRunS6B64d8CHO
	 FzlEwev24Pyo0gLJzGu8ubXklBamtSSKuZC5pSoM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E8A5F801ED;
	Sun, 25 Apr 2021 04:00:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8600BF800E3; Sun, 25 Apr 2021 04:00:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C02D9F800E3
 for <alsa-devel@alsa-project.org>; Sun, 25 Apr 2021 04:00:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C02D9F800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="TXA4W+j6"
Received: by mail-pj1-x1036.google.com with SMTP id
 gq23-20020a17090b1057b0290151869af68bso3186687pjb.4
 for <alsa-devel@alsa-project.org>; Sat, 24 Apr 2021 19:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=pfKEWUq+7HdZXyLv9uBgLMyTjIFIuvFO3U3TOTycvWs=;
 b=TXA4W+j6ZPgZcjznEbUBFH/sa2ePdug4fG/3ZZgIQUHaMBbgAikBel4x05+lMn6TKx
 BTwGfiEIE9CMhmw3LRHRD7MM9nRcl0CsiU9SSZX0YKUfe6+BEKugvq73PaQH/bBRG5+q
 W/QelVx/yeaSJIR+xD04abdDjKSAvPtDLHZ0MWC0jt3NkSsWIpdOTAJpkC7pAiMjLMyM
 1DH3XT6SSzdI7tZxo0adlAJuQKWcFq9jP545WOxsj2PMN3mm9NTTn6mE3dyLg0M5TUu6
 ZoX8q8epntw7ynIcY0m1xWUQrVaaettt42UkUiU2qf+x4aEzd0EkXNrTprx/s8BhT9fN
 kvVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=pfKEWUq+7HdZXyLv9uBgLMyTjIFIuvFO3U3TOTycvWs=;
 b=fpaEJ80v9umPbOM5ns//4hGvcwQQ+PlwfthOqVFBfSiFwPvajrra1xSjP7Ki6XylhF
 cLCkClOGaVMeTq+OMXkTM3YRKygjllB+EAHI0QQYz0Ss6lc78a1hEkr7tgP4MPKTNWh6
 22O4VtXeM9DxU6WWWGsZPMwq3DrBEI9ga+TPOvE5ayqbUXOmsM0w45LvpJlIUJPzrP2u
 Ilf8tHanmZI81gIgZYDpL9FhBq34+jyRVVaArgGssjEjmwLs++uX2q4nzcjAXgmJPX0N
 XTgskDClNj7cxd1BcIKoaIB//19X0TEG4Fvs60orm7D5B3LcgZIWwKrtCZD0nXbFFBwo
 GUzw==
X-Gm-Message-State: AOAM530/JiKIcwveRcmEvi+M+Msrkz7aiptv2UAQbMMv5QWP7KH4r6YU
 ymrYs1E/oFV/pT1ob4yQLmjBWQ==
X-Google-Smtp-Source: ABdhPJyLTHM+AeR2NF5iMsqOHSN/wM4K9/TwkZNXzXYcU1XACN4MG5MKrwnhNLEYGlAWcX8nSTQu3A==
X-Received: by 2002:a17:902:9b96:b029:ec:b399:8389 with SMTP id
 y22-20020a1709029b96b02900ecb3998389mr11387230plp.1.1619316034219; 
 Sat, 24 Apr 2021 19:00:34 -0700 (PDT)
Received: from localhost.localdomain (80.251.214.228.16clouds.com.
 [80.251.214.228])
 by smtp.gmail.com with ESMTPSA id f20sm8101273pgb.47.2021.04.24.19.00.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Apr 2021 19:00:33 -0700 (PDT)
From: Shawn Guo <shawn.guo@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Luis Chamberlain <mcgrof@kernel.org>
Subject: [PATCH] firmware: replace HOTPLUG with UEVENT in FW_ACTION defines
Date: Sun, 25 Apr 2021 10:00:24 +0800
Message-Id: <20210425020024.28057-1-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
Cc: alsa-devel@alsa-project.org, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-scsi@vger.kernel.org,
 James Smart <james.smart@broadcom.com>, linux-serial@vger.kernel.org,
 linux-media@vger.kernel.org, Ohad Ben-Cohen <ohad@wizery.com>,
 Dick Kennedy <dick.kennedy@broadcom.com>, Arnd Bergmann <arnd@arndb.de>,
 Mark Brown <broonie@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Kalle Valo <kvalo@codeaurora.org>, Timur Tabi <timur@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, linux-wireless@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Stuart Hayes <stuart.w.hayes@gmail.com>, dmaengine@vger.kernel.org,
 Shawn Guo <shawn.guo@linaro.org>
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

With commit 312c004d36ce ("[PATCH] driver core: replace "hotplug" by
"uevent"") already in the tree over a decade, update the name of
FW_ACTION defines to follow semantics, and reflect what the defines are
really meant for, i.e. whether or not generate user space event.

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 drivers/dma/imx-sdma.c                      |  2 +-
 drivers/media/platform/exynos4-is/fimc-is.c |  2 +-
 drivers/mfd/iqs62x.c                        |  2 +-
 drivers/misc/lattice-ecp3-config.c          |  2 +-
 drivers/net/wireless/ti/wlcore/main.c       |  2 +-
 drivers/platform/x86/dell/dell_rbu.c        |  2 +-
 drivers/remoteproc/remoteproc_core.c        |  2 +-
 drivers/scsi/lpfc/lpfc_init.c               |  2 +-
 drivers/tty/serial/ucc_uart.c               |  2 +-
 include/linux/firmware.h                    |  4 ++--
 lib/test_firmware.c                         | 10 +++++-----
 sound/soc/codecs/wm8958-dsp2.c              |  6 +++---
 12 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/dma/imx-sdma.c b/drivers/dma/imx-sdma.c
index d5590c08db51..e2b559945c11 100644
--- a/drivers/dma/imx-sdma.c
+++ b/drivers/dma/imx-sdma.c
@@ -1829,7 +1829,7 @@ static int sdma_get_firmware(struct sdma_engine *sdma,
 	int ret;
 
 	ret = request_firmware_nowait(THIS_MODULE,
-			FW_ACTION_HOTPLUG, fw_name, sdma->dev,
+			FW_ACTION_UEVENT, fw_name, sdma->dev,
 			GFP_KERNEL, sdma, sdma_load_firmware);
 
 	return ret;
diff --git a/drivers/media/platform/exynos4-is/fimc-is.c b/drivers/media/platform/exynos4-is/fimc-is.c
index 972d9601d236..8f3ba74f19f2 100644
--- a/drivers/media/platform/exynos4-is/fimc-is.c
+++ b/drivers/media/platform/exynos4-is/fimc-is.c
@@ -436,7 +436,7 @@ static void fimc_is_load_firmware(const struct firmware *fw, void *context)
 static int fimc_is_request_firmware(struct fimc_is *is, const char *fw_name)
 {
 	return request_firmware_nowait(THIS_MODULE,
-				FW_ACTION_HOTPLUG, fw_name, &is->pdev->dev,
+				FW_ACTION_UEVENT, fw_name, &is->pdev->dev,
 				GFP_KERNEL, is, fimc_is_load_firmware);
 }
 
diff --git a/drivers/mfd/iqs62x.c b/drivers/mfd/iqs62x.c
index d1fc38a78acb..9805cf191245 100644
--- a/drivers/mfd/iqs62x.c
+++ b/drivers/mfd/iqs62x.c
@@ -998,7 +998,7 @@ static int iqs62x_probe(struct i2c_client *client)
 
 	device_property_read_string(&client->dev, "firmware-name", &fw_name);
 
-	ret = request_firmware_nowait(THIS_MODULE, FW_ACTION_HOTPLUG,
+	ret = request_firmware_nowait(THIS_MODULE, FW_ACTION_UEVENT,
 				      fw_name ? : iqs62x->dev_desc->fw_name,
 				      &client->dev, GFP_KERNEL, iqs62x,
 				      iqs62x_firmware_load);
diff --git a/drivers/misc/lattice-ecp3-config.c b/drivers/misc/lattice-ecp3-config.c
index 5eaf74447ca1..0f54730c7ed5 100644
--- a/drivers/misc/lattice-ecp3-config.c
+++ b/drivers/misc/lattice-ecp3-config.c
@@ -198,7 +198,7 @@ static int lattice_ecp3_probe(struct spi_device *spi)
 	spi_set_drvdata(spi, data);
 
 	init_completion(&data->fw_loaded);
-	err = request_firmware_nowait(THIS_MODULE, FW_ACTION_HOTPLUG,
+	err = request_firmware_nowait(THIS_MODULE, FW_ACTION_UEVENT,
 				      FIRMWARE_NAME, &spi->dev,
 				      GFP_KERNEL, spi, firmware_load);
 	if (err) {
diff --git a/drivers/net/wireless/ti/wlcore/main.c b/drivers/net/wireless/ti/wlcore/main.c
index 8509b989940c..5bf15355c2b3 100644
--- a/drivers/net/wireless/ti/wlcore/main.c
+++ b/drivers/net/wireless/ti/wlcore/main.c
@@ -6784,7 +6784,7 @@ int wlcore_probe(struct wl1271 *wl, struct platform_device *pdev)
 
 	if (pdev_data->family && pdev_data->family->nvs_name) {
 		nvs_name = pdev_data->family->nvs_name;
-		ret = request_firmware_nowait(THIS_MODULE, FW_ACTION_HOTPLUG,
+		ret = request_firmware_nowait(THIS_MODULE, FW_ACTION_UEVENT,
 					      nvs_name, &pdev->dev, GFP_KERNEL,
 					      wl, wlcore_nvs_cb);
 		if (ret < 0) {
diff --git a/drivers/platform/x86/dell/dell_rbu.c b/drivers/platform/x86/dell/dell_rbu.c
index 03c3ff34bcf5..8758d717ae5c 100644
--- a/drivers/platform/x86/dell/dell_rbu.c
+++ b/drivers/platform/x86/dell/dell_rbu.c
@@ -573,7 +573,7 @@ static ssize_t image_type_write(struct file *filp, struct kobject *kobj,
 		if (!rbu_data.entry_created) {
 			spin_unlock(&rbu_data.lock);
 			req_firm_rc = request_firmware_nowait(THIS_MODULE,
-				FW_ACTION_NOHOTPLUG, "dell_rbu",
+				FW_ACTION_NOUEVENT, "dell_rbu",
 				&rbu_device->dev, GFP_KERNEL, &context,
 				callbackfn_rbu);
 			if (req_firm_rc) {
diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index ab150765d124..c3e01e95c0d2 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1628,7 +1628,7 @@ static int rproc_trigger_auto_boot(struct rproc *rproc)
 	 * We're initiating an asynchronous firmware loading, so we can
 	 * be built-in kernel code, without hanging the boot process.
 	 */
-	ret = request_firmware_nowait(THIS_MODULE, FW_ACTION_HOTPLUG,
+	ret = request_firmware_nowait(THIS_MODULE, FW_ACTION_UEVENT,
 				      rproc->firmware, &rproc->dev, GFP_KERNEL,
 				      rproc, rproc_auto_boot_callback);
 	if (ret < 0)
diff --git a/drivers/scsi/lpfc/lpfc_init.c b/drivers/scsi/lpfc/lpfc_init.c
index 71f340dd4fbd..53546b079553 100644
--- a/drivers/scsi/lpfc/lpfc_init.c
+++ b/drivers/scsi/lpfc/lpfc_init.c
@@ -13159,7 +13159,7 @@ lpfc_sli4_request_firmware_update(struct lpfc_hba *phba, uint8_t fw_upgrade)
 	snprintf(file_name, ELX_MODEL_NAME_SIZE, "%s.grp", phba->ModelName);
 
 	if (fw_upgrade == INT_FW_UPGRADE) {
-		ret = request_firmware_nowait(THIS_MODULE, FW_ACTION_HOTPLUG,
+		ret = request_firmware_nowait(THIS_MODULE, FW_ACTION_UEVENT,
 					file_name, &phba->pcidev->dev,
 					GFP_KERNEL, (void *)phba,
 					lpfc_write_firmware);
diff --git a/drivers/tty/serial/ucc_uart.c b/drivers/tty/serial/ucc_uart.c
index d6a8604157ab..e651c9aafdd0 100644
--- a/drivers/tty/serial/ucc_uart.c
+++ b/drivers/tty/serial/ucc_uart.c
@@ -1227,7 +1227,7 @@ static int soft_uart_init(struct platform_device *ofdev)
 		 * kernel, then we use it.
 		 */
 		ret = request_firmware_nowait(THIS_MODULE,
-					      FW_ACTION_HOTPLUG, filename, &ofdev->dev,
+					      FW_ACTION_UEVENT, filename, &ofdev->dev,
 					      GFP_KERNEL, &ofdev->dev, uart_firmware_cont);
 		if (ret) {
 			dev_err(&ofdev->dev,
diff --git a/include/linux/firmware.h b/include/linux/firmware.h
index 84e346ae766e..25109192cebe 100644
--- a/include/linux/firmware.h
+++ b/include/linux/firmware.h
@@ -6,8 +6,8 @@
 #include <linux/compiler.h>
 #include <linux/gfp.h>
 
-#define FW_ACTION_NOHOTPLUG 0
-#define FW_ACTION_HOTPLUG 1
+#define FW_ACTION_NOUEVENT 0
+#define FW_ACTION_UEVENT 1
 
 struct firmware {
 	size_t size;
diff --git a/lib/test_firmware.c b/lib/test_firmware.c
index b6fe89add9fe..1bccd6cd5f48 100644
--- a/lib/test_firmware.c
+++ b/lib/test_firmware.c
@@ -260,8 +260,8 @@ static ssize_t config_show(struct device *dev,
 	len += scnprintf(buf + len, PAGE_SIZE - len,
 			"send_uevent:\t\t%s\n",
 			test_fw_config->send_uevent ?
-			"FW_ACTION_HOTPLUG" :
-			"FW_ACTION_NOHOTPLUG");
+			"FW_ACTION_UEVENT" :
+			"FW_ACTION_NOUEVENT");
 	len += scnprintf(buf + len, PAGE_SIZE - len,
 			"into_buf:\t\t%s\n",
 			test_fw_config->into_buf ? "true" : "false");
@@ -729,7 +729,7 @@ static ssize_t trigger_custom_fallback_store(struct device *dev,
 	mutex_lock(&test_fw_mutex);
 	release_firmware(test_firmware);
 	test_firmware = NULL;
-	rc = request_firmware_nowait(THIS_MODULE, FW_ACTION_NOHOTPLUG, name,
+	rc = request_firmware_nowait(THIS_MODULE, FW_ACTION_NOUEVENT, name,
 				     dev, GFP_KERNEL, NULL,
 				     trigger_async_request_cb);
 	if (rc) {
@@ -938,8 +938,8 @@ ssize_t trigger_batched_requests_async_store(struct device *dev,
 	pr_info("batched loading '%s' custom fallback mechanism %u times\n",
 		test_fw_config->name, test_fw_config->num_requests);
 
-	send_uevent = test_fw_config->send_uevent ? FW_ACTION_HOTPLUG :
-		FW_ACTION_NOHOTPLUG;
+	send_uevent = test_fw_config->send_uevent ? FW_ACTION_UEVENT :
+		FW_ACTION_NOUEVENT;
 
 	for (i = 0; i < test_fw_config->num_requests; i++) {
 		req = &test_fw_config->reqs[i];
diff --git a/sound/soc/codecs/wm8958-dsp2.c b/sound/soc/codecs/wm8958-dsp2.c
index 3bce9a14f0f3..a5ea1645993b 100644
--- a/sound/soc/codecs/wm8958-dsp2.c
+++ b/sound/soc/codecs/wm8958-dsp2.c
@@ -912,13 +912,13 @@ void wm8958_dsp2_init(struct snd_soc_component *component)
 
 
 	/* We don't *require* firmware and don't want to delay boot */
-	request_firmware_nowait(THIS_MODULE, FW_ACTION_HOTPLUG,
+	request_firmware_nowait(THIS_MODULE, FW_ACTION_UEVENT,
 				"wm8958_mbc.wfw", component->dev, GFP_KERNEL,
 				component, wm8958_mbc_loaded);
-	request_firmware_nowait(THIS_MODULE, FW_ACTION_HOTPLUG,
+	request_firmware_nowait(THIS_MODULE, FW_ACTION_UEVENT,
 				"wm8958_mbc_vss.wfw", component->dev, GFP_KERNEL,
 				component, wm8958_mbc_vss_loaded);
-	request_firmware_nowait(THIS_MODULE, FW_ACTION_HOTPLUG,
+	request_firmware_nowait(THIS_MODULE, FW_ACTION_UEVENT,
 				"wm8958_enh_eq.wfw", component->dev, GFP_KERNEL,
 				component, wm8958_enh_eq_loaded);
 
-- 
2.17.1

