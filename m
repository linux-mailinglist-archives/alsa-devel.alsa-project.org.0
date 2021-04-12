Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D0A35CBA7
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Apr 2021 18:26:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 22455886;
	Mon, 12 Apr 2021 18:25:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 22455886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618244791;
	bh=rpdgFhLrmpF29BnjQ1VzPP58BjoQnTrm3QDnhmnQTkE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KrbfQgQ1DDzdJBEG5dbs3uKx8tC2TtrlW/dStniIxTxkrEQklZv4xwh6lWcquq+F8
	 95E+lHfmdYLoAtGsDRJHH1FPl6R96vB2EzgvlDN+KnwT6IuDOd44MnaVx0i5vsBK4A
	 gqko45igVPr8mCZQc955Xo+mMqboVQYfc5LJj9aE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 69C70F80431;
	Mon, 12 Apr 2021 18:24:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8BBC6F80424; Mon, 12 Apr 2021 18:24:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4DF27F8032D
 for <alsa-devel@alsa-project.org>; Mon, 12 Apr 2021 18:24:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4DF27F8032D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="mPcOlbLQ"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8834261287;
 Mon, 12 Apr 2021 16:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618244658;
 bh=rpdgFhLrmpF29BnjQ1VzPP58BjoQnTrm3QDnhmnQTkE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mPcOlbLQ33uAExBINnJVHxQUScKoXT59CfXnvgo5voWFT2SlTam3Klnns0rMx/jWC
 V81LBMJadKrJY3VLQzZCWXlrr4VE3fIDEgYvZ3hRzOGjepGY9Z4xp7joIcYY7fXCUp
 L4ROSCKNV9cbUcgzzkPKpxO6NjHiokJR1tvd9s+DoIPOnAPF3qNZ3aSMQy46mSeqqS
 L3IX8wIFna5x0f+pJud8puvERGJGjjiFssFEINQFJEy2MHoAr9WeLVwhxenfgz5sn7
 LSfxw5ItAsYF9qXlkpWOxVPNAJbx+MFI9VT3tMg7KnM/Tc6kuIY94AhxRtEkBvpV/N
 uUkaZG5zhX68Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 13/46] ASoC: max98373: Added 30ms turn on/off
 time delay
Date: Mon, 12 Apr 2021 12:23:28 -0400
Message-Id: <20210412162401.314035-13-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210412162401.314035-1-sashal@kernel.org>
References: <20210412162401.314035-1-sashal@kernel.org>
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
index 929bb1798c43..1fd4dbbb4ecf 100644
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

