Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA7B4119F0
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Sep 2021 18:40:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 268FC16C1;
	Mon, 20 Sep 2021 18:39:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 268FC16C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632156029;
	bh=FQKFccFzow0kBDfbUYgf/KA/p8poX/a/6qMo3Cy4Dks=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=IkSjXGTT2k+i2dpIdESKRyb5Jyh/EWKXwPqvLjVmDxyqi3f1LY5tUKtfxlqLxJuSS
	 ASG5NBl1oPI9IgvxCtmCjr08gt7BOApsdGMj6vdrvfVT6rxrbQFossd+LZbwB8bK9e
	 8cEqf2rgLlWAhEVtIpnSb5nin4qaGS1oZbKY2DfQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 80D8DF80279;
	Mon, 20 Sep 2021 18:39:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 748E9F8025D; Mon, 20 Sep 2021 18:39:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C229FF80152
 for <alsa-devel@alsa-project.org>; Mon, 20 Sep 2021 18:39:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C229FF80152
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="tF3/wHtR"
Received: by mail.kernel.org (Postfix) with ESMTPSA id AB9D9611AE;
 Mon, 20 Sep 2021 16:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632155942;
 bh=FQKFccFzow0kBDfbUYgf/KA/p8poX/a/6qMo3Cy4Dks=;
 h=From:To:Cc:Subject:Date:From;
 b=tF3/wHtR+RHOq3lXS7sFXzBbq0LRREYLZZMxcEWWMNlX1WnQzcvO8qP/SRWxd1AIu
 t3buAYJQ+X38wODiwEktvbRyq5nuCGll9Eeu099b/gfCLkfJifZGlsjIgVmoIvGHya
 d5e+++oG83um1RmbM52qIYb6WLd3CxQK7oMK8XxjEapB9YY2nek0H85goVGF35nta+
 PgTg3QpYedCGT7Tmg+2i6LaNqfREzWUnWb2LXUB5Ye/IEb3wDDMHxxvecVki4/5bxj
 G7FG6bbWz7DGns+/7xNXwSLO5vtaL03+Nd0rJX6BUZU7WthKRaAuyVlyI3fnM01AxN
 BMG+B2qlRKHgg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH] ASoC: ak4458: Use modern ASoC DAI format terminology
Date: Mon, 20 Sep 2021 17:38:17 +0100
Message-Id: <20210920163817.16490-1-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1309; h=from:subject;
 bh=FQKFccFzow0kBDfbUYgf/KA/p8poX/a/6qMo3Cy4Dks=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBhSLjWz9Ai0B1saAe5SasWkkmaKklZJ2P8+7umX2qU
 EP5r5ICJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYUi41gAKCRAk1otyXVSH0ARNB/
 9bOV1ueaP5AIWtCGIw93eoJAHQ0h06vXGbCh5UGK0MQ9019flFkJJ0rpKknxtbZYhK+uFsq1+PSsQG
 zK0YJk3Mjy0zX22lmhoXDApHfj+u+/33kq36fdXGTRWNnmhvS/7AVkpmSMmPyDk8cB/4KdnuOxUh/P
 K5pggjlv2ZNQiFsbkSXJRUtpj/p0rQuqvik5CdU7qN4oKbLb5cNm5/31wIA5dyPdXwSOehQtipHEqx
 nMp2C0gqK6w8OKjk5IcC5IBU1UUzaz8ndd8dTp9TPhdpgj9qYS5FIsQm0/TcZwvA3V40U1XF58rwaw
 olScBqybLVSwQtMlkwJ0UoecIgBDvM
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
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
the ak4458 driver to use more modern terminology for clocking.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/ak4458.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/ak4458.c b/sound/soc/codecs/ak4458.c
index 29eb78702bf3..baa9ff5d0ce5 100644
--- a/sound/soc/codecs/ak4458.c
+++ b/sound/soc/codecs/ak4458.c
@@ -464,14 +464,14 @@ static int ak4458_set_dai_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	struct ak4458_priv *ak4458 = snd_soc_component_get_drvdata(component);
 	int ret;
 
-	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBS_CFS: /* Slave Mode */
+	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_CBC_CFC: /* Consumer Mode */
 		break;
-	case SND_SOC_DAIFMT_CBM_CFM: /* Master Mode is not supported */
-	case SND_SOC_DAIFMT_CBS_CFM:
-	case SND_SOC_DAIFMT_CBM_CFS:
+	case SND_SOC_DAIFMT_CBP_CFP: /* Provider Mode is not supported */
+	case SND_SOC_DAIFMT_CBC_CFP:
+	case SND_SOC_DAIFMT_CBP_CFC:
 	default:
-		dev_err(component->dev, "Master mode unsupported\n");
+		dev_err(component->dev, "Clock provider mode unsupported\n");
 		return -EINVAL;
 	}
 
-- 
2.20.1

