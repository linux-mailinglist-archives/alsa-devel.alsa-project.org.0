Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C944E5BD3E0
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Sep 2022 19:36:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E25784B;
	Mon, 19 Sep 2022 19:35:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E25784B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663608968;
	bh=D+sDrURLZT4KXaHElTL7pM+CIFisZ3dz8YxnmOnSOxA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=iLHY6rPfP8sQQThmRZeuXE2uMiSaxWA3ly4HxUbV7leH4QYkdyVme6onURrqdmdTr
	 w6jQFD+ZieYRBqkMcbpK3xT0N4oZBwklu4Z4ENVbJFCXXv0WVRrlPuDEZwyN4Oz7PX
	 FIpNjUtzphVS73Y3B2XtbF5GKuaHYujlpziRLXcE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B71CFF8032B;
	Mon, 19 Sep 2022 19:35:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6E1FDF8023A; Mon, 19 Sep 2022 19:35:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RDNS_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from hutie.ust.cz (unknown [IPv6:2a03:3b40:fe:f0::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DB938F80134
 for <alsa-devel@alsa-project.org>; Mon, 19 Sep 2022 19:35:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DB938F80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=cutebit.org header.i=@cutebit.org
 header.b="Xg+liSKc"
From: =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
 t=1663608899; bh=d7mgKUnVCfrgkyGqmQzUJTvvGo3IZOIgUBZZ0DNTb8Q=;
 h=From:To:Cc:Subject:Date;
 b=Xg+liSKcnXx0197eHUxd/Uj9XdbE8M9EHtbSry38u4R02iAoyBeA5XNucQRba4liV
 /aV6rfGgdN7z8d5XnKEeYFYpihTrHzybfRvEWGDt/7QjtLFfp5QY2ZLZpw8y7T5BJB
 iS/9Urv3RPVoBaPfM4Z4IMotfYuLqGvFKt0mqDNo=
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH] ASoC: tas2770: Reinit regcache on reset
Date: Mon, 19 Sep 2022 19:34:53 +0200
Message-Id: <20220919173453.84292-1-povik+lin@cutebit.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Stephen Kitt <steve@sk2.org>,
 linux-kernel@vger.kernel.org, navada@ti.com, Dan Murphy <dmurphy@ti.com>,
 =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>
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

On probe of the ASoC component, the device is reset but the regcache is
retained. This means the regcache gets out of sync if the codec is
rebound to a sound card for a second time. Fix it by reinitializing the
regcache to defaults after the device is reset.

Fixes: b0bcbe615756 ("ASoC: tas2770: Fix calling reset in probe")
Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
---
 sound/soc/codecs/tas2770.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/codecs/tas2770.c b/sound/soc/codecs/tas2770.c
index bb653b664146..b6765235a4b3 100644
--- a/sound/soc/codecs/tas2770.c
+++ b/sound/soc/codecs/tas2770.c
@@ -495,6 +495,8 @@ static struct snd_soc_dai_driver tas2770_dai_driver[] = {
 	},
 };
 
+static const struct regmap_config tas2770_i2c_regmap;
+
 static int tas2770_codec_probe(struct snd_soc_component *component)
 {
 	struct tas2770_priv *tas2770 =
@@ -508,6 +510,7 @@ static int tas2770_codec_probe(struct snd_soc_component *component)
 	}
 
 	tas2770_reset(tas2770);
+	regmap_reinit_cache(tas2770->regmap, &tas2770_i2c_regmap);
 
 	return 0;
 }
-- 
2.33.0

