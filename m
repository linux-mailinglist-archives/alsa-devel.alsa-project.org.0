Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 15CA27FBFD0
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Nov 2023 17:57:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7666FDF0;
	Tue, 28 Nov 2023 17:57:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7666FDF0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701190649;
	bh=DqfnSw4vklvSS4rXBhCjqhMJwqfreLKnzMZXYmKdLS0=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=C5menT89XKbJx9pyHBerpZlbpIKuGhpV0NIZ1nWP9NxRCABCAl85Xvm5Vxb8pDVMd
	 E0L18F8T4T5a4rFctfw8n5HUVP/Zd9IYDiIyGJjjNpGdP+PM0dX+XXZ19bSIo+IBHb
	 80CnznAJbRc0y0AW+r51kuT5OeGcADNARPuYvm5c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6D099F80589; Tue, 28 Nov 2023 17:56:56 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 12F00F80246;
	Tue, 28 Nov 2023 17:56:56 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F4116F801D5; Tue, 28 Nov 2023 17:56:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 75484F80114
	for <alsa-devel@alsa-project.org>; Tue, 28 Nov 2023 17:56:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 75484F80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=JDx7A//H
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-50bc2e7f1e4so45176e87.1
        for <alsa-devel@alsa-project.org>;
 Tue, 28 Nov 2023 08:56:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701190606; x=1701795406;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KlvtVgcoH+Cr5quxDgXdgueDoRBrewPBnFO4wuUANns=;
        b=JDx7A//HB8o0MPKu8VVRSN/z8dwb13Cq5iJc0dqO+k8iBNQontjETSZEgrdQuf4Bsi
         bAJ189Vo0kTNOsYhQ5lby2Rke0HaZUlGXt6Yf+h3mjbPK5kPQEGLgleTH8QPZYy5iPr5
         qv7gE+IGyvYX7CMgRUVhQVn09Ff4lXL0P7b1rL3l2ZIzk+PMttlpA/jlo0qwznNl5ZQD
         UHrtAP6X027HR0ZEWPsWBSmzmV6i+3zAc68+5rQpRSAPz5aVgJk57xKS13aEOBZHn9Y+
         JhtTbu4NCeiAOc9ho+RdoC9wD9fu9d5Ix7yER5w/JN93cjJp89qyXWHUbpP9pt3oC7MI
         3FEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701190606; x=1701795406;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KlvtVgcoH+Cr5quxDgXdgueDoRBrewPBnFO4wuUANns=;
        b=C3jZBntJcpIU2WtznNLV0nEToGGk3Ew/LlAcUqLby04rSgPOrZXvZ4xn3ppz6xsdJr
         klZFKS7w94noTnTV992pz1Ktm+sOCPljRNynOyLPqcqr8Qw0PGKUT6Pf1CMwXK+DKNkz
         LKuNAH13TMZV9ZmO9hNQnhePYaf70bf2SeDAtAsYciZxBU2lFAFKKB32Dgy+WFfJLWA6
         YM6Fif7wU6CdTmea2XVMRh3tZlI7txU4QbFGEYYqsgC5KT0K/ZsjBHSOvt9YkA9D+LaT
         /zVWZmdJs7KvSJSJ/UfRZ61ZeXgd4e2KrkpWsBs21iFfdVF+fVM47p8nCviKXNezh102
         1+XQ==
X-Gm-Message-State: AOJu0YzcWe50c3drhcIa+bPIrZFOAIq7bfRY0izH6E+dJViPrldMWBqk
	3WYcBKv3mrBxqA7h1Qq7y2Ewsg==
X-Google-Smtp-Source: 
 AGHT+IF3hUBfKX//GdxpAzLW32DtoinveGYlCmLpmAQLjqtDChB2bMM64TERz8Kx5aYwPkRWwl/Ifw==
