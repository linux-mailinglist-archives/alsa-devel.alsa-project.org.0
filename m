Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2324E3E86E9
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Aug 2021 02:01:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9EBDD173E;
	Wed, 11 Aug 2021 02:00:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9EBDD173E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628640084;
	bh=YsyMp5IFab2iW5xBo4Sg0DGsgzqNwlXb+m5/h/q4WCs=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=mP0AdmTQQ1FHb0yEsuU8lgmLb29YdMmKdk8dSIsBb6Xn7L9gcMeD1e+k9OUNb6XY+
	 8rZAVKJUTi7041d8Ea/gbBQOmoshsxEgXPjHNJYJQ8tCn1R5cUTBn5MECKugvmCFH4
	 t1teJ/Vv962bt8tCBlcMjrui2rvnomVyOENvnuOM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 25B73F80279;
	Wed, 11 Aug 2021 01:59:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EC99CF8025D; Wed, 11 Aug 2021 01:59:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D6F06F8016B
 for <alsa-devel@alsa-project.org>; Wed, 11 Aug 2021 01:59:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D6F06F8016B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="Qm3ibv1d"
Received: by mail-pl1-x633.google.com with SMTP id b7so268546plh.7
 for <alsa-devel@alsa-project.org>; Tue, 10 Aug 2021 16:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2kIwCa145vshm7y/cubjS6uAn6tovnETjzr2YzBV56k=;
 b=Qm3ibv1dXn2KYVJ22i9TDFEeI/4v/Yb8FbsJp4rFTZPNEQ338wK3SAL4iuxsxgpEbe
 L0elOBP5pC/SFLeLusG+r6yIObNHCHSSPNSDffHNFKCflx7nRgnygY6EFhN0NcCNJ++B
 TXJd1uaz1d5pMk8kxKX6oB9RODH71lCf4eA+I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2kIwCa145vshm7y/cubjS6uAn6tovnETjzr2YzBV56k=;
 b=l03HDhUlu7nkEqx85G+gbN8NORoySwFb2c5ijkkEEXS2XTbEfQGAoRSiD1pE1sQ6oG
 9Yk/ESq9sHIy5XWucXKcG3qqffLbW38d9OZSr2eb8kiyl+uFx7o29m3P0bzPDkCzH/s0
 bhxxImPM76HfoCbvo8UQL5xTJRawiNxzjZoeV/bmuZaXJq6z14DDDsEDhrTt6/oCu0Nb
 HvdelRXUTmyrfXHMj6PlitfHhbmkYceZCW2DPiOt7a09g5Lr81zV6fBzgYEBEpGdlSAI
 s6R63Jq8Xf5nu1nOGUEiy97Qu5GKNiesuwOoBBqZ/fWL/YtaA98GElhVZL6ghP9n8XOR
 eFKw==
X-Gm-Message-State: AOAM532aCDErpVMwKOv3Mp8h++E6grydNvdc/IzA/m2KCTLZxlA4rTfD
 Ym3gbBRmHf43RmpWFNiWhSZ5IQ==
X-Google-Smtp-Source: ABdhPJwk1B6jGAar9rqvlMoQYMCL+kY9aA6kGVcctNttFVeTy7KgOhY/GSuEFb2xCWTasZMNkKdyXA==
X-Received: by 2002:a05:6a00:1a0e:b029:3c2:ee2f:b236 with SMTP id
 g14-20020a056a001a0eb02903c2ee2fb236mr31294329pfv.80.1628639977191; 
 Tue, 10 Aug 2021 16:59:37 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:cf6d:7a54:584e:cf3d])
 by smtp.gmail.com with ESMTPSA id l2sm24915272pfc.157.2021.08.10.16.59.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Aug 2021 16:59:36 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Oder Chiou <oder_chiou@realtek.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH] ASoC: rt5682: Properly turn off regulators if wrong device ID
Date: Tue, 10 Aug 2021 16:59:15 -0700
Message-Id: <20210810165850.1.I4a1d9aa5d99e05aeee15c2768db600158d76cab8@changeid>
X-Mailer: git-send-email 2.32.0.605.g8dce9f2422-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Douglas Anderson <dianders@chromium.org>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Stephen Boyd <swboyd@chromium.org>,
 Bard Liao <bardliao@realtek.com>
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

When I booted up on a board that had a slightly different codec
stuffed on it, I got this message at bootup:

  rt5682 9-001a: Device with ID register 6749 is not rt5682

That's normal/expected, but what wasn't normal was the splat that I
got after:

  WARNING: CPU: 7 PID: 176 at drivers/regulator/core.c:2151 _regulator_put+0x150/0x158
  pc : _regulator_put+0x150/0x158
  ...
  Call trace:
   _regulator_put+0x150/0x158
   regulator_bulk_free+0x48/0x70
   devm_regulator_bulk_release+0x20/0x2c
   release_nodes+0x1cc/0x244
   devres_release_all+0x44/0x60
   really_probe+0x17c/0x378
   ...

This is because the error paths don't turn off the regulator. Let's
fix that.

Fixes: 0ddce71c21f0 ("ASoC: rt5682: add rt5682 codec driver")
Fixes: 87b42abae99d ("ASoC: rt5682: Implement remove callback")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 sound/soc/codecs/rt5682-i2c.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt5682-i2c.c b/sound/soc/codecs/rt5682-i2c.c
index 4a56a52adab5..1cc07812b5ac 100644
--- a/sound/soc/codecs/rt5682-i2c.c
+++ b/sound/soc/codecs/rt5682-i2c.c
@@ -117,6 +117,13 @@ static struct snd_soc_dai_driver rt5682_dai[] = {
 	},
 };
 
+static void rt5682_i2c_disable_regulators(void *data)
+{
+	struct rt5682_priv *rt5682 = data;
+
+	regulator_bulk_disable(ARRAY_SIZE(rt5682->supplies), rt5682->supplies);
+}
+
 static int rt5682_i2c_probe(struct i2c_client *i2c,
 		const struct i2c_device_id *id)
 {
@@ -156,6 +163,10 @@ static int rt5682_i2c_probe(struct i2c_client *i2c,
 		dev_err(&i2c->dev, "Failed to request supplies: %d\n", ret);
 		return ret;
 	}
+	ret = devm_add_action_or_reset(&i2c->dev, rt5682_i2c_disable_regulators,
+				       rt5682);
+	if (ret)
+		return ret;
 
 	ret = regulator_bulk_enable(ARRAY_SIZE(rt5682->supplies),
 				    rt5682->supplies);
@@ -285,7 +296,6 @@ static int rt5682_i2c_remove(struct i2c_client *client)
 	struct rt5682_priv *rt5682 = i2c_get_clientdata(client);
 
 	rt5682_i2c_shutdown(client);
-	regulator_bulk_disable(ARRAY_SIZE(rt5682->supplies), rt5682->supplies);
 
 	return 0;
 }
-- 
2.32.0.605.g8dce9f2422-goog

