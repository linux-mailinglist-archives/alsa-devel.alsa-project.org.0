Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CBFFB27212B
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Sep 2020 12:32:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 28A6E16F9;
	Mon, 21 Sep 2020 12:31:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 28A6E16F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600684357;
	bh=4/IDvTQPnUbOdxL+1N+6f3R3qxNHZgCrX7Ul0vD2cl8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IdlR8MyasH+kNRzjsMKJQ4BP2K2tWCeg8C/kQuc1nOOj9Bv/zJmsaMbDwgMRbXxhz
	 MxzT9mOEiaNyxDnznnFcSlhVRvjRQK/LNf/jjPjQ8lJHJC0yzFN8jugbXeZ91/Qsjp
	 dWEcBhWSdAds9slc3jMHcSvzQR9svIcLz3B6oBgA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 16FB6F802E3;
	Mon, 21 Sep 2020 12:28:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BE263F802FE; Mon, 21 Sep 2020 12:28:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 22744F80161
 for <alsa-devel@alsa-project.org>; Mon, 21 Sep 2020 12:27:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 22744F80161
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="jnag0fqD"
Received: by mail-wr1-x444.google.com with SMTP id g4so12137990wrs.5
 for <alsa-devel@alsa-project.org>; Mon, 21 Sep 2020 03:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=edlSUT/Y078NXbAZqDd8CvaKkdPfuHJQ/JeQ1t1s3zw=;
 b=jnag0fqDdXTzH7mJmr/nHlCqEUC2q1l0NOwme88e8hBjTYY8yvZxkoFcn5x2oxWOFg
 GxaB2+IakXYFHyl1hJIAk9vBDGCwfnx9exyigyT7DB2XlY+s/RifWzoYU4umXVUfUNof
 Wtha0ZzWvQ6ziUsmsqC1BE8gEiXietWKSgZLVqgIKZdLaOSjmqIdMsrHTbIbeVyrFzn2
 J4XDrv5R1jyjikClYuEb4z/BDp02aV+u/zfAI7lU5py/chj8whvxZ7o6F/SM+Ub098HK
 pEppTaatuCVvCTO/zImKSqN2xgMo/8rt0IF4RG2aGT6oCt6qGY8bhA6MZCprotV3kqfZ
 EE/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=edlSUT/Y078NXbAZqDd8CvaKkdPfuHJQ/JeQ1t1s3zw=;
 b=dRncM8GB0DU6lUnAKOEXPt4p941akrKF4K0tWj7TgAAcWKZvfoVYENw9TTt4rAQ0Rj
 RFD1FMMm3Sc43JPQ8kElICv3oDAxC8eHkvvz/jXmBkx4gWtrVw/OW7YbqoPviglu00Mv
 V66m9OWEy0e7lTNGeR2oztbVbHw7JeFX5sq8btX6LkVogtUwd3dQd1VfVPobe0rd7a6W
 JadKD11xXp7xvo1N1iLmLfPnDGFz+79zJNe54T4ulkuHgXnSKUAOO3GuXELoTtGWrWo8
 70u1HnDypZF/PIerRqg2Xl1Qhiy6tdmwU5wF263bPDwcBkQ9o3OyxPEjk2ZvZHBACXSZ
 ZGtg==
X-Gm-Message-State: AOAM5324Doo6hK+Pmmz/ckdlRfDwqgiSvBt+/ni84e1uMEFq8/CnkCCn
 AHCv/QdAY4GjiQdqKBt2T5w=
X-Google-Smtp-Source: ABdhPJxmFW+NaCfURDMye6Dosi+5xOQ1AdjDzKmNSK/hSvD75t+zteXJgK4z547kQ2tx9GTkQqXoAQ==
X-Received: by 2002:a5d:4710:: with SMTP id y16mr53373939wrq.203.1600684058897; 
 Mon, 21 Sep 2020 03:27:38 -0700 (PDT)
Received: from localhost.localdomain
 (lputeaux-656-1-11-33.w82-127.abo.wanadoo.fr. [82.127.142.33])
 by smtp.gmail.com with ESMTPSA id h2sm20713774wrp.69.2020.09.21.03.27.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Sep 2020 03:27:37 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v4 03/22] ASoC: sun4i-i2s: Change get_sr() and get_wss() to be
 more explicit
Date: Mon, 21 Sep 2020 12:27:12 +0200
Message-Id: <20200921102731.747736-4-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200921102731.747736-1-peron.clem@gmail.com>
References: <20200921102731.747736-1-peron.clem@gmail.com>
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
simple values. Also this formula is wrong for sun4i.

Replace this with a simpler switch case.

Also drop the i2s params not used.

Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 sound/soc/sunxi/sun4i-i2s.c | 69 +++++++++++++++++++++++--------------
 1 file changed, 44 insertions(+), 25 deletions(-)

diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
index 0633b9fba3d7..11bbcbe24d6b 100644
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
+		return 0x0;
+	case 20:
+		return 0x1;
+	case 24:
+		return 0x2;
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
+		return 0x0;
+	case 20:
+		return 0x1;
+	case 24:
+		return 0x2;
+	case 32:
+		return 0x3;
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
+		return 0x1;
+	case 12:
+		return 0x2;
+	case 16:
+		return 0x3;
+	case 20:
+		return 0x4;
+	case 24:
+		return 0x5;
+	case 28:
+		return 0x6;
+	case 32:
+		return 0x7;
+	}
 
-	return (width - 8) / 4 + 1;
+	return -EINVAL;
 }
 
 static int sun4i_i2s_set_chan_cfg(const struct sun4i_i2s *i2s,
@@ -572,11 +591,11 @@ static int sun4i_i2s_hw_params(struct snd_pcm_substream *substream,
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

