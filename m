Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 114353373F
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jun 2019 19:50:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 97AEA1673;
	Mon,  3 Jun 2019 19:50:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 97AEA1673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559584252;
	bh=Bv75h8wfUOwev5J67yTVI7f2xVzJwT/Ori/DE7/7dxM=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=J+Fv1r9HXNLjUz6G57RUYJnG1XkDb4RPUWlwpWlbvFbrH0lCBwpvAa9GDtEjbvjSd
	 NafKyaOeCYJk0I9r+inxFzG2Q1d1qBB5rxFn9NhSLIT0PhT+tZ473sFvfwoEE/ZGNI
	 SgJj6w9AWld6cScUPDyW/nvwMORdvAFCWrtxAcgs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 500D8F89736;
	Mon,  3 Jun 2019 19:47:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DF806F896DE; Mon,  3 Jun 2019 19:47:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 50AB7F896DD
 for <alsa-devel@alsa-project.org>; Mon,  3 Jun 2019 19:47:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 50AB7F896DD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="h5dZgeoI"
Received: by mail-lf1-x142.google.com with SMTP id m15so14274214lfh.4
 for <alsa-devel@alsa-project.org>; Mon, 03 Jun 2019 10:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=d+gHoaqCUhQT6e1Ym0xN6NiXtzxs58xfZkboy1ldAY4=;
 b=h5dZgeoIw79Kv/1VWSq4u0iUmi8FcFdS5XaGrfJHimMztfcNh7dQVIiKTiQVrkFIDN
 tt/CEWjxMPtIutWCG+Qg+dtaAfT8RTFKodnxjVUm+CTtev6nBWMKe1yR60NbdJEjuLOi
 C+DB7NPOh7+CSv6DMZJCEVsOwd/i3pQcTjpXDt/Wn5ifvBjUm2lbprVhPFw0q4fsoiLr
 TcIXPDhB2iLwZP0At3Jw9MdR5dSfxgLEYObLerFRfewHaFrjRn6FKPzO7wIez3xx1ttZ
 7iqSRQDjsL6B1qv5AlpMCLWBsJs2IKTdBCpAA7J3Uno8uUTSJ1vnaWTAZheT04VtAZED
 0P2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=d+gHoaqCUhQT6e1Ym0xN6NiXtzxs58xfZkboy1ldAY4=;
 b=MSlEO9yHFR+MoQZVJfphy6TPaT9ZsasbiFTqFvlgDmBVgKbwBvVPHiXbvKjceFYtIO
 /Hlxu13G6cgJ53z3G5c15ldorooqd3WMnS3EO4kDO6Vk+NSfZEGHpL+PvUFeABOdAhhn
 z8mek6l1Bzxqj4marFThEBSicH3VZUUX+C6yT8G4YKA+eC63WXKQNXfP551IXFR0hgzS
 SXyLIZY8XhEZJzkmfDXn0QPHrnY5ZXfBIWJCCNfeEGg6YO+bIHw/beXjK5JWvL89YFKa
 9HREfIdF5813GEUx4At7XIR+nCAVwpBOr5aDdTdLBN0zSaJ8bhWbk9qRQEA/XDi6oz+w
 I34A==
X-Gm-Message-State: APjAAAXmSiAUqDoNW83dl8yJkx9/lvAY6m/9d3MLdyg3iRQZhXe9mrhw
 /ojXCork+XsHLlG4UJ43T6U=
X-Google-Smtp-Source: APXvYqwSvyGLQCwtw23kykXSMCtNcYtakfcNcaj9YVYmjqtrKle0F/xUggVT07pnNTUG4U0Miv6MBA==
X-Received: by 2002:ac2:5938:: with SMTP id v24mr4108075lfi.161.1559584059490; 
 Mon, 03 Jun 2019 10:47:39 -0700 (PDT)
Received: from localhost.localdomain ([188.150.253.81])
 by smtp.gmail.com with ESMTPSA id n7sm2803532lfi.68.2019.06.03.10.47.38
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 03 Jun 2019 10:47:38 -0700 (PDT)
From: codekipper@gmail.com
To: maxime.ripard@free-electrons.com, wens@csie.org,
 linux-sunxi@googlegroups.com
Date: Mon,  3 Jun 2019 19:47:28 +0200
Message-Id: <20190603174735.21002-3-codekipper@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190603174735.21002-1-codekipper@gmail.com>
References: <20190603174735.21002-1-codekipper@gmail.com>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, Marcus Cooper <codekipper@gmail.com>,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, be17068@iperbole.bo.it,
 broonie@kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] [PATCH v4 2/9] ASoC: sun4i-i2s: Add offset to RX
	channel select
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Marcus Cooper <codekipper@gmail.com>

Whilst testing the capture functionality of the i2s on the newer
SoCs it was noticed that the recording was somewhat distorted.
This was due to the offset not being set correctly on the receiver
side.

Signed-off-by: Marcus Cooper <codekipper@gmail.com>
---
 sound/soc/sunxi/sun4i-i2s.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
index 90bd3963d8ae..fd7c37596f21 100644
--- a/sound/soc/sunxi/sun4i-i2s.c
+++ b/sound/soc/sunxi/sun4i-i2s.c
@@ -456,6 +456,10 @@ static int sun4i_i2s_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 		regmap_update_bits(i2s->regmap, SUN8I_I2S_TX_CHAN_SEL_REG,
 				   SUN8I_I2S_TX_CHAN_OFFSET_MASK,
 				   SUN8I_I2S_TX_CHAN_OFFSET(offset));
+
+		regmap_update_bits(i2s->regmap, SUN8I_I2S_RX_CHAN_SEL_REG,
+				   SUN8I_I2S_TX_CHAN_OFFSET_MASK,
+				   SUN8I_I2S_TX_CHAN_OFFSET(offset));
 	}
 
 	regmap_field_write(i2s->field_fmt_mode, val);
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
