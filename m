Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E1339740EB9
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Jun 2023 12:28:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 291D285D;
	Wed, 28 Jun 2023 12:27:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 291D285D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687948118;
	bh=WHsg/ee2Xw7InKPIR5DNO3PLCVZ52njnV1CU13j5Xic=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=V1l77NO2JLPBgnSlQrRj6B32vEEsvbLziVBatbWNEmUORLBbt3ntYMv76Qi4x4U71
	 I3eWkMeexPZzcWtCo2zJd2vreMqluXpP34HEdEP6VP2ZWcvUNluDflcS/SfsZyHg0o
	 4/fM2rIrZTLGf3zbkLO2GKfVkR8hA+FxqAuxfyWw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 17644F8057B; Wed, 28 Jun 2023 12:26:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2810FF80549;
	Wed, 28 Jun 2023 12:26:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2E495F8027B; Wed, 28 Jun 2023 12:26:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6B20AF80124
	for <alsa-devel@alsa-project.org>; Wed, 28 Jun 2023 12:26:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B20AF80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=kIrvu1fp
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-4fb7acaa7a5so4341716e87.1
        for <alsa-devel@alsa-project.org>;
 Wed, 28 Jun 2023 03:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687947998; x=1690539998;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LuHCd5iHQZEu3yLxK3H5002Fp9mhCHE1bYCUjxfT00w=;
        b=kIrvu1fp5N6kZkZzTu819ivlwe2RwOsvvRpr95K+WkF7h6uLaoxXcEFvbKFSfmnFWC
         3G2msJZnhQgaP8TEEotmbMaajTUUw85K5DP0npluG7rDEEcyFElDo8YLKLbWJYujvX8L
         0QA9udsFcOepH5hZ7Zp84DQR2rEU0XCk/6dOjNoYmGaCVDh179a2NG/AVmxx62eXjArA
         dSQHjhBHyxsStTn0TEzO80cAnCaowhhLQcjYyCiQLncSezOjxTBPUpy1F+TblUX+cEJ1
         KbJB61BXm5w7yFtxabaKTIX2YtLeSTuXz00Aeu25PnDs2iTZw9KfOdCHqPd2wa5C4oKW
         X3RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687947998; x=1690539998;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LuHCd5iHQZEu3yLxK3H5002Fp9mhCHE1bYCUjxfT00w=;
        b=akigfMP1GLsstN13ZwwboVk1MpA1aABDrD74tIaRpvkxJy15LYSHYGwFoQ8wZrjqJ4
         +DWm1ik4AW1NyXbGlR4sGGE+KukG4Bg9R8weZ4lqzW9IoM8EGuW5jqduCFKb13IeTAiF
         F3Clcg9o8W3pqK3U8Z1BdhXmx/9yPJA2vesGPK0C0jKXXEBZHJ2NgsAI2EaasvWkPH7r
         DObf3p42yP8iWi2mNY/X33Mz+6tnHucJMgEtu3dikqXOKF6wYcxmluv9MN8aTupKzyPm
         ZdBCBo8zg0mvvCEYzU7RP7b9JwjBvezxWz05vnYvwlG5izozhYkL6P1SwE1Bl11Y+LNe
         4rmw==
X-Gm-Message-State: AC+VfDwonSFAb8MynJxqeY8gsc9g58hUg1udYgeXSDgrfw3vN6aq9xo3
	500NeWNZWGz3tWAEjwYzw8VmnQ==
X-Google-Smtp-Source: 
 ACHHUZ4D7KP/WuAE/uTqzc8uPPDUFt3JfNe6/Y6fhu0gjx1LzcDjG70eVVOvxHFT+42JXA+dBchO4g==
X-Received: by 2002:a05:6512:2348:b0:4fb:76a5:2325 with SMTP id
 p8-20020a056512234800b004fb76a52325mr6782533lfu.24.1687947998165;
        Wed, 28 Jun 2023 03:26:38 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id
 a10-20020a5d53ca000000b003140555c0ddsm2467780wrw.56.2023.06.28.03.26.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jun 2023 03:26:37 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: krzysztof.kozlowski+dt@linaro.org,
	andersson@kernel.org,
	broonie@kernel.org
Cc: robh+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	dmitry.baryshkov@linaro.org,
	johan+linaro@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	lgirdwood@gmail.com,
	ckeepax@opensource.cirrus.com,
	kuninori.morimoto.gx@renesas.com,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	alsa-devel@alsa-project.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 1/3] ASoC: dt-bindings: q6apm: add firmware-name bindings
Date: Wed, 28 Jun 2023 11:26:19 +0100
Message-Id: <20230628102621.15016-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20230628102621.15016-1-srinivas.kandagatla@linaro.org>
References: <20230628102621.15016-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: Q2NGD5UBL42W537G3E25OFSH5TN5CT4K
X-Message-ID-Hash: Q2NGD5UBL42W537G3E25OFSH5TN5CT4K
X-MailFrom: srinivas.kandagatla@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Q2NGD5UBL42W537G3E25OFSH5TN5CT4K/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add bindings to get firmare-name from DT, this will provide more flexibility
to specify platform specific firmware file name and location. Also this brings
tplg firmware name inline with other board specific firmware locations.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 Documentation/devicetree/bindings/sound/qcom,q6apm.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,q6apm.yaml b/Documentation/devicetree/bindings/sound/qcom,q6apm.yaml
index ef1965aca254..c783451145ef 100644
--- a/Documentation/devicetree/bindings/sound/qcom,q6apm.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,q6apm.yaml
@@ -31,6 +31,10 @@ properties:
     unevaluatedProperties: false
     description: Qualcomm DSP audio ports
 
+  firmware-name:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: Audio Topology Firmware name
+
   '#sound-dai-cells':
     const: 0
 
@@ -38,6 +42,7 @@ required:
   - compatible
   - bedais
   - dais
+  - firmware-name
 
 unevaluatedProperties: false
 
-- 
2.21.0

