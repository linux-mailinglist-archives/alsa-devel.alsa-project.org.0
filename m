Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CB64114ED4
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Dec 2019 11:13:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C7B6C166C;
	Fri,  6 Dec 2019 11:12:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C7B6C166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575627227;
	bh=7aSuEaSwcmgeh48stExdrXoW4oYGnMgtW2w22yk8WYc=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Jr0RqsKdnqkoOtLXz19mud2aqQx+dVU+4DMJqzslWlNnQ9qKBjOO3wt7DMY5dE19c
	 2XTqCVnVkkfnFUFzp9hx6Vf+LmT5sKegIQg0WsX3wotlxtnco3bNQIjaiXGigxRWwM
	 XrZVQdbWgCv7GI5msXnnK4Kvfwj0ZE2nNEft0oxE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E5950F80266;
	Fri,  6 Dec 2019 11:08:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9BB9CF80216; Fri,  6 Dec 2019 03:49:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqemgate16.nvidia.com (hqemgate16.nvidia.com [216.228.121.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BAD32F801F9
 for <alsa-devel@alsa-project.org>; Fri,  6 Dec 2019 03:49:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BAD32F801F9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="cojyUFS2"
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5de9c1aa0001>; Thu, 05 Dec 2019 18:49:14 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Thu, 05 Dec 2019 18:49:10 -0800
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Thu, 05 Dec 2019 18:49:10 -0800
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 6 Dec
 2019 02:49:10 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via
 Frontend Transport; Fri, 6 Dec 2019 02:49:10 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.163.171]) by
 rnnvemgw01.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5de9c1a40002>; Thu, 05 Dec 2019 18:49:09 -0800
From: Sowjanya Komatineni <skomatineni@nvidia.com>
To: <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
 <jonathanh@nvidia.com>, <digetx@gmail.com>, <mperttunen@nvidia.com>,
 <gregkh@linuxfoundation.org>, <sboyd@kernel.org>, <tglx@linutronix.de>,
 <robh+dt@kernel.org>, <mark.rutland@arm.com>
Date: Thu, 5 Dec 2019 18:48:49 -0800
Message-ID: <1575600535-26877-10-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1575600535-26877-1-git-send-email-skomatineni@nvidia.com>
References: <1575600535-26877-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1575600555; bh=QpuTCwWQ7OA+cLjLXqsb+rGtt5ndNflALwObfnlfPq8=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:X-NVConfidentiality:MIME-Version:
 Content-Type;
 b=cojyUFS2tKje+kPVeDyds/3HD82HQ0sRmRNmatwG60gi6wlvjAU6NYzeJpS1NteMD
 0sLPPn0JNbRGgsqjJlMCWPYpUe0LCvhXAVOtOfurLVVXMJt8gdnUQApnp2kl48r9X5
 2y4E8YpWtNBqgqR3e52V9gxHA5hjDRV6nKNuZVYzlbuW10esyHWRJqqL/2Tgb23fLt
 1qlxpQcWIH0v5o/quppnK1wQifJx55xGMVNUcMKrvHXZxwbUTe99w6NlFn4tDip921
 n4i52QvZ6ltEpkNOeCRo8+wiTlkc68nczuD3y6iuNlIi65H+DSOgtoshje8X9Ht+/V
 j/1Raw4Xsg5hA==
X-Mailman-Approved-At: Fri, 06 Dec 2019 11:07:58 +0100
Cc: alsa-devel@alsa-project.org, pgaikwad@nvidia.com, spujar@nvidia.com,
 linux-kernel@vger.kernel.org, josephl@nvidia.com, linux-clk@vger.kernel.org,
 arnd@arndb.de, daniel.lezcano@linaro.org, krzk@kernel.org,
 mturquette@baylibre.com, devicetree@vger.kernel.org, mmaddireddy@nvidia.com,
 markz@nvidia.com, alexios.zavras@intel.com, broonie@kernel.org,
 linux-tegra@vger.kernel.org, horms+renesas@verge.net.au, tiwai@suse.com,
 allison@lohutok.net, pdeschrijver@nvidia.com, lgirdwood@gmail.com,
 vidyas@nvidia.com, Jisheng.Zhang@synaptics.com
Subject: [alsa-devel] [PATCH v3 09/15] ASoC: tegra: Add fallback for audio
	mclk
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

mclk is from clk_out_1 which is part of Tegra PMC block and pmc clocks
are moved to Tegra PMC driver with pmc as clock provider and using pmc
clock ids.

New device tree uses clk_out_1 from pmc clock provider.

So, this patch adds fallback to extern1 in case of retrieving mclk fails
to be backward compatible of new device tree with older kernels.

Cc: stable@vger.kernel.org

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 sound/soc/tegra/tegra_asoc_utils.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/sound/soc/tegra/tegra_asoc_utils.c b/sound/soc/tegra/tegra_asoc_utils.c
index 8e3a3740df7c..f7408d5240c0 100644
--- a/sound/soc/tegra/tegra_asoc_utils.c
+++ b/sound/soc/tegra/tegra_asoc_utils.c
@@ -211,8 +211,14 @@ int tegra_asoc_utils_init(struct tegra_asoc_utils_data *data,
 	data->clk_cdev1 = clk_get(dev, "mclk");
 	if (IS_ERR(data->clk_cdev1)) {
 		dev_err(data->dev, "Can't retrieve clk cdev1\n");
-		ret = PTR_ERR(data->clk_cdev1);
-		goto err_put_pll_a_out0;
+		data->clk_cdev1 = clk_get_sys("clk_out_1", "extern1");
+		if (IS_ERR(data->clk_cdev1)) {
+			dev_err(data->dev, "Can't retrieve clk extern1\n");
+			ret = PTR_ERR(data->clk_cdev1);
+			goto err_put_pll_a_out0;
+		}
+
+		dev_err(data->dev, "Falling back to extern1\n");
 	}
 
 	/*
-- 
2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
