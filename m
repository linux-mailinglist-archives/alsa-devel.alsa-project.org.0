Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E7740861AAB
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Feb 2024 18:53:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 722E5A4A;
	Fri, 23 Feb 2024 18:53:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 722E5A4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708710816;
	bh=YbwFPjo6ccRVq4UzuSvS6LZFtetWcxbtqaMWTpTxTyE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eyIb5U4FPdWHNAfyvBipXzpRdj/OZKrJ4+pjmkd7LthcA8tP0ciB5TSK+vynPxVD8
	 bwX7sPfgQhXJB6UNbFuSdfvY25lNIlR7cEI7TTGFOvWbfmgs8LmKcNmAzTxxWN+Kt5
	 U05EpaKiDQGOm1G/FVgJ4xdCcaHOd/wJbSSFFJJM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 37B74F80689; Fri, 23 Feb 2024 18:51:56 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 55E9AF8067A;
	Fri, 23 Feb 2024 18:51:56 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8D755F805D2; Fri, 23 Feb 2024 18:51:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ED044F80496
	for <alsa-devel@alsa-project.org>; Fri, 23 Feb 2024 18:51:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ED044F80496
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20230601.gappssmtp.com
 header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=ai4KZX/+
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-33da51fd636so603688f8f.3
        for <alsa-devel@alsa-project.org>;
 Fri, 23 Feb 2024 09:51:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1708710685;
 x=1709315485; darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E5onlIQPMa8EU8sK1NqJS82W4yBogcW0MtBFux+iSL0=;
        b=ai4KZX/+PO0ouOx0uYeCRZb4IDQ8+jOVnHCkqwdn7JSx8ihoqmkMTmd2VZHOx8TOqP
         uR6k+y0nPS7XhhkCWBQE/tYzPxicSk9xvZnSeNO6kJmUew0DHaatgiVhGd30LpaiKRj0
         dtoL4DxmP19818pgHrdljGf6rx4EVfkpfOieGNQiA3A8Wyw/xlLIvP5Inpb9lcrgVgyk
         5radEyRyoJMbiqNDzeXJkVk31WOdgcdo07IwMeUdiN2hGceWQL5gcF/fhppNMHN+iP1A
         x599Qg/CCpDS5UeWk0KRBvHT0nLn7kRQDe0VSvuTXxdfbPxGXF79QGgiLk/mhsVUnD6J
         zxSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708710685; x=1709315485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E5onlIQPMa8EU8sK1NqJS82W4yBogcW0MtBFux+iSL0=;
        b=lZy2Xq8em4yH4OFaDEFVhRjvy8lsNJrb3SK/wyF2sbm57n8Sfzr8CE5d+jv3doyw3H
         3tj1XxX6/eWAzxwj5kcIwxetytDnw98mINnmpHeNfXVIyOe9JHToALNwPhgyUb8PPqhx
         FKX28diapUKV+QlNjKIYLgj0BDWQeUZbN7+steNqZlkFi0rTvJ9/AUduarVbhx9Lyqll
         2y5lsPCTLVWlTwZl4v6b03bRVuZf3qfBf//Lh8JoDqI9TYd1SgXX1ddd31lOGMwXxYxc
         EQR66CsrLDE8LjqicvsN21D95ly0Q/dU/FCEMsRZ8PsrtF0K4YvuHr7tZqP23EjQCtz7
         NbZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUD3rDI+fAKa4Otw/t8I6vFqLIJ4pNN/gQmFNSOmZ75AB6cjJDlRsOeDLpM2CudT2qB1uai+lAfADVgf3vFF5IdMPFEvGL/2HCGrKg=
X-Gm-Message-State: AOJu0YwXW2n7Xkrb8boFxXfYhdl1R1GE130Qm3AhCbaXCIOk0wEkWbUJ
	vioj2SiABIKLgrWs13fXOrwcTghRDzulc3ggVbGon6vLfSBVGYNvdFeh0HThTPjF/WczNIylM9V
	f
X-Google-Smtp-Source: 
 AGHT+IGbVheYYWSnBsZMt7MWcRfxMQjAjkyXcfMrBJ55mpI+QDGAkuDrALH5oqVlvASElX3LNqQCRA==
X-Received: by 2002:adf:fcc6:0:b0:33d:9283:93b with SMTP id
 f6-20020adffcc6000000b0033d9283093bmr329883wrs.47.1708710684884;
        Fri, 23 Feb 2024 09:51:24 -0800 (PST)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:e8a0:25a6:d4ec:a7ff])
        by smtp.googlemail.com with ESMTPSA id
 bo10-20020a056000068a00b0033cddadde6esm3711524wrb.80.2024.02.23.09.51.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Feb 2024 09:51:24 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH 4/6] ASoC: meson: axg-spdifin: use max width for rate
 detection
Date: Fri, 23 Feb 2024 18:51:10 +0100
Message-ID: <20240223175116.2005407-5-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240223175116.2005407-1-jbrunet@baylibre.com>
References: <20240223175116.2005407-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Message-ID-Hash: YNPSPGE3RSZTX5LOBEBNYQTISWUO4BI5
X-Message-ID-Hash: YNPSPGE3RSZTX5LOBEBNYQTISWUO4BI5
X-MailFrom: jbrunet@baylibre.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YNPSPGE3RSZTX5LOBEBNYQTISWUO4BI5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Use maximum width between 2 edges to setup spdifin thresholds
and detect the input sample rate. This comes from Amlogic SDK and
seems to be marginally more reliable than minimum width.

This is done to align with a future eARC support.
No issue was reported with minimum width so far, this is considered
to be an update so no Fixes tag is set.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/axg-spdifin.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/meson/axg-spdifin.c b/sound/soc/meson/axg-spdifin.c
index bc2f2849ecfb..e721f579321e 100644
--- a/sound/soc/meson/axg-spdifin.c
+++ b/sound/soc/meson/axg-spdifin.c
@@ -179,9 +179,9 @@ static int axg_spdifin_sample_mode_config(struct snd_soc_dai *dai,
 			   SPDIFIN_CTRL1_BASE_TIMER,
 			   FIELD_PREP(SPDIFIN_CTRL1_BASE_TIMER, rate / 1000));
 
-	/* Threshold based on the minimum width between two edges */
+	/* Threshold based on the maximum width between two edges */
 	regmap_update_bits(priv->map, SPDIFIN_CTRL0,
-			   SPDIFIN_CTRL0_WIDTH_SEL, SPDIFIN_CTRL0_WIDTH_SEL);
+			   SPDIFIN_CTRL0_WIDTH_SEL, 0);
 
 	/* Calculate the last timer which has no threshold */
 	t_next = axg_spdifin_mode_timer(priv, i, rate);
@@ -199,7 +199,7 @@ static int axg_spdifin_sample_mode_config(struct snd_soc_dai *dai,
 		axg_spdifin_write_timer(priv->map, i, t);
 
 		/* Set the threshold value */
-		axg_spdifin_write_threshold(priv->map, i, t + t_next);
+		axg_spdifin_write_threshold(priv->map, i, 3 * (t + t_next));
 
 		/* Save the current timer for the next threshold calculation */
 		t_next = t;
-- 
2.43.0

