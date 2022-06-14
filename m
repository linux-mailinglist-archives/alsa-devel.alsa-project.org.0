Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 13AB554A53B
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jun 2022 04:20:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A7DDE1910;
	Tue, 14 Jun 2022 04:20:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A7DDE1910
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655173256;
	bh=dz5oqgMyOl5udEA0pAhKl3A7qxvjlMQK6WHXNFGKWkE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nQkPfk3XqgGK0mRZLiRNV4WdN+eF1Ob39WQ7DPssSf8QOJXYTX3lV1momRlbGKIfM
	 D0c/1tDZ9b/FgffGOYs7Qgr0XmaPmWrmXChG8YoQLT3cEUjBZZ5GYk0oXZoURYpxcH
	 6CdYlBNXxftABVS4xiznDcYB+zwXSCI3yLMRpnLg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 49CF3F80674;
	Tue, 14 Jun 2022 04:09:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1A1B1F8065D; Tue, 14 Jun 2022 04:09:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6AE89F80640
 for <alsa-devel@alsa-project.org>; Tue, 14 Jun 2022 04:09:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6AE89F80640
Authentication-Results: alsa1.perex.cz;
 dkim=fail reason="key not found in DNS" (0-bit key) header.d=kernel.org
 header.i=@kernel.org header.b="tAD2FkMW"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 61AEC610AB;
 Tue, 14 Jun 2022 02:09:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA27EC36B03;
 Tue, 14 Jun 2022 02:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655172560;
 bh=dz5oqgMyOl5udEA0pAhKl3A7qxvjlMQK6WHXNFGKWkE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=tAD2FkMW+vJafdhgEj2UGqL3rhjLMDs6o5xM9TQLxPYGU11DfQMMEpvc9mL+pOLx8
 YgxZ7ROJixGniICZojupDsqSk/4iaDLjZEbS3PKY35mnK2+AZg7jn6oeqNtw1AAxoR
 ttdAHNvWmVwgOR1MWyXTzGK310DbPzAPhMFlldDiLE7G3Sn1+dMpWfNSW3OrCkVesJ
 mbgHyCfs5IUpj3RIeo+MqGn1ItexfkTyWLQpHzFD8icAvlw+4t3rW32/fyGSmtAb3m
 23eZDlz2kwqYhWHxaBPlCPnXs+yb8121ZZpw5N5H6TA1+vBmEZufdpHYUwpzOnjnlw
 uqZ+H/DT1berg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 11/23] ASoC: es8328: Fix event generation for
 deemphasis control
Date: Mon, 13 Jun 2022 22:08:47 -0400
Message-Id: <20220614020900.1100401-11-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220614020900.1100401-1-sashal@kernel.org>
References: <20220614020900.1100401-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
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

From: Mark Brown <broonie@kernel.org>

[ Upstream commit 8259610c2ec01c5cbfb61882ae176aabacac9c19 ]

Currently the put() method for the deemphasis control returns 0 when a new
value is written to the control even if the value changed, meaning events
are not generated. Fix this, skip the work of updating the value when it is
unchanged and then return 1 after having done so.

Signed-off-by: Mark Brown <broonie@kernel.org>
Link: https://lore.kernel.org/r/20220603123937.4013603-1-broonie@kernel.org
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/es8328.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/es8328.c b/sound/soc/codecs/es8328.c
index fdf64c29f563..4117ab6e9b6f 100644
--- a/sound/soc/codecs/es8328.c
+++ b/sound/soc/codecs/es8328.c
@@ -161,13 +161,16 @@ static int es8328_put_deemph(struct snd_kcontrol *kcontrol,
 	if (deemph > 1)
 		return -EINVAL;
 
+	if (es8328->deemph == deemph)
+		return 0;
+
 	ret = es8328_set_deemph(component);
 	if (ret < 0)
 		return ret;
 
 	es8328->deemph = deemph;
 
-	return 0;
+	return 1;
 }
 
 
-- 
2.35.1

