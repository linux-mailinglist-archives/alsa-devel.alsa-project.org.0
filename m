Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD30845CFE8
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Nov 2021 23:14:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7FBAB17E4;
	Wed, 24 Nov 2021 23:13:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7FBAB17E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637792078;
	bh=z9uhrtoxOlBMx2zkXRL55J5C7qwhtRXL2We9PM4uCGI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EWSIEVYkj1zUZWdMAPC1GufKNmXdfgYxcIo9GqYP3GVTDztI3wifAF20Zh3lqmYZZ
	 osPkElwRHr+RrWyDGwQXB/XprJRBX0MCXxG4QxiTs9AYqTYA/ba+HAGevIxnxV6cut
	 VKIaiPNMtoZw3cMnMJfRI9APgAVmvQF6ICaS9ND0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 80FF3F8058C;
	Wed, 24 Nov 2021 23:07:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 490A8F8014D; Wed, 24 Nov 2021 23:07:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AAD79F80212
 for <alsa-devel@alsa-project.org>; Wed, 24 Nov 2021 23:06:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AAD79F80212
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="J+ph0bGf"
Received: by mail-lf1-x12b.google.com with SMTP id k37so10993994lfv.3
 for <alsa-devel@alsa-project.org>; Wed, 24 Nov 2021 14:06:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=c5Fktc8z3pKDnGBiR9xJxzlv3HvufbR7qsaFtUM4qP0=;
 b=J+ph0bGfDz+0f3SGqVBhKJcKJtE145w0Qd6X3dDnesGFzTRO3D1oKZZSXP/i31IGrL
 p1luco5cjM6V7Cg8Ikv1d/qcpY5z9yIUKJG+CTO0D7xvFfh5tPLkhUIV92H0l1HkZ7pB
 vEZkYlEuWq5wqgJtgjc4Sfx61LwcS3Yf0NrKKwdJicwDHo0atAO2jNPn1mctE6+eQID5
 38nBlkG/XgtkZR+0ETbCCuqvYOykfTMwvVp8lRlO5cjYyCElqzRbF0YQUHnhAIgdM8lo
 qzgD5yJd/FI6D/F7JpmnzqTjwHkYOgiZamAhCDdQz+r20/xvJwhCv96wID4QmvMihIKs
 FD6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=c5Fktc8z3pKDnGBiR9xJxzlv3HvufbR7qsaFtUM4qP0=;
 b=GF8IJA4qvuAkYbcwKCcz1O/SxSb+/XPo0hlO/ACG9zCkJ7HLPmdCcGT8/q9clqIIpF
 6DQiv6sGSXihdDDmAFcvZ5NL7THLukfrQAzT2HIUNuUmhq6invCdHD14HrNbCmVcqWz0
 XgqhFi/8GoJWYxIDggL6GYHtv8kkU4IV8IaLVY8w/oLYjVhCd3B4lfX2bdQmV4JjYHJA
 kGZWHsVh0xzgk+Hf2usIsgSS3wbeqYczrlD4wWQAF0XZn3rfUbHTsXZgP7rD9ex5DAvE
 dRvu1JwqQ57rAYgJbeuoI1AAQaNB951Te19F0iMcnwXGE/wup5SP16NQpAWZ0G/QQNQR
 7EbQ==
X-Gm-Message-State: AOAM531FSp4w+lTBNUnvvZmjET9ofjFoGivti9dvzG9KHdQkp9rVnEKC
 9BoeZVutHslDYoz8XXrnu+I=
X-Google-Smtp-Source: ABdhPJwux3qwntifRbiT4YwO9EgIoEEHEAiuyxDM9ZVeZbtEWZwxZ2RjX4+Z+AMZAYBRz8ID00EvdQ==
X-Received: by 2002:a05:6512:3ba6:: with SMTP id
 g38mr18521398lfv.330.1637791596481; 
 Wed, 24 Nov 2021 14:06:36 -0800 (PST)
Received: from localhost.localdomain (94-29-48-99.dynamic.spd-mgts.ru.
 [94.29.48.99])
 by smtp.gmail.com with ESMTPSA id w17sm93266ljh.15.2021.11.24.14.06.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Nov 2021 14:06:36 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Agneli <poczt@protonmail.ch>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v1 07/20] ASoC: tegra20: spdif: Set FIFO trigger level
Date: Thu, 25 Nov 2021 01:00:44 +0300
Message-Id: <20211124220057.15763-8-digetx@gmail.com>
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

Program FIFO trigger level properly to fix x4 accelerated playback.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 sound/soc/tegra/tegra20_spdif.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/tegra/tegra20_spdif.c b/sound/soc/tegra/tegra20_spdif.c
index bd81df5378d1..6650875d2555 100644
--- a/sound/soc/tegra/tegra20_spdif.c
+++ b/sound/soc/tegra/tegra20_spdif.c
@@ -70,6 +70,14 @@ static int tegra20_spdif_hw_params(struct snd_pcm_substream *substream,
 
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

