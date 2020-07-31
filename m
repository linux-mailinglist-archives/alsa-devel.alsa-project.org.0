Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E552723454A
	for <lists+alsa-devel@lfdr.de>; Fri, 31 Jul 2020 14:08:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8493E16A0;
	Fri, 31 Jul 2020 14:07:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8493E16A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596197282;
	bh=EuEps4ahc/49qalPvEZZaZmDDmbj7Qe18flN5I1yf2k=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=BDNcCb4smtQ3y97aG24HVAkf/mcV05HraIT84pVehX3pCdfpbS8DvG69FbbYDcHMX
	 y06XVnktlhAODFfOAP5XSFNXIPZmQf+WFRhWI9LkrNWwh5DiQGt87PRdvT7w4t/YtN
	 UhkZXxBEqSqF9NE4Q4uxDvDYBHX12qImQfVqO+YE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C66CCF8015C;
	Fri, 31 Jul 2020 14:06:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1B8C6F80171; Fri, 31 Jul 2020 14:06:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BC6EFF8011C
 for <alsa-devel@alsa-project.org>; Fri, 31 Jul 2020 14:06:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BC6EFF8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="mbO9Ho2w"
Received: by mail-wm1-x342.google.com with SMTP id 3so9022043wmi.1
 for <alsa-devel@alsa-project.org>; Fri, 31 Jul 2020 05:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OPGbKdWpP4J/auHhQU9i6g+5dqKdyKhc2qV2F7IdWpw=;
 b=mbO9Ho2whEsjgCbIV1QWsFLUK2smi52qT7wWaKiW87L26VYF+z85RR6d4vFtQK4cLG
 aSVCGMxewoVtU32g0OBkWB1/uTt6ws+Jcj0zjKJg1cSz26Kl0NedCWAwx6l2I45fGQMB
 HpzupOvHluciFnutq5bdGPaIif0FrBawHZQZ/plVzeHiJygqe9zNxIbYLmj5yufRoBhb
 iDADif1cXGMb981LyLn70QSAar4rIG7O/6hHjtP1jgMcSZfdVXZ5MFhz6Y0elhl8S4QG
 PrkAuR0sOjA827BBKqfj/TGF5Iw15t+iawU9sqv7/VuVoSKfXEPyW0+hqoO8nG+m8M6H
 1v+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OPGbKdWpP4J/auHhQU9i6g+5dqKdyKhc2qV2F7IdWpw=;
 b=MMh7SAXnOFX8vMHEtWbmke6ubNhkYNgCiqLqKMbgbnCXgNetVJ3WsjHlZYfRKQSkzX
 yl3NN//x8V2PhboEe+SNBCiSkNRW/pZ9UcA/nIXi6sebxAvzVx46yMG+MuYGoV6CdP+a
 o6Ri33zbNrZrp0XyhqzRpUyua3JsxKmfWm0Ca0fkvXgxKHfLE2cCzVS4ZnlkOlprof0O
 iP4FUFpa7usy/n9P12kPeFs70NsoTSIqSe4wrrSzHrQ1YNXTERj772shd8Q4HHhMAYKk
 xeOfD13mKQiIVeIrOu89J8r0vQa8jZok4u9XC4ZtNT7EvTdMc3l2KYBgYyGVl05TLXDD
 iD0Q==
X-Gm-Message-State: AOAM530JwH2joUMPuIU5r7FXgGFBKxNMPG8mBX0Jv+ofVde4mX0E3huo
 bxZ+QOyPrzi78YlKpVXygwGD2gGPY0kyyA==
X-Google-Smtp-Source: ABdhPJykW4KqeQYC9r3oDy7vW1cPW/jfK2qRpSTFF8xJ+gqC4QgmMJ93gKPbRy305pn2zd/hqHZuCw==
X-Received: by 2002:a1c:7511:: with SMTP id o17mr3855492wmc.49.1596197171510; 
 Fri, 31 Jul 2020 05:06:11 -0700 (PDT)
Received: from starbuck.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id c135sm5438017wmd.31.2020.07.31.05.06.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jul 2020 05:06:10 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH] ASoC: meson: cards: deal dpcm flag change
Date: Fri, 31 Jul 2020 14:06:03 +0200
Message-Id: <20200731120603.2243261-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Kevin Hilman <khilman@baylibre.com>,
 linux-kernel@vger.kernel.org, zhangn1985@outlook.com,
 linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
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

Commit b73287f0b074 ("ASoC: soc-pcm: dpcm: fix playback/capture checks")
changed the meaning of dpcm_playback/dpcm_capture and now requires the
CPU DAI BE to aligned with those flags.

This broke all Amlogic cards with uni-directional backends (All gx and
most axg cards).

While I'm still confused as to how this change is an improvement, those
cards can't remain broken forever. Hopefully, next time an API change is
done like that, all the users will be updated as part of the change, and
not left to fend for themselves.

