Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B4940DC7B
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Sep 2021 16:10:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 810821891;
	Thu, 16 Sep 2021 16:10:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 810821891
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631801457;
	bh=C88hX+FGK/alul/N+3AtiDY/zUXu3XjpnSMlgvWGN1c=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=buugKmO5HsoKZEI3pn2FOx7362clVthcCwXM0jM43IRkCH/zPJ9DZ31mDZ1TnjMfZ
	 qfZJKGsxu0cWz5ZuaOw06AI2UuD2yW3uNuuNM6/m+++3+lXXSNSeVPsvW1pIS+PAaE
	 Wzu9dndTA8ZzSgGe522Z2qWMp8Zig7dl5RZaRBi0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D0A75F8025A;
	Thu, 16 Sep 2021 16:09:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 66E21F8025E; Thu, 16 Sep 2021 16:09:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D4FA3F80117
 for <alsa-devel@alsa-project.org>; Thu, 16 Sep 2021 16:09:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D4FA3F80117
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="FQrgnvXI"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 36FFC60238;
 Thu, 16 Sep 2021 14:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631801370;
 bh=C88hX+FGK/alul/N+3AtiDY/zUXu3XjpnSMlgvWGN1c=;
 h=From:To:Cc:Subject:Date:From;
 b=FQrgnvXIo8ezbM9ocFoQXrw9RT12KQ0d82oeZ7Ug+SDSxOAwN5xtKpQ7qpyaZto4p
 30FRWjkQmcLvqCgLKUAhdWoQA6sVhKCSyXVUaDdGGOx4zFq3H7Y/HlPoAoJZPJrLm0
 SXtPRT5J85lzH1pN7h5QDVtakBWzGGW+Nwm3nOfrbPEbiOZ6SOFW+3phYZ5qzAtJsx
 CEGIcYXyaX1YKbJrhbj7s+EYbmZUW35vVtPBJGefHb9cMniqVGgMSb0CUBLUFHirsK
 JEYLlu+09TWhlcTmMo8LjdNUY5Ld0G/AcVlvutodThvyl98nWGLyYPKdeITAmZ6kGz
 cmAO7RgJouidQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH] ASoC: 88pm860x: Update to modern clocking terminology
Date: Thu, 16 Sep 2021 15:08:47 +0100
Message-Id: <20210916140847.50900-1-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1907; h=from:subject;
 bh=C88hX+FGK/alul/N+3AtiDY/zUXu3XjpnSMlgvWGN1c=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBhQ0+Oca6lWRBTmDhCPuLIpET6ybxLuDzjOzY2i7x9
 9d4444+JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYUNPjgAKCRAk1otyXVSH0KeAB/
 94vmAr9BjiVhrosL38OMl/0bYjsBDkzDLjPyt2hKu9bIHzFcZ03XbKx1d+o5Cr/LZvIG3VoFADAIm0
 V4PrGsAVQ+qZu/3aIJNnQnz4lhuSaMmQAUYTZZvYguPxu9NvhN3Lx2u8tn78gADl5AbzAsIqvlVTA5
 O7cAPx2DCc/OjdOJHEntxBaJQ8tmr++BK9f9Mt5vHJwla59jej4yh5H1vgk7vv4tbd7qGO5eA7XKxu
 5YAv2cfYJwzuMfu8Gihhh6jhhV2zVf+HApAk+u9edH5QVofsoMcFH6cAucM4Bt75HxT0av1TKqcTCs
 KpI6mMBGgfI9Dyok6qGSLcKzgr0U89
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
the 88pm860x driver to use more modern terminology for clocking.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/88pm860x-codec.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/sound/soc/codecs/88pm860x-codec.c b/sound/soc/codecs/88pm860x-codec.c
index cac7e557edc8..c6043fa58c74 100644
--- a/sound/soc/codecs/88pm860x-codec.c
+++ b/sound/soc/codecs/88pm860x-codec.c
@@ -968,16 +968,16 @@ static int pm860x_pcm_set_dai_fmt(struct snd_soc_dai *codec_dai,
 
 	mask |= PCM_INF2_BCLK | PCM_INF2_FS | PCM_INF2_MASTER;
 
-	/* set master/slave audio interface */
-	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
-	case SND_SOC_DAIFMT_CBM_CFS:
+	/* set audio interface clocking */
+	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_CBP_CFP:
+	case SND_SOC_DAIFMT_CBP_CFC:
 		if (pm860x->dir == PM860X_CLK_DIR_OUT) {
 			inf |= PCM_INF2_MASTER;
 			ret = 0;
 		}
 		break;
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		if (pm860x->dir == PM860X_CLK_DIR_IN) {
 			inf &= ~PCM_INF2_MASTER;
 			ret = 0;
@@ -1072,15 +1072,15 @@ static int pm860x_i2s_set_dai_fmt(struct snd_soc_dai *codec_dai,
 
 	mask |= PCM_INF2_BCLK | PCM_INF2_FS | PCM_INF2_MASTER;
 
-	/* set master/slave audio interface */
-	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
+	/* set audio interface clocking */
+	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_CBP_CFP:
 		if (pm860x->dir == PM860X_CLK_DIR_OUT)
 			inf |= PCM_INF2_MASTER;
 		else
 			return -EINVAL;
 		break;
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		if (pm860x->dir == PM860X_CLK_DIR_IN)
 			inf &= ~PCM_INF2_MASTER;
 		else
-- 
2.20.1

