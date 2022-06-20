Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 32551554F39
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jun 2022 17:29:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C7EA31FD7;
	Wed, 22 Jun 2022 17:28:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C7EA31FD7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655911745;
	bh=Wq5NQ82Zcz/1kUjbkROMXgpEqf1Ci3lHZ/aKXefzCPw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QRxN/sCO2Y8ISAvRvfIIVDG90hwtnGoAf3q+RCvDUAhrnA5zoL9IrkN8AzuGNqkGM
	 9z0tcEcRWE5kmbQpiniDJi2A+T4AWthxgxT2ywO/BoHGVO7LK+3TPIKRsDC9ItHWj9
	 Kh0nrlvdY/fnFPhUz3TLYN4c1h0BZM5hAF+RZH5s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E5F6F805C8;
	Wed, 22 Jun 2022 17:23:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AE4FDF804E7; Mon, 20 Jun 2022 22:06:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,SPF_HELO_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A35D0F804D8
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 22:06:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A35D0F804D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="gdmCZ/lB"
Received: by mail-wm1-x330.google.com with SMTP id
 m39-20020a05600c3b2700b0039c511ebbacso8269579wms.3
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 13:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yDbkoyglFzlD/is/5GkDF5bxT9ENs1AtX/zXNAcYF8s=;
 b=gdmCZ/lBOcInOC7Vpu1bY/iCkTRvuWC70p3sTpyPTGpiGjPvbOfn3qCcOS6TYvfax1
 3L11FjZaxXZKn19jySJpcCpWV+xtFrtQQCVooDpT2B76t5Yf89SzliwlOHigso1rDVLk
 oTKVebpiS712yjcf0kpN9r3uejsVQPOSwQQwOfRTaV3WxoLZf11oL8qGCQ6IIb3JKTvH
 Gd5oqTmwdqCLXQGfP9Un8n1q4CYFfIWgJvxX8PaS4jqeICZF2WLj79nuYT2SFdtS4Hri
 hh9xIXG5EB3E4bg9SOAm4e7Z9wjbeiNwP/00cDnzR6iUmi2i9i1qZqeOzh3rmmFV/C0Q
 vMPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yDbkoyglFzlD/is/5GkDF5bxT9ENs1AtX/zXNAcYF8s=;
 b=JjprvxEucayTVuYrVQP4oCGQXMXRGWUJnWnNbY2m4XUokx7VOL7TVNZ13unuV7oO/w
 XcrVfQ4KQ9Mev2Y41jqU64cHGYdCcYV8RSYNQ87jImqjD7c/+9gkKe06eYuOf78y1Kq2
 RDEUlJ2SI09+YPa/GXU6CA+TeaS9plvpzQv9Ktt5AaRJOgt7J0MjK2E2fnVJAXJ45R0p
 xsJ+4sLnw9QCk5m3sRBN5C93PRM/SL3q1abvEJpobHB90Mf8IXDwTfEWsOIvpHgfFzwY
 zntLxm0MPJC3SCw5gM3vVoQISgCRJ7MMs06OWjGxzgqQsq7ViWiK5k/O2ZSkaVKKqoY+
 C9jA==
X-Gm-Message-State: AOAM5310ETbe0OvW2KqaIUKMnGAIdJrAsVbIbKF+bg6ZwR4JCd3v7E4O
 w1+v1d6ZQlnc7Mh59AcbVHo=
X-Google-Smtp-Source: ABdhPJynux7C1eoNMlx+vUMO5VOj8q1wBlYfPuBT+ReLmKHLRHcj/n+Q7FNGG42F1xN9EMg0dcGAng==
X-Received: by 2002:a05:600c:601f:b0:39c:416c:4069 with SMTP id
 az31-20020a05600c601f00b0039c416c4069mr36844654wmb.85.1655755603037; 
 Mon, 20 Jun 2022 13:06:43 -0700 (PDT)
Received: from localhost (92.40.169.68.threembb.co.uk. [92.40.169.68])
 by smtp.gmail.com with ESMTPSA id
 n15-20020a5d4c4f000000b0021b966abc19sm300460wrt.19.2022.06.20.13.06.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 13:06:42 -0700 (PDT)
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: broonie@kernel.org
Subject: [PATCH 18/49] mfd: qcom-pm8008: Add broken_mask_unmask irq chip flag
Date: Mon, 20 Jun 2022 21:06:13 +0100
Message-Id: <20220620200644.1961936-19-aidanmacdonald.0x0@gmail.com>
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

The qcom-pm8008 appears to use "1 to enable" convention for
enabling interrupts, with separate set and clear registers.
It's relying on masks and unmasks being inverted from their
intuitive meaning, so it needs the broken_mask_unmask flag.

Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
---
 drivers/mfd/qcom-pm8008.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/qcom-pm8008.c b/drivers/mfd/qcom-pm8008.c
index da16566f7883..18095e72714e 100644
--- a/drivers/mfd/qcom-pm8008.c
+++ b/drivers/mfd/qcom-pm8008.c
@@ -141,6 +141,7 @@ static struct regmap_irq_chip pm8008_irq_chip = {
 	.status_base		= PM8008_STATUS_BASE,
 	.mask_base		= PM8008_MASK_BASE,
 	.unmask_base		= PM8008_UNMASK_BASE,
+	.broken_mask_unmask	= true,
 	.ack_base		= PM8008_ACK_BASE,
 	.config_base		= pm8008_config_regs,
 	.num_config_bases	= ARRAY_SIZE(pm8008_config_regs),
-- 
2.35.1

