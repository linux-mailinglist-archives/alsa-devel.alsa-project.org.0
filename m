Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F4564F1229
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Apr 2022 11:36:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F19F316CB;
	Mon,  4 Apr 2022 11:35:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F19F316CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649065004;
	bh=MISkUlMJwjTnq7mFlq/oNBnWh38mnW81WtCm3p2Ztqg=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=WPFETuZudIZl5tzAQln2ePGjC9nofhsk5bnDiLqHfu68GPbXs0TBE/sV3l22+fAWY
	 PXjzRfkB9DJoe2qMU2BmrFHr/mISDJuDNvQ+DIgnMpHbT9dV/EtygVAIijhZvCCxyq
	 RTIeEKmsNfw73LM+iVVP+Swvr4mGqo51T5klzzaQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 73438F801F7;
	Mon,  4 Apr 2022 11:35:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ADF30F800D1; Mon,  4 Apr 2022 11:35:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 26D00F800D1
 for <alsa-devel@alsa-project.org>; Mon,  4 Apr 2022 11:35:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 26D00F800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="hqie0Vxb"
Received: by mail-pj1-x1036.google.com with SMTP id fu5so2506438pjb.1
 for <alsa-devel@alsa-project.org>; Mon, 04 Apr 2022 02:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id;
 bh=NFJoHT6EmGTYBUPOupG38cbbiA5NqTvKVPy1Pb3g8l0=;
 b=hqie0VxbYc6jPuFUDUUWm1ttjYV4p5WiT7ENtpsiDJIZxfyFn8KEFNdFEfMWRv7WlT
 s4gwzU9BbT8f7aP01MHVF85zFMbgqlHDUL3hg3KSpHA88D7qEyQN8o9S1mZRK2HTupsz
 pjLzKJCvhIICpDKDOqz4Au81BgUEMVRv/nxup5iZJBKY6fktTyWz2ww03AWmpaPE8TVy
 SyzKdH5qTb00ZfGBjVS5/XU1AQBJ1SPMpZ2Od2UUpqxrDw4MvEGj1R8nbyqfxHiJ3FiZ
 Hw8k2PMX0hgXLjfsdoKXvPWmHxc/U07vws0xXytgr0GA+Y6fL1626W5leKk1qWV1VFfo
 87Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id;
 bh=NFJoHT6EmGTYBUPOupG38cbbiA5NqTvKVPy1Pb3g8l0=;
 b=ezc3ripqCPhkOnerFV1lwRL3G5r1oLuEY5NYwXTDk57/fw+6XwwSmEdqZmTcX7+PLn
 iVODgdr6C07/lAgjl0w2xXiAKQ1u/2eAXnLsW+yS3DRRDo0yIAhrkKpANsX3XI5R1o0c
 +cxI6hPgs6FNuNcHerHDbT4DqHf6faBwJM9+m5zAsvYaQCIYGNQfuDc/pxKNyMhLa5EW
 7L21tEu+pruxzbjI9ly5BVguaH5c2i4bpA5/u00YPt5fw1Mj+E1BRfuZtpXfng4KX/Hj
 PY5KNoyFk5PUrH2IIss5fdFcLf9UyOW7gRTDlbN3+2UDYdfEZGaec97blqyufVn734JK
 Bq4w==
X-Gm-Message-State: AOAM532aBKBP3EgvcyqInR/K8GYknqkZ0syIuh1TRm5hv13KfjTYfbAM
 9k6TzTA/cZ/kPv+reuhBf1c=
X-Google-Smtp-Source: ABdhPJw99iosJV9nPCTMTX9k/SsOa92D4Q8eA8BMrDxaMJ3zDelyoQIOKd0hFHAqFwuNdvPttgVplA==
X-Received: by 2002:a17:90b:164f:b0:1c7:8d20:ff6d with SMTP id
 il15-20020a17090b164f00b001c78d20ff6dmr25522757pjb.64.1649064938871; 
 Mon, 04 Apr 2022 02:35:38 -0700 (PDT)
Received: from localhost.localdomain ([159.226.95.43])
 by smtp.googlemail.com with ESMTPSA id
 j20-20020a62e914000000b004fa3bd9bef0sm11032863pfh.110.2022.04.04.02.35.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Apr 2022 02:35:38 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Rikard Falkeborn <rikard.falkeborn@gmail.com>,
 Miaoqian Lin <linmq006@gmail.com>, Ryder Lee <ryder.lee@mediatek.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH] ASoC: mediatek: Fix missing of_node_put in
 mt2701_wm8960_machine_probe
Date: Mon,  4 Apr 2022 09:35:25 +0000
Message-Id: <20220404093526.30004-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.17.1
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

This node pointer is returned by of_parse_phandle() with
refcount incremented in this function.
Calling of_node_put() to avoid the refcount leak.

Fixes: 8625c1dbd876 ("ASoC: mediatek: Add mt2701-wm8960 machine driver")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 sound/soc/mediatek/mt2701/mt2701-wm8960.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt2701/mt2701-wm8960.c b/sound/soc/mediatek/mt2701/mt2701-wm8960.c
index f56de1b918bf..0cdf2ae36243 100644
--- a/sound/soc/mediatek/mt2701/mt2701-wm8960.c
+++ b/sound/soc/mediatek/mt2701/mt2701-wm8960.c
@@ -129,7 +129,8 @@ static int mt2701_wm8960_machine_probe(struct platform_device *pdev)
 	if (!codec_node) {
 		dev_err(&pdev->dev,
 			"Property 'audio-codec' missing or invalid\n");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto put_platform_node;
 	}
 	for_each_card_prelinks(card, i, dai_link) {
 		if (dai_link->codecs->name)
@@ -140,7 +141,7 @@ static int mt2701_wm8960_machine_probe(struct platform_device *pdev)
 	ret = snd_soc_of_parse_audio_routing(card, "audio-routing");
 	if (ret) {
 		dev_err(&pdev->dev, "failed to parse audio-routing: %d\n", ret);
-		return ret;
+		goto put_codec_node;
 	}
 
 	ret = devm_snd_soc_register_card(&pdev->dev, card);
@@ -148,6 +149,10 @@ static int mt2701_wm8960_machine_probe(struct platform_device *pdev)
 		dev_err(&pdev->dev, "%s snd_soc_register_card fail %d\n",
 			__func__, ret);
 
+put_codec_node:
+	of_node_put(codec_node);
+put_platform_node:
+	of_node_put(platform_node);
 	return ret;
 }
 
-- 
2.17.1

