Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E1F3EDF2C
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Aug 2021 23:17:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 97A3F84A;
	Mon, 16 Aug 2021 23:16:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 97A3F84A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629148624;
	bh=X1BebAnYNtMo+lpePI0WXBvxJbfX/GBN9XFRYZR6Ie8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=D7pEIFOsRggtV/n+pPBW+ahH+JBiz/ac6fkmyawglbcHgdRezyfiUSW5AniS/Cq4X
	 xgSjftl2q4TjFAh34mB0KOUnoAiMxFPgd85zFQthm8yG4afdTdO9pvZpnTbOWP4iVR
	 17wOOUextJAiRZ9FVdGrTW+UawikNMod8gB77joI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7DF2AF804E4;
	Mon, 16 Aug 2021 23:15:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D936EF80249; Mon, 16 Aug 2021 23:15:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A11EEF80154
 for <alsa-devel@alsa-project.org>; Mon, 16 Aug 2021 23:15:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A11EEF80154
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="SXugE0cX"
Received: by mail-pl1-x633.google.com with SMTP id q2so22100812plr.11
 for <alsa-devel@alsa-project.org>; Mon, 16 Aug 2021 14:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kTIbeouKJPHdAuznrwq0D4i093w3WXn0nhVYGisrNLM=;
 b=SXugE0cX6LQ2/w8x+cnMmQnCLRTZsKsqsydVR6i6J5pyFaG4u+ne6litBLPEqgjZZ9
 iQ3sGMWPAy8SJApSFdzxLiXGaU4LpmRkIrUlTU7RWGdD01d2TTevS9OIfefGoVgewALS
 4O/TrCM/BX8cXW5dJjB7yVWtZ1BUeggPK5R6dUcWTS8LkZfW1VUy4VrQp+W/UMleOmr1
 H/q+2a9av2u0qWtc33F5e8pLNsKW0UucGWuNr/z4SBOp5/HICi+DJxGMaLJJi6J0rL0/
 2aFwPenfPYYGCdy9ghNI80meLa60jIxfnUf0jh6GjfvYs/+zVJUjNw6xrwSWxAgTkq9P
 pdDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kTIbeouKJPHdAuznrwq0D4i093w3WXn0nhVYGisrNLM=;
 b=eRHUIajWx06TeE34hrotRVxt0H1byDg5LrI/4+gCnfPrLpv4pRVNKH0vs1AqezCtao
 eRxxnLPaHMJSPfqSzm3jCmApO99jF4z1XJWjvLt0P8y18MT8O19TLoQ/gp1hqMSwWa5o
 /bMELI59P8nK6lcpJlcaS3Fqph7CA28/9fohQbeQhfy3GYsBO1RLjsfWxkAgqxfgHW7e
 nU7+G0h8TfgQyyAZn5FZneyBUO4lHISWc6vLQ0v5PtYJv+ZrbGIfA4LcoGZVP/pY/bC4
 ZrFNppssQhchOg3v//c5Kk/75goQlx2jlblRF5UwiXLd7rF5d7/vOjeJ6Z68vmBws3q6
 bE8g==
X-Gm-Message-State: AOAM5304X/70sWX8hAh0UuNt92K/2uTPmjBE5jP+qyY9WB9Wk4UX+b6j
 1d6f6FDybbSKAIqVgHbmXMk=
X-Google-Smtp-Source: ABdhPJwpdHWa60/DF1dYUxouwyIYCy6OM024ogmA763ik20oAiLDxJ1zWG72rU85swQyEzlq9WxbEA==
X-Received: by 2002:a65:6883:: with SMTP id e3mr76637pgt.90.1629148501070;
 Mon, 16 Aug 2021 14:15:01 -0700 (PDT)
Received: from xps.yggdrasil ([49.207.137.16])
 by smtp.gmail.com with ESMTPSA id b12sm103154pff.63.2021.08.16.14.14.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 14:15:00 -0700 (PDT)
From: Aakash Hemadri <aakashhemadri123@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 0/2] ASoC: tegra30: Fix use of of_device_get_match_data
Date: Tue, 17 Aug 2021 02:44:50 +0530
Message-Id: <cover.1629148177.git.aakashhemadri123@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Bjorn Helgaas <bjorn@helgaas.com>, Thierry Reding <thierry.reding@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Shuah Khan <skhan@linuxfoundation.org>,
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

Hi,
This patchset fixes my previous incorrect patches.

356b94a32a75 ("ASoC: tegra30: i2s: Use of_device_get_match_data")
80165bb80433 ("ASoC: tegra30: ahub: Use of_device_get_match_data")

Aakash Hemadri (2):
  ASoC: tegra30: ahub: Fix incorrect usage of of_device_get_match_data
  ASoC: tegra30: i2s: Fix incorrect usage of of_device_get_match_data

 sound/soc/tegra/tegra30_ahub.c | 6 ++----
 sound/soc/tegra/tegra30_i2s.c  | 8 ++++----
 2 files changed, 6 insertions(+), 8 deletions(-)

-- 
2.32.0

