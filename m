Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 034A738DE24
	for <lists+alsa-devel@lfdr.de>; Mon, 24 May 2021 01:46:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 60DC71695;
	Mon, 24 May 2021 01:46:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 60DC71695
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621813610;
	bh=kM6xvGNzZwoj5SNvSba2ePmrwZ+Az2Az2Vp1qJfKxy8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NmSeyAH4yBwiLOGIEox4orhZLsn3NkflCFSqwCcYt//ekXHfZ4hbVnKFhtWapoCJV
	 8sT3U/mHj6oBy6twPfOLx23X5KbpztU4OUIJwXDDf8MHSXi6Y8Mx+3BF3o5NCWbxfl
	 l+LPgEAl0a35gBTr/H2kM504avmSvRcSI479UUHs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 632F8F802DB;
	Mon, 24 May 2021 01:45:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 43737F8026B; Mon, 24 May 2021 01:45:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
 DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FROM,NML_ADSP_CUSTOM_MED,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 805BFF800DF
 for <alsa-devel@alsa-project.org>; Mon, 24 May 2021 01:45:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 805BFF800DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="fkGG6opg"
Received: by mail-lj1-x229.google.com with SMTP id o8so31259178ljp.0
 for <alsa-devel@alsa-project.org>; Sun, 23 May 2021 16:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=odIUAzVpSvIL7IIcBvAsTMdmbOsZaWug4GlMmmm0+sI=;
 b=fkGG6opg4zBrpQJQyrI6xpQMXkeqAD12j2ubkEyWxo5Ai/p6UaH1OUtD/thK1AjfPh
 Of39n9ioUdZ9f7gwPRTPm1fCD8frSaVYb8KhZE64AH5GGaWhYl/RarYfAmbiM0FvuMxB
 Ez6aT6wanG9uYm6170p34R38fn7GiuQ+CXn30ESlx7+LYTJKok4yI+muKBLzicqcFIjG
 Cu/p5BWvbaq/aalwfR4Ahs6HKMHmKpory6VAhP7xvngU/nnF+xq4KX5sXe+7Pq791Th/
 ZoAeKSftIii96aNMYalr77qABpmguSW7ku21nofIWYp0rzRsvxJKVF0x8TV8vqKJWGAC
 PoOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=odIUAzVpSvIL7IIcBvAsTMdmbOsZaWug4GlMmmm0+sI=;
 b=acqMPsRwIx5qI1yA5tIalTyc8sWjDQq632tTvzcLzBhT8GmDQ4PFV0NCiQgXjdMhCS
 xmj9gauvQap0CDMOzrxc2jYEQ3sbfSkuhm7Umcxp5qARqD+eX2f9AewfFswyLy1Jc5iv
 9/t96iY+lLx931ManC5BURAn4NuOO+IhSyVvt7fv7CVSyX5ozzKvzliA29QgD39ctnyx
 xJysEXF/+A41C2p9ZO4RXxHElGUJNEY1nIhM36FKFd7HMB+YZgU1Yg40BXsKnj8reXYt
 esdYHoZf5TEHD3e10wy/e2CkhYGX/nhC156wOCghOKLa8K7Jg8vTVicp4J/9yMIlKF3L
 behw==
X-Gm-Message-State: AOAM531U92eMH3WnhURWYQM22MfotlfdBM8sdjphR2chYxpjXfp/xuzP
 0WcFGVHqqUsaO/mltqCoU5M=
X-Google-Smtp-Source: ABdhPJwVceG0+0umOv9SNyyBo1gvXhoraPQ9T1uXF38hPuanB5j+SHkkhqXxJyRuyMe4M2teqzkd/A==
X-Received: by 2002:a2e:a585:: with SMTP id m5mr15119059ljp.51.1621813499361; 
 Sun, 23 May 2021 16:44:59 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-110.dynamic.spd-mgts.ru.
 [109.252.193.110])
 by smtp.gmail.com with ESMTPSA id u11sm1269054lfg.243.2021.05.23.16.44.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 May 2021 16:44:59 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Ion Agorria <ion@agorria.com>, Svyatoslav Ryhel <clamor95@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v3 0/4] Unify NVIDIA Tegra ASoC machine drivers
Date: Mon, 24 May 2021 02:44:33 +0300
Message-Id: <20210523234437.25077-1-digetx@gmail.com>
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

During review of the RT5631 machine driver, Jon Hunter suggested that
it will be better to squash all the current ASoC machine drivers into
a single one. This suggestion is implemented by this patchset. The
RT5631 support will come later with the ASUS Transformer changes.

This series needs to be approved by Jaroslav Kysela before it can be
merged.

Changelog:

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

Dmitry Osipenko (4):
  ASoC: tegra: Set driver_name=tegra for all machine drivers
  ASoC: tegra: Unify ASoC machine drivers
  ASoC: tegra: Specify components string for each card
  ASoC: tegra: Specify components string for Nexus 7

 sound/soc/tegra/Kconfig              |  12 +
 sound/soc/tegra/Makefile             |  18 +-
 sound/soc/tegra/tegra_alc5632.c      | 259 ---------
 sound/soc/tegra/tegra_asoc_machine.c | 761 +++++++++++++++++++++++++++
 sound/soc/tegra/tegra_asoc_machine.h |  47 ++
 sound/soc/tegra/tegra_max98090.c     | 276 ----------
 sound/soc/tegra/tegra_rt5640.c       | 222 --------
 sound/soc/tegra/tegra_rt5677.c       | 324 ------------
 sound/soc/tegra/tegra_sgtl5000.c     | 211 --------
 sound/soc/tegra/tegra_wm8753.c       | 185 -------
 sound/soc/tegra/tegra_wm8903.c       | 358 +++----------
 sound/soc/tegra/tegra_wm9712.c       | 166 ------
 sound/soc/tegra/trimslice.c          | 172 ------
 13 files changed, 894 insertions(+), 2117 deletions(-)
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

