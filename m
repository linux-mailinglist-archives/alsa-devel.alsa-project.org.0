Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 473845AF1A7
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Sep 2022 19:05:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CED23164E;
	Tue,  6 Sep 2022 19:04:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CED23164E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662483934;
	bh=/vG0lMPU6uwOeAkgAJX75lRbsCOHoMS1l6Velm/uyo0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=T0whzM3R+vNhymlyG6RstBDGqrG8WCR1kKksPsGmt280tDE8GQ/q8YCpwk+ftIMre
	 PyglLb6yOWpdelgMqgis63RDj0iVabJfpnoZCnTC9gEfISEaiBaZ4uj0vZ3VaoRHS7
	 2Liy2RclYIWYWhduYt96z0CNEn4v8UE6DqXCtO4E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9DCEEF80579;
	Tue,  6 Sep 2022 19:02:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 30588F804AB; Tue,  6 Sep 2022 19:02:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C5CE7F800E9
 for <alsa-devel@alsa-project.org>; Tue,  6 Sep 2022 19:02:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5CE7F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="Cw/u+Ib0"
Received: by mail-wm1-x333.google.com with SMTP id s23so7222442wmj.4
 for <alsa-devel@alsa-project.org>; Tue, 06 Sep 2022 10:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=Vhz3YOEoDfv05lqGaP8UmdLTwYjd+5QppwEmBk1EAcM=;
 b=Cw/u+Ib0JZ0YzAj3X5FdCBPk2E4ie5smB3Wt7xeWbpnuXR9ErPd/TyXL9BBVMoEIYF
 kFsUuTbjg7+QCdSUPggmXh5MXquKC2FcGn1ZjgWhfaZ4XOAgXr+GHuexeSGUEr4gGIKf
 WfhKPUqLplhrakHPhWHFr6E9QhUHUC/CWv+qObc3fqGh/RZsjOvAw7U32+rGQpUk9YqU
 DibEcGnA+SCUsh7LCgEAKlnpIfNfRIpy5I5VCFBVUqB3phyqDrLYkkUAslGPU37iNE7U
 EY8u8kFObzhCeZP1s5bWs7Q+EvquPwASp3ZzD9mt7xPZL/8iDuLGjHVf7H6eFu+WuOX1
 NWcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=Vhz3YOEoDfv05lqGaP8UmdLTwYjd+5QppwEmBk1EAcM=;
 b=Zzyrm/JDb60l2cxfpj4xwK49pQvJN1ZH43xHkWHDnrsweECabtRjwqYu7N2a+Dzwgr
 ZsLXfq5fbSwkFS47/BllshZRQD/r3+W0LHng8aeC71OHB8jnxgxYmeiFDrJCOp/SdbI4
 TTFOyzs/W9QqZwS0EhRUYGI82C7Rj434YJAlZknp/QHIwx10/VVqw/uJCndnJRWH8jF5
 u/KebtVhbrmexiGkKRBf+e2dEInP1Cu1niyAl48q+4rj4pSrcPhClneL1cG1Z9sjFGig
 v++clxQ35fzg392UlJ3BYWNFMLmBgBrOT4N0vV6GPCqJKR8+6yAuB3O+AxcBc6T3tOs1
 KGTg==
X-Gm-Message-State: ACgBeo3SSMfsoww8GjBm8xRUttGseUsp1TXclNTbMwsOMdLabch1teCu
 3WFyFv0xkvg0g6jHuemggjLd5A==
X-Google-Smtp-Source: AA6agR6JE/Gba5AcnWcodsB3J2FW4DdI97OYm4rzmSyExCE4iEn0KvrutgOVo4Cv0b4Zfn+qpEw2Bw==
X-Received: by 2002:a7b:c453:0:b0:3a5:b42e:c4fb with SMTP id
 l19-20020a7bc453000000b003a5b42ec4fbmr14181612wmi.167.1662483735174; 
 Tue, 06 Sep 2022 10:02:15 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id
 x13-20020a1c7c0d000000b003a5ca627333sm21085967wmc.8.2022.09.06.10.02.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 10:02:14 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v2 08/12] ASoC: codecs: wsa-macro: add support for sm8450 and
 sc8280xp
Date: Tue,  6 Sep 2022 18:01:08 +0100
Message-Id: <20220906170112.1984-9-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20220906170112.1984-1-srinivas.kandagatla@linaro.org>
References: <20220906170112.1984-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
 tiwai@suse.com, lgirdwood@gmail.com, robh+dt@kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, bgoswami@quicinc.com,
 linux-kernel@vger.kernel.org
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

Add compatible for sm8450 and sc8280xp.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/lpass-wsa-macro.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index 130d25b334ff..5e0abefe7cce 100644
--- a/sound/soc/codecs/lpass-wsa-macro.c
+++ b/sound/soc/codecs/lpass-wsa-macro.c
@@ -2552,6 +2552,8 @@ static const struct dev_pm_ops wsa_macro_pm_ops = {
 static const struct of_device_id wsa_macro_dt_match[] = {
 	{.compatible = "qcom,sc7280-lpass-wsa-macro"},
 	{.compatible = "qcom,sm8250-lpass-wsa-macro"},
+	{.compatible = "qcom,sm8450-lpass-wsa-macro"},
+	{.compatible = "qcom,sc8280xp-lpass-wsa-macro" },
 	{}
 };
 MODULE_DEVICE_TABLE(of, wsa_macro_dt_match);
-- 
2.21.0

