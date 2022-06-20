Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A3B554F1C
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jun 2022 17:26:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 013E51AEB;
	Wed, 22 Jun 2022 17:25:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 013E51AEB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655911572;
	bh=okrDuy0DsASAu8239mrCUF8XkolQHRyaQjDe059sY4o=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ipO1md2/6PRV2Nb6zLrV83YlWrzUiyaE/sn7o/SS+eWffiTnrCwBUQt0rXueMvoZA
	 VDR4KWMBoMmSt/VoM8KYHm3UGDISpBCwKnFNR7Pd0MP8xYmOE3X7UEcm3w/YmCUkrK
	 cnHFlNYup2eToTYe6Z8GLOn8wful2ZKFEJEk1jiE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C8216F8055C;
	Wed, 22 Jun 2022 17:23:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DF9C9F804D2; Mon, 20 Jun 2022 22:06:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,SPF_HELO_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 847E8F800E3
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 22:06:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 847E8F800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="EJbtvC5h"
Received: by mail-wr1-x42f.google.com with SMTP id s1so16072728wra.9
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 13:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EX/yDVwKkfC5joprzjhLTLUj2n8x64TTg4RMNQ20jNw=;
 b=EJbtvC5hJvHxpndMkFlPD86W4NZOimlOhDeQWXXsnvu8LCn08/ZUypJbCVlZT8Zuhn
 XmUdbUWQxzrNNs2DmjZS3cX9l4SmZeoOAinDDjt7qIBZ1kZbLnv/kaRvrnevyMBMjeb4
 hOXAaAWFkIccOi0rRaIQHvD9FbXJP6JG8+uUM2Yvgiq+4XMa45SLpysk/cPJy2kEz+5M
 XzYjPDhx4KLybpC23mko2FoWhrLe2DoqaS//+ApXLqEFVX/NLWz82gpyhjFvOFIuBnqD
 SrjohLlUiNBtgW5OAqfemvUQFWciS+bIq9Btr5bpWiH873KE5azsyZ1i9j1W55ltyC5w
 XtRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EX/yDVwKkfC5joprzjhLTLUj2n8x64TTg4RMNQ20jNw=;
 b=sDfXP8hSH7oabFlVwu7F2PsnxthKbRdxwk7OOcoMNtnAjU98/a6EIxne82JQ/O2wYg
 0AMc6ohdgwkwqWC0wds2OsToVNnXSxr4zAaoDrrXrIbM0kjS+G6TDDnmRzgf+2liOoqb
 vIuP/+RvgxM6O/0aGAVbGrDo8N2UUIcaebIySjDyOB4gFyd0PMFUIrYVy4yZdV1SIhAx
 7/ea0jhM2iHsfT3LM1B8eYf0nKvBNKLlVEG/C/2YlCIL2M5N9PwFlFMNuW+vXvduVo7w
 duR5YY46qzu2i9hO85lwT5cAx8YGdqke2qr7IPoYoHIumUi5Arx0a6U1OE8uCj22a8p8
 epZA==
X-Gm-Message-State: AJIora+cXrEYKJM6QZO0MG2GobURsI4/+xYQ4Xab3S6UciFjnhZ/eBC3
 iVVBoqDqQCMPGB4PdcsanI0=
X-Google-Smtp-Source: AGRyM1uZmrSpfQCxnF3FN/c4+CKx0AmJvG5Ujc+oe6FV8JjIcjgEvKjL58h/5RQFttDX69HrNrpXpw==
X-Received: by 2002:a5d:4d52:0:b0:21b:93b4:6a2a with SMTP id
 a18-20020a5d4d52000000b0021b93b46a2amr3588083wru.576.1655755587154; 
 Mon, 20 Jun 2022 13:06:27 -0700 (PDT)
Received: from localhost (92.40.169.68.threembb.co.uk. [92.40.169.68])
 by smtp.gmail.com with ESMTPSA id
 n23-20020a05600c3b9700b0039c5224bfcbsm20984858wms.46.2022.06.20.13.06.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 13:06:26 -0700 (PDT)
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: broonie@kernel.org
Subject: [PATCH 08/49] sound: soc: codecs: wcd938x: Remove spurious type_base
 from irq chip
Date: Mon, 20 Jun 2022 21:06:03 +0100
Message-Id: <20220620200644.1961936-9-aidanmacdonald.0x0@gmail.com>
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

This chip does not set num_type_regs or define any supported IRQ types,
so regmap-irq can't configure its IRQ types. Including type_base in the
chip definition is therefore redundant.

Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
---
 sound/soc/codecs/wcd938x.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
index c1b61b997f69..acba253b791e 100644
--- a/sound/soc/codecs/wcd938x.c
+++ b/sound/soc/codecs/wcd938x.c
@@ -1298,7 +1298,6 @@ static struct regmap_irq_chip wcd938x_regmap_irq_chip = {
 	.num_regs = 3,
 	.status_base = WCD938X_DIGITAL_INTR_STATUS_0,
 	.mask_base = WCD938X_DIGITAL_INTR_MASK_0,
-	.type_base = WCD938X_DIGITAL_INTR_LEVEL_0,
 	.ack_base = WCD938X_DIGITAL_INTR_CLEAR_0,
 	.use_ack = 1,
 	.runtime_pm = true,
-- 
2.35.1

