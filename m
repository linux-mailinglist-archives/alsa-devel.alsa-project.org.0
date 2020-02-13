Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB3315BA68
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Feb 2020 09:02:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 095A21678;
	Thu, 13 Feb 2020 09:01:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 095A21678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581580921;
	bh=k5B13PzzkWiO9aMTuA72TTi9aeTFvgEakrVAzVJOnLw=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=INil0vhYCv4cKbYxoJCYu84jQmQS5xknWThAFPUwHjYQpOXRlEKqxQUL19g32U4pr
	 Elh5AxkYyLH2Lt3wsLVfCMsXQIFgahXosn/g8vZ/VlTXyJx8Hkkc+7qJz+oE7vcbh8
	 EBOjqp6kZs/LNBpQ04Ru7lSRh+rWcUhEYTwEY5Ao=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 17549F80138;
	Thu, 13 Feb 2020 09:00:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D936FF80145; Thu, 13 Feb 2020 09:00:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x549.google.com (mail-pg1-x549.google.com
 [IPv6:2607:f8b0:4864:20::549])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C8534F80139
 for <alsa-devel@alsa-project.org>; Thu, 13 Feb 2020 09:00:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C8534F80139
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="O0GgSTgC"
Received: by mail-pg1-x549.google.com with SMTP id t17so3238613pgb.20
 for <alsa-devel@alsa-project.org>; Thu, 13 Feb 2020 00:00:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=tSlvrP4m66P1XACDCZDaP68t1HESopkE2ZYSJ/oW5Fc=;
 b=O0GgSTgCFWMe+CSNK993pV/PwzdGIXWDBR5X0/FBv+KHqZ7K9sI8OSrRkyU2JF0+bK
 a0oFchkMZ4tO5BLEk4bqnVywm6K4MRwLuT6lzun7Hb0FO7W5GmcvMELg9+zjOEAdeVkm
 bSVmoX3bkve//nZfusUDzKoQkpuWEWx2ND7zPEikUeU5mF44vV+/iie9fotkaJAoilcd
 SmTm7Pm+KaDA+TUmnOd/MFzybL1naAUfM8Ow8c9XSDEUk43pq3NJSkxA23l228OFxcqy
 yfEXmL17ZGL6KyDE/6ENhvek7IcRNXzWn+5PVtqvvkRRXWIdpkeQr63Cn+yXUn3o56i2
 joAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=tSlvrP4m66P1XACDCZDaP68t1HESopkE2ZYSJ/oW5Fc=;
 b=asrTKkzrIbZbiCcWaRJkl+E4Iam39Wat2JNowjEN+bvqZ4TaGM80Sc8YX6k9SgzhzH
 uR0VhRHbB8ZQ31bMI22LOXWjk8bGeUuQHzTxxhrCJ/vKiKa/37RRwzsRPVKlJO2WhZR4
 WAhs2u3VGPG6QH/nPMhRK6Nnvt512ULcykmHJ9+ZjCK9/KNhaOld6Gd5bxzr943Yizc+
 X/IQAq9o8PE4yvwJYUDikTQiBjrY9FQ5xdx1Ky69etk0Pmt74TuvQz3PDEsdyn6FXeL8
 fjJO+xprUef0Te0VyOQ9kZoHajAMW4utzS7JyosTbtZBBfeEFFBEsxtdm+BP4FmMREyQ
 Pn3A==
X-Gm-Message-State: APjAAAUH7tFN0uQV2+ElA42Gwl1JDuZEgHzGDCP7WhIud8YjvLtkKfor
 4aykR0udWSrESA95j47GEIoi9bc71uJL
X-Google-Smtp-Source: APXvYqzDfbbpNkunl4GqakNBCLdfvlQrA9qA9iLtF3TS+2Mot3yuBl6sVFlx4f7nIe24WVH3YWORwiVOgN12
X-Received: by 2002:a63:4305:: with SMTP id q5mr17607821pga.64.1581580811962; 
 Thu, 13 Feb 2020 00:00:11 -0800 (PST)
