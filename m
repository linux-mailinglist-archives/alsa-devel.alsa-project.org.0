Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B4B222646
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Jul 2020 16:55:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 94A88166C;
	Thu, 16 Jul 2020 16:54:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 94A88166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594911316;
	bh=EgnIrtuzRT0k8ENVc+kfu21kzs57sEVUszquL4O1M0I=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=m4S4XR4jcsbmT1qJle2PCED+fRE9QvC9MTw6H6wzGNmeizaZM8NJLDq4q6MpBGa3w
	 S2V0Z3RoZO/iAoxVQnFVi+lBoLCRwdVR1e0QZSCfvmvbN9Z/iDSf8mgCatIpTEDZtD
	 jd2huXgrJQe70Geuh+vMnFwaOImBtlSeE8G/xZCo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 91430F80276;
	Thu, 16 Jul 2020 16:52:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2116FF8027B; Thu, 16 Jul 2020 16:52:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9B50AF8016F
 for <alsa-devel@alsa-project.org>; Thu, 16 Jul 2020 16:52:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B50AF8016F
Received: from xps.home (unknown [IPv6:2a01:e35:2fb5:1510:95f7:ce7f:fb76:c54a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: aferraris)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 421E82A50E0;
 Thu, 16 Jul 2020 15:52:38 +0100 (BST)
From: Arnaud Ferraris <arnaud.ferraris@collabora.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/2] ASoC: fsl_asrc: always use internal ratio
Date: Thu, 16 Jul 2020 16:52:01 +0200
Message-Id: <20200716145201.186270-3-arnaud.ferraris@collabora.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200716145201.186270-1-arnaud.ferraris@collabora.com>
References: <20200716145201.186270-1-arnaud.ferraris@collabora.com>
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

Even though the current driver calculates the dividers to be used
depending on the clocks and sample rates, enabling the internal ratio
can lead to noticeable improvements in the audio quality, based on my
testing.

As stated in the documentation, "When USRx=1 and IDRx=0, ASRC internal
measured ratio will be used", so setting this bit even when not in
"Ideal Ratio" mode still makes sense.

Signed-off-by: Arnaud Ferraris <arnaud.ferraris@collabora.com>
---
 sound/soc/fsl/fsl_asrc.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
index bfd35b9c0781..cc0f70c9140f 100644
--- a/sound/soc/fsl/fsl_asrc.c
+++ b/sound/soc/fsl/fsl_asrc.c
@@ -465,7 +465,7 @@ static int fsl_asrc_config_pair(struct fsl_asrc_pair *pair, bool use_ideal_rate)
 	regmap_update_bits(asrc->regmap, REG_ASRCTR,
 			   ASRCTR_ATSi_MASK(index), ASRCTR_ATS(index));
 	regmap_update_bits(asrc->regmap, REG_ASRCTR,
-			   ASRCTR_USRi_MASK(index), 0);
+			   ASRCTR_USRi_MASK(index), ASRCTR_USR(index));
 
 	/* Set the input and output clock sources */
 	regmap_update_bits(asrc->regmap, REG_ASRCSR,
@@ -507,8 +507,7 @@ static int fsl_asrc_config_pair(struct fsl_asrc_pair *pair, bool use_ideal_rate)
 
 	/* Enable Ideal Ratio mode */
 	regmap_update_bits(asrc->regmap, REG_ASRCTR,
-			   ASRCTR_IDRi_MASK(index) | ASRCTR_USRi_MASK(index),
-			   ASRCTR_IDR(index) | ASRCTR_USR(index));
+			   ASRCTR_IDRi_MASK(index), ASRCTR_IDR(index);
 
 	fsl_asrc_sel_proc(inrate, outrate, &pre_proc, &post_proc);
 
-- 
2.27.0

