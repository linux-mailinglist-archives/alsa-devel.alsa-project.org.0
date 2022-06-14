Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9222554A538
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jun 2022 04:20:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3737A190C;
	Tue, 14 Jun 2022 04:19:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3737A190C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655173208;
	bh=8Q/hRaHsPn+BJGJiuM3zr0zhutCo+TEYkn2w+A+kgoA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=I10pXxUdb9QmJmNEtiiAqgvsxNNDIg0+Bf1e18oZAQmyUxtBs3Ol3mBJALU5G6Urf
	 McGugD/rYUfwz2Uls10UWFCi7lGr2l4iZo86FxU36lFSVPcwG0HnvT4neIaQQ888Xq
	 bw8O7806rLMacg8TsDCxcn2kVtB38Ag9L0waFxU8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B2D8F80630;
	Tue, 14 Jun 2022 04:09:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D60D2F8063E; Tue, 14 Jun 2022 04:09:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 92D25F80137
 for <alsa-devel@alsa-project.org>; Tue, 14 Jun 2022 04:09:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92D25F80137
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="mFpSxhn1"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8048A61012;
 Tue, 14 Jun 2022 02:09:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B164FC385A2;
 Tue, 14 Jun 2022 02:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655172555;
 bh=8Q/hRaHsPn+BJGJiuM3zr0zhutCo+TEYkn2w+A+kgoA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mFpSxhn1fzya3p9aPcCt37wIPa8ReTBAOJ/xma9hedGkAwuaVJE4x1h95OzIT7pkU
 R80kRh1MwZOlzWipxIW+jsNopX5qqyu1BZTSFXbVxDL/QHcn0OMiUsCV8LNLSVg8D5
 WXAOwv3DkB+7F7E1SDbPggw30cn9kFiemzmo+vQ4lRAaVm6yCzzpH2/4eMw0gdWMel
 lAaWNIPt2O2rOVhoC/R9/Eg9IWpAe9KjBeFXNOAtU6pBPXw9MJxZloAJNhDyP3rmUr
 f7q5ojwM55wK1qFmPgMt1fm7ClYjK0b1AQONjlbO+nu1Kmg5KGXWs6ZOW9S5rwTNLC
 6MSSp3p9XQIjA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 08/23] ASoC: cs42l56: Correct typo in minimum
 level for SX volume controls
Date: Mon, 13 Jun 2022 22:08:44 -0400
Message-Id: <20220614020900.1100401-8-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220614020900.1100401-1-sashal@kernel.org>
References: <20220614020900.1100401-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, brian.austin@cirrus.com,
 Charles Keepax <ckeepax@opensource.cirrus.com>, alsa-devel@alsa-project.org,
 tiwai@suse.com, lgirdwood@gmail.com, Paul.Handrigan@cirrus.com,
 Mark Brown <broonie@kernel.org>
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

[ Upstream commit a8928ada9b96944cadd8b65d191e33199fd38782 ]

A couple of the SX volume controls specify 0x84 as the lowest volume
value, however the correct value from the datasheet is 0x44. The
datasheet don't include spaces in the value it displays as binary so
this was almost certainly just a typo reading 1000100.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Link: https://lore.kernel.org/r/20220602162119.3393857-6-ckeepax@opensource.cirrus.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/cs42l56.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/cs42l56.c b/sound/soc/codecs/cs42l56.c
index 51d7a87ab4c3..8be7d83f0ce9 100644
--- a/sound/soc/codecs/cs42l56.c
+++ b/sound/soc/codecs/cs42l56.c
@@ -391,9 +391,9 @@ static const struct snd_kcontrol_new cs42l56_snd_controls[] = {
 	SOC_DOUBLE("ADC Boost Switch", CS42L56_GAIN_BIAS_CTL, 3, 2, 1, 1),
 
 	SOC_DOUBLE_R_SX_TLV("Headphone Volume", CS42L56_HPA_VOLUME,
-			      CS42L56_HPB_VOLUME, 0, 0x84, 0x48, hl_tlv),
+			      CS42L56_HPB_VOLUME, 0, 0x44, 0x48, hl_tlv),
 	SOC_DOUBLE_R_SX_TLV("LineOut Volume", CS42L56_LOA_VOLUME,
-			      CS42L56_LOB_VOLUME, 0, 0x84, 0x48, hl_tlv),
+			      CS42L56_LOB_VOLUME, 0, 0x44, 0x48, hl_tlv),
 
 	SOC_SINGLE_TLV("Bass Shelving Volume", CS42L56_TONE_CTL,
 			0, 0x00, 1, tone_tlv),
-- 
2.35.1

