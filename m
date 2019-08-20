Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C94A295FBF
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Aug 2019 15:16:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 03154167D;
	Tue, 20 Aug 2019 15:16:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 03154167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566307018;
	bh=3PlYkdiBYc825blbp7cNKKByi9uTrVH0lIXt6973D8Y=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=jMKoMLr3OAl632dlMLX8E/G2CC4Lk3uL17rIWFOhbhNLPyb1U0u6R3cDv36St3h23
	 m58E0HB9+YvSV+GGqclH7XJGoSXZc1ZqI9RBUx4Skeu76wfByb48zgYTmTicLFet+p
	 dHlJort7eAYpGJt3pV7KX02acNw8Gd/TvoMKIvcQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 76DF8F80529;
	Tue, 20 Aug 2019 15:14:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3439DF8036E; Tue, 20 Aug 2019 15:14:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-f100.google.com (mail-wm1-f100.google.com
 [209.85.128.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 992D7F800BF
 for <alsa-devel@alsa-project.org>; Tue, 20 Aug 2019 15:14:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 992D7F800BF
Received: by mail-wm1-f100.google.com with SMTP id v19so2604446wmj.5
 for <alsa-devel@alsa-project.org>; Tue, 20 Aug 2019 06:14:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:message-id:date;
 bh=cXZ1tHQdDxSofQjcKdrjJTywasB4IlhStZwyyxo9TFM=;
 b=sU6c+lw+yWGyBnKSeVdx4mZsH2SYZXKEHAu0D9+yCV77WDiehvxcP+Ne1TCmHyZmdd
 wloA4PeyAgxOjmfkRyCcnrJDRqG2+zvJzkDtLh/hbNb87JrN9EzwYKOrejhb7bH3quXs
 Gs1YRlJ444D6c30U9XsDn+gghAY1vZDiqEuJtkftjqzBzifreLf1SKo6YAaNoTNjCfTa
 O7y8w5qqRvgTDqxyPmMo6NyyJw5rbcg6pSEnH/098f6cvusFHlNRI0GYVfIL/MtKAnBc
 av9ukq76u+s+mSDefsFUMYTaZLlX8Ja+BexC7gH7Olmc5mlPZ0ZNB9QzGBh1CD6UPMJb
 2m3Q==
X-Gm-Message-State: APjAAAX935l3xolmX5QzuSnjCta8m1n47CVEhm3PA+57lQnIYexY+YHL
 mM0qkG+t7LEjp0Heca44qvCEcQG9lH9ltK4UVOauUeu8SkN3WoEZ0KnBShZR8gyHnQ==
X-Google-Smtp-Source: APXvYqxbIWlIIY6vy6Hz/M5p3K6g8eUuS/jQgXheRopkkCtxO9zXJuYdqyXbbvWI7Lk8cz3eUMoOjQivwHMY
X-Received: by 2002:a1c:be15:: with SMTP id o21mr25428618wmf.140.1566306861563; 
 Tue, 20 Aug 2019 06:14:21 -0700 (PDT)
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk.
 [2a01:7e01::f03c:91ff:fed4:a3b6])
 by smtp-relay.gmail.com with ESMTPS id j11sm372426wrb.64.2019.08.20.06.14.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2019 06:14:21 -0700 (PDT)
X-Relaying-Domain: sirena.org.uk
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1i03xt-0002LW-7M; Tue, 20 Aug 2019 13:14:21 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 8F31F274314E; Tue, 20 Aug 2019 14:14:20 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
In-Reply-To: <20190820123413.22249-1-jbrunet@baylibre.com>
X-Patchwork-Hint: ignore
Message-Id: <20190820131420.8F31F274314E@ypsilon.sirena.org.uk>
Date: Tue, 20 Aug 2019 14:14:20 +0100 (BST)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Kevin Hilman <khilman@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 linux-amlogic@lists.infradead.org
Subject: [alsa-devel] Applied "ASoC: meson: axg-tdm-formatter: free reset on
	device removal" to the asoc tree
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The patch

   ASoC: meson: axg-tdm-formatter: free reset on device removal

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.3

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 18dd62ae3bc31baa0473e4a09e46c02e0bdc57a0 Mon Sep 17 00:00:00 2001
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Tue, 20 Aug 2019 14:34:13 +0200
Subject: [PATCH] ASoC: meson: axg-tdm-formatter: free reset on device removal

Use the devm variant to get the formatter reset so it is properly freed
on device removal

Fixes: 751bd5db5260 ("ASoC: meson: axg-tdm-formatter: add reset")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
Link: https://lore.kernel.org/r/20190820123413.22249-1-jbrunet@baylibre.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/meson/axg-tdm-formatter.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/meson/axg-tdm-formatter.c b/sound/soc/meson/axg-tdm-formatter.c
index 2e498201139f..1a0bf9d3836d 100644
--- a/sound/soc/meson/axg-tdm-formatter.c
+++ b/sound/soc/meson/axg-tdm-formatter.c
@@ -327,7 +327,7 @@ int axg_tdm_formatter_probe(struct platform_device *pdev)
 	}
 
 	/* Formatter dedicated reset line */
-	formatter->reset = reset_control_get_optional_exclusive(dev, NULL);
+	formatter->reset = devm_reset_control_get_optional_exclusive(dev, NULL);
 	if (IS_ERR(formatter->reset)) {
 		ret = PTR_ERR(formatter->reset);
 		if (ret != -EPROBE_DEFER)
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
