Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 73AC7554F2F
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jun 2022 17:27:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EAAEB1F13;
	Wed, 22 Jun 2022 17:26:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EAAEB1F13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655911653;
	bh=JM5XVZht+Tn/1kWPdhgXQOf6Y9z/rZYKmQ5arX+rayA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tvCY25v3rPJuscGM2kO8PUK6AMq+dSpXK/ZL3otrJxhbRXfGosXpu7hpcdpa170Xe
	 WFoMJ9aNL264wP2QE++8Y2Z1DXVhNQuk5Tf9ybM5b3mgT0xY+PLr8ecmhCmOwLmx0x
	 fxP1Gy2FbDTrrC1m1S8sJlrFZYl0vM5y+RLvkVPk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9C636F805A0;
	Wed, 22 Jun 2022 17:23:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B52D4F804EB; Mon, 20 Jun 2022 22:06:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 045C8F804D8
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 22:06:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 045C8F804D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="iAVKi4f8"
Received: by mail-wr1-x429.google.com with SMTP id o16so16088316wra.4
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 13:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NpYblgk0QSEipNVW12nK1FeMQGvN8soBnfpEkcmUf1I=;
 b=iAVKi4f8I7CLeg4ffvFzsvKkDzx2DfoiAbr47iYacvEU+s3bdgepP+twUMbdjqFjZN
 HP9GhewZ0kBzZGLj0hMJgiO7cc3Vd6E/UF8i8c0andQvvQgzYryRgJ2xWzPE8ISGsHKU
 3jAsd30KJ0Vgc2BjN5czd14edV+jCCHuBh/c8p0HdAHMup5HduI34U/Ox+duIKPJ+3ag
 kMTEimL4vWw+NINiHeamf6NkIE0VHr/u3/NsESG0RHXMSG5UD9ZPmUG7ASDj10MCe43O
 AkDOSBGlCU7xbJuDGODEpXltkmTY8pHt9UDDKC8kna2c/yvWdCAx6ck4c/uz1z2HYYQ6
 wUtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NpYblgk0QSEipNVW12nK1FeMQGvN8soBnfpEkcmUf1I=;
 b=e1vM3uPjjI2Xe4AynDombqo5L7gCmpVYyOJCve9OtZGIeaQ3mrbv6FaPIn4fmPkGba
 1heLbMW3BWSu5bUgTq1619c29ShTPHVlMOXzLqfnxnOYCr744lL6Hb1Cwmdjlc5j3AiK
 NrALbaLmvDANcxQWpm2tCsqYtfomLDUXV0je+LsicpXEdiwY3eP9L6h3sVbH1tH3Y/jL
 KSe2aBD00b3/IL8QCjm79ADn1JNDDYBJe1dlf+AuFO1IW1t7keXlm8x3yCFZgstqX2WP
 hLalBPgizWNH/6KQkO4hpt2tcqoQiBISFM63vGNUA+p93v12mB/rvx8feY0xo1YfEw2S
 K6kQ==
X-Gm-Message-State: AJIora+1b9SZHGp9PL513QjMU9Bbr47Jc5DjG1NT2byKYDizGnFY8qnX
 HPqpu1A9hBc/UhiHaP1LhEg=
X-Google-Smtp-Source: AGRyM1uneR86manlptXeALcQUO9hJesML7Bpy1KKOUEomIro61DKoiDecYWOPz8k3Wd1mtwzsz07yA==
X-Received: by 2002:a05:6000:1052:b0:21b:927c:1559 with SMTP id
 c18-20020a056000105200b0021b927c1559mr4204605wrx.303.1655755595143; 
 Mon, 20 Jun 2022 13:06:35 -0700 (PDT)
Received: from localhost (92.40.169.68.threembb.co.uk. [92.40.169.68])
 by smtp.gmail.com with ESMTPSA id
 e16-20020adfdbd0000000b0021b91ec8f6esm2936708wrj.67.2022.06.20.13.06.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 13:06:34 -0700 (PDT)
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: broonie@kernel.org
Subject: [PATCH 13/49] regmap-irq: Remove unused type_invert flag
Date: Mon, 20 Jun 2022 21:06:08 +0100
Message-Id: <20220620200644.1961936-14-aidanmacdonald.0x0@gmail.com>
In-Reply-To: <20220620200644.1961936-1-aidanmacdonald.0x0@gmail.com>
References: <20220620200644.1961936-1-aidanmacdonald.0x0@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 22 Jun 2022 17:23:17 +0200
Cc: alsa-devel@alsa-project.org, bgoswami@codeaurora.org, rafael@kernel.org,
 linus.walleij@linaro.org, bjorn.andersson@linaro.org,
 srinivas.kandagatla@linaro.org, myungjoo.ham@samsung.com, lee.jones@linaro.org,
 samuel@sholland.org, maz@kernel.org, brgl@bgdev.pl, mani@kernel.org,
 krzysztof.kozlowski@linaro.org, jernej.skrabec@gmail.com,
 cw00.choi@samsung.com, wens@csie.org, agross@kernel.org, orsonzhai@gmail.com,
 linux-sunxi@lists.linux.dev, b.zolnierkie@samsung.com,
 linux-arm-msm@vger.kernel.org, tharvey@gateworks.com,
 linux-actions@lists.infradead.org, linux-gpio@vger.kernel.org, tiwai@suse.com,
 tglx@linutronix.de, cristian.ciocaltea@gmail.com,
 linux-arm-kernel@lists.infradead.org, rjones@gateworks.com,
 gregkh@linuxfoundation.org, lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 michael@walle.cc, zhang.lyra@gmail.com, baolin.wang7@gmail.com,
 mazziesaccount@gmail.com
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

No chip has ever required this flag except for the max77650 where
it didn't have any effect. Drop it. The code that checked for it
has already been removed.

Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
---
 include/linux/regmap.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/linux/regmap.h b/include/linux/regmap.h
index 1966ad4d0fa5..ee2567a0465c 100644
--- a/include/linux/regmap.h
+++ b/include/linux/regmap.h
@@ -1466,7 +1466,6 @@ struct regmap_irq_sub_irq_map {
  * @ack_invert:  Inverted ack register: cleared bits for ack.
  * @clear_ack:  Use this to set 1 and 0 or vice-versa to clear interrupts.
  * @wake_invert: Inverted wake register: cleared bits are wake enabled.
- * @type_invert: Invert the type flags.
  * @type_in_mask: Use the mask registers for controlling irq type. For
  *                interrupts defining type_rising/falling_mask use mask_base
  *                for edge configuration and never update bits in type_base.
@@ -1520,7 +1519,6 @@ struct regmap_irq_chip {
 	bool clear_ack:1;
 	bool wake_invert:1;
 	bool runtime_pm:1;
-	bool type_invert:1;
 	bool type_in_mask:1;
 	bool clear_on_unmask:1;
 	bool not_fixed_stride:1;
-- 
2.35.1

