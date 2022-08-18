Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 31665597C6B
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Aug 2022 05:52:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6EAF01661;
	Thu, 18 Aug 2022 05:51:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6EAF01661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660794741;
	bh=AqNccWjhdh6g4UvLUBBjnhob9sKKTJvj7fTB0MrsAhg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=I2BSEjaxgFvJtGiJDU2+6EmGcfqsx8ngwrslTgbNexY/3EyrWHr31d3ogxghM1BrC
	 5ypqvNB/Uzvvk4goL5Qjn+VDw40ofuzbeYwGj+ywQzDQE//RDPplwjaP9EoJ2FdOBn
	 agHym9bT3wtkVvbmO5N4jReHihdBvZcfaumPICZw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CD8A9F800EE;
	Thu, 18 Aug 2022 05:51:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 17396F80430; Thu, 18 Aug 2022 05:51:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C634AF800EE
 for <alsa-devel@alsa-project.org>; Thu, 18 Aug 2022 05:51:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C634AF800EE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kali.org header.i=@kali.org
 header.b="hUsX8rTl"
Received: by mail-oi1-x22b.google.com with SMTP id w197so383132oie.5
 for <alsa-devel@alsa-project.org>; Wed, 17 Aug 2022 20:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kali.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=z/kt4xsiqT5uh1tSKfd39tJzduEkjiNNtsPz4ODYScQ=;
 b=hUsX8rTlrvTeQvHroIs2XSAw7rftVr3j4T1DMDpJAOhE75zyhypDjS8nZn2dJ1PAtV
 PyyiE9zWnK4AdZgnzKyYo5SaIU4lzFOnMQhymG4K/BunYWpJmPqfh2ayCKiRVtyMXUSa
 qWJ/8Kn31W0eviW63LQ0bNlJd7r6XSayEsgXrpJrTkzbtn676A0CSZlXget+ct41QgUJ
 6pnc/4akLOnoonrqqS59n0HN3I+svs8h75IiIISyBFN+rKSSBroei3IQKCB+ACuprsL1
 ysf9YPNasyRTNxgNyKrZrBFrU7rRsKPFfAWfn2JKWrr+VV6hdcFI5VeL8KpweMamYNQs
 J9Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=z/kt4xsiqT5uh1tSKfd39tJzduEkjiNNtsPz4ODYScQ=;
 b=nbxdeQeYayyI2Zi5fVgp4+R/yIftXZxoPwixeGj+OFQ469vwIRyhnLkThMbGZPMAVx
 kL9LBgd0N6814n2pCdmiJxZunClqASb9nE+q4ZAXtdwR1w4yKb1GGwsBavgHirzZN5PO
 +3ARQiOJxb+3ZbsSS1jXX2FfvYrLhCL/lU6dd/vtWQoQmQsVsmpK4xky2aa8757Y1RN7
 cKsGpF5L70idw3wu4cTloJkD7WRVbPDsfzjuoZ2kkip9B5cD0JBWMywwtn37Fr4ENIxN
 jT+f+nVAxrDjX5nLdPPlA26fUoPzznVXmzPnV9tiBUyctct+7il7V7rn8QQSyUAb/fkf
 mDiw==
X-Gm-Message-State: ACgBeo0WPUW8mHXOCNeqIJyi1pIR2BFpErFIEgZjM2IfIY1MbZPRMr8d
 iUkHITiiFgjvTE28DAyHom9OUA==
X-Google-Smtp-Source: AA6agR5nK0pO97s1k3xUg01xcKqTwc3MTVG/hu97TQDzw0VbKl4p+cqjklTjMetgLlKH5V34+pGaOA==
X-Received: by 2002:a05:6808:200f:b0:343:470a:cd22 with SMTP id
 q15-20020a056808200f00b00343470acd22mr2776801oiw.52.1660794671410; 
 Wed, 17 Aug 2022 20:51:11 -0700 (PDT)
Received: from localhost (cpe-173-173-107-246.satx.res.rr.com.
 [173.173.107.246]) by smtp.gmail.com with ESMTPSA id
 b6-20020a9d5d06000000b0063695ad0cbesm142984oti.66.2022.08.17.20.51.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Aug 2022 20:51:10 -0700 (PDT)
From: Steev Klimaszewski <steev@kali.org>
To: Steev Klimaszewski <steev@kali.org>
Subject: [PATCH] soundwire: qcom: remove unneeded check
Date: Wed, 17 Aug 2022 22:51:05 -0500
Message-Id: <20220818035105.5510-1-steev@kali.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Amit Pundir <amit.pundir@linaro.org>, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, Konrad Dybcio <konrad.dybcio@somainline.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Andy Gross <agross@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, linux-kernel@vger.kernel.org,
 Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
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

commit 1fd0d85affe4d6 ("soundwire: qcom: Add flag for software clock gating check") 
added a flag for software clock gating check, however in commit
33ba01788889666 ("soundwire: qcom: Add support for controlling audio CGCR from HLOS")
the same check was added without the flag, so we would still end up failing
the software clock gating check.

Originally reported by Amit Pundir on DB845c, I also saw it on the
Lenovo Yoga C630, right before the splat, we would see

qcom-soundwire wcd934x-soundwire.6.auto: Failed to get audio_cgcr reset required for soundwire-v1.6.0

however, SDM845 has a soundwire-v1.3.0

Since the flag was added in 1fd0d85affe, lets just remove this one.

Fixes: 33ba01788889 ("soundwire: qcom: Add support for controlling audio CGCR from HLOS")
Signed-off-by: Steev Klimaszewski <steev@kali.org>
Reported-by: Amit Pundir <amit.pundir@linaro.org>
---
 drivers/soundwire/qcom.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 709a7c1e0704..b621f7fb866f 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -1355,10 +1355,6 @@ static int qcom_swrm_probe(struct platform_device *pdev)
 	ctrl->bus.compute_params = &qcom_swrm_compute_params;
 	ctrl->bus.clk_stop_timeout = 300;
 
-	ctrl->audio_cgcr = devm_reset_control_get_exclusive(dev, "swr_audio_cgcr");
-	if (IS_ERR(ctrl->audio_cgcr))
-		dev_err(dev, "Failed to get audio_cgcr reset required for soundwire-v1.6.0\n");
-
 	ret = qcom_swrm_get_port_config(ctrl);
 	if (ret)
 		goto err_clk;
-- 
2.35.1

