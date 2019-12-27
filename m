Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD6A12B6A3
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Dec 2019 18:44:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E53A81736;
	Fri, 27 Dec 2019 18:43:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E53A81736
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1577468659;
	bh=mSIbMLgCDg4FEN5YcZ+sIhyMOJYpmUQYkHbtKiE8xuE=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nZxqf83BmNBWd4Sv7P5CHtDJWKsV4k6OY8OX0sRjskaIidCB+0ELYZZ/+AQOvlM7C
	 V3WZEDvHfj6X2XcbchbUskEFyYmwK/3PhJS1bl6sXlHWQAaNrOhrdQifGZHslM4+wm
	 GIwSZ16YAwgLxuhnS9BXyarFbfDVOa+8eg6AT0qo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 850BBF80278;
	Fri, 27 Dec 2019 18:41:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 65D7EF80147; Fri, 27 Dec 2019 18:41:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A8A73F801F4
 for <alsa-devel@alsa-project.org>; Fri, 27 Dec 2019 18:41:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8A73F801F4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="cwLkGPJW"
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4252920740;
 Fri, 27 Dec 2019 17:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1577468464;
 bh=8enxHMK2nvjtUxxiMArkW5O/ABTFF34FRJEr3tTpn64=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cwLkGPJWR51QZoANdYZzqF0V4XSGODslCKQyDyNb1X3kBgks93ceDcgFD6+K4sKkL
 PLWrcynDWauLXFsqci9CYA5Fo+IIW6Kw8P3lo82rJZVr8gq7L4Y6ryZgWaVzhpV4W0
 HpuXuJPx+Lneg9C2OvKU10Owz8jM2K4LT/PCUMhU=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Fri, 27 Dec 2019 12:37:54 -0500
Message-Id: <20191227174055.4923-6-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191227174055.4923-1-sashal@kernel.org>
References: <20191227174055.4923-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Sasha Levin <sashal@kernel.org>, Tzung-Bi Shih <tzungbi@google.com>,
 alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH AUTOSEL 5.4 006/187] ASoC: max98090: exit
	workaround earlier if PLL is locked
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Tzung-Bi Shih <tzungbi@google.com>

[ Upstream commit 6f49919d11690a9b5614445ba30fde18083fdd63 ]

According to the datasheet, PLL lock time typically takes 2 msec and
at most takes 7 msec.

Check the lock status every 1 msec and exit the workaround if PLL is
locked.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
Link: https://lore.kernel.org/r/20191122073114.219945-3-tzungbi@google.com
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/max98090.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/max98090.c b/sound/soc/codecs/max98090.c
index 12cb87c0d463..f531e5a11bdd 100644
--- a/sound/soc/codecs/max98090.c
+++ b/sound/soc/codecs/max98090.c
@@ -2108,6 +2108,8 @@ static void max98090_pll_work(struct work_struct *work)
 	struct max98090_priv *max98090 =
 		container_of(work, struct max98090_priv, pll_work);
 	struct snd_soc_component *component = max98090->component;
+	unsigned int pll;
+	int i;
 
 	if (!snd_soc_component_is_active(component))
 		return;
@@ -2127,8 +2129,16 @@ static void max98090_pll_work(struct work_struct *work)
 	snd_soc_component_update_bits(component, M98090_REG_DEVICE_SHUTDOWN,
 			    M98090_SHDNN_MASK, M98090_SHDNN_MASK);
 
-	/* Give PLL time to lock */
-	msleep(10);
+	for (i = 0; i < 10; ++i) {
+		/* Give PLL time to lock */
+		usleep_range(1000, 1200);
+
+		/* Check lock status */
+		pll = snd_soc_component_read32(
+				component, M98090_REG_DEVICE_STATUS);
+		if (!(pll & M98090_ULK_MASK))
+			break;
+	}
 }
 
 static void max98090_jack_work(struct work_struct *work)
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
