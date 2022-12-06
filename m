Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A880B644059
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Dec 2022 10:51:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3E21E1893;
	Tue,  6 Dec 2022 10:50:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3E21E1893
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670320290;
	bh=xApacaaiV8UL0u+br9ApSOYSXQZmwwuKKkSLgb+ZMvg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=U0kGlhBhLK0K5WgChkz4Zm5oeXV/X8UnoMyjWeEPZ/YHtUuR9cBconI5gGmbV9HgY
	 buUls0tGAdVKjTrgZ5l6ho7jrwyUWjc8Yo8o1+wRn/UT8cCscCdmfm670qkUS6SfFE
	 Y6SXa09lwB2RWbWQMtChhN6EAJrqzXdW2vHBwEPQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A5809F80571;
	Tue,  6 Dec 2022 10:49:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9FE84F80570; Tue,  6 Dec 2022 10:49:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AD1B6F80564
 for <alsa-devel@alsa-project.org>; Tue,  6 Dec 2022 10:49:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AD1B6F80564
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="HpxF3IeD"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5D64A61601;
 Tue,  6 Dec 2022 09:49:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C990FC433D6;
 Tue,  6 Dec 2022 09:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1670320187;
 bh=xApacaaiV8UL0u+br9ApSOYSXQZmwwuKKkSLgb+ZMvg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HpxF3IeDvdljyozWwEky1dkELuzJS+s5EbUpWmk2QnrZ/WccOorSqTkgLjru9r/++
 mfELsCqKyKm9LBIRLUvtsUwvd0wLco8bW7+qxvsFEKd1Wq8CHGtv9kR57bKM8mUvQf
 Lb0r6/OJTickN/ZNj1TmCkhL38IQGinDAOzioi8ikm3U7fYNrVgl9HCnvOKZiIrR8n
 CMnSJQow3+71tOr0+LQ5bfVdYsTWDTfOok0LkYNaGhC4E6ELu8Dueb/PHFZBOK+vPN
 ujvHPuIMo/l+VWeB6rCEpbp4Jmpb7ki45W5oNlG0UTZLgTfywk9ouq/RdjuE/pgcRn
 fOceDq7Kns1ig==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.0 10/13] ASoC: cs42l51: Correct PGA Volume minimum
 value
Date: Tue,  6 Dec 2022 04:49:13 -0500
Message-Id: <20221206094916.987259-10-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221206094916.987259-1-sashal@kernel.org>
References: <20221206094916.987259-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Charles Keepax <ckeepax@opensource.cirrus.com>, tanureal@opensource.cirrus.com,
 patches@opensource.cirrus.com, tiwai@suse.com, lgirdwood@gmail.com,
 david.rhodes@cirrus.com, rf@opensource.cirrus.com,
 Mark Brown <broonie@kernel.org>, james.schulman@cirrus.com
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

[ Upstream commit 3d1bb6cc1a654c8693a85b1d262e610196edec8b ]

The table in the datasheet actually shows the volume values in the wrong
order, with the two -3dB values being reversed. This appears to have
caused the lower of the two values to be used in the driver when the
higher should have been, correct this mixup.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Link: https://lore.kernel.org/r/20221125162348.1288005-2-ckeepax@opensource.cirrus.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/cs42l51.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs42l51.c b/sound/soc/codecs/cs42l51.c
index 51721edd8f53..e88d9ff95cdf 100644
--- a/sound/soc/codecs/cs42l51.c
+++ b/sound/soc/codecs/cs42l51.c
@@ -143,7 +143,7 @@ static const struct snd_kcontrol_new cs42l51_snd_controls[] = {
 			0, 0xA0, 96, adc_att_tlv),
 	SOC_DOUBLE_R_SX_TLV("PGA Volume",
 			CS42L51_ALC_PGA_CTL, CS42L51_ALC_PGB_CTL,
-			0, 0x19, 30, pga_tlv),
+			0, 0x1A, 30, pga_tlv),
 	SOC_SINGLE("Playback Deemphasis Switch", CS42L51_DAC_CTL, 3, 1, 0),
 	SOC_SINGLE("Auto-Mute Switch", CS42L51_DAC_CTL, 2, 1, 0),
 	SOC_SINGLE("Soft Ramp Switch", CS42L51_DAC_CTL, 1, 1, 0),
-- 
2.35.1

