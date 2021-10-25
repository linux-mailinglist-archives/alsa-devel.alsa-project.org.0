Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 599C0439C71
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Oct 2021 19:01:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AFE4616CF;
	Mon, 25 Oct 2021 19:00:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AFE4616CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635181274;
	bh=OrUiHOL1i3mXBRfwHV1zuqoY8KU2+QY55qJU/FNXOEU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vRmSVjqciUmYFfsg9Up4vM9lpZtdFoMSobX4/O05er33UP2Lt4BpHeSMB1fjF84tm
	 rwWEnZZetsQBz8MVjtZaHIJHd1XmT8N4iKbVVKgl7lL4sIaZ9jZzuaoPZEAV7tFXDb
	 WQ4tJQvgXE+LdSpnRPb8KCqI/4FesPoO/LicyGpU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A4E4F80086;
	Mon, 25 Oct 2021 18:59:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8651AF8025E; Mon, 25 Oct 2021 18:59:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 84270F80086
 for <alsa-devel@alsa-project.org>; Mon, 25 Oct 2021 18:59:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84270F80086
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Zqbhr+x9"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 06A3D60F6F;
 Mon, 25 Oct 2021 16:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635181185;
 bh=OrUiHOL1i3mXBRfwHV1zuqoY8KU2+QY55qJU/FNXOEU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Zqbhr+x94NhcMMT6woRH7V1cLfUCgXIr2QIy98iVovdHvM7lSPPmEJeeKrwko2BIK
 39HF8dqvfEFYBVjbuAMNsi784XvvaQrH6A7RKqrLsgyHj5UupTAQJuH7VLJU2xFp4a
 IEaAhr7+bu/vrlNzVy0bOHLN3PaZCfkLDclrnMIyjjYrUAnwvPXtTwEvlvj+lZ80LP
 FdIjr90d2mSEgVcRsT/CJ4bzaM1mH0bAoaAml0K5HeyB9/H4N0HsxreAD3cioCxu1L
 zgYj0emj071XUqBjJ/tjozHxkpNypeVQYMz8V1+/wd9F3S6jf2I+oPJQW3gVsD20hC
 z4Z7LtVkZn9rQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.14 03/18] ASoC: cs42l42: Ensure 0dB full scale
 volume is used for headsets
Date: Mon, 25 Oct 2021 12:59:16 -0400
Message-Id: <20211025165939.1393655-3-sashal@kernel.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211025165939.1393655-1-sashal@kernel.org>
References: <20211025165939.1393655-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>,
 Stefan Binding <sbinding@opensource.cirrus.com>, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, tiwai@suse.com, lgirdwood@gmail.com,
 david.rhodes@cirrus.com, Richard Fitzgerald <rf@opensource.cirrus.com>,
 Mark Brown <broonie@kernel.org>, james.schulman@cirrus.com
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

From: Stefan Binding <sbinding@opensource.cirrus.com>

[ Upstream commit aa18457c4af7a9dad1f2b150b11beae1d8ab57aa ]

Ensure the default 0dB playback path is always used.

The code that set FULL_SCALE_VOL based on LOAD_DET_RCSTAT was
spurious, and resulted in a -6dB attenuation being accidentally
inserted into the playback path.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Link: https://lore.kernel.org/r/20211011144903.28915-1-rf@opensource.cirrus.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/cs42l42.c | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
index 99c022be94a6..8838b9a0de8e 100644
--- a/sound/soc/codecs/cs42l42.c
+++ b/sound/soc/codecs/cs42l42.c
@@ -901,7 +901,6 @@ static int cs42l42_mute_stream(struct snd_soc_dai *dai, int mute, int stream)
 	struct snd_soc_component *component = dai->component;
 	struct cs42l42_private *cs42l42 = snd_soc_component_get_drvdata(component);
 	unsigned int regval;
-	u8 fullScaleVol;
 	int ret;
 
 	if (mute) {
@@ -972,20 +971,11 @@ static int cs42l42_mute_stream(struct snd_soc_dai *dai, int mute, int stream)
 		cs42l42->stream_use |= 1 << stream;
 
 		if (stream == SNDRV_PCM_STREAM_PLAYBACK) {
-			/* Read the headphone load */
-			regval = snd_soc_component_read(component, CS42L42_LOAD_DET_RCSTAT);
-			if (((regval & CS42L42_RLA_STAT_MASK) >> CS42L42_RLA_STAT_SHIFT) ==
-			    CS42L42_RLA_STAT_15_OHM) {
-				fullScaleVol = CS42L42_HP_FULL_SCALE_VOL_MASK;
-			} else {
-				fullScaleVol = 0;
-			}
-
-			/* Un-mute the headphone, set the full scale volume flag */
+			/* Un-mute the headphone */
 			snd_soc_component_update_bits(component, CS42L42_HP_CTL,
 						      CS42L42_HP_ANA_AMUTE_MASK |
-						      CS42L42_HP_ANA_BMUTE_MASK |
-						      CS42L42_HP_FULL_SCALE_VOL_MASK, fullScaleVol);
+						      CS42L42_HP_ANA_BMUTE_MASK,
+						      0);
 		}
 	}
 
-- 
2.33.0

