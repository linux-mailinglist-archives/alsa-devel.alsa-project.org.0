Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4095935ACE0
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Apr 2021 13:17:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DEA3910E;
	Sat, 10 Apr 2021 13:16:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DEA3910E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618053443;
	bh=dJ4nWjNpIeMJWFWTizvuySO/6A+TwhQGsW7s3Mw1OM4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=baWA/rnJoKHr+9nftYTgwMlA7bGFFZEvT5QlZSE+SBRgMZCvcFah0FTWyKnNfMj9e
	 xWTPl6qZiK/nlZXE82b0Pe9zkLBRTBDGAl1CSYb6V8gENR0rrsGp9RawZlyqc8fjhZ
	 bgMiLUCxF5mOza6SRtzZbNiI3x9eUtm63o1XcRgM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1BFC2F8049C;
	Sat, 10 Apr 2021 13:14:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5AE56F8032C; Sat, 10 Apr 2021 13:14:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 27A38F8020B
 for <alsa-devel@alsa-project.org>; Sat, 10 Apr 2021 13:14:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 27A38F8020B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="ER/6JODq"
Received: by mail-wm1-x330.google.com with SMTP id
 o20-20020a05600c4fd4b0290114265518afso4255065wmq.4
 for <alsa-devel@alsa-project.org>; Sat, 10 Apr 2021 04:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tP2B7PpyvjqGNjx+bX56P7sB4iUvry5KkFolRNleklk=;
 b=ER/6JODqNnCYiew9ExFspdf9CLFlaQHxcUelbQSKowEOT/MYWOoqxbB0YGIYtZoZaQ
 UfbcRcDxgBE0dgTQqk6kSDpbLBcLMeIHFpbHP1c1twrlpRTH9pGqPg6TyShwyFG9y5St
 5UMnqoWLEEnp4bTDAiyMKB0/CIWckeYyl1As265mnZObJKKifZTo+FIFuWgNBcvVMHUR
 csmvWilnUGpt/xXOunB0xaW/WkTUyzqzznacYnbFe2n7aY7evhwNw8Hf52WMo21Qhu65
 gvEFSpYfKAOXg7yOle1Di7FsnozxDZvCrYz1vlTLuPm0hCyH3F+8LiDXophjGLIFR+y7
 KUJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tP2B7PpyvjqGNjx+bX56P7sB4iUvry5KkFolRNleklk=;
 b=KtDszJX9DrqVZ7LFq6qzkxV+LVYfzFkpz9eUnMtdNLWkQjK1GNLShr6vs8QebHUu+J
 lHHo1gNZYeysuewK7qK5FV/rj94F7Eup6ItDRTPJ5wpwihIW2Rk8geRG5b0gxtVZ4+RS
 M4NCg6y3N2pHxx/0Vn6q5ui5jS4dHUONIfTgFp/88wMTmdX+56UOzF7rhSoNV2PjNFKk
 VG3lRBOoxv0OVZPMSCrh0YZOYh33E/7yy9GRDnzqeXXx0AAzQCzQNMGhSoVkLeHsVnZK
 8lsDAYdY+L24nBORZ+BHbrhhvKF53bARdPaP2u2KWdt3uD6tJiSWCRtWs1DuhIcAnLJY
 PaGg==
X-Gm-Message-State: AOAM530dTdRcBKGJ8rwk3oIJc+PisRgoIlg1iCH/7maHDnlnjgKLK9pr
 5fxClmRvI6KyNB0MWWKyEXGFMy5FvAtUCRAM
X-Google-Smtp-Source: ABdhPJwTzTHbQN8i5k02Db+ienjllS5Z03I5zxFQECMU0GrCRJK2v7QfxBehPGg7/tC1L0hI/k3vTw==
X-Received: by 2002:a1c:a182:: with SMTP id k124mr6414729wme.132.1618053245421; 
 Sat, 10 Apr 2021 04:14:05 -0700 (PDT)
Received: from starbuck.lan (82-65-169-74.subs.proxad.net. [82.65.169.74])
 by smtp.googlemail.com with ESMTPSA id s8sm8370117wrn.97.2021.04.10.04.14.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Apr 2021 04:14:05 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 5/5] ASoC: da7219: properly get clk from the provider
Date: Sat, 10 Apr 2021 13:13:56 +0200
Message-Id: <20210410111356.467340-6-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210410111356.467340-1-jbrunet@baylibre.com>
References: <20210410111356.467340-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Cc: Stephen Boyd <sboyd@kernel.org>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
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

Instead of using the clk embedded in the clk_hw (which is meant to go
away), a clock provider which need to interact with its own clock should
request clk reference through the clock provider API.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/codecs/da7219.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/da7219.c b/sound/soc/codecs/da7219.c
index 13009d08b09a..bd3c523a8617 100644
--- a/sound/soc/codecs/da7219.c
+++ b/sound/soc/codecs/da7219.c
@@ -2181,7 +2181,10 @@ static int da7219_register_dai_clks(struct snd_soc_component *component)
 				 ret);
 			goto err;
 		}
-		da7219->dai_clks[i] = dai_clk_hw->clk;
+
+		da7219->dai_clks[i] = devm_clk_hw_get_clk(dev, dai_clk_hw, NULL);
+		if (IS_ERR(da7219->dai_clks[i]))
+			return PTR_ERR(da7219->dai_clks[i]);
 
 		/* For DT setup onecell data, otherwise create lookup */
 		if (np) {
-- 
2.30.2

