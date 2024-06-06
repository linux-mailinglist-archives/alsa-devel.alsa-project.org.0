Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A7F18FE7B9
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Jun 2024 15:28:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 89DD4DE5;
	Thu,  6 Jun 2024 15:28:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 89DD4DE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717680494;
	bh=5sqXMbgp87TUZS+KiEhVpCzUEdrJagyCA7cGsBXyg1E=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=cPnuGmA92SU2Tu6+ZeLi+Yo87QjaWrX799W3htKsFUGIychi+o8a8ifGLpdjE3s5N
	 GDG25nNp1OHyNkoeJ/qRxfIfls7XiymRyZTErCAYATwyTQx5g1zRLnPvP/1/fSdfhv
	 /3GtbfWA0KVVIkMFIwl2fM98U1sOJZY7aec1l7Y0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A8871F80588; Thu,  6 Jun 2024 15:27:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2958BF8058C;
	Thu,  6 Jun 2024 15:27:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 19F1BF804B2; Thu,  6 Jun 2024 15:27:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_SBL_CSS,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 32B51F80088
	for <alsa-devel@alsa-project.org>; Thu,  6 Jun 2024 15:27:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 32B51F80088
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=Ml+jGkaz
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-35e0eb3efd0so890833f8f.0
        for <alsa-devel@alsa-project.org>;
 Thu, 06 Jun 2024 06:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717680429; x=1718285229;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mgAcBiI1rApSk5wB4cicRls24AWPm1guQUgQIJo65g4=;
        b=Ml+jGkazxaIrowjsiej9EcMN0kJjwhfgt8hmaWBpGgxP3H24JlPEgO0dEwsQJm2Xno
         4ORIPu7PsUqy+zMbSGYIXOalgL6jzHjoX9OmEzfdRbz6MVMO7lmFiDeM5tFZiAY7PyRj
         8ZLqGCotnbRORFnXtdv8VnNFheiPUW3Fxl/tSgmR8bsJnxiXQ76A++BMwOrhzO5RfeOc
         RlnoPB9kxAthSQ1uS2uRGngQ8sbvTkgftDHFyNY5C2J+yC3LNRKEHvcJVZIaLnIaFoKX
         QhrWyVyUIYV2zFFSYTnErOgZgyKv3kZrF+bNM/M9CjLJdxOEiwy0TMyjyYSxKHs6zP/L
         ayJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717680429; x=1718285229;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mgAcBiI1rApSk5wB4cicRls24AWPm1guQUgQIJo65g4=;
        b=TyamJ8y1Ci3HUb+zYd9NxBMJ2S91sNU3P+P3ujJ6VjVoaMB5zFq9Qo1aexpRsXGbpq
         Zna0jU/gHYTSROxP/Fxoa2OoEBYvynI0tFBJ1bdVNxXJlCGXtPZSg+Lu76InzrsICJmC
         I8by0nukmLDQTtg+WWewhz30sh31UxVUuHV0j5mYBVcPoggda5dYDWIPGRUH2KOeNhWr
         JYy8i+Kf1El1Iz6JfxWasdytSbb0hsETAe8A5ZnSHiUYbxtjrI/xZjIe6byD38oX5C33
         wANyF/4yOhBbQTkr5IxEKtVRR7hu2h8AvG3Srq+L9XJzpzHFIlosIqnggcd3vfArnH1j
         YKdg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXE6AF6uK39Aum97y7uKJ/MNkNWwg8S/YuCurPE2SnoJyYuX83TvoUvpbpDhu3WNH/gmmBLu2qLJjw7z5AUj94T5emXQ+gzIYaw35Q=
X-Gm-Message-State: AOJu0YwnZfuX+Gpe+XbG+oexSVPA/cSk1a2tRa47roRZnKX4AMd+jSgl
	VwI1AWazXHowJufCdNJ/CO2fhAWzGmzA7D2Azaf8p5gyxO4w8KqILEqskgOxJmWyI8Dv0UUl8np
	/
X-Google-Smtp-Source: 
 AGHT+IFaryK3mjyXjlJVsWarwsyBufsRG+cV4YXwa/jhBl7EAaSNLS0WI69IAsI5o0+qgRxH3p06Mg==
