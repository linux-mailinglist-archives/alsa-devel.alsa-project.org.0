Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C2DD1216A33
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jul 2020 12:26:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 664DF84D;
	Tue,  7 Jul 2020 12:25:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 664DF84D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594117609;
	bh=0cXBTC4gpvSAswibk1QjXWR066hmA1WvUQJnf+4TcdQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=E+EFhrs1Fxynk/gvq0k70htyT/y8hI6LXT3F2TlZZ+yb+3NAO5ILvp1AwI8o7IJ1h
	 VbO1BdMJlnmWi42Ky/3wObcWylTWF9deulroawaePTEURjZjA1RDOuMAO0KNDij553
	 yf5MGHKE/Z1y7n1PHJq4iX2k+4TA5+JQlDSZuq00=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B0ADCF8027C;
	Tue,  7 Jul 2020 12:17:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A07BBF80334; Tue,  7 Jul 2020 12:17:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 44F9AF802A0
 for <alsa-devel@alsa-project.org>; Tue,  7 Jul 2020 12:17:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 44F9AF802A0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="QsQNaqhx"
Received: by mail-wm1-x344.google.com with SMTP id f18so45914981wml.3
 for <alsa-devel@alsa-project.org>; Tue, 07 Jul 2020 03:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+qKCC8gwbOOqZ6yEPkGSkmGeka7mYOZ7iXEWMftP650=;
 b=QsQNaqhxkVtL41tk1/qoGhyCm7rVJ4vpnlgVliFcwROlzr/daTSEoku3cq8UN82fQX
 IFbaFWVeeLZZcbS0019ujgPja2Nu5gkt/1krAFAUnVatnIx3B91JzL5kGlJDfics0Pav
 uL9Yr8HgEPEpP24WORMxYPT+RLeq0riRndWjJeO/uU4y0oO+r4jt9Ig0R0Pk8DMQcv7z
 rp4u8MT93nqSXy9KYnhrdA+GBJiH2sAaOi/Dy/QKPlv0PunseCYqkvxjRt83mLjFcW6Z
 alULEaJtZv8pRcmMemxrm7hMHD0NKnLzelBD/xb4HTuKiZ/wncZ/jnlVrwAmV3VlLCjX
 FiKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+qKCC8gwbOOqZ6yEPkGSkmGeka7mYOZ7iXEWMftP650=;
 b=S4MjOI3BVNNareYKa7LTcUT80jYDy1fenWuL2IddrsltmH04mid90CqGn2PD66NAHi
 yFMl4k/0Qw0ypLK9+zuWTtGPJ0EsPXjipK8TdwKda0HweH7fKKYfvXVKRPC7sm4BdXjD
 S/LUalK6DY2IK8yJgC1FumuQMSi41q3z5K6acN+he7U2mYhVA00lZss7THIxLcH33SRv
 FppwtvJnVe+ZPHZe1COrHmhrWe/KtosEI8SD5ggtI0cTUTYGTOBjL4+/6AosjV7wvcQj
 ljs7tJllNpZ4lNApx+Zgyx5uya6OUzPOlaFTN5pDZUhYgYTcB5rNXmBptpIxexqYvIMF
 VUdA==
X-Gm-Message-State: AOAM531tz1sZfwy4hUJ5FfCJrDAaBULKnME10v19SCVBuWpPeuIevE8f
 tQZJ0rt2frlRyAUlVP1KrJcUVg==
X-Google-Smtp-Source: ABdhPJx1ZbuUA9wWKqxxF1IHrewdkfGEfSuRE8l+gQGgDf17uueoN0ReeFhO3RmeiPsig4/tbI5/XQ==
X-Received: by 2002:a1c:e143:: with SMTP id y64mr3375157wmg.90.1594117023297; 
 Tue, 07 Jul 2020 03:17:03 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.206])
 by smtp.gmail.com with ESMTPSA id z8sm469409wmg.39.2020.07.07.03.17.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2020 03:17:02 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com
Subject: [PATCH 12/28] ASoC: codecs: ak4458: Remove set but never checked
 variable 'ret'
Date: Tue,  7 Jul 2020 11:16:26 +0100
Message-Id: <20200707101642.1747944-13-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200707101642.1747944-1-lee.jones@linaro.org>
References: <20200707101642.1747944-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 linux-kernel@vger.kernel.org,
 Junichi Wakasugi <wakasugi.jb@om.asahi-kasei.co.jp>,
 Mihai Serban <mihai.serban@nxp.com>, Lee Jones <lee.jones@linaro.org>,
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

Looks as though the result of snd_soc_update_bits() has never been checked.

Fixes the following W=1 kernel build warning(s):

 sound/soc/codecs/ak4458.c: In function ‘ak4458_set_dai_mute’:
 sound/soc/codecs/ak4458.c:408:16: warning: variable ‘ret’ set but not used [-Wunused-but-set-variable]

Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Junichi Wakasugi <wakasugi.jb@om.asahi-kasei.co.jp>
Cc: Mihai Serban <mihai.serban@nxp.com>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 sound/soc/codecs/ak4458.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/ak4458.c b/sound/soc/codecs/ak4458.c
index f180cb5dfe4f1..39ae089dcd1d8 100644
--- a/sound/soc/codecs/ak4458.c
+++ b/sound/soc/codecs/ak4458.c
@@ -405,7 +405,7 @@ static int ak4458_set_dai_mute(struct snd_soc_dai *dai, int mute)
 {
 	struct snd_soc_component *component = dai->component;
 	struct ak4458_priv *ak4458 = snd_soc_component_get_drvdata(component);
-	int nfs, ndt, ret, reg;
+	int nfs, ndt, reg;
 	int ats;
 
 	nfs = ak4458->fs;
@@ -416,14 +416,14 @@ static int ak4458_set_dai_mute(struct snd_soc_dai *dai, int mute)
 	ndt = att_speed[ats] / (nfs / 1000);
 
 	if (mute) {
-		ret = snd_soc_component_update_bits(component, AK4458_01_CONTROL2,  0x01, 1);
+		snd_soc_component_update_bits(component, AK4458_01_CONTROL2,  0x01, 1);
 		mdelay(ndt);
 		if (ak4458->mute_gpiod)
 			gpiod_set_value_cansleep(ak4458->mute_gpiod, 1);
 	} else {
 		if (ak4458->mute_gpiod)
 			gpiod_set_value_cansleep(ak4458->mute_gpiod, 0);
-		ret = snd_soc_component_update_bits(component, AK4458_01_CONTROL2, 0x01, 0);
+		snd_soc_component_update_bits(component, AK4458_01_CONTROL2, 0x01, 0);
 		mdelay(ndt);
 	}
 
-- 
2.25.1

