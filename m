Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE188FE7BB
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Jun 2024 15:28:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 288E61D9;
	Thu,  6 Jun 2024 15:28:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 288E61D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717680514;
	bh=lI2Wr+WdCGDlmOKaaq/1DavWKIHY7PEWV8jOUjaMVnY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SB1SfdvaNUFNza+/7jcT7yi8l0mMuoFnfKhn2q7IAM/TJCz88lKIpxcmURVlKbiYY
	 8JIrOeFj/O3XuW1bW4NPGp2d1pU8UIs4+XBRgQaNRU82QKEIFIgpZUlSZEaksI2kAT
	 dxm5Ssr3DcZlKmg2hgGGyAaVEzrHHY8aRB/zA5xE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B7C55F805B3; Thu,  6 Jun 2024 15:27:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 05CA8F805C4;
	Thu,  6 Jun 2024 15:27:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 90C9AF804B2; Thu,  6 Jun 2024 15:27:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,RCVD_IN_SBL_CSS,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C0758F8001D
	for <alsa-devel@alsa-project.org>; Thu,  6 Jun 2024 15:27:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C0758F8001D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=lPTKzBHw
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-42147970772so6433845e9.0
        for <alsa-devel@alsa-project.org>;
 Thu, 06 Jun 2024 06:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717680456; x=1718285256;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PsLfgr3Xi6vscety5X2K0IsqtXVqaphhFy37TP99Jgk=;
        b=lPTKzBHwvFhOeiOdif5a10ChJpMo74QLX4GCqRdbSBeV7EGE6bBS4EDN39H88RAqTI
         qtv9pC49P42q6mcFIhe1wB22hLON9i/vj7XsHTok1C87ZN84NrfCDzwSINMO/02E2+C4
         828pR5b9Lgiwb/RyKtoNzpG2sL9u1ouqZBA4VdCncluARnWVeRw7kCzCxgUel9t2KU7i
         oGymKT2wnwbkgPoCg0G00MbQS2LMt2ixC4bRpElJyDeM/fRRnYe/41JbysM+zcjm/ha+
         aWlbYi2BpVvrHSpMbUaHuNUyB1FVA3HhpAMYE9CZcdvzdB7ISDvZx1DD39y0nBtfbZ7R
         inzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717680456; x=1718285256;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PsLfgr3Xi6vscety5X2K0IsqtXVqaphhFy37TP99Jgk=;
        b=tdWkjheW08sFG1FPat/mT+eiShSUr4Ne+MzGU0JCrTIUYscUM7JwTUcKvk99/dHA1V
         n286e1ojnjaLq9ze/0dHXmf6EcGGNsXdxeBDVN6iha4xMPAqsUTELjyZO6JIZJHc90TH
         syBMunCfEhkxQyoS6EZfdT4qbXxvwNTcGPIBqPGXtGyc17/gpZQFyLtoJ7Hy5/+6/40Z
         tK8zCbtFV83+l2MWw5IQpHXdEnWMq0Hd+NZ8T8EGwvKjQ6xMEOaPFzOclSPjmMKIzXvp
         Ev9ValcnPjXpJx+7AEDGjvKJY+WO23vvYSpg5mPlOHWxUKfNjfpIGwYmdb+UO+EYkNYY
         mDAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVRzDukb2TlD7nVWdo4I5mfs/b34DJPZQFL9tOqqpUHmdGZfpdY+HqMETdIpGQXGbGupqhM3dTQjW1ZyV6ilJ+44/qNYG+nQNtlv24=
X-Gm-Message-State: AOJu0YxApbUaZcpNpnzjJeqxXhQMUZ1oUajn3NsR5xdxRupuTDsJFJ7u
	Rcw1LBaqcH0kDM1uNtSs2CQhchjR/B8p+zOwzAnGyK9iUGw3CRE2MpJK2ZpOu5SDPsBnsjSWKqb
	g
X-Google-Smtp-Source: 
 AGHT+IGFWMaUquMnVfZp3UMZFdvZP9pMC5U96cQtmVXdFBaIGSzynEYzdADNTXephojkOl4Dp7zQiA==
X-Received: by 2002:adf:a1d5:0:b0:34c:f507:84b6 with SMTP id
 ffacd0b85a97d-35e8ef1b8dcmr4182580f8f.41.1717670970844;
        Thu, 06 Jun 2024 03:49:30 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35ef5e95bcesm1223185f8f.77.2024.06.06.03.49.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 03:49:29 -0700 (PDT)
From: srinivas.kandagatla@linaro.org
To: broonie@kernel.org
Cc: perex@perex.cz,
	lgirdwood@gmail.com,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	krzk+dt@kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v3 2/4] ASoC: qcom: common: add Display port Jack function
