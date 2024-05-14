Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C6ABA8C57FB
	for <lists+alsa-devel@lfdr.de>; Tue, 14 May 2024 16:32:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1D233868;
	Tue, 14 May 2024 16:32:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1D233868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715697136;
	bh=DxlEqtVTRXFReuQuvLxn/d2cy0K8/Bkbm/OiSCg4Hc0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fSiHeqXp32LSHzegVNyqSgL2l09QlMG/eMPsJ108t2geg3cKUkarlP1wBAUvNZMQy
	 q2PdsgSJ6E/hiNsLEx6yM0rDZGse8ZVL+GoYlgt6FWCsu3l+HuiJ+LUBiiEY/0XWVH
	 LH59g1yxAiWMn8qDWUTxADWJlYzjNKfl5kPJSC78=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 821C8F805AC; Tue, 14 May 2024 16:31:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 96F5AF8059F;
	Tue, 14 May 2024 16:31:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BAC41F80224; Tue, 14 May 2024 16:31:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 04444F800E9
	for <alsa-devel@alsa-project.org>; Tue, 14 May 2024 16:31:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 04444F800E9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20230601.gappssmtp.com
 header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=eHMxgxsq
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-34db6a29a1eso4612138f8f.1
        for <alsa-devel@alsa-project.org>;
 Tue, 14 May 2024 07:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1715697086;
 x=1716301886; darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ln4czWjw11QmRtGLij7AUk0r+XUH7GvNjZu/Euwwgag=;
        b=eHMxgxsqVeuNs94eBa78NbCeOBtfdc5sUAYzhgrAZgH9mMbwxU8PA4OQH5EBESlo+7
         UfRKbl2oUoR/UqyRoIkJk9oxRdeChQkUAoFfTsoxEaXIDD0bJ5+3c9bWT92YL/R5SMh9
         csBlRJe955LcoQBXr7PiwbAcsHIUjOUfvITYh+sY7dCU3cY36sHl+btUAHJWvFMcNLkg
         zVv53yrM03AOcc+MipyY6SFaC9EPu//h9KY0ntlKlYJ3eyiM/lKwys/R4yyBb5+7XKgA
         PMm+IO7cMnj1bswCtHxL+nQmIrFzQzxP4lu+taaPDMOE015zmbaXjqWtKQQVg2uSwa2Q
         6zdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715697086; x=1716301886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ln4czWjw11QmRtGLij7AUk0r+XUH7GvNjZu/Euwwgag=;
        b=iIn4kAfdWAZUMHio1lWZznrtLYhlM37WLQrqsNlpcVRA+J4kbP1jTLnXi0+dbT5KLX
         RP4kvtNqCGAo+/99vc6qrYrGsF7iAoADdnqvu0zRPnKUcN5PnJQBSLri42Ft84JK4xwn
         QxTWzX9SoDxXgi5LvDVXwpaeqrp2MKNrX6GmoZNNKCjV6keStCQW0sDOZHQEV8cUDZR2
         YjmAWzcbc+cSmRAUbltSvtEq6iBtoIBnZqz8lEWFb6lLuL1v1dlyRxWPH30FR80JuGru
         Hn07ezMEzBSD4ILn4jA1b37LwHkCsuMdzkTgaQQyOm/so/dB0J2ZPNbhDyYB6ML8dGDM
         zGZw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV0Dt3ROIrF655IXa/EdAeE4WM0RNtLIJB8XAPUCkF1bC/h6UmSkTexuWSMcZ7m9XPKp7EMlcykibBU9YoygVuqHGF6k2WKgnceMXA=
X-Gm-Message-State: AOJu0YxziJEEhTUgXM0fCvspZqKS0LNlU9XgRgbhiiWb3ldkRWLHTr5r
	9ag9n0MkxphIeALFWW85EI0lkOpoi6W0rWgWWsbehkLg/dmpd7vlCalNEvSfynk=
X-Google-Smtp-Source: 
 AGHT+IEMwg+hLrvXY8E1TdPRRYJF6yX+6J61OrtJvgZefi9YUEoDxzUYDJl8/OrpwBDQbxRW36oP3g==
