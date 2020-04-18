Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3B01AF59E
	for <lists+alsa-devel@lfdr.de>; Sun, 19 Apr 2020 00:47:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 75DE71657;
	Sun, 19 Apr 2020 00:46:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 75DE71657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587250035;
	bh=wpUfhNpsZQrgo3wEIYQ6F1huHLWhs14ZYbax9BNVsB8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UWJGkMHyGHQ0c8Qt4vSDxWG2USs0Qd+7XFs6nEYWXhYCB9J3/6YKgEW80u98mkx7S
	 Jj/RTlbr7rQFmwJidqPoqjEpVnbEhMhyIvUd3LMcvrkKQSZDHnUMqATWXHasW9m2oj
	 emioHzRGU5lGsS6CwlJSE+UpKhvOcjdoo+vnfl14=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D5035F8012E;
	Sun, 19 Apr 2020 00:44:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6C131F8021E; Sun, 19 Apr 2020 00:44:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7ECFBF8012E
 for <alsa-devel@alsa-project.org>; Sun, 19 Apr 2020 00:44:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7ECFBF8012E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="c8cF3XH6"
Received: by mail-wr1-x442.google.com with SMTP id t14so7368604wrw.12
 for <alsa-devel@alsa-project.org>; Sat, 18 Apr 2020 15:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8DEFjpIBB2sTg55bEJY9HmamuD/w0H5V9QfSFLKTLl8=;
 b=c8cF3XH6qZJcJPkN9nADZfE8ZdxqJJNLek9MBPzd976KNgLjfAOvhXssjXgfR0qUXZ
 z5SbODX1HI8kSbTahGSNYROR6DUal2jkuISdlMolZvPcEr70LFjcykcK1MP0UOcKBhIU
 Ff5QtHea/ZcWq77sRWFG1qP7w6fn1pfjPGu5tFfutPE2Hj96sJkLdvi4XAKDYYyMKNqx
 R00g3cSrpQeA/7DOSY1CCSiEIqPbTrTVBzDoq3hp++7L21hPafhxjXx5u7ZowEpl0AKz
 t2dofmvt7RGD5O8ClZ3VCGllQKrDMZ7oHQNsKAdP0RKpixpqN3OalmxOd//da9ZJC8dw
 C0sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8DEFjpIBB2sTg55bEJY9HmamuD/w0H5V9QfSFLKTLl8=;
 b=j3o0+5ngcXb3XxGAb8hpSmJS1F+y8zUmoh5RGyFwEonO6cMiyF6NodIqXrHkAphXon
 zyTUBbMrJdH++kiGDCuBKR6tKHDh7HyMfR65bzLIEsA0UfG55Yv0NjEibkyXaHAGgf7f
 JKw2NZJFjFLwCv6j17Rp9FrtydPCauTPeser9eHfht9CPUcJnAbjMCEb6g6RKoV6N+WB
 fiRE5b2Iz3MmCRXj/3N7MKcno8N9Ex4/5rZJybqgqhmMtZZ8c7XDDzzKWNaYUb/i6Psw
 ilbXr75OOVi8vVoBRlII/FMPkR0BLt5fYxoo0/y9UnWu8OOcdmNQ9USAavHA0SD8wDha
 55Og==
X-Gm-Message-State: AGi0PuYbPV0tOHhxcgl3saczbM1w/jHqQoqiVcFXL7n3S/gsJV9S1oMn
 wRqniKeKNZ7j//W9xHP7p+U=
X-Google-Smtp-Source: APiQypLzc6502sCH/dr5KEi1k3BQRUxUNmwEVNQJvwCGsDJys1dWkVAT0BXLftMcmhDCZMKxtYFX6Q==
X-Received: by 2002:a5d:5304:: with SMTP id e4mr10337697wrv.87.1587249879909; 
 Sat, 18 Apr 2020 15:44:39 -0700 (PDT)
Received: from localhost.localdomain (91-167-199-67.subs.proxad.net.
 [91.167.199.67])
 by smtp.gmail.com with ESMTPSA id t16sm13371559wmi.27.2020.04.18.15.44.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Apr 2020 15:44:39 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v2 1/7] ASoC: sun4i-i2s: Adjust LRCLK width
Date: Sun, 19 Apr 2020 00:44:29 +0200
Message-Id: <20200418224435.23672-2-peron.clem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200418224435.23672-1-peron.clem@gmail.com>
References: <20200418224435.23672-1-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Marcus Cooper <codekipper@gmail.com>,
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

From: Marcus Cooper <codekipper@gmail.com>

Some codecs such as i2s based HDMI audio and the Pine64 DAC require
a different amount of bit clocks per frame than what is calculated
by the sample width. Use the values obtained by the tdm slot bindings
to adjust the LRCLK width accordingly.

Signed-off-by: Marcus Cooper <codekipper@gmail.com>
Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 sound/soc/sunxi/sun4i-i2s.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
index d0a8d5810c0a..4198a5410bf9 100644
--- a/sound/soc/sunxi/sun4i-i2s.c
+++ b/sound/soc/sunxi/sun4i-i2s.c
@@ -455,6 +455,9 @@ static int sun8i_i2s_set_chan_cfg(const struct sun4i_i2s *i2s,
 		return -EINVAL;
 	}
 
+	if (i2s->slot_width)
+		lrck_period = i2s->slot_width;
+
 	regmap_update_bits(i2s->regmap, SUN4I_I2S_FMT0_REG,
 			   SUN8I_I2S_FMT0_LRCK_PERIOD_MASK,
 			   SUN8I_I2S_FMT0_LRCK_PERIOD(lrck_period));
-- 
2.20.1

