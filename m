Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1717145CFDE
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Nov 2021 23:11:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AC4E4183A;
	Wed, 24 Nov 2021 23:11:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AC4E4183A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637791918;
	bh=taRbsqCzWB1a5KkmqBumvGryO0mM6cypNDIK6Sc4BAI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=L7HSxJIv/nPk0CWDDW9VJhvkhuSIX3q87+nU3RhUHvjNxmDaAtE2tpKQTGenXMFtv
	 KS8MYywAlWGN40RTTzbj8CxI9etXACTLYYbPqGz6w8b0BK8M0w22ujhZXTaRL8/YoZ
	 idkLx0CK/JC/KKLjQ2VHs8B/9m/hZnQWLydEd2tg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2637EF8053B;
	Wed, 24 Nov 2021 23:07:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D89FFF80528; Wed, 24 Nov 2021 23:06:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 85D1CF804FB
 for <alsa-devel@alsa-project.org>; Wed, 24 Nov 2021 23:06:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 85D1CF804FB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="pnA9n1gQ"
Received: by mail-lj1-x236.google.com with SMTP id k2so8427407lji.4
 for <alsa-devel@alsa-project.org>; Wed, 24 Nov 2021 14:06:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=J2ouOYArYTiGPyKjaLg9beinXsL+bwxgMLfVEklW094=;
 b=pnA9n1gQI9hSs1rmixoW7n5S4z1lJAqgp8X3BpEZd0LjaqU/dT4zRL+OeE1rKtZnld
 JSUusimIa2AFyh4JlQli+Xs+yoCMqmQ8hb5g6H+Xp49/SC5PeD+LtR1yxtbWd14vINrq
 HiXBjF2ftObNSwKUv4XOat9OhGeQ6MFh3o6QEWirQ2F+DxQ0AAV0F/mYglkPO26fTyal
 tVEUyMMz3VcQgMR4RYk73Xmr6a8o3oDUTIvCD8/9dfxXIx63hJnGm+CO5Mr79/lyj9y7
 EljVST/+J8ctzhW6fdnTHCUC7LG2sa6htuHwscJZDvcAh6KrONesooQyPKX9Jq8VLf5r
 GkEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=J2ouOYArYTiGPyKjaLg9beinXsL+bwxgMLfVEklW094=;
 b=Qio2rdhNXVY3FHce7vLinAeSMFKY5SfFB8jr8JI3aTVQj1hQmdW4yo1kg8GNmTL9E6
 0gZHxpPiB+e09UnTf/aV/jjs7MwW1tcAyIUqNVHo9CWdiDcGPye3Q01m8Qa+OfPag4tg
 W4P/uotrsfFvDhrIeZpjKMV7na8cYdemouxqv1CQV2WTEcaEx1ea0+XQ0FPGPxTwvYu8
 5lOKq4FGA1gm5n4eX8EvBk0oWE7aF0micI6IKR9DpbarD5IuKP9CHSQd9BUUxiOgyO3I
 mkxtjYNee+e3ywwUXZOpwSLbwqqvJc3TpDu6ra3zymRFGyM4vL1gTGmZYtvNsLpzQK+D
 FjGQ==
X-Gm-Message-State: AOAM532MWRgv8AX4ZeZ0Dty4gPoxppUgKxd1oRXITYG16zPwbZg8U96r
 rqXWpaytE0oOPRLlXq3jS+k76KgB1LU=
X-Google-Smtp-Source: ABdhPJwJSd+Si40B6GfMYdhTeNYiyWm8DOVcAAxmkWLOpTKPR07lt7OcXz3u27yqFTmPOsd95JEF4A==
X-Received: by 2002:a05:651c:2119:: with SMTP id
 a25mr19932045ljq.131.1637791602196; 
 Wed, 24 Nov 2021 14:06:42 -0800 (PST)
Received: from localhost.localdomain (94-29-48-99.dynamic.spd-mgts.ru.
 [94.29.48.99])
 by smtp.gmail.com with ESMTPSA id w17sm93266ljh.15.2021.11.24.14.06.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Nov 2021 14:06:41 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Agneli <poczt@protonmail.ch>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v1 14/20] drm/tegra: hdmi: Unwind tegra_hdmi_init() errors
Date: Thu, 25 Nov 2021 01:00:51 +0300
Message-Id: <20211124220057.15763-15-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211124220057.15763-1-digetx@gmail.com>
References: <20211124220057.15763-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>
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

Add missing error unwinding to tegra_hdmi_init(), for consistency.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/tegra/hdmi.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/tegra/hdmi.c b/drivers/gpu/drm/tegra/hdmi.c
index 9a87d351a828..142ad696426f 100644
--- a/drivers/gpu/drm/tegra/hdmi.c
+++ b/drivers/gpu/drm/tegra/hdmi.c
@@ -1456,22 +1456,31 @@ static int tegra_hdmi_init(struct host1x_client *client)
 	if (err < 0) {
 		dev_err(client->dev, "failed to enable HDMI regulator: %d\n",
 			err);
-		return err;
+		goto output_exit;
 	}
 
 	err = regulator_enable(hdmi->pll);
 	if (err < 0) {
 		dev_err(hdmi->dev, "failed to enable PLL regulator: %d\n", err);
-		return err;
+		goto disable_hdmi;
 	}
 
 	err = regulator_enable(hdmi->vdd);
 	if (err < 0) {
 		dev_err(hdmi->dev, "failed to enable VDD regulator: %d\n", err);
-		return err;
+		goto disable_pll;
 	}
 
 	return 0;
+
+disable_pll:
+	regulator_disable(hdmi->pll);
+disable_hdmi:
+	regulator_disable(hdmi->hdmi);
+output_exit:
+	tegra_output_exit(&hdmi->output);
+
+	return err;
 }
 
 static int tegra_hdmi_exit(struct host1x_client *client)
-- 
2.33.1

