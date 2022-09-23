Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B2D5E7F36
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Sep 2022 18:00:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 67D0882C;
	Fri, 23 Sep 2022 17:59:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 67D0882C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663948809;
	bh=mCHXx38IstsDqAUs/xAPl6O4Pl7snAUXeESg7cqzA4I=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BPNYWgtFEl3K+cWag6AK522BEQdGuoq5CasfWAUueGKzxc2WnTEDgIZz2om+XxhWx
	 rzS4oWKm/tbsJcgc91v3sKBwjamOmXaz/DJA59IyzQGLZfd0DtzthzKKJZD6LP2+Af
	 tFspf8xb14XRc0rMeTWX8WQEKSblNWuoN9piqmZc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E630EF80558;
	Fri, 23 Sep 2022 17:58:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CCB4AF8054A; Fri, 23 Sep 2022 17:58:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7B87FF80224
 for <alsa-devel@alsa-project.org>; Fri, 23 Sep 2022 17:57:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B87FF80224
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="LUo2rWaB"
Received: by mail-lj1-x22b.google.com with SMTP id h3so586823lja.1
 for <alsa-devel@alsa-project.org>; Fri, 23 Sep 2022 08:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=VC1ShBinIqlUH1hwjZ0lvI11uSYreZCKq6nMNs4Lha8=;
 b=LUo2rWaB9RNZIuVN22URCpGUShqbj1RtLH4LDikewtvOqTAqfJXZ01/q3OA4cQFe2r
 rmUX/Io+HB42E1wsgx5NxXzKex2A/vixXIowzZLEWZjHCRloK5+O9EUhyfIX+/vNZb53
 lklZ7ezAUeV1hCBlHn6bRJlhOwCUNkLvsTB/O5c4RgPfhl9Y0upBqM2dhbvCDCtKrWzH
 GrDjXjpo6MnoBc6peM6sM28l5HVHBxTC4AwGz5i0xlIhVSIUOLfPgsr4IX3G6vgPqNG4
 U0BMxk37eVSn9j23UnDYMTdJjDhYnda4EXC0jnndchsujS//ZjuMAJ8d4SEL0PH5BalV
 LqqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=VC1ShBinIqlUH1hwjZ0lvI11uSYreZCKq6nMNs4Lha8=;
 b=Fno8glCGiYUWndc8IMbupo9lWMxzwZk+ZcqqP8Nmqz9l5O8/v/JxCpn5dXryipi8Bv
 XSxRLxKclryWsL69wyKgyma78oZ/Lh6wfkRqw1odSCvVKM2dXCKSSXJTP723XwQoAPbM
 +2noekhNgiTKbdU12QWYOd3fXyqnNUitwZnecOu8ruJZYiuNbS/+Bb1A1KASFsuRmb1C
 8iyazHGFi5FaftYyHAcZlAMi8RrA2iZRGP1BygKXgUPdy5ZTCsd6uUGANPIqQWuN7uy3
 dPzzS1/xnFQQT1o3rrl4PCJ0y8dhhLWc7/m7IilNOue5QM1i3XDZWNc4rmiC5u5UX0Op
 BkwA==
X-Gm-Message-State: ACrzQf2rOL1ED7hIXMO46ZtUgDNu9ZL00VPG1WEU7tU6OeCXykVdg70F
 D8+6DTs34F6cSu5d40gc5YPUag==
X-Google-Smtp-Source: AMsMyM7NzE8WlaF6baserwi0wmCOiMlgLtJ9FQsC9L9lPmRslOyURxlpjODRw+Jo6rE4joL576SKYA==
X-Received: by 2002:a2e:a9a9:0:b0:26c:6ec5:290 with SMTP id
 x41-20020a2ea9a9000000b0026c6ec50290mr2944124ljq.186.1663948669439; 
 Fri, 23 Sep 2022 08:57:49 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id
 be17-20020a056512251100b0049a4862966fsm1502286lfb.146.2022.09.23.08.57.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Sep 2022 08:57:49 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] slimbus: qcom-ctrl: use
 devm_platform_ioremap_resource_byname()
Date: Fri, 23 Sep 2022 17:57:38 +0200
Message-Id: <20220923155740.422411-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220923155740.422411-1-krzysztof.kozlowski@linaro.org>
References: <20220923155740.422411-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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

Simplify the code with devm_platform_ioremap_resource_byname().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/slimbus/qcom-ctrl.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/slimbus/qcom-ctrl.c b/drivers/slimbus/qcom-ctrl.c
index bb106eab8ae2..400b7b385a44 100644
--- a/drivers/slimbus/qcom-ctrl.c
+++ b/drivers/slimbus/qcom-ctrl.c
@@ -488,7 +488,6 @@ static int qcom_slim_probe(struct platform_device *pdev)
 {
 	struct qcom_slim_ctrl *ctrl;
 	struct slim_controller *sctrl;
-	struct resource *slim_mem;
 	int ret, ver;
 
 	ctrl = devm_kzalloc(&pdev->dev, sizeof(*ctrl), GFP_KERNEL);
@@ -519,8 +518,7 @@ static int qcom_slim_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, ctrl);
 	dev_set_drvdata(ctrl->dev, ctrl);
 
-	slim_mem = platform_get_resource_byname(pdev, IORESOURCE_MEM, "ctrl");
-	ctrl->base = devm_ioremap_resource(ctrl->dev, slim_mem);
+	ctrl->base = devm_platform_ioremap_resource_byname(pdev, "ctrl");
 	if (IS_ERR(ctrl->base))
 		return PTR_ERR(ctrl->base);
 
-- 
2.34.1

