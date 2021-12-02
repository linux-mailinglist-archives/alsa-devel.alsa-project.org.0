Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D75E466851
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Dec 2021 17:30:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C58C2917;
	Thu,  2 Dec 2021 17:29:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C58C2917
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638462617;
	bh=h5+BYFRwsLPoMP4hGQqlXuZUQzGtHuyCBAbAZs5lfPI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ftOyAjjLMnSOFQu6K5gUHmabGTRcRmSgZGKoD+ZaiZq/XZ2Fcj4VMauteRBwH91OD
	 DRNrJJFxRfhkyp5zeX5rD7WcOckOcPBpduKMFyiX4uZk9g50O7LkMxdjFmUKt89beu
	 sRw9OfQps11zM1BLirNGIzFlFACfHTn/AEMhR3nU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C6B4F80538;
	Thu,  2 Dec 2021 17:25:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CFA08F804E2; Thu,  2 Dec 2021 17:25:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9F795F804FE
 for <alsa-devel@alsa-project.org>; Thu,  2 Dec 2021 17:25:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9F795F804FE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="I36KU8MZ"
Received: by mail-lf1-x12a.google.com with SMTP id m27so72710996lfj.12
 for <alsa-devel@alsa-project.org>; Thu, 02 Dec 2021 08:25:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OxcYUIueLlQa52jFEvuy/N4e/ZecehjJr4Gk4VLaFrk=;
 b=I36KU8MZVlIM3GrcPcUk71WextQQmOsKJ8L6PvyMA5NCP5WFFU6uZxN2ZXTVjc0QxY
 BfUMtdl3qwAZ31uIpKXI8Kj3I0AHT2j75uX/LMaZ8D92Pne7S4gUIt2d/yzcyQJBsBzA
 l8/Vdp0b/10Z6SBjsIFNBeylHjzKyJb99EpU5cr6XvuCGzxjU/Zo3gtFEJqL3TUsWezt
 xDeBtIAVLxNQz09hNenjujxy/LC7yybW7UQR2aW4i3UohNhaPPywhbjKuoDgZicqqJ6x
 xHajm9tPwhuQ/t78FZF2KI2dLyjvyqbwNrGr5Ce2yE6abqt7VS3DXBX6uowDzl9ljfnR
 5znA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OxcYUIueLlQa52jFEvuy/N4e/ZecehjJr4Gk4VLaFrk=;
 b=FDKCMo0efk1sswXrOep7e6pogNblAMil8D1R8eM5zsD9VG5MLDvrkhMJJxIFH6S8Rs
 wwhIzw4+/slVKrKygrGp5v0IWzK5Et2Ju5XFiTs4QWk2qYnNrgnTQZM012sOmlHttfKy
 k3aXrvshrCz2eXB77FgT21otNUQHhShn5EuUCG56g/J9iLmr9rzwTqm/jScXiDeP3kBb
 nPYRZdkBubmJXeP8Zcst3FNvFU0HP9/XRgDPv0JAwM4zjzI+MMK4FLE51O0XlQstwoDK
 g1G571bHnCSSy403ufSJzroCEHYphGQxVO8mIokS+RBUTIp9Iyrpr+dIJb87JLflsesP
 PYTQ==
X-Gm-Message-State: AOAM532g34i1agCrQcoe3NI8paMf74Dil7anO8MQID654nrD8EoanXKB
 4PQfzq7VvpqwL5o1JNcYdxQ=
X-Google-Smtp-Source: ABdhPJy5alaon9JWfGyAgcM+Lp6GPPApvSuwcMDKG9goTRM8TzwT6/nCrJurJ/RP0JtE1gz6hhWriA==
X-Received: by 2002:a05:6512:3251:: with SMTP id
 c17mr12374298lfr.440.1638462328985; 
 Thu, 02 Dec 2021 08:25:28 -0800 (PST)
Received: from localhost.localdomain (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.gmail.com with ESMTPSA id d18sm36806lfl.30.2021.12.02.08.25.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Dec 2021 08:25:28 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Agneli <poczt@protonmail.ch>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v3 14/20] drm/tegra: hdmi: Unwind tegra_hdmi_init() errors
Date: Thu,  2 Dec 2021 19:23:35 +0300
Message-Id: <20211202162341.1791-15-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211202162341.1791-1-digetx@gmail.com>
References: <20211202162341.1791-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
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
index 3242baddc5e7..cc42476fd023 100644
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

