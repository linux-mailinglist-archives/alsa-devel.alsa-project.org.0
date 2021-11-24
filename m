Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9070645CFD6
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Nov 2021 23:10:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 30E9817E9;
	Wed, 24 Nov 2021 23:09:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 30E9817E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637791805;
	bh=L+wkMXZmldTuXsHQy8SCCSvRec8VY7bSCXi2lDMNsJY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QxMGOMGEz6LD6Tvu5ejXAsJz+Os851+eXPKOMgsIVENtmaupWtogB/0Nr5GrchZqa
	 C1CfGm3Rj7gnk741IiatS70Eh4IvN01J4zmzLCXQa79R7EIo1ZJ2h7662lNxAeO/de
	 CO4EpbVCgSa7HrPdhL1Vkg5t6teAr9zVdnUjc1g4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8A62FF80520;
	Wed, 24 Nov 2021 23:06:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9E0E3F804FD; Wed, 24 Nov 2021 23:06:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CA328F8011F
 for <alsa-devel@alsa-project.org>; Wed, 24 Nov 2021 23:06:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA328F8011F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="nJAo4iPf"
Received: by mail-lj1-x234.google.com with SMTP id u22so8382522lju.7
 for <alsa-devel@alsa-project.org>; Wed, 24 Nov 2021 14:06:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XQZdihin90lA7efVTDzu3CsDg/xeb8H7EeSD4A6ITqg=;
 b=nJAo4iPfwBFY1ROe3048h1ybqQlX//p3YjSX7Pe0idWjl7D5Xl7cOhLCOiOdeHEVtw
 i1TsPOsnewcD5UwgabPKGc1V8ufc2Zd+FJV0+A0q6BgfW74cgH0ysttiHo0JEuKO06Rf
 oSinD/HXvoSsQPpiGhkH5NiAnlXw69WbXOkSEmz5iXw1DnlDdAz0TEcgI6GlEiPRdKb/
 o069dFlaoy5lyEDSGze4gA+OToJs1MdOl69LwnbHH6fpJD3OU8yGdMtR7rBHQx5ehabg
 p1FSHjplifcYroZVsJCoW1Pl7SCG52FqXEMBlrRcXhVCQLxFhlKVMSxxPb7NXXuUNqPG
 2orA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XQZdihin90lA7efVTDzu3CsDg/xeb8H7EeSD4A6ITqg=;
 b=AMeObhn6yKuOe5xF2vz8mP8XwBXO4yMuGiSwGD4JFzqbQ2Jd8PJUms62yrpUstVMQt
 srO9ufjwjZQPeASUvXbxKWW+9ZIoHLFNeJkG0fDvhk+cQVaxU3C6KWzLux5wOacf1VGo
 NUsTRwc8veqUQrAzFTcAytNaH1F+vb6VIAPgUTgvOXrlcxCBmRDhqQ1byy24nFmKfaFT
 da5kwI7aXzgNugBgEBViOzWzJookc+1Nq+0qTjwpAUxocSyO8YXW2BMLRvdG7mBZS7mC
 Vaup74gCgbEKLcJMDs+Lo8Ni5aoV69QHApYRxnF/zJpmdQktutk/OHcGVf8g56uDF7tG
 i6/A==
X-Gm-Message-State: AOAM530iWJ4PvRFK40evze3ZsNBJdlK+BcbeZGsIf7Ar/bl2lT+8PzvG
 3b7v49bbJDhk8Ny+mM6pgZbnzbXqg0o=
X-Google-Smtp-Source: ABdhPJz7K2sn4O/88yaV122GJMihQ39VL0qbxsHYUBy+2XB+hcfq/s90uDVNIgFsxMF0NuDwPmYVYw==
X-Received: by 2002:a2e:b5d2:: with SMTP id g18mr19708991ljn.354.1637791599934; 
 Wed, 24 Nov 2021 14:06:39 -0800 (PST)
Received: from localhost.localdomain (94-29-48-99.dynamic.spd-mgts.ru.
 [94.29.48.99])
 by smtp.gmail.com with ESMTPSA id w17sm93266ljh.15.2021.11.24.14.06.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Nov 2021 14:06:39 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Agneli <poczt@protonmail.ch>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v1 11/20] ASoC: tegra20: spdif: Support system suspend
Date: Thu, 25 Nov 2021 01:00:48 +0300
Message-Id: <20211124220057.15763-12-digetx@gmail.com>
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

