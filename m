Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F22ABCF6F6
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Oct 2019 12:23:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 820751660;
	Tue,  8 Oct 2019 12:22:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 820751660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570530224;
	bh=tbkV2wZ4LdeeTD8gD4vBv9ZixKy9rCsAM/JcHRpdGhU=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=s3oB2+I6fg+rGxlS+5SpPWXgkPTVTOTdeEDlzdTE06D6U202bXgG5payUd+CYs6cK
	 po8ZyUTXEnEEKV6xcZVfZOPuzNxkGrATwzn588SYWVw56wftSaGxtj0JRZ5dBSxQLI
	 aMa+EEOU7oxa+0H/x8Q1b5bpK2qkv0oF8d9wckOU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B9874F80135;
	Tue,  8 Oct 2019 12:21:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EE17EF8038F; Tue,  8 Oct 2019 12:21:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2FE3AF80135
 for <alsa-devel@alsa-project.org>; Tue,  8 Oct 2019 12:21:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2FE3AF80135
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="cdJSJvCO"
Received: by mail-pl1-x643.google.com with SMTP id u20so8257320plq.4
 for <alsa-devel@alsa-project.org>; Tue, 08 Oct 2019 03:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GeMDvxk000kDXZOF/cVkZFJMD0gb/5P7FfXKteqfPL8=;
 b=cdJSJvCOf5lwlnvWxJxswCx6xNQ3AjanFRiUtsdswxZMfYmCMtj1PGMFewsVic258v
 Obg7GqwttJcCpt7nuw95onf8KC58807n8gbnHZJ/LRcDAza2N53eImEePNyxIg99BHpt
 Ebgr4PpV4SPUtutXxqVqDceBd9fiuEQOlx/sE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GeMDvxk000kDXZOF/cVkZFJMD0gb/5P7FfXKteqfPL8=;
 b=YN4/oi1zdhc8nsQBotSrWrSiwvJYycwt3W3+XzOveXMyJnNrsaZudZXACW/15AsDsn
 /3X3Feac334xt7Y7gHrvSj2o9VkovL6P+vVzk+HPZlTAV3oZk8+GyygGPvZnWIzGrld+
 pekN7bJ5vAAnBUHuG171XjzIiH79HwI0UEHSRcmAiTaOFBQhuZP/9O01Ny6P/n1vZhsb
 ctYXWPqYr0VBfDU8Plqb6R2hQrEA8+lhg5qLx2R++bx+/perFCKsB0g86/eLr+B5awN0
 O4mwC7+lomMUdavOtKcq5dO3yZEzlJi07Acn+hniegbxYVyV36E/Pu9NCFt3BzpcRhy2
 6eFw==
X-Gm-Message-State: APjAAAVnXAY/brS64e5/s6wXMn33h8Bu4BdduwOhM/Sn5jXBHm2K5hUB
 j0GasWcNGhFmzTUQX0WfM75Asw==
X-Google-Smtp-Source: APXvYqw2a0XI5XUbrLM3Qio4U723/Y5fi8MXrTnqZEIoVScPrqDX2SVFu2OcatshFfvpyWcA9OlBRA==
X-Received: by 2002:a17:902:7895:: with SMTP id
 q21mr33495295pll.94.1570530112854; 
 Tue, 08 Oct 2019 03:21:52 -0700 (PDT)
Received: from localhost ([2401:fa00:1:10:79b4:bd83:e4a5:a720])
 by smtp.gmail.com with ESMTPSA id b9sm15111763pfo.105.2019.10.08.03.21.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Oct 2019 03:21:52 -0700 (PDT)
From: Cheng-Yi Chiang <cychiang@chromium.org>
To: linux-kernel@vger.kernel.org
Date: Tue,  8 Oct 2019 18:21:45 +0800
Message-Id: <20191008102145.55134-1-cychiang@chromium.org>
X-Mailer: git-send-email 2.23.0.581.g78d2f28ef7-goog
MIME-Version: 1.0
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, tzungbi@chromium.org,
 alsa-devel@alsa-project.org, Jonas Karlman <jonas@kwiboo.se>,
 Neil Armstrong <narmstrong@baylibre.com>, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, Hans Verkuil <hverkuil@xs4all.nl>,
 linux-rockchip@lists.infradead.org, Russell King <rmk+kernel@armlinux.org.uk>,
 Mark Brown <broonie@kernel.org>, Daniel Kurtz <djkurtz@chromium.org>,
 Yakir Yang <ykk@rock-chips.com>, dgreid@chromium.org,
 Cheng-Yi Chiang <cychiang@chromium.org>, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Subject: [alsa-devel] [PATCH v3] drm/bridge: dw-hdmi: Restore audio when
	setting a mode
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

From: Daniel Kurtz <djkurtz@chromium.org>

When setting a new display mode, dw_hdmi_setup() calls
dw_hdmi_enable_video_path(), which disables all hdmi clocks, including
the audio clock.

We should only (re-)enable the audio clock if audio was already enabled
when setting the new mode.

Without this patch, on RK3288, there will be HDMI audio on some monitors
if i2s was played to headphone when the monitor was plugged.
ACER H277HU and ASUS PB278 are two of the monitors showing this issue.

Signed-off-by: Cheng-Yi Chiang <cychiang@chromium.org>
Signed-off-by: Daniel Kurtz <djkurtz@chromium.org>
Signed-off-by: Yakir Yang <ykk@rock-chips.com>
---
 Change from v2 to v3:
 - Remove spinlock around setting clock.

 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index a15fbf71b9d7..af060162b0af 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -2054,7 +2054,7 @@ static int dw_hdmi_setup(struct dw_hdmi *hdmi, struct drm_display_mode *mode)
 
 		/* HDMI Initialization Step E - Configure audio */
 		hdmi_clk_regenerator_update_pixel_clock(hdmi);
-		hdmi_enable_audio_clk(hdmi, true);
+		hdmi_enable_audio_clk(hdmi, hdmi->audio_enable);
 	}
 
 	/* not for DVI mode */
-- 
2.23.0.581.g78d2f28ef7-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
