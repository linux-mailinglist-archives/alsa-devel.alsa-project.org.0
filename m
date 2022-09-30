Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 051355F095D
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Sep 2022 12:54:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 20D321697;
	Fri, 30 Sep 2022 12:54:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 20D321697
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664535297;
	bh=C2lSQFse+mSPfUhAZhwv4yn6nORCZ/zK8EuIccYzPRY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=mF8HXiolp6HIulQLsT6Lg5dUra5NDmsmCyHSIPpOQWU2g/xvpm+tZ7MvEed2gmhUW
	 qRrb0px2xUWdmQKN+dXJX6WuafR2LIk5HKBnz8hKCBeSGlkd47pkuon755diLltm2E
	 BecFigFWXX5xPkMJ99UlEDuPj82FERFWIbDIj+D4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C141F80095;
	Fri, 30 Sep 2022 12:54:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 31242F80153; Fri, 30 Sep 2022 12:53:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E7AF9F800AA
 for <alsa-devel@alsa-project.org>; Fri, 30 Sep 2022 12:53:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E7AF9F800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="k8x5iPv4"
Received: by mail-wm1-x329.google.com with SMTP id
 n40-20020a05600c3ba800b003b49aefc35fso2047584wms.5
 for <alsa-devel@alsa-project.org>; Fri, 30 Sep 2022 03:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=O0OgJqiyZbyHgoVa58ck6r9CgJKpRkAVHS2RpaoIMr8=;
 b=k8x5iPv4ZY0jwFG1KZaZWMu4jPgXoEnV05IOaRGBPpc2JOMZWk+odlozwZuV9P73AV
 jqQAHgkfjMqrQcyD1eZm0Ib9rIvDs9i17KUVITVXcL5j9FWUAZ16JfyvOkzsz34s7k2r
 lqEghh+/5Z2HSUU9eqUJbFuoJ+87ru+LfWMbbdm6SjzAnR392wJtLBPYJ0Ay8BWqUBPy
 Cf3OOmwZ45jtCBZF1UbzR9gFQPjIf7ZpXEYXW/mya2gjUXirfIEXcyWKzuSFvJ+bbAMr
 dJ3RtExMx58eOSttLsyL11iJKVLFD2h3/4wXg0LTzZDbUPIrc0kfcQCazJZRuDvEcD3/
 sZ3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=O0OgJqiyZbyHgoVa58ck6r9CgJKpRkAVHS2RpaoIMr8=;
 b=3i/gYLhFDeQAiqpAkya46qSCLyb20qpP164sOKmh34QEo6ZQp+bdWvcRKJagKG5MD4
 5KCoBaxNiJk+/bJXK1iq57WY1VQPUzXrE8LvzGoMfndnK76uyXnTQnj6Hzj95j96obt3
 hDPeuhEckBXLiKA7lNuVFDSqdjGcbNp2YPe6OkkgqAVz0aFdPduDt7RwV07RnW3v1nTl
 cHeTri/aq5whKfU2O5U5xmxzQ8/uPM+AjRs1QwAs1kBoLV6D6IVtE18CX63PUzcD+7O/
 e62YO0aDw4W11c7wKCqlh7ZK12/Pwts3zgFRFu8N5qs0ImS0h0hs4h1sXDvCC+QLpT26
 KojQ==
X-Gm-Message-State: ACrzQf3lhBHJuWx22CNycc7wW16QeIudb1fqnF2GrQbt4RdowX8X9/j7
 8GIfJ83n0jOPe25YUgxSUibNWQ==
X-Google-Smtp-Source: AMsMyM7vKErwtHvUNHd6qph22gsXn98Eqq+GzNNYIK9sXZZITQLibWqMXx0wL3cR8R/VbS/WWX7EUQ==
X-Received: by 2002:a05:600c:1d89:b0:3b4:7554:defb with SMTP id
 p9-20020a05600c1d8900b003b47554defbmr5085710wms.21.1664535231079; 
 Fri, 30 Sep 2022 03:53:51 -0700 (PDT)
Received: from srini-hackbase.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id
 iv16-20020a05600c549000b003b4c40378casm7315090wmb.39.2022.09.30.03.53.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Sep 2022 03:53:50 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH] ASoC: qcom: fix unmet direct dependencies for SND_SOC_QDSP6
Date: Fri, 30 Sep 2022 11:53:47 +0100
Message-Id: <20220930105347.41127-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
 tiwai@suse.com, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
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

SND_SOC_QDSP6 already has COMPILE_TEST so remove that from
SND_SOC_SC8280XP and also add QCOM_APR dependencies to
SND_SOC_SC8280XP like other Qualcomm machine drivers.

This should also fix below warning:
on x86_64, when QCOM_APR is not set and COMPILE_TEST=y:

WARNING: unmet direct dependencies detected for SND_SOC_QDSP6
  Depends on [n]: SOUND [=y] && !UML && SND [=y] && SND_SOC [=y]
	&& SND_SOC_QCOM [=y] && QCOM_APR [=n] && COMMON_CLK [=y]
  Selected by [y]:
  - SND_SOC_SC8280XP [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y]
	&& SND_SOC_QCOM [=y] && (QCOM_APR [=n] || COMPILE_TEST [=y]) &&
	 SOUNDWIRE [=y] && COMMON_CLK [=y]

Fixes: 295aeea6646a ("ASoC: qcom: add machine driver for sc8280xp")
Reported-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/Kconfig | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/qcom/Kconfig b/sound/soc/qcom/Kconfig
index 1b0252ec4665..d0e59e07b1fc 100644
--- a/sound/soc/qcom/Kconfig
+++ b/sound/soc/qcom/Kconfig
@@ -175,8 +175,7 @@ config SND_SOC_SM8250
 
 config SND_SOC_SC8280XP
 	tristate "SoC Machine driver for SC8280XP boards"
-	depends on QCOM_APR || COMPILE_TEST
-	depends on SOUNDWIRE
+	depends on QCOM_APR && SOUNDWIRE
 	depends on COMMON_CLK
 	select SND_SOC_QDSP6
 	select SND_SOC_QCOM_COMMON
-- 
2.25.1

