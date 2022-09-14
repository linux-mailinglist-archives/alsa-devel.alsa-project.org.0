Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A255B7F36
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Sep 2022 05:13:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A725E17EA;
	Wed, 14 Sep 2022 05:13:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A725E17EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663125236;
	bh=ne1gY7wRoCymPI5g7+gMJ87xyHEIIviCBkGGMN61QqQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=EnpGIUTa9ARlLqfCQ4uiPYNpl9Gy2M9GySn/o8yDMubzbyW6AUBxEdc6TtdSkwnle
	 EHbNcNt5hZL+5DYTwQxBmKR2XBXFMFDkhWZmsbqr02y09JQLjNkvpqTxquj6fpyGD0
	 WmCHWq7HkuBPYSqE39a4Ei1jnvgpceDyfQsEt0xw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 42CE4F8016E;
	Wed, 14 Sep 2022 05:12:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 056C6F8014E; Wed, 14 Sep 2022 05:12:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A339EF8008E
 for <alsa-devel@alsa-project.org>; Wed, 14 Sep 2022 05:12:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A339EF8008E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="EhQ1a6FH"
Received: by mail-pl1-x632.google.com with SMTP id iw17so13824509plb.0
 for <alsa-devel@alsa-project.org>; Tue, 13 Sep 2022 20:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=Ru/J57bKYILUKFipBlhIw83PvGlUWh882vmvyBi7Ppo=;
 b=EhQ1a6FHsjcONdLKhZQEAPbglYOd4CBescJyriBTJj8+A53IqRootIFPtUUCL4oG1m
 hIvlZ9NsD0oGScx9MMY3Gy/aT1SoYC/MejdRBlCwb4Y9QXJ0YSyAqNbDaDYIAf5syb/q
 plNDPHp0gHeyJImSJ6ucv3gsORDOOHbe4BC7A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=Ru/J57bKYILUKFipBlhIw83PvGlUWh882vmvyBi7Ppo=;
 b=2nW77GaW8GzJo5JWXIOXR48cbUZsMvxrwOeAEec5evqBQEQq29dtDwnWjS0PxrfWYi
 EZGnjtupVGqv5fxoZwF2rIE3Ebs1SghwCq+8MsPo8T5gutQlDwTUn07Uxpwu1oAFNZey
 E18FYQBrnO/U4kSCiclf6olbQkylfrdd22UwBjV4AyqsB6KtnudPbSTE7Ox0C3m5cJJa
 5MvmE+EOjKtTRtbD2BMdNrVBrh43ggByu/D234wlOyqKuSniJmkXI8yuEoylOU/C7H6r
 N//x59nqvWCJcYpe9d9sFSQgtuI96Cc3Kwr95MJ46Mfj8YitkUfUrlh2GsqnEfXF0pgC
 91Kg==
X-Gm-Message-State: ACgBeo2CsVkF3FsW8W4ZNZo+qwrwp1gv9jZBcp/kZ5PJQZ/wCIAznbpv
 42jikkG292yKYy3rJYgp21QN9A==
X-Google-Smtp-Source: AA6agR5GmHRqaTG/+yzg03cabUk4aN8uXhW1lkkDGgX7gqTXoYZvQtnNYufHIkIdthFpK0/3bwX+Aw==
X-Received: by 2002:a17:902:cccb:b0:178:2a5e:b6e7 with SMTP id
 z11-20020a170902cccb00b001782a5eb6e7mr14471471ple.49.1663125165490; 
 Tue, 13 Sep 2022 20:12:45 -0700 (PDT)
Received: from judyhsiao0523.c.googlers.com.com
 (21.160.199.104.bc.googleusercontent.com. [104.199.160.21])
 by smtp.gmail.com with ESMTPSA id
 y18-20020a170902b49200b0016dcbdf9492sm9236737plr.92.2022.09.13.20.12.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Sep 2022 20:12:44 -0700 (PDT)
From: Judy Hsiao <judyhsiao@chromium.org>
To: Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v2] ASoC: rockchip: i2s: use regmap_read_poll_timeout to poll
 I2S_CLR
Date: Wed, 14 Sep 2022 03:12:34 +0000
Message-Id: <20220914031234.2250298-1-judyhsiao@chromium.org>
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
It also fixes the 'rockchip-i2s ff070000.i2s; fail to clear' when
the read of I2S_CLR exceeds the retry limit.

Fixes: 0ff9f8b9f592 ("ASoC: rockchip: i2s: Fix error code when fail
to read I2S_CLR")
Signed-off-by: Judy Hsiao <judyhsiao@chromium.org>
Reviewed-by: Brian Norris <briannorris@chromium.org>
---

changes in v2:
  - Remove unused variables.
  - Refine debug messages.

 sound/soc/rockchip/rockchip_i2s.c | 41 ++++++++++++-------------------
 1 file changed, 16 insertions(+), 25 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_i2s.c b/sound/soc/rockchip/rockchip_i2s.c
index f5f3540a9e18..28c86f5e435e 100644
--- a/sound/soc/rockchip/rockchip_i2s.c
+++ b/sound/soc/rockchip/rockchip_i2s.c
@@ -126,7 +126,6 @@ static inline struct rk_i2s_dev *to_info(struct snd_soc_dai *dai)
 static int rockchip_snd_txctrl(struct rk_i2s_dev *i2s, int on)
 {
 	unsigned int val = 0;
-	int retry = 10;
 	int ret = 0;
 
 	spin_lock(&i2s->lock);
@@ -163,18 +162,14 @@ static int rockchip_snd_txctrl(struct rk_i2s_dev *i2s, int on)
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
+				dev_warn(i2s->dev, "fail to clear: %d\n", ret);
 		}
 	}
 end:
@@ -188,7 +183,6 @@ static int rockchip_snd_txctrl(struct rk_i2s_dev *i2s, int on)
 static int rockchip_snd_rxctrl(struct rk_i2s_dev *i2s, int on)
 {
 	unsigned int val = 0;
-	int retry = 10;
 	int ret = 0;
 
 	spin_lock(&i2s->lock);
@@ -226,17 +220,14 @@ static int rockchip_snd_rxctrl(struct rk_i2s_dev *i2s, int on)
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
+				dev_warn(i2s->dev, "fail to clear: %d\n", ret);
 		}
 	}
 end:
-- 
2.37.2.789.g6183377224-goog

