Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 552A826663
	for <lists+alsa-devel@lfdr.de>; Wed, 22 May 2019 16:57:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA6621684;
	Wed, 22 May 2019 16:56:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA6621684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558537028;
	bh=zcvEG0NqzTkWuVLDYwgdeQ7D8tyONwKs2LclMSNcRTg=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=JIPVdHxRQSoom+IuZ9JS2edjf18BnAOK7KYndsZVvd7pYfUqBSfiZftQpI4HcRweH
	 Yn+lFj8unXO41yZyhEu0xSY+MJQGrN45cN/eXzSsAMO9NbhUX/VkjKlPUnmrBsbKnE
	 +/9k+VmQEsaWj99fbT/2n4P8yx4HW157l7747dbk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CE40AF89718;
	Wed, 22 May 2019 16:55:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D2F4EF8963E; Wed, 22 May 2019 16:55:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-yw1-xc49.google.com (mail-yw1-xc49.google.com
 [IPv6:2607:f8b0:4864:20::c49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7C95CF80C20
 for <alsa-devel@alsa-project.org>; Wed, 22 May 2019 16:55:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C95CF80C20
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="aUkh74wl"
Received: by mail-yw1-xc49.google.com with SMTP id v191so2213555ywc.11
 for <alsa-devel@alsa-project.org>; Wed, 22 May 2019 07:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=2eB4DDoWCyDOcLd/zDF2n1O+wo9ucaAhtKLtatL9xkc=;
 b=aUkh74wltAkeJc5y0I5ZumhnzHWF4yROzoHzFYuAnjPAXq2pbbZZeNlSlxybnmn+J/
 aPuk8ivRhL6KRnbyBzV896d+RJsxoZ7auv3gz6HDcT8WwfD1OJXHSmCEcXsUzAHJEpqf
 +HdCPNkT0esl3Y5Wh7suxGmr8xED4iaDmxVF2UDeSX2/WV/OhpIcymlGSBmwS+FXp0M1
 naoc/AwFLTJpivaT1lH8kPsrVOQypaecXeLelhIZtzN/E7G4BDPOaO/DJE6MNlDYy7Qu
 KdGO5qeUAXFTAUASnTXP1ZHMEWrWdiGgb99K+I7gqHd+YDjDYgEUzj2KYt4vDReSMO9k
 QdrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=2eB4DDoWCyDOcLd/zDF2n1O+wo9ucaAhtKLtatL9xkc=;
 b=Hpe/CNOGaWUzIslobQ3Zs9n59dHLO02iuCxvrR25uxqnQNmSrkIViQz3VDfdzUSXuU
 fH0SWNhqfTEWpcwmDZT0pmtpWWQx+x73zsRRJar8CBIYzMwtj6UnJnmO3WCf5AFgGKtb
 Big6bHWCA+r6wOzmAKZh1F53PGNGGJ+4J7Ye2zihIQeFotv+gST0U2t371L7JgYQK0B0
 qdp9QAyzqnQDGN5TYxqMqE1oEk9C0E84qHwyAMmnMHYY/UqjJji517MH7UrmpANkarMw
 STEmHC4QwEB647BeVekCpqIXXGz/S9YhNk1QQt0MYT9dv6+/Aot9qEA0RFhI6i+91n9a
 tCSw==
X-Gm-Message-State: APjAAAWt+6VCoTG2RTtzvwzs6jMv0C0P2sHptBgw9MDGasvM7KCiN2OQ
 m8pcTbpUm/hcKbehiOTPF6p8LAMpHQtH
X-Google-Smtp-Source: APXvYqwhUPQeME9v+vrPwOVT6+9K1MZM9KQM/H3S9QAY+z3CKYqrAzVBvsl1tnLkc1N6LH3hNaD8kX81HP7g
X-Received: by 2002:a81:b649:: with SMTP id h9mr24905457ywk.233.1558536913774; 
 Wed, 22 May 2019 07:55:13 -0700 (PDT)
Date: Wed, 22 May 2019 22:55:05 +0800
Message-Id: <20190522145505.257961-1-tzungbi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org
Cc: tzungbi@google.com, alsa-devel@alsa-project.org, dgreid@google.com,
 cychiang@google.com, jiaxin.yu@mediatek.com
Subject: [alsa-devel] [PATCH] ASoC: mediatek: mt8183: remove unused DAPM pins
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

Kernel emits the following messages when booting.
ASoC: DAPM unknown pin Headset Mic
ASoC: DAPM unknown pin Headphone

Remove the unused DAPM pins.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 .../soc/mediatek/mt8183/mt8183-da7219-max98357.c | 15 +--------------
 .../mt8183/mt8183-mt6358-ts3a227-max98357.c      | 16 +---------------
 2 files changed, 2 insertions(+), 29 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c b/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
index 31ea8632c397..231fb49d79b9 100644
--- a/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
+++ b/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
@@ -18,18 +18,6 @@
 
 static struct snd_soc_jack headset_jack;
 
-/* Headset jack detection DAPM pins */
-static struct snd_soc_jack_pin headset_jack_pins[] = {
-	{
-		.pin = "Headphone",
-		.mask = SND_JACK_HEADPHONE,
-	},
-	{
-		.pin = "Headset Mic",
-		.mask = SND_JACK_MICROPHONE,
-	},
-};
-
 static struct snd_soc_dai_link_component
 mt8183_da7219_max98357_external_codecs[] = {
 	{
@@ -375,8 +363,7 @@ mt8183_da7219_max98357_headset_init(struct snd_soc_component *component)
 				    SND_JACK_BTN_0 | SND_JACK_BTN_1 |
 				    SND_JACK_BTN_2 | SND_JACK_BTN_3,
 				    &headset_jack,
-				    headset_jack_pins,
-				    ARRAY_SIZE(headset_jack_pins));
+				    NULL, 0);
 	if (ret)
 		return ret;
 
diff --git a/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c b/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
index 4e44e5689d6f..1ba7aa58e4b6 100644
--- a/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
+++ b/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
@@ -17,19 +17,6 @@
 
 static struct snd_soc_jack headset_jack;
 
-/* Headset jack detection DAPM pins */
-static struct snd_soc_jack_pin headset_jack_pins[] = {
-	{
-		.pin = "Headphone",
-		.mask = SND_JACK_HEADPHONE,
-	},
-	{
-		.pin = "Headset Mic",
-		.mask = SND_JACK_MICROPHONE,
-	},
-
-};
-
 static int mt8183_mt6358_i2s_hw_params(struct snd_pcm_substream *substream,
 				       struct snd_pcm_hw_params *params)
 {
@@ -328,8 +315,7 @@ mt8183_mt6358_ts3a227_max98357_headset_init(struct snd_soc_component *component)
 				    SND_JACK_BTN_0 | SND_JACK_BTN_1 |
 				    SND_JACK_BTN_2 | SND_JACK_BTN_3,
 				    &headset_jack,
-				    headset_jack_pins,
-				    ARRAY_SIZE(headset_jack_pins));
+				    NULL, 0);
 	if (ret)
 		return ret;
 
-- 
2.21.0.1020.gf2820cf01a-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
