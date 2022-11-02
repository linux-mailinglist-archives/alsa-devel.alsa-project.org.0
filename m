Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D326164DB
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Nov 2022 15:19:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C715A168E;
	Wed,  2 Nov 2022 15:18:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C715A168E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667398750;
	bh=sixAXgLSUk6PRA55YW5IiddF8XXszZ5XlgaiDio2LvY=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qKgz6MwCo+EGo0XtGwzzN7BnOJj+26kQd1ekoIYH09eOrmmvyhEsvMyZWJ4qRi+FI
	 D2Feld9XANMyPNa34QcN+fwRyEVIkxQTKv6+z9PAvpGfuN4KwGl+yYI/3XUAojHzN0
	 89+6MJeA9Twc2S2pIlP/aGYs/xIfmQjuTv1kKR4M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F1815F80552;
	Wed,  2 Nov 2022 15:17:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2B41EF8026D; Wed,  2 Nov 2022 15:08:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS,URIBL_ZEN_BLOCKED_OPENDNS autolearn=disabled
 version=3.4.0
Received: from mxct.zte.com.cn (mxct.zte.com.cn [183.62.165.209])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0748FF801D5
 for <alsa-devel@alsa-project.org>; Wed,  2 Nov 2022 15:08:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0748FF801D5
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mxct.zte.com.cn (FangMail) with ESMTPS id 4N2TJF3w9Wz4y3Zl;
 Wed,  2 Nov 2022 22:08:29 +0800 (CST)
Received: from xaxapp01.zte.com.cn ([10.88.40.50])
 by mse-fl1.zte.com.cn with SMTP id 2A2E8NHA021607;
 Wed, 2 Nov 2022 22:08:23 +0800 (+08)
 (envelope-from zhang.songyi@zte.com.cn)
Received: from mapi (xaxapp01[null]) by mapi (Zmail) with MAPI id mid31;
 Wed, 2 Nov 2022 22:08:27 +0800 (CST)
Date: Wed, 2 Nov 2022 22:08:27 +0800 (CST)
X-Zmail-TransId: 2af9636279db19c123a6
X-Mailer: Zmail v1.0
Message-ID: <202211022208274530566@zte.com.cn>
Mime-Version: 1.0
From: <zhang.songyi@zte.com.cn>
To: <agross@kernel.org>
Subject: =?UTF-8?B?W1BBVENIIGxpbnV4LW5leHRdIHNvdW5kd2lyZTogcWNvbTogcmVtb3ZlIHJlZHVuZGFudCByZXQgdmFyaWFibGU=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL: mse-fl1.zte.com.cn 2A2E8NHA021607
X-Fangmail-Gw-Spam-Type: 0
X-FangMail-Miltered: at cgslv5.04-192.168.251.13.novalocal with ID
 636279DD.005 by FangMail milter!
X-FangMail-Envelope: 1667398109/4N2TJF3w9Wz4y3Zl/636279DD.005/10.5.228.132/[10.5.228.132]/mse-fl1.zte.com.cn/<zhang.songyi@zte.com.cn>
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 636279DD.005/4N2TJF3w9Wz4y3Zl
X-Mailman-Approved-At: Wed, 02 Nov 2022 15:17:26 +0100
Cc: alsa-devel@alsa-project.org, xue.zhihong@zte.com.cn,
 linux-arm-msm@vger.kernel.org, andersson@kernel.org,
 konrad.dybcio@somainline.org, pierre-louis.bossart@linux.intel.com,
 linux-kernel@vger.kernel.org, vkoul@kernel.org, jiang.xuexin@zte.com.cn,
 sanyog.r.kale@intel.com, yung-chuan.liao@linux.intel.com,
 zhang.songyi@zte.com.cn
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

From ebc0be30e0c49d2d54a9aaa064c7f742e99e8eb2 Mon Sep 17 00:00:00 2001
From: zhang songyi <zhang.songyi@zte.com.cn>
Date: Wed, 2 Nov 2022 22:08:48 +0800
Subject: [PATCH linux-next] soundwire: qcom: remove redundant ret variable

Return value from swrm_get_packed_reg_val() directly instead of taking
this in another redundant variable.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: zhang songyi <zhang.songyi@zte.com.cn>
---
 drivers/soundwire/qcom.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 335424870290..d92f421d38c8 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -260,7 +260,6 @@ static int qcom_swrm_cpu_reg_write(struct qcom_swrm_ctrl *ctrl, int reg,
 static u32 swrm_get_packed_reg_val(u8 *cmd_id, u8 cmd_data,
                   u8 dev_addr, u16 reg_addr)
 {
-   u32 val;
    u8 id = *cmd_id;

    if (id != SWR_BROADCAST_CMD_ID) {
@@ -270,9 +269,8 @@ static u32 swrm_get_packed_reg_val(u8 *cmd_id, u8 cmd_data,
            id = 0;
        *cmd_id = id;
    }
-   val = SWRM_REG_VAL_PACK(cmd_data, dev_addr, id, reg_addr);

-   return val;
+   return SWRM_REG_VAL_PACK(cmd_data, dev_addr, id, reg_addr);
 }

 static int swrm_wait_for_rd_fifo_avail(struct qcom_swrm_ctrl *swrm)
--
2.15.2
