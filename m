Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 057DC76544
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Jul 2019 14:10:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 79FBD2037;
	Fri, 26 Jul 2019 14:09:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 79FBD2037
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564143033;
	bh=GuDFxS/t7TfkY1KmlsX5tVfxrhPsVgnGMCBY29qQ+Io=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HUFZOYl6m7EVsAF8Sg8unFk5pHq7btXilACQPVgWDRHAoBn3g4nkHRGkRr7r2vtfT
	 3EyeLgc9Re//0SCIk4Fa8JKOhprDnNmmRsM8cleWk/SBBqESv9oA+sm6l67la7cjdp
	 CJXgBPp1p7rSg9DNabNQ0X1QP3SyPPXvu3AJBHAk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ABFAEF80368;
	Fri, 26 Jul 2019 14:08:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CD55CF80393; Fri, 26 Jul 2019 14:08:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4EED0F800E8
 for <alsa-devel@alsa-project.org>; Fri, 26 Jul 2019 14:08:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4EED0F800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="AObi35zU"
Received: by mail-pg1-x544.google.com with SMTP id s1so18396041pgr.2
 for <alsa-devel@alsa-project.org>; Fri, 26 Jul 2019 05:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Cbwmacy9vNq4B+n0PukpHrIPl4ScNgVEPcJ32HL8owE=;
 b=AObi35zUYJig2WeybEddiDzaj/fnCxwM2Qj8U5BZrRxfR7DqT4XA6WSF7zyiUwBiqg
 7yBr/+X/fyFPhrst6RV5yT7Jak4QkmSzMlIGvboPQSv6DlB5VgLqLjkRyDrp1/cFZCE5
 paPvLI+dXkBmqIhc5bCOvjWN7Fk+X7xb919Ck=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Cbwmacy9vNq4B+n0PukpHrIPl4ScNgVEPcJ32HL8owE=;
 b=WkauUgYXr4y0ZN50F5ZWGpRCoyS/L0LV9ipKbqm252IuvBtkgDXLiSHhiOG38cVak6
 S0K5UjRLSlYVCBKKfHxBwaa8ngCeLnFHTzmsMeGUfd1N+KP5MrSjrT8xFedhrE5RnuKg
 XiWGSAZlIZbNtWJimw6lUJFmTXOtSTJ0190eiclHNvpsQ0O3/8JFe3xSBCf4fgAabXjw
 34pnrDkRzuBHq0vTeyr/Gl9eNLp3w/xdCDmNEFkZER5sXr1/rIqS69UznD6DVm9hR7ks
 Ynq+uI2VsORkOFpIfIDIffufL7bbvY3Mz8+0UYKIp/prE0dQZjKS4rRyiqnBdcWM55Qa
 w2gA==
X-Gm-Message-State: APjAAAUQMKUU4PDNajfOLFpllhnnkEia7Y5ELZgqxC8KHECYd74c6jov
 RZXzK2xQ+aUfOi99d3sVHsh/Fg==
X-Google-Smtp-Source: APXvYqz9ldY9m4MPhE5vPXUihPALYRe2GG7mFkrh7mMDn8k9KRoYh+ADGCd1vq8cRpZmJBcyhGuM9A==
X-Received: by 2002:a17:90a:bc0c:: with SMTP id
 w12mr65162344pjr.111.1564142920570; 
 Fri, 26 Jul 2019 05:08:40 -0700 (PDT)
Received: from localhost ([2401:fa00:1:b:e688:dfd2:a1a7:2956])
 by smtp.gmail.com with ESMTPSA id m20sm54800981pff.79.2019.07.26.05.08.36
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 26 Jul 2019 05:08:39 -0700 (PDT)
From: Cheng-Yi Chiang <cychiang@chromium.org>
To: linux-kernel@vger.kernel.org
Date: Fri, 26 Jul 2019 20:08:33 +0800
Message-Id: <20190726120833.186833-1-cychiang@chromium.org>
X-Mailer: git-send-email 2.22.0.709.g102302147b-goog
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, dianders@chromium.org,
 Heiko Stuebner <heiko@sntech.de>, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, tzungbi@chromium.org,
 linux-rockchip@lists.infradead.org, Mark Brown <broonie@kernel.org>,
 dgreid@chromium.org, mka@chromium.org, linux-arm-kernel@lists.infradead.org,
 Cheng-Yi Chiang <cychiang@chromium.org>
Subject: [alsa-devel] [PATCH v2] ASoC: rockchip: i2s: Revert "ASoC:
	rockchip: i2s: Support mono capture"
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

This reverts commit db51707b9c9aeedd310ebce60f15d5bb006567e0.

Commit db51707b9c9a ("ASoC: rockchip: i2s: Support mono capture")
adds support of mono capture to rockchip_i2s_dai.

However, I2S controller is still generating a 2-channel stream
because it only supports even number of channels.
When user space reads the data and assumes it is a mono stream,
the rate will be slowed down.

Revert the change so the DAI no longer claims that mono capture
is supported.

Fixes: db51707b9c9a ("ASoC: rockchip: i2s: Support mono capture")
Signed-off-by: Cheng-Yi Chiang <cychiang@chromium.org>
---
 sound/soc/rockchip/rockchip_i2s.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_i2s.c b/sound/soc/rockchip/rockchip_i2s.c
index 0a34d0eb8dba..88ebaf6e1880 100644
--- a/sound/soc/rockchip/rockchip_i2s.c
+++ b/sound/soc/rockchip/rockchip_i2s.c
@@ -326,7 +326,6 @@ static int rockchip_i2s_hw_params(struct snd_pcm_substream *substream,
 		val |= I2S_CHN_4;
 		break;
 	case 2:
-	case 1:
 		val |= I2S_CHN_2;
 		break;
 	default:
@@ -459,7 +458,7 @@ static struct snd_soc_dai_driver rockchip_i2s_dai = {
 	},
 	.capture = {
 		.stream_name = "Capture",
-		.channels_min = 1,
+		.channels_min = 2,
 		.channels_max = 2,
 		.rates = SNDRV_PCM_RATE_8000_192000,
 		.formats = (SNDRV_PCM_FMTBIT_S8 |
@@ -659,7 +658,7 @@ static int rockchip_i2s_probe(struct platform_device *pdev)
 	}
 
 	if (!of_property_read_u32(node, "rockchip,capture-channels", &val)) {
-		if (val >= 1 && val <= 8)
+		if (val >= 2 && val <= 8)
 			soc_dai->capture.channels_max = val;
 	}
 
-- 
2.22.0.709.g102302147b-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
