Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A8D546358C
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Nov 2021 14:34:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A05142016;
	Tue, 30 Nov 2021 14:33:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A05142016
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638279272;
	bh=cFFFl09QNcchSnkdreOFc4IyRatOzaoQLRp3ZQpCB+4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=moJWky2VNCCfHOAGoipN+CHWEVCY7tuudjKRJLUNmP4dC6od4rqWUv23EoUlCJ/fg
	 NZCbTFssmomwP9MmWnQGtPL/ShnhaPJSqetN8PnZA8NNJ4lngGOVZP8LokTZ/oWDf5
	 q9cxgvBAcqRGQ2yGiXqp2DQlviVKXjryeimvlzC0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0D4F3F8020D;
	Tue, 30 Nov 2021 14:33:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 492FBF80240; Mon, 29 Nov 2021 23:42:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D9D7DF800EE
 for <alsa-devel@alsa-project.org>; Mon, 29 Nov 2021 23:42:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D9D7DF800EE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.b="jxpzTHsc"
Received: by mail-wm1-x32f.google.com with SMTP id
 g191-20020a1c9dc8000000b0032fbf912885so13433139wme.4
 for <alsa-devel@alsa-project.org>; Mon, 29 Nov 2021 14:42:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dSJ69WXnC1WdVb/bXAkyJh3OPxw+iRBQYM0yKG9SCbc=;
 b=jxpzTHscIrNgspMXiFoVTJk0lBc6o0Zapq0FvaHXff2MvLPuzzp1f6YZtng2TbXySG
 TMwos1nkY+pX15tSV53a9Pg2NvdenlwbkSwMxXEArijQ0btkPpfCO28bpl/5dTLWVFPN
 t0ZeA8HG5XF8EAjNl63KhFZrJTyN7yRVOyIxZRAPjcc9YsH0BmVg8KzoFoi+OdIBCBet
 YBDEDDmgQ3LU+g7KvdjYoQ3dd+YxSgomukiWJIVBhj7t5x5jxN0EM3mKpRLwwaQN5MkT
 8jR/tWxjV8l+mrIJXbUb46ZZz5OI0Kj8FYNLvtc+HPI609Z5R82DOKyXYe3reEWRr7Ro
 zWzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dSJ69WXnC1WdVb/bXAkyJh3OPxw+iRBQYM0yKG9SCbc=;
 b=R1UT4+MJ73VBmk1eTmRdrtEBdFeZQ7HhutVMtQ7preMXkTyrbIwd6DREglZIGitvzT
 Hx/f6dcpjt4uemveNjlkvEr0VaFZeTtNn8xK0xo20T//WL6NYSVTyOHLYEbcmCKZMU8a
 0QPARzVcLPaQjIJ3R2AWG+hLENkWa3H4qo0cjKbcph4eNQUNuEf9YjO4ZjQn2IVTN02G
 lhxoIZPys130nnhFJiYwfLbRgVn8qQxlqpmG/RtWrb3sk3KMuFNwwvuyhdT7/2cn6uYB
 SNP5HU6m/sVS4yFbnKsJWMGN1JXBz8fW7NhPAjBBOVbCLt1SQHfbm04Nsf9/1F4mESkM
 HLnA==
X-Gm-Message-State: AOAM5307NiZGF4MbnU3kU8SxRNJZkOmdfTvYKwH1pDyYNnlwBENrDdHY
 jzjTlgjJcV31Tg==
X-Google-Smtp-Source: ABdhPJzCmAftKlAJF7pKfmu2M4+OGjYiKrbAcjK/ELLGn47QwqrbukpbA9WU3WWxGyWtm9i+SJrvKQ==
X-Received: by 2002:a05:600c:4982:: with SMTP id h2mr887917wmp.4.1638225758085; 
 Mon, 29 Nov 2021 14:42:38 -0800 (PST)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194])
 by smtp.gmail.com with ESMTPSA id a1sm19126546wri.89.2021.11.29.14.42.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 14:42:37 -0800 (PST)
From: Colin Ian King <colin.i.king@googlemail.com>
X-Google-Original-From: Colin Ian King <colin.i.king@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, alsa-devel@alsa-project.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH] ASoC: mediatek: mt8195: make several arrays static const
Date: Mon, 29 Nov 2021 22:42:36 +0000
Message-Id: <20211129224236.506883-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 30 Nov 2021 14:33:14 +0100
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
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

Don't populate various arrays on the stack but instead make them
static const. Also makes the object code smaller by a few hundred
bytes.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 sound/soc/mediatek/mt8195/mt8195-afe-clk.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-clk.c b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
index 8420b2c71332..c2543f4cffb7 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
@@ -326,7 +326,7 @@ int mt8195_afe_enable_reg_rw_clk(struct mtk_base_afe *afe)
 {
 	struct mt8195_afe_private *afe_priv = afe->platform_priv;
 	int i;
-	unsigned int clk_array[] = {
+	static const unsigned int clk_array[] = {
 		MT8195_CLK_SCP_ADSP_AUDIODSP, /* bus clock for infra */
 		MT8195_CLK_TOP_AUDIO_H_SEL, /* clock for ADSP bus */
 		MT8195_CLK_TOP_AUDIO_LOCAL_BUS_SEL, /* bus clock for DRAM access */
@@ -347,7 +347,7 @@ int mt8195_afe_disable_reg_rw_clk(struct mtk_base_afe *afe)
 {
 	struct mt8195_afe_private *afe_priv = afe->platform_priv;
 	int i;
-	unsigned int clk_array[] = {
+	static const unsigned int clk_array[] = {
 		MT8195_CLK_AUD_A1SYS,
 		MT8195_CLK_AUD_A1SYS_HP,
 		MT8195_CLK_AUD_AFE,
@@ -380,11 +380,11 @@ static int mt8195_afe_enable_timing_sys(struct mtk_base_afe *afe)
 {
 	struct mt8195_afe_private *afe_priv = afe->platform_priv;
 	int i;
-	unsigned int clk_array[] = {
+	static const unsigned int clk_array[] = {
 		MT8195_CLK_AUD_A1SYS,
 		MT8195_CLK_AUD_A2SYS,
 	};
-	unsigned int cg_array[] = {
+	static const unsigned int cg_array[] = {
 		MT8195_TOP_CG_A1SYS_TIMING,
 		MT8195_TOP_CG_A2SYS_TIMING,
 		MT8195_TOP_CG_26M_TIMING,
@@ -403,11 +403,11 @@ static int mt8195_afe_disable_timing_sys(struct mtk_base_afe *afe)
 {
 	struct mt8195_afe_private *afe_priv = afe->platform_priv;
 	int i;
-	unsigned int clk_array[] = {
+	static const unsigned int clk_array[] = {
 		MT8195_CLK_AUD_A2SYS,
 		MT8195_CLK_AUD_A1SYS,
 	};
-	unsigned int cg_array[] = {
+	static const unsigned int cg_array[] = {
 		MT8195_TOP_CG_26M_TIMING,
 		MT8195_TOP_CG_A2SYS_TIMING,
 		MT8195_TOP_CG_A1SYS_TIMING,
-- 
2.33.1

