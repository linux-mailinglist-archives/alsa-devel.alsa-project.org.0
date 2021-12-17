Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 720A5479362
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Dec 2021 18:59:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E43301FB6;
	Fri, 17 Dec 2021 18:58:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E43301FB6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639763963;
	bh=bGiBINZ1J/wzh4w2FNT5Vy4BNRv3JQToKv4hSFJJGTQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=J8chflAW8cl338ybiXFAcKxRfnJt2hyUveE78p0tEXIPZDBVe8x7giTd2WmOkPSTs
	 Z0xIo6f1yQ/wn4eye9ULmntgScrVMMTiYVL25WMohjQTXcLk1s9pJWW578LU8oOqyd
	 gseVkNencg+W7H6soNe3xybdl3Sjv4B7ctO3svR4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 345D6F80310;
	Fri, 17 Dec 2021 18:58:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6051FF80310; Fri, 17 Dec 2021 18:58:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2A00AF800B0
 for <alsa-devel@alsa-project.org>; Fri, 17 Dec 2021 18:58:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2A00AF800B0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="d5Le4BhU"
Received: by mail-lj1-x235.google.com with SMTP id b19so4544781ljr.12
 for <alsa-devel@alsa-project.org>; Fri, 17 Dec 2021 09:58:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JO0eGwLLz0htK5AL/Osj6kMOG2fBVADJOFwbMhccx2c=;
 b=d5Le4BhUw5QzNbC7DQKgQqpXdfvh6u9SezZgTCbqnUlmOtwuN0GnLY6AG306dbTfE1
 YumWoEYHgEWiKe2maOm4gQuhb6PYqbI51Qul5Jaoy6lsnyz8PrkyME3Oes6RyYDd0DrA
 en73kuwm9PnbtvQS3Bz4pVVYRbTdBEd6LSuNV+unLpb/sxu3SmZfObXyFQ8v/8UdjSJA
 gYvcO58LSEEVN5qbu+JMwfpjvddKNGFUynHDkyiuuJMyfaBiMYFt5gqrNN/iTo6aWL2X
 k/wzPaBsbm6Hp4vvpVi9Io24YqlqRBB/EJbcw7f4IyOx2TeEvSaurcZathgZL/aDy6Nk
 OG4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JO0eGwLLz0htK5AL/Osj6kMOG2fBVADJOFwbMhccx2c=;
 b=jsTVCTrUfhYT8WXySMunK+pAbYZZaSzU+UiBBjYO+VcRVKbLtHYbNJu9Za2eFrD/6q
 ccIadsEiavOMyY+U4GuTKVULAQTo2l49RVsAKoBmCzybJcTZZX2dFsKQxhcgkUkTt+m0
 S0CxYtTxmbvmdmTM03jTsabSUPhTdLwUctEIKDzXZ0BcC9AVq11S9vFfGuuB8MACTRw7
 TvccsE2ZPIg8FQduE9reyda5VkrNj6AEPTTrJC2IOktQ1Ps9pxJoNEj8LEryReisNYJB
 F6aqvcDgbvAB60yRjyEZt6IHtg6+SRek6ehhaieXomyWPIVompMuZlDy34na+ba7p+wT
 GOog==
X-Gm-Message-State: AOAM530FdNKEGSNaVQlQTgiFtdph76pgRT04mkVKx4toL2vq9KWsalqe
 HhE4bPgggk6MyA2/tUo+I5A=
X-Google-Smtp-Source: ABdhPJzWhLeDED2hHghcC5fAa2gjRzuaP7qnOlGcCDZ2vQfhpumBT/J4D1ToEkRHaNTc007UnY0kQw==
X-Received: by 2002:a2e:a175:: with SMTP id u21mr3807462ljl.284.1639763884028; 
 Fri, 17 Dec 2021 09:58:04 -0800 (PST)
Received: from localhost.localdomain (94-29-63-156.dynamic.spd-mgts.ru.
 [94.29.63.156])
 by smtp.gmail.com with ESMTPSA id w23sm1479244lfa.191.2021.12.17.09.58.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Dec 2021 09:58:03 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Agneli <poczt@protonmail.ch>
Subject: [PATCH v5 00/11] Support HDMI audio on NVIDIA Tegra20
Date: Fri, 17 Dec 2021 20:55:55 +0300
Message-Id: <20211217175606.22645-1-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
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

This series revives Tegra20 S/PDIF driver which was upstreamed long time
ago, but never was used. It also turns Tegra DRM HDMI driver into HDMI
audio CODEC provider. Finally, HDMI audio is enabled in device-trees.
For now the audio is enable only for Acer A500 tablet and Toshiba AC100
netbook because they're already supported by upstream, later on ASUS TF101
tablet will join them.

(!) These patches are made on top of stable dmaengine branch from Vinod Koul.

The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:

  Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git tags/dmaengine_topic_slave_id_removal_5.17

for you to fetch changes up to 3c219644075795a99271d345efdfa8b256e55161:

  dmaengine: remove slave_id config field (2021-12-17 11:23:56 +0530)

Changelog:

v5: - Dropped all patches that were already applied by Thierry Reding.

    - Made minor changes that were suggested by Thierry Reding.

    - Added acks from Thierry Reding.

    - Rebased patches on top of stable dmaengine branch from Vinod Koul.

v4: - Added patches that update multi_v7_defconfig with the enabled S/PDIF
      and APB DMA drivers.

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

Dmitry Osipenko (11):
  ASoC: dt-bindings: Add binding for Tegra20 S/PDIF
  ASoC: dt-bindings: tegra20-i2s: Convert to schema
  ASoC: dt-bindings: tegra20-i2s: Document new nvidia,fixed-parent-rate
    property
  ASoC: tegra20: spdif: Set FIFO trigger level
  ASoC: tegra20: spdif: Support device-tree
  ASoC: tegra20: spdif: Improve driver's code
  ASoC: tegra20: spdif: Use more resource-managed helpers
  ASoC: tegra20: spdif: Reset hardware
  ASoC: tegra20: spdif: Support system suspend
  ASoC: tegra20: spdif: Filter out unsupported rates
  ASoC: tegra20: i2s: Filter out unsupported rates

 .../bindings/sound/nvidia,tegra20-i2s.txt     |  30 ---
 .../bindings/sound/nvidia,tegra20-i2s.yaml    |  77 +++++++
 .../bindings/sound/nvidia,tegra20-spdif.yaml  |  85 ++++++++
 sound/soc/tegra/tegra20_i2s.c                 |  49 +++++
 sound/soc/tegra/tegra20_spdif.c               | 198 +++++++++++++-----
 sound/soc/tegra/tegra20_spdif.h               |   1 +
 sound/soc/tegra/tegra_pcm.c                   |   6 +
 sound/soc/tegra/tegra_pcm.h                   |   1 +
 8 files changed, 359 insertions(+), 88 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra20-i2s.txt
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra20-i2s.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra20-spdif.yaml

-- 
2.33.1

