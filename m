Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 501B133D8F
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Jun 2019 05:33:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D78019F6;
	Tue,  4 Jun 2019 05:32:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D78019F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559619181;
	bh=51ZCjfGzNzGriTFjxmRpt4ivW8WUlDw/cjiJWPlyg34=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=JVLgIXZlx6uWJTdhGKzIrEPbrDm6bCYTZoZeDOXvy3dymM4F63zOMERmzRYco65Lq
	 XTHndwV3jGpFzaUd2T/X312ZMSw13+e/3EuZZBo13GeZ2HbFtedPPGaffzJQ7wEr+F
	 WWAXz+7SDcx4nTZxq5hs6skrYuD1NhXPsM/GfMWw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4C500F896F7;
	Tue,  4 Jun 2019 05:31:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D7D5FF896F7; Tue,  4 Jun 2019 05:31:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_MED,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-qt1-x84a.google.com (mail-qt1-x84a.google.com
 [IPv6:2607:f8b0:4864:20::84a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D7E11F89673
 for <alsa-devel@alsa-project.org>; Tue,  4 Jun 2019 05:31:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D7E11F89673
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="V4ipDCXA"
Received: by mail-qt1-x84a.google.com with SMTP id q13so5781845qtj.15
 for <alsa-devel@alsa-project.org>; Mon, 03 Jun 2019 20:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=4IpfmN0Id47IcFMEN2NvD7mGMtZpgtMqBerQe0a8FXQ=;
 b=V4ipDCXAuZqJvgwEwnVEZjxJSehsr4F2R9eBPT7Lsv9S0u3hjKr1/hSOnOTrf+Lrar
 6B+eIsXJnb93l3kDnwMFfUa/H1cHiRMZXR5zx9QI4Qtxj/Y/N9tIpX9MxgAy9ZWpXHY8
 uKaPphFZLgXWwbuyE1gzjpoxQVeIzMdEGthKfXVapgYLKlGnVHbYnXnP61Vo3HcFjYt1
 2s7dj+Yjj/iJocTQQC7b5fUh1uBQyczVGdRdfbSbLpV6G4wDtAoONengz+SC51ZQt9OS
 Q9FeEhdgyMrk0enkNOapNyIrfMobgZ9HPsyQl2WTfZHsfecEqSm2mqF0KXTF6yddk2pw
 USWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=4IpfmN0Id47IcFMEN2NvD7mGMtZpgtMqBerQe0a8FXQ=;
 b=A0LyhmchHpIFKHMpswVRpMnZAP5fYGaKHBe5npAVsLrPslHFDUMxaBRlfEu3sS5cJC
 +GFbaSNI7MGPfmlN4CHUu2ViT6jsKKFt+XwQieBVAs+R7Ri6bLKsuvnWN2UQJjc2vIqo
 uqhmbLM07vDAtedLPa9cjVsT/kyqz+2xlXdt5QoIladSFdeRqqGBjwUJFN98YdvCO1zu
 lhR/sNarFa/j3+2VaeOjNM8eKwkBHYAIZ+AsrVP49OjY75jV2PNlcaEf5ysnoY3D6BGx
 TrlZ59okhL2tg/nGf4WR5CZNVWl5xhKpTwuae+c8+5CcJNadYfQp58rssOC+4+E1102v
 Q6Pw==
X-Gm-Message-State: APjAAAXGJdnEu2J9sVnrdEFppz9Xym/HDfvNFFzfsGFSsmlKa7XU9v82
 o193GUuQzGOW/JS3a35uwtxmuVs8Mdeo
X-Google-Smtp-Source: APXvYqxdKOp47gQTYPTf4FdTELD6hV0+KS8Cki10+6tY3xlPzLYq6y6A+RC2Zh/gOVH3Dbvf9ndOCLCiaqZy
X-Received: by 2002:a0c:be87:: with SMTP id n7mr6022004qvi.65.1559619068714;
 Mon, 03 Jun 2019 20:31:08 -0700 (PDT)
Date: Tue,  4 Jun 2019 11:31:02 +0800
Message-Id: <20190604033102.206782-1-tzungbi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.22.0.rc1.311.g5d7573a151-goog
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org
Cc: tzungbi@google.com, alsa-devel@alsa-project.org, dgreid@google.com,
 cychiang@google.com
Subject: [alsa-devel] [PATCH v2] ASoC: core: move DAI pre-links initiation
	to snd_soc_instantiate_card
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

Kernel crashes when an ASoC component rebinding.

The dai_link->platforms has been reset to NULL by soc_cleanup_platform()
in soc_cleanup_card_resources() when un-registering component.  However,
it has no chance to re-allocate the dai_link->platforms when registering
the component again.

Move the DAI pre-links initiation from snd_soc_register_card() to
snd_soc_instantiate_card() to make sure all DAI pre-links get initiated
when component rebinding.

As an example, by using the following commands:
- echo -n max98357a > /sys/bus/platform/drivers/max98357a/unbind
- echo -n max98357a > /sys/bus/platform/drivers/max98357a/bind

Got the error message:
"Unable to handle kernel NULL pointer dereference at virtual address".

The call trace:
snd_soc_is_matching_component+0x30/0x6c
soc_bind_dai_link+0x16c/0x240
snd_soc_bind_card+0x1e4/0xb10
snd_soc_add_component+0x270/0x300
snd_soc_register_component+0x54/0x6c

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
Changes from v1 (https://patchwork.kernel.org/patch/10968311/):
- reserve original logic as much as possible
    - only acquire client_mutex
    - do not call soc_cleanup_card_resources() if soc_init_dai_link()
      returns fail, in the case some context (e.g. card->dapm) may have
      not initialized yet

Difference from original logic:
- soc_init_dai_link() would be called several times (e.g. -EPROBE_DEFER)

 sound/soc/soc-core.c | 27 ++++++++++-----------------
 1 file changed, 10 insertions(+), 17 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 7abb017a83f3..9191d2bec489 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2070,6 +2070,16 @@ static int snd_soc_instantiate_card(struct snd_soc_card *card)
 	int ret, i, order;
 
 	mutex_lock(&client_mutex);
+	for_each_card_prelinks(card, i, dai_link) {
+		ret = soc_init_dai_link(card, dai_link);
+		if (ret) {
+			soc_cleanup_platform(card);
+			dev_err(card->dev, "ASoC: failed to init link %s: %d\n",
+				dai_link->name, ret);
+			mutex_unlock(&client_mutex);
+			return ret;
+		}
+	}
 	mutex_lock_nested(&card->mutex, SND_SOC_CARD_CLASS_INIT);
 
 	card->dapm.bias_level = SND_SOC_BIAS_OFF;
@@ -2794,26 +2804,9 @@ static int snd_soc_bind_card(struct snd_soc_card *card)
  */
 int snd_soc_register_card(struct snd_soc_card *card)
 {
-	int i, ret;
-	struct snd_soc_dai_link *link;
-
 	if (!card->name || !card->dev)
 		return -EINVAL;
 
-	mutex_lock(&client_mutex);
-	for_each_card_prelinks(card, i, link) {
-
-		ret = soc_init_dai_link(card, link);
-		if (ret) {
-			soc_cleanup_platform(card);
-			dev_err(card->dev, "ASoC: failed to init link %s\n",
-				link->name);
-			mutex_unlock(&client_mutex);
-			return ret;
-		}
-	}
-	mutex_unlock(&client_mutex);
-
 	dev_set_drvdata(card->dev, card);
 
 	snd_soc_initialize_card_lists(card);
-- 
2.22.0.rc1.311.g5d7573a151-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
