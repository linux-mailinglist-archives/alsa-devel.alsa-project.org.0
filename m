Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 135745899C9
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Aug 2022 11:16:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A3E9A86F;
	Thu,  4 Aug 2022 11:15:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A3E9A86F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659604560;
	bh=pCw4i5QTNJFghviN+oWSeeZr9JVrWkak+MsAuP/sZTc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fO559+CojHhYHZ7RU9e516W3x7LMa74SXAPLbF5/bvdoYwb36eesTkX7PLn79cI2e
	 Nh+Gba7wqngEGmWNJE6rgnDIpHrYvgriQZuXWPgwhXCvz0WAatvJCJC7nlwGxkN70I
	 mz7L8pRiJN+9kfvta9bWxRcGOhQwCEiTlOdilP4M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1D7ACF80543;
	Thu,  4 Aug 2022 11:14:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6E59BF80163; Thu,  4 Aug 2022 11:14:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NO_DNS_FOR_FROM,RDNS_NONE,T_SCC_BODY_TEXT_LINE,
 UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 99051F80163;
 Thu,  4 Aug 2022 11:14:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 99051F80163
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com
 header.b="GmMiPAna"
X-UUID: 9d1ef5a86ea14e8aa0b6b5304df8bfad-20220804
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=Y9Wv2teoktdqDFfXAJ2feVEm1qJ9/z0i9IA4M6W18SM=; 
 b=GmMiPAnaFyScQ5FyH8nk+b8rv9CWpvvGrLiUrc19W3R38INjn0Y89Q9UxKwYc0Et6XLviS+mm4Cs2MgLqj7eej+tv8SviL3y5C1zmKP450Ik7ntmfeqrWxh4aQ9VhpLwKL2O1RCYvyrmZR+TDc4UWRZSmrf9shoHxNZhNKpwyH8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8, REQID:8faa340a-67bc-43f1-a6cc-b167af24913d, OB:0,
 LO
 B:0,IP:0,URL:5,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:0
X-CID-META: VersionHash:0f94e32, CLOUDID:cf1d38d1-841b-4e95-ad42-8f86e18f54fc,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
 ,QS:nil,BEC:nil,COL:0
