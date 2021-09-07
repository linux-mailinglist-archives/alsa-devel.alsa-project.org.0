Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DDF4402779
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Sep 2021 12:58:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 836771736;
	Tue,  7 Sep 2021 12:57:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 836771736
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631012303;
	bh=Jm88sfe1GGzHrCidZ7wKp4nhB+CrqcpyJpFay7r2WIM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=mf0Zq2+mIRZbP0QpiYvy8EworIhLfYJuUHjqzTjse9Da8Yj+rq7qFnBWqkOWNgiYE
	 MMllGp6rLjkFzglln9UrZH7NrnuxT6dicUc7I56SXfG2vwlQn37KPdrUHOHNme4C89
	 UnmOugePQJQYUT6jAXmZesrVEEOjGjntPkIhSmbU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EBE2FF800BC;
	Tue,  7 Sep 2021 12:57:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 165FBF80224; Tue,  7 Sep 2021 12:56:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E2FBFF80217
 for <alsa-devel@alsa-project.org>; Tue,  7 Sep 2021 12:56:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2FBFF80217
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="hBnCU/tu"
Received: by mail-wr1-x42d.google.com with SMTP id d6so13123936wrc.11
 for <alsa-devel@alsa-project.org>; Tue, 07 Sep 2021 03:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Jf2SWVGaNmOrOjfVQv/T4Tpx94jOzzs6milpHwoyx9I=;
 b=hBnCU/tuN3jguOyrT+1udXl5wHXyM+y4SeMQfmVECFk39N7zAPTo7oQWWFLD0o0hls
 aOhJqUwsv9h0cS4HtPAG7ryCkJwUo1e6piyDzOT5FjkMAAT/25j8u7qla4kBpuw9oE1w
 fKjqUfB9yF6Y4f6jMbpY6U6fsfrgsAkMNwq/qavoxARxOWmPcT1melIcf5rgsdj63T+f
 DgVu9f/5B/zwWFToKa1xy+M4d28EabK0oQ4kqOK1mjveVA3457k6QgX8KKmatX3tW00T
 8tL09h9rueQ5F98YThsKZHZo3EbPXF8yr8Crh4vCaXnPARIj4pf8eJ3lqdnXPvPurlOl
 HyMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Jf2SWVGaNmOrOjfVQv/T4Tpx94jOzzs6milpHwoyx9I=;
 b=r0vnDXrxjCbimjAzJClpl5VQff6Bg2km+Z2oVtkSjqCdRMP/Attl+FY8HKKybr3Rfo
 ol++tYO5JXxSYMFNWL6cTgWPtI2ma8/mXyIQy5XUWpCfzh7DUgVxO/I0MaAtJ1A+T6rA
 fI/2hlyTs6hbUnxx9s/HT3ZeXs4sMnjZCPrt2oxjgrn58TJXAjUff/Ba0m937AaLs6Gc
 TIuLUuYq06ayufhEfmlwib8QT6ieMwpQebHZ/ZkzoamW/QK6ofdC6SCBqfklybtPtffe
 bJPdcNAbRYXhXg+utKDfVOcopIj9rElINEdYNEXSab2M/FTadt2l7wNt4AioEqbQ0Maz
 qidw==
X-Gm-Message-State: AOAM533/SK+Jn6oQu61VzhI8hkfNE5Vm6JZPI1Ps06f1mpHJNVDKhaND
 KC0uo8pA/TnmhbW6mossvk5TQg==
X-Google-Smtp-Source: ABdhPJyjDIF2vdnP0upc775RB0EE3BjACLiY3q5D5UHZXXm4SR3RMHUxHSoorkMInTA1rSpoXSjEEA==
X-Received: by 2002:adf:9003:: with SMTP id h3mr17956872wrh.75.1631012207773; 
 Tue, 07 Sep 2021 03:56:47 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id v62sm2042052wme.21.2021.09.07.03.56.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 03:56:47 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: vkoul@kernel.org,
	yung-chuan.liao@linux.intel.com
Subject: [PATCH] soundwire: qcom: add debugfs entry for soundwire register dump
Date: Tue,  7 Sep 2021 11:56:36 +0100
Message-Id: <20210907105636.3171-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: sanyog.r.kale@intel.com, pierre-louis.bossart@linux.intel.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

For debug purposes add an entry in debugfs to dump Qualcomm
SoundWire Controller registers.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/soundwire/qcom.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 0ef79d60e88e..a317bea2d42d 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -7,6 +7,7 @@
 #include <linux/io.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/debugfs.h>
 #include <linux/of.h>
 #include <linux/of_irq.h>
 #include <linux/of_device.h>
@@ -83,6 +84,7 @@
 #define SWRM_DP_PORT_HCTRL_BANK(n, m)	(0x1134 + 0x100 * (n - 1) + 0x40 * m)
 #define SWRM_DP_BLOCK_CTRL3_BANK(n, m)	(0x1138 + 0x100 * (n - 1) + 0x40 * m)
 #define SWRM_DIN_DPn_PCM_PORT_CTRL(n)	(0x1054 + 0x100 * (n - 1))
+#define SWR_MSTR_MAX_REG_ADDR		(0x1740)
 
 #define SWRM_DP_PORT_CTRL_EN_CHAN_SHFT				0x18
 #define SWRM_DP_PORT_CTRL_OFFSET2_SHFT				0x10
@@ -127,6 +129,9 @@ struct qcom_swrm_ctrl {
 	struct device *dev;
 	struct regmap *regmap;
 	void __iomem *mmio;
+#ifdef CONFIG_DEBUG_FS
+	struct dentry *debugfs;
+#endif
 	struct completion broadcast;
 	struct completion enumeration;
 	struct work_struct slave_work;
@@ -1192,6 +1197,22 @@ static int qcom_swrm_get_port_config(struct qcom_swrm_ctrl *ctrl)
 	return 0;
 }
 
+#ifdef CONFIG_DEBUG_FS
+static int swrm_reg_show(struct seq_file *s_file, void *data)
+{
+	struct qcom_swrm_ctrl *swrm = s_file->private;
+	int reg, reg_val;
+
+	for (reg = 0; reg <= SWR_MSTR_MAX_REG_ADDR; reg += 4) {
+		swrm->reg_read(swrm, reg, &reg_val);
+		seq_printf(s_file, "0x%.3x: 0x%.2x\n", reg, reg_val);
+	}
+
+	return 0;
+}
+DEFINE_SHOW_ATTRIBUTE(swrm_reg);
+#endif
+
 static int qcom_swrm_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -1302,6 +1323,12 @@ static int qcom_swrm_probe(struct platform_device *pdev)
 		 (ctrl->version >> 24) & 0xff, (ctrl->version >> 16) & 0xff,
 		 ctrl->version & 0xffff);
 
+#ifdef CONFIG_DEBUG_FS
+	ctrl->debugfs = debugfs_create_dir("qualcomm-sdw", ctrl->bus.debugfs);
+	debugfs_create_file("qualcomm-registers", 0400, ctrl->debugfs, ctrl,
+			    &swrm_reg_fops);
+#endif
+
 	return 0;
 
 err_master_add:
-- 
2.21.0

