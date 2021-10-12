Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA9A42AE42
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Oct 2021 22:56:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AF796168B;
	Tue, 12 Oct 2021 22:56:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AF796168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634072211;
	bh=jss7KqQCoYs5QB3+kPTOjOAyp3nV/s6gXMzOWxoGOFg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HRE066sAITGALgDrzCZjMfhCzAJ58SFXa5ak+6U19Xue6z5O68OSIKJW0GqDUZxvH
	 Av1Qmx6dKe2PUcviRzhG7HnxW9OfINXsYUk/eGUOS4mTRi7xxV8yQuBZEWm9/pbU04
	 LNxU9eT931mVdFKMV+kezW/RtwBycG72oIH2x2XY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 08AF9F800C0;
	Tue, 12 Oct 2021 22:55:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EF7D7F80212; Tue, 12 Oct 2021 22:55:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 56CBDF800CB
 for <alsa-devel@alsa-project.org>; Tue, 12 Oct 2021 22:55:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56CBDF800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="do27g9P3"
Received: by mail-lf1-x129.google.com with SMTP id y15so2227479lfk.7
 for <alsa-devel@alsa-project.org>; Tue, 12 Oct 2021 13:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jsTwWPNABO7t6fYSb716Ke2gFPfWwq6MzrlHVefhOG4=;
 b=do27g9P3KSwt6TKXbelpk/lcgXOP6GAq8OMm5ZHF/QAlOrJTGEOkXuRQqA4TUJ9c/P
 66JUgBvqGQLSmp13USy9H6SlSuFXh0cYCidN0h/0pSpTGwW04N6fMGJ7VMaKENkwSjj4
 14SbMobnC4j+lhRxoNOlGSfbmvsiksnZoLUiLsxkbVL77M6iqYhkMLiVa4m9vE6Fqyze
 0Mef049jkTxMYqYvutftjFLn3g5OsQJVA9vNT4fTVpa22hwfkRJVOg3fiS7tf2cHdmbz
 WIx8LqVz/eHXA6efl75cAHbBCGlf1Ae1qenLFwaF2m21Y4LsU8vSvFTEpzbW80JCsb/G
 KyGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jsTwWPNABO7t6fYSb716Ke2gFPfWwq6MzrlHVefhOG4=;
 b=isexoYGX6oTa+wOu0qxi7sDrBetXKNGAAgZfJJj9Yt+RM6bqGQYvR7JWs3XZUP4/ga
 3/jQD6g+QL+r54tmMCThT77RKiZaGUk66wE2e7k1H1gfqDdshvmcECHJZ6YYoGPWxNwF
 +RUwdYQL6y83l/6W5EnfZ/5SvH+bg+aOUQqyHT5xct9Sv8NFV4tIPsQTsmaIR/Jeixbi
 JPCM6Bxczl7PtMdFYl1M6LIiG1iQjUREnuZHxYE2mKt4WNwGJ7pQS8Zl6P+Q5Nq55v2U
 KCy1Zz7IqId0HgvmJhDUHLlfjgv6azd6VfhrYZQFkxVDGtGoVn7li0AQcRMgdhyL72l8
 7VXA==
X-Gm-Message-State: AOAM530pxUyJTb7nm/gtEJmO64oFXTAng6pW8/YX9FpFEeAQcDFJO4Dv
 2POE2hdLL/GmmxDsLW59ZQA=
X-Google-Smtp-Source: ABdhPJz0oVp0tzpS6B29DUSsGL7OQuWzGhvARKE6lL1ybJlZbpr+cXjJ8yKiFPTS4fdrrCuRDf44iw==
X-Received: by 2002:ac2:4c48:: with SMTP id o8mr30372629lfk.286.1634072129486; 
 Tue, 12 Oct 2021 13:55:29 -0700 (PDT)
Received: from localhost.localdomain (h-158-174-22-5.NA.cust.bahnhof.se.
 [158.174.22.5])
 by smtp.gmail.com with ESMTPSA id p23sm1274514ljm.127.2021.10.12.13.55.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 13:55:29 -0700 (PDT)
From: Rikard Falkeborn <rikard.falkeborn@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH] ASoC: mediatek: Constify static snd_soc_ops
Date: Tue, 12 Oct 2021 22:55:21 +0200
Message-Id: <20211012205521.14098-1-rikard.falkeborn@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 Tzung-Bi Shih <tzungbi@google.com>, linux-mediatek@lists.infradead.org,
 Rikard Falkeborn <rikard.falkeborn@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
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

These are only assigned to the ops field in the snd_soc_dai_link struct
which is a pointer to const struct snd_soc_ops. Make them const to allow
the compiler to put them in read-only memory.

Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
---
 sound/soc/mediatek/mt2701/mt2701-cs42448.c                 | 2 +-
 sound/soc/mediatek/mt2701/mt2701-wm8960.c                  | 2 +-
 sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/mt2701/mt2701-cs42448.c b/sound/soc/mediatek/mt2701/mt2701-cs42448.c
index 44a8d5cfb0aa..d9fd6eb786aa 100644
--- a/sound/soc/mediatek/mt2701/mt2701-cs42448.c
+++ b/sound/soc/mediatek/mt2701/mt2701-cs42448.c
@@ -146,7 +146,7 @@ static int mt2701_cs42448_be_ops_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static struct snd_soc_ops mt2701_cs42448_be_ops = {
+static const struct snd_soc_ops mt2701_cs42448_be_ops = {
 	.hw_params = mt2701_cs42448_be_ops_hw_params
 };
 
diff --git a/sound/soc/mediatek/mt2701/mt2701-wm8960.c b/sound/soc/mediatek/mt2701/mt2701-wm8960.c
index 414e422c0eba..f56de1b918bf 100644
--- a/sound/soc/mediatek/mt2701/mt2701-wm8960.c
+++ b/sound/soc/mediatek/mt2701/mt2701-wm8960.c
@@ -40,7 +40,7 @@ static int mt2701_wm8960_be_ops_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static struct snd_soc_ops mt2701_wm8960_be_ops = {
+static const struct snd_soc_ops mt2701_wm8960_be_ops = {
 	.hw_params = mt2701_wm8960_be_ops_hw_params
 };
 
diff --git a/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c b/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
index 94dcbd36c869..aeb1af86047e 100644
--- a/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
+++ b/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
@@ -335,7 +335,7 @@ static void mt8183_mt6358_tdm_shutdown(struct snd_pcm_substream *substream)
 			__func__, ret);
 }
 
-static struct snd_soc_ops mt8183_mt6358_tdm_ops = {
+static const struct snd_soc_ops mt8183_mt6358_tdm_ops = {
 	.startup = mt8183_mt6358_tdm_startup,
 	.shutdown = mt8183_mt6358_tdm_shutdown,
 };
-- 
2.33.0

