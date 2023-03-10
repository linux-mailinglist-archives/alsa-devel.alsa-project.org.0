Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E99016B5314
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Mar 2023 22:44:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DED2314E2;
	Fri, 10 Mar 2023 22:43:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DED2314E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678484683;
	bh=HKXjcx7gDdBkvkuvQw9bcRH7ZKvDUwtqfcQPHrn/OqU=;
	h=From:To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ndgLTRkJO9V+UxEmFNmCpX9sr566IXMFN2782MiThrUnGjbOAsYoCRtLLc0UE4B+5
	 sbaONzrpwVOqLorP0dKN7HPDMfNG+dPvMfF38MK/FN+aazpXsXwKLrvBPCwINYwgBL
	 zdsv1wz9ysCSAS0obCd6mqHMvNOHOm1nZFlasZbk=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E4FEF804B1;
	Fri, 10 Mar 2023 22:43:52 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D11BCF804FE; Fri, 10 Mar 2023 22:43:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 41A9BF800DF
	for <alsa-devel@alsa-project.org>; Fri, 10 Mar 2023 22:43:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 41A9BF800DF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=xF4Q47yj
Received: by mail-ed1-x534.google.com with SMTP id j11so26085753edq.4
        for <alsa-devel@alsa-project.org>;
 Fri, 10 Mar 2023 13:43:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678484617;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=VtdBZBHjdNz7Y46m59SHrmzEAnff5o2OBs5iW9CHcGo=;
        b=xF4Q47yj1z4o8N1c5ExKygycmKfV4vmuKm+QjVP/qyjMK83nq9YYLNODjBSgjhQDnT
         8jl1aMJl9sVn2DNo3QAlFGrjA0JOdHD8a8YmarriE5TTSSXjX29YNSyGeXM9CyOOMJ8L
         jjnuUjg747DVx5xycOXofQb0yyr9CiK5X9tAKnVtlR/dgGTWYXXrHCzbEshp1Ri5UNFD
         YUK9jzV0DVFPBQ64gFCPtBv1ErLLbjlry8lj9VOeLdFjcLXBqwdSyXjo7oHf6khjujln
         uJv1oX152EL4Vo/07Sf6Qp1Eisvmtlu0fxrtuetUoiJprcXLqSQgvTwuiKWPCP8nW9AV
         gy9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678484617;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VtdBZBHjdNz7Y46m59SHrmzEAnff5o2OBs5iW9CHcGo=;
        b=D9hKxol11CW28MSDCWu00wuprw3Ub3DvjN4oux4MJSoiYD02C3EEw3NYZAo16hFgjJ
         YUbsuquAKsz+5r/WxLtmkodwcVpIh3BKZYQxN+id5dTztsqFo1vmmA1cQvtN+x90x8+0
         bOtQcictkUiAi1BYZdNgIroFod0UyMeyOPIpBQDsVXRDtcnYhItLzplTAuQRIcMNkn78
         MDZqO9SQ6GZeFjgQb0S30w2vqNG4gyK/V8WHFUXW9Mq+d7Z5GBrSyELlwjMpGuE5D9vA
         nBCCC/MLuesT/4YDaEoQh76QHhx+Q9y7DmOAqOrrODhDeb0Ua6XI+Pj1Vys9Jfx4hN69
         cOkg==
X-Gm-Message-State: AO0yUKX2rHjNuF5A8fc9qaBahp4uPNnYwGJL1qSOqkpUmdCugKEc6qYt
	iemJpJDEfB87KmXO/6AaxVvWKA==
X-Google-Smtp-Source: 
 AK7set9ZnrYfuf8zWlLeHJSEk4HSH1D3c437QABGG/RfrwJXmg4A4Gxrs81DwgbcSe7Z36QyBFQkyg==
X-Received: by 2002:a17:907:8686:b0:8f7:5038:9896 with SMTP id
 qa6-20020a170907868600b008f750389896mr34069311ejc.70.1678484617366;
        Fri, 10 Mar 2023 13:43:37 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:34:52e3:a77e:cac5])
        by smtp.gmail.com with ESMTPSA id
 f2-20020a1709064dc200b008dcf89a72d7sm327228ejw.147.2023.03.10.13.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 13:43:36 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Sebastian Reichel <sre@kernel.org>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/9] ASoC: qcom: lpass-sc7280: Drop of_match_ptr for ID table
Date: Fri, 10 Mar 2023 22:43:24 +0100
Message-Id: <20230310214333.274903-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: MNASRNCVKFTFI3ARH7LJ2CZE4YB3FOSJ
X-Message-ID-Hash: MNASRNCVKFTFI3ARH7LJ2CZE4YB3FOSJ
X-MailFrom: krzysztof.kozlowski@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MNASRNCVKFTFI3ARH7LJ2CZE4YB3FOSJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The driver is specific to ARCH_QCOM which depends on OF thus the driver
is OF-only.  Its of_device_id table is built unconditionally, thus
of_match_ptr() for ID table does not make sense.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/qcom/lpass-sc7280.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/qcom/lpass-sc7280.c b/sound/soc/qcom/lpass-sc7280.c
index d43f480cbae3..956b974e322e 100644
--- a/sound/soc/qcom/lpass-sc7280.c
+++ b/sound/soc/qcom/lpass-sc7280.c
@@ -443,7 +443,7 @@ MODULE_DEVICE_TABLE(of, sc7280_lpass_cpu_device_id);
 static struct platform_driver sc7280_lpass_cpu_platform_driver = {
 	.driver = {
 		.name = "sc7280-lpass-cpu",
-		.of_match_table = of_match_ptr(sc7280_lpass_cpu_device_id),
+		.of_match_table = sc7280_lpass_cpu_device_id,
 		.pm = &sc7280_lpass_pm_ops,
 	},
 	.probe = asoc_qcom_lpass_cpu_platform_probe,
-- 
2.34.1

