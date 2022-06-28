Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3497755C0D5
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Jun 2022 14:05:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 885111640;
	Tue, 28 Jun 2022 14:04:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 885111640
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656417947;
	bh=WEIkAPtqXNz+8lPAxtrOqMQJ6wNktkjqSA0Sm/E1LMU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=W2l3APuKeYvz46t+2x3MGJAuUejR3hZcjtytohkzF+KhKxSSCU8whVg9S4JkE2/aE
	 cGLS0zW5DQwL3d08srkg9mUYFTdOQRPO1PA9C7GuOb3vBLsMH0SGsWa0GHVk0mLv1C
	 TXIn/Dg/rRt6Fc7GoEL5oOSSvaErDxmLYKok7STo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EB53AF8049E;
	Tue, 28 Jun 2022 14:04:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 05484F8028B; Tue, 28 Jun 2022 14:04:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D47BEF80115
 for <alsa-devel@alsa-project.org>; Tue, 28 Jun 2022 14:04:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D47BEF80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="s9ZUAzTU"
Received: by mail-wr1-x42c.google.com with SMTP id q9so17362818wrd.8
 for <alsa-devel@alsa-project.org>; Tue, 28 Jun 2022 05:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LasQIcGj2EkLsI4F0d1EwxnNc/TKgEuzRf3skqrfIZI=;
 b=s9ZUAzTUyYk5hf+SfgKWwKzcXBR/n7WUsOu56nmGVfPOme6ObB4rAx5EDI0teyQsim
 bTRPXlG+MonKFrIT/qCb2cG/S3jl8xzYxDrFTfWWjNs6Oq5jVjzRCj0g4YXPE/M7rvFg
 5UF1NuVvcj0EBHiW3Q9W//a90cM43ElnlhSiKtYYjjtFdEj+7WvRJlkyZwvAn95G22sU
 IdnTvWAjWuW/Nr8gYdMJnHIqpxV//RkupCSS0mltfMYtSyHApM4lPS39NsVfZakD+rEw
 rcApGSPFXdYeViFJc5U3dxCo6R5GsqwQf8NRaYM74cs765+g0XNOmcxyiuIwm+LqLC7b
 QHYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LasQIcGj2EkLsI4F0d1EwxnNc/TKgEuzRf3skqrfIZI=;
 b=GjBchiWizSpRgPbZSp7brEf3W+3p8u/Hsfv37ehg/1leOGDW1ND8L7mYE5xZNFTazf
 QrMfAojFW8cTjdIu73VeNTxQJQ/H8AtSNPqaFjbh1AcWLgm8LOOFWzzgPI7VUfHQqtr4
 QVGeTiLIqJQVtTlwA3DrfmkEnJYheTxZiB8HTxf2IEamXqQqogJQdE9OJO3lDjfdthFs
 qpyPUhAAzNpMh51Q8lQw/t25Ja01/SIc7J0CtMPeZNVmW1LdqOBCVC+Csvb9HXA4RbQS
 Sa92y000T25po+DnihL8HXo+8M27cxKXM5OJIg88ir7hkBrS1nWmrJFiy3G4ggMd9cQ3
 CU3w==
X-Gm-Message-State: AJIora+wsnCJ8a9jIS0KD0SdSN4Sle3saPROrJgXAP8XEETOVfIR0Z/Z
 pyVdUQOChcHsU/sHRxPRPsqtjw==
X-Google-Smtp-Source: AGRyM1u0I+sAFnOLTEk6/euxVF6ALxxNfuRv+szBog+hZqVNgGNhJ5pEtFG6+4Vk5Wz6dm3cWezU8w==
X-Received: by 2002:a05:6000:ca:b0:21b:8082:7518 with SMTP id
 q10-20020a05600000ca00b0021b80827518mr16540229wrx.124.1656417878812; 
 Tue, 28 Jun 2022 05:04:38 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 p20-20020a1c7414000000b003a05621dc53sm1457737wmc.29.2022.06.28.05.04.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 05:04:38 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	bjorn.andersson@linaro.org
Subject: [PATCH v5 0/2] Fix apq8016 compat string
Date: Tue, 28 Jun 2022 13:04:33 +0100
Message-Id: <20220628120435.3044939-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, tiwai@suse.com, robh+dt@kernel.org,
 srinivas.kandagatla@linaro.org, bryan.odonoghue@linaro.org, krzk+dt@kernel.org
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

V5:
- Drops Fixes - Mark Brown
- Rebased on *   650516f1c1e0a - (asoc/for-next) Merge remote-tracking branch 'asoc/for-5.20' into asoc-next (2 hours ago)
  https://git.linaro.org/people/bryan.odonoghue/kernel.git/log/?h=8916-for-next
  
V4:
- Adds Bjorn's RB to first patch
- Adds missing people to To/Cc list

V3:
- Marks qcom,lpass-cpu-apq8016 as deprecated instead of removing - Bjorn

V2:
- Adds Reviewed-by: - Srini
- Adds Fixes - Srini

V1:
Reusing the apq8016 on msm8939 I found running checkpatch that the compat
string for the LPASS was throwing a warning.

This is easily fixed by alinging the YAML, DTS and driver to the documented
compat string

-			compatible = "qcom,lpass-cpu-apq8016";
+			compatible = "qcom,apq8016-lpass-cpu";

Bryan O'Donoghue (2):
  ASoC: qcom: lpass: Fix apq8016 compat string to match yaml
  arm64: dts: qcom: Fix apq8016 compat string to match yaml

 arch/arm64/boot/dts/qcom/msm8916.dtsi | 2 +-
 sound/soc/qcom/lpass-apq8016.c        | 1 +
 sound/soc/qcom/lpass-cpu.c            | 5 +++++
 3 files changed, 7 insertions(+), 1 deletion(-)

-- 
2.36.1

