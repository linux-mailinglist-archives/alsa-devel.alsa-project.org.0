Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1784E22B12F
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Jul 2020 16:22:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 93718168A;
	Thu, 23 Jul 2020 16:21:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 93718168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595514153;
	bh=P0irCqvvcU44RiQ1nL51f68kS9jLA4JSoIIEb6Bktpk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=MHG7uQ/BkVGcxNI+R2IPtATMcMEHBI/3IaWm8bzuFcGdHYLtz3syJvmyz66HmejAU
	 a1BKRcA2aJHthBH65YzXhMButBqTfp2uWPr054iam5b7qYGb5zwmxSCE6IKXPI2qeo
	 cjaSM4oexgd6onHgufmZHmCq6fhTPz+dbaH9GooY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C127CF8024A;
	Thu, 23 Jul 2020 16:20:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 49F9BF80212; Thu, 23 Jul 2020 16:20:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CBD82F80090
 for <alsa-devel@alsa-project.org>; Thu, 23 Jul 2020 16:20:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CBD82F80090
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="wkpo7qVf"
Received: by mail-wr1-x443.google.com with SMTP id a14so5351831wra.5
 for <alsa-devel@alsa-project.org>; Thu, 23 Jul 2020 07:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ntQu/VIUE9Ak1XWr+tVal7WWTvSlvV5WCmELVlSDg/A=;
 b=wkpo7qVfmRQMPMxDfZe4UMyUKZbbfKfNEbl/ATyQ+ZamsFKEYkAJMnnsF70gm8MOJT
 tIeMGGPN/oAeSvdffe4TFe9/EYgHs94i2eaGJHJCQYh0XOo512GHFUdIlei/g7RliGDx
 D5O96c3ZwG2Bzr3+W5nwShYdzfOK89O4fKPNtmdk87x3U7ngJrYSSjHvTbZyfjO7Zf6H
 Zxisg/HN2v9MGvbqicfa8OINsM2xCR3Vb98qLOSCA0bmAQIvu0YRJw2e8NO/+af+e4iw
 fyjNMe4l21vet1zGIgwezkr5OkgUswi3wP/pJLcRDxHYQZkWCXdnNLYbhwozC9Ore0Tl
 GAnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ntQu/VIUE9Ak1XWr+tVal7WWTvSlvV5WCmELVlSDg/A=;
 b=HY4958PR5zE9/Xv8xDLqnTLBrmhiwK7Xms7N8R/HGkbZh2//LTp5mCn8qj921oAs8B
 u5VBg4aiq9bF8D8eDBqaR0yxxUXKKOhNOeODyp5cTfCqnazuDtIcauPrKyye22j+u0EP
 ySqTNyQaW2PtPPUuSBwzK5GqKHEx+eAHFYjpVD1jbNIMhlCxsZ4S2H/eRx7kkTtLNZgy
 yDe47kRjonETAX8BgHpnF6Tu7ohX1RKZFH4eTMHl0Hm5XNTTjrrS1qzIob4TUTO0feOF
 eSFd44zFsVGDRNfV5ey9lgczCI81n6dLncPqo1IBYwXt8Qu9G+uWzTqdYEUDiaLgHvB+
 RP9g==
X-Gm-Message-State: AOAM5320RkXLO/HqraD5hWRvxaVop22wloIOrU7tzACGOZnf8riEfWZB
 Lha2yrB1g6vPkeazwPp0wjGHqQ==
X-Google-Smtp-Source: ABdhPJwPVH7gpTvD/ipnOWJvIHkx8CO3yNE7ijv4WaUQj7B8PPGPf7PeZuVShnyjBwPah/vGz1YMDg==
X-Received: by 2002:a5d:4751:: with SMTP id o17mr4352832wrs.345.1595514036969; 
 Thu, 23 Jul 2020 07:20:36 -0700 (PDT)
Received: from starbuck.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id w2sm235204wre.5.2020.07.23.07.20.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jul 2020 07:20:36 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH] ASoC: soc-component: don't report of_xlate_dai_name failures
Date: Thu, 23 Jul 2020 16:20:20 +0200
Message-Id: <20200723142020.1338740-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Jerome Brunet <jbrunet@baylibre.com>
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

With commit e2329eeba45f ("ASoC: soc-component: add soc_component_err()")
every error different for ENOTSUPP or EPROBE_DEFER will log an error.

However, as explained in snd_soc_get_dai_name(), this callback may error
to indicate that the DAI is not matched by the component tested. If the
device provides other components, those may still match. Logging an error
in this case is misleading.

Don't use soc_component_ret() in snd_soc_component_of_xlate_dai_name()
to avoid spamming the log.

Fixes: e2329eeba45f ("ASoC: soc-component: add soc_component_err()")
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---

 If we wish to report an error when no name is found for dai phandle,
 I think it would be more approriate to it with with "struct device *"
 of the card, which is the one actually failing to get what it needs.

 These user of snd_soc_get_dai_name() are already reporting the error:
 * sound/soc/samsung/tm2_wm5110.c
 * sound/soc/rockchip/rk3288_hdmi_analog.c

 These could be silently failing:
 * Simple cards
 * Amlogic's cards
 * Samsumg odroid card

 sound/soc/soc-component.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index 9565a0dd7cb6..fb6479b22d26 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -344,13 +344,15 @@ int snd_soc_component_of_xlate_dai_name(struct snd_soc_component *component,
 					struct of_phandle_args *args,
 					const char **dai_name)
 {
-	int ret = -ENOTSUPP;
-
 	if (component->driver->of_xlate_dai_name)
-		ret = component->driver->of_xlate_dai_name(component,
-							   args, dai_name);
-
-	return soc_component_ret(component, ret);
+		return component->driver->of_xlate_dai_name(component,
+							    args, dai_name);
+	/*
+	 * Don't use soc_component_ret here because we may not want to report
+	 * the error just yet. If a device has more than one component, the
+	 * first may not match and we don't want spam the log with this.
+	 */
+	return -ENOTSUPP;
 }
 
 void snd_soc_component_setup_regmap(struct snd_soc_component *component)
-- 
2.25.4

