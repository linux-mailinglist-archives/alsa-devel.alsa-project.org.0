Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CE28F5984A7
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Aug 2022 15:49:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7D2781685;
	Thu, 18 Aug 2022 15:48:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7D2781685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660830571;
	bh=hxajEoE5MJygEcX4xJNXeN4Lnl4HSTYWDxCrbOxhnXM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VMQv0hhMp7Vodpwzck25TPqwLuKkNOgemC4JB//T0YuvWR/ac6CLvqAiyRj1rUpWg
	 q/5AGqlATNX3s/6iU8zsUkF4xY6sZb9MqD8dU379ct6/RL3quCis68JCVb++i5FYyv
	 duoSDywoCTD955nsGpymkVO8zbjT2SOTsPRJJ/eg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 70B01F8055A;
	Thu, 18 Aug 2022 15:47:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2050CF8013D; Thu, 18 Aug 2022 15:46:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3B9ABF804AD
 for <alsa-devel@alsa-project.org>; Thu, 18 Aug 2022 15:46:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3B9ABF804AD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="UskYjoNd"
Received: by mail-wr1-x42b.google.com with SMTP id r16so1801207wrm.6
 for <alsa-devel@alsa-project.org>; Thu, 18 Aug 2022 06:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=3+p1RU9Ekkat1LJvUzvA3of/Y+G9mmoh8xJKlE/HMlk=;
 b=UskYjoNdcSqoK6rr8xlCC/hvPPRwqGyeMjYq6y+TF6YJ+X8iPUTMmBM6maVK2N/ta6
 WhTgRWw6OhRs6Rz6ALUf6AHhtuOcynjmaInTzTFhkgvOHAOhHZJG3AjuXSlglWTCOuQL
 Vafgi9VI/2wWAFjs/vLGQRTgbnsgKtWqAr81hB+q66XlU/eelaschaJYXIvDhdAa75yz
 wf9E+w2qPPzkXQUmsVoTtLOxWMmqTMxBfh1agpx8spVjjSRKEfSN1/WXItQgS9f4NrrV
 ACOdCkEm1fDNctoIKKjdkJxYr1g5Fj26SPEgLrn9axDVXzg1HtjJXWiEwqCNmqcMHY4n
 X2kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=3+p1RU9Ekkat1LJvUzvA3of/Y+G9mmoh8xJKlE/HMlk=;
 b=6NsMKwwmGCs3zusUcUy8kFyoVq6zm1/wTyYa1jsXD8zQ0afNTXiybooI8+0GMNygPO
 1OrIxVzBeC5vLzzIAcY5gjNeaCd+xM7S5JF+IQR1t2ZXigfONuYFVuKxfMgb8cHQPnn+
 pxYcO5VIiglTh10p/wSFiwf1nI2Hxf5shW7aQry7wFeFTbUCm0FmASohE1UJ7g7+OUId
 B76jhqvJm1qR1g1QaGdsi0pue/zI6zUz6E9O41PWAiQ3lLQTgqMao2zi4yH7W1eVCOXG
 a9XG3ws3pl4TD9JdqqeTuzyxj9fj9IsqiwGq4KJ8q6Goq8NwQqv2CWza85S4Edzo6sXu
 6weQ==
X-Gm-Message-State: ACgBeo1nckTEO4X3ZxJYPJ9ZxYD6rU7WGotceQuhLf/5tI6W3NLFyE9/
 IZuhUqMiCMRgXaP7xnhW/XrdhQ==
X-Google-Smtp-Source: AA6agR7Pq5Rnsp1gu2xJq+iWh5Mc1TQ3eMrM0e7OaEqO4LqUJqBbOYq3wSCx1+y8WarrIk0ZtVGImA==
X-Received: by 2002:a05:6000:1561:b0:225:337b:454b with SMTP id
 1-20020a056000156100b00225337b454bmr410757wrz.660.1660830407083; 
 Thu, 18 Aug 2022 06:46:47 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id
 v5-20020a5d6785000000b0021e47fb24a2sm1454549wru.19.2022.08.18.06.46.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Aug 2022 06:46:46 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 3/6] ASoC: codecs: tx-macro: add support for sm8450 and
 sc8280xp
Date: Thu, 18 Aug 2022 14:46:16 +0100
Message-Id: <20220818134619.3432-4-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20220818134619.3432-1-srinivas.kandagatla@linaro.org>
References: <20220818134619.3432-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 tiwai@suse.com, robh+dt@kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org
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

Add compatible for sm8450 and sc8280xp.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/lpass-tx-macro.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/lpass-tx-macro.c b/sound/soc/codecs/lpass-tx-macro.c
index 55503ba480bb..4384266847ad 100644
--- a/sound/soc/codecs/lpass-tx-macro.c
+++ b/sound/soc/codecs/lpass-tx-macro.c
@@ -1988,6 +1988,8 @@ static const struct dev_pm_ops tx_macro_pm_ops = {
 static const struct of_device_id tx_macro_dt_match[] = {
 	{ .compatible = "qcom,sc7280-lpass-tx-macro" },
 	{ .compatible = "qcom,sm8250-lpass-tx-macro" },
+	{ .compatible = "qcom,sm8450-lpass-tx-macro" },
+	{ .compatible = "qcom,sc8280xp-lpass-tx-macro" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, tx_macro_dt_match);
-- 
2.21.0

