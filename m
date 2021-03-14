Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD8E33A5BD
	for <lists+alsa-devel@lfdr.de>; Sun, 14 Mar 2021 16:48:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A8A071768;
	Sun, 14 Mar 2021 16:47:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A8A071768
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615736926;
	bh=Gs2A0xvbc0is2i+qL5goMgUNCEHKAxmhf/EORe3JWok=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fqIvQIgmTB9CaRV8sOFTAr/RAPlGSTbcuR35WIQuMOE2+jH2AoaiS0ti5O17Ty50N
	 cnLHfFnh8Qg3CwNBZ4fD/LSRzv62+8CglZs8a+N1wrTf3VVkhd3AdaYdE2LXeSnBZ1
	 +aGHBTmYNmFJgxYzLtyG+/fXEa+NqzDL/C4sKYDA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DEDE4F804C1;
	Sun, 14 Mar 2021 16:45:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 095E3F804AE; Sun, 14 Mar 2021 16:45:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0FDF6F8025E
 for <alsa-devel@alsa-project.org>; Sun, 14 Mar 2021 16:45:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0FDF6F8025E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="neiMlt4a"
Received: by mail-wr1-x42d.google.com with SMTP id x16so4459440wrn.4
 for <alsa-devel@alsa-project.org>; Sun, 14 Mar 2021 08:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/RPbfN09KLR8+OBhXwBaCOg2Gccjzu39uZXtdRMFwFs=;
 b=neiMlt4aIX9NcGRwB/ENW/+akFv1X4d1TxYysbGr4NzZLk8oYx98BAFtcEYdaJCY9F
 sqRjDeHMpQGAHxLXOP7yc6UrkgZy4msdycmGA4XP0aPnNLgbd4FXRcJVEry6RXFuXaKk
 oAIPqJETL11VPZF2UBZ7cqcbr8dWbHrJb2kuXrD/ZKVYGI6FfsqP34B1X2ati2S3XLSr
 0Wtia/5TigctUVouMiPPNyLEPvX3pyJCYmcx256a/CpmNVWesjc3pxJJVDn1gDryaAPU
 TP9hH1wzCB0FD24SBIIyiJPCCN3SzmoiyTDLHF6ikb+9kzSGpD8CnUjI78v09z1TEK9v
 kzaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/RPbfN09KLR8+OBhXwBaCOg2Gccjzu39uZXtdRMFwFs=;
 b=FzmfJfWoLo9gzc9n3pWOmUQCxl0WjBl9qjStaslhH93zrDbgckIkR6HwwdWYBav85y
 AwYycpaBG+PIM+7ctjQLAJngW/7VoFvTCQZWkkkFntWGkIMEYIS2aF9+8O+OkCxjynyH
 6LKqdij6HTgo8VnZkpJ3Tss5RdA65KZhADov96/YwqUlKWiCZkaw7swZQWRgibE2YHe/
 5NtcZI97ftscYsyM3qM5BPwf1jxZK1XXUKqoM/dGu3lor6icRIeXtiHDpYWXWhFxnVA9
 t98naRQbbxByfvW6tUJluPC7AP67iCW1oTqCpDgdkXsHSkYL4Xqt9Ycd2CLnZkUkGAMP
 P4aQ==
X-Gm-Message-State: AOAM532pzF4iQpkZBrpQ5xtoquN6bt+mKn6YGx3VblNxR92TYRe0bAmy
 yqd48LmdnzXKhSJzu+XESW4=
X-Google-Smtp-Source: ABdhPJznbYoJP8rsmrWHGlDJ1JSSCuHBF0G1oJW1BSqcpXmNzWSGGJ5YBiDocMB3+D9Gtky4r6LvkQ==
X-Received: by 2002:a5d:698e:: with SMTP id g14mr23119177wru.127.1615736726655; 
 Sun, 14 Mar 2021 08:45:26 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru.
 [109.252.193.52])
 by smtp.gmail.com with ESMTPSA id f14sm9673507wmf.7.2021.03.14.08.45.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Mar 2021 08:45:26 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Fertser <fercerpav@gmail.com>
Subject: [PATCH v5 06/17] ASoC: tegra20: spdif: Correct driver removal order
Date: Sun, 14 Mar 2021 18:44:48 +0300
Message-Id: <20210314154459.15375-7-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210314154459.15375-1-digetx@gmail.com>
References: <20210314154459.15375-1-digetx@gmail.com>
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

Tegra20 SPDIF driver has a wrong driver removal order, which should be
opposite to the registration order, but it's not. In particular the
runtime PM is disabled in a wrong order. Fix the order.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 sound/soc/tegra/tegra20_spdif.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/tegra/tegra20_spdif.c b/sound/soc/tegra/tegra20_spdif.c
index 5839833e23a0..e48d332506a0 100644
--- a/sound/soc/tegra/tegra20_spdif.c
+++ b/sound/soc/tegra/tegra20_spdif.c
@@ -329,13 +329,13 @@ static int tegra20_spdif_platform_probe(struct platform_device *pdev)
 
 static int tegra20_spdif_platform_remove(struct platform_device *pdev)
 {
+	tegra_pcm_platform_unregister(&pdev->dev);
+	snd_soc_unregister_component(&pdev->dev);
+
 	pm_runtime_disable(&pdev->dev);
 	if (!pm_runtime_status_suspended(&pdev->dev))
 		tegra20_spdif_runtime_suspend(&pdev->dev);
 
-	tegra_pcm_platform_unregister(&pdev->dev);
-	snd_soc_unregister_component(&pdev->dev);
-
 	return 0;
 }
 
-- 
2.30.2

