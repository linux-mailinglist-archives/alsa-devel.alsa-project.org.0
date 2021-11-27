Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B8E545FDA1
	for <lists+alsa-devel@lfdr.de>; Sat, 27 Nov 2021 10:33:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 160171719;
	Sat, 27 Nov 2021 10:32:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 160171719
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638005602;
	bh=FlDQQblNRHUJrv72DBBvTfgt0HfNqT1n8hgfIN5TwBg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=umTCUeDx9FOzDIGzr5+oPZy3O/48kQcH8fUg+xh7i4rEkC6KhDkB1oqZOTt/sXoPB
	 gmRu6qIllnRL0yQMHjbuRFrMaq8KA+LxpxJoCjjpFL9NF0nSkQX6zt/9QZxEv0U11A
	 8Ll5sgBuQV05fv7RoMsF9V1F/s+EDyAKtvdZ2eks=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 920D6F80430;
	Sat, 27 Nov 2021 10:32:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 40EB5F8049E; Sat, 27 Nov 2021 10:32:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3DF41F80132
 for <alsa-devel@alsa-project.org>; Sat, 27 Nov 2021 10:31:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3DF41F80132
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="WNAzxL+w"
Received: by mail-lf1-x12d.google.com with SMTP id b40so30154282lfv.10
 for <alsa-devel@alsa-project.org>; Sat, 27 Nov 2021 01:31:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HK/UIXBF2kOpn5IjdhG/KrI+jx7IUToPR1d6+HQopis=;
 b=WNAzxL+wbayZqi4bbW+2BQjcp6XE05F7ahvBbVc3J8P9LK+PZH4LtMKXX3qJOK6+Vs
 Qkh3FTvDTWYQcAd/3aZDl/MszdOGh9J9ZY74STWpPBGgupcCVEETZtt1ak8wf0IuLYef
 BNjWVyJRlQbr8zL6LtwXoJ6EVPLYWqFK1PF63obGOyh1hA5R1cmoC3jtg/LvzBYg8EK1
 TOttJ1MeJPqE7mUVDAqhKZbPiTjU4r3UMpQx5PFb7X6qAHS5InPvY1iid3WTGOt3/e+X
 KyzZasGBAstZr6LLlD6zP+425qW+deIfZOOhYtQYNyC8RklEtPhQeD3R+Hvtrrd7c5YH
 bU1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HK/UIXBF2kOpn5IjdhG/KrI+jx7IUToPR1d6+HQopis=;
 b=oe/ouU29Wce0M9etS/FnbGLBPb04QgVQEmadBCaeZJco/6ThYNk9vLFYaOAAwLdVvw
 CMaPzV5iDYqVrGW/9JmhVclJoz4yMqSXv8lC86yzxXnNf9Yx7tYH0NX5OA95qfYUiddJ
 jqBTyrun77qkiFPbJvyXN8fWxNF5N4EnBFWk/z7zD9lgu17xwKY2RHKpwGeUNKN6MBFC
 AxdYyMGFxBZn2KnGk+AiTDFV1ZUG2J57ix/IDIsSzGLbNrAAeYjvFbq6cStTlca2228r
 wS5CAF9S9NEXUd4pHViNazfUMrqZmJwSFWlWlxTgwdIMSVQmKda6BIIdRs0aERchoaaO
 CF9w==
X-Gm-Message-State: AOAM531LoAmUlaviWcNM26cSlT5jhm0NjF1QBc7NbCb4/bxKDtoe9tjZ
 VwIMtQ1TjB0H+KZT1Voee3WVSgoji/qnew==
X-Google-Smtp-Source: ABdhPJyoQLwsRHQuuIRIzM8HLrG5e6b/oBLwUOnb8ih5rVHuodC6f3qZ4pTMksx4IaDda54BPbE+YQ==
X-Received: by 2002:a05:6512:2314:: with SMTP id
 o20mr33702170lfu.51.1638005511997; 
 Sat, 27 Nov 2021 01:31:51 -0800 (PST)
Received: from localhost.localdomain (h-155-4-221-129.NA.cust.bahnhof.se.
 [155.4.221.129])
 by smtp.gmail.com with ESMTPSA id x17sm757851ljp.95.2021.11.27.01.31.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Nov 2021 01:31:51 -0800 (PST)
From: Rikard Falkeborn <rikard.falkeborn@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH] ASoC: mediatek: mt8195: Constify static snd_soc_ops
Date: Sat, 27 Nov 2021 10:31:47 +0100
Message-Id: <20211127093147.17368-1-rikard.falkeborn@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Rikard Falkeborn <rikard.falkeborn@gmail.com>,
 linux-mediatek@lists.infradead.org, Trevor Wu <trevor.wu@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Bixuan Cui <cuibixuan@huawei.com>,
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

These are only assigned to the ops field in the snd_soc_dai_link which
is a pointer to const struct snd_soc_ops. Make them const to allow the
compiler to put them in read-only memory.

Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
---
 sound/soc/mediatek/mt8195/mt8195-mt6359-rt1011-rt5682.c | 2 +-
 sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1011-rt5682.c b/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1011-rt5682.c
index e103102d7ef6..9e6b54e19c23 100644
--- a/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1011-rt5682.c
+++ b/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1011-rt5682.c
@@ -421,7 +421,7 @@ static int mt8195_dptx_hw_params(struct snd_pcm_substream *substream,
 				      SND_SOC_CLOCK_OUT);
 }
 
-static struct snd_soc_ops mt8195_dptx_ops = {
+static const struct snd_soc_ops mt8195_dptx_ops = {
 	.hw_params = mt8195_dptx_hw_params,
 };
 
diff --git a/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c b/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c
index 95abaadcd842..e22e5fd40984 100644
--- a/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c
+++ b/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c
@@ -391,7 +391,7 @@ static int mt8195_dptx_hw_params(struct snd_pcm_substream *substream,
 				      SND_SOC_CLOCK_OUT);
 }
 
-static struct snd_soc_ops mt8195_dptx_ops = {
+static const struct snd_soc_ops mt8195_dptx_ops = {
 	.hw_params = mt8195_dptx_hw_params,
 };
 
-- 
2.34.1

