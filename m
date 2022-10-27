Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 692CE60F3D2
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Oct 2022 11:38:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0246128F5;
	Thu, 27 Oct 2022 11:37:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0246128F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666863499;
	bh=1AeRpLKsggfCeZnoBPLQJZizOfvIpEswbQA0a2UvKLQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KLugBXqJNnvdp/kqH//oeuM4rgmhxlgRJ7DhECMlMerfwaxgO0Uug9oVzcQYU2Wap
	 fG0QfvE9Zw8lEhteQfkW/jjlVziCRQuDMGCVyMYqIEYrptws2t6rPgG7kCJeUMiSLZ
	 yYdQe/Bp8Xe4joxxGTdDVth/8qJOFcpn2XUI3MWM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 66269F80496;
	Thu, 27 Oct 2022 11:37:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6A793F8025E; Thu, 27 Oct 2022 11:37:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A0176F80100
 for <alsa-devel@alsa-project.org>; Thu, 27 Oct 2022 11:37:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A0176F80100
Received: from kwepemi500015.china.huawei.com (unknown [172.30.72.55])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MygV15FsgzpW54;
 Thu, 27 Oct 2022 17:33:45 +0800 (CST)
Received: from huawei.com (10.175.127.227) by kwepemi500015.china.huawei.com
 (7.221.188.92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Thu, 27 Oct
 2022 17:37:11 +0800
From: Zheng Bin <zhengbin13@huawei.com>
To: <srinivas.kandagatla@linaro.org>, <gregkh@linuxfoundation.org>,
 <krzysztof.kozlowski@linaro.org>, <alsa-devel@alsa-project.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH -next] slimbus: qcom-ngd: Fix build error when
 CONFIG_SLIM_QCOM_NGD_CTRL=y && CONFIG_QCOM_RPROC_COMMON=m
Date: Thu, 27 Oct 2022 17:59:04 +0800
Message-ID: <20221027095904.3388959-1-zhengbin13@huawei.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemi500015.china.huawei.com (7.221.188.92)
X-CFilter-Loop: Reflected
Cc: zhengbin13@huawei.com
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

If CONFIG_SLIM_QCOM_NGD_CTRL=y, CONFIG_QCOM_RPROC_COMMON=m, COMPILE_TEST=y,
bulding fails:

drivers/slimbus/qcom-ngd-ctrl.o: In function `qcom_slim_ngd_ctrl_probe':
qcom-ngd-ctrl.c:(.text+0x330): undefined reference to `qcom_register_ssr_notifier'
qcom-ngd-ctrl.c:(.text+0x5fc): undefined reference to `qcom_unregister_ssr_notifier'
drivers/slimbus/qcom-ngd-ctrl.o: In function `qcom_slim_ngd_remove':
qcom-ngd-ctrl.c:(.text+0x90c): undefined reference to `qcom_unregister_ssr_notifier'

Make SLIM_QCOM_NGD_CTRL depends on QCOM_RPROC_COMMON || (COMPILE_TEST && !QCOM_RPROC_COMMON) to fix this.

Fixes: e291691c6977 ("slimbus: qcom-ngd-ctrl: allow compile testing without QCOM_RPROC_COMMON")
Signed-off-by: Zheng Bin <zhengbin13@huawei.com>
---
 drivers/slimbus/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/slimbus/Kconfig b/drivers/slimbus/Kconfig
index 2ed821f75816..a0fdf9d792cb 100644
--- a/drivers/slimbus/Kconfig
+++ b/drivers/slimbus/Kconfig
@@ -23,7 +23,7 @@ config SLIM_QCOM_CTRL
 config SLIM_QCOM_NGD_CTRL
 	tristate "Qualcomm SLIMbus Satellite Non-Generic Device Component"
 	depends on HAS_IOMEM && DMA_ENGINE && NET
-	depends on QCOM_RPROC_COMMON || COMPILE_TEST
+	depends on QCOM_RPROC_COMMON || (COMPILE_TEST && !QCOM_RPROC_COMMON)
 	depends on ARCH_QCOM || COMPILE_TEST
 	select QCOM_QMI_HELPERS
 	select QCOM_PDR_HELPERS
--
2.31.1

