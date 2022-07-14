Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 114A15743C2
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Jul 2022 06:39:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9CF441A8F;
	Thu, 14 Jul 2022 06:38:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9CF441A8F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657773562;
	bh=fh11CQGg78fCZlvxIkEKdZTt+V7QMJNel34lx3CZraQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=m9xWfBcLH4+vTxCFxBq6c7zZQ0oui1yf+7XHLNRM3/HBWxa2HRoUwi60paZtxIyAf
	 bGktqwAB9L0/8hYx29qEBnaVrJ0iynMCVw52hISafrdUwjxEdY1U6RLwRSCh4nZF7d
	 opK+AQg8uUq9nhRINmDC+63/mY5cXXGwN1W0SrdY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3DBA2F80716;
	Thu, 14 Jul 2022 06:26:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 64263F80713; Thu, 14 Jul 2022 06:26:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3AD12F806F7
 for <alsa-devel@alsa-project.org>; Thu, 14 Jul 2022 06:26:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3AD12F806F7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="WQwfl6Rd"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C8C1CB82371;
 Thu, 14 Jul 2022 04:26:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADF12C3411C;
 Thu, 14 Jul 2022 04:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657772781;
 bh=fh11CQGg78fCZlvxIkEKdZTt+V7QMJNel34lx3CZraQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WQwfl6RdG9FzlI9HWJBhNx2g4exaXniS+7yOFwO1ruTEZEzVy8S89wjPuzSgokRhr
 iXt6LHKGol6P7e2XgkxdtX9Ybe21gZpqkwVAtm1ky2JqE13hPlt/r9n8MfJdB9aTYi
 Ac6LhlyfJkZeD6aGHHXwTiQFeTWVOzZrmmRHhCyuRY8CM8X9MZ882B3v57pEHOHFqA
 W/CdRt3us8K8rwg1lkQOa20ti0w4iofwh7RC7HJHTP+i2DBG/adJpWvBdLEixkUJKG
 GoP7AQ0IsHF5C3AhbOMAVulZ0D7h6UaW5CqfqKsg3WKOLlEyQy0Xraf4h8qrUx+jpF
 vfthnu3MmU6qg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 03/10] ASoC: cs47l15: Fix event generation for low
 power mux control
Date: Thu, 14 Jul 2022 00:26:05 -0400
Message-Id: <20220714042612.282378-3-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220714042612.282378-1-sashal@kernel.org>
References: <20220714042612.282378-1-sashal@kernel.org>
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

[ Upstream commit 7f103af4a10f375b9b346b4d0b730f6a66b8c451 ]

cs47l15_in1_adc_put always returns zero regardless of if the control
value was updated. This results in missing notifications to user-space
of the control change. Update the handling to return 1 when the value is
changed.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Link: https://lore.kernel.org/r/20220623105120.1981154-3-ckeepax@opensource.cirrus.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/cs47l15.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs47l15.c b/sound/soc/codecs/cs47l15.c
index ece1276f38eb..1f7148794a5a 100644
--- a/sound/soc/codecs/cs47l15.c
+++ b/sound/soc/codecs/cs47l15.c
@@ -122,6 +122,9 @@ static int cs47l15_in1_adc_put(struct snd_kcontrol *kcontrol,
 		snd_soc_kcontrol_component(kcontrol);
 	struct cs47l15 *cs47l15 = snd_soc_component_get_drvdata(component);
 
+	if (!!ucontrol->value.integer.value[0] == cs47l15->in1_lp_mode)
+		return 0;
+
 	switch (ucontrol->value.integer.value[0]) {
 	case 0:
 		/* Set IN1 to normal mode */
@@ -150,7 +153,7 @@ static int cs47l15_in1_adc_put(struct snd_kcontrol *kcontrol,
 		break;
 	}
 
-	return 0;
+	return 1;
 }
 
 static const struct snd_kcontrol_new cs47l15_snd_controls[] = {
-- 
2.35.1

