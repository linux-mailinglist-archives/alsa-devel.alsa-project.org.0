Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D383145CFD2
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Nov 2021 23:08:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 71F2E17EB;
	Wed, 24 Nov 2021 23:08:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 71F2E17EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637791731;
	bh=td0njL2uwjmAptBu0ZgKHxOVs6E4oG9LfFnqfq9pW4c=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Bxc+q3pWW7ikkWEz6O9Bk4fJS08Z9uumoYQRm8Z2ftbjlSb52N46yMw5+uMlLVyOl
	 PCB0OPJzgCKIMhbNbi8utXdzau6vZ2CKWfuKvUtz+FHLcZ7GbrDMxr/b1ghdPXQNcD
	 vN23jyzleCCioXPU4qSFI9YugHQform6n0q9910g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E1877F804FE;
	Wed, 24 Nov 2021 23:06:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E0168F8032D; Wed, 24 Nov 2021 23:06:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AA591F8011F
 for <alsa-devel@alsa-project.org>; Wed, 24 Nov 2021 23:06:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AA591F8011F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="XryKTXvF"
Received: by mail-lj1-x22b.google.com with SMTP id v15so8514716ljc.0
 for <alsa-devel@alsa-project.org>; Wed, 24 Nov 2021 14:06:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2tZCZ8hYBjx1z5k7GS9qihmESy7aILKKvmRrarvGMnI=;
 b=XryKTXvFV87q72rf3hm3QdHNu7FS+1jkHbklorly1VtO9TQb77XtjiIeeZpGZD/4AJ
 1BhEc+J9mTr+wc4z4qJydjFKXv7eC8SEVKYu9cOvdvwBuwo+C7VPZArXlMddJ0Io3t41
 OtAavAUsNMpbWqZUuHEs0CVyXLVCiF2v7jfCrR3dLLIELJ7c1rkZtYMRulElbb6N7Sk+
 D81mULUm5w5vxxgipObNvWeAQmVhlVaGZpPeHSpmUrrQf7yFLjaV7l3V0VYGalJva5SD
 g3BSL2oZMkvhK65cmcCKuvPHQexL1sQbY9Ui5amyHrm4md7HNqvulXcXJpIdapBQhxC0
 fg9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2tZCZ8hYBjx1z5k7GS9qihmESy7aILKKvmRrarvGMnI=;
 b=6bjBO5bKil73QS7f/u/IZtKl2UOLsurNf54okmgIGUe6MkDj06hunsu0b8EKoN3Ihr
 6Jz6d7OjiANZ5vb9SX+JXscIL4VZPsb1IkkHfwzViFZQ/jfmW8d6haQ6hox6VWHKLb6C
 FIsZzgDr2GR0uw852LAyw2CxDylkznDjsqtP1vWldlcCWKHOi4eUd/NgH5dQ9pwGJefb
 YmCA35VtdmhLqauLb+cuMLe5f78jrsMWmWf2bY8bQ7UzFY6zzWUKs+q4WAWjF3ibfonM
 bQRDLyA7HV+hf9GDWx0QN+rNzNbD0Hd6iiYb0h+fE3m27cMbLl6pvzUWlnu3xy4Jc5fE
 qO/Q==
X-Gm-Message-State: AOAM530qbB5QTejEjvx1aocm8isMvOnQ/dyhodxorRefPoD977PCS42u
 CwVgS+zPayOwCeR09Eo2g78=
X-Google-Smtp-Source: ABdhPJxN5Z/cMHtigSK2VlRsjGDJK8VknY+zJ8jUCWKgcxOZAbifzK5En0RtTvmWKAf5DfEP86zX8g==
X-Received: by 2002:a05:651c:158b:: with SMTP id
 h11mr19639328ljq.137.1637791590041; 
 Wed, 24 Nov 2021 14:06:30 -0800 (PST)
