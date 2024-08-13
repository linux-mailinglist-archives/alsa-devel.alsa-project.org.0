Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0713295065D
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Aug 2024 15:24:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 703C42366;
	Tue, 13 Aug 2024 15:23:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 703C42366
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723555448;
	bh=5E+ChMVkUDEea0MRqunugi3O9LwTWIxDP7/k4dm6sTk=;
	h=From:Subject:Date:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=GpcsBchtysh1KCaG5CFfJ0w+Yy88S6E+efXlkMFavqNQQ4k15T2IjB1DxK0IWxAQ4
	 0QlHwxBY+GMRu5HE+XrGbR6qGgTJfM02XBf/XCzMlsk6SDvLas+U/KaHjuefBfZsqB
	 pPmz7btPA70C+AELaNdRY/1W2Lg04Sj9WTZz7/28=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3AE07F805B6; Tue, 13 Aug 2024 15:23:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 82BDFF805AD;
	Tue, 13 Aug 2024 15:23:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 17798F8057A; Tue, 13 Aug 2024 15:10:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8CE10F800B0
	for <alsa-devel@alsa-project.org>; Tue, 13 Aug 2024 15:10:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8CE10F800B0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=KxP4CTDS
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-52efc60a6e6so7232783e87.1
        for <alsa-devel@alsa-project.org>;
 Tue, 13 Aug 2024 06:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723554601; x=1724159401;
 darn=alsa-project.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bfrR+V00LqrdU8oaNQWDLY7j0SlE+UnhvDANccxHlMY=;
        b=KxP4CTDSnm7OAU9WJrbBmQcbMrdmjGN3bqHjhEzL2SMP2eGbAxPmfpFG4aq3SnfpKr
         EG5cbNtS68Y02VQ3IOZaiRS+adOWTMEj1/CkzL9v7CFbLFoyTwCRyBOxrQcoKh0MVgXR
         S+7e03b8+e0dY2L0cQdBFW9cdh0DdG6eCe079CJXNI+ZojUvEe6UfoBELo73zj01tT6S
         yHoCvnw35mYOMQIWyJp0q3wMNHcXGf3EIc2motzORzqjsgx9QHIb6PM0kGIC1E+Ftf6Z
         Nm2i2Zmd4nSvkfnHHsOkYTz0Y6Jq81u8/aYF1ExZw5JBygF1z4nVi0XirIYQUCCrC8XZ
         nfIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723554601; x=1724159401;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bfrR+V00LqrdU8oaNQWDLY7j0SlE+UnhvDANccxHlMY=;
        b=IzQ7SWTXan6wumd0G9cIMzbcao/urGCpzAkCqIWAOGcNl5PVTgcu+FJDO9Zg7MRcAC
         BqZWxOyAYEi1PsDjKj1yn4VWbBpbkZeyL8Ssl3VNg4sE4Jx/0vQzc9vg8uuxIqJLRvhZ
         lNF38gLueYnnKhX/hfX3O474Mnaa+9JzoA1D2q6xUAxGphDJV4ANLtZCDgdwshdch5Lu
         b09k7vf7/G35ZuErEtAmRiiixohN/Ok2iIycmPZfgPkOECg5uwgND9RIlOAx7SgqtGUt
         MuNfQf9J2C6PQXOR/MIJf2Hb4ph981UMFIQswR302YP2cq+RqsOL05G/rGFDId59v6tY
         MNXg==
X-Gm-Message-State: AOJu0YzGamp36q0KbO1oTFTOqIlwdJPvOKOrNNgP7Sq9lYp3fXGLu8qM
	vgHbV7htK5HYptPrviEfiSnGGSIbAz2uSPOdlPI3sYLZduLb0uoQQS84uxOCn9Q=
X-Google-Smtp-Source: 
 AGHT+IE1crAZw0sd1g0PC/pporzYqVsn81Ipa640yGOTgge9CJpWJLRF2nhKkj54tIp4lvsEO3ucIQ==
X-Received: by 2002:a05:6512:2825:b0:52e:a63d:e5c1 with SMTP id
 2adb3069b0e04-5321365f4f7mr2561512e87.30.1723554600857;
        Tue, 13 Aug 2024 06:10:00 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36e4c938280sm10305003f8f.36.2024.08.13.06.09.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 06:09:58 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 0/6] soc: qcom: use scoped device node handling to simplify
 error paths