Fixes: b73287f0b074 ("ASoC: soc-pcm: dpcm: fix playback/capture checks")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---

 Hi,

 For the cards be actually fixed, change 'ASoC: core: use less strict tests for dailink capabilities'
 will need to merged as well. snd_soc_dai_link_set_capabilities() as
 implemented in 25612477d20b5 ('ASoC: soc-dai: set dai_link dpcm_ flags with a helper')
 does not support link with multiple codec with different direction
 capabilities. This quite a common case on these cards.

 sound/soc/meson/axg-card.c         | 18 ++++++++++--------
 sound/soc/meson/gx-card.c          | 18 +++++++++---------
 sound/soc/meson/meson-card-utils.c |  4 ----
 3 files changed, 19 insertions(+), 21 deletions(-)

diff --git a/sound/soc/meson/axg-card.c b/sound/soc/meson/axg-card.c
index 5176be165210..2b77010c2c5c 100644
--- a/sound/soc/meson/axg-card.c
+++ b/sound/soc/meson/axg-card.c
@@ -327,20 +327,22 @@ static int axg_card_add_link(struct snd_soc_card *card, struct device_node *np,
 		return ret;
 
 	if (axg_card_cpu_is_playback_fe(dai_link->cpus->of_node))
-		ret = meson_card_set_fe_link(card, dai_link, np, true);
+		return meson_card_set_fe_link(card, dai_link, np, true);
 	else if (axg_card_cpu_is_capture_fe(dai_link->cpus->of_node))
-		ret = meson_card_set_fe_link(card, dai_link, np, false);
-	else
-		ret = meson_card_set_be_link(card, dai_link, np);
+		return meson_card_set_fe_link(card, dai_link, np, false);
 
+
+	ret = meson_card_set_be_link(card, dai_link, np);
 	if (ret)
 		return ret;
 
-	if (axg_card_cpu_is_tdm_iface(dai_link->cpus->of_node))
-		ret = axg_card_parse_tdm(card, np, index);
-	else if (axg_card_cpu_is_codec(dai_link->cpus->of_node)) {
+	if (axg_card_cpu_is_codec(dai_link->cpus->of_node)) {
 		dai_link->params = &codec_params;
-		dai_link->no_pcm = 0; /* link is not a DPCM BE */
+	} else {
+		dai_link->no_pcm = 1;
+		snd_soc_dai_link_set_capabilities(dai_link);
+		if (axg_card_cpu_is_tdm_iface(dai_link->cpus->of_node))
+			ret = axg_card_parse_tdm(card, np, index);
 	}
 
 	return ret;
diff --git a/sound/soc/meson/gx-card.c b/sound/soc/meson/gx-card.c
index 6da8535f4dd2..5119434a81c4 100644
--- a/sound/soc/meson/gx-card.c
+++ b/sound/soc/meson/gx-card.c
@@ -96,21 +96,21 @@ static int gx_card_add_link(struct snd_soc_card *card, struct device_node *np,
 		return ret;
 
 	if (gx_card_cpu_identify(dai_link->cpus, "FIFO"))
-		ret = meson_card_set_fe_link(card, dai_link, np, true);
-	else
-		ret = meson_card_set_be_link(card, dai_link, np);
+		return  meson_card_set_fe_link(card, dai_link, np, true);
 
+	ret = meson_card_set_be_link(card, dai_link, np);
 	if (ret)
 		return ret;
 
-	/* Check if the cpu is the i2s encoder and parse i2s data */
-	if (gx_card_cpu_identify(dai_link->cpus, "I2S Encoder"))
-		ret = gx_card_parse_i2s(card, np, index);
-
 	/* Or apply codec to codec params if necessary */
-	else if (gx_card_cpu_identify(dai_link->cpus, "CODEC CTRL")) {
+	if (gx_card_cpu_identify(dai_link->cpus, "CODEC CTRL")) {
 		dai_link->params = &codec_params;
-		dai_link->no_pcm = 0; /* link is not a DPCM BE */
+	} else {
+		dai_link->no_pcm = 1;
+		snd_soc_dai_link_set_capabilities(dai_link);
+		/* Check if the cpu is the i2s encoder and parse i2s data */
+		if (gx_card_cpu_identify(dai_link->cpus, "I2S Encoder"))
+			ret = gx_card_parse_i2s(card, np, index);
 	}
 
 	return ret;
diff --git a/sound/soc/meson/meson-card-utils.c b/sound/soc/meson/meson-card-utils.c
index f9ce03f3921f..6a64ac01b5ca 100644
--- a/sound/soc/meson/meson-card-utils.c
+++ b/sound/soc/meson/meson-card-utils.c
@@ -147,10 +147,6 @@ int meson_card_set_be_link(struct snd_soc_card *card,
 	struct device_node *np;
 	int ret, num_codecs;
 
-	link->no_pcm = 1;
-	link->dpcm_playback = 1;
-	link->dpcm_capture = 1;
-
 	num_codecs = of_get_child_count(node);
 	if (!num_codecs) {
 		dev_err(card->dev, "be link %s has no codec\n",
-- 
2.25.4

