Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF7B5232BD
	for <lists+alsa-devel@lfdr.de>; Wed, 11 May 2022 14:16:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 00842193F;
	Wed, 11 May 2022 14:15:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 00842193F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652271392;
	bh=coelNclzv3mxzVxwpxT2IBzKJeUQd+QCKQpbH0fCKe0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uf+PBmJ2QxjXEEjmFHk+rKokSTkmMsaJjgt7I6rIcjt3ddayA8VfF2dlXwRpil+oJ
	 WVS0oWXWjBGoNEFPHRDGqxbKd3BbOAoc5gBYPxLJgO/twAUpO8Ry/APJEjeMlA2J1D
	 HIAaRqiaL4BdkJNVYdx3DidMAhdnsZRMCtrc9jeo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 17CD6F804D8;
	Wed, 11 May 2022 14:15:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1EDC1F80153; Tue, 10 May 2022 16:45:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BD3B0F8014C
 for <alsa-devel@alsa-project.org>; Tue, 10 May 2022 16:45:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BD3B0F8014C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Xp5x5Hjo"
Received: by mail-ed1-x52b.google.com with SMTP id d6so20296045ede.8
 for <alsa-devel@alsa-project.org>; Tue, 10 May 2022 07:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cviL3lmIYw/HkQPfXBpg2Ad3NY9GzMPeGBFFoRKwMlQ=;
 b=Xp5x5HjouRwxA3WTb4Y4k5B5FFuVFgUZnJBvYRFhNYagsTxkvVst4HILGHD5EYLNzH
 kmkUvGprkk4d/vz38/+ckDGtnR5jpmkeYY42sTynRyBk/mWbh1ETbuPA6S+f2yQXb+Cu
 qeONylgSs0tQgA/RKli/cxjAeeqBpX1zvZzYTct39albJuDK0e38A4H22p7er6kCuEMc
 Wr5/20TGbEf9A+koioveWlZXOd6TFnzPTqibQV7AsAHAJeY7aWxYEHC6NSlgqbgY2U/l
 0FoGPbd2fNxO/+IMfa1nPSDShsxhzT5n2vMmBTE3bm5G702g7U5d11Y3fc87/l6jJIMk
 9WbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cviL3lmIYw/HkQPfXBpg2Ad3NY9GzMPeGBFFoRKwMlQ=;
 b=mXTRyZ/biDhwZYTxCCTuua4WdqCHTv+0PGLx2jsKia6xpX3FfCPmwL2iI9SiBzqYmW
 RR/HxixerYaJ3eP1sbLp6vaMZQWK6uocUHoRdLdmDTl4iXVpmxhuNtXVAtl3E01jpI1w
 QgVlLyvNYECDSGWIaP+iXrn87NJ361dif9Eo8F8T53R6yeVsDYF78iwYtsRwqMVdrEvz
 JB+2WWotEOuTOTvgJ4PBcMZp/BF9+YP5J5p+j8RlbBZocBfzhFGNcZoZCK4x4yMWZy35
 7HpCAQ+8/hgf8KlGv+/KyW2Putpg+kWpMHX2CYYM9s13x+hgf9fjdzpaACpbK76gqzmy
 YY8g==
X-Gm-Message-State: AOAM532gocyWoAmOJuMCguGA6w3N1dKk6TMkm+VzqWY4++6dcMrQHpqN
 xsl/XBuJz8yFUqT+wq3njHA=
X-Google-Smtp-Source: ABdhPJzHOoz8+9ti+fXbuPpKkTiz74mWvVEvuIU555+bb83colNPFTAkvWeWhIiw1aBFqx9YNvR3Sw==
X-Received: by 2002:a05:6402:3456:b0:425:ab60:1b00 with SMTP id
 l22-20020a056402345600b00425ab601b00mr23902968edc.71.1652193931804; 
 Tue, 10 May 2022 07:45:31 -0700 (PDT)
Received: from localhost.localdomain (89-38-99-188.hosted-by-worldstream.net.
 [89.38.99.188]) by smtp.gmail.com with ESMTPSA id
 z16-20020a170906241000b006fb6d9d25bfsm829652eja.22.2022.05.10.07.45.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 May 2022 07:45:31 -0700 (PDT)