X-Received: by 2002:a05:6512:ea1:b0:50b:c102:a65d with SMTP id
 bi33-20020a0565120ea100b0050bc102a65dmr1112291lfb.9.1701190605996;
        Tue, 28 Nov 2023 08:56:45 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.109])
        by smtp.gmail.com with ESMTPSA id
 cw18-20020a170906c79200b009bf7a4d591csm7126252ejb.11.2023.11.28.08.56.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 08:56:45 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Sanyog Kale <sanyog.r.kale@intel.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-arm-msm@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] ASoC: qcom: Add helper for allocating Soundwire stream
 runtime
Date: Tue, 28 Nov 2023 17:56:37 +0100
Message-Id: <20231128165638.757665-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: INN7BCX5OM2L4FBTHFNT2BLQWYSICHZK
X-Message-ID-Hash: INN7BCX5OM2L4FBTHFNT2BLQWYSICHZK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/INN7BCX5OM2L4FBTHFNT2BLQWYSICHZK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Newer Qualcomm SoC soundcards will need to allocate Soundwire stream
runtime in their startup op.  The code will be exactly the same for all
soundcards, so add a helper for that.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/qcom/sdw.c | 45 +++++++++++++++++++++++++++++++++++++++++++-
 sound/soc/qcom/sdw.h |  1 +
 2 files changed, 45 insertions(+), 1 deletion(-)

diff --git a/sound/soc/qcom/sdw.c b/sound/soc/qcom/sdw.c
index dd275123d31d..77dbe0c28b29 100644
--- a/sound/soc/qcom/sdw.c
+++ b/sound/soc/qcom/sdw.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
-// Copyright (c) 2018, Linaro Limited.
+// Copyright (c) 2018-2023, Linaro Limited.
 // Copyright (c) 2018, The Linux Foundation. All rights reserved.
 
 #include <dt-bindings/sound/qcom,q6afe.h>
@@ -7,6 +7,49 @@
 #include <sound/soc.h>
 #include "sdw.h"
 
+/**
+ * qcom_snd_sdw_startup() - Helper to start Soundwire stream for SoC audio card
+ * @substream: The PCM substream from audio, as passed to snd_soc_ops->startup()
+ *
+ * Helper for the SoC audio card (snd_soc_ops->startup()) to allocate and set
+ * Soundwire stream runtime to each codec DAI.
+ *
+ * The shutdown() callback should call sdw_release_stream() on the same
+ * sdw_stream_runtime.
+ *
+ * Return: 0 or errno
+ */
+int qcom_snd_sdw_startup(struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	struct sdw_stream_runtime *sruntime;
+	struct snd_soc_dai *codec_dai;
+	int ret, i;
+
+	sruntime = sdw_alloc_stream(cpu_dai->name);
+	if (!sruntime)
+		return -ENOMEM;
+
+	for_each_rtd_codec_dais(rtd, i, codec_dai) {
+		ret = snd_soc_dai_set_stream(codec_dai, sruntime,
+					     substream->stream);
+		if (ret < 0 && ret != -ENOTSUPP) {
+			dev_err(rtd->dev, "Failed to set sdw stream on %s\n",
+				codec_dai->name);
+			goto err_set_stream;
+		}
+	}
+
+	return 0;
+
+err_set_stream:
+	sdw_release_stream(sruntime);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(qcom_snd_sdw_startup);
+
 int qcom_snd_sdw_prepare(struct snd_pcm_substream *substream,
 			 struct sdw_stream_runtime *sruntime,
 			 bool *stream_prepared)
diff --git a/sound/soc/qcom/sdw.h b/sound/soc/qcom/sdw.h
index d74cbb84da13..392e3455f1b1 100644
--- a/sound/soc/qcom/sdw.h
+++ b/sound/soc/qcom/sdw.h
@@ -6,6 +6,7 @@
 
 #include <linux/soundwire/sdw.h>
 
+int qcom_snd_sdw_startup(struct snd_pcm_substream *substream);
 int qcom_snd_sdw_prepare(struct snd_pcm_substream *substream,
 			 struct sdw_stream_runtime *runtime,
 			 bool *stream_prepared);
-- 
2.34.1

