Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E1435CB9B
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Apr 2021 18:25:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E20AE1658;
	Mon, 12 Apr 2021 18:24:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E20AE1658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618244700;
	bh=Oq6q44LBvAj0lfK0gaUxdqUdFLMZsSm/bJnLTGpQ7g4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=X87LHohRP+0UA/vh5oxKs9Tc/CkC57y26v3kxkQnpB+sSumi4wcHWlRdQFPlnzbrS
	 uBGrvF2V4nkXrx5XJP4NLHIxU1w7jR+sQRBdu9k/8qFK8bHW3nqQkIzog3v+qBZU2/
	 8qFkIrjQl6Ysnj7OChhiTWHZJZPLoW4EkbKCbHXk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 59E1EF8025B;
	Mon, 12 Apr 2021 18:23:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7A682F80271; Mon, 12 Apr 2021 18:23:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5A6D4F800FF
 for <alsa-devel@alsa-project.org>; Mon, 12 Apr 2021 18:23:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A6D4F800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="XK8kBZtM"
Received: by mail.kernel.org (Postfix) with ESMTPSA id BC6D961241;
 Mon, 12 Apr 2021 16:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618244594;
 bh=Oq6q44LBvAj0lfK0gaUxdqUdFLMZsSm/bJnLTGpQ7g4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XK8kBZtM2VzFxNvYw2nbhz+pSx0KzVFpfituDVs2HpFfFfETxKzSCvrhjJm7YYu3Q
 kbtdgB50nEJS2CTOpBvbW2cPfD3+PV0Lkptph3H4qClw7ejwofqCM5KLGgpHuEa+hN
 mynxk4V3QsEB5jPFyggoLer7bqaJBOFFOADy5o7V2HFRYfLr+KaeYHBJcfknmwigTv
 3O5Wlwil3AOrLmyK/XivFwBmnCm9qXTQIYcsXAd02Go06rP+AstU1xsib+Sd+b7vlu
 Y5YHTxhLjN0qnCwkHkgOpuDUzEP6+j3NgcplbDTUnBdzKrbWdIIP40Ix5HMxI87pAG
 8lQUiVTGHCRJg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.11 14/51] ASoC: max98373: Added 30ms turn on/off
 time delay
Date: Mon, 12 Apr 2021 12:22:19 -0400
Message-Id: <20210412162256.313524-14-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210412162256.313524-1-sashal@kernel.org>
References: <20210412162256.313524-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, Ryan Lee <ryans.lee@maximintegrated.com>
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

From: Ryan Lee <ryans.lee@maximintegrated.com>

[ Upstream commit 3a27875e91fb9c29de436199d20b33f9413aea77 ]

Amp requires 10 ~ 30ms for the power ON and OFF.
Added 30ms delay for stability.

Signed-off-by: Ryan Lee <ryans.lee@maximintegrated.com>
Link: https://lore.kernel.org/r/20210325033555.29377-2-ryans.lee@maximintegrated.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/max98373.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/max98373.c b/sound/soc/codecs/max98373.c
index 746c829312b8..1346a98ce8a1 100644
--- a/sound/soc/codecs/max98373.c
+++ b/sound/soc/codecs/max98373.c
@@ -28,11 +28,13 @@ static int max98373_dac_event(struct snd_soc_dapm_widget *w,
 		regmap_update_bits(max98373->regmap,
 			MAX98373_R20FF_GLOBAL_SHDN,
 			MAX98373_GLOBAL_EN_MASK, 1);
+		usleep_range(30000, 31000);
 		break;
 	case SND_SOC_DAPM_POST_PMD:
 		regmap_update_bits(max98373->regmap,
 			MAX98373_R20FF_GLOBAL_SHDN,
 			MAX98373_GLOBAL_EN_MASK, 0);
+		usleep_range(30000, 31000);
 		max98373->tdm_mode = false;
 		break;
 	default:
-- 
2.30.2

