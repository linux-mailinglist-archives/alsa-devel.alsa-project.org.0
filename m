Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E14AF5B21BD
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Sep 2022 17:13:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 138C6170C;
	Thu,  8 Sep 2022 17:12:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 138C6170C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662649980;
	bh=4klp8u7UUvE+sf6pUlOFxdJUMw44OmxUrIvExABahI8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lGHAKnBK1MYJs9z58sCCJ3qRzUM1jqpCP5bVxuu86ou2NPrLaISC8lfY91GYAgUBv
	 QcM80hLnaEpW/AuwZQokAq8DwQ/x78FNs/8AHuPZXPIJvV00SPzF3xUmTpNavD0XX2
	 Eyjrev44T/4lF+tfCKQEkgLGzkD3qmS/Gx1lF9uM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A73CF8023B;
	Thu,  8 Sep 2022 17:12:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 12CD3F80217; Thu,  8 Sep 2022 17:11:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A436CF800CB
 for <alsa-devel@alsa-project.org>; Thu,  8 Sep 2022 17:11:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A436CF800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="EqmtlG1E"
Received: by mail-pj1-x1036.google.com with SMTP id
 j6-20020a17090a694600b00200bba67dadso2767367pjm.5
 for <alsa-devel@alsa-project.org>; Thu, 08 Sep 2022 08:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=evICa2gP1OZP3o4uj2q6UUkKvForG1fKNpFXQceaCWU=;
 b=EqmtlG1EAApXEHPAJtRBAEY3KRn2qNipV7J7wV23a7+9xkZs61Aozim+Aj5IpshuOL
 RTvka8w/TCO9lBxh7znsR6pIpfOZv+a2P4ITvHmeV/Kq31miqSqcHlha/9ZVtniOdKmT
 ky5+rrH1c5YDZVrEZFER1XpuSN1YyZ2LKagyU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=evICa2gP1OZP3o4uj2q6UUkKvForG1fKNpFXQceaCWU=;
 b=OfpGgCR8yDEFb1MqjWPySOI/FR5Vspq+flqM70iIhIyJJ2HC62o9h4AZoyjjCcda6X
 JbghNQTNI4c8eMwWmgSpk23xrBJuEYprxIuqiDpJJ//XkDpGYgiun12efARuWxKEA1t2
 LG2/umcpbFybfVuzaicIIHDzVXKnUVSgAtmXfdVHtKmUw5N8mAT9MX69dlAzc88Vl0DJ
 bFCYPX+K35WOQNXrLYQZpc2pz8l6dyzrVHY9nTES6XPCas4jG+Cd10ysAC/7fR5k/MFo
 IDkZCNslKnu2O7rAQwkpiuDfjAc7n7FZVGFe6HVS9BD0VQFtBOJJDgCQU5UEweG1Dw8n
 KOVw==
X-Gm-Message-State: ACgBeo3dYMNPW+LqIx8IhxEZs+jV5DmVjU26jJYZ4EzSxqndU1SnRpbH
 nFZNVlQ/JaXInghKMJc/L3SZJg==
X-Google-Smtp-Source: AA6agR6yoSUpGUarSfWA17yyn6yPMU3yzNaqtpF6IjQdc28o5dU7QuUtAkXWsncXc5yfzIzSjer2KQ==
X-Received: by 2002:a17:90a:df13:b0:200:ae8c:700c with SMTP id
 gp19-20020a17090adf1300b00200ae8c700cmr4784872pjb.203.1662649909840; 
 Thu, 08 Sep 2022 08:11:49 -0700 (PDT)
Received: from judyhsiao0523.c.googlers.com.com
 (21.160.199.104.bc.googleusercontent.com. [104.199.160.21])
 by smtp.gmail.com with ESMTPSA id
 e16-20020aa798d0000000b005360da6b26bsm14892692pfm.159.2022.09.08.08.11.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Sep 2022 08:11:49 -0700 (PDT)
From: Judy Hsiao <judyhsiao@chromium.org>
To: Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v1] ASoC: rockchip: i2s: use regmap_read_poll_timeout to poll
 I2S_CLR
Date: Thu,  8 Sep 2022 15:11:42 +0000
Message-Id: <20220908151142.1479810-1-judyhsiao@chromium.org>
X-Mailer: git-send-email 2.37.2.789.g6183377224-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Brian Norris <briannorris@chromium.org>, Takashi Iwai <tiwai@suse.com>,
 linux-rockchip@lists.infradead.org, Mark Brown <broonie@kernel.org>,
 Chen-Yu Tsai <wenst@chromium.org>, Judy Hsiao <judyhsiao@chromium.org>,
 linux-arm-kernel@lists.infradead.org
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

Use regmap_read_poll_timeout to poll I2S_CLR.
It also fixes the 'rockchip-i2s ff070000.i2s; fail to clear' and
return -EBUSY when the read of I2S_CLR exceeds the retry limit.

Fixes: 0ff9f8b9f592 ("ASoC: rockchip: i2s: Fix error code when fail
to read I2S_CLR")
Signed-off-by: Judy Hsiao <judyhsiao@chromium.org>
---
 sound/soc/rockchip/rockchip_i2s.c | 39 +++++++++++++------------------
 1 file changed, 16 insertions(+), 23 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_i2s.c b/sound/soc/rockchip/rockchip_i2s.c
index f5f3540a9e18..02905eec615e 100644
--- a/sound/soc/rockchip/rockchip_i2s.c
+++ b/sound/soc/rockchip/rockchip_i2s.c
@@ -163,18 +163,14 @@ static int rockchip_snd_txctrl(struct rk_i2s_dev *i2s, int on)
 						 I2S_CLR_TXC | I2S_CLR_RXC);
 			if (ret < 0)
 				goto end;
-			regmap_read(i2s->regmap, I2S_CLR, &val);
-
-			/* Should wait for clear operation to finish */
-			while (val) {
-				regmap_read(i2s->regmap, I2S_CLR, &val);
-				retry--;
-				if (!retry) {
-					dev_warn(i2s->dev, "fail to clear\n");
-					ret = -EBUSY;
-					break;
-				}
-			}
+			ret = regmap_read_poll_timeout(i2s->regmap,
+						       I2S_CLR,
+						       val,
+						       val != 0,
+						       20,
+						       200);
+			if (ret < 0)
+				dev_warn(i2s->dev, "fail to clear\n");
 		}
 	}
 end:
@@ -226,17 +222,14 @@ static int rockchip_snd_rxctrl(struct rk_i2s_dev *i2s, int on)
 						 I2S_CLR_TXC | I2S_CLR_RXC);
 			if (ret < 0)
 				goto end;
-			regmap_read(i2s->regmap, I2S_CLR, &val);
-			/* Should wait for clear operation to finish */
-			while (val) {
-				regmap_read(i2s->regmap, I2S_CLR, &val);
-				retry--;
-				if (!retry) {
-					dev_warn(i2s->dev, "fail to clear\n");
-					ret = -EBUSY;
-					break;
-				}
-			}
+			ret = regmap_read_poll_timeout(i2s->regmap,
+						       I2S_CLR,
+						       val,
+						       val != 0,
+						       20,
+						       200);
+			if (ret < 0)
+				dev_warn(i2s->dev, "fail to clear\n");
 		}
 	}
 end:
-- 
2.37.2.789.g6183377224-goog

