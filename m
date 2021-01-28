Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B983089C5
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Jan 2021 16:12:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0447816A4;
	Fri, 29 Jan 2021 16:11:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0447816A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611933159;
	bh=xrJQISZwXZKrUedf/6g69v7iLAZxkuy8L+AA2BAZvFU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Zlx49WOYETjahNpsGS9i/9t+lAg8aXa5gmP7VHM1pIGE4Vw8ANmiKnIkMq+k3qRK5
	 3CXRq0Jn69DPvQ17LHBTqpTdhU7F0sKfkvSVblwz4FTDb5i3wo7FZKczHbe99zL4bf
	 Kkvn7tosb5Jy6yebwHkn6KFCXDfWMb4pnW/X9gqU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D1D74F804D2;
	Fri, 29 Jan 2021 16:10:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D46B2F800F0; Thu, 28 Jan 2021 03:18:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D1A95F800F0
 for <alsa-devel@alsa-project.org>; Thu, 28 Jan 2021 03:18:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D1A95F800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="lGq5Ihuz"
Received: by mail-pg1-x541.google.com with SMTP id j2so1620395pgl.0
 for <alsa-devel@alsa-project.org>; Wed, 27 Jan 2021 18:18:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=M6xZQukm+CkMsW6GYQx3SquyaTLPH3j72H16IX2xsEM=;
 b=lGq5IhuzZfmx24uYWHzwbXwNkG0Knk79MCA+h6lkKcG9uLIBw7iHHlLcadtEXEcSNb
 ixl19ilEJTT+3kYs7bn1T3WUAKej01gtRif9Y3RV72ncmyqB/v9HXjko07yRRjLm1aK/
 p9SfPtVvp8i2ZHd7Hr575p1/Uy+rhPB9UzXKs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=M6xZQukm+CkMsW6GYQx3SquyaTLPH3j72H16IX2xsEM=;
 b=W1qOfNqu14uHvgJRpc8Ds7+4gbtAeho+oEApuYab7/azPUYG8+riFm9PEFtV0PGijB
 XphfIHo26O4UjbVafI7HJMp6Ai7KxjUaibS8cFUGzVB+jGy0kBc+2e552HYBK/TWv1JK
 L2mFUwgmSdvLtXvLZtI0YCVQjIp11wxzE+CYjuvmpFlSmL7U8uhzDd3LO3dkxMjbi1BR
 05NnqwDk3bAxvye75SsLuzA8E6n+nTd+yAl03l64bYIpZ22J50eSjGypZBgxNQnOftkh
 N3SqS2C5LmjmAzP7OLyGRkBBmmnRN6XqARZW0zJPvFXB2n/o2O7GZ6CZfR9k5EroCsoW
 9Rdg==
X-Gm-Message-State: AOAM5327Y7F6h7CWIWHmzZ94E3aW02bAUpr0QrTV+WqnDLz7s8V4mP4b
 TRFvwN4ssQfHPFvlytdBXBK0iA==
X-Google-Smtp-Source: ABdhPJxWGqd7Knme1438Y32UV4uKZqCrSWv7RwnfynJSMW2KE+AWz0H1QgoM3o5FL+QOw+6l/d/ukQ==
X-Received: by 2002:a05:6a00:15d2:b029:1b7:30c1:8495 with SMTP id
 o18-20020a056a0015d2b02901b730c18495mr13462477pfu.32.1611800281804; 
 Wed, 27 Jan 2021 18:18:01 -0800 (PST)
Received: from judyhsiao-p920.tpe.corp.google.com
 ([2401:fa00:1:10:a53b:f71a:ed56:92d8])
 by smtp.gmail.com with ESMTPSA id 101sm3162508pjo.38.2021.01.27.18.17.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jan 2021 18:18:00 -0800 (PST)
From: Judy Hsiao <judyhsiao@chromium.org>
X-Google-Original-From: Judy Hsiao <judyhsiao@google.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] drm/msm/dp: trigger unplug event in msm_dp_display_disable
Date: Thu, 28 Jan 2021 10:17:53 +0800
Message-Id: <20210128021753.2560931-1-judyhsiao@google.com>
X-Mailer: git-send-email 2.30.0.365.g02bc693789-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 29 Jan 2021 16:10:20 +0100
Cc: Taniya Das <tdas@codeaurora.org>, alsa-devel@alsa-project.org,
 Banajit Goswami <bgoswami@codeaurora.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Rohit kumar <rohitkr@codeaurora.org>, Patrick Lai <plai@codeaurora.org>,
 Andy Gross <agross@kernel.org>, dgreid@chromium.org,
 devicetree@vger.kernel.org, Judy Hsiao <judyhsiao@google.com>,
 tzungbi@chromium.org, Stephan Gerhold <stephan@gerhold.net>,
 linux-arm-msm@vger.kernel.org, swboyd@chromium.org,
 Rob Herring <robh+dt@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-arm-kernel@lists.infradead.org, dianders@chromium.org,
 cychiang@google.com, Takashi Iwai <tiwai@suse.com>,
 Mark Brown <broonie@kernel.org>,
 Srini Kandagatla <srinivas.kandagatla@linaro.org>,
 Judy Hsiao <judyhsiao@chromium.org>
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

1. Trigger the unplug event in msm_dp_display_disable() to shutdown
   audio properly.
2. Reset the completion before signal the disconnect event.

Signed-off-by: Judy Hsiao <judyhsiao@chromium.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 3bc7ed21de286..81f6794a25100 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -651,8 +651,8 @@ static int dp_hpd_unplug_handle(struct dp_display_private *dp, u32 data)
 	dp_add_event(dp, EV_DISCONNECT_PENDING_TIMEOUT, 0, DP_TIMEOUT_5_SECOND);
 
 	/* signal the disconnect event early to ensure proper teardown */
-	dp_display_handle_plugged_change(g_dp_display, false);
 	reinit_completion(&dp->audio_comp);
+	dp_display_handle_plugged_change(g_dp_display, false);
 
 	dp_catalog_hpd_config_intr(dp->catalog, DP_DP_HPD_PLUG_INT_MASK |
 					DP_DP_IRQ_HPD_INT_MASK, true);
@@ -890,6 +890,9 @@ static int dp_display_disable(struct dp_display_private *dp, u32 data)
 
 	/* wait only if audio was enabled */
 	if (dp_display->audio_enabled) {
+		/* signal the disconnect event */
+		reinit_completion(&dp->audio_comp);
+		dp_display_handle_plugged_change(dp_display, false);
 		if (!wait_for_completion_timeout(&dp->audio_comp,
 				HZ * 5))
 			DRM_ERROR("audio comp timeout\n");
-- 
2.29.2

