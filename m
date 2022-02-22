Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C30B54BF7BD
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Feb 2022 13:03:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 519C3180F;
	Tue, 22 Feb 2022 13:02:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 519C3180F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645531426;
	bh=Tav74BvuRa2PbxXQjXYIr6aEZYGE/+bwylo90YsFX3M=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ekxIGQ9dVRnrXCWz3Kxp2mAhLRFt76pJFk3qQy4clnP3jKuc+EmjFMLxflnexmANU
	 RJi3LVzVPk3vtY7kMgpv5H/KSVSlIOtV2IEPqo6K4hh57sZ4c0qYleDarAuZkO8/9C
	 idUFV3qNi/MPhMzpepKjw53BfUPJ46Y24LSa9siM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 65F7EF80537;
	Tue, 22 Feb 2022 13:00:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9D082F80520; Tue, 22 Feb 2022 13:00:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A6BD9F80508
 for <alsa-devel@alsa-project.org>; Tue, 22 Feb 2022 12:59:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6BD9F80508
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="OlsqQ+HY"
Received: by mail-wm1-x332.google.com with SMTP id
 az13-20020a05600c600d00b003808a3380faso1625834wmb.1
 for <alsa-devel@alsa-project.org>; Tue, 22 Feb 2022 03:59:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TT58Pxq1258T4AxyuLdXgL1OIhP7Hr2onHMX8NaDui0=;
 b=OlsqQ+HYW21fdRD6Ie2kAF0sLLQXbbvVHzDRxuPbFBpppJeOcibTqM53uRG725SIm/
 5hZ/AGJpEmJP5N3am+fe7KIvlFwLrrn93UN6ZV3ky4sQrUoAs5TVKpAU2Q4F+cz8SQGX
 K+rfi/eblBV5qbMFbU07oElE7eOsTeU1tp/c6zSPfUQlgNqwOKlMS4iRRFl5cAIU1zyN
 CoftkLdoW0KnNngUjTdrxms5xLic4p6+Etf3nDx2U7ZAufFJf6o1G7O/HKH14OlwAIdL
 HxNtQvbXxGDxymxxMkGeYxlSLWZEiJ5+Y4A+VovzD/K2OmbM8zA4S1Zvalqg2czbNlVg
 nz2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TT58Pxq1258T4AxyuLdXgL1OIhP7Hr2onHMX8NaDui0=;
 b=gGGqvFAdG1T8C5rJ1LH032T13vjDtocitT3rxQWMPu0mN7PS0RmDcopzHlOeAkLuB8
 kgvL1RFEylSh6Vggf7GbvMZfJxyoZYQ0ieFOQZTDNjnBvwBYUv9/INw4lRZzL5Pnk86l
 KbiCm1i2hZfdpNiYgkvdyXyMiPxqRFgWQLBKrOsYGVPiswLVWinmAyBjPWPam5ncBHrx
 5mfUnYrrW/Prj7LFPbGZfsqfODyGkIf8klkkStetmY1p1UTcRkoQsQJLbNmTfOsg3Qei
 YY/Ar3dn4sImuFnRO7zunHOnyQxRzFwITftmUdkeWXmUZ42aVszX6f3qtBCESNiRCgaR
 5IoA==
X-Gm-Message-State: AOAM5322JnlcW2CPDtN3Tr+kunmU8FBhG1jaCaK26hUX/KFdPQ2rRl0q
 +yLtlUfrhHykguAXmXa6kFmZgw==
X-Google-Smtp-Source: ABdhPJxBY/ikhqjz0AGd2wmSRhvxpIVt0C6nKXdpBIDhdfbRAM6xKSfI39VaB3VRbnro5u+Oi0EiQA==
X-Received: by 2002:a1c:a915:0:b0:380:e3de:b78f with SMTP id
 s21-20020a1ca915000000b00380e3deb78fmr321477wme.19.1645531196938; 
 Tue, 22 Feb 2022 03:59:56 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id a18sm50014661wrg.13.2022.02.22.03.59.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 03:59:56 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 09/16] ASoC: codecs: wcd934x: fix return value of
 wcd934x_rx_hph_mode_put
Date: Tue, 22 Feb 2022 11:59:26 +0000
Message-Id: <20220222115933.9114-10-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20220222115933.9114-1-srinivas.kandagatla@linaro.org>
References: <20220222115933.9114-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 tiwai@suse.com, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 quic_srivasam@quicinc.com
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

wcd934x_rx_hph_mode_put currently returns zero eventhough it changes the value.
Fix this, so that change notifications are sent correctly.

Fixes: 1cde8b822332 ("ASoC: wcd934x: add basic controls")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/wcd934x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wcd934x.c b/sound/soc/codecs/wcd934x.c
index f2674905a4a7..ab580f37cf00 100644
--- a/sound/soc/codecs/wcd934x.c
+++ b/sound/soc/codecs/wcd934x.c
@@ -3314,7 +3314,7 @@ static int wcd934x_rx_hph_mode_put(struct snd_kcontrol *kc,
 	}
 	wcd->hph_mode = mode_val;
 
-	return 0;
+	return 1;
 }
 
 static int slim_rx_mux_get(struct snd_kcontrol *kc,
-- 
2.21.0

