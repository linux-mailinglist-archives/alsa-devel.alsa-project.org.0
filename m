Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D87A316E
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Aug 2019 09:45:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8386C167B;
	Fri, 30 Aug 2019 09:44:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8386C167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567151135;
	bh=PmFEkW0Y0rHoeHWCmrB3jFKebhkYv21TgJG1kfazJpI=;
	h=Date:In-Reply-To:References:From:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=najQhQn+zWqOz+0+3B5UIN3VvgZcE+ak9eSRBAKOq3MCOnQFmZBORrG1+STHAi/xO
	 LlJe/qy4KlUqurAqRDrw/AXWrMjpmZTtyQnQGTG6rP5TMB0ww/RJORf2DBTobTEZAl
	 IRYMyOtZxibl+C54vpdg+aqvzCoLBf6oR0tSb/0M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C1C64F80445;
	Fri, 30 Aug 2019 09:43:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 07848F805A9; Fri, 30 Aug 2019 09:43:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com
 [IPv6:2607:f8b0:4864:20::b4a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E1F8AF80445
 for <alsa-devel@alsa-project.org>; Fri, 30 Aug 2019 09:42:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E1F8AF80445
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="CiI29s7/"
Received: by mail-yb1-xb4a.google.com with SMTP id 137so4689945ybd.8
 for <alsa-devel@alsa-project.org>; Fri, 30 Aug 2019 00:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=dcehfAlOcinXb8/XAOP2QF2JttyhqJSZxbplDwzU1Eg=;
 b=CiI29s7/rMXX7yGVYWsGTqRPgcpvlu8MN1CU9CivPbC4CMxCSIizCw0KQsKAU0uvAk
 a4znrPFuAzlr9HlI9F/1zGSGeuv+ipoRAmiHXMU8fst2M+ciJgWu3qqClptubmKcbVLG
 6wRrQKI63Zk+DrmiSVHgACRMQ+zc3Ck3G+evj5ommM787nRAcVmy/jC5o/ltvqeFoyez
 430zahBbGmCkHbrjTJ4kER3lvHLbWBcigwWn8O46gQr1y+1P7be/RE82Vi3CV2JLhceb
 78IiYqpt/giYeoMeCVOvL9wwVuTh5caof1Bi/fnXX96jb+20WU+8SY2KDtKZuTDaKP+o
 6WLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=dcehfAlOcinXb8/XAOP2QF2JttyhqJSZxbplDwzU1Eg=;
 b=oaC8T46UASbBhab4RSJwewTw0xKOKKwkYsaLCE+o1qb1ToUtpYnQ9gq3Wvux/4ob+x
 sxv0yuDQ+C/EEZERbR6X8JY4OjKyzI/oXIhUx1pAHr/1obUGTMiuis6zmJR3tz53+om3
 r2mXe7qrz7bLBrD6dC2yaSVs6x5HKCV1U/FQVolt6+AC5LjFQZSiCp93KtOVC2zu/HnI
 FQRGntriIpN8U14hkxU6endi0jkZp9iySIKVwxn54y6MiKBhjkdfU9yGhSkJ5uHTTk0S
 o8LYwSKDOpYF0RF53/su3AtcoTabjc4OijflijCbLer6L8+WKN5zxtfbyK2ls276ugCo
 lc0A==
X-Gm-Message-State: APjAAAW1JRBKYfcSd338+pARlT9LvBZlKWocDgvBjstV2urXc/HfhF+q
 nrE05pIBJyIQdBNikEQtM/0YV25glVPR
X-Google-Smtp-Source: APXvYqxG+wwjC4yCUfbsGWvsiyW+QH5pPMj37APoWxbB2z6762ljOsZV9gtb4eYBQb4fxQmgCPpt0rozugwC
X-Received: by 2002:a25:e6c9:: with SMTP id d192mr9888170ybh.467.1567150976234; 
 Fri, 30 Aug 2019 00:42:56 -0700 (PDT)
Date: Fri, 30 Aug 2019 15:42:38 +0800
In-Reply-To: <20190830074240.195166-1-tzungbi@google.com>
Message-Id: <20190830074240.195166-3-tzungbi@google.com>
Mime-Version: 1.0
References: <20190830074240.195166-1-tzungbi@google.com>
X-Mailer: git-send-email 2.23.0.187.g17f5b7556c-goog
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org
Cc: tzungbi@google.com, alsa-devel@alsa-project.org, dgreid@google.com,
 cychiang@google.com
Subject: [alsa-devel] [PATCH 2/4] ASoC: mediatek: mt8183: move headset jack
 to card-specific storage
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

Move headset jack descriptor from module global scope to card-specific
storage to make its ownership more explicit.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 .../soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c b/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
index 1d4a1600f768..a7ad41b6e885 100644
--- a/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
+++ b/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
@@ -15,8 +15,6 @@
 #include "mt8183-afe-common.h"
 #include "../../codecs/ts3a227e.h"
 
-static struct snd_soc_jack headset_jack;
-
 enum PINCTRL_PIN_STATE {
 	PIN_STATE_DEFAULT = 0,
 	PIN_TDM_OUT_ON,
@@ -31,6 +29,7 @@ static const char * const mt8183_pin_str[PIN_STATE_MAX] = {
 struct mt8183_mt6358_ts3a227_max98357_priv {
 	struct pinctrl *pinctrl;
 	struct pinctrl_state *pin_states[PIN_STATE_MAX];
+	struct snd_soc_jack headset_jack;
 };
 
 static int mt8183_mt6358_i2s_hw_params(struct snd_pcm_substream *substream,
@@ -410,6 +409,8 @@ static int
 mt8183_mt6358_ts3a227_max98357_headset_init(struct snd_soc_component *component)
 {
 	int ret;
+	struct mt8183_mt6358_ts3a227_max98357_priv *priv =
+			snd_soc_card_get_drvdata(component->card);
 
 	/* Enable Headset and 4 Buttons Jack detection */
 	ret = snd_soc_card_jack_new(&mt8183_mt6358_ts3a227_max98357_card,
@@ -417,12 +418,12 @@ mt8183_mt6358_ts3a227_max98357_headset_init(struct snd_soc_component *component)
 				    SND_JACK_HEADSET |
 				    SND_JACK_BTN_0 | SND_JACK_BTN_1 |
 				    SND_JACK_BTN_2 | SND_JACK_BTN_3,
-				    &headset_jack,
+				    &priv->headset_jack,
 				    NULL, 0);
 	if (ret)
 		return ret;
 
-	ret = ts3a227e_enable_jack_detect(component, &headset_jack);
+	ret = ts3a227e_enable_jack_detect(component, &priv->headset_jack);
 
 	return ret;
 }
-- 
2.23.0.187.g17f5b7556c-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
