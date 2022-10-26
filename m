Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B11660DF45
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Oct 2022 13:05:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E757D3F37;
	Wed, 26 Oct 2022 13:04:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E757D3F37
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666782305;
	bh=Zvsu/mTvQWVh2WxKwOd1mcR0uZ5LqJKABqgw005MUoQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cBlk2RL4fcJETMzvo3gXrr9f8QghAT5a6mlDDCjFwUclvW2WX9I6wZcUxafdsADPj
	 hd+0r0p00rE3HDtJC05Wb9PYqaokb7B6vfoJPmKfdpoP/QX83RMeNpyXLjUY01esYZ
	 wHzGY4T5gjGo0wdW2v2qxlJ7t3/2jN4HT8VCabks=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C9E6AF80578;
	Wed, 26 Oct 2022 13:02:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A35B4F80557; Wed, 26 Oct 2022 13:02:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A05CCF80240
 for <alsa-devel@alsa-project.org>; Wed, 26 Oct 2022 13:02:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A05CCF80240
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="VrUr1NCq"
Received: by mail-wm1-x335.google.com with SMTP id 5so2149062wmo.1
 for <alsa-devel@alsa-project.org>; Wed, 26 Oct 2022 04:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Icdth5bW06+FTiDoc6hzh4mTVqW0L169qAB+NpMSMiM=;
 b=VrUr1NCqQmWFyAAU8xzsnEdntA2wopK+LECDVycJpX4G8I9suVjN5U2pA/sRjdlQc2
 AjUMKsTseDp1cTKb1O1il6+2kxcppqLOqrhR2Ekv8lQ6m4TiO991UyalYak5OxK99zxg
 vmDbHoZcft+3vVRz0QmX4tZ+OC4vGw0x8naTY/mvyBGMcamwAWU6wF34wlFy9Hq43MBU
 /CoIuijMweor3KlcVb3yXz+0rM8lBIjOcuoFhvfeeBlxtllk7oO4x9IYtwfM/P9Wsg2O
 YpmcQwBpz/U/JByaWi/jllXHminB/nirn90SXxjbZyaeacCUzDKP/Ui1sT5WIDh/3icv
 KJFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Icdth5bW06+FTiDoc6hzh4mTVqW0L169qAB+NpMSMiM=;
 b=NNHG+5EmYp1hmJpwNyn/tukscsqcApXo3lqW8XPnUnFlXGpX1t86NiboLDJw6puoni
 tSj9YtkxB+aOb6Str+4aAbF5GTEN3BNv9FFCT6ww/2qXPULHV/O7JOsskpCC9s5mMG/K
 Hbllx/X0T+SKpKMZ5UJiqBCCe9usWC3yuPZIQodZYQjk650fusufNhb68yBmGcINYkSt
 o+pV+5JMAXecBCX7EdXMFSdBcg/ddLpCHGgUoFmilUTOU4VjlZp5cN4t6bZ7LMWx8jhu
 maRdaB6g5+ZC/2+MH0r4DopIfFDGtrgSfr70PU4X+IsMdRuCe35n/XswEWUn0zUspzpj
 rNRg==
X-Gm-Message-State: ACrzQf09lMMysK89qH9I6u1OPJM93Tm1ENRztSyNzaqiaZ8IYtC10xEo
 r3FylOaCZKL5YkVuUkvnD0iN+w==
X-Google-Smtp-Source: AMsMyM4q4OHE6RmbiZDYRwiXOXmCru6tDJV/srJq2vODKrrYg75XoI6m51lSA+DN0/3zGGraIQKS0A==
X-Received: by 2002:a05:600c:3d8a:b0:3c6:f241:cb36 with SMTP id
 bi10-20020a05600c3d8a00b003c6f241cb36mr1993088wmb.115.1666782145763; 
 Wed, 26 Oct 2022 04:02:25 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
 by smtp.gmail.com with ESMTPSA id
 z7-20020a5d44c7000000b0023672104c24sm5237415wrr.74.2022.10.26.04.02.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Oct 2022 04:02:25 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: vkoul@kernel.org,
	yung-chuan.liao@linux.intel.com
Subject: [PATCH 3/6] soundwire: qcom: remove unused SWRM_SPECIAL_CMD_ID
Date: Wed, 26 Oct 2022 12:02:07 +0100
Message-Id: <20221026110210.6575-4-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20221026110210.6575-1-srinivas.kandagatla@linaro.org>
References: <20221026110210.6575-1-srinivas.kandagatla@linaro.org>
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

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/soundwire/qcom.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index cee2b2223141..7bc8cd0e906b 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -104,7 +104,6 @@
 #define SWRM_REG_VAL_PACK(data, dev, id, reg)	\
 			((reg) | ((id) << 16) | ((dev) << 20) | ((data) << 24))
 
-#define SWRM_SPECIAL_CMD_ID	0xF
 #define MAX_FREQ_NUM		1
 #define TIMEOUT_MS		100
 #define QCOM_SWRM_MAX_RD_LEN	0x1
-- 
2.21.0

