Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D7CE554F52
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jun 2022 17:30:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D0C762018;
	Wed, 22 Jun 2022 17:30:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D0C762018
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655911856;
	bh=XdHln75xhqMzmAIajgw37F81FNCUd3sXXKB52owdLIM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KTDXQhzU+azMfaPI2jpPOEx4JXvBqosEisDbmbKxgtZygjoQQtkqhpgnoTeSq+Z0N
	 SLtCMYwhpIYnYsEy3aKL9bOQYUv7mBeAJleI0Kn8nqsyloOW6rK1kIXeATCbtu0bx0
	 xqVjafrED4WJ1mcIXBFbTJfJ411lvPxsoprKpDig=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CEE09F805EE;
	Wed, 22 Jun 2022 17:23:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2C065F804E5; Mon, 20 Jun 2022 22:07:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A5FACF804D2
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 22:06:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A5FACF804D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="bpjyLwVi"
Received: by mail-wr1-x42f.google.com with SMTP id w17so16065230wrg.7
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 13:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dZq4DXS5hfuZufkfinYetDi/sPSwHy1FNwiaqhpssa4=;
 b=bpjyLwVivcFSW5QVbgosK/o2QuZHms1vCc6tC1sGza+OT1YZWe465cW4jNRW7fx4ks
 msy9Ia4HJKGcKj1u1StthDIoGNe0jPNNRCwfixCCbhsIu8kl5EdbhBkaAOJGTjzxLAZf
 Bv9bbx8NKTphmbx8bemLzrtymECuH5WWFEStWDPJlp6dqluOf0EOgjov5G1nTwcbn/99
 6V1IcwQ/cUBFnAQ+UHfvGn1YssCCtL98+3EotWIqSk0wFS+MMtuhmD5WuWOcv9MXK3SK
 oL+O91AqJHe+kT2bNOas/VelkJQaxBD6di93/z4nY9iPMcMc3LCgHQ1sLEmd+cWZ+9Od
 WH6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dZq4DXS5hfuZufkfinYetDi/sPSwHy1FNwiaqhpssa4=;
 b=M8+t9dFQV2jwsvlLSuCRC8PdfTAkMTBl4GGdz01Emkx4J97AP+oiv8dBnsUWH9ksXZ
 nJ1ZClMTe/YSuBEKsg2BRhYfo80Oq1uEE06TYgY4Xe67tnTZnU0bn565l+KWjZr63ob4
 FBCjgQML2E3cMdwTsUe0jiuq3TZENhT6MPVxniUXDDveeWYNGaJ/bHnjjSktrn4wI8hY
 ik8YCNKPiufXBaL63bDgs8tYlsxXm703lHFzT50e+PxyEL6eZ66k6bKtmdr5bfvQ+4Wc
 j0KkRsLBNl2Nwxr5JqRLfxOgp0MA7f0g3pfN9GJZL0ankv/7EvZK0Mot3DB+fEv3hibu
 kGJg==
X-Gm-Message-State: AJIora8hkB1/7qZ+7mnqKtavmMuu/P/b39yO0aSJ+Cu6BdA149l1cu9D
 nzm/lWn7Kr6S944Qkg9sQrY=
X-Google-Smtp-Source: AGRyM1uUe+TJYcYrAuoAsTQoql0GG3zgxE4cm70M4L11J/HjtjuiCzoxQPxyTkB4HBjRJYR8SssVEQ==
X-Received: by 2002:adf:fb06:0:b0:21a:3dc9:f12d with SMTP id
 c6-20020adffb06000000b0021a3dc9f12dmr19252192wrr.204.1655755617100; 
 Mon, 20 Jun 2022 13:06:57 -0700 (PDT)
Received: from localhost (92.40.169.63.threembb.co.uk. [92.40.169.63])
 by smtp.gmail.com with ESMTPSA id
 x1-20020adff0c1000000b002103cfd2fbasm14315943wro.65.2022.06.20.13.06.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 13:06:56 -0700 (PDT)
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: broonie@kernel.org
Subject: [PATCH 27/49] mfd: gateworks-gsc: replace irqchip mask_invert with
 unmask_base
Date: Mon, 20 Jun 2022 21:06:22 +0100
Message-Id: <20220620200644.1961936-28-aidanmacdonald.0x0@gmail.com>
In-Reply-To: <20220620200644.1961936-1-aidanmacdonald.0x0@gmail.com>
References: <20220620200644.1961936-1-aidanmacdonald.0x0@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 22 Jun 2022 17:23:18 +0200
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

An inverted mask register can be described more directly
as an unmask register.

Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
---
 drivers/mfd/gateworks-gsc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mfd/gateworks-gsc.c b/drivers/mfd/gateworks-gsc.c
index d87876747b91..28ec167a9861 100644
--- a/drivers/mfd/gateworks-gsc.c
+++ b/drivers/mfd/gateworks-gsc.c
@@ -189,8 +189,7 @@ static const struct regmap_irq_chip gsc_irq_chip = {
 	.num_irqs = ARRAY_SIZE(gsc_irqs),
 	.num_regs = 1,
 	.status_base = GSC_IRQ_STATUS,
-	.mask_base = GSC_IRQ_ENABLE,
-	.mask_invert = true,
+	.unmask_base = GSC_IRQ_ENABLE,
 	.ack_base = GSC_IRQ_STATUS,
 	.ack_invert = true,
 };
-- 
2.35.1

