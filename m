Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DF09853BA58
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jun 2022 16:00:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 80DD417ED;
	Thu,  2 Jun 2022 15:59:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 80DD417ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654178404;
	bh=fpEwUfAxjvS+H0wDAVvAN4L4mf0UkZC5zvLW4TChJS0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JihZ7T94Kr5To6VcBg7Mlq/f6sEK1j0rAwccN2E5W2eabR5ailJDWwAn5eGGGSEIt
	 shQTTjNRUbCQ1b5y9TB8cs4VTT5w98sPWcuBSQ+EP3pSOWWVlfZiMUGa/LeN/toVW8
	 tsSHa3MxIfX8i9i1PGadHw8Rf3WT03wzSZBsl08o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 66BE2F805B4;
	Thu,  2 Jun 2022 15:53:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3CE86F805D8; Thu,  2 Jun 2022 15:53:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E0DD5F805B4
 for <alsa-devel@alsa-project.org>; Thu,  2 Jun 2022 15:53:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0DD5F805B4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="d9Oq2NHJ"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6385B617D4;
 Thu,  2 Jun 2022 13:53:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EFE9C3411A;
 Thu,  2 Jun 2022 13:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654178023;
 bh=fpEwUfAxjvS+H0wDAVvAN4L4mf0UkZC5zvLW4TChJS0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=d9Oq2NHJvy95ezilGqeivEGLyDs7//9T8zF1G0uL6pnnQV6RUAOVviNoKPWdvWJ68
 e0mYuM+EngtUe5nreyyYs6pOpATWNhpqR48NeQbQf/DEERC3mxB0cVTcH4SQ7LfQ8N
 hFP0iLGuMNkC//frq2qB+h0i2YUemi7HNtD5d/VpqZK+iJ4/YmFc30YggdIhMm7BCo
 l/AHP7XXb2QdiE3S2S5IZ5DUT8bpSb/w6OMsb0K6tWEOCydhRcTvU/k9lhs5GbUgvl
 d48we93T6y6If9QlHox+Rg+n2ZvA0J/bEa/NJexqhhwcvQa+/1OzJChIle/WVuFu94
 98CrhX4k8MlRA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 19/20] ASoC: tlv320aic33: Use modern ASoC DAI format
 terminology
Date: Thu,  2 Jun 2022 15:53:15 +0200
Message-Id: <20220602135316.3554400-20-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220602135316.3554400-1-broonie@kernel.org>
References: <20220602135316.3554400-1-broonie@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1531; h=from:subject;
 bh=fpEwUfAxjvS+H0wDAVvAN4L4mf0UkZC5zvLW4TChJS0=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBimMCdT+Rr3tfbRitgCr5+4AcJtyY3o8pHe6e/2Tn3
 nkGBBoCJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYpjAnQAKCRAk1otyXVSH0BI1B/
 9u8XhYHDIhodbQPWncxeP/sQr0CTmemQmmWL0QdUDCz6DCVPaqudEKUomUYKBJwIgcZqbIPVJMKEai
 iKbsUdTzuuxS7lvQmAy4msxxzbEDBtgxPRdTZ9bPwAUhACeA2RPvsxlJuB/U5qXSD7Q+RpZQrQY7XH
 U6b0g4nm7ICkkHVvwofIw4RSgETYMcL6Kj4Q4ueqIRsNxKpOa/jwb6RRPcGl0sGURfy3RIBWYNV3hs
 JhVS8i6D/fsg2rdEeYxpW7jkxJNdkJ4gOpeQ8HeMwU+iCDx1mS2hSkK36A+yr3NBOIaxEtje1x3hrI
 C+ML5xUNLYovIWO0jcB0N4vmLDWRXf
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
the tlv320aic33 driver to use more modern terminology for clocking.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/tlv320aic3x.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/tlv320aic3x.c b/sound/soc/codecs/tlv320aic3x.c
index d53037b1509d..610e41bbf388 100644
--- a/sound/soc/codecs/tlv320aic3x.c
+++ b/sound/soc/codecs/tlv320aic3x.c
@@ -1253,22 +1253,21 @@ static int aic3x_set_dai_fmt(struct snd_soc_dai *codec_dai,
 	iface_areg = snd_soc_component_read(component, AIC3X_ASD_INTF_CTRLA) & 0x3f;
 	iface_breg = snd_soc_component_read(component, AIC3X_ASD_INTF_CTRLB) & 0x3f;
 
-	/* set master/slave audio interface */
-	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
+	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_CBP_CFP:
 		aic3x->master = 1;
 		iface_areg |= BIT_CLK_MASTER | WORD_CLK_MASTER;
 		break;
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		aic3x->master = 0;
 		iface_areg &= ~(BIT_CLK_MASTER | WORD_CLK_MASTER);
 		break;
-	case SND_SOC_DAIFMT_CBM_CFS:
+	case SND_SOC_DAIFMT_CBP_CFC:
 		aic3x->master = 1;
 		iface_areg |= BIT_CLK_MASTER;
 		iface_areg &= ~WORD_CLK_MASTER;
 		break;
-	case SND_SOC_DAIFMT_CBS_CFM:
+	case SND_SOC_DAIFMT_CBC_CFP:
 		aic3x->master = 1;
 		iface_areg |= WORD_CLK_MASTER;
 		iface_areg &= ~BIT_CLK_MASTER;
-- 
2.30.2

