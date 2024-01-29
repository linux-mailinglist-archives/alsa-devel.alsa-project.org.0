Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CC711840442
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Jan 2024 12:53:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4C82384A;
	Mon, 29 Jan 2024 12:53:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4C82384A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706529224;
	bh=OEn344ksEcO/KPuz03HGzt0LbiDtkFUUnDPggKZSm1Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ufl1oC7xqPiU8dehzLe0BGXVOGCibvMzHLBBZly4Yy46NMj0P2b2C/z3TGmoW6LOQ
	 L+28vo6IsJWLoLdXiTK8znn6Ag5JG6MArWMNHv4hgsqgSWaU5p4O850DclUrpr4UmC
	 E9asuK/f8AWzRJah0yG1FjkbXQf4V1s0bFvSx/7w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8399FF80310; Mon, 29 Jan 2024 12:52:49 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 606ACF805DF;
	Mon, 29 Jan 2024 12:52:48 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B6D01F80580; Mon, 29 Jan 2024 12:52:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0B76AF8022B
	for <alsa-devel@alsa-project.org>; Mon, 29 Jan 2024 12:52:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B76AF8022B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=wAlGLTHd
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-55eed368b0bso1897561a12.0
        for <alsa-devel@alsa-project.org>;
 Mon, 29 Jan 2024 03:52:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706529144; x=1707133944;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nDGYECsDtIdBMjd3oPDwhe2eE52MgTh9xNyzExOhMAs=;
        b=wAlGLTHdGk4evLMQ0+aZwjHJE/htsEDkoZjKprhim7YyfCUlh5V7bJWGc//ZANzW/k
         ZtatDwGLzR+iTGD0KFc6OgqvpYYlv6RsbCLjHQXbLbAfI1kUCJcvWmJ4KVO1rvjb5Hvl
         aJC4VnEqVmUFx6J6/Sdoiv5brsc1QlWMw1Q9p+dDvDpI0RNyh2IlETmaO0vUGlhqZptg
         MVc5tgw+Kk+RI/MGQ4fpqvX5kVidZ7n/5oO9bhg8+Q8/3u0e6EVd6ame10CZm02ERzk+
         EJn2tAhYeeFEknH2Vmdh4elv75z1gLb4QBPBs66sP98LzdGvlxa2GC+qH2u+wvVWicXn
         S0iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706529144; x=1707133944;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nDGYECsDtIdBMjd3oPDwhe2eE52MgTh9xNyzExOhMAs=;
        b=El5pbN5WCGjOBBYj66LE0LlLqe4KHQ7OBjWCGJpAmjEMgIjNp4FHTWq1al4TrACL1l
         Dv8x7Yayp/Sl1W/gN0UOSqiif+oac4SWMvOypnQhKRisnzxN9RHYy59OVp918XfYeM1l
         +f2yZwkmrZV1dKO61Eg6sYWGXmGuXn1kSYM6fEFcui2acmPpOH673L5ZzUQPQZQ3qvli
         hrYKzqDUv8dcALqlgLd1gH/TCbEXU7NgXskSavTZGLAxOq2Q/Ot5mCnCLBmzGCk58lcU
         koc42y0eB0B7Ay5WXVUnYgPhT3WccL3KVv+4fZhE323hpTHfoc7f9VXRQvret9+OLgCA
         EdpQ==
X-Gm-Message-State: AOJu0Yy39aHK9CUC+uCEdl+z1kn56boAGVxpYTSqygz5wT8GMTtztAZX
	mUF4rYxdhas+dKw7zHKUrOeuNZgm/jeBCule110HDXSiLj3gcYob9aeIhJ3nM2k=
X-Google-Smtp-Source: 
 AGHT+IEQNLjhCr6Kx84OvaKLsougPYvC2/GgEyXcjNLbL1aCexWmd5xdUnkglSvejmamCtxIHbvojw==
X-Received: by 2002:a05:6402:2711:b0:55e:b30d:d845 with SMTP id
 y17-20020a056402271100b0055eb30dd845mr6121423edd.17.1706529144550;
        Mon, 29 Jan 2024 03:52:24 -0800 (PST)
Received: from krzk-bin.. ([178.197.222.62])
        by smtp.gmail.com with ESMTPSA id
 ec19-20020a0564020d5300b0055f29ececeasm19907edb.57.2024.01.29.03.52.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 03:52:23 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v6 2/6] cpufreq: do not open-code of_phandle_args_equal()
Date: Mon, 29 Jan 2024 12:52:12 +0100
Message-Id: <20240129115216.96479-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240129115216.96479-1-krzysztof.kozlowski@linaro.org>
References: <20240129115216.96479-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 3FG3EXGVF7C2Y7CE7EPBDYUGN6VE4H36
X-Message-ID-Hash: 3FG3EXGVF7C2Y7CE7EPBDYUGN6VE4H36
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3FG3EXGVF7C2Y7CE7EPBDYUGN6VE4H36/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Use newly added of_phandle_args_equal() helper to compare two
of_phandle_args.

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Depends on previous OF change.
---
 include/linux/cpufreq.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/include/linux/cpufreq.h b/include/linux/cpufreq.h
index afda5f24d3dd..3cd06dafb04b 100644
--- a/include/linux/cpufreq.h
+++ b/include/linux/cpufreq.h
@@ -1149,8 +1149,7 @@ static inline int of_perf_domain_get_sharing_cpumask(int pcpu, const char *list_
 		if (ret < 0)
 			continue;
 
-		if (pargs->np == args.np && pargs->args_count == args.args_count &&
-		    !memcmp(pargs->args, args.args, sizeof(args.args[0]) * args.args_count))
+		if (of_phandle_args_equal(pargs, &args))
 			cpumask_set_cpu(cpu, cpumask);
 
 		of_node_put(args.np);
-- 
2.34.1

