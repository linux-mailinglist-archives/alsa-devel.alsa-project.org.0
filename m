Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 44AF053BA48
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jun 2022 15:58:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DD55E17EC;
	Thu,  2 Jun 2022 15:57:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DD55E17EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654178305;
	bh=/hAIygZ9pnkY5BaakFen8njV1tYUtUcli6+CICPFStA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AOnX++RC2wzwkjMCqzN1ZjUHki+hFlId2ik78HRdm3XA8Yvil/wx/4m/WZ9cuXi7S
	 cvdQu9T6BVqYxGynRSb5H4MRATzlhbtJFddi4EpHHuvuZj8IF/I10RwzcMbqVEC0Uu
	 BJTXZ0vpzaiSAqd7YIEHkYvlPwHVu227k1sJ/E1c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 13BFCF805B0;
	Thu,  2 Jun 2022 15:53:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 400A3F8057B; Thu,  2 Jun 2022 15:53:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 54AA3F8055C
 for <alsa-devel@alsa-project.org>; Thu,  2 Jun 2022 15:53:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54AA3F8055C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="dDhOIZc/"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8E601617C2;
 Thu,  2 Jun 2022 13:53:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AD16C34119;
 Thu,  2 Jun 2022 13:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654178018;
 bh=/hAIygZ9pnkY5BaakFen8njV1tYUtUcli6+CICPFStA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dDhOIZc/fEBkwiMl5SYcEcQto1XoXJ38BdgTb1GA219qZlLzRPpZNPZhPbtk2NfvZ
 Y+ARy2mMeWk54t0CA7EEgYADxj8gmKGwneh06HfjrgvWMWBA85v2XvD0IqfNPYnBvM
 hJPmRvNcmy3ffnsUQS0TsWYExe0INCrG9ueI8NZWAqIJFAP/grkPLpQgwARDvx+8Yt
 kMvSIjdfEo5jZABWZsdMNbYYDPC3g90xJYoHrpZe3Ky79P+G7rGAV6cIwDN+l9v2lf
 YBavhyZxygJukLJuIUFEWpZHi509qyyVLHePVJcLCo9bIsZQmVZGWS8zZBihlebztH
 RS9SmrgE8RTIQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 14/20] ASoC: tlv320adcx140: Use modern ASoC DAI format
 terminology
Date: Thu,  2 Jun 2022 15:53:10 +0200
Message-Id: <20220602135316.3554400-15-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220602135316.3554400-1-broonie@kernel.org>
References: <20220602135316.3554400-1-broonie@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1214; h=from:subject;
 bh=/hAIygZ9pnkY5BaakFen8njV1tYUtUcli6+CICPFStA=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBimMCZK5X3HpB45fnqGedG4HE0s6HAAZO031iw2s4C
 6Q26sliJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYpjAmQAKCRAk1otyXVSH0E6rCA
 CAcT/u8Kj47kyxiBcwPnV9G9uXQQgs0lFMrm2ePxg4rcguKHygnoaZBLPn9YT7PV2gcktgqciRsxal
 sw2ly24jmXxuO4MiVszjbMu0GZByT/AOh+SXqyYI6/nmkIzTaboRlruI9yME9jmu32s4VYtRzRXPiu
 MAZ83qGbin1wPHvnJ6bnz8n0IbViqm4hh50FaSJu1UmCGdXyffOkrMcidrwgv0iocLRpCB5RK9mtJ1
 PpPy24Q7t+0FkBYOH7NKBuPbAvGC6eLuriwyLC4cQyvTpEFd0uAhEBUSgFgjEpd4ZOtKFVz0IoLZAv
 hMU1U8fPpLMAtMb4YmDYPdmj0jZrd2
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
the tlv320adcx140 driver to use more modern terminology for clocking.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/tlv320adcx140.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/tlv320adcx140.c b/sound/soc/codecs/tlv320adcx140.c
index b55f0b836932..de5b184a701e 100644
--- a/sound/soc/codecs/tlv320adcx140.c
+++ b/sound/soc/codecs/tlv320adcx140.c
@@ -713,16 +713,14 @@ static int adcx140_set_dai_fmt(struct snd_soc_dai *codec_dai,
 	bool inverted_bclk = false;
 
 	/* set master/slave audio interface */
-	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
+	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_CBP_CFP:
 		iface_reg2 |= ADCX140_BCLK_FSYNC_MASTER;
 		break;
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		break;
-	case SND_SOC_DAIFMT_CBS_CFM:
-	case SND_SOC_DAIFMT_CBM_CFS:
 	default:
-		dev_err(component->dev, "Invalid DAI master/slave interface\n");
+		dev_err(component->dev, "Invalid DAI clock provider\n");
 		return -EINVAL;
 	}
 
-- 
2.30.2

