Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B262F29C74B
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Oct 2020 19:35:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 87ECC16BF;
	Tue, 27 Oct 2020 19:34:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 87ECC16BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603823725;
	bh=D9YEaMYswMMfIVTwOMD5ti7XQBJ9bbORKiZPwVN2rGs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jx3nb7+cxXrvP+s2U11Vuxj97jSEI68WDDzKBZpaenfSQrRYEIC16nU4xYQTVCGxO
	 fqeXdb4I06htrqKkK861J5pl55oDx6ErIi1vXhxRvGJMqOj+T7D3virSyMH0iBkQNc
	 luu5XCZvUr8UQ5zb3VCEO14WXpiWlhgeu0t//+oA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 08239F804C2;
	Tue, 27 Oct 2020 19:32:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DECD4F804E6; Tue, 27 Oct 2020 19:32:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 737CDF8019D
 for <alsa-devel@alsa-project.org>; Tue, 27 Oct 2020 19:32:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 737CDF8019D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="DNkj+Piz"
Received: by mail-wm1-x342.google.com with SMTP id t3so83587wmi.3
 for <alsa-devel@alsa-project.org>; Tue, 27 Oct 2020 11:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MyrgB1AwEElcU6uoJ2FqX5PMdFXQkCgXivSbRL5ep4E=;
 b=DNkj+Piz0Om+GlBXB1VmhimTuK/nSLowEHG2zWBgg3WSp6WoZYjj8lxB6MeqJxwLLK
 H9f44Pe3Qgm+GQQb53ymB9f3zFKJxuIWrkGDM12YXn3RLqHzTDPoD363A3fULoK5xPRt
 U39PLKCsU4BCqQkKxYnUdUjbAzodsCkdfyMr0FSpdMDZDzZ4UOFkK7+Hqx15+bf4lNg9
 2Ts8vi/G/ktxoS+PxSPNw3hFotL7a69jPTSjbh4Cb6zLT/RS1R46aouo4C8scKpaC2jT
 +fvo5BhsI7euEErtYqaYf0Ph0bCwizCeGr8VRlnrSvcnTQZxcOjN5r9LJxW3Qwjr8VBH
 +f4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MyrgB1AwEElcU6uoJ2FqX5PMdFXQkCgXivSbRL5ep4E=;
 b=ZMu7t19BudLxABtMZE2Q4Zm0ch6JrUtODYUdu49bw1ELRJUPA2PvFjGkSE7PU/9Mmk
 L6i4UMXima6p5BtCvk0rqodLOz8qtZeGkq9wy3Ij6dAWwzZMjR0Ti3sUtf3N67uxBrR6
 e36+nxy/6B5CPlQw51C9bKrLUvIcJcfnB6RhousCw4ZOyF5wGZlAnbCcckuXRSq/AUZi
 ehAGNREZfmE992wjMcwcmxuMfHlOGsHlNb8DXsYi4PJBkDMK4tWSxDCO7pWJCCQ8Iile
 hUCtR898yf84v3qQ5N+ITOdGmFi/TOfto8pf7dLFSUI3hYkXUQamUDqGltSnhJZOsyoM
 3Uww==
X-Gm-Message-State: AOAM533tC8GX2uA1HRprwNwJlBITtsokU9g3oGVZkWD0zHwm+419tDGy
 XE/o1FS48z2kAjpxYxOgNc0=
X-Google-Smtp-Source: ABdhPJyF6ZdXaQzST5/s0N2Dhm9FeBiO3dYoy4glx6HJq/VUSfo5xXU9LEg9PIBhahO1EuL7oBl4GA==
X-Received: by 2002:a05:600c:214c:: with SMTP id
 v12mr3948227wml.23.1603823515538; 
 Tue, 27 Oct 2020 11:31:55 -0700 (PDT)
Received: from localhost.localdomain
 (lputeaux-656-1-11-33.w82-127.abo.wanadoo.fr. [82.127.142.33])
 by smtp.gmail.com with ESMTPSA id m9sm2864148wmc.31.2020.10.27.11.31.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2020 11:31:54 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v9 03/14] ASoC: sun4i-i2s: Change get_sr() and get_wss() to be
 more explicit
