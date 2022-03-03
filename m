Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 019774CBC18
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Mar 2022 12:04:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 825C31A9E;
	Thu,  3 Mar 2022 12:03:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 825C31A9E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646305485;
	bh=IsRZoZ9KQqOEda6ZTVmiz3cTaRRZuVIbhB0jBijioXY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=acV9AR3o9uhwEGPT9uh2px0HLtki4oMpfUyijvcMJm1LKxtWWdDkPEoFXrlnNGveG
	 vUREKGSZncttKEXu/fPNhGUCzXnsh8jj661bhthSZWtmB4CHPkxOp2gsf+L5JTptBT
	 erEbY4Mx0UIgrFfDwQ4ZylbZb9X2TFIQAw1th+I4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E31AEF80166;
	Thu,  3 Mar 2022 12:03:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2B19DF80109; Thu,  3 Mar 2022 12:03:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 567CCF80109
 for <alsa-devel@alsa-project.org>; Thu,  3 Mar 2022 12:03:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 567CCF80109
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="XDYOccH9"
Received: by mail-wr1-x433.google.com with SMTP id ay10so7220861wrb.6
 for <alsa-devel@alsa-project.org>; Thu, 03 Mar 2022 03:03:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8hDu3jQ0/KFwUauJ0s0iiJQ5+oez30L/TC9C+H82oIY=;
 b=XDYOccH9/feL6Ga45UDMA4UeGQ2IytWYoXsBswjEKD7uNTlpf0VtbxzB3avjKa0Xr2
 GyImAA3NbJi7tuwKzXOol2I72Z+rEZSPw+LyUw6NdzxexCd5VQ1K5h/R9Hub5aeFHcan
 ivv0S/qSgsVYRr1oyWRIpSau/cOF/2FqgjGotx/sLggikMWwsaH4JJ0RP+Yeusqm89H0
 XJN+C3MG05/iJxVFre2ytXzWNm9wNEfw7iaKgLY+o1QyPP6l+rI65MCP+EhVZuhzh6Rf
 H/CfoqcTUwHjZb2TxaQgltSIKz5RObYoNSsv3Y+zYHUKcmAO85IFb4Xj1cnBkzqYjvgQ
 zWvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8hDu3jQ0/KFwUauJ0s0iiJQ5+oez30L/TC9C+H82oIY=;
 b=K+jPlvVvtOWSsCwG3v9HEwG9FlQYYMc+NyKVxAagWSHMY4BKQ4vJftMM4yBo1AJDa6
 c9gHCnfHcgu2aDlajI+tIFsCwpe6ypdq3o0+DoGgcWObT8cZPbbo4eSvcv7YF4f8auKj
 rkVpywf2gR2VW4fwsryWnsd4IZPGgO1JjRwYoyEchuqZlCt0AgJJuo3cYbwFZMglZys/
 3ztAV5Rv8Vm1sE7SSOOsBigeQMiCuHEzjV2cPknB05WHuWmGwC76hk1/9/h/uxRcioSa
 ArbchzFXc59oxC1Mv/wZBt3fdhYO3uq+zOGtteMp6myY3qe3zm8QOFpzTVvscWeWl5Q/
 h7QQ==
X-Gm-Message-State: AOAM531HGIwSjo00xLm0zMaXM4QUiHnnLXDtrHA1lnKmr8c2aBclTZjd
 YSdSBgcoHaTwglYCoRiJUnb+jA==
X-Google-Smtp-Source: ABdhPJxmv07Y0UCCmrx9Mk4RldZATonv6UYABP7hLa0VMXaYKQQfPtPdCbK4cU+CsbZNk76xvOwhQg==
X-Received: by 2002:adf:a199:0:b0:1f0:20f5:8f79 with SMTP id
 u25-20020adfa199000000b001f020f58f79mr7842466wru.296.1646305408054; 
 Thu, 03 Mar 2022 03:03:28 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id
 p16-20020adff210000000b001f062b80091sm638187wro.34.2022.03.03.03.03.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 03:03:27 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: vkoul@kernel.org,
	yung-chuan.liao@linux.intel.com
Subject: [PATCH] soundwire: qcom: fix build failures if CONFIG_PM=n
Date: Thu,  3 Mar 2022 11:03:21 +0000
Message-Id: <20220303110321.23666-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Stephen Rothwell <sfr@canb.auug.org.au>, pierre-louis.bossart@linux.intel.com,
 linux-kernel@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, quic_srivasam@quicinc.com
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

Fix below build failure
drivers/soundwire/qcom.c:1460:12: error: 'swrm_runtime_resume' defined
but not used [-Werror=unused-function]
by marking the resume swrm_runtime_resume() with  __maybe_unused attribute.

Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/soundwire/qcom.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index e893aee1b057..6575695cd400 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -1459,7 +1459,7 @@ static bool swrm_wait_for_frame_gen_enabled(struct qcom_swrm_ctrl *swrm)
 	return false;
 }
 
-static int swrm_runtime_resume(struct device *dev)
+static int __maybe_unused swrm_runtime_resume(struct device *dev)
 {
 	struct qcom_swrm_ctrl *ctrl = dev_get_drvdata(dev);
 	int ret;
-- 
2.21.0

