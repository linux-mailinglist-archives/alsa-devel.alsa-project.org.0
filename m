Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9506B91BC65
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Jun 2024 12:12:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C417122AF;
	Fri, 28 Jun 2024 12:12:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C417122AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719569574;
	bh=ycHPrSfshLbhaVlOmSrBNFLaE6akGY9mtxIkStrGvh4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KWeWs24SO3IoexGLY7WqsPlHUXh++uuOPy3NFPhh5Sf3pyGRLf+wkThNjfTT/syx1
	 37vCDMMvBkml/IlwI67wNtyN1dNQNTsZXJsWGD/1mlvBbId5Gb5zqHwSDpS7z91mKW
	 VGp49WYyQKPJtTY1Zf51JCMcIsKh/ZDM7bm2k2sE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 93C63F805F5; Fri, 28 Jun 2024 12:11:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BB8F6F80600;
	Fri, 28 Jun 2024 12:11:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 53838F8016E; Fri, 28 Jun 2024 12:11:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 175ADF8016E
	for <alsa-devel@alsa-project.org>; Fri, 28 Jun 2024 12:11:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 175ADF8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=l5Q9l1EO
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2ec61eeed8eso4732061fa.0
        for <alsa-devel@alsa-project.org>;
 Fri, 28 Jun 2024 03:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719569494; x=1720174294;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JrC0oanY/xXM5tNplzJFb5TLPsl7ab1mW6qPRTKsSC8=;
        b=l5Q9l1EOizYVbfVPcfKDasxdte7KP1mpRltGJoW0g4NEu5faZGyh1r5jo94POZwzxu
         i6vTYAylUrvTdoCIscVIn2WJKoFSW6GwIIFGhYT4ppzXdQOg+R4FQGk91yAtz2nqEDmh
         agL7u5wh3PHxhEZQPmsVqxrV7c/3aEv2i4whni8nvz8p+fHLejqhSmbJMNXPblA7LE8C
         PMVg9TRmZJYiYkhVGvzVY7zL8kOUMFB5BYeU5tVwMDXdMQIkE/TiHTn5p3yM9LSO//y6
         QwtwCrxvc8Dae+ZJ8yyYamrlxI2AL/5r6p2E6RNrCNH6tdCyjDdplW2RUGZPTv5bHbhV
         AlOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719569494; x=1720174294;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JrC0oanY/xXM5tNplzJFb5TLPsl7ab1mW6qPRTKsSC8=;
        b=BacSk+gFyOpGKHl2OUE/zayWKoQRH6Tu6yboAc2VBu0k7IuoLBQv65Hw2uA/eiyEGa
         KA4emfLGUFFOF6rzlmJKBL0UmlPsoMugQB37JSAHWxbv50uc6FaHd5EhUuX38bxgF2lJ
         Dc/MpJH3wMVnTrb7FIFJwzG/n8xMdfwMN2X0oyqQXH7lRCEsEh5EZ8qbnleXBWwiaDsv
         wCU6nOISMCNm5OdcyW/OIi4lqT7PKWfPb15RZZGGQOyHdV3zPug2cimMu/yiUFREx+H9
         YPpmszDGkkb9BUAL/s5/jWLorO7lIA/VqI/HhC4Fzip6165ixLhIpXdywhXVglcHdFv3
         X4QQ==
X-Gm-Message-State: AOJu0YyWtiFRA3Nt/06qLE0AO5SqVB/B5t2miW+3v0NXt9C9oHS1CYBp
	sYuq/harGob4V0YXsMsusO7Z7kN4xTxBhtNCDGdT5qb7+At26EG4LRAVLpfBuwFSz2JH6dMyYOL
	0
X-Google-Smtp-Source: 
 AGHT+IFKhIJpRNXOaeJJ2eW2v9e+5Ei4zrnP5FIL9QTBjvfsw4tDY8rG0xk7rsZ1cWCftr3DLKVXYg==
X-Received: by 2002:a05:651c:10a2:b0:2ec:5cfe:2e99 with SMTP id
 38308e7fff4ca-2ec5cfe2efcmr86889161fa.6.1719569493806;
        Fri, 28 Jun 2024 03:11:33 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4256b0c15f8sm27024605e9.47.2024.06.28.03.11.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 03:11:33 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 28 Jun 2024 12:10:56 +0200
Subject: [PATCH v2 2/5] ASoC: codecs: lpass-rx-macro: Keep static
 regmap_config as const
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: 
 <20240628-b4-qcom-audio-lpass-codec-cleanups-v2-2-e9741143e485@linaro.org>