From: Yassine Oudjana <yassine.oudjana@gmail.com>
X-Google-Original-From: Yassine Oudjana <y.oudjana@protonmail.com>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [RFC PATCH 1/2] remoteproc: qcom: Report last event on SSR notifier
 registration
Date: Tue, 10 May 2022 18:42:18 +0400
Message-Id: <20220510144219.806391-2-y.oudjana@protonmail.com>
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

Keep track of the last SSR event of a remoteproc, then report it
to each newly registered notifier block. This prevents drivers
from waiting indefinitely for an event that has already happened
before they registered their notifier blocks.

Fixes: a899d324863a3 ("slimbus: qcom-ngd-ctrl: add Sub System Restart support")
Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
---
 drivers/remoteproc/qcom_common.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/remoteproc/qcom_common.c b/drivers/remoteproc/qcom_common.c
index 4b91e3c9eafa..ff85ea564129 100644
--- a/drivers/remoteproc/qcom_common.c
+++ b/drivers/remoteproc/qcom_common.c
@@ -85,6 +85,7 @@ struct qcom_ssr_subsystem {
 	const char *name;
 	struct srcu_notifier_head notifier_list;
 	struct list_head list;
+	enum qcom_ssr_notify_type current_state;
 };
 
 static LIST_HEAD(qcom_ssr_subsystem_list);
@@ -392,6 +393,9 @@ void *qcom_register_ssr_notifier(const char *name, struct notifier_block *nb)
 
 	srcu_notifier_chain_register(&info->notifier_list, nb);
 
+	/* Notify newly registered notifier block of current remoteproc state */
+	nb->notifier_call(nb, info->current_state, NULL);
+
 	return &info->notifier_list;
 }
 EXPORT_SYMBOL_GPL(qcom_register_ssr_notifier);
@@ -420,8 +424,9 @@ static int ssr_notify_prepare(struct rproc_subdev *subdev)
 		.crashed = false,
 	};
 
+	ssr->info->current_state = QCOM_SSR_BEFORE_POWERUP;
 	srcu_notifier_call_chain(&ssr->info->notifier_list,
-				 QCOM_SSR_BEFORE_POWERUP, &data);
+				 ssr->info->current_state, &data);
 	return 0;
 }
 
@@ -433,8 +438,9 @@ static int ssr_notify_start(struct rproc_subdev *subdev)
 		.crashed = false,
 	};
 
+	ssr->info->current_state = QCOM_SSR_AFTER_POWERUP;
 	srcu_notifier_call_chain(&ssr->info->notifier_list,
-				 QCOM_SSR_AFTER_POWERUP, &data);
+				 ssr->info->current_state, &data);
 	return 0;
 }
 
@@ -446,8 +452,9 @@ static void ssr_notify_stop(struct rproc_subdev *subdev, bool crashed)
 		.crashed = crashed,
 	};
 
+	ssr->info->current_state = QCOM_SSR_BEFORE_SHUTDOWN;
 	srcu_notifier_call_chain(&ssr->info->notifier_list,
-				 QCOM_SSR_BEFORE_SHUTDOWN, &data);
+				 ssr->info->current_state, &data);
 }
 
 static void ssr_notify_unprepare(struct rproc_subdev *subdev)
@@ -458,8 +465,9 @@ static void ssr_notify_unprepare(struct rproc_subdev *subdev)
 		.crashed = false,
 	};
 
+	ssr->info->current_state = QCOM_SSR_AFTER_SHUTDOWN;
 	srcu_notifier_call_chain(&ssr->info->notifier_list,
-				 QCOM_SSR_AFTER_SHUTDOWN, &data);
+				 ssr->info->current_state, &data);
 }
 
 /**
@@ -484,6 +492,7 @@ void qcom_add_ssr_subdev(struct rproc *rproc, struct qcom_rproc_ssr *ssr,
 	}
 
 	ssr->info = info;
+	ssr->info->current_state = QCOM_SSR_BEFORE_POWERUP;
 	ssr->subdev.prepare = ssr_notify_prepare;
 	ssr->subdev.start = ssr_notify_start;
 	ssr->subdev.stop = ssr_notify_stop;
-- 
2.36.0

