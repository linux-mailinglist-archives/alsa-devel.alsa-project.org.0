Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E4834685B2
	for <lists+alsa-devel@lfdr.de>; Sat,  4 Dec 2021 15:42:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8E1C42414;
	Sat,  4 Dec 2021 15:41:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8E1C42414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638628955;
	bh=ACkdWqC6D779TpZGJCMuiAc3Foc+2flTDFwqleLj7V0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=B89YVItng2IAErmt3o/QB8MZWyJwd9YwQxsUTwL4Jdmi6zFHGBiYBunX4LstiktDo
	 YxNdhNIHDAfRkHWDCxRGyRPt7z7F8Frk6f+tWWvEoeTfv22Ly2u5Kf4M4tO46mimDD
	 0J5LGtbUfZcxKZfuTl9Bu2okHeUwo1Twq/4O1Onc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2013DF8053A;
	Sat,  4 Dec 2021 15:38:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4FBE0F80528; Sat,  4 Dec 2021 15:37:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 66866F804E1
 for <alsa-devel@alsa-project.org>; Sat,  4 Dec 2021 15:37:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66866F804E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="COMMbo7n"
Received: by mail-lf1-x12e.google.com with SMTP id bu18so13935972lfb.0
 for <alsa-devel@alsa-project.org>; Sat, 04 Dec 2021 06:37:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=I4TNl0maOw+qQ0xQdJvO/oCdL3KHkM/Dk/mjk1tn/kI=;
 b=COMMbo7ny6O2X7VC2bO3A8YCnuhGGEFEaUha/goMyT5rSXGmnf65P2mapZ5oZzbmG4
 ZEZhwX2qHGjLs/Cn/xlZT5jlT90jNksb6FW/Tz9DNLHNhFMtt/booCU7gU+Jhw+aaNp9
 CJp3S0FM89SUomn8FX5wKwj2yMYh3o/X3wttFD6ip9LWGFaAnmMoh0x6eBtHqHImiRKu
 M8iC+nGIW9lkd4uC4TICm8SNvPpoSBs+C6Q8U4Fxr+xuf7FSoHyB5Yr/xTMEF6ZPN7q3
 RW+5PyoDmQbxH+ezEZdEur+pRt8XQOteoKEeaZAKVaVBt+vlX3nVmax/ugJrEf3G+gtH
 Ot8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=I4TNl0maOw+qQ0xQdJvO/oCdL3KHkM/Dk/mjk1tn/kI=;
 b=rrboBudP5NpFTedEWFbeEGvnRCVFvuIpl/kB33oVEcYo7OdP0KanCbTAXOxxB//gPJ
 nCdhsn5wIjkjzYov15CJSrnq5V4l6FrCX1v77/9qCcLV8Msqk+K8NAaMVkxzJ+ZUpAyq
 nk2sXQnko7irh1u7B87cbl06nOH481K8FyK7SukyQDeK1TSPpEpA2P6PNxKn6ettQp6y
 KfpCkdba/vrt0L8cfFaxpK7hjQYXfYZUNq3QuN5FhoxLnSuPJaUuAhkqK04l0WUL2JYB
 duttsNM9ARkFJJHSf+EfA5yCQqU6+V0cKAiZqBx59Bq6gel+WrwgezKPs3b5gmjWS9og
 3dsA==
X-Gm-Message-State: AOAM533BbO03R0Pmq5LA222Z3Y/NACYvCVmtS2jX/Xr/7G8MpivVEpo4
 SJlvopZ47e+hFD/YbnHyOw4=
X-Google-Smtp-Source: ABdhPJwBGwFZ1VAmA8VX6TtGQ+4nXtKkxDzfgCjkV2ceUAS/H+mhlKQL1kqjfLM7Div+f7+OlDjKAg==
X-Received: by 2002:a05:6512:3d10:: with SMTP id
 d16mr23491738lfv.78.1638628660353; 
 Sat, 04 Dec 2021 06:37:40 -0800 (PST)
Received: from localhost.localdomain (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.gmail.com with ESMTPSA id g36sm782934lfv.16.2021.12.04.06.37.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Dec 2021 06:37:40 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Agneli <poczt@protonmail.ch>
Subject: [PATCH v4 11/22] ASoC: tegra20: spdif: Support system suspend
Date: Sat,  4 Dec 2021 17:37:14 +0300
Message-Id: <20211204143725.31646-12-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211204143725.31646-1-digetx@gmail.com>
References: <20211204143725.31646-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 linux-tegra@vger.kernel.org
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
index bc45a0a8afab..a4aa5614aef4 100644
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

