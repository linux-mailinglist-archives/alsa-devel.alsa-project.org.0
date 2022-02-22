Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB4D34C04E9
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Feb 2022 23:52:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D160218A9;
	Tue, 22 Feb 2022 23:51:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D160218A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645570358;
	bh=DbVFuWR1y7mcE6QvmpRstw06v4NYkXhNhF3g2iYkla4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XZnOLGUl+4mFBjVPsLy2kd9O6ZLIZ4S6uq5z9SkkCPiSQrXRZFmreGOzxa7176wII
	 Jx2pvQzy6By2Pc1Z61w9CENKqgCixnLLgvSwQ8wwjFObRsRebpOBK8dA17CdplJLbU
	 4lk43fgVc8lrOCRHW7RWvf49VbX0McUbTMe4oSNQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 76FBFF801F5;
	Tue, 22 Feb 2022 23:51:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1530BF801EC; Tue, 22 Feb 2022 23:51:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DDD70F80118
 for <alsa-devel@alsa-project.org>; Tue, 22 Feb 2022 23:51:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DDD70F80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="mpv9C3R4"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E1465B81CF2;
 Tue, 22 Feb 2022 22:51:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D22EC340E8;
 Tue, 22 Feb 2022 22:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645570300;
 bh=DbVFuWR1y7mcE6QvmpRstw06v4NYkXhNhF3g2iYkla4=;
 h=From:To:Cc:Subject:Date:From;
 b=mpv9C3R4wo2O1Hv5wMSqca6i6H6cjthkIEuFqBsRa8EupX4EOm0JAtRAfjqpnbEac
 b9nbE4uEEF6bVaNT3n01g2GbvJhSAR9p58p4i1ptHIR3hLpKPGSmmXFgPMGfjwqwo3
 YJVmPTxzlbo+MlnqNvWX07hNAljlwTJdR62sRvFjVnT5OMMkxWaRfbSSfhIqyu/ae7
 v6+q2hcQSXyvg82VfPW3iiBycxzoht++ch9cT2TWWEk3RVysifcaAsDp8sJjjM8rfA
 4FutiUG5c95UOT1x+1zvfQP/eQ+kjSNrdYmk9zeUvnqk0r+HdKlU6pb5/rsMnj9e32
 q1jC8gXTvXyjA==
From: Mark Brown <broonie@kernel.org>
To: M R Swami Reddy <mr.swami.reddy@ti.com>,
 Vishwas A Deshpande <vishwas.a.deshpande@ti.com>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH] ASoC: lm49453: Use modern ASoC DAI format terminology
Date: Tue, 22 Feb 2022 22:51:35 +0000
Message-Id: <20220222225135.3726158-1-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1245; h=from:subject;
 bh=DbVFuWR1y7mcE6QvmpRstw06v4NYkXhNhF3g2iYkla4=;
 b=owGbwMvMwMWocq27KDak/QLjabUkhiTRjMepCuKs5vGWs8LyHqe6yP69tqxcR5Pl/ncpJjZuyf9x
 Pl6djMYsDIxcDLJiiixrn2WsSg+X2Dr/0fxXMINYmUCmMHBxCsBEPKQ5GNruf9jf3PiqlW+v0EGzyb
 KdyRtPrPfa8kZh2S7OjMD7TvUBITdzlkul9n2/ObFEb4ONhxtTiq7E72M+Z7oezOE5Ytm9/IbCFoPp
 K3kTRf7lbrDor0qRzPq/peB5/cvENW8d+HKkmAJYSlzC/73YoejYuKywKVa5am55SYH70okSwpdD7k
 oXfPUqPeJ0pS/7i2CD/LGTUp6Tr3/tl829l9zzSSF5xZLGEjuVhrdm/zJvZi+72CYpUH1ib7zGJe73
 1aYzb2uw8109b1PYdiGUybXvgsOmCTeUDJap301kSu36uTjrW4IMQ6z0ll3iPqLh4dzZO/Wf39zun3
 r4Mscs1njRQ8b/v5pf5TiisFYAAA==
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
the lm49453 driver to use more modern terminology for clocking.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/lm49453.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/lm49453.c b/sound/soc/codecs/lm49453.c
index fb0fb23537e7..973d781b4b6a 100644
--- a/sound/soc/codecs/lm49453.c
+++ b/sound/soc/codecs/lm49453.c
@@ -1146,17 +1146,17 @@ static int lm49453_set_dai_fmt(struct snd_soc_dai *codec_dai, unsigned int fmt)
 	int clk_phase = 0;
 	int clk_shift = 0;
 
-	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBS_CFS:
+	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_CBC_CFC:
 		aif_val = 0;
 		break;
-	case SND_SOC_DAIFMT_CBS_CFM:
+	case SND_SOC_DAIFMT_CBC_CFP:
 		aif_val = LM49453_AUDIO_PORT1_BASIC_SYNC_MS;
 		break;
-	case SND_SOC_DAIFMT_CBM_CFS:
+	case SND_SOC_DAIFMT_CBP_CFC:
 		aif_val = LM49453_AUDIO_PORT1_BASIC_CLK_MS;
 		break;
-	case SND_SOC_DAIFMT_CBM_CFM:
+	case SND_SOC_DAIFMT_CBP_CFP:
 		aif_val = LM49453_AUDIO_PORT1_BASIC_CLK_MS |
 			  LM49453_AUDIO_PORT1_BASIC_SYNC_MS;
 		break;
-- 
2.30.2

