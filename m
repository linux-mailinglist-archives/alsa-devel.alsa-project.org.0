Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E78545EDD99
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Sep 2022 15:21:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E048868;
	Wed, 28 Sep 2022 15:20:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E048868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664371288;
	bh=tjtIlxCixKFKS9qmF3U56b6na2PrSXJfgLZOHLv1yKw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hN1xGDuH1aK62zCVkqSgRpaUMTfPjha0oH+dI2xeQssITWMs5vrsoLT7ykAmeGZZs
	 9PhzqX5dqcQHBJ07v9EfPLxnKkVHEp7NDvEBwdir3kSsPv6VKbCXBKrPfhNfjEG4zU
	 H8g2m2gKzaAt+cUGtV5sqeD/jHPTB20eD41si1R4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B4D27F80272;
	Wed, 28 Sep 2022 15:20:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 84431F804B3; Wed, 28 Sep 2022 15:20:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 47A39F8011C
 for <alsa-devel@alsa-project.org>; Wed, 28 Sep 2022 15:20:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 47A39F8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="fOYSihQM"
Received: by mail-lf1-x12b.google.com with SMTP id bu25so18446911lfb.3
 for <alsa-devel@alsa-project.org>; Wed, 28 Sep 2022 06:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=U36NjhsAwog7/X0GNMxs2kFxhhnbeKSocGnUpytYWXI=;
 b=fOYSihQMzyuZDyv4JUnGdl/v+/+kIk2FAZPwNqiSy2uDxtAaQzoYXK8MbFTp9pJyvt
 p/sBRodRkv7xYW58vhqAkdZUkP02VVZjJ8QzNhhxfWBXrG3kBMtGQkaE+vI+lYjd3gSV
 B/a5PqZPVllsDJwdAcv89FE88sFQc8VXV0DGMAwdiMm3L80vyHUDn/aadd4xAJoxAdJr
 EPjNLMDaaRm1wDdy+PC/zVY0FtzOHZKuX/UksYVHjKBH0r52ZBifs4DCviYmRG6Fq0NO
 97CCzK56A3Si7MgXcyGHP613wwSCQfYVtkVUk23zD40sc77RAbRlIYcYTssZOUIbQYEA
 woCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=U36NjhsAwog7/X0GNMxs2kFxhhnbeKSocGnUpytYWXI=;
 b=lYNxPs7LW8Slzl1jDHQfWbl4qP0Y4ozMyN/4UW3Hk2ILok92JcLNkGvAdVKURQEFXM
 EMMxG9eTn2z9F+N4HU+rleI9rQo4oOToN8OjNu/M00P+9+EPN0TtNjw6yuQmsbGz/QMT
 V8ekk1vvGB+IyvOgblFYYeYg8qFUXM+3UfUMkuFrXL1t7tFGDdJI2F71eQyUNr41vuK9
 HRtDqVWngZOUAL/fYHgqd3s15UVy5U4yhB1rrP4h8Suc847vwVwSCMoed0qI4f7C6Bh0
 Ih0fU8OX9fa+fckY3KwwUTNBWhBibvs3VykLVuFnwo5YlnKj6gLCqh6EmKahFmkOHAK4
 CbeQ==
X-Gm-Message-State: ACrzQf3TMo8DC/Oc7xCO3RuGIQaN0pR6Jto1ZOt+5jE4/zlLPruIRqdC
 ekDjQHYcpbvrhFXaJ8GNkxgEWQ==
X-Google-Smtp-Source: AMsMyM7MhlrItXEwdt3Vv00VMHy5nJueDqpMgvsGytSWYaxV1mPq5Uux6Ggg9crZH7sLVRMRe8mroQ==
X-Received: by 2002:a05:6512:3052:b0:49e:fcb2:c1e9 with SMTP id
 b18-20020a056512305200b0049efcb2c1e9mr12355824lfb.260.1664371220823; 
 Wed, 28 Sep 2022 06:20:20 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id
 p11-20020ac246cb000000b00497ad9ae486sm478484lfo.62.2022.09.28.06.20.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Sep 2022 06:20:20 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] slimbus: qcom-ngd-ctrl: drop PM runtime counter on
 transfer error paths
Date: Wed, 28 Sep 2022 15:20:11 +0200
Message-Id: <20220928132011.455347-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220928132011.455347-1-krzysztof.kozlowski@linaro.org>
References: <20220928132011.455347-1-krzysztof.kozlowski@linaro.org>
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

If transfer in qcom_slim_ngd_xfer_msg_sync() fails, we need to drop the
PM runtime usage counter to have it balanced.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/slimbus/qcom-ngd-ctrl.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
index ba36eb5c0de3..ac84fdc2822f 100644
--- a/drivers/slimbus/qcom-ngd-ctrl.c
+++ b/drivers/slimbus/qcom-ngd-ctrl.c
@@ -919,21 +919,29 @@ static int qcom_slim_ngd_xfer_msg_sync(struct slim_controller *ctrl,
 	DECLARE_COMPLETION_ONSTACK(done);
 	int ret, timeout;
 
-	pm_runtime_get_sync(ctrl->dev);
+	ret = pm_runtime_get_sync(ctrl->dev);
+	if (ret < 0)
+		goto pm_put;
 
 	txn->comp = &done;
 
 	ret = qcom_slim_ngd_xfer_msg(ctrl, txn);
 	if (ret)
-		return ret;
+		goto pm_put;
 
 	timeout = wait_for_completion_timeout(&done, HZ);
 	if (!timeout) {
 		dev_err(ctrl->dev, "TX timed out:MC:0x%x,mt:0x%x", txn->mc,
 				txn->mt);
-		return -ETIMEDOUT;
+		ret = -ETIMEDOUT;
+		goto pm_put;
 	}
 	return 0;
+
+pm_put:
+	pm_runtime_put(ctrl->dev);
+
+	return ret;
 }
 
 static int qcom_slim_ngd_enable_stream(struct slim_stream_runtime *rt)
-- 
2.34.1

