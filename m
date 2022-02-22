Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0474BF970
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Feb 2022 14:30:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D9D1018BC;
	Tue, 22 Feb 2022 14:29:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D9D1018BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645536632;
	bh=NiImxqQ0MEmeWcMMoAiU5uibMmBveC3oskwoG65NmMo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=E07ZP8hsismpgQf3HKPrYADDhrHOB/e+s3gKaJJxKYRzko7lZS3pHCPzNLLhJo5n1
	 1do/+qquHBJfX5WSQFgvZCx/JfClew4IlT4YPZk3mUn9K3DlXDHb7GS5TdnmNj+1Cw
	 /GTsZqWDlKty+GBpH4KaGcz1fhxXyf37BJw0TeHU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 47D32F8051A;
	Tue, 22 Feb 2022 14:28:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C6066F801F5; Tue, 22 Feb 2022 14:28:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5594BF8012C
 for <alsa-devel@alsa-project.org>; Tue, 22 Feb 2022 14:28:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5594BF8012C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="l+jSuB5k"
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 3BE14407C6
 for <alsa-devel@alsa-project.org>; Tue, 22 Feb 2022 13:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1645536524;
 bh=6XeuQoqUzMUksn+ZuaBzNCPcuTk2LLoHTJkT0DsbDHY=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=l+jSuB5kQ1lmyW8rQz/DZ+VWC8Igl1AmWR1AMEFpj+kkXQh/BWl7WEUvUIug41P8c
 4iokWU//2k/s9MKrbVJWqyuc1GO7u0N7h9kJVI4+hF6Mcn+4ejsrLbxu4RPE3Pd22O
 +0Zi4aVNZzH1i7gfyViiXiSi5o0anowWH9xwWw/TL9M49aYH8WAu8N6NnEHDVHAn+c
 1CFraz2N6vPJIz55V12MqPgsghOvdwA7Fe2XctHy5Oliz8ab0wR8atBP4X5tpYeFlX
 TcfTYJPYL6affSA2qOoTAVCeDniCm56t1pVREpQCc1WJcFi8ie/bh98SpFbMljpGN+
 rqcSNZQtqI/Kg==
Received: by mail-ej1-f72.google.com with SMTP id
 sa7-20020a170906eda700b006d1b130d65bso1829561ejb.13
 for <alsa-devel@alsa-project.org>; Tue, 22 Feb 2022 05:28:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6XeuQoqUzMUksn+ZuaBzNCPcuTk2LLoHTJkT0DsbDHY=;
 b=med8jQC68NEPjpJSh2C6Zw1w3CFd8uWD8sKOCclMIro/GqTi7MVewsyq9LSvSAaen+
 /Sti4VCFExznHqkeQYM2RCCEuLSGrN17+ctTDGr9u53I1iplzOvBjDUrwiJsAgsEhNRg
 eE1Std0pNAwvWxBXNNVe93/e+AJpuY/+wIZ1iFZMPeS4+R6xj+YQK7eYLK+LalLDBlb2
 JO/5H6esU1TdcVwLz54/Vh2Lh/iGf2jLB/Ywz5TIejBLa4vN5vqPgcOoapDlz6yjKxP2
 ooMAUmB5FnIbRCzRAu/RRnR8f0SBTbxPMvonl+rWcrt5g1zh69kVAvjpjcy8vY9ef5Zr
 1ANQ==
X-Gm-Message-State: AOAM530my2D1mRqD8G3dsy7S+mSIyvZRnRSdHfmN0a4YvgMyBf+jLSx5
 86Y2/p2W/mmZTE74tJBGOL1ozKUmuf88kyXg7dD4QbkPcrcG/rnMHjdWi7DV6RxX0rdM2VB5ts/
 cHGyE425UgAMRINkEspOyRAPbNawQROR7CaT77o23
X-Received: by 2002:a17:906:1656:b0:6cf:571c:f91d with SMTP id
 n22-20020a170906165600b006cf571cf91dmr19602328ejd.377.1645536523431; 
 Tue, 22 Feb 2022 05:28:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJymWh8nTis0+whBJdlEUIaYxkLfPNPRZyT/AbiwgON8MIxb/gad15tlt22GRXjxl9FycTeAJw==
X-Received: by 2002:a17:906:1656:b0:6cf:571c:f91d with SMTP id
 n22-20020a170906165600b006cf571cf91dmr19602313ejd.377.1645536523213; 
 Tue, 22 Feb 2022 05:28:43 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-181-108.adslplus.ch.
 [188.155.181.108])
 by smtp.gmail.com with ESMTPSA id c5sm10029875edk.43.2022.02.22.05.28.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 05:28:42 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Abel Vesa <abel.vesa@nxp.com>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Andy Gross <agross@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org
Subject: [RFT PATCH 2/3] slimbus: qcom-ngd: fix kfree() of const memory on
 setting driver_override
Date: Tue, 22 Feb 2022 14:27:06 +0100
Message-Id: <20220222132707.266883-3-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220222132707.266883-1-krzysztof.kozlowski@canonical.com>
References: <20220222132707.266883-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: stable@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
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

The driver_override field from platform driver should not be initialized
from const memory because the core later kfree() it, for example when
driver_override is set via sysfs.

Fixes: 917809e2280b ("slimbus: ngd: Add qcom SLIMBus NGD driver")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/slimbus/qcom-ngd-ctrl.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
index 7040293c2ee8..5987d8f8a8fd 100644
--- a/drivers/slimbus/qcom-ngd-ctrl.c
+++ b/drivers/slimbus/qcom-ngd-ctrl.c
@@ -1455,7 +1455,14 @@ static int of_qcom_slim_ngd_register(struct device *parent,
 		}
 		ngd->id = id;
 		ngd->pdev->dev.parent = parent;
-		ngd->pdev->driver_override = QCOM_SLIM_NGD_DRV_NAME;
+		ngd->pdev->driver_override = kstrdup(QCOM_SLIM_NGD_DRV_NAME,
+						     GFP_KERNEL);
+		if (!ngd->pdev->driver_override) {
+			platform_device_put(ngd->pdev);
+			kfree(ngd);
+			of_node_put(node);
+			return -ENOMEM;
+		}
 		ngd->pdev->dev.of_node = node;
 		ctrl->ngd = ngd;
 
-- 
2.32.0

