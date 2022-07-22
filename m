Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CC4A457DD7A
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Jul 2022 11:28:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 322291899;
	Fri, 22 Jul 2022 11:27:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 322291899
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658482099;
	bh=bR415wpcpzInVOGQ1me2DQTG9wsahBgZxpUeugmZq4I=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Ajig643LbEJiLza3gUbndfEx8nyMVehRVOYShKCOBnsPsgS8usCp7GrDg5lzc3qe7
	 sX7LcrwbzrmgLevl5dvp3xz03b8kDf6u9Tshe2MFqEEOjevD/ZFep1Gjob+zVUk40M
	 tOnpMZfeU4Y/cceWysOgg4/EcL402NiM9ih7Dwdg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3DC12F8012A;
	Fri, 22 Jul 2022 11:27:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 19C4AF80246; Fri, 22 Jul 2022 11:27:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 28168F8012A
 for <alsa-devel@alsa-project.org>; Fri, 22 Jul 2022 11:27:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28168F8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="Dk32ejND"
Received: from localhost (unknown [188.24.146.105])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 80F716601AC4;
 Fri, 22 Jul 2022 10:27:07 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1658482027;
 bh=bR415wpcpzInVOGQ1me2DQTG9wsahBgZxpUeugmZq4I=;
 h=From:To:Cc:Subject:Date:From;
 b=Dk32ejNDLIMGxJmAmpNv5o5jh5RCm70WybaUz7EfJBzMHza2oj+KmRHJz/nKi78uE
 cTa5+6j9fyTIbX+VW/PswFNWL0+BdX/kDsIL97uZzawV6zbziDJHVbbbSubW2UywLz
 Z+A4X26aQsqqhJR/EundNctUzBO+kC8+M1ZiWmJkk6t85RhuTQnQ/5qHX5L/Pe+yZs
 fxQk3obJzuXNEbLufIgoApAzz1MyWt8Kzpc2zUQOKwSA7HIK1/QUnq5dm6GOhNbE0+
 cP/EmcsUMt2NC/BcfnwljwyYTl1ZSrWG8RJN9+2PgvGUzydUGrTpC5/rUul/mUUVcn
 CkpK5sbJDJjVg==
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: [PATCH v2] ASoC: amd: vangogh: Use non-legacy DAI naming for cs35l41
Date: Fri, 22 Jul 2022 12:27:00 +0300
Message-Id: <20220722092700.8269-1-cristian.ciocaltea@collabora.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, kernel@collabora.com,
 linux-kernel@vger.kernel.org
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

Unlike most CODEC drivers, the CS35L41 driver did not have the
non_legacy_dai_naming set, meaning the corresponding DAI has been
traditionally registered using the legacy naming: spi-VLV1776:0x

The recent migration to the new legacy DAI naming style has implicitly
corrected that behavior and DAI gets now registered via the non-legacy
naming, i.e. cs35l41-pcm.

The problem is the acp5x platform driver is now broken as it continues
to refer to the above mentioned codec using the legacy DAI naming in
function acp5x_cs35l41_hw_params() and, therefore, the related setup
is not being executed anymore.

Let's fix that by replacing the obsolete DAI name with the correct one.

Fixes: 129f055a2144 ("ASoC: core: Switch core to new DAI naming flag")
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
Changes in v2:
 - Corrected the SHA for the Fixes commit
 - Added Reviewed-by tag from Charles

 sound/soc/amd/vangogh/acp5x-mach.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/amd/vangogh/acp5x-mach.c b/sound/soc/amd/vangogh/acp5x-mach.c
index 727de46860b1..af3737ef9707 100644
--- a/sound/soc/amd/vangogh/acp5x-mach.c
+++ b/sound/soc/amd/vangogh/acp5x-mach.c
@@ -178,8 +178,7 @@ static int acp5x_cs35l41_hw_params(struct snd_pcm_substream *substream,
 	ret = 0;
 	for (i = 0; i < num_codecs; i++) {
 		codec_dai = asoc_rtd_to_codec(rtd, i);
-		if ((strcmp(codec_dai->name, "spi-VLV1776:00") == 0) ||
-		    (strcmp(codec_dai->name, "spi-VLV1776:01") == 0)) {
+		if (strcmp(codec_dai->name, "cs35l41-pcm") == 0) {
 			switch (params_rate(params)) {
 			case 48000:
 				bclk_val = 1536000;
--
2.37.1
