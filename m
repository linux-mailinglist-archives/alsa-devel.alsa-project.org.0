Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B10A346682B
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Dec 2021 17:27:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3C6C7289B;
	Thu,  2 Dec 2021 17:26:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3C6C7289B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638462455;
	bh=tAN41LYEO4Im+uxTfYf9YsqL8/qCZeUu4zYtpncCODc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YXUQ2RFpV9DXqaqS2y0y2NIX9X9MULU7GfNaL+dk/84ts6iKZHW2QdT23BJGtxYXF
	 /cM1Zw4A2vmHumdvhBvQcTC/wjqXeoxvNwJ4vI39nb0ft7th1PeGZkA6M/mgCP2Boh
	 M+db/teSt6lHTkQdtD5M/ZNprnPz3i+obOFe9goc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0828FF804ED;
	Thu,  2 Dec 2021 17:25:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 53D95F80506; Thu,  2 Dec 2021 17:25:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C5037F8032D
 for <alsa-devel@alsa-project.org>; Thu,  2 Dec 2021 17:25:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5037F8032D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="oR1svtpF"
Received: by mail-lf1-x130.google.com with SMTP id t26so72771362lfk.9
 for <alsa-devel@alsa-project.org>; Thu, 02 Dec 2021 08:25:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wwvCc+bauYKKq4pTyZaKz2pCnGZty8ijk6MykhM6LJk=;
 b=oR1svtpFFFrX6rnK1/i6hTs3JfvrWzZLGz+BNZ7MGG1iAqeVqZHD5xG5kTrA3u/jSl
 s15Q6dojw39Auj8CN0XO2FI5wmxyYl3p3EKf7mDJAku4r7BNCwqds3yBkDHyAXaGCQxy
 GduQFHq10+2oaKKnx2+2SBJO+ke+fYSB+k1qu7/5ltFxZ0wOj5tcFqTA3sw13+Y24oeg
 94WOSY8quWXzpexYWKXqSJDuZA9AEGEtLlVtS0kFGLiDqnqWh5e497qz21iuFqaj8wAj
 hs+P2RIRIOA5/frljQdARGykDlBwPfTEnDuzJmYOkREs9EkQbmzzXMrUMLl1BArGClaz
 xh3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wwvCc+bauYKKq4pTyZaKz2pCnGZty8ijk6MykhM6LJk=;
 b=MiZ6d3/9X83of8OM59edstP+m2f8+OFJjVgMSVhxYNG82oyNmVGUCVeUEQhwfVKA5M
 G1rKV9L1hME5wDEHq51EsgPiOkMSCza65nXK9h7sXueSdSic8AuViPuEXwqJxomOJD/o
 rhrj1jNihWNTK5Uq55YxgVoy/Ba5ZGLmxtcLuCxQFvmCuq6lXEtEiWDj5h7rWNuceMH5
 W3+JtptGLO6Mwma0EPdylxYJyToLLu3KCiiA6GmnJXLc7YPeXT088x1bzYerd/rp8e91
 YnDpDgXRrfgZabBHVEPd1CAtYEIIiedxwEtKe/v1R7/ITac6DmT8kW7wcN+gyRtA8PNc
 EXAQ==
X-Gm-Message-State: AOAM530yIDpk5Rqlxbwu+HXobEd+SjxvafRJd996y4Eb3PEnOyp+QMbk
 F93dzHH6q9R60Q+UxowVLAA=
X-Google-Smtp-Source: ABdhPJzzfGS2ufUUhP2/9TRcFenSN5tQ2vXd3c+kggMycyFqzrFJs422Hi0yfHfkBSOhAXlwwSc3Kg==
X-Received: by 2002:a05:6512:40c:: with SMTP id
 u12mr12933189lfk.473.1638462320726; 
 Thu, 02 Dec 2021 08:25:20 -0800 (PST)
Received: from localhost.localdomain (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.gmail.com with ESMTPSA id d18sm36806lfl.30.2021.12.02.08.25.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Dec 2021 08:25:20 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Agneli <poczt@protonmail.ch>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v3 05/20] ASoC: tegra20: spdif: Set FIFO trigger level
Date: Thu,  2 Dec 2021 19:23:26 +0300
Message-Id: <20211202162341.1791-6-digetx@gmail.com>
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

