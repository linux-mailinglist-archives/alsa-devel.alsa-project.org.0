Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C0A346859C
	for <lists+alsa-devel@lfdr.de>; Sat,  4 Dec 2021 15:39:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B1CE821F2;
	Sat,  4 Dec 2021 15:38:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B1CE821F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638628765;
	bh=tAN41LYEO4Im+uxTfYf9YsqL8/qCZeUu4zYtpncCODc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UJRFVRNWrD3wfFkqFFSl6+uSnHjbjxMslacjOz/igfcM1mLdQXYt6XqOhvNyVbrQK
	 VO7JcrQkdQE+wDMBi1DxUNPCVmillnyw11pD+OosImiRh6Ga6b3wBIiwfoWOkmBWm0
	 +ukfAmWa8CTHObolyj61oJ+rnTACWRUsGGoSQI7E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F827F804A9;
	Sat,  4 Dec 2021 15:37:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D9C24F804E1; Sat,  4 Dec 2021 15:37:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BB788F80134
 for <alsa-devel@alsa-project.org>; Sat,  4 Dec 2021 15:37:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB788F80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="MwnAiF1h"
Received: by mail-lj1-x22c.google.com with SMTP id e11so11854464ljo.13
 for <alsa-devel@alsa-project.org>; Sat, 04 Dec 2021 06:37:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wwvCc+bauYKKq4pTyZaKz2pCnGZty8ijk6MykhM6LJk=;
 b=MwnAiF1hA8qPui8uBQGdO1QBhwpf9UaaCTkNu4NfLgfurHRoHvhXVPPodgEa3+LnvN
 tx5Ifc0/OMgQPfebiwxigxcDyBqZPGROwr20EmKTJo0G4yYB9ZVYru0NFjdrX1GA++cv
 BpRq9aWv+4fr7g9ZaayBTiTTifjEnswsXS5iHz5wLj2oBmmz4I3p9UuaoYlbcKgD9NJD
 H6ZmEu0gL1cF0UfTPmLKrMmaVxQOde8W6OAoOnFoiZD4o31osb5XXEwJt1gu8ea+1mYy
 bPMVTHQycS8tCBNMKCcqTRAA3AtU09/2jMOTPdc/wQKDEh9d5RfanRRv5svEcYfx/CnC
 L3OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wwvCc+bauYKKq4pTyZaKz2pCnGZty8ijk6MykhM6LJk=;
 b=k2Jc4Yoi9QqcOjbdq5sSbzXHzkXT5a6rIBERVJdZdGbW534t+VwMJ1hGmWXQQRCoNm
 DoR4VDNhdDI+x8sg5MSjEJAv7ki/GdKpWrh5OQ4YBisrZeevFCY5P9OFipga2o1IeXpZ
 DR4xrcOD4GKy1TuJurEgcCdryVHzumkmvWdo5ZTjJyV6METme62jDRx5/LmmezQVDU6b
 WLR2GsdBAyxYOtNTXPQ1dg5FFNclsgHua08yPRoSavYy25PQvrAh71m+dgh1/F3szYL2
 OZ+O1/2SC7kd9SHqRJxPRFyonOhyxCeX/7zqtOGmelZiofBKrDh4oKKvmNUEPITH0pS3
 1pog==
X-Gm-Message-State: AOAM532Y+0x/pxcOPwyh5Nu7vQ8um5zoltyFA0BIDc9u9AHy4nkUILRP
 tH06R2hfuTh12Uh9VabcFMY=
X-Google-Smtp-Source: ABdhPJxugszshWasYaab4cAMvs2pl1LYI0Q/HrfsQBMp21wQUS0EVtgxwr/15TP8z7dXNiyzZ03jCg==
X-Received: by 2002:a2e:8997:: with SMTP id c23mr24092207lji.530.1638628655314; 
 Sat, 04 Dec 2021 06:37:35 -0800 (PST)
Received: from localhost.localdomain (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.gmail.com with ESMTPSA id g36sm782934lfv.16.2021.12.04.06.37.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Dec 2021 06:37:35 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Agneli <poczt@protonmail.ch>
Subject: [PATCH v4 05/22] ASoC: tegra20: spdif: Set FIFO trigger level
Date: Sat,  4 Dec 2021 17:37:08 +0300
Message-Id: <20211204143725.31646-6-digetx@gmail.com>
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

