Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 17862506B88
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Apr 2022 13:55:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 97988185F;
	Tue, 19 Apr 2022 13:55:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 97988185F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650369355;
	bh=1mIt0g4ZoaF5vimATNeBysPy9KPrkzUs0b1lJu+dCGA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DxEEPwtg0ByuYQ95F36h79bDx/NNIVxtc+K6AHCouGC4aeQJREgcSy9xFoCy/IbHP
	 ilvTpm0OEWlpMwWfWxnJbhMGO+2xnAUC0wuh/TMFFNji/Y0e41Z9qO6uXiKEADsyjZ
	 NrR+4F62KcLFotpEXe6U8JJJTD/jHwAP9RMhq6rk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 29E0AF8053E;
	Tue, 19 Apr 2022 13:52:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 48075F80269; Tue, 19 Apr 2022 13:37:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B8B4DF80116
 for <alsa-devel@alsa-project.org>; Tue, 19 Apr 2022 13:37:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8B4DF80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="NxSeUfsH"
Received: by mail-wr1-x42e.google.com with SMTP id m14so22030814wrb.6
 for <alsa-devel@alsa-project.org>; Tue, 19 Apr 2022 04:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3+pyHiIZwn48euMcubwO6NcjO2rnYdnegnxbfyc+trA=;
 b=NxSeUfsHRzGIvqoWJEcoWLbMNEYDnF+TUUaDE6xbdknN0Ff+fr0QlxCd9kU/mXl3kP
 0RmGxuaUtmGEaZPI8mjI8SKKy9Yvn0D5ILH+4iiFizgVfI2VdAtWs3Zsxb42jEtuGYYX
 4SVOF8in5vCUtGXrIkhNetg0B7C+XeRep5f/sItDo/Rf1IoFwjgu3/39iQBNG0FXpj/H
 jR4PQoYQ1x09GGrCrmGm71lEeELZsa0QuRAoii8K5Zs9YI7/f2ysjmnyPR+nXzdBRn8D
 Lc8JVEhwvM92yc0BF7b8xecDt0astjrbpjmU70dKwuvkdq/TpsKg3itxxOEEtftZK7zA
 og0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3+pyHiIZwn48euMcubwO6NcjO2rnYdnegnxbfyc+trA=;
 b=IvadRkAKMBQRa6jzXzR8oJgQOY4tbHJksmwMIK9Um36ebIy39Tt9iwvlRpc68QJ0zj
 xpgeyDab/jy99OnZhw7ZOv19GAzmIHw9IlkHioLOCwyPJiS3D0L9cTlRK7oMP8vNlg/6
 N+rrsQsb1kOWgjEbbd5NARsY+nJ5Od+qNy9O5hUZ+SYm+l7hisdb1emngZMbt1gIRVzM
 ZkcSUopDO51nzU8dmzQzSEFqKLvHoOAFYZ6/jGYM90efwumo0oIkZeANt94uhH4OSkbj
 XYBBRSd8XWk6ZGMGrzyCmXHSVq5iaXnU3E8o7Nl2E3NUoyZGr4q88V++Lwrx9OKRPDq1
 JPCA==
X-Gm-Message-State: AOAM531f1N75RwyH7HQlqu0/WNaf087y30LffFneGY74wYYz51cjfdZX
 YB24lIpdfYGnm/6zHgLGylCm+w==
X-Google-Smtp-Source: ABdhPJygjXlTLFUhttVQQnb0yTcSmF6jZ+ScgPXbFpRuZDgg2khUSRTi9HufwTneuKo6B+/I1+kAGg==
X-Received: by 2002:adf:dcc6:0:b0:207:a0e3:9d28 with SMTP id
 x6-20020adfdcc6000000b00207a0e39d28mr11666843wrm.380.1650368257676; 
 Tue, 19 Apr 2022 04:37:37 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 bk1-20020a0560001d8100b002061d6bdfd0sm14202120wrb.63.2022.04.19.04.37.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 04:37:37 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: srinivas.kandagatla@linaro.org,
	robh+dt@kernel.org,
	krzk+dt@kernel.org
Subject: [PATCH v2 1/2] ASoC: qcom: lpass: Fix apq8016 compat string to match
 yaml
Date: Tue, 19 Apr 2022 12:37:33 +0100
Message-Id: <20220419113734.3138095-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220419113734.3138095-1-bryan.odonoghue@linaro.org>
References: <20220419113734.3138095-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 19 Apr 2022 13:52:22 +0200
Cc: linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 bryan.odonoghue@linaro.org, devicetree@vger.kernel.org
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

The documented yaml compat string for the apq8016 is
"qcom,apq8016-lpass-cpu" not "qcom,lpass-cpu-apq8016". Looking at the other
lpass compat strings the general form is "qcom,socnum-lpass-cpu".

We need to fix both the driver and dts to match.

Fixes: dc1ebd1811e9 ("ASoC: qcom: Add apq8016 lpass driver support")
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 sound/soc/qcom/lpass-apq8016.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/qcom/lpass-apq8016.c b/sound/soc/qcom/lpass-apq8016.c
index 3efa133d1c64..10edc5e9c8ef 100644
--- a/sound/soc/qcom/lpass-apq8016.c
+++ b/sound/soc/qcom/lpass-apq8016.c
@@ -292,7 +292,7 @@ static struct lpass_variant apq8016_data = {
 };
 
 static const struct of_device_id apq8016_lpass_cpu_device_id[] __maybe_unused = {
-	{ .compatible = "qcom,lpass-cpu-apq8016", .data = &apq8016_data },
+	{ .compatible = "qcom,apq8016-lpass-cpu", .data = &apq8016_data },
 	{}
 };
 MODULE_DEVICE_TABLE(of, apq8016_lpass_cpu_device_id);
-- 
2.35.1

