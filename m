Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED6C86288E
	for <lists+alsa-devel@lfdr.de>; Sun, 25 Feb 2024 01:20:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E82D01E9;
	Sun, 25 Feb 2024 01:20:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E82D01E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708820411;
	bh=nduO32j5qsm2coGafczycwKiA7C3nN/RZtlpKylZp5w=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ljQHQdZvTCCOshJG+70K61XelSG+0mz742DL/BbdwG1xikvx5zVk1x/zKfNpD3CFP
	 4wvK68TqjfWuvagJqBKczoJwalE8snJM0KHFdrdeYRCEzqYncCfE68xXCfd4D/yqT9
	 rzakmRhRXNU2oNfZjMGobq2T7pYW9dyRDgSSjB1E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0267BF8057E; Sun, 25 Feb 2024 01:19:39 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A4C1DF805A1;
	Sun, 25 Feb 2024 01:19:39 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E05A4F80246; Sun, 25 Feb 2024 01:19:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A9715F80104
	for <alsa-devel@alsa-project.org>; Sun, 25 Feb 2024 01:19:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9715F80104
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1re2Eg-00083G-Sz; Sun, 25 Feb 2024 01:19:18 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1re2Ef-002hqj-KN; Sun, 25 Feb 2024 01:19:17 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1re2Ef-00BECA-1l;
	Sun, 25 Feb 2024 01:19:17 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	alsa-devel@alsa-project.org,
	kernel@pengutronix.de
Subject: [PATCH] slimbus: Convert to platform remove callback returning void
Date: Sun, 25 Feb 2024 01:19:12 +0100
Message-ID: <20240225001911.46196-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3643;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=nduO32j5qsm2coGafczycwKiA7C3nN/RZtlpKylZp5w=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBl2od/k84X9L/jnA4xVjpD/FS1Oq1ut4DOBU2JD
 nWnORsIjxyJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZdqHfwAKCRCPgPtYfRL+
 Tma/B/9fj/E01fkh3HM/1jPSKl/FEuPGo9t5r8YvISAPTQg/Y1E4YAwcY1KH0t02RNpMTGBXmIQ
 ciEYUjifs409s/zUJODLnI47S0y2rMlWop/92joRodcPvI/vdbjVFdCnPubLRuZrObS2t4rQb8L
 R+oZ1ielvLZGqdazd32u61DXasmc6VffzGKhaN3TXmLOs/ddLgF+pRzSoRURyzF0dBEd7S82cab
 v/NhhX0NKz7GPIDbnCXY+/8erBosc4DdhiEvQLRqP2SPcISksX31aYfkUG8tLShob7Rvldmr49I
 DYo+ZnJmtVudPSz93oS36Homhhd2GQHXSfyGoqjhtBp7/nqN
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: VGYVYYTACWBAVJ4YMEVD2JZFILM4DSVC
X-Message-ID-Hash: VGYVYYTACWBAVJ4YMEVD2JZFILM4DSVC
X-MailFrom: ukl@pengutronix.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is ignored (apart
from emitting a warning) and this typically results in resource leaks.

To improve here there is a quest to make the remove callback return
void. In the first step of this quest all drivers are converted to
.remove_new(), which already returns void. Eventually after all drivers
are converted, .remove_new() will be renamed to .remove().

Trivially convert the slimbus drivers from always returning zero in the
remove callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/slimbus/qcom-ctrl.c     |  5 ++---
 drivers/slimbus/qcom-ngd-ctrl.c | 11 ++++-------
 2 files changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/slimbus/qcom-ctrl.c b/drivers/slimbus/qcom-ctrl.c
index 400b7b385a44..7d632fad1300 100644
--- a/drivers/slimbus/qcom-ctrl.c
+++ b/drivers/slimbus/qcom-ctrl.c
@@ -626,7 +626,7 @@ static int qcom_slim_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int qcom_slim_remove(struct platform_device *pdev)
+static void qcom_slim_remove(struct platform_device *pdev)
 {
 	struct qcom_slim_ctrl *ctrl = platform_get_drvdata(pdev);
 
@@ -635,7 +635,6 @@ static int qcom_slim_remove(struct platform_device *pdev)
 	clk_disable_unprepare(ctrl->rclk);
 	clk_disable_unprepare(ctrl->hclk);
 	destroy_workqueue(ctrl->rxwq);
-	return 0;
 }
 
 /*
@@ -721,7 +720,7 @@ static const struct of_device_id qcom_slim_dt_match[] = {
 
 static struct platform_driver qcom_slim_driver = {
 	.probe = qcom_slim_probe,
-	.remove = qcom_slim_remove,
+	.remove_new = qcom_slim_remove,
 	.driver	= {
 		.name = "qcom_slim_ctrl",
 		.of_match_table = qcom_slim_dt_match,
diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
index efeba8275a66..a5aa364f562e 100644
--- a/drivers/slimbus/qcom-ngd-ctrl.c
+++ b/drivers/slimbus/qcom-ngd-ctrl.c
@@ -1675,14 +1675,12 @@ static int qcom_slim_ngd_ctrl_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int qcom_slim_ngd_ctrl_remove(struct platform_device *pdev)
+static void qcom_slim_ngd_ctrl_remove(struct platform_device *pdev)
 {
 	platform_driver_unregister(&qcom_slim_ngd_driver);
-
-	return 0;
 }
 
-static int qcom_slim_ngd_remove(struct platform_device *pdev)
+static void qcom_slim_ngd_remove(struct platform_device *pdev)
 {
 	struct qcom_slim_ngd_ctrl *ctrl = platform_get_drvdata(pdev);
 
@@ -1697,7 +1695,6 @@ static int qcom_slim_ngd_remove(struct platform_device *pdev)
 
 	kfree(ctrl->ngd);
 	ctrl->ngd = NULL;
-	return 0;
 }
 
 static int __maybe_unused qcom_slim_ngd_runtime_idle(struct device *dev)
@@ -1740,7 +1737,7 @@ static const struct dev_pm_ops qcom_slim_ngd_dev_pm_ops = {
 
 static struct platform_driver qcom_slim_ngd_ctrl_driver = {
 	.probe = qcom_slim_ngd_ctrl_probe,
-	.remove = qcom_slim_ngd_ctrl_remove,
+	.remove_new = qcom_slim_ngd_ctrl_remove,
 	.driver	= {
 		.name = "qcom,slim-ngd-ctrl",
 		.of_match_table = qcom_slim_ngd_dt_match,
@@ -1749,7 +1746,7 @@ static struct platform_driver qcom_slim_ngd_ctrl_driver = {
 
 static struct platform_driver qcom_slim_ngd_driver = {
 	.probe = qcom_slim_ngd_probe,
-	.remove = qcom_slim_ngd_remove,
+	.remove_new = qcom_slim_ngd_remove,
 	.driver	= {
 		.name = QCOM_SLIM_NGD_DRV_NAME,
 		.pm = &qcom_slim_ngd_dev_pm_ops,

base-commit: 33e1d31873f87d119e5120b88cd350efa68ef276
-- 
2.43.0

