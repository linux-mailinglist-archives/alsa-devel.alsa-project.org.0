Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D6453BA2D
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jun 2022 15:55:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 801A4177C;
	Thu,  2 Jun 2022 15:54:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 801A4177C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654178148;
	bh=jRLUgUntU2fruxLhA+W/LLYekTcTbLPo5lIlqi7/X/s=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=j1AO5bMpT5mtlx2DxfA+kVUSnuvzaFgzPvBCDR0Vak6LvDjb5ME5uui/4E5zD4ods
	 UjDx0Xnt8h3lFkJ7Ruvknf0qljb3YAniRi7d3h6APIl7yJsEruw0n+Bmv63TdMOKes
	 2bx1VSEOzt1DFxp9exHeeabaRLmbnF0xReTBwie0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 52DFCF8053B;
	Thu,  2 Jun 2022 15:53:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B2806F8052F; Thu,  2 Jun 2022 15:53:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3E494F80272
 for <alsa-devel@alsa-project.org>; Thu,  2 Jun 2022 15:53:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3E494F80272
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="WbWRBCt+"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 68908B81F5E;
 Thu,  2 Jun 2022 13:53:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76307C3411A;
 Thu,  2 Jun 2022 13:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654178007;
 bh=jRLUgUntU2fruxLhA+W/LLYekTcTbLPo5lIlqi7/X/s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WbWRBCt+QG7MAFHniAq/coqKZyh/SMERhCeoTKtDBRHtaHtGLnin/FNk7ov1HXgIZ
 JPPXujJEVFz/tqcF5lcw89C4keY4z4COFqCIqH1yamp9lfgE05dA5RkXwpds/SOZLQ
 6HOT74a7Ba3glDHyL4xVvmc2bnGOEyKaeWSt1ypUwvCgjCK+KdFEfSgCiHzqKok6jE
 1qRBcqztaqKmfBRXKW6c2vCfjbg2G0JTEXMlSHbbYUQJAs+CmScR5xQdGUSh2T8fVB
 Uyv3XEl2W9O2QNJ9TWwdm6aENBNQJTeczYB0GGj2fMacEeSDw+KD9eiN9uaN/POm/s
 jFIe3zspDGv0A==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 04/20] ASoC: sta32x: Use modern ASoC DAI format terminology
Date: Thu,  2 Jun 2022 15:53:00 +0200
Message-Id: <20220602135316.3554400-5-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220602135316.3554400-1-broonie@kernel.org>
References: <20220602135316.3554400-1-broonie@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=858; h=from:subject;
 bh=jRLUgUntU2fruxLhA+W/LLYekTcTbLPo5lIlqi7/X/s=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBimMCRzCX2Ws+l5zKiD5EchYFHv5T4guU9Wa7gxzP0
 ECe5zJ6JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYpjAkQAKCRAk1otyXVSH0AeBB/
 0fyiJKEcggu7tTU1FXTyAGTkan7/oFi6jiQZU4Kj+JorsMXMpoJQ7NZkiZziT9Xd2fB1judZSKiobL
 Yum8IgScOqQnMMgBSMC96P0RuQ0CmgmN3S/8YGJArMqNGSZRgc3z+tcamyjDdfpHEmOUB9RX7VU+/r
 DzC5H7dputF2/1a2FQzpOS4pCMuhBh3Mw2cWRRrYqxjYGVWZEpFzxBOyYK5KJRPFqeXBGYjC8S4rvV
 5rnLDIENTbTMR/o/vUxkBLc4cyynttDH46Y4oDO6W6w+puLNCSHtU05uBy1xSAKj2Mwvk54R1XIxWf
 SqnSARuutRkfU6VM61CoSn1QUQZiCg
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
the sta32x driver to use more modern terminology for clocking.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/sta32x.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/sta32x.c b/sound/soc/codecs/sta32x.c
index 8585cbef4c9b..17e5077f26b0 100644
--- a/sound/soc/codecs/sta32x.c
+++ b/sound/soc/codecs/sta32x.c
@@ -601,8 +601,8 @@ static int sta32x_set_dai_fmt(struct snd_soc_dai *codec_dai,
 	struct sta32x_priv *sta32x = snd_soc_component_get_drvdata(component);
 	u8 confb = 0;
 
-	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBS_CFS:
+	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_CBC_CFC:
 		break;
 	default:
 		return -EINVAL;
-- 
2.30.2

