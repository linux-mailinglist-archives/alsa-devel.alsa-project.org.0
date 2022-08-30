Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF145A6B51
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Aug 2022 19:53:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA47E1695;
	Tue, 30 Aug 2022 19:53:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA47E1695
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661882034;
	bh=09/NREPA79wQe5lmUCoDQ/jYhRDi/glDg6CTRgndM0Y=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hpv5Rzp7Eox0JlCzMGggCVN71B5KZGedg/zaQYbPliDke7HOtg6As4/FTNpuDS5TZ
	 +HITeyKhGr7Gqqgdaxo13KnRQaKO/zNR04UxGX2dVwoohyka4IOUZ7K8zddWWL5KWq
	 s8kxvX0OEYHDRkeiGe+5bK+fbF3vjY6AtQb+r7TQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 97C18F80525;
	Tue, 30 Aug 2022 19:52:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 806EBF80525; Tue, 30 Aug 2022 19:52:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 20DFCF8016B
 for <alsa-devel@alsa-project.org>; Tue, 30 Aug 2022 19:52:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 20DFCF8016B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="Rrxh/TS3"
Received: by mail-lj1-x231.google.com with SMTP id bx38so12157134ljb.10
 for <alsa-devel@alsa-project.org>; Tue, 30 Aug 2022 10:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=3y3YYNjG4SIll+4KRGX+EDIiHFSP98/0RDSZ0UDqAXc=;
 b=Rrxh/TS3FWVNU8y41gAtxxp1CRU75bRvzDTANnlUteoF/ovurrUMSNm9Yba5XpSq1f
 H9R8AjL9HUgEikw/mKRZmcUZgovaaSLfhvqRWTe6HJlU12QMDCWywCCYHIF9DwB/G6lI
 JTCGDT5LVGV2J9adV3BVXpiwSgyVRgYilju2pZ9hIcA9RMiJjf6PcvcnIXsQhl804zvS
 AuRE5oR9kPjiUW8KXwLyJIpVNt91qCMlblsdbD0/0zjfu52Q+HO1GN2JLriw5Fxy7rLx
 wZ5TG1ag8OOL9Xgu67kbNfFN94Pky8QsLaBUlwnE+f4FX4sZq/5rEf/4zaH7PR15m/Si
 25ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=3y3YYNjG4SIll+4KRGX+EDIiHFSP98/0RDSZ0UDqAXc=;
 b=veBbotP2Weg0oYKPcYRmvXmIHSvZcBRQL7mfm+YzQ5muKWaOU8tKKmaWdela5a4drG
 o+4dKKTYf/MnMNZ7Gn6yW1/G9n2jw8reKnBBr0av8XtbT012JgZaDyjpaFNFBY7Xx0Yv
 D4lLDGwunIwoAYXNAco1qdvsvCfcDGetqplm8q+TGDci7Oo/dd1hhrDaeWTmWfYN1AMY
 M5klXhfuOZzUcwbeIAg5VPzVCDo/MAp7EDh8CFN16hQQIABxzVccmQFASH4ni8Fo01bl
 py7g2dlit4u2Wbnn8oIHYgJkSYa42RrkeWkxI6t82jBS0bXBiXmxBeihYMlmRBs7TNAQ
 PDPQ==
X-Gm-Message-State: ACgBeo3MrkSqJHam99+W76OlkAukfcxrc89Y7M5hkmFLDDo5KcW85Zc3
 rT+oQkVtePYt3+7J4+TfNWSB4A==
X-Google-Smtp-Source: AA6agR6aBzjax1OJ583UbgWEAsw1wjuLmZGIkw+bcfOnZZOUr6WPMhITL1nEpYPpzybvIaw+MGsTmw==
X-Received: by 2002:a05:651c:105b:b0:265:ca48:d445 with SMTP id
 x27-20020a05651c105b00b00265ca48d445mr2491150ljm.300.1661881934701; 
 Tue, 30 Aug 2022 10:52:14 -0700 (PDT)
