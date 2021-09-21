Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C15413C2A
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Sep 2021 23:15:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 363951614;
	Tue, 21 Sep 2021 23:14:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 363951614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632258915;
	bh=QnS5Cga8MAQ6BFduVQ+0hsBboMZot1AdyZOYHd/YW4M=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SbKJp3PqYykGi11yFVsls8hu005NMF7NQnXtZ+jQnUEsdHxUIz1U7BrRch5IBP+2G
	 yxHwpFg1MzLUe0n9rzoZ6jEnYuhfUEODUsvKk+l5syua9xfC7rKw4esuqPsQr5h0+L
	 QQU6X1WyqHSbYeOWY2ZiFp5zzeyDqLAhbsJUod+Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 39EA5F80518;
	Tue, 21 Sep 2021 23:12:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1E7ABF80508; Tue, 21 Sep 2021 23:11:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 094ECF804E5
 for <alsa-devel@alsa-project.org>; Tue, 21 Sep 2021 23:11:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 094ECF804E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="fD5r1+S/"
Received: by mail.kernel.org (Postfix) with ESMTPSA id DA27D60F38;
 Tue, 21 Sep 2021 21:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632258704;
 bh=QnS5Cga8MAQ6BFduVQ+0hsBboMZot1AdyZOYHd/YW4M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fD5r1+S/1nCsv6H4NjZ+G0hNpCUEsKHVUIVQgiM39Kn/HaHfDO6faQS5rh7CX0F+u
 Y8pqjWv5Se1dykNALBcIzce4TEPOy49nleFWILJUOKBf2d0gEaVvsis35Kr9KCv5Lp
 vokNgEj3NrqMNnAT5TZ8G4BiVxSUkgVGnhnlo4/FVZupzMLKUS7jO7t/61IuIPdKP7
 VBM9hT9DGfQtQMMgz17oYVCxZNQ44mLRMm0PqRGjTjeQyd5BHZ9jbRSNGPaXRmA56p
 Cz7WmKrHa16XhxDu98ZYKTFTgYgz8gLqnShsWTUv6akmI6WdcPXpXoZi2e5DsG945e
 EewfwBOwgRPVg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>
Subject: [PATCH 08/16] ASoC: imx-audmix: Update to modern clocking terminology
Date: Tue, 21 Sep 2021 22:10:32 +0100
Message-Id: <20210921211040.11624-8-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210921211040.11624-1-broonie@kernel.org>
References: <20210921211040.11624-1-broonie@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1374; h=from:subject;
 bh=QnS5Cga8MAQ6BFduVQ+0hsBboMZot1AdyZOYHd/YW4M=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBhSknhpSHJMIZLeNDcthjEQHy+0FccpWtf96EdaQPR
 DPI46haJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYUpJ4QAKCRAk1otyXVSH0DHnB/
 90xHZIal1qmot1WZQkjlkBZSWPffQoQQQPbj4n7ljDk1kSVX4/Ej2XURCFegAs2Dkevp5H9eOFOw1O
 2i2Uxoo7lpzFo2NSnLwDlPZZqcgGLZxch4MNmsQCYioyqGOK2e2KUICKCym4HMMcXDF39UH2AL6RfZ
 aCusdVhPNN3Jj7KqNIVJ1HAasORBhblIPZf7xR56Cok9Yar01VV3mkhMFhFIsgfZAIj3LnsLdCnPLV
 EAqNKOWKM0HG+7QfRnt1yF2TgBjlCZ5PhEDSE25lzhAYKggEK4F9Iee9l3BxlSLS3v7DZt+t/qIEGI
 4Leu4+L67s/6u5+7JGIZAeMr05/9hO
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
the imx-audmix driver to use more modern terminology for clocking.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/fsl/imx-audmix.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/fsl/imx-audmix.c b/sound/soc/fsl/imx-audmix.c
index a364e2415de0..e8b438a0329e 100644
--- a/sound/soc/fsl/imx-audmix.c
+++ b/sound/soc/fsl/imx-audmix.c
@@ -80,8 +80,8 @@ static int imx_audmix_fe_hw_params(struct snd_pcm_substream *substream,
 	u32 channels = params_channels(params);
 	int ret, dir;
 
-	/* For playback the AUDMIX is slave, and for record is master */
-	fmt |= tx ? SND_SOC_DAIFMT_CBS_CFS : SND_SOC_DAIFMT_CBM_CFM;
+	/* For playback the AUDMIX is consumer, and for record is provider */
+	fmt |= tx ? SND_SOC_DAIFMT_CBC_CFC : SND_SOC_DAIFMT_CBP_CFP;
 	dir  = tx ? SND_SOC_CLOCK_OUT : SND_SOC_CLOCK_IN;
 
 	/* set DAI configuration */
@@ -121,8 +121,8 @@ static int imx_audmix_be_hw_params(struct snd_pcm_substream *substream,
 	if (!tx)
 		return 0;
 
-	/* For playback the AUDMIX is slave */
-	fmt |= SND_SOC_DAIFMT_CBM_CFM;
+	/* For playback the AUDMIX is consumer */
+	fmt |= SND_SOC_DAIFMT_CBP_CFP;
 
 	/* set AUDMIX DAI configuration */
 	ret = snd_soc_dai_set_fmt(asoc_rtd_to_cpu(rtd, 0), fmt);
-- 
2.20.1

