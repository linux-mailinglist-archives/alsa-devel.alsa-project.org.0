Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D5352F2FB9
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Jan 2021 14:00:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9B73A170F;
	Tue, 12 Jan 2021 14:00:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9B73A170F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610456450;
	bh=57rCrQfpA1Cqv8Xoq6ZpY2NIiMoksCznTMPhCzvjs0E=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=BXQiDDiMKkpqd0vp+ElfGmLTwCUYZ3jzTODz9k+7DridOmqP54mnmvn49POGxM7xJ
	 g5y1qXacjhXphVpvJG0QzgM9xjVvyYQRk23cB67tqZMYvh43yhyePSUTBgNhkKIs6l
	 HS4IstpShD9UFF+7t/vsL2c+qE1myzl16EwqR6VM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EAB8FF804C1;
	Tue, 12 Jan 2021 13:59:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BB4ADF804C1; Tue, 12 Jan 2021 13:59:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_78,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2D012F80249
 for <alsa-devel@alsa-project.org>; Tue, 12 Jan 2021 13:59:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D012F80249
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="CB1EKgjf"
Received: by mail-lf1-x12f.google.com with SMTP id u25so3246224lfc.2
 for <alsa-devel@alsa-project.org>; Tue, 12 Jan 2021 04:59:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+afUEpDMhe7ussFXU5RD6s0njNqgxNofkXjI+x50JfQ=;
 b=CB1EKgjf1qF3agk6x30CIeWs/lLDeQNdu0wJHPZYpRxNBCzaCOkmT0z9yIbQyBRDS1
 l19AO/rlLhz7wC03CY7dHlR21LPEXpVXgAjg+TeH0YNBzVe83dzxq2lF0+9mV0btWDwm
 N/07BMILeNnxhEvSPkyqHR/BR8/cfp47ne2Bb9TryqYTqRq9GUFW7C0a0n3YKsy6SOuQ
 exc71/bIW8RBmp40Im5FwOoldSLjHIfpxA5wqUUZFTUAoCBPeT2QD6c5iHkfNrvInF+K
 J0nH+GcjA6GULo0DB79ua76cUiNOKXXkDJGG++co4SMOnQaTB8zg2RC5WL2JFKuC+k5c
 /C5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+afUEpDMhe7ussFXU5RD6s0njNqgxNofkXjI+x50JfQ=;
 b=OHCUItDKxPuD+gr7C9LlM+G7D1wGvNa1X0Hnv5/IhPOi5oNhCdhTOsSLy3p+11Chbw
 g1A9t4xEYU7KYjuMj4u26tzshk8NR4HUIkqaX+MypLccShJf1qbu95UioGj57pgLpiWk
 27iTGpUFNPrvQjmnPKpoYprDh872Oapw6hIHfFmvkOaNRch7yojqO9wKg0XPZr+LUhSS
 61TUeKwooKrHgYMpymEM7i8663V6AWUTJPRzWMu3oLGUiPrR3YTCtm4qODmXnGCJM5ib
 X3Z/2Tsp2dGQznzZottgSlJEwKozgroHCfY1McZ2fvZ2k/NcoOBKWcL7b+fRXakuySeZ
 Ydvw==
X-Gm-Message-State: AOAM530XNlErcqvdfF59HYsac22dCOs4I05yrXk0sPIWuZTn1H+hYfMj
 X9Y7KOLRSb5ljiIidl3pWy8=
X-Google-Smtp-Source: ABdhPJzyd4WGQhqZtI/2sAskfJU7FySL7B5s58e20JMeJDqE+uoQ85q3s1u+Rwe9SUe5ZI3etDplrA==
X-Received: by 2002:a19:cb05:: with SMTP id b5mr2049857lfg.61.1610456361579;
 Tue, 12 Jan 2021 04:59:21 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru.
 [109.252.192.57])
 by smtp.gmail.com with ESMTPSA id 192sm384211lfa.219.2021.01.12.04.59.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 04:59:21 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Sameer Pujar <spujar@nvidia.com>,
 Peter Geis <pgwipeout@gmail.com>, Nicolas Chauvet <kwizart@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH v1 0/5] Clock and reset improvements for Tegra ALSA drivers
Date: Tue, 12 Jan 2021 15:58:29 +0300
Message-Id: <20210112125834.21545-1-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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

This series improves the handling of clock and reset controls of
NVIDA Tegra ALSA drivers. Tegra HDA and AHUB drivers aren't handling
resets properly, which needs to be fixed in order to unblock other patches
related to fixes on the reset controller driver since HDA/AHUB are bound
to fail once reset controller driver will be corrected. In particular ALSA
drivers are relying on implicit de-assertion of resets which is done by the
tegra-clk driver. It's not the business of the clk driver to touch resets
and we need to fix this because it breaks reset/clk programming sequences
of other Tegra drivers.

Dmitry Osipenko (5):
  ALSA: hda/tegra: Use clk_bulk helpers
  ALSA: hda/tegra: Reset hardware
  ASoC: tegra: ahub: Use of_reset_control_array_get_exclusive()
  ASoC: tegra: ahub: Use clk_bulk helpers
  ASoC: tegra: ahub: Reset hardware properly

 sound/pci/hda/hda_tegra.c      |  86 +++++++++------------------
 sound/soc/tegra/tegra30_ahub.c | 103 ++++++---------------------------
 sound/soc/tegra/tegra30_ahub.h |   6 +-
 3 files changed, 49 insertions(+), 146 deletions(-)

-- 
2.29.2

