Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F5B53B947
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jun 2022 15:03:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C69A316A5;
	Thu,  2 Jun 2022 15:02:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C69A316A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654175011;
	bh=mrbQ8miNJBYUIqNqm3hvqugDcbOaOh36wpvIGONBowo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hdF9ePgF8vJKk68N8pUi2OW6fBBwHmZFEAaapH1nzi7Qi2VVb+IXyCcVTt4lGW20v
	 GLXtP0EkF4XNXC3Gyj//MZykLFU8NYX6S1xqzN2/0SzNHGgUAd5c9uQhBOaVNpanPq
	 mfownTPgXVDmKMXupZTaUKMityNP0UJQ0YOJvPvw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 34DECF8025E;
	Thu,  2 Jun 2022 15:02:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 36DAAF80236; Thu,  2 Jun 2022 15:02:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A8C53F80149
 for <alsa-devel@alsa-project.org>; Thu,  2 Jun 2022 15:02:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8C53F80149
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="pEVgysGf"
Received: by mail-pl1-x632.google.com with SMTP id h1so4454844plf.11
 for <alsa-devel@alsa-project.org>; Thu, 02 Jun 2022 06:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XdxxRvNPqFgVB4QJaeaHAzMjj0lVYGxn3dldB8u/Zr4=;
 b=pEVgysGf3LJ/rw3xxHkq4t2G/Mh5jq0fS7dPhhVc0eFcSxs7j7DVRCc5NPnOOQE6En
 ro82zoh9lPKDxsRnKXS8z/pcJPAuoxXpP2yUmqZDj85NFbWo4DjK7K3eZqZF7ckz6XyP
 wCTrr36K7FKehCH0BPeVg7CBPAHIT1EZ2MVHmBQox45X0AH4nc3yvmUUzTEpMTZGv06k
 mBWZzLJaqJge+PHqw8x2yLS6XW+7IEPn3L6TOCe5zYZfRYnBSvKP+FXML2d39FPYB8tu
 brAkXmSOmwRR74eZ8D2ImNTfB78g/g6dtCyEnYwAzK2wYA/R4FZxEaoowjGXXh/sRstQ
 mWlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XdxxRvNPqFgVB4QJaeaHAzMjj0lVYGxn3dldB8u/Zr4=;
 b=gm6Y/Kj13UhMORldbD8SbXo1xTiKW+DzhksvZpyI95tPzusQupiD06FuCHe2Mxg/0a
 bOMpIjYv7j84xxFMaqmMIkCaydDY4/LI7oMs6tt+wT9JFc6UfIn0kVj4apwVhvNq2JN0
 rN7HooPjfsrEkjjhqfmlhScbDVqy7QY0mkF2xTVFA0ZGu7vfJ4OFznUR1jcHwJBorHta
 hc4vPrAlcmqtXewIxxOQ3jUQ3prnG+rO11rUG/ZPD+DphWuEp1f/mjZpVwuVT8U3otOO
 MlrxsAk09nC78OhRk6fGrki2M+9LViyRre/ZM26QG6Ner1fFMAhbD8gV96r4RndXOVoW
 BGQA==
X-Gm-Message-State: AOAM5332tbmObeYU6fAPSUX/Mzhiwx4M02oMbLowabw6jPrEX1IflhaM
 QEXg5dfBuitXc+gKLlhAYFzxrGkow/9EVurMGjY=
X-Google-Smtp-Source: ABdhPJzNRjRgYVZM2ebupFUL1SqAFM9zF1iVEify9KqJCZ1syK4D1jMK1M6fBvdZ3QasUHTe/nrQLQ==
X-Received: by 2002:a17:902:bf4c:b0:15c:3d1b:8a47 with SMTP id
 u12-20020a170902bf4c00b0015c3d1b8a47mr4955096pls.118.1654174948528; 
 Thu, 02 Jun 2022 06:02:28 -0700 (PDT)
Received: from localhost.localdomain ([202.120.234.246])
 by smtp.googlemail.com with ESMTPSA id
 j23-20020a63ec17000000b003fc37053c82sm3240443pgh.12.2022.06.02.06.02.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 06:02:27 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: samsung: Fix error handling in aries_audio_probe
Date: Thu,  2 Jun 2022 17:02:17 +0400
Message-Id: <20220602130218.14901-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linmq006@gmail.com
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

of_get_child_by_name() returns a node pointer with refcount
incremented, we should use of_node_put() on it when not need anymore.
This function is missing of_node_put(cpu) in the error path.
Fix this by goto out label. of_node_put() will check NULL pointer.

Fixes: format:7a3a7671fa6c ("ASoC: samsung: Add driver for Aries boards")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 sound/soc/samsung/aries_wm8994.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/soc/samsung/aries_wm8994.c b/sound/soc/samsung/aries_wm8994.c
index bb0cf4244e00..edee02d7f100 100644
--- a/sound/soc/samsung/aries_wm8994.c
+++ b/sound/soc/samsung/aries_wm8994.c
@@ -628,8 +628,10 @@ static int aries_audio_probe(struct platform_device *pdev)
 		return -EINVAL;
 
 	codec = of_get_child_by_name(dev->of_node, "codec");
-	if (!codec)
-		return -EINVAL;
+	if (!codec) {
+		ret = -EINVAL;
+		goto out;
+	}
 
 	for_each_card_prelinks(card, i, dai_link) {
 		dai_link->codecs->of_node = of_parse_phandle(codec,
-- 
2.25.1

