Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DEE0706E54
	for <lists+alsa-devel@lfdr.de>; Wed, 17 May 2023 18:39:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9056D208;
	Wed, 17 May 2023 18:38:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9056D208
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684341555;
	bh=me7LBEGWFnkBS4ogNjpQ9f3NZ4arOfElsGsldoI8nV0=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=dJrRqpH/ATSXKIQY5R0vz7AM/P1FCjzuMdFs3mOFCt+abRR6UJS4ZJLKGMGezy2q3
	 wa55DqrBkgrJVMecQmkmfYLx1DgjflNZWVWNOrmm3QbZ/APZpnPelh7BLBAbGTE2N7
	 f89evr7esUc8+kVmAmGywt+T4s2jM5v7gBJjM3s8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DAC69F8056F; Wed, 17 May 2023 18:38:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 44624F8055B;
	Wed, 17 May 2023 18:38:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 33262F80563; Wed, 17 May 2023 18:37:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 91FC0F80557
	for <alsa-devel@alsa-project.org>; Wed, 17 May 2023 18:37:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 91FC0F80557
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=NXGPRAWs
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-510d6e1f1b2so1435210a12.3
        for <alsa-devel@alsa-project.org>;
 Wed, 17 May 2023 09:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684341472; x=1686933472;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MQiqGo5OUgc8PM0tlImiY0vOLzMFeyySbnhueagWXW0=;
        b=NXGPRAWs7s+I++k10tlcbvOI3I26C+3zPmAV8+Ii6IBAIZGrOqSEHs9TpiATmbJVQY
         wNIyuJT5G9+qjb0uK6o8T9yStT9hnn6GqXmbk3dtCSlLa1MSqMdGdmbMB+rXMLjwsWUi
         N4+dB/aMHw41SUns7RwI8JV9/UM04Ngc2wMinIfkBALWhMd3RN0Tz2kxJKvUzT2MfHWI
         V9VY5IEE52Yx7L3y1NSZeW0Iwo2dpfK1hqAcdCRdt1PTg8FaaLu5s/LFopYobeAvHRN2
         8PpB1ehRVTtak9Nk6zR6w4idv3tNj4Rs2AdWZLZ7lbAVhasdkQ+149i5pXA1g8TL6HWW
         2IZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684341472; x=1686933472;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MQiqGo5OUgc8PM0tlImiY0vOLzMFeyySbnhueagWXW0=;
        b=KPg1sp72ush19V2hC+tURTsZWagots5HKVZST86jT1qwPa080Qkp4wTPgcDoszbn2R
         TpTU5ZuK1e6RtXvGRocCqpgReEbWQmzbRGXYB0oJQqAL/gHk9JMDppx9gCv/2Nld070d
         tU/pUQVloT+Qvge77DPAbG8lhd/9YpX23b3PEudEN6h7+h89Ibu//P9N2/K3GdjQ9I2/
         rIWkHi3pGKP/M6KQnJJ3zcCfCZL06YTcrE52Q6nssFWatAeANMTC+KNG5vEcHmLt+oJa
         caVz1lsZAHaIFh7I5KHtswqluXI//ae63hr1u7YS/eeVxUzPdk5/wn1Lp2xwsMDOziXN
         cPQA==
X-Gm-Message-State: AC+VfDwbndYKtNKFZaeLl0tjpEuaJyAMTcK4BU/cb0qMZWOTqUmoFW+W
	9WOf4WJ2sZTbBrpcsCuZLAfVQA==
X-Google-Smtp-Source: 
 ACHHUZ7TeznMBsED643PVkhPKMMGoVADv50a5B4xzD8GPaFmb2nuvThzh6qhr7nSyeCgJ2/pnlVyPA==
