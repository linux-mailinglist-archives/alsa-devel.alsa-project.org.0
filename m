Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A08C3186C5
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Feb 2021 10:21:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BFC9F16FF;
	Thu, 11 Feb 2021 10:20:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BFC9F16FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1613035284;
	bh=UHDIGJlWuaKYN+r0xdv3bWfeq1+wBJOg9T0gax8n/b8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=K3QK6Efybm+O4dPDF7F8/WlgTCBT2w9dEI1msxk02zD18n2HSwvU9+N77vZx+BdHn
	 z1g/9NOfiYbvmm3+D/MoPdIsgXO1w+OHM02S4Yf6Hraa/Qdwu+9iSHjWW+X3QW/rEd
	 KsQ1+d5VXM2ojoLTl+RDTg++QiVK9B2uUhdnwGxw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EA35FF80264;
	Thu, 11 Feb 2021 10:19:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F2637F8022B; Mon,  8 Feb 2021 04:52:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 32B4EF8013A
 for <alsa-devel@alsa-project.org>; Mon,  8 Feb 2021 04:51:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 32B4EF8013A
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DYsVW2bxKzlGtG;
 Mon,  8 Feb 2021 11:50:11 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.498.0; Mon, 8 Feb 2021 11:51:50 +0800
From: Tian Tao <tiantao6@hisilicon.com>
To: <timur@kernel.org>, <nicoleotsuka@gmail.com>, <Xiubo.Lee@gmail.com>,
 <perex@perex.cz>, <tiwai@suse.com>, <shawnguo@kernel.org>,
 <s.hauer@pengutronix.de>
Subject: [PATCH] ASoC: imx-hdmi: no need to set .owner when using
 module_platform_driver
Date: Mon, 8 Feb 2021 11:51:27 +0800
Message-ID: <1612756287-4601-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Thu, 11 Feb 2021 10:19:40 +0100
Cc: alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
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

the module_platform_driver will call platform_driver_register.
and It will set the .owner to THIS_MODULE

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
---
 sound/soc/fsl/imx-hdmi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/fsl/imx-hdmi.c b/sound/soc/fsl/imx-hdmi.c
index dbbb7618..cd0235a 100644
--- a/sound/soc/fsl/imx-hdmi.c
+++ b/sound/soc/fsl/imx-hdmi.c
@@ -223,7 +223,6 @@ MODULE_DEVICE_TABLE(of, imx_hdmi_dt_ids);
 static struct platform_driver imx_hdmi_driver = {
 	.driver = {
 		.name = "imx-hdmi",
-		.owner = THIS_MODULE,
 		.pm = &snd_soc_pm_ops,
 		.of_match_table = imx_hdmi_dt_ids,
 	},
-- 
2.7.4

