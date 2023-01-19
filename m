Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C5DD0673290
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Jan 2023 08:35:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6008E7131;
	Thu, 19 Jan 2023 08:34:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6008E7131
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674113723;
	bh=QNqCGqy7oOHaUpzWBbZafswn3J9kXKRvXI3Zf84+HzQ=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=NHQ83TFnuGMpPjnOWhWjXyqD9h8stSAhru41BJ7A4pMb6og2t4o8QBQnePVfNuXLi
	 OAdgI3sIERV5lM944KYoK4sen1GHKDdSVlXx3RPrLgaYXSxexRz9Rruet6VCkzUwno
	 NRgQpwTCwih8aoXVsla+ewujDy89YZaTGC+ZmpYM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AB348F80083;
	Thu, 19 Jan 2023 08:34:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 45DE6F8047B; Thu, 19 Jan 2023 08:34:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 02D78F8024D
 for <alsa-devel@alsa-project.org>; Thu, 19 Jan 2023 08:34:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 02D78F8024D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key, unprotected) header.d=tq-group.com
 header.i=@tq-group.com header.a=rsa-sha256 header.s=key1 header.b=iL9AnlYQ; 
 dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com
 header.a=rsa-sha256 header.s=key1 header.b=Uk88ARAj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1674113662; x=1705649662;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=s94IzfBcezUwrrXvkeXbHYzla1KnXTUynqvpSNJ59RI=;
 b=iL9AnlYQofjPaJWQ8kyuG3X1dRW1KZwSpcy52CqQ3qlOApnWd/ka3W6q
 R+96dA2jvAhR48dcEXazuDOrksagzlDWNYm8JQPwiDuLmz6lFpGfL5HP0
 iFBhdRC4sMW22o/AcjCFUavpVGfq2YiixFFHNZL0SQeS04ab/lXvhqvgx
 71Hq20KcqFPBa4M2s9VF/FVitBJ1lJHdusqZXe7ucn7FXPDqOQDHMgf9/
 zFegG5/i0qxdSVx2/Wjhk1hy4mxnOnRLBZR3iSbYNsPaEqq92cKnpioPC
 7OMurBhtyn6l0L/su1RWrxq3KJ2L+UrHYIKPGEv3nFKZdUNYp2yYba8M6 g==;
X-IronPort-AV: E=Sophos;i="5.97,228,1669071600"; d="scan'208";a="28520959"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 19 Jan 2023 08:34:20 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Thu, 19 Jan 2023 08:34:20 +0100
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Thu, 19 Jan 2023 08:34:20 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1674113660; x=1705649660;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=s94IzfBcezUwrrXvkeXbHYzla1KnXTUynqvpSNJ59RI=;
 b=Uk88ARAj4LAJjXbqgehHSp08D5NjYOd82SLwdcb7QLhxQf+8l5fULH2w
 jUlknjpLUxLXfVXgNSyy5NHsb1PYKmH0ePb2/4Gj6EJDVY4rmhWNRvfeo
 cdNB8BRb0u90yMwcqn9k9UYiTU6IscLDoZiyu93pvDgQWHNc58qN6Cufa
 /+NMTLS3ZK7xQWxovMebD+2yASNoYNcAYqUHmnsRjnhwRc5iR3yjvslki
 SF+xxj8HNonlA+sI10ZjcV/rlWx7iaI2UksR2rVC7uX56MqlTdAvTWE5U
 Aea3vrDVeW1BQW2fLAGgR1dADhYp/qfNMLgIOAW0Gk0vEdbymOdD8PG3g A==;
X-IronPort-AV: E=Sophos;i="5.97,228,1669071600"; d="scan'208";a="28520958"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 19 Jan 2023 08:34:19 +0100
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 7508A280056;
 Thu, 19 Jan 2023 08:34:19 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH 1/1] ASoC: imx-hdmi: Use dev_err_probe
Date: Thu, 19 Jan 2023 08:34:16 +0100
Message-Id: <20230119073416.3064918-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

This silences -517 errors and helps figuring out why the device probe
is deferred.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 sound/soc/fsl/imx-hdmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/fsl/imx-hdmi.c b/sound/soc/fsl/imx-hdmi.c
index a780cf5a65ffa..b6cc7e6c2a320 100644
--- a/sound/soc/fsl/imx-hdmi.c
+++ b/sound/soc/fsl/imx-hdmi.c
@@ -202,7 +202,7 @@ static int imx_hdmi_probe(struct platform_device *pdev)
 	snd_soc_card_set_drvdata(&data->card, data);
 	ret = devm_snd_soc_register_card(&pdev->dev, &data->card);
 	if (ret) {
-		dev_err(&pdev->dev, "snd_soc_register_card failed (%d)\n", ret);
+		dev_err_probe(&pdev->dev, ret, "snd_soc_register_card failed\n");
 		goto fail;
 	}
 
-- 
2.34.1

