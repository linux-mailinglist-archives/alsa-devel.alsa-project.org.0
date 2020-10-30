Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C132A0871
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Oct 2020 15:51:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9F6091674;
	Fri, 30 Oct 2020 15:50:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9F6091674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604069490;
	bh=XwtZS+wFvMVJSo4wSGfssHZmTUPwHWtaTPrf/cE4JiA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aB+kA6z6CVHKmdtg6GllzsNgaCFM7fGMUwcS2VnkD1UZ9olicERIsx/AdTmHEGKfp
	 W9KQoUBEhgPRyGQ0gVmX83V1t33QMLns69kI/rnbsClR0WhOfiKsrJ2nXLR4R8cHGP
	 O7AJaa7IktoioDvBj/9+HNpg/HIYqFNHUZK6bAjs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EE045F8050F;
	Fri, 30 Oct 2020 15:47:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5605BF804FD; Fri, 30 Oct 2020 15:47:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 84466F804FC
 for <alsa-devel@alsa-project.org>; Fri, 30 Oct 2020 15:47:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84466F804FC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="OZyMXC1e"
Received: by mail-oi1-x243.google.com with SMTP id s21so6929720oij.0
 for <alsa-devel@alsa-project.org>; Fri, 30 Oct 2020 07:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A4cYQuVx6gToZbO7mEsQDDx46mIAsBCsMKfd9g+RrIE=;
 b=OZyMXC1ef5lE3Xj7EkCUy6rsYPbkXx5xYWfAEIIo5YWaZAjyY0ty+oL5VPwh+frYps
 bzoeey07n25DE9sLmK504tbhohR3dQ8NeDAEgqizrIBpVrk+oCyzQj23E1jwWtBGSFrB
 96KJbb6Lf33uIZz0UUcgn0SXcTCD35x4ztoIxmHOPxya7IdwaqIcLi57zhwJ+dKo+mbU
 q8FiHpds5Uc7osGJ7DmnZFjhhryHJjvP/vzC2EycnbcCbBYRA9PgNrdnUCpqu+WK3KfF
 2WItQzButAY+kednd5Ps2Ac5lplYO8BG9NSzvdxVTchu/t4ch/SBc69DvQThQC8Kdtmr
 TRZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A4cYQuVx6gToZbO7mEsQDDx46mIAsBCsMKfd9g+RrIE=;
 b=mM+iLJdkLcKdbC7sMEhd+Xieaf2kAan4n+hvqBO9sZmu7E0fqlpqLd2NJWWgUYbBzm
 rIoKDmSsL5ez+Nw6xjE8wlu6gvn+4+y5rZ32FghYOeLbeUEd1/Y9UyYUWd4jyLD+UlFf
 gtCVgTglZMRhT99kikoXchawsRBO7c38egkIUApWd1/Tl56BI7loBdnYhYiaBpbU6CUr
 0pYbdttPTsQHtsnqMiv55OcdV0MoGb8XnphY6DJuxC02a/P3QC/stin0lxoNGLvmBJ0B
 8Hk71rtqc2uOXYGTxEZNPubHkcz1vIxrREFuohGUcFkBQF0Of7fuGc9++Fb23tEst9RC
 4OLw==
X-Gm-Message-State: AOAM532i1xSunNqZsaQsoHOEJdO4O3iK4dr6tTKsgBwnSAV5I2YWqnn2
 Tw1DleioXYVMyO4yx0jTHB4=
X-Google-Smtp-Source: ABdhPJzrOWnh3LX5MzGR+X7zGa6JPDHD+fQTH83s8TF39Z3LXslaoMt/hLpsPrl7NryxcUkW3CpMOQ==
X-Received: by 2002:a05:6808:915:: with SMTP id
 w21mr1236071oih.124.1604069243013; 
 Fri, 30 Oct 2020 07:47:23 -0700 (PDT)
Received: from localhost.localdomain (213-245-241-245.rev.numericable.fr.
 [213.245.241.245])
 by smtp.gmail.com with ESMTPSA id s20sm1462856oof.39.2020.10.30.07.47.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2020 07:47:22 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v10 09/15] ASoC: sun4i-i2s: fix coding-style for callback
 definition
Date: Fri, 30 Oct 2020 15:46:42 +0100
Message-Id: <20201030144648.397824-10-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201030144648.397824-1-peron.clem@gmail.com>
References: <20201030144648.397824-1-peron.clem@gmail.com>
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
index 4f5cd850752d..4b8ca5be0a29 100644
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

