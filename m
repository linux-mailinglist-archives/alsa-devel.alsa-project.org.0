Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B43357AC1E
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Jul 2022 03:19:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B243D174C;
	Wed, 20 Jul 2022 03:18:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B243D174C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658279971;
	bh=BiPu7IBBR2brm+PqFi+w9/gfl6QvQ7raQDaUom1d4sE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kalfrtDcR8B6eGWxE1Sifjo65wnuKpZSEKDYjnuPMBqyJfGdFq3ioFBYJBUIO4my8
	 mowijnoYiUn12NYltoX1S2XjG4efMBUUTZZOnFH6JpNoUhOUTLduvPxYgwXqfPi5dA
	 i1adgxCqJ119CxnwK8Q0QaeF0JskD+216vOaR7bk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CFD45F800BA;
	Wed, 20 Jul 2022 03:17:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F0414F80549; Wed, 20 Jul 2022 03:17:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D908AF8054A
 for <alsa-devel@alsa-project.org>; Wed, 20 Jul 2022 03:17:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D908AF8054A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="i/N39oaM"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B80E4B81DE6;
 Wed, 20 Jul 2022 01:17:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D45DC341CB;
 Wed, 20 Jul 2022 01:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658279838;
 bh=BiPu7IBBR2brm+PqFi+w9/gfl6QvQ7raQDaUom1d4sE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=i/N39oaM3GO0KDeLL5/RJrmBIolbmKL3MPHQFLB/WK5PwMbmIYtGhJqvlSxKWP1fA
 3ID3qX8+tU1r2rve9CU+AnROvxTjQLFDvxzdM8hHmgFHJQTDDu20+p9h3zD9OZXovZ
 cMGteji5P6hU53bWTTzu8JabB5HJXh2sx3X3O7cCYI/9uXHzFfu85mnPtMqnyyBNWx
 RBOns7Es4cbUmkx/n+/sEkApSA8A914Z3T4m/dRdWJX5AtZSVA9qvbLc0FTHVdMdd9
 LpFvRSRdsqx3oaJx9lXAZACIHBX3XumhBmOpXXXvIW/D6neAcq3LMkWNWlpaCKOP/1
 B7yjQO6LfCy2A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 19/25] ASoC: arizona: Update
 arizona_aif_cfg_changed to use RX_BCLK_RATE
Date: Tue, 19 Jul 2022 21:16:10 -0400
Message-Id: <20220720011616.1024753-19-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220720011616.1024753-1-sashal@kernel.org>
References: <20220720011616.1024753-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Charles Keepax <ckeepax@opensource.cirrus.com>, patches@opensource.cirrus.com,
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

[ Upstream commit f99e930655f411453170a5f332e12c2d2748822e ]

Currently the function arizona_aif_cfg_changed uses the TX_BCLK_RATE,
however this register is not used on wm8998. This was not noticed as
previously snd_soc_component_read did not print an error message.
However, now the log gets filled with error messages, further more the
test for if the LRCLK changed will return spurious results.

Update the code to use the RX_BCLK_RATE register, the LRCLK parameters
are written to both registers and the RX_BCLK_RATE register is used
across all Arizona devices.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Link: https://lore.kernel.org/r/20220628153409.3266932-4-ckeepax@opensource.cirrus.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/arizona.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/arizona.c b/sound/soc/codecs/arizona.c
index 1228f2de0297..65b0f6585c80 100644
--- a/sound/soc/codecs/arizona.c
+++ b/sound/soc/codecs/arizona.c
@@ -1759,8 +1759,8 @@ static bool arizona_aif_cfg_changed(struct snd_soc_component *component,
 	if (bclk != (val & ARIZONA_AIF1_BCLK_FREQ_MASK))
 		return true;
 
-	val = snd_soc_component_read(component, base + ARIZONA_AIF_TX_BCLK_RATE);
-	if (lrclk != (val & ARIZONA_AIF1TX_BCPF_MASK))
+	val = snd_soc_component_read(component, base + ARIZONA_AIF_RX_BCLK_RATE);
+	if (lrclk != (val & ARIZONA_AIF1RX_BCPF_MASK))
 		return true;
 
 	val = snd_soc_component_read(component, base + ARIZONA_AIF_FRAME_CTRL_1);
-- 
2.35.1

