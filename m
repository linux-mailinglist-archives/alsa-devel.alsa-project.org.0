Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B6144554F10
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jun 2022 17:24:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 63EEB1EDE;
	Wed, 22 Jun 2022 17:23:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 63EEB1EDE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655911472;
	bh=1J1MpUnvCofQgUNyuCT8fFkN/6jqLlMd2DNkkj0VlIs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kyaN4dj7u5WRR3zYiYoyT95awnul88+bQCAUHqGV2OV9CiH5RNi4EkpEf/4a1O8TS
	 wuBzT98O0inkPzW8bdsFLH6MxETe3YwoQSSM4S6wC1seij1MHEIj7uZIH1aSN/YTu0
	 K0n6grkJugXYn4zRES+CqWnuBziK9kQxhTtflSk8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 83F71F80538;
	Wed, 22 Jun 2022 17:23:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 95C61F804EB; Mon, 20 Jun 2022 22:06:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AB348F804D8
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 22:06:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB348F804D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="G6wwdsUb"
Received: by mail-wr1-x42f.google.com with SMTP id s1so16072728wra.9
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 13:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UMBZF982Sgxs/kqKw98NXLNKJY18JDApVwptU4z2w/4=;
 b=G6wwdsUb0o0KkrQXWK3doZef7L8BgtwmGkyRy70p/dnnUdSeIm80U4/sQB+DU/UyBu
 lq+G3r2iFyKxiw8S2yrwvMIXSzdaqaSlzGS4cckrZH7OKT1FjnzDeBIuWam1Ix15Gcur
 CfuLb/IeNTNq7XCpjpezZA1RortUasUbT6SbqO7vsRpKBd8y8QVrNVDKk8S2BlgA83Qo
 sumJyldJr7QMcNLyzlmXUF+xt5g+wsclm5yeaMm9sxF+W/l0sViSgbIphnns4qWzmkfQ
 TOnbQAZGAYQPI0jnJ4I4pX8zAZqQjOgq7SNmFg/7Q/XM7k1OPTgUVNx0dMxnLUJdn+hU
 Ziwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UMBZF982Sgxs/kqKw98NXLNKJY18JDApVwptU4z2w/4=;
 b=yhNfjv1vw9VUzGCuEdz/33JVbEonXClmLN+1ZfEy08ps4CUhD8NiT6WBZabx3FM9VE
 mPCf5KwiBE1ecGLruzYRwWznRvBAFHn99lm89r1vKVq4b+uFKEP+BxUSjnAG984kz9Td
 iM8W13g/nD0/Z1rIdBgliMuHnsTR/q10vVbjbQ4GROJbSQQJUYR7+o19lYRKuF3V73CO
 dsz94mKf+HIhECMQMUhxHHPMHrg5Y87kJSbZbphndq93o7lL+IJP+7QwIIPJ8eETOkFX
 EcI4vO5KIfJkI/L5NZK/v/E0N0c+pOLeq3K2gjoyhh5iZ92AHUS/F5neWNy/eGqYyJWO
 iuIA==
X-Gm-Message-State: AJIora9CdWNkYB1BMTXRYsUQeTOdQIfs8mx29pZqN5DCiLH0VKnJdQil
 c6RWaEciP9SFjmLQq+3KtN0=
X-Google-Smtp-Source: AGRyM1t4d4cjIVC7sSPWoVSQarvyp90HMRRx6FeW4tX3bvpi8rs+MlYEB74yzJdHRG+/yBrQgYJfeg==
X-Received: by 2002:a05:6000:1e1c:b0:21b:8a12:acba with SMTP id
 bj28-20020a0560001e1c00b0021b8a12acbamr10398783wrb.710.1655755578056; 
 Mon, 20 Jun 2022 13:06:18 -0700 (PDT)
Received: from localhost (92.40.169.68.threembb.co.uk. [92.40.169.68])
 by smtp.gmail.com with ESMTPSA id
 n4-20020a05600c4f8400b003971fc23185sm20679416wmq.20.2022.06.20.13.06.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 13:06:17 -0700 (PDT)
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: broonie@kernel.org
Subject: [PATCH 02/49] regmap-irq: Fix offset/index mismatch in
 read_sub_irq_data()
Date: Mon, 20 Jun 2022 21:05:57 +0100
Message-Id: <20220620200644.1961936-3-aidanmacdonald.0x0@gmail.com>
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

We need to divide the sub-irq status register offset by register
stride to get an index for the status buffer to avoid an out of
bounds write when the register stride is greater than 1.

Fixes: a2d21848d921 ("regmap: regmap-irq: Add main status register support")
Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
---
 drivers/base/regmap/regmap-irq.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/base/regmap/regmap-irq.c b/drivers/base/regmap/regmap-irq.c
index 4f785bc7981c..a6db605707b0 100644
--- a/drivers/base/regmap/regmap-irq.c
+++ b/drivers/base/regmap/regmap-irq.c
@@ -387,6 +387,7 @@ static inline int read_sub_irq_data(struct regmap_irq_chip_data *data,
 		subreg = &chip->sub_reg_offsets[b];
 		for (i = 0; i < subreg->num_regs; i++) {
 			unsigned int offset = subreg->offset[i];
+			unsigned int index = offset / map->reg_stride;
 
 			if (chip->not_fixed_stride)
 				ret = regmap_read(map,
@@ -395,7 +396,7 @@ static inline int read_sub_irq_data(struct regmap_irq_chip_data *data,
 			else
 				ret = regmap_read(map,
 						chip->status_base + offset,
-						&data->status_buf[offset]);
+						&data->status_buf[index]);
 
 			if (ret)
 				break;
-- 
2.35.1

