Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E801345F1C6
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Nov 2021 17:24:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 761C716A1;
	Fri, 26 Nov 2021 17:23:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 761C716A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637943841;
	bh=tAN41LYEO4Im+uxTfYf9YsqL8/qCZeUu4zYtpncCODc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ayNiGMBh8gxdRV4PJ5kJbOiBXGRUMGwAj/EloK+/udwz0M8OKOXqay9jTWxsUpDNa
	 nEvWzjxR3MgfaUtSc/XrbkAQ4ZFi+EPzfWhXY/GKbfU9YSRSyE1e2NwSaEPHoSyNHw
	 2RF8i77/7zH/OyMhUhvTZO4N0oQV7DFY3xXABRSA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ABCA6F80525;
	Fri, 26 Nov 2021 17:20:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D9D6FF80508; Fri, 26 Nov 2021 17:19:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8797AF804EC
 for <alsa-devel@alsa-project.org>; Fri, 26 Nov 2021 17:19:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8797AF804EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="BvKSZeYo"
Received: by mail-lf1-x129.google.com with SMTP id l22so25476929lfg.7
 for <alsa-devel@alsa-project.org>; Fri, 26 Nov 2021 08:19:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wwvCc+bauYKKq4pTyZaKz2pCnGZty8ijk6MykhM6LJk=;
 b=BvKSZeYoEu1pJJt+n6o+vj50x1ldkP551fdVZxAJJQLdVUFGwPBzAIrF5H+7esXwHx
 n8own3qM05XoxI0sjPD064mGbDJYgQsXfUbZ5MIO05z8iIYjmtRdkKT5j0qD5Z2az0Jk
 UgsVHrgG2+MvETMaNKhRvVnkXunohyLJVeytrxOcNVoFj9pd8wQ3SQv8v/ibUtmgacPy
 ks0GJc1FIuDh3ZKQoL4cs4vQxpaDcGcq87T6G6fqBvQzUszhXwvpYZXNRvM4dS7oRSp1
 a4rK+JOdqWuQE1Dhk/XVLpE7/zREWJ2zqRHV9yeoavSk6IclxwhKhMj46sTIj3eb5Cbc
 PU/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wwvCc+bauYKKq4pTyZaKz2pCnGZty8ijk6MykhM6LJk=;
 b=pfiZ32TcrTUiN2BzRDu3ZpFxd/Gx1UrVliLso/+LzwNGGSiDKsET9CWRNTaPdIac3C
 IP/SBcPge/zHjcTop5RpvAdSaXgP+q9C2m9rpgjGB7l3Oljftx66PUpXWkPFuTBWUHD6
 aVD5NucMgkHkwxftxo4bxVaj/8ECp9hMUcG78UUmi2WywOQQSPtYIoVlQFQKD5sLAX2p
 Lpe1tSopZZCoSinTRq0YSKTl2MmPQeclKW46c4Jqmcn3cfCXJK3C0A9E6wLk4HgZ/QUK
 xOU4jeuLeLM0vaNFyW2dgySEkptwqfYjo306csjxCoU6qUH2q+kIJjJsk1gRNcN2Mah8
 pzUg==
X-Gm-Message-State: AOAM533ezbTkt5oWDvE5AZH3gMFs4Yhqspiw9FFaJol6rOGTO7yqlk9+
 cenBFINH+p0TkQ3MrYpua+E=
X-Google-Smtp-Source: ABdhPJw+O1sqA1AEApn4w0e8LsIJFSmfr+1YbfviViPwQQyCT2nco+0hcMYFnmfPveS50cbky2WMkg==
X-Received: by 2002:a19:4312:: with SMTP id q18mr30933828lfa.299.1637943583577; 
 Fri, 26 Nov 2021 08:19:43 -0800 (PST)
Received: from localhost.localdomain (94-29-48-99.dynamic.spd-mgts.ru.
 [94.29.48.99])
 by smtp.gmail.com with ESMTPSA id t7sm613381lfl.260.2021.11.26.08.19.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Nov 2021 08:19:43 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Agneli <poczt@protonmail.ch>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 05/20] ASoC: tegra20: spdif: Set FIFO trigger level
Date: Fri, 26 Nov 2021 19:17:52 +0300
Message-Id: <20211126161807.15776-6-digetx@gmail.com>
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

FIFO trigger level must be not less than the size of DMA burst, otherwise
audio will be played x4 faster that it should be because part of the DMA
data will be dropped on FIFO input buffer overflow.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 sound/soc/tegra/tegra20_spdif.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/tegra/tegra20_spdif.c b/sound/soc/tegra/tegra20_spdif.c
index 7751575cd6d6..6f0570cde964 100644
--- a/sound/soc/tegra/tegra20_spdif.c
+++ b/sound/soc/tegra/tegra20_spdif.c
@@ -69,6 +69,14 @@ static int tegra20_spdif_hw_params(struct snd_pcm_substream *substream,
 
 	regmap_update_bits(spdif->regmap, TEGRA20_SPDIF_CTRL, mask, val);
 
+	/*
+	 * FIFO trigger level must be bigger than DMA burst or equal to it,
+	 * otherwise data is discarded on overflow.
+	 */
+	regmap_update_bits(spdif->regmap, TEGRA20_SPDIF_DATA_FIFO_CSR,
+			   TEGRA20_SPDIF_DATA_FIFO_CSR_TX_ATN_LVL_MASK,
+			   TEGRA20_SPDIF_DATA_FIFO_CSR_TX_ATN_LVL_TU4_WORD_FULL);
+
 	switch (params_rate(params)) {
 	case 32000:
 		spdifclock = 4096000;
-- 
2.33.1

