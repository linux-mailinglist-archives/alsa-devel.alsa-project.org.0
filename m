Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 250B9479377
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Dec 2021 19:02:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 917F728B3;
	Fri, 17 Dec 2021 19:01:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 917F728B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639764130;
	bh=OUfYfB9FwkQbrFW8I835LS+lqG+miLAVKQXKnH48vps=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Oa6OiGlRLQZxlHa/MQ+WhOctoURCjmWXCcbZNtXrM6OO08gNBz+gmM6+5l4ulKnkN
	 pJL9vLfOF2Vlc6TF6bVfYcePmt5ySh3INYSIATBB2Lgh9J2HX26Kf1u6fluSFTmQNl
	 HJAXd6vypsDu98ZmEq/qXxyKnb1O8jKcdmbvFdow=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E871F80534;
	Fri, 17 Dec 2021 18:58:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 03A35F80528; Fri, 17 Dec 2021 18:58:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9415CF8047B
 for <alsa-devel@alsa-project.org>; Fri, 17 Dec 2021 18:58:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9415CF8047B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="hTeyIA3Z"
Received: by mail-lj1-x22e.google.com with SMTP id bn20so4567626ljb.8
 for <alsa-devel@alsa-project.org>; Fri, 17 Dec 2021 09:58:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=btGZfuKkvHGlpDu1vpCSHhDujyvUpwrfJCWjKl++rLQ=;
 b=hTeyIA3ZMR1GhJuhwrMK33OO6tU4vclI8f1veWvFSxUY32rLFMAmHLt1tF9OU0+BXt
 V8V7ezaLiZ6dtUp/Tdhhz4QLhbJwRVqJmY1ECIqUgOJ4K1GZ84CLz1wO9EmEZIUrk7k0
 UkKZhLQBBvDUbnuJv98SnQQRZsHAQJgc0wd4JlA5DL11S+xtIScRTIyK71r0mY7WxBH2
 eTCkSZ9umnI5ZasO6qcp+6wPQ1cFpSgKQ/Xfz0YmFfLsRpp9L+KtauwBTV+crq642CLp
 GysCVKk6qi6IhRxGLdRTXCjbw8iN1bor/3Qa+ARhNPYp7ThEFNDmJUUNcpGGOf2F/o2L
 qxlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=btGZfuKkvHGlpDu1vpCSHhDujyvUpwrfJCWjKl++rLQ=;
 b=PuiR3TOFrwR8fH9Rvs02dhjr7iRfeceFnccOVcz5RIS0Ha8aDvXNQI/a/gv8tgKDw+
 VPMZ3N3PyoUaUrbSTf0bCXrhKlcGrYCvh2JEXDkx7UOFi6XjdaO8EID04PAnTBjvfUt1
 SDsa6EGIKHCqORPXS/go+ccnDR+nj5FkFYrvGmMnfY34gzidF6U4gQxiMAro1dFzVgAD
 j+i7QD/HPGAkJZdZ/taQ/iv68dtAD2eyhK/MtXk92PhDPKj6zrvv/p5/yaSo/E/hgUZs
 4gcv616uMXPfZryA3EXPxztNW/RGJ616LEsqqOAwYm3cUsbpU713O+H+AcR9nyVnUACM
 8ozg==
X-Gm-Message-State: AOAM53095ZgF6xPFHyIlZsQnm3isUFsJeMPU07sgLlwbKsxMJKeA5rAa
 a7ELXWSOkOqjXBpHc9KaceA=
X-Google-Smtp-Source: ABdhPJwc6k2Csr10tHFwoicg91w/boebavr0X5MJSYT45hxlb3vZvhXbsT4HBnNCjE7+UvzLbzTfbA==
X-Received: by 2002:a2e:548:: with SMTP id 69mr3636945ljf.225.1639763890228;
 Fri, 17 Dec 2021 09:58:10 -0800 (PST)
Received: from localhost.localdomain (94-29-63-156.dynamic.spd-mgts.ru.
 [94.29.63.156])
 by smtp.gmail.com with ESMTPSA id w23sm1479244lfa.191.2021.12.17.09.58.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Dec 2021 09:58:09 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Agneli <poczt@protonmail.ch>
Subject: [PATCH v5 09/11] ASoC: tegra20: spdif: Support system suspend
Date: Fri, 17 Dec 2021 20:56:04 +0300
Message-Id: <20211217175606.22645-10-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211217175606.22645-1-digetx@gmail.com>
References: <20211217175606.22645-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

Acked-by: Thierry Reding <treding@nvidia.com>
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

