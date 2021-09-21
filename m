Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE8B413CB8
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Sep 2021 23:41:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0E8F91688;
	Tue, 21 Sep 2021 23:40:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0E8F91688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632260476;
	bh=NW3bpE8J3VKBnOZtBpB10bBc+DHax4UYEF50tjdaBmQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=l3M4JNWNjM/8gati2Qz6cxg3upDGEeqlvdsUPrKSkyC2o6rpYBayyTUy8dN3+lbA5
	 VyQE1ib+PiyOuGQujUhItlZYF9L2+hIpz3zJtxgwj5Ebu5YYeYj3Et2XIzezxjJPiS
	 LDEJtKcVlSyToA44vJZYJ6RL0QEsQznTiRVv0WAM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5B7A5F8051F;
	Tue, 21 Sep 2021 23:37:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E7E1DF8051F; Tue, 21 Sep 2021 23:37:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7ADF2F8051C
 for <alsa-devel@alsa-project.org>; Tue, 21 Sep 2021 23:37:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7ADF2F8051C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="uD29ZCcE"
Received: by mail.kernel.org (Postfix) with ESMTPSA id D285F61166;
 Tue, 21 Sep 2021 21:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632260230;
 bh=NW3bpE8J3VKBnOZtBpB10bBc+DHax4UYEF50tjdaBmQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=uD29ZCcEG51Y4IHXtR7X8qbkvC3ON9oM3WfgcP95ksV9Mdza87pjZpZz8KfGs4MqM
 QZ4TzXkFbMb048UvrDVmgLalmg2oDECWj0GO8fONJJKyqJI0XVqvJ54qZKIloDmSZD
 bmvLIj4BXSmbrHVTdOztHpSVXyeRdusoHsBzrOrZ0Q+0or/et6cigSzmqsyVdnOc3w
 7BC7H15wY0I8Zg4nXhgDpXh/+7X/Tokot1DjX7K5pLwc4pMdhBM9gXc99JBFSqkzHD
 jAy6/kFaKnI2yrHt/DkVi9clf1kDQbdN2cIUXKZc8ejMpw5BHCMZnjYsPOaMu8n+7F
 6PWKI7acBSrNA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>
Subject: [PATCH v2 10/16] ASoC: imx-es8328: Update to modern clocking
 terminology
Date: Tue, 21 Sep 2021 22:35:36 +0100
Message-Id: <20210921213542.31688-10-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210921213542.31688-1-broonie@kernel.org>
References: <20210921213542.31688-1-broonie@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=856; h=from:subject;
 bh=NW3bpE8J3VKBnOZtBpB10bBc+DHax4UYEF50tjdaBmQ=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBhSk8ai/HuhL2+C59n6SMrEtArdewZFCYqAk0/3TuH
 hSAfRLiJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYUpPGgAKCRAk1otyXVSH0LGlB/
 9H0CeulkUvRZuZc4vy3WrTNRmoNab/2J/cAZE+Mr7BTsnfIRn3OfMj09E6X9vVo2tNjZoDQ8eJHMkx
 6VNu9h7QyFhQpIh9tdpFYAyxpX9Q5VtLW9WTCYXHpZSYmbdsGPZ3TiO3eheLjLDgrrFOmrakau8w3/
 TvA464kZ8TK/ObDqPCZk4DCwld8HJ+GTCDQdku4U56Wo9Ss8Z2BKr4B+XeZuqE3AMT3t/peiHlLkFb
 aQqlH3gKvrpCHvDrzSa1JkDlWh42x9wltX8VKxgxLGm3vdOQU80znrC1/+O/U2/XvfasqmBUG2A03C
 awr6gN7Pos3BruoMxzrLdjsUDayuOF
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
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

As part of moving to remove the old style defines for the bus clocks update
the imx-es8328 driver to use more modern terminology for clocking.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/fsl/imx-es8328.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/fsl/imx-es8328.c b/sound/soc/fsl/imx-es8328.c
index 1981dcd7e930..09c674ee79f1 100644
--- a/sound/soc/fsl/imx-es8328.c
+++ b/sound/soc/fsl/imx-es8328.c
@@ -174,7 +174,7 @@ static int imx_es8328_probe(struct platform_device *pdev)
 	data->dai.platforms->of_node = ssi_np;
 	data->dai.init = &imx_es8328_dai_init;
 	data->dai.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
-			    SND_SOC_DAIFMT_CBM_CFM;
+			    SND_SOC_DAIFMT_CBP_CFP;
 
 	data->card.dev = dev;
 	data->card.dapm_widgets = imx_es8328_dapm_widgets;
-- 
2.20.1

