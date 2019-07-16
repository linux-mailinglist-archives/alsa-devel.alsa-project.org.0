Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F35BC6A7F5
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Jul 2019 14:01:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9442F1698;
	Tue, 16 Jul 2019 14:00:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9442F1698
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563278473;
	bh=B45SqUtMmxgl3EkC54kdqPBsar0pt1hzKhw9fDE4obE=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eCdrb4M9WEk1Tx/y9MNfwWfjrIS048Pi6gJhEvj1zjjELDtOUqnJWr9VrR8DX4d52
	 awLryjG2FWIkbBcmHXAETiA/BvWRug2+XJvc1jtEoRKM6ltwY6deeWJrgWlyG3OLN5
	 ribaGo793qIttAqPVos/YKmWeS2hGqm929654S34=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 15D65F80447;
	Tue, 16 Jul 2019 13:58:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0A4E8F80445; Tue, 16 Jul 2019 13:58:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1A6CFF803F4
 for <alsa-devel@alsa-project.org>; Tue, 16 Jul 2019 13:58:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A6CFF803F4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="aQA61TLC"
Received: by mail-pf1-x442.google.com with SMTP id c73so8996284pfb.13
 for <alsa-devel@alsa-project.org>; Tue, 16 Jul 2019 04:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Iwx8d0RGJRMbsUh5MH2Q2PhdCBXrR+QSvVmkF9EObNI=;
 b=aQA61TLCniToS5Likru1sIC54YWOnvRx7axSnnWpgtzks/Hl8axoW3VU5BVXp1Ee+E
 GrG+kW7RtexCd8nKHUgx9AI4Sz1vr1nuUrodOcC+pu6H1qsjl4d/kdreTjAb4Rq0MhwU
 dxDwdrfo4GjogYeVqxXtcPRPBukVIQHBpoTMo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Iwx8d0RGJRMbsUh5MH2Q2PhdCBXrR+QSvVmkF9EObNI=;
 b=uEkxAiUuj6EDWOGGCOjIQJPbWWDDH+Eq1FEeEuZuuWOEu3bawoTd+8AoFIFpVWmvEl
 VDIr7l/P7KVr3oHmoh6/BbW+93vVMkvP/nsGmAAPv7azBa4FQI6ez5/HfM2l+lPEA4Wh
 3deuqlvPxoIzuVkl9drhJGPSflUj+LZZKt4wF9f5waZPHzBZT2+a0QziL7RuGyoKf/bN
 Z4IHN3529NfeqMQmDQvT9k4tsE/1T7OXKizwTaJPWTPBcms8pA3hR7jzXKDvbekjyrDK
 0sqmBK9lpNNZpJsGYFFaLpYKEAqS21R4CcuY/j1nbMFoM4EhEr5ZGgz1qUhktMK2XYu6
 QYdQ==
X-Gm-Message-State: APjAAAXwvcrYI8LPZ+d7PZ0fEQHOXGbJHN5zZincRcFgE9ZFZs26xM4n
 sN0YYphMDVepaBG6jO0B9LYUxg==
X-Google-Smtp-Source: APXvYqy0weNkbZt4Hdxvqkz5Ox5mO/XYQPfxZE09Uq5wBCB1mS8+9Xf46+LJbAMKVfmKhHRqH1zqTw==
X-Received: by 2002:a17:90a:cb18:: with SMTP id
 z24mr34623260pjt.108.1563278279412; 
 Tue, 16 Jul 2019 04:57:59 -0700 (PDT)
Received: from localhost ([2401:fa00:1:b:e688:dfd2:a1a7:2956])
 by smtp.gmail.com with ESMTPSA id x24sm19436499pgl.84.2019.07.16.04.57.55
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 16 Jul 2019 04:57:58 -0700 (PDT)
From: Cheng-Yi Chiang <cychiang@chromium.org>
To: linux-kernel@vger.kernel.org
Date: Tue, 16 Jul 2019 19:57:23 +0800
Message-Id: <20190716115725.66558-4-cychiang@chromium.org>
X-Mailer: git-send-email 2.22.0.510.g264f2c817a-goog
In-Reply-To: <20190716115725.66558-1-cychiang@chromium.org>
References: <20190716115725.66558-1-cychiang@chromium.org>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, dianders@chromium.org,
 Heiko Stuebner <heiko@sntech.de>, linux-rockchip@lists.infradead.org,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 tzungbi@chromium.org, Hans Verkuil <hverkuil@xs4all.nl>,
 Andrzej Hajda <a.hajda@samsung.com>, Russell King <rmk+kernel@armlinux.org.uk>,
 Mark Brown <broonie@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel@ffwll.ch>, dgreid@chromium.org,
 linux-arm-kernel@lists.infradead.org, Cheng-Yi Chiang <cychiang@chromium.org>
Subject: [alsa-devel] [PATCH v4 3/5] drm: dw-hdmi-i2s: Use fixed id for
	codec device
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

The problem of using auto ID is that the device name will be like
hdmi-audio-codec.<id number>.auto.

The number might be changed when there are other platform devices being
created before hdmi-audio-codec device.
Use a fixed name so machine driver can set codec name on the DAI link.

Using the fixed name should be fine because there will only be one
hdmi-audio-codec device.

Fix the codec name in rockchip rk3288_hdmi_analog machine driver.

Signed-off-by: Cheng-Yi Chiang <cychiang@chromium.org>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c | 2 +-
 sound/soc/rockchip/rk3288_hdmi_analog.c             | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
index ca56783fae47..bc608f9258be 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
@@ -135,7 +135,7 @@ static int snd_dw_hdmi_probe(struct platform_device *pdev)
 
 	memset(&pdevinfo, 0, sizeof(pdevinfo));
 	pdevinfo.parent		= pdev->dev.parent;
-	pdevinfo.id		= PLATFORM_DEVID_AUTO;
+	pdevinfo.id		= PLATFORM_DEVID_NONE;
 	pdevinfo.name		= HDMI_CODEC_DRV_NAME;
 	pdevinfo.data		= &pdata;
 	pdevinfo.size_data	= sizeof(pdata);
diff --git a/sound/soc/rockchip/rk3288_hdmi_analog.c b/sound/soc/rockchip/rk3288_hdmi_analog.c
index 767700c34ee2..8286025a8747 100644
--- a/sound/soc/rockchip/rk3288_hdmi_analog.c
+++ b/sound/soc/rockchip/rk3288_hdmi_analog.c
@@ -15,6 +15,7 @@
 #include <linux/gpio.h>
 #include <linux/of_gpio.h>
 #include <sound/core.h>
+#include <sound/hdmi-codec.h>
 #include <sound/jack.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
@@ -142,7 +143,7 @@ static const struct snd_soc_ops rk_ops = {
 SND_SOC_DAILINK_DEFS(audio,
 	DAILINK_COMP_ARRAY(COMP_EMPTY()),
 	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, NULL),
-			   COMP_CODEC("hdmi-audio-codec.2.auto", "i2s-hifi")),
+			   COMP_CODEC(HDMI_CODEC_DRV_NAME, "i2s-hifi")),
 	DAILINK_COMP_ARRAY(COMP_EMPTY()));
 
 static struct snd_soc_dai_link rk_dailink = {
-- 
2.22.0.510.g264f2c817a-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
