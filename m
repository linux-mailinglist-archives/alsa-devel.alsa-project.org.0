Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A5A596179
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Aug 2022 19:52:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DA91B827;
	Tue, 16 Aug 2022 19:51:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DA91B827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660672350;
	bh=T0OkV6HdYRfybDT5BP0YxVpVPZD//t2wExp9wA0o2Qo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=uJPKNw/rhxJ8x8qT3mR14CbwK4dEdfrxMDHPOH0qWb8SdCFkDK0AH5Dbqew/X9JAO
	 gaz4WE/yA/kMW07e9s90I/DgsiIzNSybg8zfyaL4wskBP37mbvH2EaEpCL5SeTf94+
	 sKKx2tTA6W8wITGJs0t55DZcl53/W3wszN0hRkNQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 33607F80424;
	Tue, 16 Aug 2022 19:51:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C20F1F8032D; Tue, 16 Aug 2022 19:51:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from bg5.exmail.qq.com (bg4.exmail.qq.com [43.154.54.12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C660BF80118
 for <alsa-devel@alsa-project.org>; Tue, 16 Aug 2022 19:51:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C660BF80118
X-QQ-mid: bizesmtp71t1660672277tnjh8cwu
Received: from harry-jrlc.. ( [182.148.12.144])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Wed, 17 Aug 2022 01:51:07 +0800 (CST)
X-QQ-SSF: 0100000000200060D000B00A0000020
X-QQ-FEAT: 6ArnuSDJ+imu+VjUQtt6P1w7IC8Ca6CyTAw+gGH+Fbqri0DwIvDJE92OK7rOz
 ++kG6TwdXmklaZn2d7esEEfsyzaBRtq0W7ot0ZlmrnENkoSrkssWs9wTBa58zktv5IZpwQ+
 FLME7RCIkG0lneYnti7ZOtD7TXs/t5N1FiF87X60Q8HgWNpwK9fn0pi9u71nLgRtFAnWize
 OmrOCG53tZFdlQxNswc2C4oDMwvT6nSNjRVbr0OInY+OM1Mld7fwj1hH5aGwK5+i4eD96Ci
 HlK+GG0Vskr4MnxsUpf1hRv/yVAUJbBbIN4k2zkg3rnm+eh39eZIxY1eTOb5joMLRW4xnHm
 MuG1IZz9utxcLMKFh1UCClrC+VgogE/I8jal8tipIw0CpUGKSKnl8pZ8IhS4fxMvlpLlnQu
X-QQ-GoodBg: 0
From: Xin Gao <gaoxin@cdjrlc.com>
To: perex@perex.cz,
	tiwai@suse.com
Subject: [PATCH] ASoC: Variable type completion
Date: Wed, 17 Aug 2022 01:51:05 +0800
Message-Id: <20220816175105.8084-1-gaoxin@cdjrlc.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybglogicsvr:qybglogicsvr6
Cc: alsa-devel@alsa-project.org, broonie@kernel.org, lgirdwood@gmail.com,
 Xin Gao <gaoxin@cdjrlc.com>, linux-kernel@vger.kernel.org
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

'unsigned int' is better than 'unsigned'.

Signed-off-by: Xin Gao <gaoxin@cdjrlc.com>
---
 sound/soc/soc-ac97.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/soc-ac97.c b/sound/soc/soc-ac97.c
index 5f49e3dec3fc..32c5be61e2ec 100644
--- a/sound/soc/soc-ac97.c
+++ b/sound/soc/soc-ac97.c
@@ -57,7 +57,7 @@ static inline struct snd_soc_component *gpio_to_component(struct gpio_chip *chip
 	return gpio_priv->component;
 }
 
-static int snd_soc_ac97_gpio_request(struct gpio_chip *chip, unsigned offset)
+static int snd_soc_ac97_gpio_request(struct gpio_chip *chip, unsigned int offset)
 {
 	if (offset >= AC97_NUM_GPIOS)
 		return -EINVAL;
@@ -66,7 +66,7 @@ static int snd_soc_ac97_gpio_request(struct gpio_chip *chip, unsigned offset)
 }
 
 static int snd_soc_ac97_gpio_direction_in(struct gpio_chip *chip,
-					  unsigned offset)
+					  unsigned int offset)
 {
 	struct snd_soc_component *component = gpio_to_component(chip);
 
@@ -75,7 +75,7 @@ static int snd_soc_ac97_gpio_direction_in(struct gpio_chip *chip,
 				   1 << offset, 1 << offset);
 }
 
-static int snd_soc_ac97_gpio_get(struct gpio_chip *chip, unsigned offset)
+static int snd_soc_ac97_gpio_get(struct gpio_chip *chip, unsigned int offset)
 {
 	struct snd_soc_component *component = gpio_to_component(chip);
 	int ret;
@@ -88,7 +88,7 @@ static int snd_soc_ac97_gpio_get(struct gpio_chip *chip, unsigned offset)
 	return !!(ret & (1 << offset));
 }
 
-static void snd_soc_ac97_gpio_set(struct gpio_chip *chip, unsigned offset,
+static void snd_soc_ac97_gpio_set(struct gpio_chip *chip, unsigned int offset,
 				  int value)
 {
 	struct snd_ac97_gpio_priv *gpio_priv = gpiochip_get_data(chip);
-- 
2.30.2

