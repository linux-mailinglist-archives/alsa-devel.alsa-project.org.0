Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9546C17D0FC
	for <lists+alsa-devel@lfdr.de>; Sun,  8 Mar 2020 04:16:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 33014166D;
	Sun,  8 Mar 2020 04:16:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 33014166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583637417;
	bh=Tl+Fm62smNyCw9UDj9DJ3n61NrOfZTJ/jp/ncujQ77I=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cb3rQfk/bPwxGbx9rPrG6z+xU2YMnLE5wPGiK8Xurhz1S3UVoQ1ioa7Vi3VJKU+Xj
	 qsPeazXsVT4mHd0Z8lnU2NRmVPRaniOPeOSVTYrkIj7hUH9BQQqgBe37zfircbbYV+
	 ytQi/2QPaaXR69akoZmmbtg1hc87eQNMhJPodt/c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A9E5BF80249;
	Sun,  8 Mar 2020 04:14:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 02A21F8023F; Sun,  8 Mar 2020 04:14:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail.manjaro.org (mail.manjaro.org [176.9.38.148])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7C025F80130
 for <alsa-devel@alsa-project.org>; Sun,  8 Mar 2020 04:14:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C025F80130
Received: from localhost (localhost [127.0.0.1])
 by mail.manjaro.org (Postfix) with ESMTP id 1B65E39611CC;
 Sun,  8 Mar 2020 04:14:36 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at manjaro.org
Received: from mail.manjaro.org ([127.0.0.1])
 by localhost (manjaro.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tbktZ9oDShq1; Sun,  8 Mar 2020 04:14:33 +0100 (CET)
From: Tobias Schramm <t.schramm@manjaro.org>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [RFC PATCH 1/1] ASoC: jack: use gpiolib inversion flag for inverted
 gpios
Date: Sun,  8 Mar 2020 04:13:55 +0100
Message-Id: <20200308031355.1149173-2-t.schramm@manjaro.org>
In-Reply-To: <20200308031355.1149173-1-t.schramm@manjaro.org>
References: <20200308031355.1149173-1-t.schramm@manjaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 Tobias Schramm <t.schramm@manjaro.org>, linux-kernel@vger.kernel.org
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

This commit changes the handling of jack gpios with ACTIVE_LOW logic.
The inversion flag is now passed down and transparently handled by the
legacy gpiolib.

Previously the level of a gpio was inverted manually inside
snd_soc_jack_gpio_detect and gpiolib ACTIVE_LOW flag was not set on the
gpio. This resulted in erroneous output in /dev/class/gpio/gpio*/active_low
and debug interfaces like /sys/kernel/debug/gpio where the gpio was
still listed as active high while jack status for that gpio actually
followed an active low logic.

Signed-off-by: Tobias Schramm <t.schramm@manjaro.org>
---
 sound/soc/soc-jack.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/sound/soc/soc-jack.c b/sound/soc/soc-jack.c
index b5748dcd490f..8c17cfdbb883 100644
--- a/sound/soc/soc-jack.c
+++ b/sound/soc/soc-jack.c
@@ -254,8 +254,6 @@ static void snd_soc_jack_gpio_detect(struct snd_soc_jack_gpio *gpio)
 	int report;
 
 	enable = gpiod_get_value_cansleep(gpio->desc);
-	if (gpio->invert)
-		enable = !enable;
 
 	if (enable)
 		report = gpio->report;
@@ -385,6 +383,10 @@ int snd_soc_jack_add_gpios(struct snd_soc_jack *jack, int count,
 			}
 		} else {
 			/* legacy GPIO number */
+			int flags = GPIOF_IN;
+
+			if (gpios[i].invert)
+				flags |= GPIOF_ACTIVE_LOW;
 			if (!gpio_is_valid(gpios[i].gpio)) {
 				dev_err(jack->card->dev,
 					"ASoC: Invalid gpio %d\n",
@@ -393,7 +395,7 @@ int snd_soc_jack_add_gpios(struct snd_soc_jack *jack, int count,
 				goto undo;
 			}
 
-			ret = gpio_request_one(gpios[i].gpio, GPIOF_IN,
+			ret = gpio_request_one(gpios[i].gpio, flags,
 					       gpios[i].name);
 			if (ret)
 				goto undo;
-- 
2.24.1

