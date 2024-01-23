Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 413118390F8
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Jan 2024 15:14:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D1C447F4;
	Tue, 23 Jan 2024 15:14:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D1C447F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706019272;
	bh=GaifTXwjrtPwYGxIjA7saixKCJ2NePne3qXb4RkB2PA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tmxKdTWnKUNtfNd4e+Qs4KsD/5/WE3JgYGzrym8k2iF2yzvKQ952Uu6TkR3eBC7wo
	 XMAKejKFi/Cj7kPPTF/IqLYyZ01/zureI6c/YDl66tOXnx/b+KkRgi+e1dj86agfai
	 r36jMRN1pi58RWS/xAKEfD01PIipLj/0d+3rfXUw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 51FDEF805D4; Tue, 23 Jan 2024 15:13:54 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9D3B8F805BE;
	Tue, 23 Jan 2024 15:13:54 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E66D7F80494; Tue, 23 Jan 2024 15:13:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5BA1CF8025F
	for <alsa-devel@alsa-project.org>; Tue, 23 Jan 2024 15:13:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5BA1CF8025F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=uydqCbAt
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-33921b95dddso2126862f8f.1
        for <alsa-devel@alsa-project.org>;
 Tue, 23 Jan 2024 06:13:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706019218; x=1706624018;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bb9ozaaEJGm3+iYRaS/Eou91hz/HW8vlq47gXO46/QQ=;
        b=uydqCbAt4npHkXIhAZ6vS8UbYfqRumvsY2uqLGl5GZ/R9H9d83si9GSISmSmrHStqh
         jnbJ4qvrVb3HVzym/gE9Qsg4PDz5+6utt9nJnVTN7bFdd22o8GGEPLgiCmWMW9K6emDn
         sT7ecnK6d/w/QWtyJcpZUxd89XuKrOTO86KVh6Avl0nFIoBHD1fybbBqBLl98Qp3aqL3
         J1vxG2TzVkvpqmQJn+FNoIrtDJGC1m9taic+bvVY/v3Yl27e/0jNdJ+ischY4t2x205P
         voxb/1vPP6IKyAwSUEafygIF1BduKF2FOzuEePXRBzA0RbZpT3qaPwARN/PNFjlCg7Zk
         77Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706019218; x=1706624018;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bb9ozaaEJGm3+iYRaS/Eou91hz/HW8vlq47gXO46/QQ=;
        b=VpbiE/DWvyFsYYjXSVdSkXE1DA4zZDUOa5vN0h02onGdvtRPLIGWC0cXrL+wZUE9FF
         lfB3YCLfYwQzVIIhMPy5ikziYF4y8fap1aepqfcMF76iatF+S7mXC1NLNRY6zefOFBDc
         18SJUztPNCWOZupKUhdBds8yDgVRYYaCKCAhamHZkfz6TWHOxvyp0RvBrUQNurc+et1A
         XZoGP2DYYe/ee+dg5kwa+HQ5WEL4cIClY0waYV4Gnrt1AqIACjuW7bUBF1ecKBLpkk1H
         IPJKCEKXRdU1EZxnh2XEMbsIlWv5ijjrI8o+SLXkBxC2DkkYGY5WmqCuqE6sDdH9Wcz/
         RAyw==
X-Gm-Message-State: AOJu0YzsX/sVsxWM2FI6bamVjysjs2cmxxKnbY3iFBDz0Y1WLRdCcxWq
	nisXXQ924ZDH3pFoGsH0dm/CD7S+hQ/ot3ggBWd2Mqv2haWYsYSVosnYk1ESb0U=
X-Google-Smtp-Source: 
 AGHT+IGTxU9A6hZE3T/GfJ3iQs+U7hHMUT7YMZ5antPynbwk/2dJ9MwRblLpOb1YR4bjPYZyBsdj2g==
X-Received: by 2002:a5d:5602:0:b0:337:c097:db99 with SMTP id
 l2-20020a5d5602000000b00337c097db99mr3351685wrv.21.1706019218190;
        Tue, 23 Jan 2024 06:13:38 -0800 (PST)
Received: from krzk-bin.. ([178.197.215.66])
        by smtp.gmail.com with ESMTPSA id
 r8-20020adfe688000000b00337d97338b0sm12132298wrm.76.2024.01.23.06.13.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jan 2024 06:13:37 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
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
	linux-arm-msm@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 2/6] cpufreq: do not open-code of_phandle_args_equal()
Date: Tue, 23 Jan 2024 15:13:07 +0100
Message-Id: <20240123141311.220505-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240123141311.220505-1-krzysztof.kozlowski@linaro.org>
References: <20240123141311.220505-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: FSS3GTTHFAAAPHUSC7EJOYQI4WKJS27C
X-Message-ID-Hash: FSS3GTTHFAAAPHUSC7EJOYQI4WKJS27C
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FSS3GTTHFAAAPHUSC7EJOYQI4WKJS27C/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Use newly added of_phandle_args_equal() helper to compare two
of_phandle_args.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Depends on previous of change.
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

