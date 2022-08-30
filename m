Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 657485A6304
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Aug 2022 14:15:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 036EC16AB;
	Tue, 30 Aug 2022 14:14:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 036EC16AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661861745;
	bh=5FG1GHEdBq9GwmqYF5ee4WXo9fpP8LYTn2YgnNjdPYc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XfE9h2uEouAsT1JPFAoPvXAuaQExcpg38OYxeOxB7dd3j2zbbMLqvH5VRZCJCSb2N
	 vM+rbUjm5LJFP5+OACl9arvPCuJemgQVlOshE8OEbCy7iEAfsH2atwhYdahv8OAH95
	 JflvHQeqienmE/ofHL+2ytWO3OnsCx9tbQhmShb0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BDAE3F8023A;
	Tue, 30 Aug 2022 14:14:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E7811F8032B; Tue, 30 Aug 2022 14:14:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9176FF8016B
 for <alsa-devel@alsa-project.org>; Tue, 30 Aug 2022 14:14:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9176FF8016B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="DmtvEIod"
Received: by mail-lf1-x131.google.com with SMTP id v26so5005972lfd.10
 for <alsa-devel@alsa-project.org>; Tue, 30 Aug 2022 05:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=oACP5OJ8E262bJyD/huCTI3+4w0pfeaLTzinloHqVMQ=;
 b=DmtvEIodMZpn1KTPg/BtyUYkVLXGbMytdn6Cys0esmT+9iQN0XAvFe42woLBW/vtBp
 ZS1w+ZFLCTH5EuI1uyUgA0d49DABrExr4Q2Q0klOa2D7g8C/pHUiq/OKTgRbbqguDN1D
 NCngdCsdD0KZCSIWIrET1AM4LV8HLExbZoxXgxG1+6NOaCFHmTnom4uVmGQJpskH5fJv
 nsvkMj/ScQUK6BKiye/dXX20Zu0TFdbUNO1AHhjektm683zwSI5abtOqnt7BC1Wq6VL0
 qjmNzei4jAEl3Y8QMWf15lp97r3x9KkpHlCZYoMaaxz3tKJVq0WJbnukJYwOCFZxfAfr
 F1Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=oACP5OJ8E262bJyD/huCTI3+4w0pfeaLTzinloHqVMQ=;
 b=miB+QWqRM4upsI6ozX/XO6qSs11canXvxVO/WFP5+ZvpjHFlsEImYPNXRyn9xGZfaP
 r6DAh5A4apsER6DQ7HP4ZpdISSN2sKDHT+ig+De2HELkUpxNvohcs7CFNcZSXcsDtWrI
 c+NZcqKnSJUh8mjZDE8b3HRfnEZYgK/yW0bntFBiIwypLSlO6uFn6a3M9cg84zoPV5DF
 kx2mTIJr9dWVLmpEca+E/JREj5nxrltA+CWYJDpiC/TgoafE5u0tqUJ7b8+CzN5hRreO
 ZxTUsrt6wXdO75vkGDyafSeuDXxJNtof7tRKWN8g+pV1w2f4gehKNdyEYf0mlay5kJzM
 0jXQ==
X-Gm-Message-State: ACgBeo2QJ487X0Q7tT4spSkSh9AuNlcR72Af39GgOUQN/zG0Te9ok7Mm
 qO0uEXPWC+3z+K3ObTSOQfauwA==
X-Google-Smtp-Source: AA6agR5rB94QRjCCM1vUWb04bJnxTamAaZW4THRNYgKtwQvwdbklXgkZdG0aKFaLfkcqxqu5JMSPqg==
X-Received: by 2002:a05:6512:38b2:b0:493:9a:ac2e with SMTP id
 o18-20020a05651238b200b00493009aac2emr7333228lft.126.1661861644793; 
 Tue, 30 Aug 2022 05:14:04 -0700 (PDT)
Received: from krzk-bin.. (balticom-73-99-134.balticom.lv. [109.73.99.134])
 by smtp.gmail.com with ESMTPSA id
 e14-20020a2e984e000000b0025e57b40009sm1742436ljj.89.2022.08.30.05.14.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Aug 2022 05:14:04 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] slimbus: qcom-ngd: cleanup in probe error path
Date: Tue, 30 Aug 2022 15:13:58 +0300
Message-Id: <20220830121359.634344-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220830121359.634344-1-krzysztof.kozlowski@linaro.org>
References: <20220830121359.634344-1-krzysztof.kozlowski@linaro.org>
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
acquired/allocated:

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
 drivers/slimbus/qcom-ngd-ctrl.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
index 6fe6abb86061..bacc6af1d51e 100644
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
-		return PTR_ERR(pds);
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