Date: Tue, 27 Oct 2020 19:31:38 +0100
Message-Id: <20201027183149.145165-4-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201027183149.145165-1-peron.clem@gmail.com>
References: <20201027183149.145165-1-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Marcus Cooper <codekipper@gmail.com>,
 linux-sunxi@googlegroups.com,
 =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
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

We are actually using a complex formula to just return a bunch of
simple values. Also this formula is wrong for sun4i when calling
get_wss() the function return 4 instead of 3.

Replace this with a simpler switch case.

Also drop the i2s params which is unused and return a simple int as
returning an error code could be out of range for an s8 and there is
no optim to return a s8 here.

Fixes: 619c15f7fac9 ("ASoC: sun4i-i2s: Change SR and WSS computation")
Reviewed-by: Chen-Yu Tsai <wens@csie.org>
Acked-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 sound/soc/sunxi/sun4i-i2s.c | 69 +++++++++++++++++++++++--------------
 1 file changed, 44 insertions(+), 25 deletions(-)

diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
index 9aa837d4fe99..073ee60da011 100644
--- a/sound/soc/sunxi/sun4i-i2s.c
+++ b/sound/soc/sunxi/sun4i-i2s.c
@@ -175,8 +175,8 @@ struct sun4i_i2s_quirks {
 	unsigned int			num_mclk_dividers;
 
 	unsigned long (*get_bclk_parent_rate)(const struct sun4i_i2s *);
-	s8	(*get_sr)(const struct sun4i_i2s *, int);
-	s8	(*get_wss)(const struct sun4i_i2s *, int);
+	int	(*get_sr)(unsigned int width);
+	int	(*get_wss)(unsigned int width);
 
 	/*
 	 * In the set_chan_cfg() function pointer:
@@ -387,37 +387,56 @@ static int sun4i_i2s_set_clk_rate(struct snd_soc_dai *dai,
 	return 0;
 }
 
-static s8 sun4i_i2s_get_sr(const struct sun4i_i2s *i2s, int width)
+static int sun4i_i2s_get_sr(unsigned int width)
 {
-	if (width < 16 || width > 24)
-		return -EINVAL;
-
-	if (width % 4)
-		return -EINVAL;
+	switch (width) {
+	case 16:
+		return 0;
+	case 20:
+		return 1;
+	case 24:
+		return 2;
+	}
 
-	return (width - 16) / 4;
+	return -EINVAL;
 }
 
-static s8 sun4i_i2s_get_wss(const struct sun4i_i2s *i2s, int width)
+static int sun4i_i2s_get_wss(unsigned int width)
 {
-	if (width < 16 || width > 32)
-		return -EINVAL;
-
-	if (width % 4)
-		return -EINVAL;
+	switch (width) {
+	case 16:
+		return 0;
+	case 20:
+		return 1;
+	case 24:
+		return 2;
+	case 32:
+		return 3;
+	}
 
-	return (width - 16) / 4;
+	return -EINVAL;
 }
 
-static s8 sun8i_i2s_get_sr_wss(const struct sun4i_i2s *i2s, int width)
+static int sun8i_i2s_get_sr_wss(unsigned int width)
 {
-	if (width % 4)
-		return -EINVAL;
-
-	if (width < 8 || width > 32)
-		return -EINVAL;
+	switch (width) {
+	case 8:
+		return 1;
+	case 12:
+		return 2;
+	case 16:
+		return 3;
+	case 20:
+		return 4;
+	case 24:
+		return 5;
+	case 28:
+		return 6;
+	case 32:
+		return 7;
+	}
 
-	return (width - 8) / 4 + 1;
+	return -EINVAL;
 }
 
 static int sun4i_i2s_set_chan_cfg(const struct sun4i_i2s *i2s,
@@ -582,11 +601,11 @@ static int sun4i_i2s_hw_params(struct snd_pcm_substream *substream,
 	}
 	i2s->playback_dma_data.addr_width = width;
 
-	sr = i2s->variant->get_sr(i2s, word_size);
+	sr = i2s->variant->get_sr(word_size);
 	if (sr < 0)
 		return -EINVAL;
 
-	wss = i2s->variant->get_wss(i2s, slot_width);
+	wss = i2s->variant->get_wss(slot_width);
 	if (wss < 0)
 		return -EINVAL;
 
-- 
2.25.1

