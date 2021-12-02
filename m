Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B61946683D
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Dec 2021 17:28:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4F77528C9;
	Thu,  2 Dec 2021 17:27:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4F77528C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638462515;
	bh=y8JQY0BlPCg3IIiDC8wKVOLgpr5ihlRYTddeGWClzOA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bvlVHh6TLwNudJewqfaxzjLCKDiQ205mYERxfNqcC2eeCBHgkHgjPhlCg3xuZihP6
	 I4tVYRkmg6qxm4VsGe6C5ZB2aHvYznkgJUSgZ5OmqAQavHUSe2G+4/6h2ahxoro657
	 sBaUPiRvmTLnRhOD887vCTqtsStWoec6rl9Kt0lE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B7A3AF804FE;
	Thu,  2 Dec 2021 17:25:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A2AA2F8050F; Thu,  2 Dec 2021 17:25:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4F0AAF800EE
 for <alsa-devel@alsa-project.org>; Thu,  2 Dec 2021 17:25:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4F0AAF800EE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="CvoWguys"
Received: by mail-lf1-x12f.google.com with SMTP id b1so72609831lfs.13
 for <alsa-devel@alsa-project.org>; Thu, 02 Dec 2021 08:25:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=imLf4C09RyVy+Ea5NbMda4qEdBwYu+Q8gzSH5LvY08M=;
 b=CvoWguysiszg7EIo/KVTylyyzVddJnXGME2sUkSxXPE9QI/M3G8WW2gcb4Ek7CLTkI
 3OJJMgnRPQJXKbujpC7ujQ9wYAxJoCVX65idvYa3GvigcBfm/gUYtCJJvZ2uP9UjMtPK
 HRMs7PTCX+5RlqbV1bUccYeBpf7CUglk+Zkys9HnjNqGPGy7z6A8TixZaxXBfYQIt6DZ
 zPCDUvOWZQ5RSqndRin4+7Mb8/+sii0fHswcT6k1I0e8l4ixYoJmlgslf65hRDKC/SUF
 H8qushryTjmB197mMux8vD/lE1VXc04JApMYeZ3NaNY+32Snz0LSbaD6jb2QkYMFSwlz
 WacQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=imLf4C09RyVy+Ea5NbMda4qEdBwYu+Q8gzSH5LvY08M=;
 b=RQWwRzrzC8+t32C8ZzSjpy1VL3PtzpoICPRCDFbT6J/d/oKhwjHXGRwJcACHDN/SXn
 83N6zxLaTnBlN2PsuMO62eIq//KWbDfcQX3PZKKT/F98j2POkBhtnJeN3LtqvtKKetni
 dPx3AQCMbYWc92YBZFEW0W5fhwb30LLaU8o/16UCmNTwlVaTFzp1ZZP5bTaRfBYrnnJ6
 L+rOVQSafCI01tCEe1TYTozbybLwiYw2Lvmmb4+t6cWjqTk1j8AK8p1k0dS6iySv6Vyk
 Ea9LNPMGmHy+AlnG+tCD6fC7td0btJGmUVOIXe+g/AOHsPYEUXKraFJAZwKL3YdH2xEX
 ZIKw==
X-Gm-Message-State: AOAM532oTr8upefb0fs/delP9wi/cF4kxZGDtAlF35+TPitDAdTNjOel
 vy/bYNoTU3ADI4R3BLzldFw=
X-Google-Smtp-Source: ABdhPJxBOZ/Rf8efL1/chi4Rtn8qA9mSShnKA0016dzHrdbF1opdrOowLz1/fQq8mfpdVWPuKJuYOg==
X-Received: by 2002:ac2:454b:: with SMTP id j11mr12665406lfm.41.1638462316009; 
 Thu, 02 Dec 2021 08:25:16 -0800 (PST)
Received: from localhost.localdomain (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.gmail.com with ESMTPSA id d18sm36806lfl.30.2021.12.02.08.25.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Dec 2021 08:25:15 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Agneli <poczt@protonmail.ch>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v3 00/20] Support HDMI audio on NVIDIA Tegra20
Date: Thu,  2 Dec 2021 19:23:21 +0300
Message-Id: <20211202162341.1791-1-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
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

This series revives Tegra20 S/PDIF driver which was upstreamed long time
ago, but never was used. It also turns Tegra DRM HDMI driver into HDMI
audio CODEC provider. Finally, HDMI audio is enabled in device-trees.
For now the audio is enable only for Acer A500 tablet and Toshiba AC100
netbook because they're already supported by upstream, later on ASUS TF101
tablet will join them.

I based S/PDIF patches on Arnd's Bergmann patch from a separate series [1]
that removes obsolete slave_id. This eases merging of the patches by
removing the merge conflict. This is a note for Mark Brown.

I also based this series on top of power management series [2]. I.e. [2]
should be applied first, otherwise "Add S/PDIF node to Tegra20 device-tree"
patch should have merge conflict. This is a note for Thierry.

[1] https://patchwork.ozlabs.org/project/linux-tegra/list/?series=273312
[2] https://patchwork.ozlabs.org/project/linux-tegra/list/?series=274534

Changelog:

v3: - Renamed S/PDIF device-tree clocks as was suggested by Rob Herring.

    - Added r-bs and acks that were given by Rob Herring to v2.

v2: - Corrected I2S yaml problem that was reported by the DT bot for v1
      by removing the non-existent required clock-names property.

    - Removed assigned-clocks property from S/PDIF yaml since this property
      is now inherited from the clocks property.

    - Reordered the "tegra20: spdif: Set FIFO trigger level" patch, making
      it the first sound/soc patch in the series, like it was suggested by
      Mark Brown in the comment to v1. Also reworded commit message of this
      patch to *not* make it looks like it should be backported to stable
      kernels.

Arnd Bergmann (1):
  ASoC: tegra20-spdif: stop setting slave_id

Dmitry Osipenko (19):
  ASoC: dt-bindings: Add binding for Tegra20 S/PDIF
  ASoC: dt-bindings: tegra20-i2s: Convert to schema
  ASoC: dt-bindings: tegra20-i2s: Document new nvidia,fixed-parent-rate
    property
  dt-bindings: host1x: Document optional HDMI sound-dai-cells
  ASoC: tegra20: spdif: Set FIFO trigger level
  ASoC: tegra20: spdif: Support device-tree
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
 .../bindings/sound/nvidia,tegra20-i2s.yaml    |  77 +++++++
 .../bindings/sound/nvidia,tegra20-spdif.yaml  |  85 ++++++++
 .../boot/dts/tegra20-acer-a500-picasso.dts    |   8 +
 arch/arm/boot/dts/tegra20-paz00.dts           |   8 +
 arch/arm/boot/dts/tegra20.dtsi                |  40 +++-
 arch/arm/configs/tegra_defconfig              |   1 +
 drivers/gpu/drm/tegra/Kconfig                 |   3 +
 drivers/gpu/drm/tegra/hdmi.c                  | 168 +++++++++++++--
 sound/soc/tegra/tegra20_i2s.c                 |  49 +++++
 sound/soc/tegra/tegra20_spdif.c               | 197 ++++++++++++------
 sound/soc/tegra/tegra20_spdif.h               |   1 +
 sound/soc/tegra/tegra_pcm.c                   |   6 +
 sound/soc/tegra/tegra_pcm.h                   |   1 +
 15 files changed, 572 insertions(+), 103 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra20-i2s.txt
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra20-i2s.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra20-spdif.yaml

-- 
2.33.1