Date: Thu,  6 Jun 2024 11:49:20 +0100
Message-Id: <20240606104922.114229-3-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240606104922.114229-1-srinivas.kandagatla@linaro.org>
References: <20240606104922.114229-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2545;
 i=srinivas.kandagatla@linaro.org; h=from:subject;
 bh=0xU05ks6euG6v2ZrWI75v4FiGnhWGBYPQDcPdDGOsmw=;
 b=owEBbQGS/pANAwAKAXqh/VnHNFU3AcsmYgBmYZQxQDX4PXA+5exUK/ygVrKmwpjaWWHAxm69M
 qofEzm+QaGJATMEAAEKAB0WIQQi509axvzi9vce3Y16of1ZxzRVNwUCZmGUMQAKCRB6of1ZxzRV
 N0RUB/0UByxBo38zMz7xEXFAgYCc7m6SkHWnWqEk85cHJRTF4UvdMRTpdmKgawEmhSM3BBqWzZZ
 LilAuQ4/TlKP/M4j/ahCdkGDUUuUQVMC97IK+6DjhoA3+b8PyZgI1luoQWogoKF/mMNlSHV8DNO
 Dpl8ZgJicd4yE2jzNFslCg8uoOwIIZ4xsi1EIcNXN56Ep56U+Sk93mDSlHOExGpSm6xzfr/zmJx
 7hxjXz+I5bqk0N+WXKLvEZppv5NW29z+6NK5k3ONnR+h3MCx9oDjOv348ckD3kfXx++H0Km5azk
 QkITat4rhsNn7wpF9GLuuxubkjoNwPVoATee/bOo4f93KpND
X-Developer-Key: i=srinivas.kandagatla@linaro.org; a=openpgp;
 fpr=ED6472765AB36EC43B3EF97AD77E3FC0562560D6
Content-Transfer-Encoding: 8bit
Message-ID-Hash: MLTYHVRGGOR6ELJPGPZRU73OWD7VOO64
X-Message-ID-Hash: MLTYHVRGGOR6ELJPGPZRU73OWD7VOO64
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

Add a common function to add Display port jack.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/common.c | 35 +++++++++++++++++++++++++++++++++++
 sound/soc/qcom/common.h |  3 +++
 2 files changed, 38 insertions(+)

diff --git a/sound/soc/qcom/common.c b/sound/soc/qcom/common.c
index 3d02aa3844f2..56b4a3654aec 100644
--- a/sound/soc/qcom/common.c
+++ b/sound/soc/qcom/common.c
@@ -8,9 +8,19 @@
 #include <linux/input-event-codes.h>
 #include "common.h"
 
+#define NAME_SIZE	32
+
 static const struct snd_soc_dapm_widget qcom_jack_snd_widgets[] = {
 	SND_SOC_DAPM_HP("Headphone Jack", NULL),
 	SND_SOC_DAPM_MIC("Mic Jack", NULL),
+	SND_SOC_DAPM_SPK("DP0 Jack", NULL),
+	SND_SOC_DAPM_SPK("DP1 Jack", NULL),
+	SND_SOC_DAPM_SPK("DP2 Jack", NULL),
+	SND_SOC_DAPM_SPK("DP3 Jack", NULL),
+	SND_SOC_DAPM_SPK("DP4 Jack", NULL),
+	SND_SOC_DAPM_SPK("DP5 Jack", NULL),
+	SND_SOC_DAPM_SPK("DP6 Jack", NULL),
+	SND_SOC_DAPM_SPK("DP7 Jack", NULL),
 };
 
 int qcom_snd_parse_of(struct snd_soc_card *card)
@@ -240,5 +250,30 @@ int qcom_snd_wcd_jack_setup(struct snd_soc_pcm_runtime *rtd,
 }
 EXPORT_SYMBOL_GPL(qcom_snd_wcd_jack_setup);
 
+int qcom_snd_dp_jack_setup(struct snd_soc_pcm_runtime *rtd,
+			   struct snd_soc_jack *dp_jack, int dp_pcm_id)
+{
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
+	struct snd_soc_card *card = rtd->card;
+	char jack_name[NAME_SIZE];
+	int rval, i;
+
+	snprintf(jack_name, sizeof(jack_name), "DP%d Jack", dp_pcm_id);
+	rval = snd_soc_card_jack_new(card, jack_name, SND_JACK_AVOUT, dp_jack);
+	if (rval)
+		return rval;
+
+	for_each_rtd_codec_dais(rtd, i, codec_dai) {
+		rval = snd_soc_component_set_jack(codec_dai->component, dp_jack, NULL);
+		if (rval != 0 && rval != -ENOTSUPP) {
+			dev_warn(card->dev, "Failed to set jack: %d\n", rval);
+			return rval;
+		}
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(qcom_snd_dp_jack_setup);
+
 MODULE_DESCRIPTION("ASoC Qualcomm helper functions");
 MODULE_LICENSE("GPL");
diff --git a/sound/soc/qcom/common.h b/sound/soc/qcom/common.h
index d7f80ee5ae26..1b8d3f90bffa 100644
--- a/sound/soc/qcom/common.h
+++ b/sound/soc/qcom/common.h
@@ -9,5 +9,8 @@
 int qcom_snd_parse_of(struct snd_soc_card *card);
 int qcom_snd_wcd_jack_setup(struct snd_soc_pcm_runtime *rtd,
 			    struct snd_soc_jack *jack, bool *jack_setup);
+int qcom_snd_dp_jack_setup(struct snd_soc_pcm_runtime *rtd,
+			   struct snd_soc_jack *dp_jack, int id);
+
 
 #endif
-- 
2.43.0

