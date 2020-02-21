Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A64167D74
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Feb 2020 13:26:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 98F9A16D8;
	Fri, 21 Feb 2020 13:25:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 98F9A16D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582287977;
	bh=Eyx1O3bcdzOnfzPIy8zGyoLAcghfb4FAA8fcpkLyHFg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Lor4YUUMa5Y0nWlcmYf+mR+xR1C9nrsLfKojbROPEPE9oYPfAqTq1YwiPtl54wshP
	 3z42IBOGhhoglk3C1McSc4W17H/hlCLaIQ5xgGlEp/2kyYsFCIH3oG6uNx5G29cCVP
	 2FT5ObAwQjwUsVjc2K+un5tcFUfXnuiS31aOpXLo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C8D09F8028B;
	Fri, 21 Feb 2020 13:23:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B35DAF8027D; Fri, 21 Feb 2020 13:22:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 93E53F80240
 for <alsa-devel@alsa-project.org>; Fri, 21 Feb 2020 13:22:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 93E53F80240
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="h+fnNkSE"
Received: by mail-wr1-x441.google.com with SMTP id z3so1829066wru.3
 for <alsa-devel@alsa-project.org>; Fri, 21 Feb 2020 04:22:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eFN2VKHrE+JD0cGAI+3A9MIQDzvF5Lgt98hOYp/CejM=;
 b=h+fnNkSEO/98hXd04jWTDTvmFmrA5X04DN9GsSlTWb278VjQ4P84W9tyESgWeXKauk
 pDWX73mWc9x2mEm2j4qVjO9TRaM/zXOBrZ+Oqk2N66I03EhrNvbPIkpUHEv4PXMaXKOb
 xgmHB4/UJmQ3zKfW/Nkt3qcG2bdRqbFpPQnOdB+m1mes/eIzwWwDvmclqx3LULkwOIGy
 dUgQdVtJ1HGg4Ss0fs/kSjOQ1BEhyLIM6HkdByUE3WaPPyP12P21vVjRe7nu10fr7PoN
 G+MgD/56pXnelfkAr3ncqIxHumcsfYQjL9uWd1BggVHYq24XSuG4zhc6wlV5SdRIlq68
 j13A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eFN2VKHrE+JD0cGAI+3A9MIQDzvF5Lgt98hOYp/CejM=;
 b=QLInwbATq+VB5RCpP7Fg3N+k6RubK5+7F3aSsgDgcQLeWcIxbAKW0JmZNIRWKnY7Iw
 ohdkZ39h3Jl1EYyUj35I7Bq5HaSSQD5Noxe34FHgcoL7w+OSVU/8fbZulyIRzDlwuxYQ
 FajBWXRyX7P4MjwtQsQdBhqf0kTCHSl257jJvz4rN4xbptwS1peWQZ7QLZdfYPKAGigt
 pXl4G6bvaZxypJpA+XUGfz4MtFz2G/0NJqppsCG6Yu14Nk31DznOUqyVvUnzRsnkq6Um
 RG8lg7WuVNXOEBaDHeHYiP65wrvp2uFZddkon4u1xijFxsUp/Y9QCxz8egFdsl+WMsBJ
 LRqA==
X-Gm-Message-State: APjAAAW8aMgeucFUNH6oRpIRbA9Ctb9APHJhFT6dSTkE5y1LFV8Q7y7h
 EkWWb9BAEzpZ5VZ1bJbqQD2bRg==
X-Google-Smtp-Source: APXvYqyFpTaJFZg3SDWkgDp7ebkoEJ16w8vW9gMh5UJodOeQoZziNCQEeKl5uKjGXqwqFZdLufdOvQ==
X-Received: by 2002:a5d:5752:: with SMTP id q18mr50518201wrw.277.1582287771687; 
 Fri, 21 Feb 2020 04:22:51 -0800 (PST)
Received: from starbuck.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id p26sm3454653wmc.24.2020.02.21.04.22.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2020 04:22:51 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 3/3] ASoC: meson: axg-card: add toacodec support
Date: Fri, 21 Feb 2020 13:22:42 +0100
Message-Id: <20200221122242.1500093-4-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200221122242.1500093-1-jbrunet@baylibre.com>
References: <20200221122242.1500093-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
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

Make sure the axg audio card driver recognise the dai_link as a
codec-to-codec link if the cpu dai is the internal dac glue.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/axg-card.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/meson/axg-card.c b/sound/soc/meson/axg-card.c
index 372dc696cc8e..48651631bdcf 100644
--- a/sound/soc/meson/axg-card.c
+++ b/sound/soc/meson/axg-card.c
@@ -303,7 +303,8 @@ static int axg_card_cpu_is_tdm_iface(struct device_node *np)
 
 static int axg_card_cpu_is_codec(struct device_node *np)
 {
-	return of_device_is_compatible(np, DT_PREFIX "g12a-tohdmitx");
+	return of_device_is_compatible(np, DT_PREFIX "g12a-tohdmitx") ||
+		of_device_is_compatible(np, DT_PREFIX "g12a-toacodec");
 }
 
 static int axg_card_add_link(struct snd_soc_card *card, struct device_node *np,
-- 
2.24.1

