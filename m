Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 38B9C4B5CDC
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Feb 2022 22:33:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD4AD18A4;
	Mon, 14 Feb 2022 22:32:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD4AD18A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644874418;
	bh=PPxPWLwZpiDvWU91XKoVw5PCQIzcJ2Kfd/7aluzAEpY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=JVmnYel0+g3zlpqGXobg2my/IRVFYJZSiSDOpBPzUOTh5X4NsWeStUCrtwP6LPjEu
	 cclRj5a99yviHwPzLMcrjYT8EL1h4F5VWEvmIe7PKGaFbMJJa1kEZKrCzh/XTyHJk7
	 oMeJg1IIHvEmXhkdZTELXXZJdUw+x+xXfi7l1f5o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3345EF80169;
	Mon, 14 Feb 2022 22:32:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CC93BF80310; Mon, 14 Feb 2022 22:32:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E741CF8012F
 for <alsa-devel@alsa-project.org>; Mon, 14 Feb 2022 22:32:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E741CF8012F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="lEibEIIH"
Received: by mail-wm1-x32d.google.com with SMTP id
 az26-20020a05600c601a00b0037c078db59cso244913wmb.4
 for <alsa-devel@alsa-project.org>; Mon, 14 Feb 2022 13:32:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AYGIU0lBgl4d0sNWP4gNGrwgFdAF2VqmrC+fnt5WHX8=;
 b=lEibEIIHHaNkCIBCOonaCkB5WT0qXvdINVme8DbMAQ4gXD8Y8gZ7MmRFtd+jeI340G
 P3yf2zfHNl4eNYBwgYS2eODg+RA4I5mMh1mCS+Lsd+UlvDz55haq+BGGz2DX4ZB3rtAo
 B7HUaJ0ax5xaUp++lwEdMWrz65Ju6n935WWXFf38LS6uYUOqNAD5fRcTd3xzF2R3J3CZ
 L5pZq0TOkqyPaqpej5PXp/t89XLsmWFHUYxavOGXBPiE0pNqlCvoX0ifpawuBMaanR7a
 hAU0T9yUZknzlJnd9XDhiGBMjpXYDKAzF+6oK2uqe197+OOhOiRiJba/J48mBYHoIjwn
 XcVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AYGIU0lBgl4d0sNWP4gNGrwgFdAF2VqmrC+fnt5WHX8=;
 b=bqr3BgJXVQCezwnx7zmwYNiQDpVGsvomywx8XSVYJ2rQJLGOLaRwaZYUWd0w+QnlpX
 WxedAEEM/u2B4cclzvkccG9JI6MJco5wadCmFKPENKaeDpm9cvexQTvGEYzNNWrAAEbx
 NLrpBsQx6DT5bxLTK4gtWL2vwjjBXnsN9LlwYsAa76OkQlfBdKcLdKs+t6+2dLcXi3rC
 bj3yweeAxRWv5k2GMlXjGjVJIjOLvpS0cqhANBxnDE9xCazZmAzSCi1ozWk3j2gO4q9x
 Z/QVrfrr4m2c19ZyWpOeihCjRJzkpuhYhWmXinP/P0gOh3NxlHQqGKV3Cbn52WRLHHdr
 TNVQ==
X-Gm-Message-State: AOAM531LC3ToIzldsZ16OESS/Q11C23GWt/Qf9Yig584/mgVIMDzXinI
 +gHeEqRQvdIeeYv1VfZQp5s=
X-Google-Smtp-Source: ABdhPJzA+5buwGThU/StogQFez2aB+m4K2P39OqNL7jF9GJPAEIJXA4IsgbPmSGM6C562aVhBfktGg==
X-Received: by 2002:a1c:7318:0:b0:37b:fa1b:1472 with SMTP id
 d24-20020a1c7318000000b0037bfa1b1472mr496215wmb.57.1644874345208; 
 Mon, 14 Feb 2022 13:32:25 -0800 (PST)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194])
 by smtp.gmail.com with ESMTPSA id 3sm26537410wrz.86.2022.02.14.13.32.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 13:32:24 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>,
 alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org
Subject: [PATCH] ASoC: tegra20: spdif: make const array rates static
Date: Mon, 14 Feb 2022 21:32:23 +0000
Message-Id: <20220214213223.65780-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
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

Don't populate the read-only const array rates on the stack but
instead it static. Also makes the object code a little smaller.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 sound/soc/tegra/tegra20_spdif.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/tegra/tegra20_spdif.c b/sound/soc/tegra/tegra20_spdif.c
index d09cd7ee6879..64c2f304f254 100644
--- a/sound/soc/tegra/tegra20_spdif.c
+++ b/sound/soc/tegra/tegra20_spdif.c
@@ -186,7 +186,7 @@ static int tegra20_spdif_filter_rates(struct snd_pcm_hw_params *params,
 	struct snd_soc_dai *dai = rule->private;
 	struct tegra20_spdif *spdif = dev_get_drvdata(dai->dev);
 	struct clk *parent = clk_get_parent(spdif->clk_spdif_out);
-	const unsigned int rates[] = { 32000, 44100, 48000 };
+	static const unsigned int rates[] = { 32000, 44100, 48000 };
 	long i, parent_rate, valid_rates = 0;
 
 	parent_rate = clk_get_rate(parent);
-- 
2.34.1

