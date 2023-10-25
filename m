Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA797D6F9F
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Oct 2023 16:47:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 232E4825;
	Wed, 25 Oct 2023 16:46:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 232E4825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698245232;
	bh=nk8PnZvkM9dgf3oYiDp64P9nCqznqBo67f2J3QR0P6g=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=MDznbHNxuvkKJKcaeVrCyCq46wgSF3DU+bS9CO6L54WPuy8gE/YOPaohiOTQs3zHh
	 s01GbEE2YqRzTM4RSPmcVSLMdUVKTpDPkQRHYNcTcEwWZQQQq9OzkELc2Q7TCFw2zn
	 xlqRZ8gYm3UdYi7grEbC8rKnSoDoGolU6575Jwfs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 55ACEF8012B; Wed, 25 Oct 2023 16:46:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 99AC9F80152;
	Wed, 25 Oct 2023 16:46:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2987DF8019B; Wed, 25 Oct 2023 16:46:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 42CF4F8012B
	for <alsa-devel@alsa-project.org>; Wed, 25 Oct 2023 16:46:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42CF4F8012B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=fRa6sDXT
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-507d1cc0538so8314047e87.2
        for <alsa-devel@alsa-project.org>;
 Wed, 25 Oct 2023 07:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698245168; x=1698849968;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7fCndReggPj8sG1syb2HDBs4AgKt0DkohlqpGAodX1o=;
        b=fRa6sDXTug7f7QjpzfSk5+B0TXDfg5SG5COL2Vv9CV9sCFS0yL4X27vnEImhvzEUVD
         7x0jAmARD1liV/eoNEMRrzGUMHug23xkWjHAuIC9FpPxzQ1YzCkLjtr+JBV9nbXDCI4i
         5A/t/pIHcHQNqRXJSEqRE4dNtahuTAedHbPzhceIWtKfElrDnWOXTw5ItFkVprlpw3Xh
         fTw5nT9ss2+bXJ2EF/BS6Q4h73O+opeuhzrL1WriC33WzE75saWrH+7xuTDilZBzvSF/
         OQwQT2AhjYYyGplBxcfd8EZGdSFj74pgKQyA1mbJW3xqFq+KBBToo6ieMJ3W8sXzkY5O
         MmhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698245168; x=1698849968;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7fCndReggPj8sG1syb2HDBs4AgKt0DkohlqpGAodX1o=;
        b=CH1ihASnaJxUQD00mL+M6kzCLXmwCVkFeD5uRzCJk1J3eSRigMpJwbo0zbOUUuj3rH
         NUgKLSaRmy7RBydxMFnYHkEX6w00kYKGbo/SJNzMElmxKS2nYIeoFrRd0CSD7I7I84g9
         qLNuoyKXPIKr1/wjx8hJsg0F8cVBQCyaZbhT3AmwN62WZrIBedlFC6KVDpUGM0TLubGf
         77dfnzICkZElqLs8MMLy89v2wNLPNnnmNjW2u24Ipv/8D0RhBhkA313K9L79ea2vA0nW
         wOyPtw/tL9Sq6Kq43h0bQcFsCqO/edpHhEUk4V3sC9YB4hkzoqtBwgOJbQ591Ldn2yPp
         3KnQ==
X-Gm-Message-State: AOJu0Yx0zad9/gMOCFIqvQhI2/n6q6lytj19uDfeM0K0n0nwFMhvV/4Q
	2Ab0YtGKG80RiOY8NqpKKlvzLw==
X-Google-Smtp-Source: 
 AGHT+IFNwe40aLcfWcgRqBNwoh4xuwRuxRmryBZCAYASICKbNwYeSIEIxBm3Mc2QFFfX2zJNfG3p9w==
X-Received: by 2002:a19:7419:0:b0:4fd:c715:5667 with SMTP id
 v25-20020a197419000000b004fdc7155667mr10143878lfe.20.1698245168251;
        Wed, 25 Oct 2023 07:46:08 -0700 (PDT)
Received: from krzk-bin.. ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id
 i1-20020a05600011c100b0032dcb08bf94sm12267138wrx.60.2023.10.25.07.46.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 07:46:07 -0700 (PDT)
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
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/3] soundwire: qcom: drop unneeded DAI .set_stream callback
Date: Wed, 25 Oct 2023 16:45:59 +0200
Message-Id: <20231025144601.268645-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 2F5PIXPHSX7DAVN3HNJM6BFKW6TZEFXK
X-Message-ID-Hash: 2F5PIXPHSX7DAVN3HNJM6BFKW6TZEFXK
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2F5PIXPHSX7DAVN3HNJM6BFKW6TZEFXK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Qualcomm Soundwire controller drivers do not support multi-link setups,
so DAI .set_stream() callback will not be used.  What's more, if called
it will overwrite the sdw_stream_runtime runtime set in DAI .startup
(qcom_swrm_startup()) causing issues (unsupported multi-link error) when
two Soundwire controllers are passed as codec DAIs.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/soundwire/qcom.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index f1b8d6ac5140..fe65c26c5281 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -1267,16 +1267,6 @@ static int qcom_swrm_hw_free(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static int qcom_swrm_set_sdw_stream(struct snd_soc_dai *dai,
-				    void *stream, int direction)
-{
-	struct qcom_swrm_ctrl *ctrl = dev_get_drvdata(dai->dev);
-
-	ctrl->sruntime[dai->id] = stream;
-
-	return 0;
-}
-
 static void *qcom_swrm_get_sdw_stream(struct snd_soc_dai *dai, int direction)
 {
 	struct qcom_swrm_ctrl *ctrl = dev_get_drvdata(dai->dev);
@@ -1349,7 +1339,6 @@ static const struct snd_soc_dai_ops qcom_swrm_pdm_dai_ops = {
 	.hw_free = qcom_swrm_hw_free,
 	.startup = qcom_swrm_startup,
 	.shutdown = qcom_swrm_shutdown,
-	.set_stream = qcom_swrm_set_sdw_stream,
 	.get_stream = qcom_swrm_get_sdw_stream,
 };
 
-- 
2.34.1

