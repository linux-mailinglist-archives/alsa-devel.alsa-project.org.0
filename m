Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 42909C9739
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Oct 2019 06:16:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C43B5167C;
	Thu,  3 Oct 2019 06:15:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C43B5167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570076196;
	bh=uSjKqLaManQlR7sUAiDp4zXqIZqKkWDEIFv+AujWT5M=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=RWiR5ddOM+gmMt1K0Fu78k4VJGSFjzeAEQ7/rn8t8Qyl7zmqpbD/TQVkQQ1kkVJzi
	 f1+h5Y/UjS7FjRx7gsJjNl/lCaSNKbIbCp07NrN/l0H5PcdFTfQHwqW3QDkABdfPQV
	 yJNvU6eXbKSI6Bce5TMHddmBq+yAqIWToGmS7YVM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1A936F80519;
	Thu,  3 Oct 2019 06:14:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E33CCF80506; Thu,  3 Oct 2019 06:14:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F0002F80137
 for <alsa-devel@alsa-project.org>; Thu,  3 Oct 2019 06:14:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0002F80137
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="XqXsTJWV"
Received: by mail-pf1-x443.google.com with SMTP id y72so821203pfb.12
 for <alsa-devel@alsa-project.org>; Wed, 02 Oct 2019 21:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FMBWBObY5TAg6ccjViv94lsR9vhyqh//qqXjnxybPn4=;
 b=XqXsTJWVRpZea6TA7FBFgnhTI63A2/g03nfSRRb33FkaY5eHoSUvNUKEOdIMbnpkbB
 Pecea+Q0A331rSFnGj2eJ25IBgyIygcpzhSbOdlVrje4TCo89GmFdQxR3an9e70yYyn9
 A+wMolfWeeZXTHrgo82zxfTc7I+G9zjh+5wFk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FMBWBObY5TAg6ccjViv94lsR9vhyqh//qqXjnxybPn4=;
 b=hmdt8lIv4c9rP4Ww6CfZ8cDA96/QmWBjJx32Hv4vdPoEypdBOjI374YSjfV9kxvMrE
 r/aE8OrWM4TajQgEWF9C+xr2wX/IU7Rq33S/UDA5LRkl7Fflm1uoioPtNOAgrYOhZUFH
 q2hOR8sy+FJzJYhq6abaCAPLwbUQYMOv8TYuLW/Era7BOzEh4FaUI74bgjl+z6i3RZq6
 DXCemmf3L5k66DV+xBcKX2M+Tven2sVyEVyR9ep6R8xOOXCg2sPT+Zep+aXGrfX5v6RX
 hHR9Ez5LeQ7OUHyLG13mVOb0TTAeoCvdKdl0VZyDylJ2QUhhi4+/tvvBP2TE9UaBGsRm
 yG5Q==
X-Gm-Message-State: APjAAAVGXu/eP1Vvr6zimwy/2vR1m1pooqktLGF1TosAbtvZXv8ZU6XV
 PGEtDz7kuFMvtc8ffo+AxFKmRA==
X-Google-Smtp-Source: APXvYqz6+m0BHndgOBBpcbuerLKGK0gYMwBss4tu7T/iC6fV04yrpAecbt/bgBysta04HsJtKsYn4A==
X-Received: by 2002:a63:1c09:: with SMTP id c9mr7498204pgc.347.1570076084849; 
 Wed, 02 Oct 2019 21:14:44 -0700 (PDT)
Received: from localhost ([2401:fa00:1:10:79b4:bd83:e4a5:a720])
 by smtp.gmail.com with ESMTPSA id q42sm718700pja.16.2019.10.02.21.14.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Oct 2019 21:14:44 -0700 (PDT)
From: Cheng-Yi Chiang <cychiang@chromium.org>
To: linux-kernel@vger.kernel.org
Date: Thu,  3 Oct 2019 12:14:38 +0800
Message-Id: <20191003041438.194224-1-cychiang@chromium.org>
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
Subject: [alsa-devel] [PATCH v2 RESEND] drm/bridge: dw-hdmi: Restore audio
	when setting a mode
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
 Change from v1 to v2:
  - Use audio_lock to protect audio clock.
  - Fix the patch title.

 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index aa7efd4da1c8..749d8e4c535b 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -1982,6 +1982,17 @@ static void hdmi_disable_overflow_interrupts(struct dw_hdmi *hdmi)
 		    HDMI_IH_MUTE_FC_STAT2);
 }
 
+static void dw_hdmi_audio_restore(struct dw_hdmi *hdmi)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&hdmi->audio_lock, flags);
+
+	hdmi_enable_audio_clk(hdmi, hdmi->audio_enable);
+
+	spin_unlock_irqrestore(&hdmi->audio_lock, flags);
+}
+
 static int dw_hdmi_setup(struct dw_hdmi *hdmi, struct drm_display_mode *mode)
 {
 	int ret;
@@ -2045,7 +2056,7 @@ static int dw_hdmi_setup(struct dw_hdmi *hdmi, struct drm_display_mode *mode)
 
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
