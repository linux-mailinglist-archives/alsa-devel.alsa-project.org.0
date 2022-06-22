Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AFEBF555111
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jun 2022 18:15:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4F4F91EE8;
	Wed, 22 Jun 2022 18:14:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4F4F91EE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655914525;
	bh=7NGV8KZOuuNin7zoqHo7aB4afFYdz39R7FfAtvlNYg8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aV+EwSmF3Gf0Uj/g2jLPvlpDKjEBJ5VOkp7X+O0Eju+ScVMUPNDVycB56pUWn/wMK
	 UdyaKLjDeWHOsLCrr6XhUKCR/Fyaug9cBfELetgepDwe1zwZI69UR16nBuYC63BAm2
	 RuTypGX23p5s2IXBf1cmpBdaLdbPoHBsDc9eAMlg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D5960F804AC;
	Wed, 22 Jun 2022 18:14:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 93562F80424; Wed, 22 Jun 2022 18:14:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C3941F80100
 for <alsa-devel@alsa-project.org>; Wed, 22 Jun 2022 18:13:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C3941F80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="AdqVL1fn"
Received: by mail-ed1-x52b.google.com with SMTP id o9so15371426edt.12
 for <alsa-devel@alsa-project.org>; Wed, 22 Jun 2022 09:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zAlPejfAQCxvtnqb2e7esLuuwfx9+dbQueVecsqGTnM=;
 b=AdqVL1fn2Nch6BaslzUJtV1cx1jD3oDKzhYBdgH8XXPW7Xs/yUzclctxexMRz0ye4m
 T4+zMvA3dqhGFEjOGUt9HGdpRfluYH924o4KUB1E2cWq+dT54Ne3JHFOTX6SO6w+CZON
 AFuUf90TWAAUW8S5ikQSQGJOLKHpqK33JV3nGHGYQ6L99vxL1sm1tvNwI5C4SZH8hDoK
 Db+DsfftmTHV892LT4/7ELlpP81nPbF8nswVSGRlA+CYsHX2gLoNierd43ChQUymGQjU
 8TTSXbYUMUmsfdb9oPormsYfVOavoi+HSqm6J2YvwZhjY/dCf44ObHmrTFNQXSpNTp4u
 /Gjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zAlPejfAQCxvtnqb2e7esLuuwfx9+dbQueVecsqGTnM=;
 b=uIFDhh5SAtUR2NQ/OiAyKnHR9WtF13ViXfbHwE5vHxNS1jBYbyk8FAWBwID/ni5+DJ
 +wiL/+gZGlYN7owJAE+njAfcBKCQfJj/RZlvADGpYVi3hiExSYpsz112vopdk+Ee/C1r
 MJigO7amkcozfzroecJkhMkvPNPSOjzgGqu5rjMoYY1zOidzhVFc+HMmAC2h65s/140k
 RnBb3c+nHFqHk7MH4UuiF56VGBRcBGXCmm7zfe7J/bKSl0q+NGhF4QQtTGF97gCwsMkD
 DB1g532jMFgl1MILHvmFdCceH/Z3jWByI1f05QfdgKfVgo3NI7FJbWBSQr5mL8THEO8m
 RdFQ==
X-Gm-Message-State: AJIora/W4IiOp9Eu5e7UJbnln43md5fCBHLfJJn8zpoK9vdNsFxMd9XT
 PpqgSzoioGEyoPC8WKnCngM=
X-Google-Smtp-Source: AGRyM1tUeZKhkR6l8vLpmW0F9+thSOWMhMCzrTst6cJhHntejTBuoEAhk0TNhif3zETWLXT4QGdt1A==
X-Received: by 2002:a05:6402:2750:b0:435:ab9f:1235 with SMTP id
 z16-20020a056402275000b00435ab9f1235mr4972683edd.188.1655914435429; 
 Wed, 22 Jun 2022 09:13:55 -0700 (PDT)
Received: from localhost.localdomain ([185.107.95.225])
 by smtp.gmail.com with ESMTPSA id
 sd14-20020a1709076e0e00b007072dc80e06sm9576036ejc.190.2022.06.22.09.13.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jun 2022 09:13:55 -0700 (PDT)
From: Yassine Oudjana <yassine.oudjana@gmail.com>
X-Google-Original-From: Yassine Oudjana <y.oudjana@protonmail.com>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v2 1/3] ASoC: dt-bindings: Add bindings for WCD9335 DAIs
Date: Wed, 22 Jun 2022 20:13:20 +0400
Message-Id: <20220622161322.168017-2-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220622161322.168017-1-y.oudjana@protonmail.com>
References: <20220622161322.168017-1-y.oudjana@protonmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Yassine Oudjana <y.oudjana@protonmail.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Yassine Oudjana <yassine.oudjana@gmail.com>, phone-devel@vger.kernel.org
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

From: Yassine Oudjana <y.oudjana@protonmail.com>

Add bindings for the DAIs available in WCD9335 to avoid
having to use unclear number indices in device trees.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
Changes since v1:
 - Make header guard match path

 MAINTAINERS                              |  1 +
 include/dt-bindings/sound/qcom,wcd9335.h | 15 +++++++++++++++
 2 files changed, 16 insertions(+)
 create mode 100644 include/dt-bindings/sound/qcom,wcd9335.h

diff --git a/MAINTAINERS b/MAINTAINERS
index b774f21828f7..2bcc3cc129c5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16366,6 +16366,7 @@ M:	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
 M:	Banajit Goswami <bgoswami@quicinc.com>
 L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
 S:	Supported
+F:	include/dt-bindings/sound/qcom,wcd9335.h
 F:	sound/soc/codecs/lpass-va-macro.c
 F:	sound/soc/codecs/lpass-wsa-macro.*
 F:	sound/soc/codecs/msm8916-wcd-analog.c
diff --git a/include/dt-bindings/sound/qcom,wcd9335.h b/include/dt-bindings/sound/qcom,wcd9335.h
new file mode 100644
index 000000000000..f5e9f1db091e
--- /dev/null
+++ b/include/dt-bindings/sound/qcom,wcd9335.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+
+#ifndef __DT_SOUND_QCOM_WCD9335_H
+#define __DT_SOUND_QCOM_WCD9335_H
+
+#define AIF1_PB                 0
+#define AIF1_CAP                1
+#define AIF2_PB                 2
+#define AIF2_CAP                3
+#define AIF3_PB                 4
+#define AIF3_CAP                5
+#define AIF4_PB                 6
+#define NUM_CODEC_DAIS          7
+
+#endif
-- 
2.36.1

