Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 147A6C2B78
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Oct 2019 03:02:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9867F1612;
	Tue,  1 Oct 2019 03:01:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9867F1612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569891746;
	bh=KFQFgnGr05okXYdBXuur7OAdDfiDgEdknxoIuBhqjXE=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XDLMhXS7O0zIeX53F7KIGlnBypo1BQ17+SPzvMrjjP8fphXF+kJIregAGomxdz/0Y
	 /p0I6OiEaLzoRPjRCb4NEfGfO6LRmT8zWj+zCSNXEMPi0/KiASGhEngaifpbUEyGqE
	 7K2MrF0W8G3XRuxcWWTcXdpypSCN8bTP897cobK8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F2DAF80391;
	Tue,  1 Oct 2019 03:00:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0B0C8F80391; Tue,  1 Oct 2019 03:00:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EE9A2F8036D
 for <alsa-devel@alsa-project.org>; Tue,  1 Oct 2019 03:00:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EE9A2F8036D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="epI3ugdy"
Received: by mail-pf1-x441.google.com with SMTP id a2so6654040pfo.10
 for <alsa-devel@alsa-project.org>; Mon, 30 Sep 2019 18:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=E6c31Z8bqLagiMFjesWQuytu80YEed1XWODDuNsW24s=;
 b=epI3ugdyCvOb4zVNWfia360x2V+v1fm0AgFUCheJyZoUPJVy8ggRSIGIk4NaAVbcs8
 glkEUdVmFN63+q25+HfwPVyF7/WpBLgRjU2E3olV+ADe28YhCAQg+TX6TAKvCx31/fjd
 mDk4bYpvHaWJVnZyiYSSnbKK3bGoR5ynIr//c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=E6c31Z8bqLagiMFjesWQuytu80YEed1XWODDuNsW24s=;
 b=sYwvOI64bmImrnfJFTyzbnkixoc8Wgqfo2wLegpQ/ohk/xxRGOALDVlQcAUytizI0Q
 tLgm/8z2HxwoSbFoa4hGpKSQpExmQPCm5Qr9tLJelpA6UMF4a+3DtJ/BClAfIl7j4ea3
 1mKBle/mSgHOB9xJVz0SUPyzIEdf3MCE2c/MMmPHCdQSzD3x0RgdgAVPpVAEe/EVsIKq
 VBi8/6Bm5bZ20aieM1DrPyI4dpdzw2hoCq/ErDoSIie1oEU6zv6ckBDyUoecuir5Say1
 R30B9VZDeQ4J8SPYoXhq+cY1eQmMlj6Bg322CeZ5SnKW8+/vZNIGSCLfT8pyuSsChJRz
 Kt0Q==
X-Gm-Message-State: APjAAAUcFQd/fLNjkj/YR22ThGmJoxpEp63x3XSQ+5wPBnOFhGwVCO2N
 QH7YerUdmQAAsCLq7O4mZ56whA==
X-Google-Smtp-Source: APXvYqxIwQ/Z/NG15bD/vJSTi2QXMxa4a8imVSlOMCNDTKdY/6Mm2LE1FlsEyH4TWT/43exPRAlWBQ==
X-Received: by 2002:a63:1950:: with SMTP id 16mr28046453pgz.213.1569891631964; 
 Mon, 30 Sep 2019 18:00:31 -0700 (PDT)
Received: from localhost ([2401:fa00:1:10:79b4:bd83:e4a5:a720])
 by smtp.gmail.com with ESMTPSA id 62sm13146047pfg.164.2019.09.30.18.00.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Sep 2019 18:00:31 -0700 (PDT)
From: Cheng-Yi Chiang <cychiang@chromium.org>
To: linux-kernel@vger.kernel.org
Date: Tue,  1 Oct 2019 09:00:20 +0800
Message-Id: <20191001010020.122134-1-cychiang@chromium.org>
X-Mailer: git-send-email 2.23.0.444.g18eeb5a265-goog
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
Subject: [alsa-devel] [PATCH] drm/bridge: dw-hdmi: Restore audio when
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
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index aa7efd4da1c8..c60e951122c9 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -1982,6 +1982,15 @@ static void hdmi_disable_overflow_interrupts(struct dw_hdmi *hdmi)
 		    HDMI_IH_MUTE_FC_STAT2);
 }
 
+static void dw_hdmi_audio_restore(struct dw_hdmi *hdmi)
+{
+	mutex_lock(&hdmi->audio_mutex);
+
+	hdmi_enable_audio_clk(hdmi, hdmi->audio_enable);
+
+	mutex_unlock(&hdmi->audio_mutex);
+}
+
 static int dw_hdmi_setup(struct dw_hdmi *hdmi, struct drm_display_mode *mode)
 {
 	int ret;
@@ -2045,7 +2054,7 @@ static int dw_hdmi_setup(struct dw_hdmi *hdmi, struct drm_display_mode *mode)
 
 		/* HDMI Initialization Step E - Configure audio */
 		hdmi_clk_regenerator_update_pixel_clock(hdmi);
-		hdmi_enable_audio_clk(hdmi, true);
+		dw_hdmi_audio_restore(hdmi);
 	}
 
 	/* not for DVI mode */
-- 
2.23.0.444.g18eeb5a265-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
