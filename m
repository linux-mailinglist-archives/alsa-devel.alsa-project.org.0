Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2745321A4
	for <lists+alsa-devel@lfdr.de>; Tue, 24 May 2022 05:39:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8A24E170F;
	Tue, 24 May 2022 05:38:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8A24E170F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653363542;
	bh=8rKy9tZUG+CMft2I8WxU/qQDmhaMbYbshZIrLQjUOlQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=cNjrIQLD8tlcS8xMgbBiBB7c6X2PVW6Ie/X7kicn/Ffa9wM9Nh9ft4zIpfm3t9nzV
	 oePffPvOGbnrG43eAMNL4FaD6qHTOXCLcEzU5i/TgL2JwhFtna/2b+48iLCUhEwcXU
	 AOKa1VN9Wrq0P1yOzAs6GItcqZU6E8P4SLhyTdXw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CF3CCF80100;
	Tue, 24 May 2022 05:38:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3FE41F804D1; Tue, 24 May 2022 05:38:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-relay-canonical-0.canonical.com
 (smtp-relay-canonical-0.canonical.com [185.125.188.120])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 990B4F80116
 for <alsa-devel@alsa-project.org>; Tue, 24 May 2022 05:37:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 990B4F80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="EIDUp/cg"
Received: from localhost.localdomain (unknown [123.112.66.143])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 709AC3F5FD; 
 Tue, 24 May 2022 03:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1653363466;
 bh=kOL31z7joF/UIYtldke0mOiwgPQmglUcJ4XqzlfHdJw=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
 b=EIDUp/cgJPpuxVUge6XTyDWjaz16B11hXs553SpDSaJtAC02IpNVJ2o52swetP/ka
 1EkOVCsvZQ8Ho1gOJu/uo0jWVFLCaGa1vWrqX9pKWYapg/qOCrE/hvkx3VcgQMtwUk
 7Et7mWN1fGG7/ZiXy2JhsqTSny1Nd4w4+AVFtUwFZ2ME1YEsEbHaRhyyfPoVWh2d7Q
 ypiaIN9VOl0e6oL2c0QvKkJPBTGHr7H7ej8qIxKg9cZfFpJrLVr/W8jliUoFT68wxj
 lJtHLgJavuuRIAUZGcNU+QammGmFDMU8uwVU1m/x0jNB7tl7zcCnAID/9nWkX02l77
 lcpb7uHlJeVuQ==
From: Hui Wang <hui.wang@canonical.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH] ASoC: nau8822: choose the best master clock prescalar
Date: Tue, 24 May 2022 11:33:09 +0800
Message-Id: <20220524033309.30289-1-hui.wang@canonical.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: wtli@nuvoton.com, kchsu0@nuvoton.com, ctlin0@nuvoton.com
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

We have an imx6sx EVB with the codec nau8822, when playing the audio
with 48k sample rate, the audio sounds distorted and obviously faster
than expected.

The codec input MCLK is 24000000Hz on our board, if the target sample
rate is 48000Hz, with the current algorithm, the computed prescalar
will result in 62500Hz, with the patched algorithm, the sample rate
will be 46875Hz which is nearer the target sample rate.

And for other sample rate like 44100, 22050, 11025 or 8000, the
patched algorithm has no difference with the current algorithm, they
will generate the same prescalar and the same sample rate.

Signed-off-by: Hui Wang <hui.wang@canonical.com>
---
 sound/soc/codecs/nau8822.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/nau8822.c b/sound/soc/codecs/nau8822.c
index 66bbd8f4f1ad..b67fdf64ddab 100644
--- a/sound/soc/codecs/nau8822.c
+++ b/sound/soc/codecs/nau8822.c
@@ -668,21 +668,24 @@ static int nau8822_config_clkdiv(struct snd_soc_dai *dai, int div, int rate)
 	struct snd_soc_component *component = dai->component;
 	struct nau8822 *nau8822 = snd_soc_component_get_drvdata(component);
 	struct nau8822_pll *pll = &nau8822->pll;
+	int diff = INT_MAX;
 	int i, sclk, imclk;
 
 	switch (nau8822->div_id) {
 	case NAU8822_CLK_MCLK:
 		/* Configure the master clock prescaler div to make system
 		 * clock to approximate the internal master clock (IMCLK);
-		 * and large or equal to IMCLK.
+		 * and find the nearest value to IMCLK.
 		 */
 		div = 0;
 		imclk = rate * 256;
 		for (i = 1; i < ARRAY_SIZE(nau8822_mclk_scaler); i++) {
 			sclk = (nau8822->sysclk * 10) /	nau8822_mclk_scaler[i];
-			if (sclk < imclk)
+			if (abs(sclk - imclk) < diff) {
+				diff = abs(sclk - imclk);
+				div =  i;
+			} else
 				break;
-			div = i;
 		}
 		dev_dbg(component->dev, "master clock prescaler %x for fs %d\n",
 			div, rate);
-- 
2.25.1

