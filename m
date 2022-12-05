Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B67D644512
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Dec 2022 14:56:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E4BE118C2;
	Tue,  6 Dec 2022 14:55:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E4BE118C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670334989;
	bh=842QCpsTxGXPZfAW5OBCkqtVxLhgLWi4RC+FIW7vuvM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GclFW3+IyqhVrtgprm2mS4Xjnu+eVhMEchdpVjswVFF5GlpjiTDeCJJfurCXyCwpu
	 BHlQELiyokR9PuVrhhuBtcXT913Bvp+7N95xdQpnGySqSDMf4KDb3/fdr/DLw2qe1U
	 fSLWossuPbuKekEiiGdSE/kgj4fGrfmG8/EDvk/4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 95601F805B2;
	Tue,  6 Dec 2022 14:53:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 14077F80155; Mon,  5 Dec 2022 03:22:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D7376F800BD
 for <alsa-devel@alsa-project.org>; Mon,  5 Dec 2022 03:22:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D7376F800BD
Received: from kwepemm600017.china.huawei.com (unknown [172.30.72.56])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4NQS3j1s7BzRpj3;
 Mon,  5 Dec 2022 10:21:53 +0800 (CST)
Received: from zelda.huawei.com (10.175.103.14) by
 kwepemm600017.china.huawei.com (7.193.23.234) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 5 Dec 2022 10:22:39 +0800
From: Wang Jingjin <wangjingjin1@huawei.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <heiko@sntech.de>, <sugar.zhang@rock-chips.com>,
 <alsa-devel@alsa-project.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] ASoC: rockchip: spdif: Add missing clk_disable_unprepare() in
 rockchip_pdm_runtime_resume()
Date: Mon, 5 Dec 2022 10:43:17 +0800
Message-ID: <20221205024317.2422223-1-wangjingjin1@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.103.14]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemm600017.china.huawei.com (7.193.23.234)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 06 Dec 2022 14:53:23 +0100
Cc: wangjingjin1@huawei.com
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

The clk_disable_unprepare() should be called in the error handling of
rockchip_pdm_runtime_resume().

Fixes: fc05a5b22253 ("ASoC: rockchip: add support for pdm controller")
Signed-off-by: Wang Jingjin <wangjingjin1@huawei.com>
---
 sound/soc/rockchip/rockchip_pdm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/rockchip/rockchip_pdm.c b/sound/soc/rockchip/rockchip_pdm.c
index a7549f827235..5b1e47bdc376 100644
--- a/sound/soc/rockchip/rockchip_pdm.c
+++ b/sound/soc/rockchip/rockchip_pdm.c
@@ -431,6 +431,7 @@ static int rockchip_pdm_runtime_resume(struct device *dev)

 	ret = clk_prepare_enable(pdm->hclk);
 	if (ret) {
+		clk_disable_unprepare(pdm->clk);
 		dev_err(pdm->dev, "hclock enable failed %d\n", ret);
 		return ret;
 	}
--
2.25.1

