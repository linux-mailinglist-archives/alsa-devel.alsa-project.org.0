Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1654834EB00
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Mar 2021 16:50:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A1CE4169C;
	Tue, 30 Mar 2021 16:49:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A1CE4169C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617115812;
	bh=2Zns+vV39+CKKWCKcjo7dSg2BrW9eYHoY0v/MuA8PUE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Izo5DE1+D/xYB5c0F5v9ITOLsATIKE/bhtF4m51USkjTLSvF/rpQF42H+efEIYYcX
	 xaqY7IGfXRZXe86hJt0sa7aOb7GcUCkIKPPyx3/9DMyOqtLh3/xxK9nAkDtwIV7P02
	 p2JzjjCC7jieB76l5ywUNm7rbnvW85XeNRzlpW+k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E85FF80425;
	Tue, 30 Mar 2021 16:47:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BFDC1F80430; Tue, 30 Mar 2021 16:47:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E01B8F800B9
 for <alsa-devel@alsa-project.org>; Tue, 30 Mar 2021 16:47:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E01B8F800B9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="OPl/oeJN"
Received: by mail-ej1-x62a.google.com with SMTP id a7so25244310ejs.3
 for <alsa-devel@alsa-project.org>; Tue, 30 Mar 2021 07:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iTtGVN1pUyN9IaMWG8AM0yqz3LAm7zkZxHqujW1MyRQ=;
 b=OPl/oeJNk1DkH3MimaRAzXR8S0CUMSUyo2Ud1RE6hDwPmdkI8wMy0A30fs+TS/lPTU
 0Kfu9ZygeGFVfOewRYqG3vD0BFuTRezb/jQpc1hrg3QMKV9PiO5bXp2K1AJVa8mywcwp
 A/aydET0pYuZ+rNkZ0xZGiVgz1H8PfklTGjcWlUXtOJ2Dh1thm4pgT/OHhBp/uUASTHg
 Ot17dpVDByMQJshKvoM/dbWZWbmWodQG7/W66rajHNY0QxL5L9jm3kfMcBfn2Joum+Br
 3N3+B+wUDUcP8N3aOniCFspsPbCSynweGhUTq3HUdNn7UP+wEcWFopF+HS7fZn8SUEuR
 dgnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iTtGVN1pUyN9IaMWG8AM0yqz3LAm7zkZxHqujW1MyRQ=;
 b=Bkm5Agmt4PGXTwaj30fsiX71FYTtVXmsmZadbDRwjuG8oqWNsnHBpCOUt6u0whLA7H
 4Dr9sJ99Q9pbhDykb4eVNEqqVN6C1fbugYr5/i/ChuUmULjMD2vUf7Sqn8FtN/0HUEWG
 blx41JjOihO36A12MkG3mAm8kglv7myHUkqIf1Icd3KETi6mA/4n8y/a2qgcOzTIeA7a
 tYYtUfrzzjEOpRVX6tKmyXxDl1eQIB1g7WfVmOBaDlA9q2X8c4y2YGq9jxKmaS9PdGeH
 hcsUz/gWtr5vRW5GzQ9BtgqZouoX/1DX4AiyG82wRYxsPUhv4Zw5I1uRdy7PEJrqDkuv
 QQeQ==
X-Gm-Message-State: AOAM5315ifc6i0qljdEqWPvVh/KGZOCDlAuKryjYoTgOgHgMD2vGUmNt
 ueBEAeTB1AwUS2SvGIiPIAXd3A==
X-Google-Smtp-Source: ABdhPJxl8V38895yHeOUfSa3zNqLHJrdgpnkU1fUpZY8d5zhQSUcipXXMjCUuuUQPCyj+oAkM/h4qQ==
X-Received: by 2002:a17:906:495a:: with SMTP id
 f26mr32959469ejt.271.1617115652384; 
 Tue, 30 Mar 2021 07:47:32 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id n16sm11520383edr.42.2021.03.30.07.47.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Mar 2021 07:47:31 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: vkoul@kernel.org
Subject: [PATCH v6 3/9] soundwire: qcom: set continue execution flag for
 ignored commands
Date: Tue, 30 Mar 2021 15:47:13 +0100
Message-Id: <20210330144719.13284-4-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210330144719.13284-1-srinivas.kandagatla@linaro.org>
References: <20210330144719.13284-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: robh@kernel.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, linux-kernel@vger.kernel.org,
 sanyog.r.kale@intel.com, yung-chuan.liao@linux.intel.com
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

version 1.5.1 and higher IPs of this controller required to set
continue execution on ignored command flag. This patch sets this flag.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/soundwire/qcom.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index fdcb8ffb4284..edc77d18c245 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -40,6 +40,7 @@
 #define SWRM_CMD_FIFO_CMD					0x308
 #define SWRM_CMD_FIFO_STATUS					0x30C
 #define SWRM_CMD_FIFO_CFG_ADDR					0x314
+#define SWRM_CONTINUE_EXEC_ON_CMD_IGNORE			BIT(31)
 #define SWRM_RD_WR_CMD_RETRIES					0x7
 #define SWRM_CMD_FIFO_RD_FIFO_ADDR				0x318
 #define SWRM_ENUMERATOR_CFG_ADDR				0x500
@@ -343,7 +344,15 @@ static int qcom_swrm_init(struct qcom_swrm_ctrl *ctrl)
 	ctrl->reg_write(ctrl, SWRM_MCP_CFG_ADDR, val);
 
 	/* Configure number of retries of a read/write cmd */
-	ctrl->reg_write(ctrl, SWRM_CMD_FIFO_CFG_ADDR, SWRM_RD_WR_CMD_RETRIES);
+	if (ctrl->version > 0x01050001) {
+		/* Only for versions >= 1.5.1 */
+		ctrl->reg_write(ctrl, SWRM_CMD_FIFO_CFG_ADDR,
+				SWRM_RD_WR_CMD_RETRIES |
+				SWRM_CONTINUE_EXEC_ON_CMD_IGNORE);
+	} else {
+		ctrl->reg_write(ctrl, SWRM_CMD_FIFO_CFG_ADDR,
+				SWRM_RD_WR_CMD_RETRIES);
+	}
 
 	/* Set IRQ to PULSE */
 	ctrl->reg_write(ctrl, SWRM_COMP_CFG_ADDR,
-- 
2.21.0

