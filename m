Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 54DDA29962A
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Oct 2020 19:56:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC90216B2;
	Mon, 26 Oct 2020 19:55:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC90216B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603738605;
	bh=4K64eQxo+LFVAvWw4dmcrn9d4eNm/+PmekvKelpl+DY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FfGvdSpfE+QJIu1DXXYLa/Oeyu9P63U1YFtixC2OqlLwR8VL/9FvN5yfhkbI4R5L/
	 upp9LRohxZY9db8SiUdvaRl8QHs+sczvYjjGdyt5TYWACOUBCkvHEyrboNBx8UII/e
	 yn70GunIJBBFYoTAXfMbJ8Gs7eZikb8r6pWu6CYg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CA887F804CB;
	Mon, 26 Oct 2020 19:53:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 22C47F8026D; Mon, 26 Oct 2020 19:52:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D0696F8026D
 for <alsa-devel@alsa-project.org>; Mon, 26 Oct 2020 19:52:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0696F8026D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="EZ3OY1dk"
Received: by mail-wr1-x442.google.com with SMTP id s9so13865793wro.8
 for <alsa-devel@alsa-project.org>; Mon, 26 Oct 2020 11:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wmEJBdHb8VsDTUc8zqykHFK0yjqq1TH3D9eWn2/3Qmw=;
 b=EZ3OY1dkf31OorA609trYpGLeyIew6esjS9e8BQHbpcZuUwVGTriDEjpCi1Zk+LEkJ
 1A18WVYBtHmS7RsvUewv3EQfcuySD5/k+59Zbj1RE86+yY3zZTTCaA1CtaaMCNT81YJ+
 9+DgZR6qq+wGoVBgql1u2KasVdZymdkWNwERujKYhqXU/Dd5YKOX9xvBBPykW8ZwPzjL
 YUAxHghmvuelssUfQdbIMB+y2SchA3fl6uSibg8T6EUtS9KJZ6V+Q4eIHZ52X+w8CgwA
 OoRXYBrzdEdAokD1CXQjdRGy3ljDJzWseJ+IbmboKhWJtdipl1fzQE1RInpSx8/Cg+X2
 nw1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wmEJBdHb8VsDTUc8zqykHFK0yjqq1TH3D9eWn2/3Qmw=;
 b=TFCvCYFPgxf77Vv41B219OssTQ98vpWauGnVrtxb+Un5M2c5WC3/sRa0fG+Qs2U4fN
 QYZfwuU/SE0sEUlEqiRKYVSK4Sf388VhQVrcFBHKTW4TzXG4b7TY6hJ0ken7U5Q4D5Xp
 2MNlSJxxPJrdp58DDWqn21nBKfBCHYcNVK+EdcMGzoXXbW/+l+F3zpvTd97bGKUadign
 6qnKINw1YJNECUwSgj7LJDnKeDhjVovUpgc7U9/grDXUAPv2SlRw/04YU154o7E+Uzpo
 KsAMUPAMXwFmjKHNPhc2AOgpjlbRug5SJEvqESzaDOqDh45h6Ox6GmcUBAz68jVT3y1+
 3eWg==
X-Gm-Message-State: AOAM530pAFSHUz9eznBCZU3kNZz6lmV0Eo1TeoZXPt/omM3rZbJbOgZM
 T36/8rl6POsW52equ0JunDA=
X-Google-Smtp-Source: ABdhPJyml266Cz1fL8lVFciN70lXZHCur+b3U/JH6rFPzhIRH+rKMR3EO1e1BMWSPUXHB/RGAFJ2qQ==
X-Received: by 2002:a05:6000:12c2:: with SMTP id
 l2mr19196554wrx.76.1603738366350; 
 Mon, 26 Oct 2020 11:52:46 -0700 (PDT)
Received: from localhost.localdomain
 (lputeaux-656-1-11-33.w82-127.abo.wanadoo.fr. [82.127.142.33])
 by smtp.gmail.com with ESMTPSA id f7sm24885193wrx.64.2020.10.26.11.52.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Oct 2020 11:52:45 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v8 03/14] ASoC: sun4i-i2s: Change get_sr() and get_wss() to be
 more explicit
Date: Mon, 26 Oct 2020 19:52:28 +0100
Message-Id: <20201026185239.379417-4-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201026185239.379417-1-peron.clem@gmail.com>
References: <20201026185239.379417-1-peron.clem@gmail.com>
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
Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 sound/soc/sunxi/sun4i-i2s.c | 69 +++++++++++++++++++++++--------------
 1 file changed, 44 insertions(+), 25 deletions(-)

diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
index 5bec7fbd0b30..70a2ec99f444 100644
--- a/sound/soc/sunxi/sun4i-i2s.c
+++ b/sound/soc/sunxi/sun4i-i2s.c
@@ -175,8 +175,8 @@ struct sun4i_i2s_quirks {
 	unsigned int			num_mclk_dividers;
 
 	unsigned long (*get_bclk_parent_rate)(const struct sun4i_i2s *);
-	s8	(*get_sr)(const struct sun4i_i2s *, int);
-	s8	(*get_wss)(const struct sun4i_i2s *, int);
+	int	(*get_sr)(unsigned int width);
+	int	(*get_wss)(unsigned int width);
 	int	(*set_chan_cfg)(const struct sun4i_i2s *i2s,
 				unsigned int channels,	unsigned int slots,
 				unsigned int slot_width);
@@ -381,37 +381,56 @@ static int sun4i_i2s_set_clk_rate(struct snd_soc_dai *dai,
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
@@ -581,11 +600,11 @@ static int sun4i_i2s_hw_params(struct snd_pcm_substream *substream,
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

