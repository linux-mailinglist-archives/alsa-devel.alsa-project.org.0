Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 020FF33A5C9
	for <lists+alsa-devel@lfdr.de>; Sun, 14 Mar 2021 16:51:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9608917E7;
	Sun, 14 Mar 2021 16:51:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9608917E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615737118;
	bh=3exbRPU3vyjZG4OS8bm2QBQ39WjIaqaRHR7hZY11sI4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nhe2broiBQPAYz6askfILFqi9jymr64yyv6OuhHSgDjwwDRxKjg1HNFnwuamofJxE
	 nCBkaKYDvd1QmxRu1yewHPEaJUSlVARGvPvUj5Q6WnQEXzCasXs0oXYH8SmfAuSc7J
	 hnXhbRX7kRdl84LaEbce5rILWpX2ohLIneEXyANk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 52A8AF8051B;
	Sun, 14 Mar 2021 16:46:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 71A23F804E4; Sun, 14 Mar 2021 16:45:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6F76AF8042F
 for <alsa-devel@alsa-project.org>; Sun, 14 Mar 2021 16:45:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F76AF8042F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="KKfe44JV"
Received: by mail-wr1-x432.google.com with SMTP id b9so4456937wrt.8
 for <alsa-devel@alsa-project.org>; Sun, 14 Mar 2021 08:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oD3FaI4IefheXyOruQTSZ8GPhKjZkAiPZDDxvon3Qf0=;
 b=KKfe44JVwuQ/IBwSvIg3rcroBJOZn6rWeUXbyoRs8WuIzwBr2SVINJDN4xhqpXSpQC
 6rUZdgP/vS9Ok7xTyvcLS2Z6WjYgYF7lpIUa6URhis1da+S6ZVBRR8U0EHMyVZZ3YCx1
 47PVHWWsiJZdFIkfqk48U+oVdRaafucgvDrdM0OtvuciQlPfuMI1+QcGF5RA02uJ2TAC
 lD2mjwiCeVk8WBmriPbIuSph0iDaYZMVl78ua5zuqENTJXFrEz6+FIcGVsYae+s31CuC
 +YNaXKPLeUY5Z55WMGTRfXMaMXKKdaTMS0Ja62pj0fFzj3mn3li2zc15e+N7z5j7I88g
 q6mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oD3FaI4IefheXyOruQTSZ8GPhKjZkAiPZDDxvon3Qf0=;
 b=Grng8I5nIjAr2Jt+D47nY+cvJ4tuP4tua8sh6EMl799GtNrsAPtgkl091/loFaLtTS
 hstT2WHq6FABOoUgoIipSJkIqEV2c2Ya7IZudXXnv770ugrtTc8pAhH1P1COKKyrAPLE
 nVTlRvMg0REtIim+FdccNrPjFyuPirglaBJ6RAMLhQX9f34iybQKzcpReMDmKHY0Gq9X
 xvlvZlaYCNhlgv8Lvoz0c6Wq8IUK8eNzs8VONM7ogGBDyXUjNvWQ3vc246aFHIuNdkiG
 Codq08egZM+Ir2vgU9KSGv42VL8u4BDuCq9rQfUdxmtN/YbSTaNPo9r0TdjD9DlYjsje
 wGZg==
X-Gm-Message-State: AOAM530egOA23s20lUV9513UuWZSsCQfybdEPZOvSQ0kkKThK498BzfX
 RzXTit2FJMeU1ul10p5uABM=
X-Google-Smtp-Source: ABdhPJzDp5zth7DowoByIIzbNFBq6dWh7HlXTtOifkclsw34ZZSdE40cm2y12jMfgTOfLaOfYumI7A==
X-Received: by 2002:a5d:4203:: with SMTP id n3mr23094069wrq.116.1615736728700; 
 Sun, 14 Mar 2021 08:45:28 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru.
 [109.252.193.52])
 by smtp.gmail.com with ESMTPSA id f14sm9673507wmf.7.2021.03.14.08.45.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Mar 2021 08:45:28 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Fertser <fercerpav@gmail.com>
Subject: [PATCH v5 08/17] ASoC: tegra20: i2s: Add system level suspend-resume
 callbacks
Date: Sun, 14 Mar 2021 18:44:50 +0300
Message-Id: <20210314154459.15375-9-digetx@gmail.com>
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

Add system level suspend-resume callbacks in order to ensure that I2S
is gated before system is suspended. This puts Tegra20 I2S driver on
par with the Tegra30 I2S driver.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 sound/soc/tegra/tegra20_i2s.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/tegra/tegra20_i2s.c b/sound/soc/tegra/tegra20_i2s.c
index c0af5352b483..267517446d27 100644
--- a/sound/soc/tegra/tegra20_i2s.c
+++ b/sound/soc/tegra/tegra20_i2s.c
@@ -460,6 +460,8 @@ static const struct of_device_id tegra20_i2s_of_match[] = {
 static const struct dev_pm_ops tegra20_i2s_pm_ops = {
 	SET_RUNTIME_PM_OPS(tegra20_i2s_runtime_suspend,
 			   tegra20_i2s_runtime_resume, NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				pm_runtime_force_resume)
 };
 
 static struct platform_driver tegra20_i2s_driver = {
-- 
2.30.2

