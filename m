Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B372A085B
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Oct 2020 15:48:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C17C1660;
	Fri, 30 Oct 2020 15:48:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C17C1660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604069332;
	bh=qp/+b4LRsVgxPKSXwxzqrrNDyRPfTPA+6dLEn33x1q4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SoWKQ8Yj21/g/QVWNFG61OR74ptTWQIX+uAFHkcsdYqAwFgL7lMMuoKWz1DC4AOGZ
	 TMJNv0VtwYeE/acix/RDMQZCUpg1I0kDYmZdOYNGAeWkelC8DJYc3s25twXdGwcb5E
	 i2JwfPUpwn0ZKM4ll0nF7ae5wh7G5pFE/tgMc0c4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F2E3BF804BC;
	Fri, 30 Oct 2020 15:47:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 43051F80107; Fri, 30 Oct 2020 15:47:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4EB69F80107
 for <alsa-devel@alsa-project.org>; Fri, 30 Oct 2020 15:47:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4EB69F80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Y2jToFx4"
Received: by mail-oi1-x242.google.com with SMTP id 9so6882253oir.5
 for <alsa-devel@alsa-project.org>; Fri, 30 Oct 2020 07:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3qfHTl4VFh+ziVF8DZnZZxGvPiZ3kXKnx8+g/Z/rsTU=;
 b=Y2jToFx4AU4O8l6MTP1yj9T4elz5vBsHBjtqe1vd3QFHWL77In8VjsEzfP3I9Pso/e
 fCOKMPBOFqUWmuBJ8dMHE66athLBWQjlF/x1pLjV1/cIl2SagQ4rWpotjPeopAqdlUNq
 i79GbMe0/Pz5I8ELPNrEZMynblgiPRZirosjXMPA7TmyUDBIZ8RAFzo1t0zMOXkMNt8T
 CI/D6gwN3DeJH8B+xWYc22vRKg43yyAIFWayUuqvy2o/o5sb6EHe4twl+ugCF2l6H/us
 elkEQVvYHiobuIi6FwCfG7bvsHfPg1/SlzTkpHG+BAXuU46N9W0hK0LN604FvjUA2UmO
 LQ7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3qfHTl4VFh+ziVF8DZnZZxGvPiZ3kXKnx8+g/Z/rsTU=;
 b=IM4FdXTDGUAOLlG9oW9vfIRWCdOuUpR7Jp18tFRZsLVjQiaN1jh66yTGTsLdqtEeJ9
 TYdwmILqXvzWLpvM29iRnn3mndPy/ZGHwQjTSeXjEY2tgNhHxN/wo8YDWzehXKdFC369
 MekCOpsfBy8aviATBBa0YD8jQXDLNEqqcKpcto5nJY5TbB+hCYTCciDqHcjghPX3NmnA
 lyCwt76aGy6IJN/qZTy+aGmL0owul7a8Ep7te8JFIxAZL/f7lvEfpxBI2RkpPwjuxzgY
 RLekZZcPIpkkMqG2Hv/+zaU380JL0/ohyM59vGXcOmvy7Zig3qNImD0PWtX9oeQ+sdkG
 l3Wg==
X-Gm-Message-State: AOAM533vJx419aIJQu+W0uU0YjEyLk73vaFmNIvFNEmNJ984T6JVoiWE
 V8IKrgQaNuempK6/fW9UkqEAKzxrFXwj4g==
X-Google-Smtp-Source: ABdhPJyfZf1kd87pRrrExCJ+b3xLcL62oEsjZJ75v2VM8njyu9n+24QvJpIVGE41DcP5awZPD7qr/A==
X-Received: by 2002:aca:3806:: with SMTP id f6mr1826285oia.66.1604069218304;
 Fri, 30 Oct 2020 07:46:58 -0700 (PDT)
Received: from localhost.localdomain (213-245-241-245.rev.numericable.fr.
 [213.245.241.245])
 by smtp.gmail.com with ESMTPSA id s20sm1462856oof.39.2020.10.30.07.46.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2020 07:46:57 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v10 01/15] ASoC: sun4i-i2s: Fix lrck_period computation for
 I2S justified mode
Date: Fri, 30 Oct 2020 15:46:34 +0100
Message-Id: <20201030144648.397824-2-peron.clem@gmail.com>
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

Left and Right justified mode are computed using the same formula
as DSP_A and DSP_B mode.
Which is wrong and the user manual explicitly says:

LRCK_PERDIOD:
PCM Mode: Number of BCLKs within (Left + Right) channel width.
I2S/Left-Justified/Right-Justified Mode: Number of BCLKs within each
individual channel width(Left or Right)

Fix this by using the same formula as the I2S mode.

Fixes: 7ae7834ec446 ("ASoC: sun4i-i2s: Add support for DSP formats")
Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 sound/soc/sunxi/sun4i-i2s.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
index f23ff29e7c1d..a994b5cf87b3 100644
--- a/sound/soc/sunxi/sun4i-i2s.c
+++ b/sound/soc/sunxi/sun4i-i2s.c
@@ -450,11 +450,11 @@ static int sun8i_i2s_set_chan_cfg(const struct sun4i_i2s *i2s,
 	switch (i2s->format & SND_SOC_DAIFMT_FORMAT_MASK) {
 	case SND_SOC_DAIFMT_DSP_A:
 	case SND_SOC_DAIFMT_DSP_B:
-	case SND_SOC_DAIFMT_LEFT_J:
-	case SND_SOC_DAIFMT_RIGHT_J:
 		lrck_period = params_physical_width(params) * slots;
 		break;
 
+	case SND_SOC_DAIFMT_LEFT_J:
+	case SND_SOC_DAIFMT_RIGHT_J:
 	case SND_SOC_DAIFMT_I2S:
 		lrck_period = params_physical_width(params);
 		break;
-- 
2.25.1

