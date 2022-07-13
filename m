Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CCFE573641
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Jul 2022 14:23:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 21D4A16F8;
	Wed, 13 Jul 2022 14:22:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 21D4A16F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657715014;
	bh=iX/fdolmY2DXohnnzRSIwIpmON6mHURWxVhthgC0Z48=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=gnTPsUtAT1rtdwVXLMe62C3Nw3by9VrMjy9gfVMb36a7wFwpu2UXpP+cIXVc0ySqO
	 7GvS8Ma+VIxx6TW4ikQR3w7EOrXVVfu5FvlKVCdEzkJaAbzkWsBrWpmC6YNOf7WpHX
	 wTwcWCA0shK+BYjwt5OT0G59Bw00DO91ECr4sW+4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 94796F800AA;
	Wed, 13 Jul 2022 14:22:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7B0BEF80134; Wed, 13 Jul 2022 14:22:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 (using TLSv1.2 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 077C1F80134
 for <alsa-devel@alsa-project.org>; Wed, 13 Jul 2022 14:22:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 077C1F80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=quicinc.com header.i=@quicinc.com
 header.b="pxaBXbgL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1657714946; x=1689250946;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=VjPPJFpanEpj7EenUOLrvBNZWNf0gumX0k4X7udiVEg=;
 b=pxaBXbgLxuiDg+PnziwGZMmd3pnPy/3fxAB7HxZo7LjD5SHnkGwcGsjC
 W9+A9/72WP0TK64l+nKmM8xXT/2aQvu4eJHDCI5eEJ01mDU1UXEdnK/D4
 Zc2ZyuZhPTAcq6UOIfwEDsz9gHnkN70dM50PulW60x1oLgbqFvpbHzgkg M=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 13 Jul 2022 05:22:21 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2022 05:22:20 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 13 Jul 2022 05:22:20 -0700
Received: from hu-srivasam-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 13 Jul 2022 05:22:14 -0700
From: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
To: <vkoul@kernel.org>, <agross@kernel.org>, <bjorn.andersson@linaro.org>,
 <lgirdwood@gmail.com>, <broonie@kernel.org>, <robh+dt@kernel.org>,
 <quic_plai@quicinc.com>, <bgoswami@quicinc.com>, <perex@perex.cz>,
 <tiwai@suse.com>, <srinivas.kandagatla@linaro.org>,
 <quic_rohkumar@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
 <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <swboyd@chromium.org>,
 <judyhsiao@chromium.org>
Subject: [PATCH] soundwire: qcom: Update error prints to debug prints
Date: Wed, 13 Jul 2022 17:52:01 +0530
Message-ID: <1657714921-28072-1-git-send-email-quic_srivasam@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Cc: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
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

Upadte error prints to debug prints to avoid redundant logging in kernel
boot time, as these prints are informative prints in irq handler.

Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
---
 drivers/soundwire/qcom.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 9df970e..a4293d0 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -573,11 +573,10 @@ static irqreturn_t qcom_swrm_irq_handler(int irq, void *dev_id)
 				break;
 			case SWRM_INTERRUPT_STATUS_NEW_SLAVE_ATTACHED:
 			case SWRM_INTERRUPT_STATUS_CHANGE_ENUM_SLAVE_STATUS:
-				dev_err_ratelimited(swrm->dev, "%s: SWR new slave attached\n",
-					__func__);
+				dev_dbg(swrm->dev, "%s: SWR new slave attached\n", __func__);
 				swrm->reg_read(swrm, SWRM_MCP_SLV_STATUS, &slave_status);
 				if (swrm->slave_status == slave_status) {
-					dev_err(swrm->dev, "Slave status not changed %x\n",
+					dev_dbg(swrm->dev, "Slave status not changed %x\n",
 						slave_status);
 				} else {
 					qcom_swrm_get_device_status(swrm);
-- 
2.7.4

