Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E247E2DD3C7
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Dec 2020 16:10:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 833C1189A;
	Thu, 17 Dec 2020 16:09:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 833C1189A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608217812;
	bh=xcdWYP4vL6xvnwH7+l30hwh7Gt8R3cuXK4biSXXszmQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bTzmXXu04zlhCXwLnqaE3gHFZHSvVsMzpQGbbJTyf8r/WPVEAxWbPm4BhiKW1hmv2
	 BqU3CE2sZ+VagnnKbsJo3+HhZn0Uj+qm3P2+AKHogQSRpRNdU/Ug+u4t20e8Q27wef
	 PoScJxpt21CL7Ifwu+iAP1upLTHIzVpzTbhwmgB8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E2C81F800C7;
	Thu, 17 Dec 2020 16:08:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 057EAF80260; Thu, 17 Dec 2020 16:08:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1ABC0F80148
 for <alsa-devel@alsa-project.org>; Thu, 17 Dec 2020 16:08:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1ABC0F80148
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="BND8Hy/Y"
Received: by mail-ej1-x636.google.com with SMTP id ga15so38330183ejb.4
 for <alsa-devel@alsa-project.org>; Thu, 17 Dec 2020 07:08:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=75RY4vD+6THVdf7SYejRYxpjyXMqUmJXh8IKgMSDeyE=;
 b=BND8Hy/YuYhie9i+NkI9RB7uFYLhDW7+EAITvHsZH3alEam0zMy38AE88QEdICAXJ0
 OtYI/GROdhnmInH4DWuXCFwm1VYo1Si5Lf3azEQZxpMmad675ymUMVBRs1pGhNLJDdIb
 oLzmO8wTlDhfw48rFKn2+ixfWN1MoqOckgSFeRkuRLpMztuYtTQdajwFauhrmqkyYNZ1
 CnxHKAjIntusZNjXWhsEPARlrovuOrNRS2HMJugNtPbbhOeXgypnarDs5guIrmqyHv5V
 83uJ6TfIAUeky8ja7GFMf3/DirrtAvEk8OlOpipWHiPJSDl+a4K+jk+14sop+7JhUwg6
 q71Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=75RY4vD+6THVdf7SYejRYxpjyXMqUmJXh8IKgMSDeyE=;
 b=oMh0568FKwIJLV6yBfBAF3FWPIi+m9JSK9BHjIKY2rGYDHpEno4UujyAbf+H8A5qDz
 1msMEBOfn0oKFds5ALr0ve071GwubRe7CZ0Jw1pQFYBzq3QJjJjyYpkOLYGBMTF8Xzhf
 s/pnLgYJMxnrYCnP5uG3yv4KllJi9VZgn9Q3XQn/q0G5id9QfawdwqoyHPTF8coqnShf
 +vkdY9gXtk07AS9XTkiY+KVrhEnDE45AoW3BODtTyCUL7uULqMNmb1OUYN/xZC8i3fsd
 I0D4FZ3qSzmPaIk1+cOidrvyLH9K9OJd905IXknhuiYxNLUIlflh4jAm1wIUx6AM6qrn
 J76Q==
X-Gm-Message-State: AOAM532rgdoDZJkMq78+mLIlMcn8IRGOx9M6anG1TTRmBFLrGAPYR29k
 UFGF6aOhY17H8OUINBaBx1f8uQ==
X-Google-Smtp-Source: ABdhPJzyByES9hNl/qPTywwPhbSF8tJ9xCc6PxSLb3zjXhePzkuCgK6L07hmA6u74KYHBNJCULd9SA==
X-Received: by 2002:a17:906:ca08:: with SMTP id
 jt8mr348286ejb.368.1608217702290; 
 Thu, 17 Dec 2020 07:08:22 -0800 (PST)
Received: from starbuck.lan (82-65-169-74.subs.proxad.net. [82.65.169.74])
 by smtp.googlemail.com with ESMTPSA id hb18sm3982411ejb.86.2020.12.17.07.08.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 07:08:21 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH] ASoC: meson: axg-tdm-interface: fix loopback
Date: Thu, 17 Dec 2020 16:08:12 +0100
Message-Id: <20201217150812.3247405-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
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

When the axg-tdm-interface was introduced, the backend DAI was marked as an
endpoint when DPCM was walking the DAPM graph to find a its BE.

It is no longer the case since this
commit 8dd26dff00c0 ("ASoC: dapm: Fix handling of custom_stop_condition on DAPM graph walks")
Because of this, when DPCM finds a BE it does everything it needs on the
DAIs but it won't power up the widgets between the FE and the BE if there
is no actual endpoint after the BE.

On meson-axg HWs, the loopback is a special DAI of the tdm-interface BE.
It is only linked to the dummy codec since there no actual HW after it.
From the DAPM perspective, the DAI has no endpoint. Because of this, the TDM
decoder, which is a widget between the FE and BE is not powered up.

From the user perspective, everything seems fine but no data is produced.

Connecting the Loopback DAI to a dummy DAPM endpoint solves the problem.

Fixes: 8dd26dff00c0 ("ASoC: dapm: Fix handling of custom_stop_condition on DAPM graph walks")
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/axg-tdm-interface.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/sound/soc/meson/axg-tdm-interface.c b/sound/soc/meson/axg-tdm-interface.c
index c8664ab80d45..87cac440b369 100644
--- a/sound/soc/meson/axg-tdm-interface.c
+++ b/sound/soc/meson/axg-tdm-interface.c
@@ -467,8 +467,20 @@ static int axg_tdm_iface_set_bias_level(struct snd_soc_component *component,
 	return ret;
 }
 
+static const struct snd_soc_dapm_widget axg_tdm_iface_dapm_widgets[] = {
+	SND_SOC_DAPM_SIGGEN("Playback Signal"),
+};
+
+static const struct snd_soc_dapm_route axg_tdm_iface_dapm_routes[] = {
+	{ "Loopback", NULL, "Playback Signal" },
+};
+
 static const struct snd_soc_component_driver axg_tdm_iface_component_drv = {
-	.set_bias_level	= axg_tdm_iface_set_bias_level,
+	.dapm_widgets		= axg_tdm_iface_dapm_widgets,
+	.num_dapm_widgets	= ARRAY_SIZE(axg_tdm_iface_dapm_widgets),
+	.dapm_routes		= axg_tdm_iface_dapm_routes,
+	.num_dapm_routes	= ARRAY_SIZE(axg_tdm_iface_dapm_routes),
+	.set_bias_level		= axg_tdm_iface_set_bias_level,
 };
 
 static const struct of_device_id axg_tdm_iface_of_match[] = {
-- 
2.29.2

