Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C61247936B
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Dec 2021 19:01:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 954C72030;
	Fri, 17 Dec 2021 19:00:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 954C72030
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639764061;
	bh=TCdlS3i1JG0E4HVY892U2Nz4csN4u0Hso1LmaN+CGmE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iMbXVD3NUAt1vAwUiG4/b2frGsIaLOiPZyPT0kh4a5eB9sdLfw+yoNM9y+gXwT1sS
	 RCw3Lyg1BstiIqNkCdYc6IdlH6ni363TCihpv2upk3RpM8Tllbabisz5eZHy3u2XsY
	 KrNoahl+oXrBiz6ci6YHnsrdPeBwtLcKCTbXrCxU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 96778F8051A;
	Fri, 17 Dec 2021 18:58:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8BE63F8016D; Fri, 17 Dec 2021 18:58:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5BD7CF800B0
 for <alsa-devel@alsa-project.org>; Fri, 17 Dec 2021 18:58:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5BD7CF800B0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="gAf4vyWy"
Received: by mail-lf1-x12d.google.com with SMTP id d38so6371319lfv.0
 for <alsa-devel@alsa-project.org>; Fri, 17 Dec 2021 09:58:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aXAi7CWSEqrGpygWLYaMuBzle5xA6rjl70U8+IK/iig=;
 b=gAf4vyWyDfBTmYvS814WS61PNOSjB6i0X1eYRP0Rt8E5afKVZXPICIFg+8N4+3NFrW
 d32TxT8TIG0FrREeY+jkAPX85b9rF08H1rcxj/bxPs+y4J3hCWVrCT6Ph9+K9nft4UJ6
 YAwnamhOU5dP5HNR0K+ICe9oMHcRVrgHpCSQrPG7N4fUYV5jF8ZKreXCRExWKb67zs9p
 bl7v0Xlu6mSkaSDzl4TgqRQ9uZC4OP+XvfWq/GsQ9W5FU54DZbImeqcLUR3jEKKti1HH
 jQVpeEiNdK7x+lD+vR96JJZ0OekFRP2k0g33yiim+vq2ZMS1QVZ/EnXkMAOddv7NE9Xx
 k01g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aXAi7CWSEqrGpygWLYaMuBzle5xA6rjl70U8+IK/iig=;
 b=wbITlWX4oMih2WBkhUtz1Dpo0y4fb4gKc+UYpRzS/DbOij5CS+xL5ymCeNfnI6WGcF
 Zkom3uVBg7RMJ6/4KydIspMLogBYogiAZ2OXHusmnIEJyYOFNV3MB2Czo36LMLeyr3A7
 RvwiD6t4Pqv03XLGOSfFUDmemZ09z9d59+/ZnLOrDXtp7YdBVDSmi+Y4b7p+ViIpuxB8
 ZtFTivNIzK+HjP8F0SuOPGeiHE98URA/0N7ufMp37B0+RbpabfeE9CtAxbaK+Pyn4oJR
 KE00Bx8w2bVbVS+GhFs9v5d604GaWOsgfbR5nl1qGgJMoeZbfXVCq/wbb8rtXqua4m/k
 0sCQ==
X-Gm-Message-State: AOAM531O9tC5RYePHfoU37KmvTrF682zJ5rycgszDtufjdb/bYK/mZnx
 fJQ19n6ATT86l8rckC6uzx0=
X-Google-Smtp-Source: ABdhPJx35Ue2iDa1rMg6didg0FwagKJ9F9E5Stnc4n+YyJyNpV5/4ppZhzZlsSFN2XSSAWQK8ElASA==
X-Received: by 2002:a05:6512:31d:: with SMTP id
 t29mr3745033lfp.331.1639763886836; 
 Fri, 17 Dec 2021 09:58:06 -0800 (PST)
Received: from localhost.localdomain (94-29-63-156.dynamic.spd-mgts.ru.
 [94.29.63.156])
 by smtp.gmail.com with ESMTPSA id w23sm1479244lfa.191.2021.12.17.09.58.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Dec 2021 09:58:06 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Agneli <poczt@protonmail.ch>
Subject: [PATCH v5 04/11] ASoC: tegra20: spdif: Set FIFO trigger level
Date: Fri, 17 Dec 2021 20:55:59 +0300
Message-Id: <20211217175606.22645-5-digetx@gmail.com>
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

FIFO trigger level must be bigger than or equal to the size of DMA burst,
otherwise audio will be played x4 faster than it should be because part of
the DMA data will be dropped on FIFO input buffer overflow.

Acked-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 sound/soc/tegra/tegra20_spdif.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/tegra/tegra20_spdif.c b/sound/soc/tegra/tegra20_spdif.c
index 57a6c576b91f..e45e371edc42 100644
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

