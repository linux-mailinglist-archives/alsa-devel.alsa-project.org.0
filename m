Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E0F46684B
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Dec 2021 17:29:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5FF2918A5;
	Thu,  2 Dec 2021 17:28:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5FF2918A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638462558;
	bh=ACkdWqC6D779TpZGJCMuiAc3Foc+2flTDFwqleLj7V0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=N65finTD4BqlURX8hb6TbRdN8+VDC5kojCmyxAaE7Nm0TSkEZ23xbVp9MSHOyjDRZ
	 JGRCTg1sMw2zmPbd0RCqlW8ZKpIc1WaewizWuI5mcYL2DpH2pzj2C3SNpsog53UFdv
	 9Y8+4RmlIOMTGcWHUMdYxP0ShHeQT8frvIuIh95Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 57D67F80528;
	Thu,  2 Dec 2021 17:25:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8F20CF80516; Thu,  2 Dec 2021 17:25:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F2AB9F804ED
 for <alsa-devel@alsa-project.org>; Thu,  2 Dec 2021 17:25:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F2AB9F804ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="q69PrNnn"
Received: by mail-lf1-x12b.google.com with SMTP id bi37so72772444lfb.5
 for <alsa-devel@alsa-project.org>; Thu, 02 Dec 2021 08:25:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=I4TNl0maOw+qQ0xQdJvO/oCdL3KHkM/Dk/mjk1tn/kI=;
 b=q69PrNnnB342xHj0Cmqq2IVpuiQ2yIr1SiDnwh853ktdMDtdg2yLC7IW7gqRU4i6/U
 5nKC8Jp00I0jT4jKqq+MuCr4Z4iDPu+tBACGO5C7TYYhrCPaNBaxyj4V10DohzUP9wD/
 5OXCvt9fdCHB0NcTEHQf58Qiaj6Qs0YNyJ3mawa5+QnakKhRkEZO/+6AJoHjpf3C6gG1
 5ER80osacA2YezjNOQZ8SmyD85KO87uHQL7SPIpDejg6m3uyLioFtPKYKnRrNDk2z/si
 ymaCyxjh9lLmGm1XlzjUWX1olcNo964QNqvZTbdt6kcNceEvlsWzqTK9/qJRnRE89zN1
 WsCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=I4TNl0maOw+qQ0xQdJvO/oCdL3KHkM/Dk/mjk1tn/kI=;
 b=zwWWjcJWGxJ0x87KYCdEMCE35i3AN9YDQUaMK0EwX7QPnXq2S2tdtl/f8fens9EZZ4
 G7Izx1qvkg+WN5NCZcGEnIOijhgS27Lo5pBo1k3PJKled4AU4VVmoqcixeh/NOFkkyrb
 pA7yFlcUwuCTCSgew0MciiIXCaZayW5xKLiw7ybQbSegmxRzT/OcACP38VPIFQ5bxXzj
 ZvFsYz4YkOB2/bgxjDWX/eGaoFpXqzlk/2sYYS0w14ghUBIfax5yDkC7swSl5/0npOcF
 YheRstI0Clvl8/9OKJGh5nt2GiCUK9+pL1eUWu6aZdxynTLOS63SaDoMWmes69/QvMet
 wKqA==
X-Gm-Message-State: AOAM530d7+n5dbzeYpLNEe5ROkKx2vFaDGPzePARO+cA+q4cVqon1XB3
 6D+UZ4bCNK1AZo4NIv5Ma50=
X-Google-Smtp-Source: ABdhPJwz0qeqhDbbsnUNCtz+fTMa7GcVlIXkWFGDQHWdI9fpFBeUVePGAgCtQXEjmzk6lOE1dH7qyw==
X-Received: by 2002:a19:6b08:: with SMTP id d8mr12695068lfa.39.1638462326465; 
 Thu, 02 Dec 2021 08:25:26 -0800 (PST)
Received: from localhost.localdomain (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.gmail.com with ESMTPSA id d18sm36806lfl.30.2021.12.02.08.25.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Dec 2021 08:25:26 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Agneli <poczt@protonmail.ch>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v3 11/20] ASoC: tegra20: spdif: Support system suspend
Date: Thu,  2 Dec 2021 19:23:32 +0300
Message-Id: <20211202162341.1791-12-digetx@gmail.com>
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

