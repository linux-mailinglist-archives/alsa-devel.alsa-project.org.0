Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 21AEC5613A1
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Jun 2022 09:52:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7BF0416C5;
	Thu, 30 Jun 2022 09:52:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7BF0416C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656575575;
	bh=wjzxFS1d4yhFr2941Y7mwE6MwIDSk9UydQ+teGLSIbU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dAEUA2fC8N18Bh3jkK47eXlYOR/rwL76UrS/KTv8b/w2fdYkemw3ePV13xBSEoEan
	 betPZ6dSqnK7R0GXHy9pabH6L4/6ryYTgttSMRPbLM/nX821YK+Z81hgXASlmMC88A
	 awtq0+fcTvl4tIjtdKg69kRbsUL/ozXl+FRqqtN8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 142EEF804E5;
	Thu, 30 Jun 2022 09:51:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 76AE6F804EB; Thu, 30 Jun 2022 09:51:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hutie.ust.cz (hutie.ust.cz [185.8.165.127])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6BDF6F800F5
 for <alsa-devel@alsa-project.org>; Thu, 30 Jun 2022 09:51:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6BDF6F800F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=cutebit.org header.i=@cutebit.org
 header.b="kTFfxyGh"
From: =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
 t=1656575507; bh=uyft5wSF8/2zPEvgaZvZXua1HJQ9Mfv5d4VvVbMyKZ8=;
 h=From:To:Cc:Subject:Date;
 b=kTFfxyGhRrnO3jW3fq0bizKGuJPGSQeN7XTGZX12aoxi6C+yQL0I5x0h+sflCb0wk
 N5OokTkPep6YFWjlxryOKsAaPbNdlEFZkB1/dueCbS8WXyYRbTXUTBD2ou9yqpaRdD
 bwmDOqPIjHXY8JlRUtvtkXryXLSrEIjQeLc+vCLY=
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH 1/4] ASoC: tas2764: Add post reset delays
Date: Thu, 30 Jun 2022 09:51:32 +0200
Message-Id: <20220630075135.2221-1-povik+lin@cutebit.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 Hector Martin <marcan@marcan.st>, linux-kernel@vger.kernel.org,
 Dan Murphy <dmurphy@ti.com>,
 =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>,
 Stephen Kitt <steve@sk2.org>, asahi@lists.linux.dev
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

Make sure there is at least 1 ms delay from reset to first command as
is specified in the datasheet. This is a fix similar to commit
307f31452078 ("ASoC: tas2770: Insert post reset delay").

Fixes: 827ed8a0fa50 ("ASoC: tas2764: Add the driver for the TAS2764")
Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
---
 sound/soc/codecs/tas2764.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/tas2764.c b/sound/soc/codecs/tas2764.c
index 42f0c1e449ba..039bf1900880 100644
--- a/sound/soc/codecs/tas2764.c
+++ b/sound/soc/codecs/tas2764.c
@@ -42,10 +42,12 @@ static void tas2764_reset(struct tas2764_priv *tas2764)
 		gpiod_set_value_cansleep(tas2764->reset_gpio, 0);
 		msleep(20);
 		gpiod_set_value_cansleep(tas2764->reset_gpio, 1);
+		usleep_range(1000, 2000);
 	}
 
 	snd_soc_component_write(tas2764->component, TAS2764_SW_RST,
 				TAS2764_RST);
+	usleep_range(1000, 2000);
 }
 
 static int tas2764_set_bias_level(struct snd_soc_component *component,
@@ -107,8 +109,10 @@ static int tas2764_codec_resume(struct snd_soc_component *component)
 	struct tas2764_priv *tas2764 = snd_soc_component_get_drvdata(component);
 	int ret;
 
-	if (tas2764->sdz_gpio)
+	if (tas2764->sdz_gpio) {
 		gpiod_set_value_cansleep(tas2764->sdz_gpio, 1);
+		usleep_range(1000, 2000);
+	}
 
 	ret = snd_soc_component_update_bits(component, TAS2764_PWR_CTRL,
 					    TAS2764_PWR_CTRL_MASK,
@@ -501,8 +505,10 @@ static int tas2764_codec_probe(struct snd_soc_component *component)
 
 	tas2764->component = component;
 
-	if (tas2764->sdz_gpio)
+	if (tas2764->sdz_gpio) {
 		gpiod_set_value_cansleep(tas2764->sdz_gpio, 1);
+		usleep_range(1000, 2000);
+	}
 
 	tas2764_reset(tas2764);
 
-- 
2.33.0