X-Received: by 2002:adf:fa0f:0:b0:34d:1b8c:1afb with SMTP id
 ffacd0b85a97d-3504a736b48mr7803454f8f.24.1715697086450;
        Tue, 14 May 2024 07:31:26 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:3f47:f219:de13:38a7])
        by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-351cb0fb6b4sm627163f8f.24.2024.05.14.07.31.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 May 2024 07:31:26 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH RFC] ASoC: amlogic: do not use dpcm_playback/capture flags
Date: Tue, 14 May 2024 16:30:46 +0200
Message-ID: <20240514143116.3824376-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <87o79azh65.wl-kuninori.morimoto.gx@renesas.com>
References: <87o79azh65.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Message-ID-Hash: BKS4Z4JIRNEN3XGXLJ5D6L62QPZMISZY
X-Message-ID-Hash: BKS4Z4JIRNEN3XGXLJ5D6L62QPZMISZY
X-MailFrom: jbrunet@baylibre.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BKS4Z4JIRNEN3XGXLJ5D6L62QPZMISZY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

dpcm_playback/capture flags are being deprecated in ASoC.
Use playback/capture_only flags instead

Suggested-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---

Following Kuninori's series, dpcm_playback/capture will be ignored.
However, properly disabling stream direction is important for Amlogic
audio drivers.

I'm not too sure how this should be applied to avoid breaking bisect,
before or after Kuninori's series. Maybe it should be merged into it ?

Any suggestion Kuninori ?

 sound/soc/meson/axg-card.c         | 10 +++++-----
 sound/soc/meson/meson-card-utils.c |  4 ++--
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/soc/meson/axg-card.c b/sound/soc/meson/axg-card.c
index 09aa36e94c85..646ab87afac2 100644
--- a/sound/soc/meson/axg-card.c
+++ b/sound/soc/meson/axg-card.c
@@ -132,7 +132,7 @@ static int axg_card_add_tdm_loopback(struct snd_soc_card *card,
 	lb->stream_name = lb->name;
 	lb->cpus->of_node = pad->cpus->of_node;
 	lb->cpus->dai_name = "TDM Loopback";
-	lb->dpcm_capture = 1;
+	lb->capture_only = 1;
 	lb->no_pcm = 1;
 	lb->ops = &axg_card_tdm_be_ops;
 	lb->init = axg_card_tdm_dai_lb_init;
@@ -176,7 +176,7 @@ static int axg_card_parse_cpu_tdm_slots(struct snd_soc_card *card,
 
 	/* Disable playback is the interface has no tx slots */
 	if (!tx)
-		link->dpcm_playback = 0;
+		link->capture_only = 1;
 
 	for (i = 0, rx = 0; i < AXG_TDM_NUM_LANES; i++) {
 		snprintf(propname, 32, "dai-tdm-slot-rx-mask-%d", i);
@@ -186,9 +186,9 @@ static int axg_card_parse_cpu_tdm_slots(struct snd_soc_card *card,
 
 	/* Disable capture is the interface has no rx slots */
 	if (!rx)
-		link->dpcm_capture = 0;
+		link->playback_only = 1;
 
-	/* ... but the interface should at least have one of them */
+	/* ... but the interface should at least have one direction */
 	if (!tx && !rx) {
 		dev_err(card->dev, "tdm link has no cpu slots\n");
 		return -EINVAL;
@@ -275,7 +275,7 @@ static int axg_card_parse_tdm(struct snd_soc_card *card,
 		return ret;
 
 	/* Add loopback if the pad dai has playback */
-	if (link->dpcm_playback) {
+	if (!link->capture_only) {
 		ret = axg_card_add_tdm_loopback(card, index);
 		if (ret)
 			return ret;
diff --git a/sound/soc/meson/meson-card-utils.c b/sound/soc/meson/meson-card-utils.c
index ed6c7e2f609c..1a4ef124e4e2 100644
--- a/sound/soc/meson/meson-card-utils.c
+++ b/sound/soc/meson/meson-card-utils.c
@@ -186,9 +186,9 @@ int meson_card_set_fe_link(struct snd_soc_card *card,
 	link->dpcm_merged_rate = 1;
 
 	if (is_playback)
-		link->dpcm_playback = 1;
+		link->playback_only = 1;
 	else
-		link->dpcm_capture = 1;
+		link->capture_only = 1;
 
 	return meson_card_set_link_name(card, link, node, "fe");
 }
-- 
2.43.0

