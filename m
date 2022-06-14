Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AAB554A52D
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jun 2022 04:17:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2DFB818DC;
	Tue, 14 Jun 2022 04:16:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2DFB818DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655173042;
	bh=m++Hn3Fk2NwdqAxL7YXJgjX3tvqr/94r7cEDTL6dAr8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SeLLkmcSekgk2kRDlWGfIPtEHWb+e7qMm3o+2oVKTn6M0J9wEDVptyC9wU2HeQT1i
	 t+MXq1mkoAETZgaApha7FZwHmCbg0G4iwxS5mXulvJx7MJJTouaFIm350ilM6utn5Z
	 4ozd1gZu2PalQ2ZwRanZJbA6Ws9vPFHkPsi6DOys=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 15990F80615;
	Tue, 14 Jun 2022 04:08:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DB58BF8056F; Tue, 14 Jun 2022 04:08:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8B50AF80564
 for <alsa-devel@alsa-project.org>; Tue, 14 Jun 2022 04:08:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8B50AF80564
Authentication-Results: alsa1.perex.cz;
 dkim=fail reason="key not found in DNS" (0-bit key) header.d=kernel.org
 header.i=@kernel.org header.b="VFM5cHlz"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 092C160AD8;
 Tue, 14 Jun 2022 02:08:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A8F2C34114;
 Tue, 14 Jun 2022 02:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655172511;
 bh=m++Hn3Fk2NwdqAxL7YXJgjX3tvqr/94r7cEDTL6dAr8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VFM5cHlz3dB8VwsNjkoNhKPWtql0cvtMDErBgAXDvTiRv6Mk8C9RKwRE5ICsblLwG
 94zmsYmNL1D1MNayJ3ptUVXm21emNaDu4SB36SQtPX5VFHJrcrk1oc3s6MbxxAGls+
 we3H2TdsV9ms0+wKXkDpKN1fL3KcqROQhXQz0Bn/nU8cIzuFSsOwXJOV3CzYdifCL7
 a10JCf26C2AGQGkxuKK3BOt2e9z6gzcO02LCJvc3+QsnfIEtVEcOTDjvZ4qVkeV/hG
 Cum+Qa3JQTKU+Oh6+pAMIhGGsRNVutE3noS3rLm57iFf8gZjTzGic/DTWJJmIuY+zC
 axHaWZkmNjnzw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 09/29] ASoC: cs42l51: Correct minimum value for
 SX volume control
Date: Mon, 13 Jun 2022 22:07:55 -0400
Message-Id: <20220614020815.1099999-9-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220614020815.1099999-1-sashal@kernel.org>
References: <20220614020815.1099999-1-sashal@kernel.org>
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

[ Upstream commit fcb3b5a58926d16d9a338841b74af06d4c29be15 ]

The minimum value for the PGA Volume is given as 0x1A, however the
values from there to 0x19 are all the same volume and this is not
represented in the TLV structure. The number of volumes given is correct
so this leads to all the volumes being shifted. Move the minimum value
up to 0x19 to fix this.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Link: https://lore.kernel.org/r/20220602162119.3393857-7-ckeepax@opensource.cirrus.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/cs42l51.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs42l51.c b/sound/soc/codecs/cs42l51.c
index c61b17dc2af8..fc6a2bc311b4 100644
--- a/sound/soc/codecs/cs42l51.c
+++ b/sound/soc/codecs/cs42l51.c
@@ -146,7 +146,7 @@ static const struct snd_kcontrol_new cs42l51_snd_controls[] = {
 			0, 0xA0, 96, adc_att_tlv),
 	SOC_DOUBLE_R_SX_TLV("PGA Volume",
 			CS42L51_ALC_PGA_CTL, CS42L51_ALC_PGB_CTL,
-			0, 0x1A, 30, pga_tlv),
+			0, 0x19, 30, pga_tlv),
 	SOC_SINGLE("Playback Deemphasis Switch", CS42L51_DAC_CTL, 3, 1, 0),
 	SOC_SINGLE("Auto-Mute Switch", CS42L51_DAC_CTL, 2, 1, 0),
 	SOC_SINGLE("Soft Ramp Switch", CS42L51_DAC_CTL, 1, 1, 0),
-- 
2.35.1

