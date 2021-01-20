Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC532FC5DE
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Jan 2021 01:33:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A17DC1899;
	Wed, 20 Jan 2021 01:32:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A17DC1899
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611102824;
	bh=JrwSN5TkcJuuI8GBfR/4XsWZb5ZNnaZLgJil4ZpjgE0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KUQLldJjsk3z/M/uvPaZlYnAkeQtN6DtbETPi4q2bnqooA4Mc11Wkh5CaImzpqKYk
	 Q3hvOtgrygSgSnR4anuupmxXIRq233pj73dfQc6GLaEJHKqg69qTkNauL7iLuvxDF6
	 8CZe7X21z0MfvszvZIzqH7P/1/CzB+bCnM94Zok8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 015C1F80137;
	Wed, 20 Jan 2021 01:32:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C8AABF8026A; Wed, 20 Jan 2021 01:32:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_78,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2D48AF800FE
 for <alsa-devel@alsa-project.org>; Wed, 20 Jan 2021 01:32:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D48AF800FE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Ryn+Eyy0"
Received: by mail-lj1-x234.google.com with SMTP id j3so4336231ljb.9
 for <alsa-devel@alsa-project.org>; Tue, 19 Jan 2021 16:32:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=p54YQoU5PizD2PvnEMTwxf/6TaphLrTilvpQINsaj5A=;
 b=Ryn+Eyy0tLq1AjpZ4wzZH7b0j6lALNZPqet/IMumjZlW2dsWaSXYePzJaTT6e57hwD
 /ob9Om+q8TptVqjyyT3rEaRRQGEa9Fz7sV6oJMrvBm0GS67UlLppeWr4c9gsCq6gHK9w
 94rK6lI9y2CBl1bOb3Jotr+YgQWC80w6QIuVO11yPtkWq3qR6/LKVeshPtZd/o+BXV+o
 ENMd/FwAy6AMBfXQymSUAkJXpBx+BjcOBO3y+8cO73y2R5ThNKYZJObKcmVp2dluxDM2
 qKFckARILDrxWMdDWIJuOjnEFxs5SDksmqSocvrnN7NPQHb3zgGqyYmtvtXTJxCQ7yQx
 6htA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=p54YQoU5PizD2PvnEMTwxf/6TaphLrTilvpQINsaj5A=;
 b=HdDNjtiPNySjER7qkaIGkja+3dmyS0Jdnk5M0Svv1vYqftx146otsYDJTkGjJ/Nqis
 25qDBD3PqyrZMbm2pg/VWAg6RvTpM4H11XYsxXmiBOqk9l0qiJGdNwYqpoKVjyfrDPCv
 qZb4T3s0d8p7KlREFKJnYZk5uSYO1GL0hLTS+nAriWB4mAqhdLyr3zeqPdFOrRjCw8T0
 0kPbvDFx77BUBomyoGjK8D1tL8Rwxpgoz3Q+ccz6mSsIoecLUpK+/PTHla8pL79fwUHX
 rFq0f4WTddI6ocJtg9jwdDYUi3G42B9qo1Ei4zsyRCmK4bjbXSzC6NNGFzTwdCPCb+PN
 X8Tg==
X-Gm-Message-State: AOAM532DAmI6NtL/BSW52OJTt7V6Vzh2arr0pvTevjORqLjSpmNJE+t8
 bwQWwbtO7SSn7Q9gpH6B1Z0=
X-Google-Smtp-Source: ABdhPJz/Sh6TR8pIQalIBKw2XVT4nunPLsNMc0btmpwvvB7qqB+d4SskIRT7YO+0DLfnTdZZxEeW7g==
X-Received: by 2002:a2e:5844:: with SMTP id x4mr3097356ljd.336.1611102723039; 
 Tue, 19 Jan 2021 16:32:03 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru.
 [109.252.192.57])
 by smtp.gmail.com with ESMTPSA id s27sm17710ljd.25.2021.01.19.16.32.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 16:32:02 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Sameer Pujar <spujar@nvidia.com>,
 Peter Geis <pgwipeout@gmail.com>, Nicolas Chauvet <kwizart@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Matt Merhar <mattmerhar@protonmail.com>,
 Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH v3 0/6] Clock and reset improvements for Tegra ALSA drivers
Date: Wed, 20 Jan 2021 03:31:48 +0300
Message-Id: <20210120003154.26749-1-digetx@gmail.com>
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
related to fixes of the reset controller driver since HDA/AHUB are bound
to fail once reset controller driver will be corrected. In particular ALSA
drivers are relying on implicit de-assertion of resets which is done by the
tegra-clk driver. It's not the business of the clk driver to touch resets
and we need to fix this because it breaks reset/clk programming sequences
of other Tegra drivers.

Changelog:

v3: - Reworked "hda/tegra: Reset hardware" and "ahub: Reset hardware properly"
      patches, they now use usleep + reset_deassert() instead of reset_reset().
      Suggested by Thierry Reding.

    - Added new patch "hda/tegra: Remove unnecessary null-check from
      hda_tegra_runtime_resume()". Suggested by Thierry Reding.

    - Replaced "ahub: Reset hardware properly" patch with "ahub: Add missing
      resets". Suggested by Thierry Reding.

    - Slightly improved commit messages.

    - Added acks from Thierry Reding.

v2: - Added regcache_sync() to the "ahub: Reset hardware properly" patch,
      which was missed by accident in v1.

    - Corrected typo in the format of the error message in "ahub: Use
      of_reset_control_array_get_exclusive()" patch by s/%p/%pe/.

Dmitry Osipenko (6):
  ALSA: hda/tegra: Use clk_bulk helpers
  ALSA: hda/tegra: Reset hardware
  ALSA: hda/tegra: Remove unnecessary null-check from
    hda_tegra_runtime_resume()
  ASoC: tegra: ahub: Add missing resets
  ASoC: tegra: ahub: Use clk_bulk helpers
  ASoC: tegra: ahub: Reset hardware properly

 sound/pci/hda/hda_tegra.c      | 90 ++++++++++++----------------------
 sound/soc/tegra/tegra30_ahub.c | 64 ++++++++++++++----------
 sound/soc/tegra/tegra30_ahub.h |  5 +-
 3 files changed, 72 insertions(+), 87 deletions(-)

-- 
2.29.2

