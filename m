Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A9474F840
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Jul 2023 21:07:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 52AABEEB;
	Tue, 11 Jul 2023 21:06:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 52AABEEB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689102439;
	bh=OOJMpaWhRd1u50nkpVqck1mnyPm7Ai73M9mHx/W/fAM=;
	h=From:Date:Subject:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=BpNoy4JxSOSCjpdW9VEV6ocXqy1Cz6UW4Z9ftgpKAtfY3EGJGCI8SHbmvjHxslLSU
	 4q+3lz3HfJV8CScUu/WwV2X1DD1teLa7ADMTOa3GzUe3IPsI2VBfsc2minSkAoNck2
	 nu4IBYGZcUb1PL7uv40NEdi3Rzgkv4EkwDySQzTw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ADAB1F8027B; Tue, 11 Jul 2023 21:06:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 36296F80236;
	Tue, 11 Jul 2023 21:06:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F0258F80249; Tue, 11 Jul 2023 21:06:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 547C1F80093
	for <alsa-devel@alsa-project.org>; Tue, 11 Jul 2023 21:06:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 547C1F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=pe521qSj
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-4fb94b1423eso9228198e87.1
        for <alsa-devel@alsa-project.org>;
 Tue, 11 Jul 2023 12:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689102375; x=1691694375;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Rj+9UulOxBhqwuLu9TU2zy1SRgpm3ojxV4TrMHj756I=;
        b=pe521qSj6XlIkT0wWVYUQ6offLjqsA3ryzdMSJcnFaivsXnrDnCGw+olI+HqdrA5F5
         tbY4xx/GP7utKH9SSqGDEfcU7H1MUecxCo6W7XdcTv6b1dhtKjZfcQRMtArG2Myk3zJi
         IbwkXUTqzDYWHv/rBhEvBWX6h8yCTM2g09rJ2rNFit1pQ6+WNzaq4i9N5lhAeH/JKCpH
         Sgzz+pOHbZjVIitupqzGCevKonh25E1CAnNDTEI06XiU8f8sc0tAWD09MvOzm+GSe/9o
         WyRF4XmGHCd5upMH/n5X8hm9ByLct6shL9/dtKv54CYg6NZBfvi/fG9VwGGGv/9wEf7D
         abwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689102375; x=1691694375;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rj+9UulOxBhqwuLu9TU2zy1SRgpm3ojxV4TrMHj756I=;
        b=GTM77XHttT3Z5YdV19hdkiWy9eQz8L+psAdI6T2zsyfblz12+6S+PAf2r+tF1WwK6m
         PfSCIY8/xaZ7EmfE7REcqrTDjMPAXiWwpnAUSzgtZuagsgLwnM1Aj/YEaCw0Wbfeq7or
         KWvN1CbO3637e856LFHnVwgMR2qiTqLpCDDIZzkwIHYbEDGJdjcb+2nIwbsT41VKzh/+
         fo2Hl9EjqrAMNfs/D+TQ2uGS44aOWMFNZ0ry4BUsUfZa0/ZjErk33y9iwta6O1MrJ6d8
         8e64zBp+X9fI+WligzLW6mki4/7OYL+wEjN19w9r7FFvnUnE+fCwBsaCIdsnrTd2Xi57
         Iykw==
X-Gm-Message-State: ABy/qLbYedyIrF3qvU5MsrDagUlXCcbc6YADjl0KlDdFrS9bIULSZk5q
	FHmW/GKiBgJcbBIU5z0NYi1u8w==
X-Google-Smtp-Source: 
 APBJJlGKBbaogf/KkWjxjVBOaCfqmQJWTcRiDA9PTN8fejC2aiZHmebUlhvOj7RYHNDcM0HV1A3rJg==
X-Received: by 2002:a05:6512:2351:b0:4fb:99c6:8533 with SMTP id
 p17-20020a056512235100b004fb99c68533mr16771901lfu.33.1689102375065;
        Tue, 11 Jul 2023 12:06:15 -0700 (PDT)
Received: from [192.168.1.101] (abyl96.neoplus.adsl.tpnet.pl. [83.9.31.96])
        by smtp.gmail.com with ESMTPSA id
 y6-20020a197506000000b004fb8c31c8desm411450lfe.208.2023.07.11.12.06.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 12:06:14 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 11 Jul 2023 21:06:09 +0200
Subject: [PATCH] ASoC: codecs: aw88395: Add of_match_table
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230711-topic-aw88395_of_tbl-v1-1-a05fdf5d0efa@linaro.org>
X-B4-Tracking: v=1; b=H4sIACCorWQC/x2NQQrDIBAAvxL23AVN0Np+pZSgdtMsiAZN20DI3
 7P0OAPD7NCoMjW4dztU+nLjkgX0pYM4+/wm5Jcw9Kof1FVrXMvCEf3PueFmxjKNa0hoXdA2Gme
 VNyBp8I0wVJ/jLHH+pCRyqTTx9n89nsdxAuHXowx7AAAA
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Weidong Wang <wangweidong.a@awinic.com>, Bruce zhao <zhaolei@awinic.com>,
 Nick Li <liweilei@awinic.com>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1689102373; l=1327;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=OOJMpaWhRd1u50nkpVqck1mnyPm7Ai73M9mHx/W/fAM=;
 b=hjEsFXNcNR0npi/4muWRweo74uXrSNbApcvxjP6fIg6SokaXK5XsN7FlfEm+Wa7sUzlRGD2CJ
 tTIvpRX6msJASOhpvRMtxDq7OMTboPYbVrQ+/7V5XtcYSOGShdRRoRD
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Message-ID-Hash: 4GGKBT5FWDE2ESWCRFO7JDXS5ABTBYFC
X-Message-ID-Hash: 4GGKBT5FWDE2ESWCRFO7JDXS5ABTBYFC
X-MailFrom: konrad.dybcio@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4GGKBT5FWDE2ESWCRFO7JDXS5ABTBYFC/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The i2c_match_id entry is not enough to get the device probing with DT.
Add an of match table in accordance with the bindings.

Fixes: 62fc25fbab5f ("ASoC: codecs: Add i2c and codec registration for aw88395 and their associated operation functions")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 sound/soc/codecs/aw88395/aw88395.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/sound/soc/codecs/aw88395/aw88395.c b/sound/soc/codecs/aw88395/aw88395.c
index 9dcd75dd799a..5ff01d3c31c8 100644
--- a/sound/soc/codecs/aw88395/aw88395.c
+++ b/sound/soc/codecs/aw88395/aw88395.c
@@ -566,9 +566,18 @@ static const struct i2c_device_id aw88395_i2c_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, aw88395_i2c_id);
 
+#ifdef CONFIG_OF
+static const struct of_device_id aw88395_of_match[] = {
+	{ .compatible = "awinic,aw88395" },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, aw88395_of_match);
+#endif
+
 static struct i2c_driver aw88395_i2c_driver = {
 	.driver = {
 		.name = AW88395_I2C_NAME,
+		.of_match_table = of_match_ptr(aw88395_of_match),
 	},
 	.probe = aw88395_i2c_probe,
 	.id_table = aw88395_i2c_id,

---
base-commit: 8e4b7f2f3d6071665b1dfd70786229c8a5d6c256
change-id: 20230711-topic-aw88395_of_tbl-68b16c5860a5

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>

