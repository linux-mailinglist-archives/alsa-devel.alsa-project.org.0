Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E8BD9506B82
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Apr 2022 13:55:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 63490182F;
	Tue, 19 Apr 2022 13:54:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 63490182F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650369327;
	bh=9Mfn92PQKMPsOzaTC5svA5jVxs9qCmUw1qr5fQDoAWM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=o+kgq50ZSefGX4a2S6oXQulnC9y8lvBY4O7I6J5+J28eu4iBsdyDsdgmtTQGQXz9T
	 /Rr12EvUvT+1e5L3JeG71O/AgZJJPOj1/Ccpki9Elj5SZsm2QvXkfTrvP9udjt+11P
	 x5HB6s/KtpaceRU5GsU+Pr/XhqWc+hrkKVEv07tI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F09D6F80533;
	Tue, 19 Apr 2022 13:52:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DC7FEF800D8; Tue, 19 Apr 2022 01:10:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 47ECAF8012A
 for <alsa-devel@alsa-project.org>; Tue, 19 Apr 2022 01:10:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 47ECAF8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="XWkxXb63"
Received: by mail-wm1-x32e.google.com with SMTP id q20so9587352wmq.1
 for <alsa-devel@alsa-project.org>; Mon, 18 Apr 2022 16:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=n0g18UDBVHtHKQ1fDQEx7qeFaotQVOT5C45U14Lm4wo=;
 b=XWkxXb63ypNMV4qIVSI+UCFJzb3WPW/mhFLFPd5Wto1c+faRoxYwaFCwV6+CAVDMWW
 a7US4bBw5RYBKAUyOqrQjCSUkR2mQeYBSdcXa4tSmcs4cxyRwPnshTxjIja1KYHucX03
 nRW0irUpv3IIMIHr9slL/sl18FzuKSXjZcXcXGiNRO6WqU4IH+4bfe6+cauWGnMYeYwj
 QIzFGP3SauJ31/P6qOretYexGjviQ1RCbe6CPNdL67TnOdTMyIsIOOC5neO5m9EkF+nY
 Izz4qN8Sl3ePx4c/VzGTAeeVQUqEmm+ntFT8F3Tt5ETYyF8neXx5qXL6QwDscN/U6nPb
 ny7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=n0g18UDBVHtHKQ1fDQEx7qeFaotQVOT5C45U14Lm4wo=;
 b=6/5wTa2RtJqS0ieTz/harkPh6lCBPYBEIuSOTELSMRsORCutwSiWeCYJRbtJScwC7r
 IoIkSYdrpwtjsYF+/TC17U34owaX7YensRB6evV9Q4Sx2JjcASpyLIrXNm5WOsxt+Kk7
 6jfL81HHkoq54to7WnqUCP5Xo04Kxr4oZE8ChJXs19EQA47HHMCZYcihh9RxfLXq0EEs
 HZXrlpMlEwenUNMF1s7cUNEvrr56nMHCCpViqw5S/Gied3isWo0jJm/d+Sp0u5SYq+oL
 jqFDDNX0bRKsLcySFHPdvmixWHL1an1ugNbMn0cZ60kXyFd8ilFP2yUSaixDMPD8243d
 tQ+g==
X-Gm-Message-State: AOAM533MAo1qM2K0l3GwGlFUDRnz3s1iD07AzIQxISuPFsSCYoTtqm8W
 fU6H26KWYI8PQsCNyW8zTIfsPQ==
X-Google-Smtp-Source: ABdhPJzp5Ddr0XSvY2itSxZ3nWZWBJqUnbXr5RTwTJszkowfKdvS7mqeUM0lgXHW7hi04BKKyNTXyA==
X-Received: by 2002:a05:600c:1d08:b0:38f:fb9d:5758 with SMTP id
 l8-20020a05600c1d0800b0038ffb9d5758mr13143977wms.89.1650323399882; 
 Mon, 18 Apr 2022 16:09:59 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 f14-20020a5d568e000000b00207ae498882sm11187567wrv.32.2022.04.18.16.09.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Apr 2022 16:09:59 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: srinivas.kandagatla@linaro.org,
	robh+dt@kernel.org,
	krzk+dt@kernel.org
Subject: [PATCH 1/2] ASoC: qcom: lpass: Fix apq8016 compat string to match yaml
Date: Tue, 19 Apr 2022 00:09:55 +0100
Message-Id: <20220418230956.3059563-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220418230956.3059563-1-bryan.odonoghue@linaro.org>
References: <20220418230956.3059563-1-bryan.odonoghue@linaro.org>
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

