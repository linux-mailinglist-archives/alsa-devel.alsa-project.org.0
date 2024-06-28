Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2775D91DF70
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Jul 2024 14:36:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BE6B42BBC;
	Mon,  1 Jul 2024 14:36:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BE6B42BBC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719837410;
	bh=KI0YAwoE5tOePJ3OE78J/FukHKyRQlV6qp3tvk4r3uI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=i39VmGiOZinE2/cnuc61Zfw8D+ybKuJMLQJTOlGmi7haXeWT4fcM0tlLqhOy2SlTu
	 rR2tZ9qI3mmrYrBPnJBDPBTI6zPxRpDHMh7fmKqRKK3RbErlaBheyLpHKYD0XM1yiX
	 uP7NrKTVWxfajYPAvuZ6L53BMooPZeVIhsSH94Zg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AF8BEF89AE9; Mon,  1 Jul 2024 14:23:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A3539F89AD0;
	Mon,  1 Jul 2024 14:23:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AA2D1F80578; Fri, 28 Jun 2024 03:07:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 46F8DF8016E
	for <alsa-devel@alsa-project.org>; Fri, 28 Jun 2024 03:07:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 46F8DF8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=jGDJLPp+
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-42564a0d3ceso538925e9.0
        for <alsa-devel@alsa-project.org>;
 Thu, 27 Jun 2024 18:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719536839; x=1720141639;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tG1DAtBscnbl92897tEGafV+QEn7b6lppJT5wBhQF54=;
        b=jGDJLPp+mEw0bvlcFHsyu0hprKt0W82mPFE089e2hRgmXSt2gmUvAGJ/Aqd3sPKkT1
         7kpCQ5MgCZ3YfIGBkQ6Fr9Ww8eXBtUSe/BM9vTR31aLtcwffLS0JAUR1x9HCp2oZON/U
         lOnZNoGNApUdVJC0eGY88pINEA23QU3c0z2DwrY4BfaFYVmFIPAhHKkbRbXHJ2K+Q18F
         mGRzDCkLO6Ioq2qCgViUHCOA6VCLTZpBmaQZg5qsD8Be6C+NAsgbo9BONZkY6xY2oCfz
         y8HH24rbbSlEU8k5weoOPturqFDPe8MFF9yrsiW2Rm0N+b124F/6pyCiVswC46XeZW2u
         5XPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719536839; x=1720141639;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tG1DAtBscnbl92897tEGafV+QEn7b6lppJT5wBhQF54=;
        b=LR3Nol0V/IgYGixPKygQNX6X3yZexRXV43aEjQkZ4ZFMQQYEhuwQK3E8abapRcqcnN
         9EFk/AViSbT4bw1SUcRBHSkIS1LM7E7r3K3tFA0fCeER5fUr7eP5nC7zxJeLj8Slcg2p
         14J7sZ3sLkZDJj1RqG4Mk7JugWbPV72GtUXPvLo2e8iyaiR7sVpBRwWBlApJzLMOX+ck
         2uSoFwDORLtRMSjtUeBfcN8apbS1qcoHksUUGzgab798/MLgGKnJ9dOAuwU9oq37GtcC
         XqITF47Hhw1I8UjAEZ2nfaN2ORq8XwJCuS30E2zKi7QUxgpAhh6XhN+ZC/SUqcDuzV6i
         fztQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVlQkcDnyoZLtHKHNLXdbBVG6jgqc9GlcOKDocNyN7MvbkRIabHe+Paf679zB+8zGpwjb6kx/OC9DR2nLQuPZj+M6HKc94PVOarhKA=
X-Gm-Message-State: AOJu0Yy7Isr5VS7s8lVv+s+ogykAX/0BAXztt+plONmTwenJMz0XomzT
	ATDwYEV3cYhpv8A7Y4udy8OS597/G9JNvdCL0j9yIKVpukK6MtoL9ylMfnKM+WI=
X-Google-Smtp-Source: 
 AGHT+IFaXp+aeAO1CS/cju1lvX6fP2/V5KyNto62ApeEBvJ1oGHUvh4DgDlWfDnP07O2Fls30BjBHA==
X-Received: by 2002:a05:600c:491d:b0:424:fb2f:9d4b with SMTP id
 5b1f17b1804b1-424fb2f9f55mr43198915e9.21.1719536838893;
        Thu, 27 Jun 2024 18:07:18 -0700 (PDT)
Received: from fuerta.Home ([2a02:c7c:7213:c700:2cd1:b0e8:abb:540])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4256af3c27dsm13075805e9.7.2024.06.27.18.07.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 18:07:18 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
To: linux-sound@vger.kernel.org,
	srinivas.kandagatla@linaro.org,
	bgoswami@quicinc.com,
	lgirdwood@gmail.com,
	broonie@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	konrad.dybcio@linaro.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-arm-msm@vger.kernel.org,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	elder@linaro.org,
	dmitry.baryshkov@linaro.org,
	krzysztof.kozlowski@linaro.org,
	caleb.connolly@linaro.org,
	linux-kernel@vger.kernel.org,
	alexey.klimov@linaro.org
Subject: [PATCH 2/7] ASoC: qcom: sm8250: add qrb4210-rb2-sndcard compatible
 string
Date: Fri, 28 Jun 2024 02:07:10 +0100
Message-ID: <20240628010715.438471-3-alexey.klimov@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240628010715.438471-1-alexey.klimov@linaro.org>
References: <20240628010715.438471-1-alexey.klimov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: alexey.klimov@linaro.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: DP24W7XQU24SYBVFQ4VJZ373NRUBFILP
X-Message-ID-Hash: DP24W7XQU24SYBVFQ4VJZ373NRUBFILP
X-Mailman-Approved-At: Mon, 01 Jul 2024 12:23:18 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DP24W7XQU24SYBVFQ4VJZ373NRUBFILP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add "qcom,qrb4210-rb2-sndcard" to the list of recognizable
devices.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 sound/soc/qcom/sm8250.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
index a15dafb99b33..50e175fd521c 100644
--- a/sound/soc/qcom/sm8250.c
+++ b/sound/soc/qcom/sm8250.c
@@ -166,6 +166,7 @@ static int sm8250_platform_probe(struct platform_device *pdev)
 
 static const struct of_device_id snd_sm8250_dt_match[] = {
 	{.compatible = "qcom,sm8250-sndcard"},
+	{.compatible = "qcom,qrb4210-rb2-sndcard"},
 	{.compatible = "qcom,qrb5165-rb5-sndcard"},
 	{}
 };
-- 
2.45.2

