Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E24245F1C8
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Nov 2021 17:24:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC8321A9C;
	Fri, 26 Nov 2021 17:23:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC8321A9C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637943874;
	bh=L+wkMXZmldTuXsHQy8SCCSvRec8VY7bSCXi2lDMNsJY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=J/kEDlpeRMRjYmIUDoMwLuGWGA4cGI56DOIwHb+7FQteLnPksxoPgCixWvFs7YBJA
	 u8c3/DAxQXhxPzC/tmfu9EZbFJzrCh9DaPlQFpNMZ/n0tTvGupoacbVydT7JgHAlO0
	 gtME9sPhRxYrl9Yj7Y/Yj2HeJ19MC6CW0dxDHzns=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B2DFF80533;
	Fri, 26 Nov 2021 17:20:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C754AF804F2; Fri, 26 Nov 2021 17:20:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 84935F804ED
 for <alsa-devel@alsa-project.org>; Fri, 26 Nov 2021 17:19:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84935F804ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="F1IsN1lN"
Received: by mail-lj1-x235.google.com with SMTP id u22so19727802lju.7
 for <alsa-devel@alsa-project.org>; Fri, 26 Nov 2021 08:19:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XQZdihin90lA7efVTDzu3CsDg/xeb8H7EeSD4A6ITqg=;
 b=F1IsN1lNqFntYo6bCbHB9CPRZvvY/nTXdJo+Us3PXxM0NkiSnU7nUaMk/j/ma8/fAX
 1eWdx4wrvVz0g9/srkBaAayU0zUTkrtWurvknhUJJwI6+JLMw5hfEEaI7yBcyE+zTU60
 3VvyVvlOfs3coaF5eRyiLMvstMebJYewwg03H5v1b1VaezeZX1hIsjLvGa36vN92WmmT
 ilMDoNkp7il0KAGRyZEGqJcEUunJhDUVlXyCu3mOmwn9g8ZVhnOOFk0JL+fKc0B4ExAZ
 21A54gVXgh3tsqJcaqHD+taoAkT4yqz3/MTCXhgDmOwAeOglSsVhQWTw1vJZ8lgPJVJg
 D2dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XQZdihin90lA7efVTDzu3CsDg/xeb8H7EeSD4A6ITqg=;
 b=yOneARAosmW8KYI4zFpvQ4uhfcKjWXUhFASu5c41W4Ijoj2C4AHGhA+d6Jt/6C6dE0
 mQkTNCOP7hHTLSKtVqWP7O5ix7uEqsTg0aVskO0pRmiHZRyXpFSsc+Ozucfs9Tod6YK3
 iVTYgq0t+JAifvUfZB25qnh0DD4l+7fU7jjszUpsERVY7xBgLQp+cMRG0oOH13oQeXYf
 Vmcv44NeReD1amOKsRMg+wkwQhy5lFoTDqzs2U77qWGMLih8l2b/kcxOCGt3/n98wcKi
 cqmeQ2Y3blK/YS2OPp7fLZuWIzwMIhp1wERR8+Qm9ir5il1WOOO1gm9O3yduwJPTLe1Q
 uHOQ==
X-Gm-Message-State: AOAM531z5NULSV0uiHmRhp+3HIdE9zxM7JHpRZapdGeqYtquNT3uyP1L
 zp7iiuwrs2sra3SBE6xLWJk=
X-Google-Smtp-Source: ABdhPJyeY+DJa2sflfc3Mxo+CLSNCZ8db8o1DJ/F5GgZWoSelxfLa5+6d4xFyI0nij43neTNk1WsoA==
X-Received: by 2002:a2e:a279:: with SMTP id k25mr32248372ljm.37.1637943590529; 
 Fri, 26 Nov 2021 08:19:50 -0800 (PST)
Received: from localhost.localdomain (94-29-48-99.dynamic.spd-mgts.ru.
 [94.29.48.99])
 by smtp.gmail.com with ESMTPSA id t7sm613381lfl.260.2021.11.26.08.19.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Nov 2021 08:19:50 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Agneli <poczt@protonmail.ch>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 11/20] ASoC: tegra20: spdif: Support system suspend
Date: Fri, 26 Nov 2021 19:17:58 +0300
Message-Id: <20211126161807.15776-12-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211126161807.15776-1-digetx@gmail.com>
References: <20211126161807.15776-1-digetx@gmail.com>
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

Support system suspend by enforcing runtime PM suspend/resume.
Now there is no doubt that h/w is indeed stopped during suspend
and that h/w state will be properly restored after resume.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 sound/soc/tegra/tegra20_spdif.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/tegra/tegra20_spdif.c b/sound/soc/tegra/tegra20_spdif.c
index 8b9bac30d5cd..89f7fc5c8aad 100644
--- a/sound/soc/tegra/tegra20_spdif.c
+++ b/sound/soc/tegra/tegra20_spdif.c
@@ -345,6 +345,8 @@ static int tegra20_spdif_platform_probe(struct platform_device *pdev)
 static const struct dev_pm_ops tegra20_spdif_pm_ops = {
 	SET_RUNTIME_PM_OPS(tegra20_spdif_runtime_suspend,
 			   tegra20_spdif_runtime_resume, NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				pm_runtime_force_resume)
 };
 
 static const struct of_device_id tegra20_spdif_of_match[] = {
-- 
2.33.1

