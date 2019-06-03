Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF6A327C3
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jun 2019 06:37:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF3AA166A;
	Mon,  3 Jun 2019 06:36:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF3AA166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559536628;
	bh=tDULDZAzo+95uqfvkmNWWSgD1/d6rI0zYo/X1VwYuW8=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ia0Kg7XUAQi+47oobVCwjkfL7f8WbwHjNhOGN2Ds+GWI5IHFvye8/Y2oACaa32WNw
	 GzM5rgmgpb4zZNmX3X5P9O03NRLhUyoFnf6Bwa79+pey9p+aSJH9hJxBBCuMQrDk/y
	 1C/Sn1iOb+q4cO49cBK76dSd4yZ+pSpdYYL1/Ym8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BFD31F89741;
	Mon,  3 Jun 2019 06:33:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 357B0F8973F; Mon,  3 Jun 2019 06:33:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 608B9F8973A
 for <alsa-devel@alsa-project.org>; Mon,  3 Jun 2019 06:33:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 608B9F8973A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="kedjugWk"
Received: by mail-pg1-x542.google.com with SMTP id 83so694219pgg.8
 for <alsa-devel@alsa-project.org>; Sun, 02 Jun 2019 21:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MaZJTXi3Kb+zP1LdC2+ckQjoA/4H+fjgGV1LvJAeRMw=;
 b=kedjugWkJGjbZv4u3cVdp4XDkL/2UujV324hi4xDMTOTYbHYPbUnOtVV/E696ygI4t
 cYwfGz01X+eBCKlr5xigVC+q17FBxGkqMRIQmN2Tb9LkEM0x9vaOqC8GKJiYJv2aslY2
 TItexnk2xcMcs/1c/Ex771hoN5UH0dq13eh48=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MaZJTXi3Kb+zP1LdC2+ckQjoA/4H+fjgGV1LvJAeRMw=;
 b=d5adP5acwCpsdcMmiMHXnmwPRqgP5PU9kCw5d/fqr6SE+wJ3uxwS6mI4TL9CADUuSo
 /PF8nFFK8jo/aF5kByUeL53oAQxlVIZqEiL+retLKPaiIqHp/31jCsQ9FjQdCglgzfG5
 GS0sJNlLuUWjhXvyyfxS1YynEB6S6u6mK+lBEJo39Bh8l+29sNBJhWpuO2Sb2b1jo7/+
 /HMHiM3j5S2KyF+Dj/bJTPzlfx4p3jKS6QPQce4NEe/lmXsYR9asdiymWxQoYeex5iTz
 u1bFon21sIDPc7wTt7SoX/iO1afAku4WF/P0E1M9fA4XizqMa4JLOLknW4+L27FSSDtX
 Uljw==
X-Gm-Message-State: APjAAAUiFv64XTk5Nse9Bl7g88o7SJocWT2/Da/CYzCmE5WTSVHraWGt
 o8EVCGrCaxDQJtaMW4VbDVg41A==
X-Google-Smtp-Source: APXvYqwQPHtm3t6nVseAhWV9BUbWtxWUQBMFPxBiyn3rh2KIclbVwhWbmFhQyEfEQ9mmHbprMFiaUg==
X-Received: by 2002:a17:90a:a789:: with SMTP id
 f9mr27039120pjq.20.1559536424466; 
 Sun, 02 Jun 2019 21:33:44 -0700 (PDT)
Received: from localhost ([2401:fa00:1:b:e688:dfd2:a1a7:2956])
 by smtp.gmail.com with ESMTPSA id m11sm10827627pjv.21.2019.06.02.21.33.40
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 02 Jun 2019 21:33:43 -0700 (PDT)
From: Cheng-Yi Chiang <cychiang@chromium.org>
To: linux-kernel@vger.kernel.org
Date: Mon,  3 Jun 2019 12:32:47 +0800
Message-Id: <20190603043251.226549-4-cychiang@chromium.org>
X-Mailer: git-send-email 2.22.0.rc1.257.g3120a18244-goog
In-Reply-To: <20190603043251.226549-1-cychiang@chromium.org>
References: <20190603043251.226549-1-cychiang@chromium.org>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, Heiko Stuebner <heiko@sntech.de>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Liam Girdwood <lgirdwood@gmail.com>, Hans Verkuil <hverkuil@xs4all.nl>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Cheng-Yi Chiang <cychiang@chromium.org>, Takashi Iwai <tiwai@suse.com>,
 linux-rockchip@lists.infradead.org, dgreid@chromium.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, tzungbi@chromium.org,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Russell King <rmk+kernel@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, dianders@chromium.org,
 Mark Brown <broonie@kernel.org>, Daniel Vetter <daniel@ffwll.ch>
Subject: [alsa-devel] [PATCH 3/7] drm/bridge/synopsys: dw-hdmi: Add HDMI
	notifier support
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

