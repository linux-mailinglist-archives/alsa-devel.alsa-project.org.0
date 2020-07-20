Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 413F2225584
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jul 2020 03:38:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E84C41696;
	Mon, 20 Jul 2020 03:37:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E84C41696
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595209105;
	bh=n/FBrR/55APODfh3D+V8OUPILhEJlNTPw4tB0ahXB2c=;
	h=Date:In-Reply-To:References:Subject:From:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SCm6RxULp0t3qSwtmG/+tsd82eeUznrf2ihoxqzELjFyNznIWRUE3r4thF6F+J+aA
	 vAsrvn94jam38eoP8lbvGyvJx9oVI9Ety9HXR/kqIQivRbL4d40QLGN1cKH/mAF7e9
	 eOugyoVhE9jUDZu5HR1L7g02bdY42H60gWifIFFA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 316D0F802DB;
	Mon, 20 Jul 2020 03:26:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7EBFFF802DC; Mon, 20 Jul 2020 03:26:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com
 [IPv6:2607:f8b0:4864:20::b49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4E423F800BF
 for <alsa-devel@alsa-project.org>; Mon, 20 Jul 2020 03:26:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E423F800BF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="pHIY39Dq"
Received: by mail-yb1-xb49.google.com with SMTP id d27so19673485ybe.20
 for <alsa-devel@alsa-project.org>; Sun, 19 Jul 2020 18:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=ijnscKktrIyDZbMh97WXOpXJGhaPunXqhCr29sw4Ckg=;
 b=pHIY39DqE+Jgj3zG+4h2gd+Bl3B2LEXLGVVowY0f8WGGztPxSG8OFTpS64qekVtRuU
 cyjyjsF9lKIZLPRQJYqHasJg9GExzn/+4EUdukzge3etSugTAuXX6CfFMxUO5L0x1qgi
 hpgZPXYEwm1EXFyVS614XCK/iueNiaMqUkgbuqXF4G2Vv2zxavf8vClWBP000Oe+ddl9
 DOHJ/o2eQeBmy7+cb6LWDWcVMFhCFt0TW1lLb8iAox0JoDKuS4a+7nNjJunr9hIfH7iE
 sWmtcp3QL0fvTJiG4scM4u08RoTc8eWtB4MH0Iyq4r0+6aeGj195jPcHA/wKK0uAUtMc
 fLvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=ijnscKktrIyDZbMh97WXOpXJGhaPunXqhCr29sw4Ckg=;
 b=t0Oy8HOeQA/X5qDJL8Ui7u2bW2iOyXdJOxGtL5uJJT5iE7NqWuxrPoxb4BqKlEw1uq
 fQYBQODUkj3RJkINJFOQNHMuUgzpsH2Sv2jUXcNCz9Q9GdRoHcp6Tc+YJ37/7Lk3M+vs
 21GMsRBt1eGYtDRf/Dn8Z88YmvpK3pf7TtLCWCY28X8orDqbPKnBGQmYb3RN3wa3BXX4
 +TPDaeMSTdv616JXGpAlGt9BAqJ0qhxtNuaGr745bt5iqHln7MydbmjIyVW5KhW/yRKi
 GW2YBXcjLLQY2hA6+DbcM5H2GJD0e53WAbLw5j8XyptiSGfYOuP+hqV0ciawBgEvFmiq
 Y3HQ==
X-Gm-Message-State: AOAM532jcq9H/p2IbovJ50ywSEblwR1sTK3ftYO0wpvHw3OHsqwRi/7k
 5f6SWGlKnKvZjUwBwDJ1dd61+tXE2bm0
X-Google-Smtp-Source: ABdhPJzeM5tzMzIOt3wQVws/lhc+TumgGZdbgK6jWzFMVGYD3yr2sJ0VeFbDKLyvANZJq7gkE0akYDApKQRt
X-Received: by 2002:a25:3155:: with SMTP id x82mr31207767ybx.492.1595208375891; 
 Sun, 19 Jul 2020 18:26:15 -0700 (PDT)
Date: Mon, 20 Jul 2020 09:25:59 +0800
In-Reply-To: <20200720012559.906088-1-tzungbi@google.com>
Message-Id: <20200720012559.906088-4-tzungbi@google.com>
Mime-Version: 1.0
References: <20200720012559.906088-1-tzungbi@google.com>
X-Mailer: git-send-email 2.28.0.rc0.105.gf9edc3c819-goog
Subject: [PATCH 3/3] ASoC: mediatek: mt8183: support machine driver with
 max98357b
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org
Content-Type: text/plain; charset="UTF-8"
Cc: tzungbi@google.com, alsa-devel@alsa-project.org
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

Supports machine driver with max98357b
("mt8183-mt6358-ts3a227-max98357b").

The key difference from max98357a: max98357b needs to use left
justified format.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 .../mt8183/mt8183-mt6358-ts3a227-max98357.c   | 22 ++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c b/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
index bd04c4bd309b..5ec2789855a7 100644
--- a/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
+++ b/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
@@ -528,6 +528,13 @@ static struct snd_soc_card mt8183_mt6358_ts3a227_max98357_card = {
 	.num_links = ARRAY_SIZE(mt8183_mt6358_ts3a227_dai_links),
 };
 
+static struct snd_soc_card mt8183_mt6358_ts3a227_max98357b_card = {
+	.name = "mt8183_mt6358_ts3a227_max98357b",
+	.owner = THIS_MODULE,
+	.dai_link = mt8183_mt6358_ts3a227_dai_links,
+	.num_links = ARRAY_SIZE(mt8183_mt6358_ts3a227_dai_links),
+};
+
 static struct snd_soc_codec_conf mt8183_mt6358_ts3a227_rt1015_amp_conf[] = {
 	{
 		.dlc = COMP_CODEC_CONF(RT1015_DEV0_NAME),
@@ -617,7 +624,8 @@ mt8183_mt6358_ts3a227_max98357_dev_probe(struct platform_device *pdev)
 		}
 
 		if (strcmp(dai_link->name, "I2S3") == 0) {
-			if (card == &mt8183_mt6358_ts3a227_max98357_card) {
+			if (card == &mt8183_mt6358_ts3a227_max98357_card ||
+			    card == &mt8183_mt6358_ts3a227_max98357b_card) {
 				dai_link->be_hw_params_fixup =
 					mt8183_i2s_hw_params_fixup;
 				dai_link->ops = &mt8183_mt6358_i2s_ops;
@@ -646,6 +654,14 @@ mt8183_mt6358_ts3a227_max98357_dev_probe(struct platform_device *pdev)
 			}
 		}
 
+		if (card == &mt8183_mt6358_ts3a227_max98357b_card) {
+			if (strcmp(dai_link->name, "I2S2") == 0 ||
+			    strcmp(dai_link->name, "I2S3") == 0)
+				dai_link->dai_fmt = SND_SOC_DAIFMT_LEFT_J |
+						    SND_SOC_DAIFMT_NB_NF |
+						    SND_SOC_DAIFMT_CBM_CFM;
+		}
+
 		if (hdmi_codec && strcmp(dai_link->name, "TDM") == 0)
 			dai_link->codecs->of_node = hdmi_codec;
 
@@ -711,6 +727,10 @@ static const struct of_device_id mt8183_mt6358_ts3a227_max98357_dt_match[] = {
 		.compatible = "mediatek,mt8183_mt6358_ts3a227_max98357",
 		.data = &mt8183_mt6358_ts3a227_max98357_card,
 	},
+	{
+		.compatible = "mediatek,mt8183_mt6358_ts3a227_max98357b",
+		.data = &mt8183_mt6358_ts3a227_max98357b_card,
+	},
 	{
 		.compatible = "mediatek,mt8183_mt6358_ts3a227_rt1015",
 		.data = &mt8183_mt6358_ts3a227_rt1015_card,
-- 
2.28.0.rc0.105.gf9edc3c819-goog