References: 
 <20240628-b4-qcom-audio-lpass-codec-cleanups-v2-0-e9741143e485@linaro.org>
In-Reply-To: 
 <20240628-b4-qcom-audio-lpass-codec-cleanups-v2-0-e9741143e485@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2080;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=ycHPrSfshLbhaVlOmSrBNFLaE6akGY9mtxIkStrGvh4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmfow+5/Q8/abTSGqS3WeeJmNN/eGY2CApICxtv
 1RpQy+alaiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZn6MPgAKCRDBN2bmhouD
 1z1SD/977JGgYit9iIszAbc1+SmnkFG1Z8kCb/Hm66RsrpD3PCec7xncGbzpllIJD25/MWPHp3s
 KeYM25mJNwmtrsXQ2yAc1Mje5nEN6Oouc0m7Wt4UQUNvKGJ38kDZ7/zhj1H8bQ81swJyEFnDBT4
 +0ibiITHjvLRXNi/1kQ1e2PxR9s9P20Uwxc0PD65gCXuIjDT9wsl0fpk3kH9t2C8w5TR+TwAkpw
 Mm2vgKQoLVlLyNE7h45yUka8PXhaDFqZ+7oOt1EYcYTv+h9nrk+YaAx9lkjxhZ3PgvuD7JccnKu
 ldQy3ghq9c0MgtN/S+JwHESNLt+OTx0IaKy9W/IohMVioYPFqVYXJVUyBBK8oXmbEjgv1bEI7do
 3WQGEdEseFyaVbxm2uTD4gSEu7RER7FK9TtLTV/nxIZYxxy+QB7+DJaZRm5ib5Uv8ncmz07NMtF
 Jd+CWFUp3UZQKvCgc/Po6aTyAQajsF44iSbqV8XwLhC1m5WXe9loIEJqGkgI+iLWCL2Mqju8E5Q
 NK1VsC+W8KlfYce5yJoV7D7ohAJfGxoti96qi0H/FWbTGYZstQDvKbUICAVcRImPV7DXbKST2rI
 A4Ba+TyOP1XmyZrzMxoqKNasLw8KlgceFqahbL7BiX+7IdW/yn2LiMW5gkA3XC4nh0wg4LM5Ohn
 1cPt/M88ksZ2LIA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: C2Q3VGWRQ6Z34C6LWONGV4BYDK3KYVFD
X-Message-ID-Hash: C2Q3VGWRQ6Z34C6LWONGV4BYDK3KYVFD
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/C2Q3VGWRQ6Z34C6LWONGV4BYDK3KYVFD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The driver has static 'struct regmap_config', which is then customized
depending on device version.  This works fine, because there should not
be two devices in a system simultaneously and even less likely that such
two devices would have different versions, thus different regmap config.
However code is cleaner and more obvious when static data in the driver
is also const - it serves as a template.

Mark the 'struct regmap_config' as const and duplicate it in the probe()
with kmemdup to allow customizing per detected device variant.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Not adding Dmitry's Rb tag, because of major change devm->cleanup.h.
---
 sound/soc/codecs/lpass-rx-macro.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index 4cf030760d74..1d2dce1f600c 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -1663,7 +1663,7 @@ static bool rx_is_readable_register(struct device *dev, unsigned int reg)
 	return rx_is_rw_register(dev, reg);
 }
 
-static struct regmap_config rx_regmap_config = {
+static const struct regmap_config rx_regmap_config = {
 	.name = "rx_macro",
 	.reg_bits = 16,
 	.val_bits = 32, /* 8 but with 32 bit read/write */
@@ -3849,10 +3849,18 @@ static int rx_macro_probe(struct platform_device *pdev)
 		goto err;
 	}
 
-	rx_regmap_config.reg_defaults = reg_defaults;
-	rx_regmap_config.num_reg_defaults = def_count;
+	struct regmap_config *reg_config __free(kfree) = kmemdup(&rx_regmap_config,
+								 sizeof(*reg_config),
+								 GFP_KERNEL);
+	if (!reg_config) {
+		ret = -ENOMEM;
+		goto err;
+	}
 
-	rx->regmap = devm_regmap_init_mmio(dev, base, &rx_regmap_config);
+	reg_config->reg_defaults = reg_defaults;
+	reg_config->num_reg_defaults = def_count;
+
+	rx->regmap = devm_regmap_init_mmio(dev, base, reg_config);
 	if (IS_ERR(rx->regmap)) {
 		ret = PTR_ERR(rx->regmap);
 		goto err;

-- 
2.43.0

