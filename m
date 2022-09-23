Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EADF5E83C0
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Sep 2022 22:32:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EE697D8;
	Fri, 23 Sep 2022 22:31:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EE697D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663965170;
	bh=fXprxLt+dQqQf/OwzNndpAG2lIzyIfSSvCOYwBI28R4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=AfdeCR5DOCyIz6xHMaWSSbpUzW3mb5hPH5OTTuaxHOw8iNHLcU3qFE2QR5NBOk1eO
	 MXn8rSQfAxN5Qny13yI5pLef0iElxxEDwPy4grIbXQutCLtyHcNAtdoAdpfiW2s1kV
	 jZR3VMjOUOx+0sOJZ0GuJFGboYpacTxPytxebe18=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5264CF80431;
	Fri, 23 Sep 2022 22:31:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 470EEF801EC; Fri, 23 Sep 2022 22:31:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3AE76F801EC
 for <alsa-devel@alsa-project.org>; Fri, 23 Sep 2022 22:31:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3AE76F801EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="yDQbF8hk"
Received: by mail-lf1-x12a.google.com with SMTP id d42so2085171lfv.0
 for <alsa-devel@alsa-project.org>; Fri, 23 Sep 2022 13:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=2Z/dQnQWNXMTnmw/L26Lh+jcV1lMl/cNMW0PDsjS/vA=;
 b=yDQbF8hk4sRgjyOXMU57XTj4qyCqct7EFFBVrIcD6jQtO3UIhIsW4fBpaz2sZapp8s
 UpFaHqqx4x3GoOLF21Zx/SyJzNCohyfBSkzAkvXkxJYy6R5J79ejgnHeCBJYY0vAnoag
 xh6mNw1XxbRfzUHjnVZECddXmnIx5mDDJhwbirJQCVuzkLqRKhg1ERJ05d4//uLjbPYg
 KdtZB0XaGfrLR4ez7sqG4KLLomzl2mf0Ju6EfbZNlrYzd/0mfefgC1nZa5zcgmL+fBkW
 PDYx7kZOWKfyJrq0mpa9ZZh+PsWVCugES9Ni9UokGHX2qxEebT2gJAOJBcPMVC0xwVRU
 xAng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=2Z/dQnQWNXMTnmw/L26Lh+jcV1lMl/cNMW0PDsjS/vA=;
 b=RncnuZBdBWbiSad421wTKY8M7mYYFkb0whpWoIPx3j7CtSKBolHwU8HvvJ3g+5VcMg
 L6k59VnsVbKK6RwuojWJZpwY5dtdqkbirqXU/O+fZySOIuwYXXnxwBeYR5Azf8CfeJTs
 CegbP31pPmX5J2o/qPByTZBhvGnOoh8C3a5HUBNMifKSul6DhHzSyAhljHN2jdq7U92E
 UtthUtx6mSI3CytTCxh2utfSO1wAyW0Bsl12Uk+1n4gD+6WRENvrGhLeo1wFfAfTHvvv
 U3x+i6Z3mtZ7WOjPBmDBEZ2hw6WI2Mh+rUFUzdvqsjFPlnw33M0OBWtvHpBbZchqXO4M
 PTaQ==
X-Gm-Message-State: ACrzQf0sgSftkSAg+1D0SPxksiMunROUyeyetNdVvinTheE5X3V7P6US
 BOilUFLj83tfhphTdlrF1GnaHw4C1AFZdQ==
X-Google-Smtp-Source: AMsMyM6WxykWu2Kvn6f7MIZxYNvYLdIHBZyxPBKcDMdzsSBDHBRhhK3vUfnFG2TFoghp8cGLlco+bg==
X-Received: by 2002:ac2:4ecd:0:b0:49b:ecd4:2d1a with SMTP id
 p13-20020ac24ecd000000b0049becd42d1amr3744887lfr.528.1663965104186; 
 Fri, 23 Sep 2022 13:31:44 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id
 o18-20020a05651205d200b00497ad8e6d07sm1588164lfo.222.2022.09.23.13.31.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Sep 2022 13:31:43 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: [PATCH RESEND] ASoC: MAINTAINERS: add bindings and APR to Qualcomm
 Audio entry
Date: Fri, 23 Sep 2022 22:31:40 +0200
Message-Id: <20220923203140.514730-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>
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

Extend the Qualcomm Audio maintainer entry to include sound related
bindings and the Qualcomm APR/GPR (Asynchronous/Generic Packet Router)
IPC driver, which is tightly related to the Audio DSP.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Bjorn Andersson <andersson@kernel.org>

---

Resend because it seems I forget to Cc Mark.
---
 MAINTAINERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0350effebe8f..453dc6fd0b80 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16710,6 +16710,9 @@ M:	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
 M:	Banajit Goswami <bgoswami@quicinc.com>
 L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
 S:	Supported
+F:	Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml
+F:	Documentation/devicetree/bindings/sound/qcom,*
+F:	drivers/soc/qcom/apr.c
 F:	include/dt-bindings/sound/qcom,wcd9335.h
 F:	sound/soc/codecs/lpass-rx-macro.*
 F:	sound/soc/codecs/lpass-tx-macro.*
-- 
2.34.1

