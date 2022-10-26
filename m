Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F0960DF39
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Oct 2022 13:03:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E8C933F19;
	Wed, 26 Oct 2022 13:02:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E8C933F19
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666782202;
	bh=7zV1+7HO2dmqDK6pHpY9KK0AXFwO2u4U1sSugThh4+w=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fAnyhy9IFei2iddRma+kVm9+mS75MjURPS7YZUWEfhgDnvz8kyQqUwj4NbpMHgT8P
	 qXdVRTNmAns6YpTqg1Ia9gaDaEpMGqYP68zzcyMror6q4jtpyQ6U20dSeDRMYXLe08
	 UmWKi7/8uZmC1jJTBdz3x1bHkzdS+rkNW8Ma7y00=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3A413F803DC;
	Wed, 26 Oct 2022 13:02:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1FCC4F80100; Wed, 26 Oct 2022 13:02:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B003CF80100
 for <alsa-devel@alsa-project.org>; Wed, 26 Oct 2022 13:02:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B003CF80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="H1JTRzh/"
Received: by mail-wm1-x32b.google.com with SMTP id
 l16-20020a05600c4f1000b003c6c0d2a445so1255009wmq.4
 for <alsa-devel@alsa-project.org>; Wed, 26 Oct 2022 04:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=b0Xtwax/hQw5d4kEBGpw81Qb64TNz4VlkoBE9EnSw6Q=;
 b=H1JTRzh/+cqFTGYsUz3J4xpK2fL5tdimFZxJxHzXZgBXDlv9mUjzoxacA2Mx8gzWx3
 AWieO3BfftliDuDOti4BQUrtVr2YKSYvSjf6+CKzsyHNvSOM2VBXqHetY4d497lHmnRk
 y/1p687MiGW2FvFZ/96hpR7MOB/PZQwYLJfG5WkCc7mclkv832tQBTWLqAaN0mi+3+Jl
 eDvw0YjefHRtN/8+MmPGeE5klnBcBfH7W8F0kPapxvWehbDm5KmwR/u0iLrw3sUCqy21
 yFGbcK/KwhGaWEau+vKjAhhFkvZIBWzHqy8z4xXmrL9+GQITsNaX2XJjh+0MheK4+yLb
 qRrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=b0Xtwax/hQw5d4kEBGpw81Qb64TNz4VlkoBE9EnSw6Q=;
 b=vZ/AKLFO75e8mm4ySHR0rRzB7+ixzAnJWoUGkued15BfUWtEzDmxA/76FxVTRt7SWw
 OW5JBGHbUb/We0ZWR4prD105KvSKkEN8AEBfqcOFacSyHeF5NkS5bpK3vTfvUGoSYW2O
 SQZRx2SZt8/CiynkA+GoBH/gA+xngvD2cwUPl6EA+4P/LYdfmZjjU4U+5RS0sjYs8J5C
 PqoDJi3g3iSq90p8r2vYl8+yi5Kzp6Z9XrAXZTLqPRmi717bgT+HwvZCGwkkxRf0x9Ql
 soP/fGtCvDGSbQE63zy6c2t4B7+JP1FsJdWw6Zxf+P26mmzGbIaKcvCpmN2uUtsUatYN
 /8AQ==
X-Gm-Message-State: ACrzQf3kCj8gSRN7mwvzSz3UAQi0C3s0G8P0Jxcz1XT2lmHp/wFvHSuK
 H1xylMx0ffELIyUYiucp7iexAQ==
X-Google-Smtp-Source: AMsMyM4XDDQL21MzqtmKiCE7tMg6rgbbNYjeN8Myv8+4yCqDeA5g3zB9saxlZn0oY2W2pdUfsFOPZg==
X-Received: by 2002:a05:600c:3384:b0:3c6:f25a:96e9 with SMTP id
 o4-20020a05600c338400b003c6f25a96e9mr2039053wmp.112.1666782141702; 
 Wed, 26 Oct 2022 04:02:21 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
 by smtp.gmail.com with ESMTPSA id
 z7-20020a5d44c7000000b0023672104c24sm5237415wrr.74.2022.10.26.04.02.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Oct 2022 04:02:20 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: vkoul@kernel.org,
	yung-chuan.liao@linux.intel.com
Subject: [PATCH 0/6] soundwire: qcom: fixes and support for v1.7
Date: Wed, 26 Oct 2022 12:02:04 +0100
Message-Id: <20221026110210.6575-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, andersson@kernel.org,
 pierre-louis.bossart@linux.intel.com, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, srinivas.kandagatla@linaro.org,
 krzysztof.kozlowski+dt@linaro.org, sanyog.r.kale@intel.com
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

This patchset has 2 fixes around fifo handling adds support
for v1.7.0 controller found in SM8450 SoCs. Also a patch to
make reset optional for v1.6 as this is not required for sc8280xp.

Thanks,
Srini

Srinivas Kandagatla (6):
  soundwire: qcom: reinit broadcast completion
  soundwire: qcom: check for outanding writes before doing a read
  soundwire: qcom: remove unused SWRM_SPECIAL_CMD_ID
  soundwire: qcom: make reset optional for v1.6 controller
  dt-bindings: soundwire: qcom: add v1.7.0 support
  soundwire: qcom: add support for v1.7 Soundwire Controller

 .../bindings/soundwire/qcom,sdw.txt           |  1 +
 drivers/soundwire/qcom.c                      | 34 ++++++++++++++++---
 2 files changed, 30 insertions(+), 5 deletions(-)

-- 
2.21.0

