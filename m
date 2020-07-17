Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A71223985
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jul 2020 12:41:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 54172166E;
	Fri, 17 Jul 2020 12:41:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 54172166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594982518;
	bh=YJ56Ac6mUx28Fsy1ZPxvTFFugBtqEQhuXo8L6mHCFws=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Th31WU3t6yvAjDFgT6likxVa0Qd2WHYiQB29vXWOkI67YYxtPFF4bpFiIz+4SE+PD
	 BZNs96fY9bjdxjDT2HFYGYXA6gKc+iYQisadMG5GoMSHkD10dIrh8BzmDS9rc09yB0
	 tsVKm+8P13MwsjWEsOLRM1vj2HvqbVPi8+QglkJQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A7FB8F80229;
	Fri, 17 Jul 2020 12:40:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3E5E2F80227; Fri, 17 Jul 2020 12:40:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3AAB6F801D8
 for <alsa-devel@alsa-project.org>; Fri, 17 Jul 2020 12:40:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3AAB6F801D8
Received: from xps.home (unknown [IPv6:2a01:e35:2fb5:1510:c567:382e:1974:9868])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: aferraris)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id CDB8B2A5C77;
 Fri, 17 Jul 2020 11:40:18 +0100 (BST)
From: Arnaud Ferraris <arnaud.ferraris@collabora.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v3 1/1] ASoC: fsl_asrc: make sure the input and output clocks
 are different
Date: Fri, 17 Jul 2020 12:38:58 +0200
Message-Id: <20200717103857.31877-2-arnaud.ferraris@collabora.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200717103857.31877-1-arnaud.ferraris@collabora.com>
References: <20200716232000.GA27246@Asurada-Nvidia>
 <20200717103857.31877-1-arnaud.ferraris@collabora.com>
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
both input and output when, for instance, the output sample rate is a
multiple of the input rate.

In that case, both selectable clocks will be multiples of both the input
and output sample rates, and therefore the first of these clocks will be
selected for both input and output, leading to miscalculation of the
dividers for either the input or output side.

Example:
  Input uses clock A (512kHz) and has a sample rate of 8kHz
  Output uses clock B (1024kHz) and has a sample rate of 16kHz

  In this case, the algorithm will select clock A for both input and
  output: the input divider will therefore be calculated properly
  (512 / 8 => 64), but the output divider's value will be only half
  the expected value (512 / 16 => 32 instead of 1024 / 16 => 64).

This patch makes sure it always selects distinct input and output
clocks.

Signed-off-by: Arnaud Ferraris <arnaud.ferraris@collabora.com>
---
 sound/soc/fsl/fsl_asrc.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
index 02c81d2e34ad..de10c208d3c8 100644
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
@@ -618,11 +618,15 @@ static void fsl_asrc_select_clk(struct fsl_asrc_priv *asrc_priv,
 	/* Select proper clock source for internal ratio mode */
 	for (j = 0; j < 2; j++) {
 		for (i = 0; i < ASRC_CLK_MAP_LEN; i++) {
-			clk_index = asrc_priv->clk_map[j][i];
-			clk_rate = clk_get_rate(asrc_priv->asrck_clk[clk_index]);
-			/* Only match a perfect clock source with no remainder */
+			clk_index[j] = asrc_priv->clk_map[j][i];
+			clk_rate = clk_get_rate(asrc_priv->asrck_clk[clk_index[j]]);
+			/*
+			 * Only match a perfect clock source with no remainder
+			 * and make sure the input & output clocks are different
+			 */
 			if (clk_rate != 0 && (clk_rate / rate[j]) <= 1024 &&
-			    (clk_rate % rate[j]) == 0)
+			    (clk_rate % rate[j]) == 0 &&
+			    (j == 0 || clk_index[j] != clk_index[j - 1]))
 				break;
 		}
 
-- 
2.27.0

