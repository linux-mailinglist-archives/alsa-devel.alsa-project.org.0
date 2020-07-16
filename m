Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C56F02226A8
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Jul 2020 17:16:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4FCC81660;
	Thu, 16 Jul 2020 17:16:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4FCC81660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594912614;
	bh=Gn51r1XxHa8bpgRq9ol2CsixNUIj9qTNWpj0NKzxYVI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=n4inC1ii4+7AprmaI53I+R+mqlqSqFSCyuUo3F9rC56rnxXEZiD/LJWR0Nsr0wlVX
	 doNZtej1ANRKEsui/x7nf6oZr2GI5udNwjTeHGXEHPFWDpxSTML7L8OyqjPvEQzRIC
	 wGxlAJLxf9/zGwRGyTBv4nUJUozftm6bxMykCkKo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 12991F8014E;
	Thu, 16 Jul 2020 17:15:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F3D67F8026A; Thu, 16 Jul 2020 17:15:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1D48BF80110
 for <alsa-devel@alsa-project.org>; Thu, 16 Jul 2020 17:15:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D48BF80110
Received: from xps.home (unknown [IPv6:2a01:e35:2fb5:1510:95f7:ce7f:fb76:c54a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: aferraris)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id AB2852A5297;
 Thu, 16 Jul 2020 16:15:08 +0100 (BST)
From: Arnaud Ferraris <arnaud.ferraris@collabora.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 1/2] ASoC: fsl_asrc: make sure the input and output clocks
 are different
Date: Thu, 16 Jul 2020 17:13:52 +0200
Message-Id: <20200716151352.193451-2-arnaud.ferraris@collabora.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200716151352.193451-1-arnaud.ferraris@collabora.com>
References: <20200716145201.186270-1-arnaud.ferraris@collabora.com>
 <20200716151352.193451-1-arnaud.ferraris@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Arnaud Ferraris <arnaud.ferraris@collabora.com>,
 Timur Tabi <timur@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Nicolin Chen <nicoleotsuka@gmail.com>,
 Mark Brown <broonie@kernel.org>, kernel@collabora.com,
 Shengjiu Wang <shengjiu.wang@gmail.com>
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

The current clock selection algorithm might select the same clock for
both input and output. This can happen when, for instance, the output
sample rate is a multiple of the input rate.

This patch makes sure it always selects distinct input and output
clocks.

Signed-off-by: Arnaud Ferraris <arnaud.ferraris@collabora.com>
---
 sound/soc/fsl/fsl_asrc.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
index 02c81d2e34ad..6d43cab6c885 100644
--- a/sound/soc/fsl/fsl_asrc.c
+++ b/sound/soc/fsl/fsl_asrc.c
@@ -608,8 +608,8 @@ static void fsl_asrc_select_clk(struct fsl_asrc_priv *asrc_priv,
 {
 	struct fsl_asrc_pair_priv *pair_priv = pair->private;
 	struct asrc_config *config = pair_priv->config;
-	int rate[2], select_clk[2]; /* Array size 2 means IN and OUT */
-	int clk_rate, clk_index;
+	int rate[2], select_clk[2], clk_index[2]; /* Array size 2 means IN and OUT */
+	int clk_rate;
 	int i = 0, j = 0;
 
 	rate[IN] = in_rate;
@@ -618,11 +618,12 @@ static void fsl_asrc_select_clk(struct fsl_asrc_priv *asrc_priv,
 	/* Select proper clock source for internal ratio mode */
 	for (j = 0; j < 2; j++) {
 		for (i = 0; i < ASRC_CLK_MAP_LEN; i++) {
-			clk_index = asrc_priv->clk_map[j][i];
-			clk_rate = clk_get_rate(asrc_priv->asrck_clk[clk_index]);
+			clk_index[j] = asrc_priv->clk_map[j][i];
+			clk_rate = clk_get_rate(asrc_priv->asrck_clk[clk_index[j]]);
 			/* Only match a perfect clock source with no remainder */
 			if (clk_rate != 0 && (clk_rate / rate[j]) <= 1024 &&
-			    (clk_rate % rate[j]) == 0)
+			    (clk_rate % rate[j]) == 0 &&
+			    (j == 0 || clk_index[j] != clk_index[j-1]))
 				break;
 		}
 
-- 
2.27.0

