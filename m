Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D3AA443A19C
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Oct 2021 21:37:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5626616C6;
	Mon, 25 Oct 2021 21:37:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5626616C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635190676;
	bh=sd3zvU0WPnXXuXfSlXu+WUjd1HBO5uCDKHkTws2cNuY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HbgFcSmCx8JK0864C+QSwKqQFS7uMIdBC6f8qXN+/E7l6agx3gmjkK0ABEfw8Q4E7
	 CR3bqDGuOaHxYWBz774bmE2pw2BD3sMNDWO7apKZARTBzVSZRWuYkN3ncPjXwW0fjR
	 soWf7cV2qtXPamwagiJscofBeFURtixaDjJ7ctCk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AC9E0F80153;
	Mon, 25 Oct 2021 21:36:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 87CD8F8025A; Mon, 25 Oct 2021 21:36:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F2946F80153
 for <alsa-devel@alsa-project.org>; Mon, 25 Oct 2021 21:36:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F2946F80153
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.b="zK2VeW/1"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 564126115A;
 Mon, 25 Oct 2021 19:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1635190585;
 bh=sd3zvU0WPnXXuXfSlXu+WUjd1HBO5uCDKHkTws2cNuY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=zK2VeW/1txNghIsMLy9FUOfuWlpNglW6wE6W6lGx26mLM02mRleqpEmV8yu2YYFCo
 qo9PM6+QNqU5Z941zO2pRVcaY41G1pF89ThLh33gBq6A+dfizvjvbdNvU8IrZu0s0+
 5Mw+RcrLKfMMfR0QX7VrUc1MKcZ00RPBpggF3sQA=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 5.14 018/169] ASoC: pcm512x: Mend accesses to the I2S_1 and
 I2S_2 registers
Date: Mon, 25 Oct 2021 21:13:19 +0200
Message-Id: <20211025191019.970769595@linuxfoundation.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211025191017.756020307@linuxfoundation.org>
References: <20211025191017.756020307@linuxfoundation.org>
User-Agent: quilt/0.66
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Takashi Iwai <tiwai@suse.com>,
 stable@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Kirill Marinushkin <kmarinushkin@birdec.com>, Mark Brown <broonie@kernel.org>,
 Peter Ujfalusi <peter.ujfalusi@gmail.com>, Peter Rosin <peda@axentia.se>
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

From: Peter Rosin <peda@axentia.se>

[ Upstream commit 3f4b57ad07d9237acf1b8cff3f8bf530cacef87a ]

Commit 25d27c4f68d2 ("ASoC: pcm512x: Add support for more data formats")
breaks the TSE-850 device, which is using a pcm5142 in I2S and
CBM_CFS mode (maybe not relevant). Without this fix, the result
is:

pcm512x 0-004c: Failed to set data format: -16

And after that, no sound.

This fix is not 100% correct. The datasheet of at least the pcm5142
states that four bits (0xcc) in the I2S_1 register are "RSV"
("Reserved. Do not access.") and no hint is given as to what the
initial values are supposed to be. So, specifying defaults for
these bits is wrong. But perhaps better than a broken driver?

Fixes: 25d27c4f68d2 ("ASoC: pcm512x: Add support for more data formats")
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: Kirill Marinushkin <kmarinushkin@birdec.com>
Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc: alsa-devel@alsa-project.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Peter Rosin <peda@axentia.se>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@gmail.com>
Reviewed-by: Peter Ujfalusi <peter.ujfalusi@gmail.com>
Link: https://lore.kernel.org/r/2d221984-7a2e-7006-0f8a-ffb5f64ee885@axentia.se
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/pcm512x.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/pcm512x.c b/sound/soc/codecs/pcm512x.c
index 4dc844f3c1fc..60dee41816dc 100644
--- a/sound/soc/codecs/pcm512x.c
+++ b/sound/soc/codecs/pcm512x.c
@@ -116,6 +116,8 @@ static const struct reg_default pcm512x_reg_defaults[] = {
 	{ PCM512x_FS_SPEED_MODE,     0x00 },
 	{ PCM512x_IDAC_1,            0x01 },
 	{ PCM512x_IDAC_2,            0x00 },
+	{ PCM512x_I2S_1,             0x02 },
+	{ PCM512x_I2S_2,             0x00 },
 };
 
 static bool pcm512x_readable(struct device *dev, unsigned int reg)
-- 
2.33.0