Date: Tue, 13 Aug 2024 15:09:46 +0200
Message-Id: 
 <20240813-b4-cleanup-h-of-node-put-other-v1-0-cfb67323a95c@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABpbu2YC/x3NQQqDMBBG4avIrB0wMaD1KuIixt9moCQh0VIQ7
 27o8tu8d1FBFhSamosyvlIkhgrVNuS8DW+wbNWkO226UfW8GnYf2HAm9hx3DnEDp/PgeHhkHvB
 yg9KjXWGoRlLGLr//YF7u+wH1Vj6vcAAAAA==
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1150;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=5E+ChMVkUDEea0MRqunugi3O9LwTWIxDP7/k4dm6sTk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmu1sclGeL25uWmbIh61eQ4X3RnuxqcZGjDLXB3
 LqJ5mrZvfyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZrtbHAAKCRDBN2bmhouD
 16+pD/47fOi4Su7/0hW8+e1B/SXwxMEUHtmgv+GLUzN1CmnNS/QcrC8KrYp+G96ySZPNuNk/kIa
 +2eA5mzV/VxnutkLZoCwWNeGQra2URSxXhEwyLk8ryozp8ZImTYUcMq1CYiHdTquTZM7P+VNsMh
 VxbklyPFpKhnKrRmWBvxjK6nrbebFi3FDsfPnLhG4lbmH2/lvWA12FjW5Q31NPTZs9+OqIQ5NR6
 w8SCQkIQ57yWzgsbV9xd3C7d9yCH8swDvfgwWT/cU5d3/1INR2JRkW6jRrtJFA/uI4SFAg2Cyaz
 BO2dG0swKABdmZWgGyp5esvG+pRMQ/rjWbeo91olCr0YjF9APSq7SJ9KqyWCPNJRsUtHYcf3S6s
 LC4kY9rJ4BQDsCC5VvF/nhT4LZ8zx/Yor67F+IgYrHNDP5wIoa3rG0eigEFNb7yHBXp7vm45Jnd
 ukpi7bP1oRejD7JGjcarcKbVrxsOSLrp9EhZutKl78GcHejuAHMDMShrjpdF7iJhdXvHo7m4Ic4
 FUhvuyDuzzgIu3ZCi0pklU/CsMg1e1aYib0cXn3giwQXo2nXtYw3jpk4SqKJ75HslFQRzqXWiig
 TZO9e8C1znDhMqac5yfBTh5XuS1WCtroC63NpYPaVOQk30DCG9WMKJ4ZOs333aGExyXs1akhGUn
 17wWXkpVs9CSxUg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: 3IE3IOGOOEO6EXMH3WKORAMJGBRQDX5P
X-Message-ID-Hash: 3IE3IOGOOEO6EXMH3WKORAMJGBRQDX5P
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3IE3IOGOOEO6EXMH3WKORAMJGBRQDX5P/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Use cleanup.h/scope on device nodes to get rid of of_node_put(). Code is
a bit simpler.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (6):
      soc: qcom: apr: simplify with scoped for each OF child loop
      soc: qcom: aoss: simplify with scoped for each OF child loop
      soc: qcom: ice: use scoped device node handling to simplify error paths
      soc: qcom: ocmem: use scoped device node handling to simplify error paths
      soc: qcom: pbs: use scoped device node handling to simplify error paths
      soc: qcom: smp2p: use scoped device node handling to simplify error paths

 drivers/soc/qcom/apr.c       |  5 +----
 drivers/soc/qcom/ice.c       | 14 +++++---------
 drivers/soc/qcom/ocmem.c     |  7 ++-----
 drivers/soc/qcom/qcom-pbs.c  | 16 ++++++----------
 drivers/soc/qcom/qcom_aoss.c |  8 +++-----
 drivers/soc/qcom/smp2p.c     | 16 ++++------------
 6 files changed, 21 insertions(+), 45 deletions(-)
---
base-commit: d54f33dafd9e93367ffaf95318ed371138a6c8c0
change-id: 20240813-b4-cleanup-h-of-node-put-other-7e9c7128abe4

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