Received: from localhost.localdomain (94-29-48-99.dynamic.spd-mgts.ru.
 [94.29.48.99])
 by smtp.gmail.com with ESMTPSA id w17sm93266ljh.15.2021.11.24.14.06.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Nov 2021 14:06:29 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Agneli <poczt@protonmail.ch>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v1 00/20] Support HDMI audio on NVIDIA Tegra20
Date: Thu, 25 Nov 2021 01:00:37 +0300
Message-Id: <20211124220057.15763-1-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
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

This series revives Tegra20 S/PDIF driver which was upstreamed long time
ago, but never was used. It also turns Tegra DRM HDMI driver into HDMI
audio CODEC provider. Finally, HDMI audio is enabled in device-trees.
For now the audio is enable only for Acer A500 tablet and Toshiba AC100
netbook because they're already supported by upstream, later on ASUS TF101
tablet will join them.

I based S/PDIF patches on Arnd's Bergmann patch from a separate series [1]
that removes obsolete slave_id. This eases merging of the patches by
removing the merge conflict.

[1] https://patchwork.ozlabs.org/project/linux-tegra/list/?submitter=80402

Arnd Bergmann (1):
  ASoC: tegra20-spdif: stop setting slave_id

Dmitry Osipenko (19):
  ASoC: dt-bindings: Add binding for Tegra20 S/PDIF
  ASoC: dt-bindings: tegra20-i2s: Convert to schema
  ASoC: dt-bindings: tegra20-i2s: Document new nvidia,fixed-parent-rate
    property
  dt-bindings: host1x: Document optional HDMI sound-dai-cells
  ASoC: tegra20: spdif: Support device-tree
  ASoC: tegra20: spdif: Set FIFO trigger level
  ASoC: tegra20: spdif: Improve driver's code
  ASoC: tegra20: spdif: Use more resource-managed helpers
  ASoC: tegra20: spdif: Reset hardware
  ASoC: tegra20: spdif: Support system suspend
  ASoC: tegra20: spdif: Filter out unsupported rates
  ASoC: tegra20: i2s: Filter out unsupported rates
  drm/tegra: hdmi: Unwind tegra_hdmi_init() errors
  drm/tegra: hdmi: Register audio CODEC on Tegra20
  ARM: tegra_defconfig: Enable S/PDIF driver
  ARM: tegra: Add S/PDIF node to Tegra20 device-tree
  ARM: tegra: Add HDMI audio graph to Tegra20 device-tree
  ARM: tegra: acer-a500: Enable S/PDIF and HDMI audio
  ARM: tegra: paz00: Enable S/PDIF and HDMI audio

 .../display/tegra/nvidia,tegra20-host1x.txt   |   1 +
 .../bindings/sound/nvidia,tegra20-i2s.txt     |  30 ---
 .../bindings/sound/nvidia,tegra20-i2s.yaml    |  78 +++++++
 .../bindings/sound/nvidia,tegra20-spdif.yaml  |  88 ++++++++
 .../boot/dts/tegra20-acer-a500-picasso.dts    |   8 +
 arch/arm/boot/dts/tegra20-paz00.dts           |   8 +
 arch/arm/boot/dts/tegra20.dtsi                |  40 +++-
 arch/arm/configs/tegra_defconfig              |   1 +
 drivers/gpu/drm/tegra/Kconfig                 |   3 +
 drivers/gpu/drm/tegra/hdmi.c                  | 168 +++++++++++++--
 sound/soc/tegra/tegra20_i2s.c                 |  49 +++++
 sound/soc/tegra/tegra20_spdif.c               | 195 +++++++++++++-----
 sound/soc/tegra/tegra20_spdif.h               |   1 +
 sound/soc/tegra/tegra_pcm.c                   |   6 +
 sound/soc/tegra/tegra_pcm.h                   |   1 +
 15 files changed, 575 insertions(+), 102 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra20-i2s.txt
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra20-i2s.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra20-spdif.yaml

-- 
2.33.1

