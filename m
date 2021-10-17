Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E14FF430A59
	for <lists+alsa-devel@lfdr.de>; Sun, 17 Oct 2021 18:02:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5DE771866;
	Sun, 17 Oct 2021 18:01:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5DE771866
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634486524;
	bh=Mwnn7mF0+MZFi+nZYJTYQ222Jj9mD5UFXcSlMqtOrX0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=pKH+vTHys+KURRFROs248C9Yv7hGMNTHypIoQYthvPHZDzKEG98OTbyqcH+8MGs/i
	 2QPwu/qAd5yUkVCXSYK1ZXGhChmGVJ3XFCq9qAvKEKi2Gptoe2BkzIuCMfq1ag4diq
	 PEnI7e4cXjcDmpbflZvi/yz6fyiow8tYL+EIpHw0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AA4D6F8026C;
	Sun, 17 Oct 2021 18:00:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8D119F80256; Sun, 17 Oct 2021 18:00:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C8C3EF800E5
 for <alsa-devel@alsa-project.org>; Sun, 17 Oct 2021 18:00:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C8C3EF800E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="qrLR02zp"
Received: by mail-ed1-x52e.google.com with SMTP id g10so60657990edj.1
 for <alsa-devel@alsa-project.org>; Sun, 17 Oct 2021 09:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=8kT8uxQmVp/XocDx24aLnGXhZi2Xo78WndzfJoxUXf4=;
 b=qrLR02zphJEnatJargVO7TxpS34lT74UJQ7lr8oE5lRkxlgLQ8ArQlSrMq0GflGD4D
 7dsC4ii8/jjoRXXFbXupZOzWH72mJb3LlTLH51cGjaN1yZtLeYc/5IbApZp/Vef1FWLv
 O/AxFsGAUDTwmk8J170VCDyJIOH8E6WyzOhazTkVUwtTpQvU++ESv905EVNkdr2mXK2S
 1DDGvigBCQr5Rvcn8nh1zzwlQEdsXI/GzB8f6/MOmg4Kw9q9PTawl64ev7SjmyS1jQoc
 YTIdRXAompcx+ZsrJvdyZdBUbv6WIDveBO4RmE7looBbHelfcJlV7jz1ubenysiOzKEZ
 cvxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=8kT8uxQmVp/XocDx24aLnGXhZi2Xo78WndzfJoxUXf4=;
 b=6s7JupVoWD6d5xBZ1fIrWv1M8w3muFPl07mQLG5trnhfYTVIgB0VK3JXMxeVTX39+x
 cAhAd4PIwlqwLCOc4/mIRdVc7pp4WtPq6nMbTDLbliZH8oVv2YjUlB7ICt01XA/PYxwt
 m9D26mU8apoXVuvfyYtTv8gLx4lC63qtj+Q2mOJbT9Wh6ndoVZdh7RQsBb14u5ofiQNi
 Yr9holF63Mea6M1HnKkocu1HubpN2wlr6vNE4hWGner+ss7CcE0d59g8QsjV7TD6lB+g
 RnPRWnHwnWLBbhtSeICvbq4mcUFnxN9PC2gafnxjzDGdgftNxfB8pKWk4UcTFJlHUKPg
 ABGw==
X-Gm-Message-State: AOAM531+2BSrebd4q0B6evvP7UOxxhIb6N7yDmXO6Nm129wZKzRl02dM
 k3iiRL6yTxABZ98IjV1T2aI=
X-Google-Smtp-Source: ABdhPJwTB0vfk1m5xsCYFd2NXY/+qkTRYqLJ8qato/ZDGtv+VE5V+xBNUFGnEFhH9R8hZ1fiItRyuA==
X-Received: by 2002:a05:6402:3547:: with SMTP id
 f7mr36201251edd.395.1634486434122; 
 Sun, 17 Oct 2021 09:00:34 -0700 (PDT)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id yz9sm7693135ejb.51.2021.10.17.09.00.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Oct 2021 09:00:33 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: meson: implement driver_name for snd_soc_card in
 meson-card-utils
Date: Sun, 17 Oct 2021 16:00:28 +0000
Message-Id: <20211017160028.23318-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: Matthias Reichl <hias@horus.com>,
 Christian Hewitt <christianshewitt@gmail.com>
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

Implement driver_name to provide an alternative to card_name for userspace
configuration of Amlogic audio cards.

Suggested-by: Matthias Reichl <hias@horus.com>
Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
The meson AIU/AXG drivers currently require alsa confs based on the board
model name which is unique to each board. This is very flexible for audio
use-cases, but not very maintainable for distros with a single use-case
that need to support a large number of different Amlogic boards. Using a
driver name to match the card conf instead of card/model name reduces the
number of confs needed in the LibreELEC (Kodi) distro from 41 to 2.

 sound/soc/meson/meson-card-utils.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/meson/meson-card-utils.c b/sound/soc/meson/meson-card-utils.c
index 415cc0046e4b..29b0174f4b5c 100644
--- a/sound/soc/meson/meson-card-utils.c
+++ b/sound/soc/meson/meson-card-utils.c
@@ -302,6 +302,7 @@ int meson_card_probe(struct platform_device *pdev)
 
 	priv->card.owner = THIS_MODULE;
 	priv->card.dev = dev;
+	priv->card.driver_name = dev->driver->name;
 	priv->match_data = data;
 
 	ret = snd_soc_of_parse_card_name(&priv->card, "model");
-- 
2.17.1

