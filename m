Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C5A5232BE
	for <lists+alsa-devel@lfdr.de>; Wed, 11 May 2022 14:16:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 76CA21661;
	Wed, 11 May 2022 14:15:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 76CA21661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652271402;
	bh=cNi3Zl5rtELehg/qBP5688pmvW51vUwGguXf9cnx33Y=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JO089iRifIXhYoNx9yG2WvN3U9Sve1xqzkHUXAEolwmHcx27youW6g18dCK1sBEO9
	 k8/UrYu2sVNc/4Bejcfq7QFSruesGh6aJv9RPwtw+/Q5w1OFhuIKvyBfbW2kJEEjWu
	 CL2kNtylCM9+3C9im1SrLz1aVUen0q+CQD7oh5RM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BE806F8050F;
	Wed, 11 May 2022 14:15:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DC988F8011C; Tue, 10 May 2022 16:45:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8C43CF8011C
 for <alsa-devel@alsa-project.org>; Tue, 10 May 2022 16:45:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8C43CF8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="gRi76ycW"
Received: by mail-ej1-x62f.google.com with SMTP id dk23so33443989ejb.8
 for <alsa-devel@alsa-project.org>; Tue, 10 May 2022 07:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eGTN6aMN0s/KhqZVZqbtoSr5BOPu4zHPp3TT3ztEYwQ=;
 b=gRi76ycWfaYj+DC25eRDShAGPnPSRBQtz4hKna7OLzNJqQFxUfaZqLK5rMatNpo+Xt
 OPYUMyOpLJM6QsTiZbA/DVzp7wIDRp2Ss2VWbS2G+vKzgZKATIfvZn6N4sxmosUXP8Y6
 p+20OI+1VBjQGsdqkMtq8ANdsjTYlUL4Q0jvD3FdM0lLJanQzBZB02p1VAlQZecjuzG9
 mvsmd9JK5ELIzkdno43Yd59DehKPp8OvEDAq+YBQ6hSo7mEI5kqKSPVp0NAtqSAmQo+I
 OvXHsYnfIvdcgRAggH9QifrSa4Hc0BSrA7VqOlA+LGceJgGmdiRbAaENatxJJdhHTKfm
 TzsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eGTN6aMN0s/KhqZVZqbtoSr5BOPu4zHPp3TT3ztEYwQ=;
 b=M38Bc8PUjDQ+WX2s3Ig7WqHt0EVr8nMNi++6V8BUNMOIo+zNm7wQG1+uAKW4m/xotV
 A//a+Yq4CpoIsEzQiIIJhPX1DUyFjBMY8Am2CQ4OW7ma22OOyW/A8ZDBg9HefUGaNugP
 1r5n1DPSq3j8//Qv6ea+/zTha1l//owdvmtVmWZhDPfWrfJ01FXf/9GVzOdTMJV5IZEY
 lDgyvBFsJMQOhZeybSxyGL1sguZKJX4Wn0BOZs+ly/WEO0DCyB0+9UKK5po5fTUiTkAK
 C6FqZx8Jn3XJpLUradrQQ0GgP5bfMinw7cZ2o8bQe7r6MbAgWdzBIyc0iFOJRsZLbuZh
 Yn4A==
X-Gm-Message-State: AOAM533ov2C4GBLl8YkFcKV9kLtlFwtQdQqyThomf2Cm84xpan2Wacn4
 BwKAd6HsufFzJg7BIGB6e64=
X-Google-Smtp-Source: ABdhPJxqZSKXdWSVeTuLaqUhIC+S7MYZ+4pUf5FWmkaMNwvzSXpE7agGc7utHZ28cZ4QcKHb6o+t8w==
X-Received: by 2002:a17:907:2da2:b0:6f4:7395:568b with SMTP id
 gt34-20020a1709072da200b006f47395568bmr20115064ejc.766.1652193937643; 
 Tue, 10 May 2022 07:45:37 -0700 (PDT)
Received: from localhost.localdomain (89-38-99-188.hosted-by-worldstream.net.
 [89.38.99.188]) by smtp.gmail.com with ESMTPSA id
 z16-20020a170906241000b006fb6d9d25bfsm829652eja.22.2022.05.10.07.45.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 May 2022 07:45:37 -0700 (PDT)
From: Yassine Oudjana <yassine.oudjana@gmail.com>
X-Google-Original-From: Yassine Oudjana <y.oudjana@protonmail.com>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [RFC PATCH 2/2] slimbus: qcom-ngd-ctrl: Initialize ngd_up_work before
 it can be scheduled
Date: Tue, 10 May 2022 18:42:19 +0400
Message-Id: <20220510144219.806391-3-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220510144219.806391-1-y.oudjana@protonmail.com>
References: <20220510144219.806391-1-y.oudjana@protonmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 11 May 2022 14:14:58 +0200
Cc: alsa-devel@alsa-project.org, Yassine Oudjana <y.oudjana@protonmail.com>,
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Yassine Oudjana <yassine.oudjana@gmail.com>
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

From: Yassine Oudjana <y.oudjana@protonmail.com>

ngd_up_work can be scheduled by the SSR notifier, which is registered
before it is initialized. Move initialization of ngd_up_work before
SSR notifier registration.

Fixes: a899d324863a3 ("slimbus: qcom-ngd-ctrl: add Sub System Restart support")
Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
---
 drivers/slimbus/qcom-ngd-ctrl.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
index 7040293c2ee8..73b9abba305f 100644
--- a/drivers/slimbus/qcom-ngd-ctrl.c
+++ b/drivers/slimbus/qcom-ngd-ctrl.c
@@ -1490,7 +1490,6 @@ static int qcom_slim_ngd_probe(struct platform_device *pdev)
 	}
 
 	INIT_WORK(&ctrl->m_work, qcom_slim_ngd_master_worker);
-	INIT_WORK(&ctrl->ngd_up_work, qcom_slim_ngd_up_worker);
 	ctrl->mwq = create_singlethread_workqueue("ngd_master");
 	if (!ctrl->mwq) {
 		dev_err(&pdev->dev, "Failed to start master worker\n");
@@ -1539,6 +1538,8 @@ static int qcom_slim_ngd_ctrl_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	INIT_WORK(&ctrl->ngd_up_work, qcom_slim_ngd_up_worker);
+
 	ctrl->nb.notifier_call = qcom_slim_ngd_ssr_notify;
 	ctrl->notifier = qcom_register_ssr_notifier("lpass", &ctrl->nb);
 	if (IS_ERR(ctrl->notifier))
-- 
2.36.0

