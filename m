Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B1DBE2CE832
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Dec 2020 07:38:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 44509185D;
	Fri,  4 Dec 2020 07:37:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 44509185D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607063898;
	bh=9i2+EW+B5TQycEiJYXF4u+0gBMreetSfRvr8RqqsTYw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=rf0fCxM6ZY0W/yOKLy9HsvKHQyqG8cz5L5A3RWMVwSpnXpqVR91u3xud0yFxHRDK6
	 59Yt4CNBQI78+p6X+4waF4+OPTTeGfae4F5bGSEGcE8KqiF8i/hRgUaeviH5S8USZx
	 /1hj566GtF4AxQqaAEL1e0I5A7lJJeEOWDG/mXiE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B262BF80273;
	Fri,  4 Dec 2020 07:36:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C18AAF800E2; Fri,  4 Dec 2020 07:36:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 001A1F800E8
 for <alsa-devel@alsa-project.org>; Fri,  4 Dec 2020 07:36:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 001A1F800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="GEVjSLhL"
Received: by mail-pj1-x1042.google.com with SMTP id f14so2508494pju.4
 for <alsa-devel@alsa-project.org>; Thu, 03 Dec 2020 22:36:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=d8zcL1eX6CvAPfDYqfT78b23zOBds1VQznv7wReCOyU=;
 b=GEVjSLhLfO+7YBd6hC05bIWrNYzx9F2pnutdRFYJ1+IKuwS7ZoUn+AVv3CfetyArsD
 BImgo9Bb20guGnnzUemlfcMdGuP3VedWB9JRgoVlZvF4Vzn1rg7TU6GG20nfreOHkT7o
 4WBwN2u5Gzdc8w+2F+KpN7yaPqgJzPQUFSKsg6p6uJeDLuB2b2qJzRYqf0spO33BNW23
 XCMXW68hf9FGj+nW0Wjrj6CtRsaYFkTm2bUqKJxvBQteC0Z3icJJmwEe4jL+5bpTbIC/
 5WJdbB74CAYI6JJYCOKUSVbhZW29sRSqHV+RRwMC95v8DiliBfqzLXJyVdKSGVKGrBZC
 zQYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=d8zcL1eX6CvAPfDYqfT78b23zOBds1VQznv7wReCOyU=;
 b=nsoxI5hEXaF1knyU4E85e7gxGErijMAq/Ri0pCZCnsUe+URtZLikZ3C3iTs7DqboqE
 9O2zR2dYVB+2PhX1TH6sWIum8ICpEHBr8njq0bmbeuxLArAkI4vezbLEZB7WUa3cClTh
 vFovOFXshtHBNdy+OXhutqiWwUgbhtDtBMU5wJiKL9fFCO+XLyDBa/iqtdSVXoVt6k1S
 DqdhRmslgc/1I6oh+W8l8kBKfoBNKSVVBFKVwAHLZnR2+mE62DSUaZUxf9IW2Zlao4s8
 HhWqH8r9kOvGbiJFIuYFF3Dpa2g8BbuZO6rkhtZ0uy1zbysPpgjYotMuKewhUIcpOWpw
 kBcQ==
X-Gm-Message-State: AOAM532LYbB1recROlLFXG2fsWRQqTIX3vp0eOLCvvlFCNiN/qsVaIeH
 XofBKJTiqgu/kybAxSQfSFg=
X-Google-Smtp-Source: ABdhPJx6UqI+qe96zyrcJ0fjsLM79ORJhXCDk3xmBRveOXZPHpMfdOZ91FML3RrmePr0Fd+UGUrG6g==
X-Received: by 2002:a17:90a:550d:: with SMTP id
 b13mr2697496pji.133.1607063789062; 
 Thu, 03 Dec 2020 22:36:29 -0800 (PST)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
 by smtp.gmail.com with ESMTPSA id s7sm1061799pju.37.2020.12.03.22.36.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Dec 2020 22:36:28 -0800 (PST)
From: Chuhong Yuan <hslester96@gmail.com>
To: 
Subject: [PATCH v2] ASoC: amd: change clk_get() to devm_clk_get() and add
 missed checks
Date: Fri,  4 Dec 2020 14:36:10 +0800
Message-Id: <20201204063610.513556-1-hslester96@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Chuhong Yuan <hslester96@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
 Agrawal Akshu <Akshu.Agrawal@amd.com>
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

cz_da7219_init() does not check the return values of clk_get(),
while da7219_clk_enable() calls clk_set_rate() to dereference
the pointers.
Add checks to fix the problems.
Also, change clk_get() to devm_clk_get() to avoid data leak after
failures.

Fixes: bb24a31ed584 ("ASoC: AMD: Configure wclk and bclk of master codec")
Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
---
Changes in v2:
  - Replace clk_get() with devm_clk_get() to prevent data leak.

 sound/soc/amd/acp-da7219-max98357a.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/sound/soc/amd/acp-da7219-max98357a.c b/sound/soc/amd/acp-da7219-max98357a.c
index a7702e64ec51..849288d01c6b 100644
--- a/sound/soc/amd/acp-da7219-max98357a.c
+++ b/sound/soc/amd/acp-da7219-max98357a.c
@@ -73,8 +73,13 @@ static int cz_da7219_init(struct snd_soc_pcm_runtime *rtd)
 		return ret;
 	}
 
-	da7219_dai_wclk = clk_get(component->dev, "da7219-dai-wclk");
-	da7219_dai_bclk = clk_get(component->dev, "da7219-dai-bclk");
+	da7219_dai_wclk = devm_clk_get(component->dev, "da7219-dai-wclk");
+	if (IS_ERR(da7219_dai_wclk))
+		return PTR_ERR(da7219_dai_wclk);
+
+	da7219_dai_bclk = devm_clk_get(component->dev, "da7219-dai-bclk");
+	if (IS_ERR(da7219_dai_bclk))
+		return PTR_ERR(da7219_dai_bclk);
 
 	ret = snd_soc_card_jack_new(card, "Headset Jack",
 				SND_JACK_HEADSET | SND_JACK_LINEOUT |
-- 
2.26.2