X-UUID: 9d1ef5a86ea14e8aa0b6b5304df8bfad-20220804
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw01.mediatek.com (envelope-from <chunxu.li@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1459431466; Thu, 04 Aug 2022 17:14:10 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 4 Aug 2022 17:14:09 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 4 Aug 2022 17:14:08 +0800
From: Chunxu Li <chunxu.li@mediatek.com>
To: <pierre-louis.bossart@linux.intel.com>, <peter.ujfalusi@linux.intel.com>, 
 <lgirdwood@gmail.com>, <broonie@kernel.org>,
 <angelogioacchino.delregno@collabora.com>, <daniel.baluta@nxp.com>
Subject: [PATCH 1/2] ASoC: SOF: Introduce optional callback of_machine_select
Date: Thu, 4 Aug 2022 17:13:58 +0800
Message-ID: <20220804091359.31449-2-chunxu.li@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220804091359.31449-1-chunxu.li@mediatek.com>
References: <20220804091359.31449-1-chunxu.li@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Cc: alsa-devel@alsa-project.org, Chunxu Li <chunxu.li@mediatek.com>,
 tinghan.shen@mediatek.com, linux-kernel@vger.kernel.org,
 project_global_chrome_upstream_group@mediatek.com,
 linux-mediatek@lists.infradead.org, yc.hung@mediatek.com,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org,
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

From current design in sof_machine_check and snd_sof_new_platform_drv,
the SOF can only support ACPI type machine.

1. In sof_machine_check if there is no ACPI machine exist, the function
will return -ENODEV directly, that's we don't expected if we do not
base on ACPI machine.

2. In snd_sof_new_platform_drv the component driver need a driver name
to do ignore_machine, currently the driver name is obtained from
machine->drv_name, and the type of machine is snd_soc_acpi_mach.

So we add a new function snd_sof_of_machine_select that we can pass
sof_machine_check and obtain info required by snd_sof_new_platform_drv.
this callback is optional, each machine that do not based on ACPI can
use common code implemented in sof-of-dev.c or implement their customized
specific routine.

Signed-off-by: Chunxu Li <chunxu.li@mediatek.com>
---
 include/sound/sof.h        |  2 ++
 sound/soc/sof/ops.h        |  9 +++++++++
 sound/soc/sof/pcm.c        |  8 +++++++-
 sound/soc/sof/sof-audio.c  |  7 +++++++
 sound/soc/sof/sof-of-dev.c | 23 +++++++++++++++++++++++
 sound/soc/sof/sof-of-dev.h |  8 ++++++++
 sound/soc/sof/sof-priv.h   |  1 +
 7 files changed, 57 insertions(+), 1 deletion(-)

diff --git a/include/sound/sof.h b/include/sound/sof.h
index 367dccfea7ad..341fef19e612 100644
--- a/include/sound/sof.h
+++ b/include/sound/sof.h
@@ -89,6 +89,7 @@ struct snd_sof_pdata {
 	/* machine */
 	struct platform_device *pdev_mach;
 	const struct snd_soc_acpi_mach *machine;
+	const struct snd_sof_of_mach *of_machine;
 
 	void *hw_pdata;
 
@@ -102,6 +103,7 @@ struct snd_sof_pdata {
 struct sof_dev_desc {
 	/* list of machines using this configuration */
 	struct snd_soc_acpi_mach *machines;
+	struct snd_sof_of_mach *of_machines;
 
 	/* alternate list of machines using this configuration */
 	struct snd_soc_acpi_mach *alt_machines;
diff --git a/sound/soc/sof/ops.h b/sound/soc/sof/ops.h
index 55d43adb6a29..e20720c09744 100644
--- a/sound/soc/sof/ops.h
+++ b/sound/soc/sof/ops.h
@@ -522,6 +522,15 @@ snd_sof_set_mach_params(struct snd_soc_acpi_mach *mach,
 		sof_ops(sdev)->set_mach_params(mach, sdev);
 }
 
+static inline struct snd_sof_of_mach *
+snd_sof_of_machine_select(struct snd_sof_dev *sdev)
+{
+	if (sof_ops(sdev) && sof_ops(sdev)->of_machine_select)
+		return sof_ops(sdev)->of_machine_select(sdev);
+
+	return NULL;
+}
+
 /**
  * snd_sof_dsp_register_poll_timeout - Periodically poll an address
  * until a condition is met or a timeout occurs
diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
index 6cb6a432be5e..49f7cb049f62 100644
--- a/sound/soc/sof/pcm.c
+++ b/sound/soc/sof/pcm.c
@@ -13,6 +13,7 @@
 #include <linux/pm_runtime.h>
 #include <sound/pcm_params.h>
 #include <sound/sof.h>
+#include "sof-of-dev.h"
 #include "sof-priv.h"
 #include "sof-audio.h"
 #include "sof-utils.h"
@@ -655,7 +656,12 @@ void snd_sof_new_platform_drv(struct snd_sof_dev *sdev)
 	struct snd_sof_pdata *plat_data = sdev->pdata;
 	const char *drv_name;
 
-	drv_name = plat_data->machine->drv_name;
+	if (plat_data->machine)
+		drv_name = plat_data->machine->drv_name;
+	else if (plat_data->of_machine)
+		drv_name = plat_data->of_machine->drv_name;
+	else
+		drv_name = NULL;
 
 	pd->name = "sof-audio-component";
 	pd->probe = sof_pcm_probe;
diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
index 28976098a89e..7b3c99d1b2a4 100644
--- a/sound/soc/sof/sof-audio.c
+++ b/sound/soc/sof/sof-audio.c
@@ -794,6 +794,7 @@ int sof_machine_check(struct snd_sof_dev *sdev)
 	struct snd_soc_acpi_mach *mach;
 
 	if (!IS_ENABLED(CONFIG_SND_SOC_SOF_FORCE_NOCODEC_MODE)) {
+		const struct snd_sof_of_mach *of_mach;
 
 		/* find machine */
 		mach = snd_sof_machine_select(sdev);
@@ -803,6 +804,12 @@ int sof_machine_check(struct snd_sof_dev *sdev)
 			return 0;
 		}
 
+		of_mach = snd_sof_of_machine_select(sdev);
+		if (of_mach) {
+			sof_pdata->of_machine = of_mach;
+			return 0;
+		}
+
 		if (!IS_ENABLED(CONFIG_SND_SOC_SOF_NOCODEC)) {
 			dev_err(sdev->dev, "error: no matching ASoC machine driver found -
 aborting probe\n");
 			return -ENODEV;
diff --git a/sound/soc/sof/sof-of-dev.c b/sound/soc/sof/sof-of-dev.c
index 53faeccedd4f..8df588f9349a 100644
--- a/sound/soc/sof/sof-of-dev.c
+++ b/sound/soc/sof/sof-of-dev.c
@@ -31,6 +31,29 @@ const struct dev_pm_ops sof_of_pm = {
 };
 EXPORT_SYMBOL(sof_of_pm);
 
+struct snd_sof_of_mach *sof_of_machine_select(struct snd_sof_dev *sdev)
+{
+	struct snd_sof_pdata *sof_pdata = sdev->pdata;
+	const struct sof_dev_desc *desc = sof_pdata->desc;
+	struct snd_sof_of_mach *mach = desc->of_machines;
+
+	if (!mach)
+		return NULL;
+
+	for (; mach->board; mach++) {
+		if (of_machine_is_compatible(mach->board)) {
+			sof_pdata->tplg_filename = mach->sof_tplg_filename;
+			if (mach->fw_filename)
+				sof_pdata->fw_filename = mach->fw_filename;
+
+			return mach;
+		}
+	}
+
+	return NULL;
+}
+EXPORT_SYMBOL(sof_of_machine_select);
+
 static void sof_of_probe_complete(struct device *dev)
 {
 	/* allow runtime_pm */
diff --git a/sound/soc/sof/sof-of-dev.h b/sound/soc/sof/sof-of-dev.h
index fd950a222ba4..2ab81ced139d 100644
--- a/sound/soc/sof/sof-of-dev.h
+++ b/sound/soc/sof/sof-of-dev.h
@@ -9,8 +9,16 @@
 #ifndef __SOUND_SOC_SOF_OF_H
 #define __SOUND_SOC_SOF_OF_H
 
+struct snd_sof_of_mach {
+	const char *board;
+	const char *drv_name;
+	const char *fw_filename;
+	const char *sof_tplg_filename;
+};
+
 extern const struct dev_pm_ops sof_of_pm;
 
+struct snd_sof_of_mach *sof_of_machine_select(struct snd_sof_dev *sdev);
 int sof_of_probe(struct platform_device *pdev);
 int sof_of_remove(struct platform_device *pdev);
 void sof_of_shutdown(struct platform_device *pdev);
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index 823583086279..c5ed18f99d00 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -284,6 +284,7 @@ struct snd_sof_dsp_ops {
 	void (*machine_unregister)(struct snd_sof_dev *sdev,
 				   void *pdata); /* optional */
 	struct snd_soc_acpi_mach * (*machine_select)(struct snd_sof_dev *sdev); /*
 optional */
+	struct snd_sof_of_mach * (*of_machine_select)(struct snd_sof_dev *sdev);
 /* optional */
 	void (*set_mach_params)(struct snd_soc_acpi_mach *mach,
 				struct snd_sof_dev *sdev); /* optional */
 
-- 
2.25.1

