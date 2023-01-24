Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AB32567A111
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Jan 2023 19:19:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E8B3DF5;
	Tue, 24 Jan 2023 19:18:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E8B3DF5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674584341;
	bh=C4oW+q26F+P0WQtLZHIMWcPfnn1XDbaECr1JuVYGxko=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=myT5h3n29wA8PHthbNRq9YmjfihqwhBJg2a05kjFUS9ZMskWGmEOadrTxbJ7nqECt
	 0g5KvxHQlwJx6HgRsXgqG2qkV3R+M8CxxiOA79SuG8wDRyvoOhy0p+9HeGN78wBaFP
	 mvm6DKq0KG+xcW2Ln4MV26E+dkS/z9UUu4sVjgwY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E4D8F80163;
	Tue, 24 Jan 2023 19:18:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CE78FF8027D; Tue, 24 Jan 2023 19:18:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D3A32F801D5
 for <alsa-devel@alsa-project.org>; Tue, 24 Jan 2023 19:17:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D3A32F801D5
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=bombadil.20210309 header.b=P9lIZ7mN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=iYWbuhGp944F3TdBcB/ClLP8i2bPTgYrvwJPGPuMWAw=; b=P9lIZ7mNFfxXr0xNIcVvq5B3Hj
 FN0yTa106mvAoySEbnNd7rIyOtg+AyLrVN84mRgarY5GHW2EpOUxIM4t+hEHsj+hx2t+qRFP42HGo
 7syB43XgN1v/IO4a8e9TyNfxhYa78nIy7GEDyI89M+UQcU7mFqSoKtpFf+F3GU3htje1XdlcNDifG
 eDc0tSXgBK6Apg9f1Ft5iWC096wh/QDDi9yInNZMTKvDRAJETJPW1BgFx6pnPyFPMvqTNmJA1G33H
 uO0ry9Tit1ZFmMH9m+Sd7dBXYMSUaOZqHjXukDDvCITuvEe+5TL5DEKNs4mGNk7j5liZV8SayrcBE
 eIhTBizA==;
Received: from [2601:1c2:d80:3110::9307] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pKNrf-004vpH-11; Tue, 24 Jan 2023 18:17:47 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: Kconfig: fix spelling of "up to"
Date: Tue, 24 Jan 2023 10:17:46 -0800
Message-Id: <20230124181746.19028-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, Heiko Stuebner <heiko@sntech.de>,
 Randy Dunlap <rdunlap@infradead.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-rockchip@lists.infradead.org,
 Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Fix spelling in sound/soc/ Kconfig files:
s/upto/up to/
(reported by codespell)

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: Heiko Stuebner <heiko@sntech.de>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-rockchip@lists.infradead.org
---
 sound/soc/rockchip/Kconfig |    2 +-
 sound/soc/tegra/Kconfig    |    4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff -- a/sound/soc/rockchip/Kconfig b/sound/soc/rockchip/Kconfig
--- a/sound/soc/rockchip/Kconfig
+++ b/sound/soc/rockchip/Kconfig
@@ -13,7 +13,7 @@ config SND_SOC_ROCKCHIP_I2S
 	select SND_SOC_GENERIC_DMAENGINE_PCM
 	help
 	  Say Y or M if you want to add support for I2S driver for
-	  Rockchip I2S device. The device supports upto maximum of
+	  Rockchip I2S device. The device supports up to maximum of
 	  8 channels each for play and record.
 
 config SND_SOC_ROCKCHIP_I2S_TDM
diff -- a/sound/soc/tegra/Kconfig b/sound/soc/tegra/Kconfig
--- a/sound/soc/tegra/Kconfig
+++ b/sound/soc/tegra/Kconfig
@@ -144,7 +144,7 @@ config SND_SOC_TEGRA210_SFC
 	  Config to enable the Sampling Frequency Converter (SFC) which
 	  converts the sampling frequency of input signal to another
 	  frequency. It supports sampling frequency conversion of streams
-	  upto 2 channels (stereo).
+	  up to 2 channels (stereo).
 	  Say Y or M if you want to add support for Tegra210 SFC module.
 
 config SND_SOC_TEGRA210_AMX
@@ -171,7 +171,7 @@ config SND_SOC_TEGRA210_MIXER
 	tristate "Tegra210 Mixer module"
 	help
 	  Config to enable the Mixer module which can help to mix multiple
-	  audio streams. It supports mixing of upto 10 input streams,
+	  audio streams. It supports mixing of up to 10 input streams,
 	  where each stream can contain maximum of 8 channels. It supports
 	  5 output each of which can be a mix of any combination of 10
 	  input streams.