X-Received: by 2002:aa7:c0c3:0:b0:50b:cff8:ff1f with SMTP id
 j3-20020aa7c0c3000000b0050bcff8ff1fmr2388143edp.42.1684341472511;
        Wed, 17 May 2023 09:37:52 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:c9ff:4c84:dd21:568d])
        by smtp.gmail.com with ESMTPSA id
 t21-20020aa7d715000000b0050bc041d2a8sm9284827edq.15.2023.05.17.09.37.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 May 2023 09:37:52 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Sanyog Kale <sanyog.r.kale@intel.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] soundwire: qcom: fix unbalanced pm_runtime_put()
Date: Wed, 17 May 2023 18:37:49 +0200
Message-Id: <20230517163750.997629-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: RGUZ2POYMFDNFI2PULWKR3HBD4O5IRF2
X-Message-ID-Hash: RGUZ2POYMFDNFI2PULWKR3HBD4O5IRF2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RGUZ2POYMFDNFI2PULWKR3HBD4O5IRF2/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This reverts commit 57ed510b0547 ("soundwire: qcom: use
pm_runtime_resume_and_get()") which introduced unbalanced
pm_runtime_put(), when device did not have runtime PM enabled.

If pm_runtime_resume_and_get() failed with -EACCES, the driver continued
execution and finally called pm_runtime_put_autosuspend().  Since
pm_runtime_resume_and_get() drops the usage counter on every error, this
lead to double decrement of that counter visible in certain debugfs
actions on unattached devices (still in reset state):

  $ cat /sys/kernel/debug/soundwire/master-0-0/sdw:0:0217:f001:00:0/registers
  qcom-soundwire 3210000.soundwire-controller: swrm_wait_for_wr_fifo_avail err write overflow
  soundwire sdw-master-0: trf on Slave 1 failed:-5 read addr e36 count 1
  soundwire sdw:0:0217:f001:00:0: Runtime PM usage count underflow!

Fixes: 57ed510b0547 ("soundwire: qcom: use pm_runtime_resume_and_get()")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/soundwire/qcom.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index aad5942e5980..f442280af9d3 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -614,11 +614,12 @@ static irqreturn_t qcom_swrm_wake_irq_handler(int irq, void *dev_id)
 	struct qcom_swrm_ctrl *ctrl = dev_id;
 	int ret;
 
-	ret = pm_runtime_resume_and_get(ctrl->dev);
+	ret = pm_runtime_get_sync(ctrl->dev);
 	if (ret < 0 && ret != -EACCES) {
 		dev_err_ratelimited(ctrl->dev,
-				    "pm_runtime_resume_and_get failed in %s, ret %d\n",
+				    "pm_runtime_get_sync failed in %s, ret %d\n",
 				    __func__, ret);
+		pm_runtime_put_noidle(ctrl->dev);
 		return ret;
 	}
 
@@ -1197,11 +1198,12 @@ static int qcom_swrm_startup(struct snd_pcm_substream *substream,
 	struct snd_soc_dai *codec_dai;
 	int ret, i;
 
-	ret = pm_runtime_resume_and_get(ctrl->dev);
+	ret = pm_runtime_get_sync(ctrl->dev);
 	if (ret < 0 && ret != -EACCES) {
 		dev_err_ratelimited(ctrl->dev,
-				    "pm_runtime_resume_and_get failed in %s, ret %d\n",
+				    "pm_runtime_get_sync failed in %s, ret %d\n",
 				    __func__, ret);
+		pm_runtime_put_noidle(ctrl->dev);
 		return ret;
 	}
 
@@ -1402,11 +1404,12 @@ static int swrm_reg_show(struct seq_file *s_file, void *data)
 	struct qcom_swrm_ctrl *ctrl = s_file->private;
 	int reg, reg_val, ret;
 
-	ret = pm_runtime_resume_and_get(ctrl->dev);
+	ret = pm_runtime_get_sync(ctrl->dev);
 	if (ret < 0 && ret != -EACCES) {
 		dev_err_ratelimited(ctrl->dev,
-				    "pm_runtime_resume_and_get failed in %s, ret %d\n",
+				    "pm_runtime_get_sync failed in %s, ret %d\n",
 				    __func__, ret);
+		pm_runtime_put_noidle(ctrl->dev);
 		return ret;
 	}
 
-- 
2.34.1