X-Received: by 2002:adf:f1cb:0:b0:354:f489:fb8 with SMTP id
 ffacd0b85a97d-35e8405dda2mr3428133f8f.14.1717670967744;
        Thu, 06 Jun 2024 03:49:27 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35ef5e95bcesm1223185f8f.77.2024.06.06.03.49.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 03:49:27 -0700 (PDT)
From: srinivas.kandagatla@linaro.org
To: broonie@kernel.org
Cc: perex@perex.cz,
	lgirdwood@gmail.com,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	krzk+dt@kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v3 0/4] ASoC: qcom: display port changes
Date: Thu,  6 Jun 2024 11:49:18 +0100
Message-Id: <20240606104922.114229-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1359;
 i=srinivas.kandagatla@linaro.org; h=from:subject;
 bh=V+TPRmmiWc+mre/0sOEkQxm+yPOkfr5f+zVyqVvdeQQ=;
 b=owEBbQGS/pANAwAKAXqh/VnHNFU3AcsmYgBmYZQxJZ1iKUgJogCV+Vj1OVZWTYbfNSsPZeHqj
 UbTKjDERryJATMEAAEKAB0WIQQi509axvzi9vce3Y16of1ZxzRVNwUCZmGUMQAKCRB6of1ZxzRV
 N8LFB/9yID8KvMbyXNOsSi+iTJ0AUSAOp1J0CQrasOSgiS8RxV7/ndoMh2HjiVymFKV89NzNxP3
 0tPSoeFHkAX77byYhzBAPOx0MzpDer38eH6ht+fgcNvZB406HnrmuPBhZ2XQ6TSiIYp/s7utpSM
 VIhMETNIIFFI6SqHJe849vtnPDvMBfqnWVZoMUfcd7JYiahEh2WJBE6C+pABKrvBH1FntSxKvlK
 S486Pa8FD6vvv+VejeyfFRr7G2vQu8LwCUP4MwuB31uTvjfbFWAwApVlpNgYv4DxMGAnTBfPriV
 BrSrsAXuBhKePzVIc17Henlt02RrcUOrLRpxn+i5x37CmaTA
X-Developer-Key: i=srinivas.kandagatla@linaro.org; a=openpgp;
 fpr=ED6472765AB36EC43B3EF97AD77E3FC0562560D6
Content-Transfer-Encoding: 8bit
Message-ID-Hash: DR3I4RLFC6T3AEBFNURJPZDDN2J46ZIB
X-Message-ID-Hash: DR3I4RLFC6T3AEBFNURJPZDDN2J46ZIB
X-MailFrom: srinivas.kandagatla@linaro.org
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
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

This patchset adds support for.
	1. parse Display Port module tokens from ASoC topology
	2. add support to DP/HDMI Jack events.
	3. fixes a typo in function name in sm8250

Verified these patches on X13s along with changes to tplg in 
https://git.codelinaro.org/linaro/qcomlt/audioreach-topology/-/tree/topic/x13s-dp?ref_type=heads
and ucm changes from https://github.com/Srinivas-Kandagatla/alsa-ucm-conf/tree/topic/x13s-dp

x1e80100 is verified by Krzysztof with his changes in tplg 

https://git.codelinaro.org/linaro/qcomlt/audioreach-topology/-/merge_requests/7/commits

Thanks,
Srini

Changes since v2:
 - remove hdmi references.
 - added more DP jacks
 - added some comments in code
 - added x1e80100 patch to this series

Krzysztof Kozlowski (1):
  ASoC: qcom: x1e80100: Add USB DisplayPort plug support

Srinivas Kandagatla (3):
  ASoC: qcom: q6dsp: parse Display port tokens
  ASoC: qcom: common: add Display port Jack function
  ASoC: qcom: sc8280xp: add Display port Jack

 sound/soc/qcom/common.c         | 35 +++++++++++++++++++++++++++++++++
 sound/soc/qcom/common.h         |  3 +++
 sound/soc/qcom/qdsp6/topology.c | 26 ++++++++++++++++++++++++
 sound/soc/qcom/sc8280xp.c       | 15 ++++++++++++++
 sound/soc/qcom/x1e80100.c       | 20 +++++++++++++++++++
 5 files changed, 99 insertions(+)

-- 
2.43.0

