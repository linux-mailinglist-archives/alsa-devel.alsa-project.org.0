Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E7E4C05CA
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Feb 2022 01:16:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CAC5218D8;
	Wed, 23 Feb 2022 01:15:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CAC5218D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645575374;
	bh=SzlAXdVuw+ps8aO9KxRcQf+M5Gf0kxkrkkGwJYN+kbc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fuEWBYJquW5JrHEMnDiVZndPwttO0pok0YYFXGyYerOAoEMPGgfAH4Gp1XDQeDcH2
	 nRdgBtr6t6Dvrbqkiq7+Brys1OfDn3ETMAmiGUUBkuVPOL7tEzjRANOslZ5TDRBEst
	 g+GXAsJR3YZ5+5PHEps9Xkg3AtcWlyJ+5BB9nL80=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2CAD8F801F5;
	Wed, 23 Feb 2022 01:15:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1E2D0F801EC; Wed, 23 Feb 2022 01:15:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B7812F800F5
 for <alsa-devel@alsa-project.org>; Wed, 23 Feb 2022 01:15:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7812F800F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ByH682fR"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C76EF61260;
 Wed, 23 Feb 2022 00:14:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35E9FC340E8;
 Wed, 23 Feb 2022 00:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645575299;
 bh=SzlAXdVuw+ps8aO9KxRcQf+M5Gf0kxkrkkGwJYN+kbc=;
 h=From:To:Cc:Subject:Date:From;
 b=ByH682fRXtXy6AxL93rA0gEUTHqBfkqIQWOYcBVem+mYut5un2ArRdp3/gQGHN8go
 PW569cgQvQuff2HRF3jySpesj70nkE4X2+0OQz9qAw8uM8/24lUeeW7Tz4LJs5KYNq
 SLppWmyVutd039kFYqJ+GmPfvuTZMBUnmpTLU/Hhgsu7jZ/AVq6lVoAGjg00LOs0Wl
 9Z2AEIK4KVRm4TwM//P0zkZdwg62PVjrU7Xp8do35kGSoCrlrchmzU6RL0DahSX6fF
 C449rnIcIH/Y5+PkshdynKEphGu5hOwuxnEbkvZA9nYbpPowJ2rgM46X3kiqHtkaOM
 u/jGKNPf4SGSw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH] ASoC: mc13783: Use modern ASoC DAI format terminology
Date: Wed, 23 Feb 2022 00:14:16 +0000
Message-Id: <20220223001416.1235951-1-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1583; h=from:subject;
 bh=SzlAXdVuw+ps8aO9KxRcQf+M5Gf0kxkrkkGwJYN+kbc=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBiFXw9D2g/wH2PHiOq2+CH6JoA58lXtBQhLdeuP04c
 2AFIRjaJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYhV8PQAKCRAk1otyXVSH0AFSB/
 9IaJE8WKroKO485pcF+d1nsoIW2O8FP1VCXMroSSO4GEv9yJdfGjLDF/KDmgjMcAzhWzfaPhqqVZx2
 6mHDw3RhwhBRNHs7fe0CRqnDzXD+5mr5rdi9/Y/7GmXYHkmmB9akRshiD/1iRdMEK/FgyE5G9653ae
 AFc1Ak9sfY/0LtzZ9P+GZqOScTcteqnSOQJXZdVIdSy6xAAag7Mz2HdzFSQaqwW1t6ZN03aV3xl7Hc
 OoFPtTKV03HD1bKmj7+vSbSVGiNcXy/RKkHPZg/c8L15ebMNFYaiiaoApRRY1daT3ykuqAo4UyuTHW
 46mBc14WzEqa0T/c/RVtuBs/yWHdbr
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
the mc13783 driver to use more modern terminology for clocking.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/mc13783.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/mc13783.c b/sound/soc/codecs/mc13783.c
index a21072503cb9..08517547e66c 100644
--- a/sound/soc/codecs/mc13783.c
+++ b/sound/soc/codecs/mc13783.c
@@ -181,15 +181,14 @@ static int mc13783_set_fmt(struct snd_soc_dai *dai, unsigned int fmt,
 	}
 
 	/* DAI clock master masks */
-	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
+	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_CBP_CFP:
 		val |= AUDIO_C_CLK_EN;
 		break;
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		val |= AUDIO_CSM;
 		break;
-	case SND_SOC_DAIFMT_CBM_CFS:
-	case SND_SOC_DAIFMT_CBS_CFM:
+	default:
 		return -EINVAL;
 	}
 
@@ -217,11 +216,11 @@ static int mc13783_set_fmt_sync(struct snd_soc_dai *dai, unsigned int fmt)
 		return ret;
 
 	/*
-	 * In synchronous mode force the voice codec into slave mode
+	 * In synchronous mode force the voice codec into consumer mode
 	 * so that the clock / framesync from the stereo DAC is used
 	 */
-	fmt &= ~SND_SOC_DAIFMT_MASTER_MASK;
-	fmt |= SND_SOC_DAIFMT_CBS_CFS;
+	fmt &= ~SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK;
+	fmt |= SND_SOC_DAIFMT_CBC_CFC;
 	ret = mc13783_set_fmt(dai, fmt, MC13783_AUDIO_CODEC);
 
 	return ret;
-- 
2.30.2

