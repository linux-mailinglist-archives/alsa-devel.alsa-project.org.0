Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A10297C9034
	for <lists+alsa-devel@lfdr.de>; Sat, 14 Oct 2023 00:22:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1473786E;
	Sat, 14 Oct 2023 00:22:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1473786E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697235772;
	bh=BokPyYVG7aD1G6y+f2Y3dpkMLyYMGoIrNwIoPdZNxhU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=A/wqy8gcaQvOQXq1+PRFe/1ikwlkT4AfcNxePawK3goKk9dbnzSeGWQmOnSVa7DXu
	 7qXudCMy7GczWGyx82NgzA9bSly5XWf5Er1wtYYYiTOB5rvn0ECzzYSGic9l3pA5cQ
	 n/ioxYiUU+g1CC3xOKB+z1305/loFCYNvpkAoRoM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5933BF8056F; Sat, 14 Oct 2023 00:21:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A86A1F8055A;
	Sat, 14 Oct 2023 00:21:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BC234F80553; Sat, 14 Oct 2023 00:20:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6C01BF8019B
	for <alsa-devel@alsa-project.org>; Sat, 14 Oct 2023 00:20:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6C01BF8019B
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qrQVw-0003uJ-Oe; Sat, 14 Oct 2023 00:20:12 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qrQVv-001URH-QI; Sat, 14 Oct 2023 00:20:11 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qrQVv-00FrH8-Gt; Sat, 14 Oct 2023 00:20:11 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	kernel@pengutronix.de
Subject: [PATCH 6/7] ASoC: qcom: lpass: Make
 asoc_qcom_lpass_cpu_platform_remove() return void
Date: Sat, 14 Oct 2023 00:19:52 +0200
Message-ID: <20231013221945.1489203-15-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231013221945.1489203-9-u.kleine-koenig@pengutronix.de>
References: <20231013221945.1489203-9-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=4609;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=BokPyYVG7aD1G6y+f2Y3dpkMLyYMGoIrNwIoPdZNxhU=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlKcKIHGuYjXU1i9+OotCiM7vj8dtN06tcNWRmK
 YB0FsHkHWqJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZSnCiAAKCRCPgPtYfRL+
 TuYiB/9ewUPtxKy4ZiOX12ybpMfu6IjmIsrMwtEiR44mDb0DncgLYSo4G3phjYPsrgtCkQqegTI
 J9A7C6WIC2K4jNYrA1SHOr5JcRMNOBkaAee9HpAAie44ZtZqm3FDRYtRvrwV2LJHpkz9IrYX+DB
 REHPpcbHMT0Bj0eY8NxqfXVDr1cQITuvYC23sgFEYLFUEwG2nC1MYIwu3TFIXuYJt8Cl5p8Y5Ey
 H6BFn6P1H37nH34bxnbFUqUL8FmeNz60FjQJl7NEwTI9ugxgMaEGyO3MTippynDJ9JsDj+9E8Zb
 yw7BFUKQ447f0AcbqG97Vj76SLhU2EuUflLhXdorE+/Xi3or
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: ZMJPQNK52DNYJCUYJGGGMZPEBWFHOTLX
X-Message-ID-Hash: ZMJPQNK52DNYJCUYJGGGMZPEBWFHOTLX
X-MailFrom: ukl@pengutronix.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZMJPQNK52DNYJCUYJGGGMZPEBWFHOTLX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code.  However the value returned is (mostly) ignored
and this typically results in resource leaks. To improve here there is a
quest to make the remove callback return void. In the first step of this
quest all drivers are converted to .remove_new() which already returns
void.

asoc_qcom_lpass_cpu_platform_remove() returned zero unconditionally.
Make it return void instead and convert all users to struct
platform_device::remove_new().

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 sound/soc/qcom/lpass-apq8016.c | 2 +-
 sound/soc/qcom/lpass-cpu.c     | 5 +----
 sound/soc/qcom/lpass-ipq806x.c | 2 +-
 sound/soc/qcom/lpass-sc7180.c  | 2 +-
 sound/soc/qcom/lpass-sc7280.c  | 2 +-
 sound/soc/qcom/lpass.h         | 2 +-
 6 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/sound/soc/qcom/lpass-apq8016.c b/sound/soc/qcom/lpass-apq8016.c
index 8ce75b442b64..8e58e814a95f 100644
--- a/sound/soc/qcom/lpass-apq8016.c
+++ b/sound/soc/qcom/lpass-apq8016.c
@@ -300,7 +300,7 @@ static struct platform_driver apq8016_lpass_cpu_platform_driver = {
 		.of_match_table	= of_match_ptr(apq8016_lpass_cpu_device_id),
 	},
 	.probe	= asoc_qcom_lpass_cpu_platform_probe,
