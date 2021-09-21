Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0708B413CB4
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Sep 2021 23:40:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A37C016A2;
	Tue, 21 Sep 2021 23:39:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A37C016A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632260434;
	bh=QnS5Cga8MAQ6BFduVQ+0hsBboMZot1AdyZOYHd/YW4M=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TkiRapuEC/61FVK7IGpRauAfl6UeL6l+6hWVKW7xBBj8lSxtaawsng/e5q2PiEn2X
	 dl0y0CaoC7WBJc8qFnGsSSsPtYubdl5rI6Jp6Zp6S85hBu+SOaggYxxb1KxZEWrBRN
	 5llC6yrL4bO2osI+MUhPJtFig404mCvAV28gIdgE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 22904F80519;
	Tue, 21 Sep 2021 23:37:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7374CF8050F; Tue, 21 Sep 2021 23:37:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 19C4DF80507
 for <alsa-devel@alsa-project.org>; Tue, 21 Sep 2021 23:37:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 19C4DF80507
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="lkGJflmQ"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 206F561168;
 Tue, 21 Sep 2021 21:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632260224;
 bh=QnS5Cga8MAQ6BFduVQ+0hsBboMZot1AdyZOYHd/YW4M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lkGJflmQ1irbPwaSu9AdC3mB7jVdv8GrB/CwW6u/4LALkY0xSpc/JJJal+CYqh3qk
 RNM9L6CZntscnmCzoe+2PtinF4o1rIfsWLBia/Xlq72awomnO7hx1POWsPt5cCNCow
 0czarRInEb5Og4wQ7iEZTPSqMg7jl2VOsIpFgIO823HygZy7vT0Y3cNGY0aLRJY+w/
 3V7GGRmq6YAX9DycqPgQQ8D0nwf9YAdZpK95boEc1gayG51ab7s66ka7g32SAqliOs
 UryriCHGsFb4B/+SMgbc/EJ0l10VlnGcphca7eRsWP0ir6LmuArbbDtCPqXZz1Lhiy
 X5r8XqRxG0BvA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>
Subject: [PATCH v2 08/16] ASoC: imx-audmix: Update to modern clocking
 terminology
Date: Tue, 21 Sep 2021 22:35:34 +0100
Message-Id: <20210921213542.31688-8-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210921213542.31688-1-broonie@kernel.org>
References: <20210921213542.31688-1-broonie@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1374; h=from:subject;
 bh=QnS5Cga8MAQ6BFduVQ+0hsBboMZot1AdyZOYHd/YW4M=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBhSk8YpSHJMIZLeNDcthjEQHy+0FccpWtf96EdaQPR
 DPI46haJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYUpPGAAKCRAk1otyXVSH0JBjB/
 97iZu2iy+lTjwr5PLcT+dorajsmPiup7krFVR3Fyxqrjsy3MbbVJbAcTA5kXabue8UGb0KVXidqfYi
 IYSGhzHHFSdRYaWVkscPy1JJsdd2H+iQ803QGOUhmPm5f3pAj10ORqgCKHamFtU48XYWgkIGMFVG4O
 qsov5GM2cju4yvJN4zd8PFzsVxc2pCCL3om23szqzaRZ1xYiYJa7zbjMJyb1wy4f/HnfxE9vd8lqTY
 BE/FPQE03FTntwdyaDbbhgSMoNP9AWIwVxf1nGBN0bT+e9N6SIfwwMBYXxlua3nqxxUExEjuKb+ych
 F1loR/t1Ea36IpGrso37RjNTcBQsRJ
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

