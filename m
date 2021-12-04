Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C10684685BD
	for <lists+alsa-devel@lfdr.de>; Sat,  4 Dec 2021 15:45:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 506C525B7;
	Sat,  4 Dec 2021 15:44:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 506C525B7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638629118;
	bh=h5+BYFRwsLPoMP4hGQqlXuZUQzGtHuyCBAbAZs5lfPI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nUCtkCAan8slWyVl4KdniNylT0cYfxtBKLF1yO9KEskXRbC/sECk0ksiDGYtP2/HI
	 JX2MO/Rsls474/LT3+LLmu6jH0BrfM39bgxLsOYz+KziNDPaacZ5sAtnNTU9RtZ3Y4
	 MUrzXFUapVC+S0OD8IzJtIYxgfeIokjpL7n4PF+8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 47ABEF8058C;
	Sat,  4 Dec 2021 15:38:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 72947F80511; Sat,  4 Dec 2021 15:38:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ECFCDF8051B
 for <alsa-devel@alsa-project.org>; Sat,  4 Dec 2021 15:37:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ECFCDF8051B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="d4JHR4e9"
Received: by mail-lf1-x133.google.com with SMTP id bi37so13836533lfb.5
 for <alsa-devel@alsa-project.org>; Sat, 04 Dec 2021 06:37:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OxcYUIueLlQa52jFEvuy/N4e/ZecehjJr4Gk4VLaFrk=;
 b=d4JHR4e9Tfq2drgPiQPOEWI/A9kfWJA+tfced71PQBHCRUEfZsydKbZhpd/5ptbv1j
 w+PGcxYbFFThWeum/lgKvwUVn+2Btl6QdzG9ojRhj3jVeqVzY7numyCvU8YBxFh1aec1
 dI7L2o2Io/20kOjxQDwxBdUbHUPOvYJChvySM6hzMlhawgNxNHI96mFcxjnLxaNezIFj
 K3UvzRePyvLb4V7bUsUKIb2PiptOuQglxAVXybFqiUWZljVUA1F0epLPeS2S13Pdcp6Z
 ooo++s9sqkOF6jKlWazC/SzHdD/295aQ54ax40XBjRNqTjb7uzDTQX/Oi8Wlf80W+P+a
 1rPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OxcYUIueLlQa52jFEvuy/N4e/ZecehjJr4Gk4VLaFrk=;
 b=1+nHuVOcL0tVSMIbo1Yze8LlA5NW2vA/ui0z9vLYp+wX9OuYNaCDTB0qtJjcXeUBb/
 anX5R9NGxBRkAenI+I9ycdiw7Jn9YNCgm8IHIRf0YDKevKc0uetLWPUClI7QwZEocvYt
 XfT5WIVwqd2qxZcjRma1ko7EQWspDg0nH3ZA/UVK9UagZvzEk9rJhOYaCbraGBl18HcK
 nCJGeqr9Q1KJ7HGVRT06I6/4aeMkU0ff4GLqzKEOa5mRT2FVZ2lznJOmJRtQBPlTkw07
 MWH+9w2/ze4YqSr2FNEYbDemC2aZnH5MqiovsoIMa46jAPfBcqNwy5xYYubcdkrrsOKY
 wXyg==
X-Gm-Message-State: AOAM531/bxB0dmV/jNpQ9+hQH9y61stN/O5/cVMRzhdMcEimgPtEmEyb
 0mZow3vOhdTV4LOi0vRtTy0=
X-Google-Smtp-Source: ABdhPJxlgKfJiD7JvMzK1OyvgCUJ5A1miPAL4icM4r9MPzx1Ky/E3f131wx20rQata12xqR1oKlQ9g==
X-Received: by 2002:a05:6512:234c:: with SMTP id
 p12mr23603437lfu.157.1638628662905; 
 Sat, 04 Dec 2021 06:37:42 -0800 (PST)
Received: from localhost.localdomain (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.gmail.com with ESMTPSA id g36sm782934lfv.16.2021.12.04.06.37.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Dec 2021 06:37:42 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Agneli <poczt@protonmail.ch>
Subject: [PATCH v4 14/22] drm/tegra: hdmi: Unwind tegra_hdmi_init() errors
Date: Sat,  4 Dec 2021 17:37:17 +0300
Message-Id: <20211204143725.31646-15-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211204143725.31646-1-digetx@gmail.com>
References: <20211204143725.31646-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 linux-tegra@vger.kernel.org
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

Add missing error unwinding to tegra_hdmi_init(), for consistency.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/tegra/hdmi.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/tegra/hdmi.c b/drivers/gpu/drm/tegra/hdmi.c
index 3242baddc5e7..cc42476fd023 100644
--- a/drivers/gpu/drm/tegra/hdmi.c
+++ b/drivers/gpu/drm/tegra/hdmi.c
@@ -1456,22 +1456,31 @@ static int tegra_hdmi_init(struct host1x_client *client)
 	if (err < 0) {
 		dev_err(client->dev, "failed to enable HDMI regulator: %d\n",
 			err);
-		return err;
+		goto output_exit;
 	}
 
 	err = regulator_enable(hdmi->pll);
 	if (err < 0) {
 		dev_err(hdmi->dev, "failed to enable PLL regulator: %d\n", err);
-		return err;
+		goto disable_hdmi;
 	}
 
 	err = regulator_enable(hdmi->vdd);
 	if (err < 0) {
 		dev_err(hdmi->dev, "failed to enable VDD regulator: %d\n", err);
-		return err;
+		goto disable_pll;
 	}
 
 	return 0;
+
+disable_pll:
+	regulator_disable(hdmi->pll);
+disable_hdmi:
+	regulator_disable(hdmi->hdmi);
+output_exit:
+	tegra_output_exit(&hdmi->output);
+
+	return err;
 }
 
 static int tegra_hdmi_exit(struct host1x_client *client)
-- 
2.33.1