-	.remove	= asoc_qcom_lpass_cpu_platform_remove,
+	.remove_new = asoc_qcom_lpass_cpu_platform_remove,
 };
 module_platform_driver(apq8016_lpass_cpu_platform_driver);
 
diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
index ba8fa7919884..88b80ed45c66 100644
--- a/sound/soc/qcom/lpass-cpu.c
+++ b/sound/soc/qcom/lpass-cpu.c
@@ -1274,15 +1274,12 @@ int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
 }
 EXPORT_SYMBOL_GPL(asoc_qcom_lpass_cpu_platform_probe);
 
-int asoc_qcom_lpass_cpu_platform_remove(struct platform_device *pdev)
+void asoc_qcom_lpass_cpu_platform_remove(struct platform_device *pdev)
 {
 	struct lpass_data *drvdata = platform_get_drvdata(pdev);
 
 	if (drvdata->variant->exit)
 		drvdata->variant->exit(pdev);
-
-
-	return 0;
 }
 EXPORT_SYMBOL_GPL(asoc_qcom_lpass_cpu_platform_remove);
 
diff --git a/sound/soc/qcom/lpass-ipq806x.c b/sound/soc/qcom/lpass-ipq806x.c
index bbe9f11d7780..e0e9ad35821c 100644
--- a/sound/soc/qcom/lpass-ipq806x.c
+++ b/sound/soc/qcom/lpass-ipq806x.c
@@ -172,7 +172,7 @@ static struct platform_driver ipq806x_lpass_cpu_platform_driver = {
 		.of_match_table	= of_match_ptr(ipq806x_lpass_cpu_device_id),
 	},
 	.probe	= asoc_qcom_lpass_cpu_platform_probe,
-	.remove	= asoc_qcom_lpass_cpu_platform_remove,
+	.remove_new = asoc_qcom_lpass_cpu_platform_remove,
 };
 module_platform_driver(ipq806x_lpass_cpu_platform_driver);
 
diff --git a/sound/soc/qcom/lpass-sc7180.c b/sound/soc/qcom/lpass-sc7180.c
index 1b0c04b210ce..22063b834554 100644
--- a/sound/soc/qcom/lpass-sc7180.c
+++ b/sound/soc/qcom/lpass-sc7180.c
@@ -315,7 +315,7 @@ static struct platform_driver sc7180_lpass_cpu_platform_driver = {
 		.pm = &sc7180_lpass_pm_ops,
 	},
 	.probe = asoc_qcom_lpass_cpu_platform_probe,
-	.remove = asoc_qcom_lpass_cpu_platform_remove,
+	.remove_new = asoc_qcom_lpass_cpu_platform_remove,
 	.shutdown = asoc_qcom_lpass_cpu_platform_shutdown,
 };
 
diff --git a/sound/soc/qcom/lpass-sc7280.c b/sound/soc/qcom/lpass-sc7280.c
index 7cd3e291382a..47c622327a8d 100644
--- a/sound/soc/qcom/lpass-sc7280.c
+++ b/sound/soc/qcom/lpass-sc7280.c
@@ -445,7 +445,7 @@ static struct platform_driver sc7280_lpass_cpu_platform_driver = {
 		.pm = &sc7280_lpass_pm_ops,
 	},
 	.probe = asoc_qcom_lpass_cpu_platform_probe,
-	.remove = asoc_qcom_lpass_cpu_platform_remove,
+	.remove_new = asoc_qcom_lpass_cpu_platform_remove,
 	.shutdown = asoc_qcom_lpass_cpu_platform_shutdown,
 };
 
diff --git a/sound/soc/qcom/lpass.h b/sound/soc/qcom/lpass.h
index aab60540563a..2f222bd4ffcc 100644
--- a/sound/soc/qcom/lpass.h
+++ b/sound/soc/qcom/lpass.h
@@ -399,7 +399,7 @@ struct lpass_pcm_data {
 
 /* register the platform driver from the CPU DAI driver */
 int asoc_qcom_lpass_platform_register(struct platform_device *);
-int asoc_qcom_lpass_cpu_platform_remove(struct platform_device *pdev);
+void asoc_qcom_lpass_cpu_platform_remove(struct platform_device *pdev);
 void asoc_qcom_lpass_cpu_platform_shutdown(struct platform_device *pdev);
 int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev);
 extern const struct snd_soc_dai_ops asoc_qcom_lpass_cpu_dai_ops;
-- 
2.42.0

