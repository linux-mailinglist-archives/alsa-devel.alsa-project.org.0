Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C751C315FAB
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Feb 2021 07:45:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 84C3916E0;
	Wed, 10 Feb 2021 07:44:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 84C3916E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612939545;
	bh=tTTnK0aE1lnVixV29rl6TnF7ThC6CsogswXe9TxGuPY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bI8/+UVD6JOqScMgFFni8pcDDKuogW5dIRdmlaROQJbjnABl+4TJuVLbIkaz4v5KS
	 DaoSCRCE0BYu1AsGJtSfMU3b4vMIjlQsJWPehcTnCvLb7o5yH5CKKJl13jFX1Bhq6q
	 KcPB+N4pVCaO5lUsncRcA26YOvSxgNJPcWIKHFP4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 541B4F8026B;
	Wed, 10 Feb 2021 07:44:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2559BF8026C; Wed, 10 Feb 2021 07:44:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4AD37F8010D
 for <alsa-devel@alsa-project.org>; Wed, 10 Feb 2021 07:44:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4AD37F8010D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="JZ6Lg0QE"
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B602380ae0000>; Tue, 09 Feb 2021 22:43:58 -0800
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 10 Feb
 2021 06:43:58 +0000
Received: from audio.nvidia.com (172.20.145.6) by mail.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Wed, 10 Feb 2021 06:43:54 +0000
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <robh@kernel.org>, <thierry.reding@gmail.com>
Subject: [PATCH 1/3] ASoC: simple-card-utils: Fix device module clock
Date: Wed, 10 Feb 2021 12:13:39 +0530
Message-ID: <1612939421-19900-2-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1612939421-19900-1-git-send-email-spujar@nvidia.com>
References: <1612939421-19900-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1612939438; bh=oIcJTkF8o+UyabRBM1FZyyLrleEGr1F64S3BfjTrJu4=;
 h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
 References:MIME-Version:Content-Type;
 b=JZ6Lg0QEYSGJplep/7/CxpyzFKty52rnRXOW0aZ9E2ZrWjSFfJRKhhJSU9wA73UwW
 58e/wbdB3IqtMpNyaZ7LjHhMz9rJp/Kil7ujR6oRlVpSJlfWq5yXim9zxhcMUqGecf
 iGMVGdPGhxjVcBqOJby6WqIEYlPnZ+d2NSz5a/huC83zAJuR6kaHM3xo8akbzwDzIF
 sORp+eNOTV25o5AUwMkZR7L8qk09+xcnVF2Mk6HOrLklxgeEzScbmR/yTv8pnrA3Aw
 yJHx/6O2r3lZuPYCR3nuC4WSFzcypWi+8lg1qzGrvvAmDHCL7NXsAxSuNwi2ADPvFx
 voXJQ1bdmKx8g==
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kuninori.morimoto.gx@renesas.com, Sameer Pujar <spujar@nvidia.com>,
 linux-kernel@vger.kernel.org, jonathanh@nvidia.com, sharadg@nvidia.com,
 linux-tegra@vger.kernel.org
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

If "clocks = <&xxx>" is specified from the CPU or Codec component
device node, the clock is not getting enabled. Thus audio playback
or capture fails.

Fix this by populating "simple_dai->clk" field when clocks property
is specified from device node as well. Also tidy up by re-organising
conditional statements of parsing logic.

Fixes: bb6fc620c2ed ("ASoC: simple-card-utils: add asoc_simple_card_parse_clk()")
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 sound/soc/generic/simple-card-utils.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
index bc0b62e..0754d70 100644
--- a/sound/soc/generic/simple-card-utils.c
+++ b/sound/soc/generic/simple-card-utils.c
@@ -173,16 +173,15 @@ int asoc_simple_parse_clk(struct device *dev,
 	 *  or device's module clock.
 	 */
 	clk = devm_get_clk_from_child(dev, node, NULL);
-	if (!IS_ERR(clk)) {
-		simple_dai->sysclk = clk_get_rate(clk);
+	if (IS_ERR(clk))
+		clk = devm_get_clk_from_child(dev, dlc->of_node, NULL);
 
+	if (!IS_ERR(clk)) {
 		simple_dai->clk = clk;
-	} else if (!of_property_read_u32(node, "system-clock-frequency", &val)) {
+		simple_dai->sysclk = clk_get_rate(clk);
+	} else if (!of_property_read_u32(node, "system-clock-frequency",
+					 &val)) {
 		simple_dai->sysclk = val;
-	} else {
-		clk = devm_get_clk_from_child(dev, dlc->of_node, NULL);
-		if (!IS_ERR(clk))
-			simple_dai->sysclk = clk_get_rate(clk);
 	}
 
 	if (of_property_read_bool(node, "system-clock-direction-out"))
-- 
2.7.4

