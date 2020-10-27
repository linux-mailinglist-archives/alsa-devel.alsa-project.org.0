Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A572B29C751
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Oct 2020 19:37:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4B39216CC;
	Tue, 27 Oct 2020 19:36:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4B39216CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603823821;
	bh=T5sIIGsIASAJ7wvQshOPrItMpQg+TjHWxdfZFsTVr2E=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RBD2/D3ot7M2SaoRU2XsoWXaJbzGnErjSBAmXvfbaQ3HO+b6wuRzfoEYJr5pW1Wxo
	 /3q1Ma6m1zM7Lciqa6WZQyXxnuObf39FSR9MbdaRKcgwCLIav9XEEKtpx9LGPCE/1w
	 YDr2QIIy2R9bQ5vSRiF3VlYYr9h6tgzxOfXUQPuI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 774BDF80506;
	Tue, 27 Oct 2020 19:32:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 17260F804E7; Tue, 27 Oct 2020 19:32:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9A689F804BC
 for <alsa-devel@alsa-project.org>; Tue, 27 Oct 2020 19:32:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A689F804BC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="hTp0/C5Q"
Received: by mail-wr1-x442.google.com with SMTP id w1so3053355wrm.4
 for <alsa-devel@alsa-project.org>; Tue, 27 Oct 2020 11:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Gt3AZ0hX1jExXQvct5PeSssH0eAYOD3HBZ6+o5mysMA=;
 b=hTp0/C5QqU8sGft7gs+VKYluyNQdjzqWgZZh3pTwmFWeYye1IhomVJiHNIygIcMqGF
 3JyEzn8ks79yZ7mUPgkZJ4QdHgJM+JSlwrgXtjVBC6cMZkiSr/gUj/CZCJBPVDPK++Pc
 2M899v1JBFuVKa4zBRvRcBeOdQIczJyaWkK2bxsPg3LJqh8Q4G+ta/Qi0yrLdRmvpMm+
 ESobrLYqLEMZkMnHE3hYWLwhKEZftWOqm8L7w6aRy7m66I+jM+WCfFqB3vmSjDi4Ct00
 LJbtTS5mgqbTY+YJgkq4YRI8JVQlRw+PP1Hv+sWB52MGqHJIFXo4h/t52Y/Rvy/Eujlx
 zk0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Gt3AZ0hX1jExXQvct5PeSssH0eAYOD3HBZ6+o5mysMA=;
 b=sF15ACKkVqTEXcEXeVvhQHCTuBrimg0xXfdoZDloQ36cSnzTAkRezvFtA8CllCpJqs
 vKqGoE0KhvScs3LeXm2FFHBUW2Uwi79FWdWbrXs9DNbMpGHVokM1I2QeOsIT3xDQZw96
 q1p6pQgl+twh7NPsrWw7afjqEnBf3j060w7VRO7JJbUH/WUzg4q7o2NMY2qJ88yb+l/n
 NJTtNODJ5W2wqWphwt2Cv7TT7wzKcc9SogsoT3PsLpg8dcyciBtcBfmnWDn1/xYMkKZS
 N0tCPLx2+1J2MFxCL9eu1hRghgTSrfr2lJUKe5I/jBvRHWj0wT4TiZM4zDwdacAmOptW
 xG/w==
X-Gm-Message-State: AOAM533BUBGIyEVCi18PNZ0CgXuV4e2xRcgA9Klpbgyi8WT6DR3Ut9OZ
 c9K2wRZ4SspbOvydDa4OV4k=
X-Google-Smtp-Source: ABdhPJxKySdExdQpdchzKr5y+uxq5+4d+zLWKNcwipKrO/nMsTtpM3Hkjs5/cvYGG9bJ1egUEF7Y+A==
X-Received: by 2002:adf:b787:: with SMTP id s7mr4637129wre.390.1603823520965; 
 Tue, 27 Oct 2020 11:32:00 -0700 (PDT)
Received: from localhost.localdomain
 (lputeaux-656-1-11-33.w82-127.abo.wanadoo.fr. [82.127.142.33])
 by smtp.gmail.com with ESMTPSA id m9sm2864148wmc.31.2020.10.27.11.32.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2020 11:32:00 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v9 08/14] ASoC: sun4i-i2s: fix coding-style for callback
 definition
Date: Tue, 27 Oct 2020 19:31:43 +0100
Message-Id: <20201027183149.145165-9-peron.clem@gmail.com>
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

Checkpatch script produces warning:
WARNING: function definition argument 'const struct sun4i_i2s *'
should also have an identifier name.

Let's fix this by adding identifier name to get_bclk_parent_rate()
and set_fmt() callback definition.

Acked-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 sound/soc/sunxi/sun4i-i2s.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
index 6a3207245ae2..4cf8a67efa4f 100644
--- a/sound/soc/sunxi/sun4i-i2s.c
+++ b/sound/soc/sunxi/sun4i-i2s.c
@@ -180,7 +180,7 @@ struct sun4i_i2s_quirks {
 	const struct sun4i_i2s_clk_div	*mclk_dividers;
 	unsigned int			num_mclk_dividers;
 
-	unsigned long (*get_bclk_parent_rate)(const struct sun4i_i2s *);
+	unsigned long (*get_bclk_parent_rate)(const struct sun4i_i2s *i2s);
 	int	(*get_sr)(unsigned int width);
 	int	(*get_wss)(unsigned int width);
 
@@ -192,7 +192,7 @@ struct sun4i_i2s_quirks {
 	int	(*set_chan_cfg)(const struct sun4i_i2s *i2s,
 				unsigned int channels,	unsigned int slots,
 				unsigned int slot_width);
-	int	(*set_fmt)(const struct sun4i_i2s *, unsigned int);
+	int	(*set_fmt)(const struct sun4i_i2s *i2s, unsigned int fmt);
 };
 
 struct sun4i_i2s {
-- 
2.25.1

