Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3176F8B753A
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Apr 2024 14:02:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7251384A;
	Tue, 30 Apr 2024 14:02:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7251384A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714478544;
	bh=gDpT6Hc1jPudL9uBZtdVkdWFHK/SVqgJ6+WeFAVOPnc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GUZnXWf0Bn0siVgggObURbbUStDXt5YxxGcdNuZN27vSUG1EQYsVOcJL1/RuZUW70
	 GHBS22wx2DLp65zJj7SW8oL4M6RgdmmjvlExCI9x3lh2RAx53uaCUqJvAzN2a8oaza
	 A43D5oAbJoK4kMPYAOXpQquA5kzBg5032NxOxAQg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6A834F805F4; Tue, 30 Apr 2024 14:01:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 73C92F805F4;
	Tue, 30 Apr 2024 14:01:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B69F2F80269; Tue, 30 Apr 2024 14:01:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EE328F8025D
	for <alsa-devel@alsa-project.org>; Tue, 30 Apr 2024 14:01:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EE328F8025D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com
 header.a=rsa-sha256 header.s=k1 header.b=N0haDqpx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=owc6KVsVgzzTz/FV7NYmF6XOfOcxz0hvsD0eutcgSVw=; b=N0haDq
	pxWXb+XdO8iIPJiHIgxZU8eG9QqxT1yjkGPCZTyFr9Y1BMdQ2m0s/VHsIVnwXdth
	Ak8WrCciQ0AD3lHH7vJKoFvSyczumHHfDfd6FWs7JqLcMuceOffzsaY1/BSOYH2R
	XT0f8ZYRHtyE1go4qbEGMFLy3ymcqoM85XOgi+SBg4XA1ZpbwdWQid1vs6OrxfH8
	1anisMLPNnmD4wygYCbDAbSuxVJWfxOxjNmBn27z2YRMfzFakyxjEeImBSZKW5sj
	wsmT2/W0oenRuM6mCay3F48kqrHQfQze3Zga9gh0phC80vfl5jOPxcPHKHK/Joec
	4CFUWyIoje9PcgaA==
Received: (qmail 2623526 invoked from network); 30 Apr 2024 14:01:05 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted,
 authenticated); 30 Apr 2024 14:01:05 +0200
X-UD-Smtp-Session: l3s3148p1@eA3fH08XoJZehhrb
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: alsa-devel@alsa-project.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH 3/3] slimbus: qcom-ngd-ctrl: use 'time_left' variable with
 wait_for_completion_timeout()
Date: Tue, 30 Apr 2024 14:01:01 +0200
Message-ID: <20240430120102.29459-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240430120102.29459-1-wsa+renesas@sang-engineering.com>
References: <20240430120102.29459-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: Q6AYNSUMKCZF2FJZB5RAYIY5WUADMOMH
X-Message-ID-Hash: Q6AYNSUMKCZF2FJZB5RAYIY5WUADMOMH
X-MailFrom: wsa+renesas@sang-engineering.com
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
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Q6AYNSUMKCZF2FJZB5RAYIY5WUADMOMH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

There is a confusing pattern in the kernel to use a variable named 'timeout' to
store the result of wait_for_completion_timeout() causing patterns like:

	timeout = wait_for_completion_timeout(...)
	if (!timeout) return -ETIMEDOUT;

with all kinds of permutations. Use 'time_left' as a variable to make the code
self explaining.

Fix to the proper variable type 'unsigned long' while here.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/slimbus/qcom-ngd-ctrl.c | 29 ++++++++++++++++-------------
 1 file changed, 16 insertions(+), 13 deletions(-)

diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
index efeba8275a66..21b4008de4f3 100644
--- a/drivers/slimbus/qcom-ngd-ctrl.c
+++ b/drivers/slimbus/qcom-ngd-ctrl.c
@@ -789,7 +789,8 @@ static int qcom_slim_ngd_xfer_msg(struct slim_controller *sctrl,
 	struct qcom_slim_ngd_ctrl *ctrl = dev_get_drvdata(sctrl->dev);
 	DECLARE_COMPLETION_ONSTACK(tx_sent);
 	DECLARE_COMPLETION_ONSTACK(done);
-	int ret, timeout, i;
+	int ret, i;
+	unsigned long time_left;
 	u8 wbuf[SLIM_MSGQ_BUF_LEN];
 	u8 rbuf[SLIM_MSGQ_BUF_LEN];
 	u32 *pbuf;
@@ -891,8 +892,8 @@ static int qcom_slim_ngd_xfer_msg(struct slim_controller *sctrl,
 		return ret;
 	}
 
-	timeout = wait_for_completion_timeout(&tx_sent, HZ);
-	if (!timeout) {
+	time_left = wait_for_completion_timeout(&tx_sent, HZ);
+	if (!time_left) {
 		dev_err(sctrl->dev, "TX timed out:MC:0x%x,mt:0x%x", txn->mc,
 					txn->mt);
 		mutex_unlock(&ctrl->tx_lock);
@@ -900,8 +901,8 @@ static int qcom_slim_ngd_xfer_msg(struct slim_controller *sctrl,
 	}
 
 	if (usr_msg) {
-		timeout = wait_for_completion_timeout(&done, HZ);
-		if (!timeout) {
+		time_left = wait_for_completion_timeout(&done, HZ);
+		if (!time_left) {
 			dev_err(sctrl->dev, "TX timed out:MC:0x%x,mt:0x%x",
 				txn->mc, txn->mt);
 			mutex_unlock(&ctrl->tx_lock);
@@ -917,7 +918,8 @@ static int qcom_slim_ngd_xfer_msg_sync(struct slim_controller *ctrl,
 				       struct slim_msg_txn *txn)
 {
 	DECLARE_COMPLETION_ONSTACK(done);
-	int ret, timeout;
+	int ret;
+	unsigned long time_left;
 
 	ret = pm_runtime_get_sync(ctrl->dev);
 	if (ret < 0)
@@ -929,8 +931,8 @@ static int qcom_slim_ngd_xfer_msg_sync(struct slim_controller *ctrl,
 	if (ret)
 		goto pm_put;
 
-	timeout = wait_for_completion_timeout(&done, HZ);
-	if (!timeout) {
+	time_left = wait_for_completion_timeout(&done, HZ);
+	if (!time_left) {
 		dev_err(ctrl->dev, "TX timed out:MC:0x%x,mt:0x%x", txn->mc,
 				txn->mt);
 		ret = -ETIMEDOUT;
@@ -1169,11 +1171,12 @@ static int qcom_slim_ngd_power_up(struct qcom_slim_ngd_ctrl *ctrl)
 	enum qcom_slim_ngd_state cur_state = ctrl->state;
 	struct qcom_slim_ngd *ngd = ctrl->ngd;
 	u32 laddr, rx_msgq;
-	int timeout, ret = 0;
+	int ret = 0;
+	unsigned long time_left;
 
 	if (ctrl->state == QCOM_SLIM_NGD_CTRL_DOWN) {
-		timeout = wait_for_completion_timeout(&ctrl->qmi.qmi_comp, HZ);
-		if (!timeout)
+		time_left = wait_for_completion_timeout(&ctrl->qmi.qmi_comp, HZ);
+		if (!time_left)
 			return -EREMOTEIO;
 	}
 
@@ -1218,8 +1221,8 @@ static int qcom_slim_ngd_power_up(struct qcom_slim_ngd_ctrl *ctrl)
 				ngd->base + NGD_RX_MSGQ_CFG);
 	qcom_slim_ngd_setup(ctrl);
 
-	timeout = wait_for_completion_timeout(&ctrl->reconf, HZ);
-	if (!timeout) {
+	time_left = wait_for_completion_timeout(&ctrl->reconf, HZ);
+	if (!time_left) {
 		dev_err(ctrl->dev, "capability exchange timed-out\n");
 		return -ETIMEDOUT;
 	}
-- 
2.43.0

