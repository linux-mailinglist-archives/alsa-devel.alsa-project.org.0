Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A78D329C3B
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Mar 2021 12:23:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A30B8170D;
	Tue,  2 Mar 2021 12:22:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A30B8170D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614684220;
	bh=nyblzrf3BU3WVnm2sGiXVm8NmbNlNmK8Fy7FRu1YCoI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fT6W2eGeerepZLDPHzcIrh6ft+2F3AIuEMBrmnkdEAJEUJYuqrmvoyzPslAiDJOq7
	 Tww9/5I2eT39Mx7pwjNdAds6ugavuP3u/FeqNZ4SjrIz22u/LtD3BOjd5tVCwf1T5k
	 uSci3G8aipPh2tEbbfwU4rwlR2F6a637G6R4EqiQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 201D8F80277;
	Tue,  2 Mar 2021 12:22:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B6F4FF80269; Tue,  2 Mar 2021 12:22:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 723BEF80227
 for <alsa-devel@alsa-project.org>; Tue,  2 Mar 2021 12:22:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 723BEF80227
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="MZO0fEml"
Received: by mail-lf1-x132.google.com with SMTP id p21so30657406lfu.11
 for <alsa-devel@alsa-project.org>; Tue, 02 Mar 2021 03:22:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UXsyTscw9zuLBva4U3+AGU7LQRHCPXqRCSzHFPwdbsg=;
 b=MZO0fEml85aBPb+L0zZijvlr73xZelJgEhc1czmKIkPN1WA/Ao2bmG2eEpQn9/5Cnv
 5gmNhukOhWRqrabru5ZLRuQIe19Ppw7xvec8e8WVtDNcFX2YXjsaC2KTFuDBS9V1HR8A
 q2i1pBwu3M4Yx/RPucxQRLZb8JTWF/n+Sj3BAiypZKcIHbe/VxT6ElkveIjI5YIc+/Sq
 95ldH1eekOw0jmoqo6CncpYd7lOJmwl+A2aFdkIzc4avBbz6tjukMFbxvrmgqU6g6YQp
 p+7yRGMFPKujcTuilLJVt6o0YRGvr4xgMdYCwR/jU1wQP+aK3vfpkWUCxmjOo2tTyiVN
 SMNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UXsyTscw9zuLBva4U3+AGU7LQRHCPXqRCSzHFPwdbsg=;
 b=AVMnuKcUpYEP+/IOICwMq8+39pkoxQJb75Iytpb4b4YD1IlDtbfrfL/AGFuQHnwZyf
 0YLFOaCmv9dxImEGUPvRDx/fydpzZqZDEO0yCb8cie3QGTpqwHVSV0jT9N3cAFyUKhcd
 WL8HQeor2T3BPssA+t9ekpAEXK1IPh+K8M0cb3VrgUsDZIxewYaCxjdBfB6yhuaCGJLp
 iBopjMFpdKqbIZmEl7SFxvmiaYvCLCx22ibyzzkgHmSzocGsdaLCdXrSVBU2XLYAgK25
 e/hlo8/K+646QaE9lTgHCjdUSxEU/CdDwGkFuprajC4lGN4G1kciujRqIJFTUDs38Buw
 zulw==
X-Gm-Message-State: AOAM530k0y9varnHk3QmDqklDZrNRRI6NUcT503Xqa4ifV3HgXR9TLnM
 4TNCSdRWUTJO787wRvLRfKA=
X-Google-Smtp-Source: ABdhPJxRymJixfSpthjYFtxI7AlxBgvrcbqGsXaXA/6qsfInz7jYNSYRX1M8a7spc/pgycwZXoi9BQ==
X-Received: by 2002:a05:6512:2356:: with SMTP id
 p22mr11522329lfu.3.1614684124467; 
 Tue, 02 Mar 2021 03:22:04 -0800 (PST)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru.
 [109.252.193.52])
 by smtp.gmail.com with ESMTPSA id w7sm2691078lft.0.2021.03.02.03.22.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Mar 2021 03:22:03 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Fertser <fercerpav@gmail.com>
Subject: [PATCH v1 0/5] Add missing reset controls to NVIDIA Tegra ASoC drivers
Date: Tue,  2 Mar 2021 14:21:18 +0300
Message-Id: <20210302112123.24161-1-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
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

Hi,

This series adds missing hardware reset controls to I2S and AC97 drivers.
Currently drivers happen to work properly because reset is implicitly
deasserted by tegra-clk driver, but clk driver shouldn't touch the resets
and we need to fix it because this breaks other Tegra drivers. Previously
we fixed the resets of the AHUB and HDMI codec drivers, but turned out
that we missed the I2C and AC97 drivers.

Thanks to Paul Fertser for testing the pending clk patches and finding
that audio got broken on Tegra20 AC100 netbook because of the missing I2S
reset.

Dmitry Osipenko (5):
  reset: Allow devm_reset_control_array_get() to get resets in a
    released state
  reset: Add devm_reset_control_array_get_exclusive_released()
  ASoC: tegra20: ac97: Add reset control
  ASoC: tegra20: i2s: Add reset control
  ASoC: tegra30: i2s: Add reset control

 drivers/reset/core.c           |  8 ++++++--
 include/linux/reset.h          | 20 +++++++++++++------
 sound/soc/tegra/tegra20_ac97.c | 21 ++++++++++++++++++++
 sound/soc/tegra/tegra20_ac97.h |  1 +
 sound/soc/tegra/tegra20_i2s.c  | 31 +++++++++++++++++++++++++++++
 sound/soc/tegra/tegra20_i2s.h  |  1 +
 sound/soc/tegra/tegra30_ahub.c | 14 ++++++++++---
 sound/soc/tegra/tegra30_i2s.c  | 36 +++++++++++++++++++++++++++++++++-
 sound/soc/tegra/tegra30_i2s.h  |  1 +
 9 files changed, 121 insertions(+), 12 deletions(-)

-- 
2.29.2

