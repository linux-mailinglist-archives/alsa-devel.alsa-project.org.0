Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D545394679
	for <lists+alsa-devel@lfdr.de>; Fri, 28 May 2021 19:31:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 98C2416D6;
	Fri, 28 May 2021 19:30:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 98C2416D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622223065;
	bh=4UEQFamfktPFyRHlu9ts6fcZdmHhGBtNANTiNwk5djU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=QZIxlcEC24p5JCvIas/9S47KOFy2wLiLA7xtqAFbg4RDkItMMW35qN3AxXdgJvD0k
	 ENBllNBMs0t4Oc5ixeMZIpUJkTAfoHi7B1ayEJqqkO8Bvl1eKUQA7f/gjKVRs3ZdoJ
	 hYgTbEdIdHW1J6jGUqq+DILPZdkwYq0QeHYKSUEI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1501FF804AF;
	Fri, 28 May 2021 19:29:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 525DEF8013A; Fri, 28 May 2021 19:29:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1FE4AF8013A
 for <alsa-devel@alsa-project.org>; Fri, 28 May 2021 19:29:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1FE4AF8013A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="oLuOlBud"
Received: by mail-lf1-x135.google.com with SMTP id x38so6365037lfa.10
 for <alsa-devel@alsa-project.org>; Fri, 28 May 2021 10:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nQGU6xrvasRzJ9/W6i4GybOWCRndIumcGWBV2DwZRaE=;
 b=oLuOlBudc2FiZ4E3p8UrouhdUzva8p07ec+k5PXp+TUrp80hZpOAn4KO4GxO5NcOno
 sq8GpwLc8BzVKI4TxJyoL6MR6rp1FpJTysHAqH/KYG8OsVdZdmiNRpLAbvPpKvpY9YoF
 8HvPHwi9VTDBHoxThJWl+sMEMgcDlsCCUdq48c6uxkOCXZ0ypyq0O1nPbDhS2ojdCngu
 C2NGaF/Fn+/elN+NSdiU5L4TPaPO8Ehz6c317aHP1A89MPUcK69I+pbIHg4+pkk60OtN
 ouJd3CwAs0aP6wMiIPxrsbek9jWe/GhndC8qjSTTx8j5m2Dmq1nUQyn/aCJGvhrobQfS
 /QUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nQGU6xrvasRzJ9/W6i4GybOWCRndIumcGWBV2DwZRaE=;
 b=ldZoiBOjpda9iN/c6efL059OGx//vpYasq/rtxK6e9VY77sa4SiwWR5gHT3g5JZniR
 Vm9OFE+bJxmdDIfgtEP3PO/T7AbP1tFWPxvUKuBNwbhxnPZxUhgsfTbeY6+ciQZ+Dj1J
 gff0NCdSGw665XofnoIjyKI17Cmpt07RdrcK+TxADogKIjh91PahzTT8PCWXnxLwWco0
 UcXfMFDFARbrUxLYhOkoHe2OnPpKWbMeMfRcxOKfVWU5fLi09svRQ8iCq2FNzCJYaE/w
 AZn0Ng33Rdb29w9H6QuiEkPeWoCb5w+IBfRyYhXyzQ0gudBu4Ur2pTtJLiH94nT4Vxu7
 vl5w==
X-Gm-Message-State: AOAM5324C8ZOofBh/wHpNV8xKrETOgsiZBXDg4MSDW5cA+y5qCKJn+80
 FhRAx/uYxRScOX9v7LXlxuk=
X-Google-Smtp-Source: ABdhPJzYLXcjkSoV50SJyxTWXbXGdzlaPQ4nCCyFIMp3Wbb81hshFzgZ+uWem4bbOtWwwABvfichZQ==
X-Received: by 2002:ac2:4281:: with SMTP id m1mr6250316lfh.164.1622222963252; 
 Fri, 28 May 2021 10:29:23 -0700 (PDT)
Received: from localhost.localdomain (46-138-12-55.dynamic.spd-mgts.ru.
 [46.138.12.55])
 by smtp.gmail.com with ESMTPSA id x207sm518282lff.234.2021.05.28.10.29.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 May 2021 10:29:22 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Ion Agorria <ion@agorria.com>, Svyatoslav Ryhel <clamor95@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v5 0/3] Unify NVIDIA Tegra ASoC machine drivers
