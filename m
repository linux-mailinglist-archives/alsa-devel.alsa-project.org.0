Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9754896B5
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Jan 2022 11:49:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AABB31817;
	Mon, 10 Jan 2022 11:48:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AABB31817
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641811753;
	bh=/gudDsab93jbAQSh/4KXXYWFWKyW7+Jo9udoL2OHXYg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=gruX5Q0GvELfSyaJDQcOz4LR1n4rWzMEbJ+FLuCcn0bQJcHCoQOS/0g12yfeUA0F8
	 b1+QgRDdDLGHL8YXRIgwwkRH9aQ8a6WaAcbvdj6zxI6mdkHfxs2rvYeMDmV/MlYnYt
	 ZuLy2QuMeygxxwxRhcIccqqzgfqjmljhxZDV0P70=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1900AF80134;
	Mon, 10 Jan 2022 11:48:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 19EC7F8012E; Mon, 10 Jan 2022 11:48:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9DBCEF80054
 for <alsa-devel@alsa-project.org>; Mon, 10 Jan 2022 11:47:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9DBCEF80054
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="fjmbYiE4"
Received: by mail-pj1-x102e.google.com with SMTP id hv15so5701160pjb.5
 for <alsa-devel@alsa-project.org>; Mon, 10 Jan 2022 02:47:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QoPQbPDSwmhcCclXn3wTkRYXJo86fSVvmFTmCUeMKdo=;
 b=fjmbYiE4EINPTC/2l3ddI5ufeI2VGM2uRQC/awt/KKVrHw48JrS1CryzAMa81x7M1Q
 bp0aScuAqPfZ4J48pityNe35L5ScCqkG+/gNGlTuBG70faN2mMDrU5VWRlOhZ15hSzaJ
 5/MpGAbwqlA4BWayyJhdh8Ef3uRLVOpsC/QFyKuBxNdy7yJU5LduxEM+BPfyt7F7hrmP
 2HcYkUrDumSud+F4/cRa7yH4mOfQv9dE8UDwPzYr6ZsDF1qb4xHkz8iXrkwcyiOQ8PJG
 VyC1JiA11+6RNhiFYERPSZG15252PGD6RW/QuM02buY9bMGC1sazjiKMfRbp0ctvj1wP
 9ndA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QoPQbPDSwmhcCclXn3wTkRYXJo86fSVvmFTmCUeMKdo=;
 b=sqFXKVI6ScQLDlPxY3b1LS/XgLTAQol0LddmDqAfh5XeXgo04AzBr/1Ch3gdDWDbl2
 o5AoZVtAZxTyMhGZq46e3rlA9/MYhvMN9DGQPeO3tZbrDgcQRhzAcG3t2UcMSurBIMeX
 LxhUkLEYF19dQeiujGTtqrZzwyobmdKhnorWZSfzmIJsOd0VRujkPnx+BiPMLOrSi8ve
 O812DJ6m0szRpMRuo59hXgb9PmenuLFg6IHzwusLNDJcw5PbyyFanbs9nrgJGadwJD7b
 uqgRcb1gjNAyAM7uOLWmW0AsX340svg5RiGb1r+FGjtlb12PYJNSnTqCnlYraLSe3VBU
 JuGw==
X-Gm-Message-State: AOAM531/cxizVSx+gnE17l/CvoIppfmAhxUfr16ER6mtGljDwG4MgGYb
 EKD7D54VZ9ftFXwUV1sEC0E=
X-Google-Smtp-Source: ABdhPJw+g4r1x0H35i02mrlXLUcvFmFtV6s2lhQJGIluU3rhzIKyBu7BhAvb7M/NXzDsrqks8doznQ==
X-Received: by 2002:a17:90a:9f95:: with SMTP id
 o21mr15744318pjp.44.1641811673860; 
 Mon, 10 Jan 2022 02:47:53 -0800 (PST)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id h17sm6376122pfv.217.2022.01.10.02.47.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jan 2022 02:47:53 -0800 (PST)
From: cgel.zte@gmail.com
X-Google-Original-From: chi.minghao@zte.com.cn
To: agross@kernel.org
Subject: [PATCH] drivers/soundwire: remove redundant val variable
Date: Mon, 10 Jan 2022 10:47:49 +0000
Message-Id: <20220110104749.646995-1-chi.minghao@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 Zeal Robot <zealci@zte.com.cn>, pierre-louis.bossart@linux.intel.com,
 Minghao Chi <chi.minghao@zte.com.cn>, bjorn.andersson@linaro.org,
 vkoul@kernel.org, CGEL ZTE <cgel.zte@gmail.com>, sanyog.r.kale@intel.com,
 yung-chuan.liao@linux.intel.com, linux-kernel@vger.kernel.org
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

From: Minghao Chi <chi.minghao@zte.com.cn>

Return value from SWRM_REG_VAL_PACK() directly instead
of taking this in another redundant variable.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Minghao Chi <chi.minghao@zte.com.cn>
Signed-off-by: CGEL ZTE <cgel.zte@gmail.com>
---
 drivers/soundwire/qcom.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 54813417ef8e..77f9c90370be 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -235,7 +235,6 @@ static int qcom_swrm_cpu_reg_write(struct qcom_swrm_ctrl *ctrl, int reg,
 static u32 swrm_get_packed_reg_val(u8 *cmd_id, u8 cmd_data,
 				   u8 dev_addr, u16 reg_addr)
 {
-	u32 val;
 	u8 id = *cmd_id;
 
 	if (id != SWR_BROADCAST_CMD_ID) {
@@ -245,9 +244,8 @@ static u32 swrm_get_packed_reg_val(u8 *cmd_id, u8 cmd_data,
 			id = 0;
 		*cmd_id = id;
 	}
-	val = SWRM_REG_VAL_PACK(cmd_data, dev_addr, id, reg_addr);
 
-	return val;
+	return SWRM_REG_VAL_PACK(cmd_data, dev_addr, id, reg_addr);
 }
 
 static int swrm_wait_for_rd_fifo_avail(struct qcom_swrm_ctrl *swrm)
-- 
2.25.1

