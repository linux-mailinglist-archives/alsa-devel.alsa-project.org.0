Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 214786FC4E4
	for <lists+alsa-devel@lfdr.de>; Tue,  9 May 2023 13:23:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E5C0410F7;
	Tue,  9 May 2023 13:22:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E5C0410F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683631390;
	bh=88YiiUqEKKTmH38uO1QER5drZURWv+Fu2ro8M5Gm2mU=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=cBqxD56Cu4gDoh7WHXZvOH13VrHIYFgUJQw1bl0Jfnq1f2mmkzqkpOvHyIk68dDgS
	 sNGnzgLPFqnthUCeSKXT+esP4fITef4fpze8vI/gMnSslkhH3MdRAHv6fbIors2if/
	 32AE8zGGynH7gA+bzG5QHKBrIyBQ1+GujEsQwIiU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E7E87F8052E;
	Tue,  9 May 2023 13:22:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 16E87F8053B; Tue,  9 May 2023 13:22:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4EF82F8014C
	for <alsa-devel@alsa-project.org>; Tue,  9 May 2023 13:22:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4EF82F8014C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=DfaG1T1l
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3f315735514so203503345e9.1
        for <alsa-devel@alsa-project.org>;
 Tue, 09 May 2023 04:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683631325; x=1686223325;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HBudP5rOnhhCpY0h9bYPkm1GnbG8k9OEtCT5GE3EdaA=;
        b=DfaG1T1l1KlgdSKSXZ+X8UZyF1EVB0cHBhcl9jQ1yMe7AuEU9aDjZTa2OXJ6cY8aWN
         I/bKKUYlItLBeIV6oJ9e+JaSnJjNBFSkkU5qx4Rum8OZwBq19RPJvACxf2Xi7/UFHdhS
         Q2SsQl7Cov4jQKcI6l7fZwB0BKSQvymiVhK/AhcgAZR/8TM87rDpYfa3FquYtaDOAsNR
         9+DY/pS18VzuS6DKhAMpH7cuw4CgxddqheaTaw8VJhVNqJS93j8PZSw/LJQGDcA8AQa0
         E7dgA9XWeMqBXy+SvFWW2PUbFoRKW0v7oKH0tQLQnoq93nSS92ikD024ZQOgWuCXdDkP
         2v5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683631325; x=1686223325;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HBudP5rOnhhCpY0h9bYPkm1GnbG8k9OEtCT5GE3EdaA=;
        b=cswKFuT+y5MHIukVjzN8e3XQ6MeDdNu/3/fsDl+2PLrfSJ49p6fyXzEnuts1zwGEN2
         2d5LpaBpMZIryxzqu3I7yUJ0O0+XdSECPAtalLEVK8Da4RlT7oDi9HpRRe8FZDZ/0Boi
         zf5faftJsUP4FVfelMnAMnfWYxrngbXhoMaKZjRwjSeOt6C0Sa6XqTVmLWSjHHPIy7nm
         4pHqdf0QuiMHCM6l43lvs1+eOp75+aZgyliGmm/T/a9yVB6RC5Wnpa9FGZLtQ+xSj4NB
         uS/B36bpmWaoCA1yd3ED1W4A73odBLxcGbEuNU4eS2RTOnN6+J7jllRnNXeRSngoSt6c
         pO/w==
X-Gm-Message-State: AC+VfDyck4V0+HYsBj2SS+zLI1q+DiOlwuh2fWpmIBPildL5LysbZS8R
	IRRx3w5WgX52QBcdNvSV6nQn+Q==
X-Google-Smtp-Source: 
 ACHHUZ6GJkuQOpZ4Scsd3KJQ8/sS4Dwz1/NaJ7x0NlTyo+IDsaWquvuB0OflggMDFFKFispYEvIpOQ==
X-Received: by 2002:a05:600c:4444:b0:3f3:284d:8cec with SMTP id
 v4-20020a05600c444400b003f3284d8cecmr9792623wmn.2.1683631325626;
        Tue, 09 May 2023 04:22:05 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id
 n2-20020a05600c294200b003f17eded97bsm19531072wmd.19.2023.05.09.04.22.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 04:22:05 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 0/4] ASoC: qcom: add display port module support.
Date: Tue,  9 May 2023 12:21:58 +0100
Message-Id: <20230509112202.21471-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: N2H3PMJQVAUPDBL5DUBTTLIWDIN2G3QX
X-Message-ID-Hash: N2H3PMJQVAUPDBL5DUBTTLIWDIN2G3QX
X-MailFrom: srinivas.kandagatla@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: tiwai@suse.com, lgirdwood@gmail.com, ckeepax@opensource.cirrus.com,
 kuninori.morimoto.gx@renesas.com, linux-kernel@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/N2H3PMJQVAUPDBL5DUBTTLIWDIN2G3QX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patchset adds support to displayport on AudioReach.
Patches are tested on X13s with two display ports.

Srinivas Kandagatla (4):
  ASoC: qcom: q6dsp-common: move channel allocation to common
  ASoC: qcom: audioreach: add support for DISPLAY PORT SINK module
  ASoC: qcom: q6dsp: add support to more display ports
  ASoC: qcom: q6apm: add support to display ports in lpass dais

 .../sound/qcom,q6dsp-lpass-ports.h            |  8 ++
 sound/soc/qcom/qdsp6/audioreach.c             | 75 +++++++++++++++++++
 sound/soc/qcom/qdsp6/audioreach.h             | 12 +++
 sound/soc/qcom/qdsp6/q6afe-dai.c              | 34 ++-------
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c       | 39 ++++++++++
 sound/soc/qcom/qdsp6/q6dsp-common.c           | 35 +++++++++
 sound/soc/qcom/qdsp6/q6dsp-common.h           |  1 +
 sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c      | 43 +++++++----
 8 files changed, 204 insertions(+), 43 deletions(-)

-- 
2.21.0