Date: Fri, 28 May 2021 20:28:30 +0300
Message-Id: <20210528172833.21622-1-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
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

This series squashes all the ASoC machine drivers into a single one,
this change was suggested by Jon Hunter. It also sets driver_name and
components string of each card, allowing userspace alsa-lib to find
UCMs at predictable path.

Changelog:

v5: - The v4 removed the customization of components string for Nexus 7,
      but I missed to remove the "components" hook which is unused now,
      it's removed in v5 for consistency.

    - Slightly improved naming of the common 12MHz MCLK rate function
      to make it more consistent with the rest of the driver functions.

v4: - Moved out mclk_rate callback that is currently used only by WM8903
      machine driver from the common driver. This was suggested by Jon Hunter.

    - Dropped patch which was setting custom components string for Nexus 7.
      Jaroslav Kysela wants it to be specified in a device-tree, but the
      components string doesn't have a firm specification for today. It's
      better to drop this change for now since it's optional anyways.

    - Fixed compilation error that was reported by kernel robot for v3.

    - Jaroslav Kysela merged alsa-ucm-conf PR [1] which added UCMs for
      Nexus 7 and Acer A500. The UCMs are fully working using a combination
      of updated kernel + alsa-ucm-conf master + alsa-lib master, meaning
      that they will work with the next releases of kernel and ALSA userspace
      upstream packages.

    - Added ack from Jaroslav Kysela to the "Specify components string for
      each card" patch that he gave to v3.

v3: - Added components string as was suggested by Jaroslav Kysela to v2.

    - Renamed MCLK rate function that is used by max98090 and other codecs
      to make it look more generic. Added option for specifying CLK ID per
      device. This all was suggested by Jon Hunter to v2.

v2: - Dropped use of of_device_compatible_match(), like it was suggested
      by Rob Herring in a review comment to v1.

    - Added patch that sets card's driver_name of as Tegra ASoC drivers.
      In a comment to v1 Jaroslav Kysela suggested that the Tegra drivers
      don't set the card name properly and he was right.

      I opened pull request with the new Tegra UCMs and updated lookup paths
      for older UCMs [1].

      [1] https://github.com/alsa-project/alsa-ucm-conf/pull/92

Dmitry Osipenko (3):
  ASoC: tegra: Set driver_name=tegra for all machine drivers
  ASoC: tegra: Unify ASoC machine drivers
  ASoC: tegra: Specify components string for each card

 sound/soc/tegra/Kconfig              |  12 +
 sound/soc/tegra/Makefile             |  18 +-
 sound/soc/tegra/tegra_alc5632.c      | 259 ----------
 sound/soc/tegra/tegra_asoc_machine.c | 712 +++++++++++++++++++++++++++
 sound/soc/tegra/tegra_asoc_machine.h |  45 ++
 sound/soc/tegra/tegra_max98090.c     | 276 -----------
 sound/soc/tegra/tegra_rt5640.c       | 222 ---------
 sound/soc/tegra/tegra_rt5677.c       | 324 ------------
 sound/soc/tegra/tegra_sgtl5000.c     | 211 --------
 sound/soc/tegra/tegra_wm8753.c       | 185 -------
 sound/soc/tegra/tegra_wm8903.c       | 351 +++----------
 sound/soc/tegra/tegra_wm9712.c       | 166 -------
 sound/soc/tegra/trimslice.c          | 172 -------
 13 files changed, 850 insertions(+), 2103 deletions(-)
 delete mode 100644 sound/soc/tegra/tegra_alc5632.c
 create mode 100644 sound/soc/tegra/tegra_asoc_machine.c
 create mode 100644 sound/soc/tegra/tegra_asoc_machine.h
 delete mode 100644 sound/soc/tegra/tegra_max98090.c
 delete mode 100644 sound/soc/tegra/tegra_rt5640.c
 delete mode 100644 sound/soc/tegra/tegra_rt5677.c
 delete mode 100644 sound/soc/tegra/tegra_sgtl5000.c
 delete mode 100644 sound/soc/tegra/tegra_wm8753.c
 delete mode 100644 sound/soc/tegra/tegra_wm9712.c
 delete mode 100644 sound/soc/tegra/trimslice.c

-- 
2.30.2