Date: Thu, 13 Feb 2020 15:59:57 +0800
Message-Id: <20200213153226.I477092c2f104fd589133436c3ae4590e6fc6323b@changeid>
Mime-Version: 1.0
X-Mailer: git-send-email 2.25.0.225.g125e21ebc7-goog
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org, airlied@linux.ie, daniel@ffwll.ch
Cc: alsa-devel@alsa-project.org, cychiang@google.com, tzungbi@google.com,
 dri-devel@lists.freedesktop.org, ck.hu@mediatek.com,
 linux-mediatek@lists.infradead.org, p.zabel@pengutronix.de,
 matthias.bgg@gmail.com, dgreid@google.com,
 linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] [PATCH] drm/mediatek: fix race condition for HDMI jack
	status reporting
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

hdmi_conn_detect and mtk_hdmi_audio_hook_plugged_cb would be called
by different threads.

Imaging the following calling sequence:
           Thread A                            Thread B
--------------------------------------------------------------------
mtk_hdmi_audio_hook_plugged_cb()
mtk_cec_hpd_high() -> disconnected
                                     hdmi_conn_detect()
                                     mtk_cec_hpd_high() -> connected
                                     plugged_cb(connected)
plugged_cb(disconnected)

The latest disconnected is false reported.  Makes mtk_cec_hpd_high
and plugged_cb atomic to fix.

plugged_cb and codec_dev are also in danger of race condition.  Instead
of using mutex to protect them:
- Checks NULLs first.
- Uses WRITE_ONCE() to prevent store tearing (i.e. write to plugged_cb
  after codec_dev).
- Uses codec_dev as a signal to report HDMI jack status.

Fixes: 5d3c64477392 ("drm/mediatek: support HDMI jack status reporting")

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
Previous discussion: https://patchwork.kernel.org/patch/11367625/
Previous attempt: https://patchwork.kernel.org/patch/11378413/

 drivers/gpu/drm/mediatek/mtk_hdmi.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index 03aeb73005ef..b1e5d0c538fa 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -12,6 +12,7 @@
 #include <linux/io.h>
 #include <linux/kernel.h>
 #include <linux/mfd/syscon.h>
+#include <linux/mutex.h>
 #include <linux/of_platform.h>
 #include <linux/of.h>
 #include <linux/of_gpio.h>
@@ -171,6 +172,7 @@ struct mtk_hdmi {
 	bool enabled;
 	hdmi_codec_plugged_cb plugged_cb;
 	struct device *codec_dev;
+	struct mutex update_plugged_status_lock;
 };
 
 static inline struct mtk_hdmi *hdmi_ctx_from_bridge(struct drm_bridge *b)
@@ -1199,10 +1201,13 @@ static void mtk_hdmi_clk_disable_audio(struct mtk_hdmi *hdmi)
 static enum drm_connector_status
 mtk_hdmi_update_plugged_status(struct mtk_hdmi *hdmi)
 {
-	bool connected = mtk_cec_hpd_high(hdmi->cec_dev);
+	bool connected;
 
-	if (hdmi->plugged_cb && hdmi->codec_dev)
+	mutex_lock(&hdmi->update_plugged_status_lock);
+	connected = mtk_cec_hpd_high(hdmi->cec_dev);
+	if (hdmi->codec_dev)
 		hdmi->plugged_cb(hdmi->codec_dev, connected);
+	mutex_unlock(&hdmi->update_plugged_status_lock);
 
 	return connected ?
 	       connector_status_connected : connector_status_disconnected;
@@ -1669,8 +1674,12 @@ static int mtk_hdmi_audio_hook_plugged_cb(struct device *dev, void *data,
 {
 	struct mtk_hdmi *hdmi = data;
 
-	hdmi->plugged_cb = fn;
-	hdmi->codec_dev = codec_dev;
+	if (!fn || !codec_dev)
+		return -EINVAL;
+
+	/* Use WRITE_ONCE() to prevent store tearing. */
+	WRITE_ONCE(hdmi->plugged_cb, fn);
+	WRITE_ONCE(hdmi->codec_dev, codec_dev);
 	mtk_hdmi_update_plugged_status(hdmi);
 
 	return 0;
@@ -1729,6 +1738,7 @@ static int mtk_drm_hdmi_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	mutex_init(&hdmi->update_plugged_status_lock);
 	platform_set_drvdata(pdev, hdmi);
 
 	ret = mtk_hdmi_output_init(hdmi);
-- 
2.25.0.225.g125e21ebc7-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
