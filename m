Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 494B1706E53
	for <lists+alsa-devel@lfdr.de>; Wed, 17 May 2023 18:38:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D84601F9;
	Wed, 17 May 2023 18:37:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D84601F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684341522;
	bh=BoCFQhNZ2GDvwBqx/Av64RreklkbMzUd4ypUNUhzSp8=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=D6t+CPoiONm3q0IKizRoH1fCwA29+l+Ij6ocOM1N7I/MnvLq9095vF3RVfFxJSWL0
	 0BQzaBjNAeliPrR8VkGleXmEGPbnubsSQpkhNzRxrI+Ova1r/cCP34cXQ1ODBLah49
	 zjJUostBwwO5Fn59zoShm1h90MRBBGmXuxpnmMlI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2CA14F80272; Wed, 17 May 2023 18:37:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 957A7F8025A;
	Wed, 17 May 2023 18:37:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DF59DF80272; Wed, 17 May 2023 18:37:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DB60FF8016D
	for <alsa-devel@alsa-project.org>; Wed, 17 May 2023 18:37:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DB60FF8016D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=K2OAfGcn
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-966400ee79aso183275366b.0
        for <alsa-devel@alsa-project.org>;
 Wed, 17 May 2023 09:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684341458; x=1686933458;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b954nCKecTYMejuBU5d05EyR3pjeZ5krgvkIBhNJrGA=;
        b=K2OAfGcnnNxTSK7pCXewhokszq4t+03nWW11pLL4ffsPmX5XRkTae0vlRk4qhgnWBu
         wYoCtcLaKftCu8MAdWIcNI9ohFnb9j2GbaEYPolML2LHrH6LIAPsaGeOSSKAMWo/tl22
         vpjZEOgsMusJqo17gVpK8pW26q+qMM7hB4zjI+W39IRbe9ckN+pqS7bxQYwUO/WJ0J60
         uk5RPLie9zCUALkMh71D3SMcPH0ltRvgDXfDGQ/vf/PztPbmSmQKR86JeipiW5DDDKKz
         DZJS5YJfyqnhKpcqVCB07Nq7/smeTzhFzRIVgqCzd16HV9E12+nId6MiULdmjMAQmm+8
         lJsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684341458; x=1686933458;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b954nCKecTYMejuBU5d05EyR3pjeZ5krgvkIBhNJrGA=;
        b=XI0fhPLgWAf99lBVZgcI+ZVGyleYNT/PNkRmGHpF0JUMRJJ/GKB1ThTSiEF7GeEq+M
         SPWpoKN0z32yLTQI6o90DL447Pj5OeQalKrHDLZ+AqyisINBGRDN/Kl3Uej4hyY3eph6
         Eirunz2QK6LjUBpBdbCYxZrYZ1UmGGCMQmUdI23I6WMIWnjeM/oO26PDh4uaoO/DGNWx
         VFogMEpEg4Ci93Po00UHBmaMYzPYlhJU/EbuXMgtfbXNxAByHRhthduXsDOvTGqluPzG
         ZHgYCBxeZQxrFvcZcGZM2J2VXojLlvTtuGtFy6RAqWfTdK5SqyeQjzBBd8qjUeDsl04c
         YT+g==
X-Gm-Message-State: AC+VfDzZIibyOM8eRw8XE/7bZaMwirDjl6ReO75ogsK3cvTMBQmBKMxi
	CYn3YlWu3a0SQM8EXv3CEyXZJw==
X-Google-Smtp-Source: 
 ACHHUZ7ziGMJ00VxXyHbYiSqOp0MCIv38v8NGDyit/yB2cFLQ4BKFhCVfAMvLnAe6r/h3PNlp7yQKg==
X-Received: by 2002:a17:907:3f28:b0:889:5686:486a with SMTP id
 hq40-20020a1709073f2800b008895686486amr41507100ejc.30.1684341458491;
        Wed, 17 May 2023 09:37:38 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:c9ff:4c84:dd21:568d])
        by smtp.gmail.com with ESMTPSA id
 n12-20020a1709065dac00b009663cf5dc2fsm12583152ejv.66.2023.05.17.09.37.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 May 2023 09:37:38 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Sanyog Kale <sanyog.r.kale@intel.com>,
	linux-arm-msm@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] soundwire: qcom: add proper error paths in
 qcom_swrm_startup()
Date: Wed, 17 May 2023 18:37:36 +0200
Message-Id: <20230517163736.997553-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: QILQYRIMKDJKEH5H6R4EWEWEQSMB7EBT
X-Message-ID-Hash: QILQYRIMKDJKEH5H6R4EWEWEQSMB7EBT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QILQYRIMKDJKEH5H6R4EWEWEQSMB7EBT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Reverse actions in qcom_swrm_startup() error paths to avoid leaking
stream memory and keeping runtime PM unbalanced.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/soundwire/qcom.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index f442280af9d3..baaa75320ae3 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -1208,8 +1208,10 @@ static int qcom_swrm_startup(struct snd_pcm_substream *substream,
 	}
 
 	sruntime = sdw_alloc_stream(dai->name);
-	if (!sruntime)
-		return -ENOMEM;
+	if (!sruntime) {
+		ret = -ENOMEM;
+		goto err_alloc;
+	}
 
 	ctrl->sruntime[dai->id] = sruntime;
 
@@ -1219,12 +1221,19 @@ static int qcom_swrm_startup(struct snd_pcm_substream *substream,
 		if (ret < 0 && ret != -ENOTSUPP) {
 			dev_err(dai->dev, "Failed to set sdw stream on %s\n",
 				codec_dai->name);
-			sdw_release_stream(sruntime);
-			return ret;
+			goto err_set_stream;
 		}
 	}
 
 	return 0;
+
+err_set_stream:
+	sdw_release_stream(sruntime);
+err_alloc:
+	pm_runtime_mark_last_busy(ctrl->dev);
+	pm_runtime_put_autosuspend(ctrl->dev);
+
+	return ret;
 }
 
 static void qcom_swrm_shutdown(struct snd_pcm_substream *substream,
-- 
2.34.1

