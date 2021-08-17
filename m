Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C2EF3EE151
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Aug 2021 02:38:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8783282B;
	Tue, 17 Aug 2021 02:37:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8783282B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629160709;
	bh=nMryLALSi7yP68Vb4DKGbdjHVlWFnxFDeXBuYmU90kg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dot/dp55taq2D0WmceLhhHo3bV8qwUu7y5zor98U4GlwBlGlSCCylArmJpSgE51JZ
	 kfoPVIHmaOJnGAiMAyG7/sjm2uRrWjcWL6cGQvxnhFhOqvvRy3k08Kbnf5b5De5V/P
	 wa5LyDPZWbGMpPV/OlkCfDh50eeCobz1QfuUa/6M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E113F804EC;
	Tue, 17 Aug 2021 02:36:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 18411F804EC; Tue, 17 Aug 2021 02:36:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A3F3EF800AF
 for <alsa-devel@alsa-project.org>; Tue, 17 Aug 2021 02:35:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3F3EF800AF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="pBphr/dn"
Received: by mail.kernel.org (Postfix) with ESMTPSA id E33C460240;
 Tue, 17 Aug 2021 00:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629160556;
 bh=nMryLALSi7yP68Vb4DKGbdjHVlWFnxFDeXBuYmU90kg=;
 h=From:To:Cc:Subject:Date:From;
 b=pBphr/dnRobd9hFg2AurQqXz3xExYkQ9n+8duy1MdGLi8BogYMCHLcE3NXRDLE0Rc
 Xv9wPvtYE2zyegW6iTimuUNBR80iSJXTP/Lnq9aI/KsucF/y0MHJwTjgrejNu/23fS
 vaRUcoRKkgG5P3sQb43n8PE2Mx9472huSe7NGVwrICMQ89jFWeC2reco9WIH6C/Eqy
 Z7fLq/onWVR7EKxXPDXH/dio456vMuOP5Ol3bzpcakZ7wuXknMBHh1Ul5jlovab+f+
 UjcxjHa15jrJtb+eDJyDOhLLbySqNgag91t+VMPq3BL/QuUpTxuqJTPbcwGv9bD8R9
 ZrtKNN0J3tFRg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 1/9] ASoC: rt5682: Adjust headset volume button
 threshold
Date: Mon, 16 Aug 2021 20:35:46 -0400
Message-Id: <20210817003554.83213-1-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, Derek Fang <derek.fang@realtek.com>
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

From: Derek Fang <derek.fang@realtek.com>

[ Upstream commit 6d20bf7c020f417fdef1810a22da17c126603472 ]

Adjust the threshold of headset button volume+ to fix
the wrong button detection issue with some brand headsets.

Signed-off-by: Derek Fang <derek.fang@realtek.com>
Link: https://lore.kernel.org/r/20210721133121.12333-1-derek.fang@realtek.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/rt5682.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/rt5682.c b/sound/soc/codecs/rt5682.c
index 2e41b8c169e5..0486b1469799 100644
--- a/sound/soc/codecs/rt5682.c
+++ b/sound/soc/codecs/rt5682.c
@@ -44,6 +44,7 @@ static const struct reg_sequence patch_list[] = {
 	{RT5682_I2C_CTRL, 0x000f},
 	{RT5682_PLL2_INTERNAL, 0x8266},
 	{RT5682_SAR_IL_CMD_3, 0x8365},
+	{RT5682_SAR_IL_CMD_6, 0x0180},
 };
 
 void rt5682_apply_patch_list(struct rt5682_priv *rt5682, struct device *dev)
-- 
2.30.2