Use hdmi-notifier to notify codec driver that there is HDMI plug/unplug
event.

Signed-off-by: Cheng-Yi Chiang <cychiang@chromium.org>
---
 drivers/gpu/drm/bridge/synopsys/Kconfig   |  1 +
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 28 +++++++++++++++++++++--
 2 files changed, 27 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/Kconfig b/drivers/gpu/drm/bridge/synopsys/Kconfig
index 3cc53b44186e..43192d9d7357 100644
--- a/drivers/gpu/drm/bridge/synopsys/Kconfig
+++ b/drivers/gpu/drm/bridge/synopsys/Kconfig
@@ -3,6 +3,7 @@ config DRM_DW_HDMI
 	select DRM_KMS_HELPER
 	select REGMAP_MMIO
 	select CEC_CORE if CEC_NOTIFIER
+	select HDMI_NOTIFIERS
 
 config DRM_DW_HDMI_AHB_AUDIO
 	tristate "Synopsys Designware AHB Audio interface"
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index ab7968c8f6a2..53701921eb1f 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -17,6 +17,7 @@
 #include <linux/err.h>
 #include <linux/clk.h>
 #include <linux/hdmi.h>
+#include <linux/hdmi-notifier.h>
 #include <linux/mutex.h>
 #include <linux/of_device.h>
 #include <linux/regmap.h>
@@ -190,6 +191,7 @@ struct dw_hdmi {
 	void (*disable_audio)(struct dw_hdmi *hdmi);
 
 	struct cec_notifier *cec_notifier;
+	struct hdmi_notifier *hdmi_notifier;
 };
 
 #define HDMI_IH_PHY_STAT0_RX_SENSE \
@@ -2301,8 +2303,15 @@ static irqreturn_t dw_hdmi_irq(int irq, void *dev_id)
 	}
 
 	if (intr_stat & HDMI_IH_PHY_STAT0_HPD) {
-		dev_dbg(hdmi->dev, "EVENT=%s\n",
-			phy_int_pol & HDMI_PHY_HPD ? "plugin" : "plugout");
+		if (phy_int_pol & HDMI_PHY_HPD) {
+			dev_dbg(hdmi->dev, "EVENT=plugin\n");
+			if (hdmi->hdmi_notifier)
+				hdmi_event_connect(hdmi->hdmi_notifier);
+		} else {
+			dev_dbg(hdmi->dev, "EVENT=plugout\n");
+			if (hdmi->hdmi_notifier)
+				hdmi_event_disconnect(hdmi->hdmi_notifier);
+		}
 		if (hdmi->bridge.dev)
 			drm_helper_hpd_irq_event(hdmi->bridge.dev);
 	}
@@ -2606,6 +2615,12 @@ __dw_hdmi_probe(struct platform_device *pdev,
 		goto err_iahb;
 	}
 
+	hdmi->hdmi_notifier = hdmi_notifier_get(dev);
+	if (!hdmi->hdmi_notifier) {
+		ret = -ENOMEM;
+		goto err_iahb;
+	}
+
 	/*
 	 * To prevent overflows in HDMI_IH_FC_STAT2, set the clk regenerator
 	 * N and cts values before enabling phy
@@ -2696,6 +2711,9 @@ __dw_hdmi_probe(struct platform_device *pdev,
 	if (hdmi->cec_notifier)
 		cec_notifier_put(hdmi->cec_notifier);
 
+	if (hdmi->hdmi_notifier)
+		hdmi_notifier_put(hdmi->hdmi_notifier);
+
 	clk_disable_unprepare(hdmi->iahb_clk);
 	if (hdmi->cec_clk)
 		clk_disable_unprepare(hdmi->cec_clk);
@@ -2709,6 +2727,9 @@ __dw_hdmi_probe(struct platform_device *pdev,
 
 static void __dw_hdmi_remove(struct dw_hdmi *hdmi)
 {
+	if (hdmi->hdmi_notifier)
+		hdmi_event_disconnect(hdmi->hdmi_notifier);
+
 	if (hdmi->audio && !IS_ERR(hdmi->audio))
 		platform_device_unregister(hdmi->audio);
 	if (!IS_ERR(hdmi->cec))
@@ -2720,6 +2741,9 @@ static void __dw_hdmi_remove(struct dw_hdmi *hdmi)
 	if (hdmi->cec_notifier)
 		cec_notifier_put(hdmi->cec_notifier);
 
+	if (hdmi->hdmi_notifier)
+		hdmi_notifier_put(hdmi->hdmi_notifier);
+
 	clk_disable_unprepare(hdmi->iahb_clk);
 	clk_disable_unprepare(hdmi->isfr_clk);
 	if (hdmi->cec_clk)
-- 
2.22.0.rc1.257.g3120a18244-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
