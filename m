Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B7B413CC4
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Sep 2021 23:42:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DC8661688;
	Tue, 21 Sep 2021 23:41:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DC8661688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632260538;
	bh=+31WT2YpLY1PNFXYWVUJANX+51GF0audki7RRoE2ToY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=epSodfu5khf/RHtiNLm2DAVsIztsYq7D5Z3BazL7CeIT8xYdUrhjOwe+hNXdJAY/h
	 nNIHiUZJF1FWIupWWGxJYDb5sNb8sltfBhYyA9ymYX5VZAVO+onCtI+Wi4xnQteYa7
	 68os9I6ORr0Qo+iPASBcavXGHwDqBGCAVoHVdOOI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 52601F8053C;
	Tue, 21 Sep 2021 23:37:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 32964F8053B; Tue, 21 Sep 2021 23:37:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BA322F80539
 for <alsa-devel@alsa-project.org>; Tue, 21 Sep 2021 23:37:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA322F80539
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Zxx8QUgj"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6120361019;
 Tue, 21 Sep 2021 21:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632260239;
 bh=+31WT2YpLY1PNFXYWVUJANX+51GF0audki7RRoE2ToY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Zxx8QUgjG1WXkeXv4LZ0jN9zglc7yEEDGlcSX+liqqM8PkGN12F37rBZ7elc5ONhW
 ctyF+hlEJTSYD9gWEV+B/xc3QzId9yQf3hz4viPWcypUyGmKeAd+yyP00BMFbZtuJT
 Jy2HwUooqeXHxeRHjBmmSVe/gqrzSH1zFwaUqaRtam4c5Dvcz5cEj0Td9QdlKjibpl
 fIDFNZyB4u9erhxwPpbtpjFIgU3EUuTo8nnxFHuxWk0/jO9UPvC53a9/5fSNuFa9Ev
 WcBMzkCWMMYAbX6kXWuWMt60uZMIAkTqzATnnk8pxJ8R5BKRHxqRM0wpmccEB+kZIo
 4UV+fdHhorZDQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>
Subject: [PATCH v2 13/16] ASoC: imx-sgtl5000: Update to modern clocking
 terminology
Date: Tue, 21 Sep 2021 22:35:39 +0100
Message-Id: <20210921213542.31688-13-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210921213542.31688-1-broonie@kernel.org>
References: <20210921213542.31688-1-broonie@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=884; h=from:subject;
 bh=+31WT2YpLY1PNFXYWVUJANX+51GF0audki7RRoE2ToY=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBhSk8cajJbtErs5M2JHhrPL9v3ObE8KSKu2qOqnXTt
 /WwinpCJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYUpPHAAKCRAk1otyXVSH0Ft2B/
 4ro8TVNrTDaS+9U60vdlZTyzZ76TISk3B5MjNbEEqGz8hlqdIET+DvmiCuuIY8WULpbsDxZaQvD20r
 uRMd2hbpbiRvNcc4I+8WXPifA8BG5aFaQv/6ulI0lADr+XgmTN+9+faMHUiGHvW6K0RhTjKIyRJdkE
 GxSzdDimGeAdijRv1CyX62Qk5D/7zCeEe61xtghBM88jtF/iA1jeYyy2a8XNtjUHT+EHr8VehFr7P5
 6ZNf9w0PxxoHDdbx7ppwKum5FEl8vpOgHtAlSjMaxmqbZVh9gwH83QBgIqpPPESH9qfAPR1wd3MS2r
 K52uYJy3/HkiqfXVAfdzbuS0ln9BT4
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
the imx-sgtl5000 driver to use more modern terminology for clocking.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/fsl/imx-sgtl5000.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/fsl/imx-sgtl5000.c b/sound/soc/fsl/imx-sgtl5000.c
index f45cb4bbb6c4..2f1acd011042 100644
--- a/sound/soc/fsl/imx-sgtl5000.c
+++ b/sound/soc/fsl/imx-sgtl5000.c
@@ -153,7 +153,7 @@ static int imx_sgtl5000_probe(struct platform_device *pdev)
 	data->dai.platforms->of_node = ssi_np;
 	data->dai.init = &imx_sgtl5000_dai_init;
 	data->dai.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
-			    SND_SOC_DAIFMT_CBM_CFM;
+			    SND_SOC_DAIFMT_CBP_CFP;
 
 	data->card.dev = &pdev->dev;
 	ret = snd_soc_of_parse_card_name(&data->card, "model");
-- 
2.20.1

