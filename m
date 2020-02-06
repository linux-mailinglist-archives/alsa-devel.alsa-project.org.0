Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F1183153D88
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Feb 2020 04:20:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7D3231697;
	Thu,  6 Feb 2020 04:19:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7D3231697
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580959244;
	bh=jqzzkrQXnD4ID1h2SBOUaw6OALb+V6fimUp3bSOZHw0=;
	h=Date:In-Reply-To:References:From:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=g4NgUEhXTUBP5ibZmebffdw/OpnVHj1SBl5jhvWlPjEmGnhU3F5wwQTVMkdhK1nFG
	 TiRy0eIdmWdkYhTg40PQNA7hQvZ1pq3JAlQ53VaVV+BADZq/OwNHA0UtaCoDJnig6n
	 MveY1xJ5uWif6CMWFpXcW0ZTrMPpizgGwXqQm+vE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BCF6FF800C6;
	Thu,  6 Feb 2020 04:18:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3578CF80255; Thu,  6 Feb 2020 04:18:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com
 [IPv6:2607:f8b0:4864:20::649])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 52E7CF801DB
 for <alsa-devel@alsa-project.org>; Thu,  6 Feb 2020 04:18:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 52E7CF801DB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="t6ozdDcW"
Received: by mail-pl1-x649.google.com with SMTP id w11so2385420plp.22
 for <alsa-devel@alsa-project.org>; Wed, 05 Feb 2020 19:18:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=KEIH1qwXja/ZmU3/27elfahliyGtpPNLFM8jJAbIPe0=;
 b=t6ozdDcWXnqlycYXVvxHhOWC41qF8dQhtkxMgc3cj9ys3LWT7swok1SnhBVAqh4iIK
 8NGSfV4wb+JIYUnOBtkwGiKW7JzQK9Fbhjvr2h71WZluUnlT9W0Bgr8EhRAlKqKxDztE
 0d9+GSbN9KCNqXWGRSEM/FSn/rRn+D8W6XEcFtH27mvwDZUFKXCYgdT3hVS5EWHVu/gw
 PF+v4DFja2f+vDZtTesIeq+13RktcT/86fnEUJd6gxFj9jDTQ/A4tu/vpr5NXiqjgmwY
 sKlio/9K9cB+vXBOcyXXIYz+P3CWg0IwHwRwAVQ5UJU7ydufexjk2HoQyc1cdNCiCFN7
 DDng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=KEIH1qwXja/ZmU3/27elfahliyGtpPNLFM8jJAbIPe0=;
 b=piQ6jXOpAdgb1d+UtIoLGkOM4Dtw+muV9HKezHxV5G8O+DrrBVIpMii8F81aIJABMI
 KYkIpUL34ZqSfOgwkbEs1Db/o/lmtC18aEdP6+kE016Mu9F97twmUvus2b+LMpCKs08/
 RmtE+uq8UPgbcfv+1mKVuc2e8cpaHDe9zeR2DToW0CqP8uRcCyY4DxuUlKgajMdf/N4C
 4LYfADJmfHD/ToSqFdYauQRen7I8mrPNQmUe8vF1QT8Q4eyJ/eeP/79mjuCQBiOI+ZQ9
 ReJgTCHRyMjgQYyb7uAp2cM7W7BEKLPPi4AAZ6AYh1333yvPbKYUunHsnviOJXByoS4W
 JJZw==
X-Gm-Message-State: APjAAAXdbyB57bGIbjM7E4utROmw5+hdwp9tYEze8aUx5o4vyBFbEwZx
 jchyA6CCOmUsR68yv/cC+XD6qqVomHn3
X-Google-Smtp-Source: APXvYqwvYH4hqfpVMgHnlTJXAR9wXcKrV1aylz6TVB7wVNgSuffWm5cIKjVzB2ZMIRRMPL4bBaqkFWGwqZ2Y
X-Received: by 2002:a63:ff5c:: with SMTP id s28mr1290924pgk.196.1580959095995; 
 Wed, 05 Feb 2020 19:18:15 -0800 (PST)
Date: Thu,  6 Feb 2020 11:17:50 +0800
In-Reply-To: <20200206031752.193298-1-tzungbi@google.com>
Message-Id: <20200206102509.1.Ieba8d422486264eb7aaa3aa257620a1b0c74c6db@changeid>
Mime-Version: 1.0
References: <20200206031752.193298-1-tzungbi@google.com>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org, airlied@linux.ie, daniel@ffwll.ch
Cc: alsa-devel@alsa-project.org, cychiang@google.com, tzungbi@google.com,
 dri-devel@lists.freedesktop.org, ck.hu@mediatek.com,
 linux-mediatek@lists.infradead.org, p.zabel@pengutronix.de,
 matthias.bgg@gmail.com, dgreid@google.com,
 linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] [PATCH v2 1/3] drm/mediatek: exit earlier if failed to
	register audio driver
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

Exits earlier if register_audio_driver() returns errors.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index c79b1f855d89..23c2b0e8693d 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -1656,7 +1656,7 @@ static const struct hdmi_codec_ops mtk_hdmi_audio_codec_ops = {
 	.get_eld = mtk_hdmi_audio_get_eld,
 };
 
-static void mtk_hdmi_register_audio_driver(struct device *dev)
+static int mtk_hdmi_register_audio_driver(struct device *dev)
 {
 	struct hdmi_codec_pdata codec_data = {
 		.ops = &mtk_hdmi_audio_codec_ops,
@@ -1669,9 +1669,10 @@ static void mtk_hdmi_register_audio_driver(struct device *dev)
 					     PLATFORM_DEVID_AUTO, &codec_data,
 					     sizeof(codec_data));
 	if (IS_ERR(pdev))
-		return;
+		return PTR_ERR(pdev);
 
 	DRM_INFO("%s driver bound to HDMI\n", HDMI_CODEC_DRV_NAME);
+	return 0;
 }
 
 static int mtk_drm_hdmi_probe(struct platform_device *pdev)
@@ -1705,7 +1706,11 @@ static int mtk_drm_hdmi_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	mtk_hdmi_register_audio_driver(dev);
+	ret = mtk_hdmi_register_audio_driver(dev);
+	if (ret) {
+		dev_err(dev, "Failed to register audio driver: %d\n", ret);
+		return ret;
+	}
 
 	hdmi->bridge.funcs = &mtk_hdmi_bridge_funcs;
 	hdmi->bridge.of_node = pdev->dev.of_node;
-- 
2.25.0.341.g760bfbb309-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
