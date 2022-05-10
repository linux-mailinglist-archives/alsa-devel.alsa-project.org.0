Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EEEE2521F5C
	for <lists+alsa-devel@lfdr.de>; Tue, 10 May 2022 17:44:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C6C118AA;
	Tue, 10 May 2022 17:44:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C6C118AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652197499;
	bh=z1xGkviBQ2FOGy3TPlU9X8IBjkMBTFmQhrxx6TChBBM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AZj8tORKRctCqmbEM3LDw991ktDkZAYI+AIeFBPyPeim1/U8JktaEnl6Q/70XC2V1
	 UUccfSr/ims6gOEtyqhiJ8uPPZrK8Lzzfhtl+fnrlDEq3jZACp4nTyKYoXY+4I9W/T
	 QWlQyNBl8zE1ZCT+v7LfoUfgprGiX7jHbRnD3MT4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 28870F804BB;
	Tue, 10 May 2022 17:44:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7AD0AF80153; Tue, 10 May 2022 17:43:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E35CDF80153
 for <alsa-devel@alsa-project.org>; Tue, 10 May 2022 17:43:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E35CDF80153
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="fvq6lj3a"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 63F1A6142F;
 Tue, 10 May 2022 15:43:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFFC4C385C2;
 Tue, 10 May 2022 15:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652197432;
 bh=z1xGkviBQ2FOGy3TPlU9X8IBjkMBTFmQhrxx6TChBBM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fvq6lj3aITJ/bdqJLFJPeAf0VghjPjujvfcBZcDSMN1wpQpEm8U18zkGiFiOwfD4d
 bTvdinsimeb0mlhmKMAY+ZRN60zqn2NaQXJVmbyjHDfUO38ggan4WLHBufKXnmffQL
 NBxFYK87qseHJCAm4QPcSwOkqpYMWemu+mYxACq7ruWd6vswOblNB0tl13gdeUpE+3
 eiN/zPsUmSeg13Gb7+VEgTYHntRsSukpC/T4Jh0J7gWhKa3RIZ8euStFHBfNNwNGJE
 S9GFLcZqlxuJb+AdkznBoiAFf9Yxu+ly6QlD8PEcPN60D99VqsmDzP0XtHMsWPrAeK
 z8whzuVuMcgzw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.17 05/21] ASoC: max98090: Reject invalid values in
 custom control put()
Date: Tue, 10 May 2022 11:43:24 -0400
Message-Id: <20220510154340.153400-5-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220510154340.153400-1-sashal@kernel.org>
References: <20220510154340.153400-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, pierre-louis.bossart@linux.intel.com, tiwai@suse.com,
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

From: Mark Brown <broonie@kernel.org>

[ Upstream commit 2fbe467bcbfc760a08f08475eea6bbd4c2874319 ]

The max98090 driver has a custom put function for some controls which can
only be updated in certain circumstances which makes no effort to validate
that input is suitable for the control, allowing out of spec values to be
written to the hardware and presented to userspace. Fix this by returning
an error when invalid values are written.

Signed-off-by: Mark Brown <broonie@kernel.org>
Link: https://lore.kernel.org/r/20220420193454.2647908-1-broonie@kernel.org
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/max98090.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/codecs/max98090.c b/sound/soc/codecs/max98090.c
index b45ec35cd63c..6d9261346842 100644
--- a/sound/soc/codecs/max98090.c
+++ b/sound/soc/codecs/max98090.c
@@ -413,6 +413,9 @@ static int max98090_put_enab_tlv(struct snd_kcontrol *kcontrol,
 
 	val = (val >> mc->shift) & mask;
 
+	if (sel < 0 || sel > mc->max)
+		return -EINVAL;
+
 	*select = sel;
 
 	/* Setting a volume is only valid if it is already On */
-- 
2.35.1

