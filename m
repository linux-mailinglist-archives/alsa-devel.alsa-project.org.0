Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC5B506B86
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Apr 2022 13:55:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 05C9B1833;
	Tue, 19 Apr 2022 13:54:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 05C9B1833
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650369345;
	bh=BntYJsFiZEQuAChheouZ3VBlD6q+h7ovx+qO4AI468M=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=LM9MD8fFCvBMoETIup0B6ZoCV3/IKW14yo53LYkeIC+jWXvk1aRZXI3BUdLiIggk+
	 NATNZ4YyQb12JB1lnsWCt5TLfkUrrh/cTfBHjY+08KVlDnkqIhqPREZUKavmsCHplR
	 C7TJlij5NzBcx22CjTUMYKHvtKGkyrg1Jeii3rwY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D90FF8053A;
	Tue, 19 Apr 2022 13:52:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0A769F8025D; Tue, 19 Apr 2022 13:37:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7781BF80121
 for <alsa-devel@alsa-project.org>; Tue, 19 Apr 2022 13:37:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7781BF80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="GVnV72rp"
Received: by mail-wr1-x42a.google.com with SMTP id w4so22012578wrg.12
 for <alsa-devel@alsa-project.org>; Tue, 19 Apr 2022 04:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YsXpwpMFkEWbaX+P0166EyFAvuhLI4rTochn4rlRCDQ=;
 b=GVnV72rpuwbtvHVuF0gB/cBwbTgGtRJQQFXx6StJTu+EKJFeYLIvIi93poEHUmX7wr
 G3fBn6lI5yFJmUrN2KLeIi817c8mpInsYOeqKeHD9tC4s9nkmxRtcwBH82LoiE1T6k96
 rf8fsXQasbLX8K6o2abfi2g5KhdehooBUlk1yQDHshSdRqaG9c0fSRqJGIqQhV3NCU9z
 6+XeQUSPFWk4qitsfRFHtIZasFpJmv671mUVjsc8XXC2mp8oYSDCXYuUXc6EGF5KGOOB
 thP2Dib756G1Wos40NUYqZI+8XkyGntQsWl0TM/MLoT0fB5A61p79VgyqaqdDOGr8I8w
 sRGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YsXpwpMFkEWbaX+P0166EyFAvuhLI4rTochn4rlRCDQ=;
 b=q9YzM1UgHWSvoObibDi7ipkqAXhRxYu+A9z+Ww/KYNkuJhmOi0oG1ATgeJTKIqaP7H
 poLY+y0UPGg+POiA2M208sNFSYVXtj7thscH8vwJWl/qvGP0ns3G0aK9cdLGXdQEO6sp
 gSHxlh95QU1ulZA973Zn9nAsj/WFQBpffDyBnrKZdhHbKtWa3My61kwCU4z4RxgAMVCX
 Mx+fdhlreCE/MD1M54i7gvPTYgsBQR6R2T688pYTfEz0teJ6GuNHjyRVvSQEI7Op0e1D
 A06JlNbSqe2kNhvtEDaQSk7sGPtXpTdDfrnYPiD+aZqk9TMOlr4osW1RSGQkympUCMIs
 /Mgw==
X-Gm-Message-State: AOAM532q76RHw47kYMqVAbA4iUpXq6XrLPNoyt9FmbCCN6j7k3SrhMU2
 iJw5LCjj5Vf4ZHwDM65e87Awcw==
X-Google-Smtp-Source: ABdhPJyOhd+4jL64KSjXkQiq4sKLkPooVSLEc7eV977FyvIoEP8FG8Mu53ptJcYVRsu1FFza2YQ//w==
X-Received: by 2002:a05:6000:794:b0:20a:93f8:5aa4 with SMTP id
 bu20-20020a056000079400b0020a93f85aa4mr7612741wrb.540.1650368256779; 
 Tue, 19 Apr 2022 04:37:36 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 bk1-20020a0560001d8100b002061d6bdfd0sm14202120wrb.63.2022.04.19.04.37.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 04:37:36 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: srinivas.kandagatla@linaro.org,
	robh+dt@kernel.org,
	krzk+dt@kernel.org
Subject: [PATCH v2 0/2] Fix apq8016 compat string
Date: Tue, 19 Apr 2022 12:37:32 +0100
Message-Id: <20220419113734.3138095-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 19 Apr 2022 13:52:22 +0200
Cc: linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 bryan.odonoghue@linaro.org, devicetree@vger.kernel.org
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
 sound/soc/qcom/lpass-apq8016.c        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.35.1