Received: from krzk-bin.. (balticom-73-99-134.balticom.lv. [109.73.99.134])
 by smtp.gmail.com with ESMTPSA id
 z16-20020a05651c11d000b00266461bf934sm653420ljo.107.2022.08.30.10.52.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Aug 2022 10:52:14 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] slimbus: qcom-ngd: cleanup in probe error path
Date: Tue, 30 Aug 2022 20:52:06 +0300
Message-Id: <20220830175207.13315-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220830175207.13315-1-krzysztof.kozlowski@linaro.org>
References: <20220830175207.13315-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 stable@vger.kernel.org
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

Add proper error path in probe() to cleanup resources previously
acquired/allocated to fix warnings visible during probe deferral:

  notifier callback qcom_slim_ngd_ssr_notify already registered
  WARNING: CPU: 6 PID: 70 at kernel/notifier.c:28 notifier_chain_register+0x5c/0x90
  Modules linked in:
  CPU: 6 PID: 70 Comm: kworker/u16:1 Not tainted 6.0.0-rc3-next-20220830 #380
  Call trace:
   notifier_chain_register+0x5c/0x90
   srcu_notifier_chain_register+0x44/0x90
   qcom_register_ssr_notifier+0x38/0x4c
   qcom_slim_ngd_ctrl_probe+0xd8/0x400
   platform_probe+0x6c/0xe0
   really_probe+0xbc/0x2d4
   __driver_probe_device+0x78/0xe0
   driver_probe_device+0x3c/0x12c
   __device_attach_driver+0xb8/0x120
   bus_for_each_drv+0x78/0xd0
   __device_attach+0xa8/0x1c0
   device_initial_probe+0x18/0x24
   bus_probe_device+0xa0/0xac
   deferred_probe_work_func+0x88/0xc0
   process_one_work+0x1d4/0x320
   worker_thread+0x2cc/0x44c
   kthread+0x110/0x114
   ret_from_fork+0x10/0x20

Cc: <stable@vger.kernel.org>
Fixes: e1ae85e1830e ("slimbus: qcom-ngd-ctrl: add Protection Domain Restart Support")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes since v1:
1. None
---
 drivers/slimbus/qcom-ngd-ctrl.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
index f4f330b9fa72..bacc6af1d51e 100644
--- a/drivers/slimbus/qcom-ngd-ctrl.c
+++ b/drivers/slimbus/qcom-ngd-ctrl.c
@@ -1576,18 +1576,27 @@ static int qcom_slim_ngd_ctrl_probe(struct platform_device *pdev)
 	ctrl->pdr = pdr_handle_alloc(slim_pd_status, ctrl);
 	if (IS_ERR(ctrl->pdr)) {
 		dev_err(dev, "Failed to init PDR handle\n");
-		return PTR_ERR(ctrl->pdr);
+		ret = PTR_ERR(ctrl->pdr);
+		goto err_pdr_alloc;
 	}
 
 	pds = pdr_add_lookup(ctrl->pdr, "avs/audio", "msm/adsp/audio_pd");
 	if (IS_ERR(pds) && PTR_ERR(pds) != -EALREADY) {
 		ret = PTR_ERR(pds);
 		dev_err(dev, "pdr add lookup failed: %d\n", ret);
-		return ret;
+		goto err_pdr_lookup;
 	}
 
 	platform_driver_register(&qcom_slim_ngd_driver);
 	return of_qcom_slim_ngd_register(dev, ctrl);
+
+err_pdr_alloc:
+	qcom_unregister_ssr_notifier(ctrl->notifier, &ctrl->nb);
+
+err_pdr_lookup:
+	pdr_handle_release(ctrl->pdr);
+
+	return ret;
 }
 
 static int qcom_slim_ngd_ctrl_remove(struct platform_device *pdev)
-- 
2.34.1

