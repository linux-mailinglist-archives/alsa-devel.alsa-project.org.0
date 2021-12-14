Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF86473ABC
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Dec 2021 03:26:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 759441F2B;
	Tue, 14 Dec 2021 03:25:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 759441F2B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639448800;
	bh=wjWb1uKpMdzmt/t5YDMHZtBtLZQhMofVNN3c/LRQ6XY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=FSjmaEW2xU7VqU9iO71tT0qb37NyI0pBGDwVQZ8oquasAWY4U8i7mvFlgBvv7ZpI1
	 5FGvk5T2swfWDngZKrTfue+PAP5kdIlUgWJFAfIs1VgyR3RCRh/RbOhUf6rZDW49k8
	 MT4Qe8Mdpt2vHaf3NexkS5Sn6XRY/rq/NEf0QuLg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E247F80249;
	Tue, 14 Dec 2021 03:25:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DA765F8013C; Tue, 14 Dec 2021 03:25:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4C922F8013C
 for <alsa-devel@alsa-project.org>; Tue, 14 Dec 2021 03:25:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4C922F8013C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="QlyofaDy"
Received: by mail-pf1-x42b.google.com with SMTP id z6so16588747pfe.7
 for <alsa-devel@alsa-project.org>; Mon, 13 Dec 2021 18:25:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Yxd2Yo2UBVtuTCHBx1Rt0MUSlSVwUw6mQJuM6lvxUxw=;
 b=QlyofaDyFgpcphrLj7nebTesCpf6bugmFwRgfnBeuolqusfu7gXHLED/JnvcjCdqOo
 9sG7uRZpE5MJXB96XK+jeA+w8lXUw+sUM+O7SMy67iFyjSBw0D5gZfXOkdfc+qa7dOL8
 MrSsu1gWqfub//VAYo4P4JbBHDVcwTvvxylmk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Yxd2Yo2UBVtuTCHBx1Rt0MUSlSVwUw6mQJuM6lvxUxw=;
 b=lWGcZUxY+ed4Ol3vSxfoJ1LUWb5Yh1i0meEqMBODXYHaGVeIDS0qP0cxsefAn2y65C
 eP47zyWe+OdG+APX/D/kb3uoMLXnmjUEfUCQ6w9FQrVrxjCJA0sjmih2NO+EHBe4xhFX
 dUDPNFxebJaDtx+UU7IXvLnruEF0JKTxAS7gWqx71RnMz/hd0JffZGh6Zh94QwE18wXR
 gSpr/F1fxIqRkVHtc7iG78NavqZFdd/IxpS2Wh8/4PyoHEqoquPmuJYo76G6a6cS84Xm
 8tY64odZhAKvbCAOyEPFEjvNrlINIU0NlmAdTAB6kUIckihcrCvwPDhxnRyv0tUrkb+p
 wLpw==
X-Gm-Message-State: AOAM5338uVpvEs7H2QhT8w9TnRhppD3Dwdgg8/lSoVdIr8n3uHZ8RB9o
 Dw7HZsnvU0YbP21RjGVWJoKelA==
X-Google-Smtp-Source: ABdhPJyLk77FSuMQVWlkHLrSsV67VNLoFgUuMKvxH7817b2npUaFoj1ht5lP38dydeC0wNqAuPiabw==
X-Received: by 2002:a63:748:: with SMTP id 69mr1700282pgh.517.1639448719811;
 Mon, 13 Dec 2021 18:25:19 -0800 (PST)
Received: from judyhsiao-p920.tpe.corp.google.com
 ([2401:fa00:1:10:6d67:3339:cd09:e30a])
 by smtp.gmail.com with ESMTPSA id k8sm14243419pfc.197.2021.12.13.18.25.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Dec 2021 18:25:19 -0800 (PST)
From: Judy Hsiao <judyhsiao@chromium.org>
To: broonie@kernel.org
Subject: [v3] SoC: qcom: Distinguish headset codec by codec_dai->name
Date: Tue, 14 Dec 2021 10:25:09 +0800
Message-Id: <20211214022509.1288245-1-judyhsiao@chromium.org>
X-Mailer: git-send-email 2.34.1.173.g76aa8bc2d0-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: judyhsiao@google.com, Banajit Goswami <bgoswami@codeaurora.org>,
 cychiang@google.com, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, linux-arm-msm@vger.kernel.org,
 swboyd@chromium.org, dianders@chromium.org, Takashi Iwai <tiwai@suse.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Judy Hsiao <judyhsiao@chromium.org>, yuhsuan@chromium.org
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

Distinguish which headset codec is on the board by codec_dai->name
instead of card->name.

It fixes the crash of being unable to handle kernel paging requests
at virtual address ADDR by initializing the correct audio codec on
the board.

Call stack of the crash:
```
 Unable to handle kernel paging request at virtual address ...
 ...
 Call trace:
  rt5682_set_component_pll+0xcc/0xb78 [snd_soc_rt5682]
  snd_soc_component_set_pll+0x90/0x154
  snd_soc_dai_set_pll+0xf4/0x1ac
  sc7180_snd_startup+0x268/0x3c0 [snd_soc_sc7180]
  snd_soc_link_startup+0xa4/0x180
  soc_pcm_open+0x35c/0x15c8
  snd_pcm_open_substream+0xa90/0x13b0
  snd_pcm_open+0x1a4/0x55c
  snd_pcm_capture_open+0x7c/0xe8
  snd_open+0x2b8/0x2e4
  chrdev_open+0x364/0x3d4
  do_dentry_open+0x66c/0xc58
  vfs_open+0x7c/0x8c
  path_openat+0x108c/0x2bbc
  do_filp_open+0x15c/0x258
  do_sys_open+0x278/0x62c
  __arm64_compat_sys_openat+0x9c/0xb0
  ...
```

Fixes: 425c5fce8a03 ("ASoC: qcom: Add support for ALC5682I-VS codec")
Signed-off-by: Judy Hsiao <judyhsiao@chromium.org>
---
 sound/soc/qcom/sc7180.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/sc7180.c b/sound/soc/qcom/sc7180.c
index 2fff764a00a7..37225ef2563a 100644
--- a/sound/soc/qcom/sc7180.c
+++ b/sound/soc/qcom/sc7180.c
@@ -131,13 +131,13 @@ static int sc7180_snd_startup(struct snd_pcm_substream *substream)
 	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
 	int pll_id, pll_source, pll_in, pll_out, clk_id, ret;
 
-	if (!(strcmp(card->name, "sc7180-rt5682-max98357a-1mic"))) {
+	if (!strcmp(codec_dai->name, "rt5682-aif1")) {
 		pll_source = RT5682_PLL1_S_MCLK;
 		pll_id = 0;
 		clk_id = RT5682_SCLK_S_PLL1;
 		pll_out = RT5682_PLL1_FREQ;
 		pll_in = DEFAULT_MCLK_RATE;
-	} else if (!(strcmp(card->name, "sc7180-rt5682s-max98357a-1mic"))) {
+	} else if (!strcmp(codec_dai->name, "rt5682s-aif1")) {
 		pll_source = RT5682S_PLL_S_MCLK;
 		pll_id = RT5682S_PLL2;
 		clk_id = RT5682S_SCLK_S_PLL2;
-- 
2.31.0

