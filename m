Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B89393BF752
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Jul 2021 11:14:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B4171655;
	Thu,  8 Jul 2021 11:13:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B4171655
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625735649;
	bh=NWNPYEJ/BZAE4tON4Ez1jHn7pUhu6R8XBldJ5dvcX+Q=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=WwnZiCiLlcRmYH0l5Cl+4q2xs8uQMouyUwnZbiJc12ZRKsp2i/j2wkYm65tMOR772
	 /BBOG5qc6RfxAkX4INHrOWFJ7cYkfkE48HN+Az3wBxN/OTcTCeZWV0dpEK12VwXBEh
	 hNz6RefhfPwK/mqrar4orJLvzk10nMcNvu0Yd8RQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5C057F80259;
	Thu,  8 Jul 2021 11:12:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 07519F8012A; Thu,  8 Jul 2021 11:12:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D0B7EF8012A
 for <alsa-devel@alsa-project.org>; Thu,  8 Jul 2021 11:12:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0B7EF8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de
 header.b="YKMXUfU6"
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id C0EDD80661;
 Thu,  8 Jul 2021 11:12:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1625735552;
 bh=IDbXSfA9WgWUl324OfUj5IXalKW4jFt20fRBLf6DOuA=;
 h=From:To:Cc:Subject:Date:From;
 b=YKMXUfU6Q6ZpVMfxoQL/0c71vRzGdJpTS9KGXCzHobK/7p5eA0HMaMs4XsSC+D6xe
 cigCEJmu/0MmnsNmZ0C5jl1L6JH7rVQTGgSEdnkLotlPYeBNbnG2wQxOato/69alGE
 WjRKnu0/pwxXyJWXdgwBknuxfLhJDMjlLd2Jnbenr7B/7nGKsQqi0WPABU/R/d2kOw
 6ST0wsjUk3TdsmU3pk6WtXVfk2L6kXAgZcaPjmnPF7VVArTEhHWOHAfEkeldANq4SO
 17P5EHnfUuprjUX+KenRwnSmVm2jmC5DxrxvsI0Hy/tKMW6DTkJ2L8EKXKhueEJTuR
 2KVOrtOdOPeEw==
From: Marek Vasut <marex@denx.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: tlv320aic32x4: Fix TAS2505/TAS2521 channel count
Date: Thu,  8 Jul 2021 11:12:29 +0200
Message-Id: <20210708091229.56443-1-marex@denx.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>, Mark Brown <broonie@kernel.org>, ch@denx.de
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

The TAS2505/TAS2521 does support up to two channels, LEFT and RIGHT,
which are being alternated on the audio data bus by Word Clock, WCLK.
This is documented in TI slau472 2.7.1 Digital Audio Interface. Note
that both the LEFT and RIGHT channels are only used for audio INPUT,
while only the LEFT channel is used for audio OUTPUT.

Fixes: b4525b6196cd7 ("ASoC: tlv320aic32x4: add support for TAS2505")
Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Claudius Heine <ch@denx.de>
Cc: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/tlv320aic32x4.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/tlv320aic32x4.c b/sound/soc/codecs/tlv320aic32x4.c
index c63b717040ed2..8af739284fbec 100644
--- a/sound/soc/codecs/tlv320aic32x4.c
+++ b/sound/soc/codecs/tlv320aic32x4.c
@@ -1113,7 +1113,7 @@ static struct snd_soc_dai_driver aic32x4_tas2505_dai = {
 	.playback = {
 			 .stream_name = "Playback",
 			 .channels_min = 1,
-			 .channels_max = 1,
+			 .channels_max = 2,
 			 .rates = SNDRV_PCM_RATE_8000_96000,
 			 .formats = AIC32X4_FORMATS,},
 	.ops = &aic32x4_ops,
-- 
2.30.2

