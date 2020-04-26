Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F9C1B8EFE
	for <lists+alsa-devel@lfdr.de>; Sun, 26 Apr 2020 12:43:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F4241671;
	Sun, 26 Apr 2020 12:43:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F4241671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587897834;
	bh=wpUfhNpsZQrgo3wEIYQ6F1huHLWhs14ZYbax9BNVsB8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hoqnPY7d2Gwwdyk7Mi/6NC70WG4/XVG+GP4OQ5WLwXsEn3QJTO0mvZuEx+RFg5+kW
	 m4a8RnCD+fc0ctldDX8h1y00D9CiMRgEE1Rpna+bXsBE8jqIICtLFXdnDSC7gogYAI
	 YLxkwYDagTjvziNGl2RWq35CqMXxz3kkOj/5OBGE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D3AABF8010A;
	Sun, 26 Apr 2020 12:41:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D732EF801DB; Sun, 26 Apr 2020 12:41:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 036E8F8010A
 for <alsa-devel@alsa-project.org>; Sun, 26 Apr 2020 12:41:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 036E8F8010A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="GVicEZ76"
Received: by mail-wr1-x442.google.com with SMTP id s10so16994319wrr.0
 for <alsa-devel@alsa-project.org>; Sun, 26 Apr 2020 03:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8DEFjpIBB2sTg55bEJY9HmamuD/w0H5V9QfSFLKTLl8=;
 b=GVicEZ765w25hm0QJA+jwt0ntOUVHGzU9apsShWdCViWNo+JW8gkmx1xPtwvshP74j
 VYqJhWwIC0eV71oza4ntOhdpqsMRu+orFdBftGB25Etp3vpE/9ii/nu++7U7F2J8k2zK
 l/GzHn5k7vhwEcM0qfL0mJRJb71V83bYw1ZEBudc5ldbv4G+B3iNdrGZDFkxyFMsbDag
 r0qbzmpTLzDzzEeqPMfRXsW7ITVB5wAbd6arZYfDCVZbjOLQrpxNbr/4chxw2EwjKUkT
 mce++iqxtrMy4UApTygqhmi5QSGuyRMKiy/hphzs9uYIblE5yGqcHgnDnIq/9YW4QBx5
 NvvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8DEFjpIBB2sTg55bEJY9HmamuD/w0H5V9QfSFLKTLl8=;
 b=YLD3cf+BhVG3lnILDfSbGDpFsfkjJkSeQxsNWuY14R0zPNE+m0np1cHMW0fgX8cw1p
 C+yLjzEurJrqdtm2Cu3HvOi4mW0+fu/JPGWi8g4ogq2iaoOwdYM6HQ5/KPYY9bmOkK5u
 Ysx3/LaYd/hpOtUTAybTABLIL15Hy+AsHghNA5a7+5W16xgYUUQLEIAE0IpRicKZ1CSi
 JyfYlAIFrQLkl4ONL1VgzuwBBWF5ETUZu7zD2kYH8o3rxkx0cPQmOfvja+Nz4b4v1djd
 8dJvr8yg+ZiV+fWyARYEY4uN928+XQjt/Va1it8gAZXnqBP0mjqKLneTOqfDxL4Wa8hi
 WB1w==
X-Gm-Message-State: AGi0PuaviM+IUbl5SXydrgHSDV77zUjeco2aRRva4m2s9kg7gWOtal9Y
 ookM1lTovx/456AaIajyfQ0=
X-Google-Smtp-Source: APiQypKL+/Zpp7aS/3Z23c8bef82x/2zXan/kO9l+XrOWepY6IjRW6LLnp9w9zsWrcTRH1NOiBrWxg==
X-Received: by 2002:a5d:694a:: with SMTP id r10mr21760639wrw.228.1587897679839; 
 Sun, 26 Apr 2020 03:41:19 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:1f1:d0f0:59f6:22c5:d1f3:662d])
 by smtp.gmail.com with ESMTPSA id
 y10sm10491793wma.5.2020.04.26.03.41.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Apr 2020 03:41:19 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v3 1/7] ASoC: sun4i-i2s: Adjust LRCLK width
Date: Sun, 26 Apr 2020 12:41:09 +0200
Message-Id: <20200426104115.22630-2-peron.clem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200426104115.22630-1-peron.clem@gmail.com>
References: <20200426104115.22630-1-peron.clem@gmail.com>
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

