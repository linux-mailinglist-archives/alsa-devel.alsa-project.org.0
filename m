Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E763C413CC2
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Sep 2021 23:41:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 810B816C6;
	Tue, 21 Sep 2021 23:41:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 810B816C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632260517;
	bh=ndW6JLnsPPrjKQ932C1Mn3KiDfrgW/GYFDGEKcx9/Y0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Rc+x/CrJDXdQG5aGBgJW4Jt4Yot2kluiluPSFNbd1U0er/F+1TfCBcRmp8IB8tss3
	 nTWj5Aef84Apva+7Dtifmc6lgIRwmKbGkZUAF42TzhFAXwDt1mnXk2F+pgMxuYSshE
	 bTX9kPz6ANOwK0MqfxTDqg8xN0lZALOvv2rRlaNs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C080BF80534;
	Tue, 21 Sep 2021 23:37:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 99779F80537; Tue, 21 Sep 2021 23:37:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0F1E8F8051C
 for <alsa-devel@alsa-project.org>; Tue, 21 Sep 2021 23:37:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0F1E8F8051C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="qQoyITVj"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8AE5561166;
 Tue, 21 Sep 2021 21:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632260236;
 bh=ndW6JLnsPPrjKQ932C1Mn3KiDfrgW/GYFDGEKcx9/Y0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qQoyITVjasu9E8aZ7YeaLMoMFdo4iJ4+nHPg8XkLoq5FldkCO2u46KOENsySRQG0R
 T4Zo2ubuybZ9opjGzZ16FJJveaMkyQYpgVNSNoorgpfCHlAeZT6gQbujqXXS395tNl
 MOUsveJYXFLFz9JiqA1PeMMJjTEWL+mutQDbW2BXvvfyA3QOCx+Z0IxakW9llMYtBi
 +uAw/dbieLUFtKhdOcQMA6Y63P2F/XGMtDNJEGcSZNjHV+pRRm3+vdbBNNSDf2TLbU
 dAXG7ODNXEkURadi4mzT8sjAt8mzvfgC2b6gn6pR/nSTpixGyeiQSMZXcpwWuWyvnT
 NUN6mf1+AV7iw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>
Subject: [PATCH v2 12/16] ASoC: imx-rpmsg: Update to modern clocking
 terminology
Date: Tue, 21 Sep 2021 22:35:38 +0100
Message-Id: <20210921213542.31688-12-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210921213542.31688-1-broonie@kernel.org>
References: <20210921213542.31688-1-broonie@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=838; h=from:subject;
 bh=ndW6JLnsPPrjKQ932C1Mn3KiDfrgW/GYFDGEKcx9/Y0=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBhSk8bc4E4mSomofqAFk5UnxTqcP6GbNg1W968mi1x
 ptA+SNaJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYUpPGwAKCRAk1otyXVSH0Fx3B/
 9GIQ85cNL2NmGCcbmlPfhMP1O0tq8x6kdKPnYaEffv2KlEFPPYRcAdo04H/FW0fiZuc5jV2+bg2Plh
 2lYO7ylvj+1Ht6OD+HtAmaca3o8+3fm0tD6v8Kg2neH4Un8dg9yBylTHLmR4pckvrv53G1RLZkWrZ9
 3H35bo2+8T6CU0iYYugPSMHt0Pepc6HvbvjjS3c+5Xj5fOxd3GcYAvFsl4boKyxnpNmOCj9+/EPB7g
 9HreHdFqVTT2e+4v27XmJdnBpppwigx6NlFhFiOgd2clfZmjg5fJZ5noXf5NaepOF+0UtCh56Lp/P3
 DK1MD/+RTZMblXCSr0aXZxcl2RcHJ6
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
the imx-rpmsg driver to use more modern terminology for clocking.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/fsl/imx-rpmsg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/fsl/imx-rpmsg.c b/sound/soc/fsl/imx-rpmsg.c
index f96fe4ff8425..2e117311e582 100644
--- a/sound/soc/fsl/imx-rpmsg.c
+++ b/sound/soc/fsl/imx-rpmsg.c
@@ -64,7 +64,7 @@ static int imx_rpmsg_probe(struct platform_device *pdev)
 	data->dai.stream_name = "rpmsg hifi";
 	data->dai.dai_fmt = SND_SOC_DAIFMT_I2S |
 			    SND_SOC_DAIFMT_NB_NF |
-			    SND_SOC_DAIFMT_CBS_CFS;
+			    SND_SOC_DAIFMT_CBC_CFC;
 
 	/* Optional codec node */
 	ret = of_parse_phandle_with_fixed_args(np, "audio-codec", 0, 0, &args);
-- 
2.20.1

