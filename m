Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 275BD537DF9
	for <lists+alsa-devel@lfdr.de>; Mon, 30 May 2022 15:46:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AAC0C1F00;
	Mon, 30 May 2022 15:46:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AAC0C1F00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653918413;
	bh=eSwQJ4MdzEqPLyRF0dMCA29MT+ipw7FAuQyfMB7EKTo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=L4x7IhmgRbO7eww005uJDLSfWs7YEEtmKnQJZIUs9jFMmoWbz2TxBk5dJUh2MunW8
	 1hSJiqeJqqX+wP8EzoOsTABEP1dRvfCLiOZaGGy4VDxjB0644cctAmfWCQYQMqoVRR
	 3P3PaW0ZBV6WDlAcmDPbyNDZoHKGxDckuL6q2VTc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 362B7F8051B;
	Mon, 30 May 2022 15:45:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 89709F804EC; Mon, 30 May 2022 15:45:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8C917F8019D
 for <alsa-devel@alsa-project.org>; Mon, 30 May 2022 15:45:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8C917F8019D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="iIs6a9U5"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 390F560FB4;
 Mon, 30 May 2022 13:45:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 037DFC36AE7;
 Mon, 30 May 2022 13:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653918347;
 bh=eSwQJ4MdzEqPLyRF0dMCA29MT+ipw7FAuQyfMB7EKTo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iIs6a9U5Px7psAqlMuQ6B6Bei6l/CVkwsGhWhXcTEBluLTtXqwCAgwbufHu7OaFlD
 L6Cb/u5f9TRpIGp/szp9XFxV6LfPeDhiD5OBd859p8iYjs0gz0nWq45jeruvXMrgXc
 DiRqBSmeux/y+K5SYODJ2wEY6bBu/W6HAnwl44pRkVxNT6VGXe4ziSVvFKwMATRsgX
 vVrcJSbrhY7uhLOtkO3opK3w32GzSfAExKwyI7LP0hVj2y3fooq7IXGWmaKozjVn5H
 5fzB58Ij7j0rsUJiq50j15XVWwqoyK75c23qG2SPYE8v5He6c1JEkmLlgcpEZZdZV+
 aOpy344KjSzIw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 45/76] ASoC: tscs454: Add endianness flag in
 snd_soc_component_driver
Date: Mon, 30 May 2022 09:43:35 -0400
Message-Id: <20220530134406.1934928-45-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220530134406.1934928-1-sashal@kernel.org>
References: <20220530134406.1934928-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, steven.eckhoff.opensource@gmail.com,
 alsa-devel@alsa-project.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 tiwai@suse.com, lgirdwood@gmail.com, Mark Brown <broonie@kernel.org>
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

From: Charles Keepax <ckeepax@opensource.cirrus.com>

[ Upstream commit ff69ec96b87dccb3a29edef8cec5d4fefbbc2055 ]

The endianness flag is used on the CODEC side to specify an
ambivalence to endian, typically because it is lost over the hardware
link. This device receives audio over an I2S DAI and as such should
have endianness applied.

A fixup is also required to use the width directly rather than relying
on the format in hw_params, now both little and big endian would be
supported. It is worth noting this changes the behaviour of S24_LE to
use a word length of 24 rather than 32. This would appear to be a
correction since the fact S24_LE is stored as 32 bits should not be
presented over the bus.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Link: https://lore.kernel.org/r/20220504170905.332415-26-ckeepax@opensource.cirrus.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/tscs454.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/tscs454.c b/sound/soc/codecs/tscs454.c
index d0af16b4db2f..a6f339bb4771 100644
--- a/sound/soc/codecs/tscs454.c
+++ b/sound/soc/codecs/tscs454.c
@@ -3115,18 +3115,17 @@ static int set_aif_sample_format(struct snd_soc_component *component,
 	unsigned int width;
 	int ret;
 
-	switch (format) {
-	case SNDRV_PCM_FORMAT_S16_LE:
+	switch (snd_pcm_format_width(format)) {
+	case 16:
 		width = FV_WL_16;
 		break;
-	case SNDRV_PCM_FORMAT_S20_3LE:
+	case 20:
 		width = FV_WL_20;
 		break;
-	case SNDRV_PCM_FORMAT_S24_3LE:
+	case 24:
 		width = FV_WL_24;
 		break;
-	case SNDRV_PCM_FORMAT_S24_LE:
-	case SNDRV_PCM_FORMAT_S32_LE:
+	case 32:
 		width = FV_WL_32;
 		break;
 	default:
@@ -3321,6 +3320,7 @@ static const struct snd_soc_component_driver soc_component_dev_tscs454 = {
 	.num_dapm_routes = ARRAY_SIZE(tscs454_intercon),
 	.controls =	tscs454_snd_controls,
 	.num_controls = ARRAY_SIZE(tscs454_snd_controls),
+	.endianness = 1,
 };
 
 #define TSCS454_RATES SNDRV_PCM_RATE_8000_96000
-- 
2.35.1

