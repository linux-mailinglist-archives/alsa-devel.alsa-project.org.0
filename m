Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB3F5E7F34
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Sep 2022 17:59:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C0F6386E;
	Fri, 23 Sep 2022 17:58:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C0F6386E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663948785;
	bh=uMlxFBrBE+svxrBZO/C5NohXWLN9BPzCo4Rd4RJLgFw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=u3btYajQlyhUIzqDwQpSGIQaHijYu7igaRztGjCwbLIFOSHTItgZDXBIj0TrvTqNX
	 Je3QngW6tQHs6eWW0RokPH4/rJJkq9RK/UxpMLcrKO6QW1OVaCV1VbdgcPVMrdiN+f
	 l4+0t37aAETSc/onj91d4sSaSB/Z3GiOpI5JUpnM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5C6C5F80551;
	Fri, 23 Sep 2022 17:58:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 58940F80551; Fri, 23 Sep 2022 17:58:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 70338F80124
 for <alsa-devel@alsa-project.org>; Fri, 23 Sep 2022 17:57:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 70338F80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="DSFhUhEI"
Received: by mail-lf1-x136.google.com with SMTP id f9so994652lfr.3
 for <alsa-devel@alsa-project.org>; Fri, 23 Sep 2022 08:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=oMr0u4U4uB857JftbbkRJcLFLiEsse/bULU+XmmO99c=;
 b=DSFhUhEI5jIJ0l79fZ/RpiMJcCABCZt41//uZqQbhGP+SMHboZlWew64YaUL1Zt6N1
 WROtxtQ0pjiBJrz3Wwk+Z4gL6aQmsyhW2wZg/WwUBlp0wdev6ge4JNVSnEcEPt68091w
 cZGTSk4LWL3RB3uOZXbgOKMNCpVqIEBTwkJzSXYfiUAfKN96zhSkqOh2/hbanYKv6qYI
 kM5t9xA10/DXsmypKJulAM6TKIfLSMN67PwQ/1h6RDXckeoIKj4WEA+fnzbArU+kBCh1
 bQu6GcdEMfLxrIVD5Z1e3hxwW1meD2gZDnV8/5c3YFVQeKDDeWpq9kh4UORGoymDNHE3
 mSeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=oMr0u4U4uB857JftbbkRJcLFLiEsse/bULU+XmmO99c=;
 b=uL1UsfwUtWzSQu4PDOExsBFY9fkn3VXmEB2fcgz7OWqy/gQlpLs0FvT7/bxihIg4Wt
 pT0RNwj8bFYXYNPaEHiHFivedSXNqaG1OECCS8BnNrZJ5ofYUV9EobO93363m0OYKzK0
 YtRxhxKnQ5IWj7JsmA3Wuv7EDn2vpsO1AYOLM6SFmDxAKiehtVG6Meljvx0GuLMpvrcn
 zn0lCp8PXX6sjv1tGzSTlTS62gKFiblBThoLmTAXeWawvGCQ1KcTewWbwmDJ+GXHy+76
 UADVsv+az4rf0HeSG1rLpgmdHpk3nAUaJjTPdeMAmCgK1VdkaSpdu8qavFEJXbQQnTKi
 O5WA==
X-Gm-Message-State: ACrzQf1UjGQQMuinAdhlA9Yyn8Po363/k7xne3qBfz2ygwsIr0uLRi5y
 7FM7YdPImaX/VAXk4hfiqTzCNA==
X-Google-Smtp-Source: AMsMyM6SHmdPjbUQmqQLrTntDA+yJrodNrgqKTD0Yq6Gwj0hUWQkPwkCKVr0Q4Ko35CpEspD8KIpAw==
X-Received: by 2002:a05:6512:1590:b0:49a:9db4:5a31 with SMTP id
 bp16-20020a056512159000b0049a9db45a31mr3367232lfb.667.1663948671660; 
 Fri, 23 Sep 2022 08:57:51 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id
 be17-20020a056512251100b0049a4862966fsm1502286lfb.146.2022.09.23.08.57.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Sep 2022 08:57:50 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] slimbus: qcom-ngd-ctrl: reinit the reconf completion flag
Date: Fri, 23 Sep 2022 17:57:40 +0200
Message-Id: <20220923155740.422411-5-krzysztof.kozlowski@linaro.org>
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

Reinitialize the reconf completion flag when ngd registers are
not retainied or when enumeration is lost for ngd.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/slimbus/qcom-ngd-ctrl.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
index 548dd7661334..e8ebfcd0655c 100644
--- a/drivers/slimbus/qcom-ngd-ctrl.c
+++ b/drivers/slimbus/qcom-ngd-ctrl.c
@@ -1136,6 +1136,12 @@ static int qcom_slim_ngd_power_up(struct qcom_slim_ngd_ctrl *ctrl)
 		return 0;
 	}
 
+	/*
+	 * Reinitialize only when registers are not retained or when enumeration
+	 * is lost for ngd.
+	 */
+	reinit_completion(&ctrl->reconf);
+
 	writel_relaxed(DEF_NGD_INT_MASK, ngd->base + NGD_INT_EN);
 	rx_msgq = readl_relaxed(ngd->base + NGD_RX_MSGQ_CFG);
 
-- 
2.34.1

