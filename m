Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E552BFD18
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Nov 2020 00:44:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8E6AE83A;
	Mon, 23 Nov 2020 00:43:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8E6AE83A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606088682;
	bh=AZdFPVUNq4SIVNRuyRp2N1QXZjW4T9HeGunWRll8u+U=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qHUKsUn4yK1Vlg43NGBVfLS/v37zMxlBeJtsBNV8yc2CvpX2v6E0RyOM4mhky5j5Y
	 Ys/67KEGlLhm5ftcR2WYnFMX/O/uacNK7nxdGAJUtF0SFCSoKMRM3+5lGqrjPOpJPW
	 cXkxJiW0UMJ1fYZPEICgr4ENbymkGF0me/ImswWk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 04AECF80107;
	Mon, 23 Nov 2020 00:43:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0EE27F80165; Mon, 23 Nov 2020 00:43:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 62102F80113
 for <alsa-devel@alsa-project.org>; Mon, 23 Nov 2020 00:43:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 62102F80113
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="AzLWbqDw"
Received: by mail-lf1-x144.google.com with SMTP id s27so1372983lfp.5
 for <alsa-devel@alsa-project.org>; Sun, 22 Nov 2020 15:43:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0noCfj0vZgQAQbBKNAsd1E1O4v9lJKcaIfjgXuNCox4=;
 b=AzLWbqDw0fYIJ3mpQZZmLLrXYJcKQJSAmJ6gyw41pZQbIT4l7YLHbp8p818vG0ITzZ
 WCiShHmhxaH/zhkCURhTUHTI7f6MoR5M1uDTYxpmPj4ZWc+u/N0PTm4c9CXGBlNlNhO9
 VqbakTHAf7uU50kg0adAGUNi7iJlDoEB7Z8Wp4iHK0oFjT3WT7vYFtat3wsHeOJAilRn
 JrJ9zLCRC7wml85GX/fjJZnUO7ZLtf9TC1joUemtOIY+8ZiKeYxK0A/PvReQBnEA9u0D
 agRRbLs8TZP512fyVCNbzW+fs4WxgAnV6eQNiy7lZ2SbVj7dvoA/UNWFFxxXUbq1Z2zH
 /4CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0noCfj0vZgQAQbBKNAsd1E1O4v9lJKcaIfjgXuNCox4=;
 b=Ta33HJK0koWXWujB+09ploLbFf9DGSFTBAW7AL7gURvPTp9oY9NcILCxXvWut1U71p
 Bi6pu2ad0etR6tYsTabSyMaNiQL0zfJ2rE0nR3Kw32OF1emg/RLhKkKVVdz2JQHn2HdD
 Ee/YOx3zzgdEvZIr5WizY5IpV1BpV2oMOcTHgMPkkEFDfLk0QRwCOhPYh5ICDS6zyfe8
 UiOHiNatBhsM9rpABldFHZVJ7+Di0VHSGPdDx3koNrIwjn7xVIQPwCbmHsSmJKZL1fAc
 BrTB42QqYRWxc7rBeAob5QfLoD+1GiR9zeU340TM/+EeK6Bj5zNUtbrTSacb1xl+Ng1q
 lHnQ==
X-Gm-Message-State: AOAM5306WzkBoZVfnUyyVIsbr2Def0Nt2uf3wzSRtlwF8fZme1Xu8B6G
 t2lgAKgGZOAJws4zf9fx7pA=
X-Google-Smtp-Source: ABdhPJyBG/Ci8CgP/v0LPPMaMIk0yJh0DUQxWJZ+pyZt9CahsM05niZEB2yLEBuzH0EkrcS4qfkvhw==
X-Received: by 2002:ac2:563a:: with SMTP id b26mr11593650lff.596.1606088578101; 
 Sun, 22 Nov 2020 15:42:58 -0800 (PST)
Received: from localhost.localdomain (h-158-174-22-6.NA.cust.bahnhof.se.
 [158.174.22.6])
 by smtp.gmail.com with ESMTPSA id p21sm1113743ljj.13.2020.11.22.15.42.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Nov 2020 15:42:57 -0800 (PST)
From: Rikard Falkeborn <rikard.falkeborn@gmail.com>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH] slimbus: qcom-ngd-ctrl: Constify static structs
Date: Mon, 23 Nov 2020 00:42:53 +0100
Message-Id: <20201122234253.34047-1-rikard.falkeborn@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Rikard Falkeborn <rikard.falkeborn@gmail.com>
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

qcom_slim_qmi_msg_handlers[] and qcom_slim_ngd_qmi_svc_event_ops are
only used as input arguments to qmi_handle_init() which accepts const
pointers to both qmi_ops and qmi_msg_handler. Make them const to allow
the compiler to put them in read-only memory.

Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
---
 drivers/slimbus/qcom-ngd-ctrl.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
index d8decb345e9d..ea8f605b5c99 100644
--- a/drivers/slimbus/qcom-ngd-ctrl.c
+++ b/drivers/slimbus/qcom-ngd-ctrl.c
@@ -434,7 +434,7 @@ static int qcom_slim_qmi_send_power_request(struct qcom_slim_ngd_ctrl *ctrl,
 	return 0;
 }
 
-static struct qmi_msg_handler qcom_slim_qmi_msg_handlers[] = {
+static const struct qmi_msg_handler qcom_slim_qmi_msg_handlers[] = {
 	{
 		.type = QMI_RESPONSE,
 		.msg_id = SLIMBUS_QMI_POWER_RESP_V01,
@@ -1309,7 +1309,7 @@ static void qcom_slim_ngd_qmi_del_server(struct qmi_handle *hdl,
 	qmi->svc_info.sq_port = 0;
 }
 
-static struct qmi_ops qcom_slim_ngd_qmi_svc_event_ops = {
+static const struct qmi_ops qcom_slim_ngd_qmi_svc_event_ops = {
 	.new_server = qcom_slim_ngd_qmi_new_server,
 	.del_server = qcom_slim_ngd_qmi_del_server,
 };
-- 
2.29.2

