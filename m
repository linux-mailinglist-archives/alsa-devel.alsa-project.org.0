Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FFC15628CE
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Jul 2022 04:15:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E357F166F;
	Fri,  1 Jul 2022 04:14:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E357F166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656641748;
	bh=YMKWNSjLpZOEDfOFVJ3Us/WU5ytHeDmUCKX9ekH9yKE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Srcj7Pm//gyG0u4SCSRxzGcrAzfjKhyhT1cgMT81jEn2k0kkwrlEjZyTc427u7nld
	 wqSAxzikbKIsqTJJg/9RINOFlXJ8rek4rtCq6NUj4ss1OMqpaUqn0CufFhqNHg0vKi
	 E58x1Vaxmnc0UporaFHlqOOizwgT6JYxi7I5FPZU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 492A5F80256;
	Fri,  1 Jul 2022 04:14:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 89CB1F80155; Fri,  1 Jul 2022 04:14:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A9651F8014E
 for <alsa-devel@alsa-project.org>; Fri,  1 Jul 2022 04:14:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9651F8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="AhRwhX3q"
Received: by mail-pf1-x433.google.com with SMTP id n12so1168627pfq.0
 for <alsa-devel@alsa-project.org>; Thu, 30 Jun 2022 19:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+nG6eb4+X5Ja/3xTBDEgAUy+rU3+Q7DlGcjeg+QB5NE=;
 b=AhRwhX3qb9Gd5pjZU3Ju6++wdDeh9TWEcwxe7bHgCzd2uV4SQi6lmZjo/YF93Keivu
 nppBG2JkTguvnOU2sKHsipgtfl7GIDry14WJl07b4OcAOSRUuxdFebUItxXO/SHmei2x
 Na8FewAQ1/FvgOHmArf8p6ak4Dcvc3Dq0r1lg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+nG6eb4+X5Ja/3xTBDEgAUy+rU3+Q7DlGcjeg+QB5NE=;
 b=Hw2Wc7Ykjmu4i1+beWyTWlDAFf8YvV5xz4dLUKDPn0Kds68JUiY0+hx25HFprvEYLp
 Ezhzf1GFng8/+qsS3cXginy0vBOUCWZ5nHTRcK9hazq2g5jEC+D+yPnJjytMNoqPzC8J
 mfrM+OzZunscSv4Msj7iZj3LEFCvWXEpKbFp/Fq1sPs962KzhvOgQs+8+4CCfIdja8uG
 oxmHxlmRA1j49d/yptpYP3HqKemQLo2rtxKLLDSvoFcPm8xgk92ZfpU2DyxqF3wHcU8z
 InN0DL5XcPtH4xqakC+trQG0zbz6udtuhE//L3c4zVvsXnEvlIoNwTGGaVOdhc2YMBun
 R7Tg==
X-Gm-Message-State: AJIora/GVS+B31IKj8ah2ivouNqeZNM68fq9dUWFWHUAIAuYyzSPm3Q5
 Czvn4J8Qm+olX7Dlg0HkpqmkaQ==
X-Google-Smtp-Source: AGRyM1vT575BCyuGLho/NbkSLyh3jD8NuJm0rgeF42h3/GJvEzoiIL/ra/yU9Bj42AjH05umGXxiJw==
X-Received: by 2002:a63:4d4f:0:b0:3fd:f4a1:93db with SMTP id
 n15-20020a634d4f000000b003fdf4a193dbmr10451410pgl.374.1656641674280; 
 Thu, 30 Jun 2022 19:14:34 -0700 (PDT)
Received: from judyhsiao0523.c.googlers.com.com
 (0.223.81.34.bc.googleusercontent.com. [34.81.223.0])
 by smtp.gmail.com with ESMTPSA id
 z29-20020aa7949d000000b0052515e20df8sm14423596pfk.152.2022.06.30.19.14.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jun 2022 19:14:33 -0700 (PDT)
From: Judy Hsiao <judyhsiao@chromium.org>
To: Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH v1] FROMGIT: ASoC: rockchip: i2s: Fix error code when fail to
 read I2S_CLR
Date: Fri,  1 Jul 2022 02:14:27 +0000
Message-Id: <20220701021427.3120549-1-judyhsiao@chromium.org>
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Brian Norris <briannorris@chromium.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-rockchip@lists.infradead.org,
 Mark Brown <broonie@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>,
 Judy Hsiao <judyhsiao@chromium.org>, linux-arm-kernel@lists.infradead.org
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

Add the error code '-EBUSY' when fail to read I2S_CLR
in rockchip_snd_rxctrl() and rockchip_snd_txctrl()

Fixes: 44f362c2cc6d ("ASoC: rockchip: i2s: switch BCLK to GPIO")
Signed-off-by: Judy Hsiao <judyhsiao@chromium.org>
---
 sound/soc/rockchip/rockchip_i2s.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/rockchip/rockchip_i2s.c b/sound/soc/rockchip/rockchip_i2s.c
index f783994cc16a..fd36c0bacc43 100644
--- a/sound/soc/rockchip/rockchip_i2s.c
+++ b/sound/soc/rockchip/rockchip_i2s.c
@@ -171,6 +171,7 @@ static int rockchip_snd_txctrl(struct rk_i2s_dev *i2s, int on)
 				retry--;
 				if (!retry) {
 					dev_warn(i2s->dev, "fail to clear\n");
+					ret = -EBUSY;
 					break;
 				}
 			}
@@ -232,6 +233,7 @@ static int rockchip_snd_rxctrl(struct rk_i2s_dev *i2s, int on)
 				retry--;
 				if (!retry) {
 					dev_warn(i2s->dev, "fail to clear\n");
+					ret = -EBUSY;
 					break;
 				}
 			}
-- 
2.37.0.rc0.161.g10f37bed90-goog

