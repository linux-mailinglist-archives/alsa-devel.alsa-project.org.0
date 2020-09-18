Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3848626EB38
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Sep 2020 04:04:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C16316A5;
	Fri, 18 Sep 2020 04:03:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C16316A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600394652;
	bh=L/RPD5vnKSQDqRYPSE4OdlONRIwszqPQ8jg7XI6cdII=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jdL+0czIfhoTUfAu2RqyFoHkBzb++TF+EqsLafe96K3iWoIbZREV3gaLDDRIRRfmd
	 xiVKL5JcOtQp8tfKtS620lvYhG8qqOe2DowyxrixR/S56J5kRoYmQiJpWryjIxmqN3
	 9SbdJfSgUHixS3+MfW2zHWIeEr+VX5MQ+BT0cRlw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C19B0F8020B;
	Fri, 18 Sep 2020 04:02:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 634FDF801F7; Fri, 18 Sep 2020 04:02:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E41EAF8012D
 for <alsa-devel@alsa-project.org>; Fri, 18 Sep 2020 04:02:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E41EAF8012D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="CyoXwP1j"
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D789823731;
 Fri, 18 Sep 2020 02:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600394548;
 bh=L/RPD5vnKSQDqRYPSE4OdlONRIwszqPQ8jg7XI6cdII=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CyoXwP1jSOVifoGU6ru/+ba8p8k5SRpxPz3yJSenh220EhaYr4aZlC7TVR0XWTmFC
 kItfh6IwSYaatLlINHVe2H1GYSiccf98wmzKLvZjlxRyyrK29G6DF/P/gijtQvPxPn
 Cs67RLG4Ztbj2ni1stlBIlm10eeuyI7KmCm5MOp4=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 065/330] ASoC: max98090: remove msleep in PLL
 unlocked workaround
Date: Thu, 17 Sep 2020 21:56:45 -0400
Message-Id: <20200918020110.2063155-65-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200918020110.2063155-1-sashal@kernel.org>
References: <20200918020110.2063155-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, Tzung-Bi Shih <tzungbi@google.com>,
 alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

From: Tzung-Bi Shih <tzungbi@google.com>

[ Upstream commit acb874a7c049ec49d8fc66c893170fb42c01bdf7 ]

It was observed Baytrail-based chromebooks could cause continuous PLL
unlocked when using playback stream and capture stream simultaneously.
Specifically, starting a capture stream after started a playback stream.
As a result, the audio data could corrupt or turn completely silent.

As the datasheet suggested, the maximum PLL lock time should be 7 msec.
The workaround resets the codec softly by toggling SHDN off and on if
PLL failed to lock for 10 msec.  Notably, there is no suggested hold
time for SHDN off.

On Baytrail-based chromebooks, it would easily happen continuous PLL
unlocked if there is a 10 msec delay between SHDN off and on.  Removes
the msleep().

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
Link: https://lore.kernel.org/r/20191122073114.219945-2-tzungbi@google.com
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/max98090.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/max98090.c b/sound/soc/codecs/max98090.c
index 45da2b51543e7..6b9d326e11b07 100644
--- a/sound/soc/codecs/max98090.c
+++ b/sound/soc/codecs/max98090.c
@@ -2112,10 +2112,16 @@ static void max98090_pll_work(struct max98090_priv *max98090)
 
 	dev_info_ratelimited(component->dev, "PLL unlocked\n");
 
+	/*
+	 * As the datasheet suggested, the maximum PLL lock time should be
+	 * 7 msec.  The workaround resets the codec softly by toggling SHDN
+	 * off and on if PLL failed to lock for 10 msec.  Notably, there is
+	 * no suggested hold time for SHDN off.
+	 */
+
 	/* Toggle shutdown OFF then ON */
 	snd_soc_component_update_bits(component, M98090_REG_DEVICE_SHUTDOWN,
 			    M98090_SHDNN_MASK, 0);
-	msleep(10);
 	snd_soc_component_update_bits(component, M98090_REG_DEVICE_SHUTDOWN,
 			    M98090_SHDNN_MASK, M98090_SHDNN_MASK);
 
-- 
2.25.1

