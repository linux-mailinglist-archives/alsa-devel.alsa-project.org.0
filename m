Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 309FF297C57
	for <lists+alsa-devel@lfdr.de>; Sat, 24 Oct 2020 14:36:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A680217C4;
	Sat, 24 Oct 2020 14:35:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A680217C4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603542959;
	bh=ZpKqDVMnGnFJxAu7glq/SOb5QpupbYxViZoh10ycH/Y=;
	h=Date:From:Subject:To:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=t/ztoEOe1V8BdWG03HRp4UhvhgyXa7zQ7P2NTnatRZMY5MbQIgi+DuF6qcqkFDfr7
	 86y/Kde8WD3Ya4xK9dsXVq0kYV8J5F05C8C30aLh/AcF+HLwCeidx9VZmQ7WcjB6/b
	 MUjB1UpuF1pKys79iz1GZqmXCVSOgElTXr93HEho=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A0C2F800CC;
	Sat, 24 Oct 2020 14:34:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1B8CBF8049C; Sat, 24 Oct 2020 14:34:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from rere.qmqm.pl (rere.qmqm.pl [91.227.64.183])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A7B0BF800CC
 for <alsa-devel@alsa-project.org>; Sat, 24 Oct 2020 14:34:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A7B0BF800CC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=rere.qmqm.pl header.i=@rere.qmqm.pl
 header.b="TETUnYOc"
Received: from remote.user (localhost [127.0.0.1])
 by rere.qmqm.pl (Postfix) with ESMTPSA id 4CJLBZ6TxQz5H;
 Sat, 24 Oct 2020 14:34:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
 t=1603542855; bh=ZpKqDVMnGnFJxAu7glq/SOb5QpupbYxViZoh10ycH/Y=;
 h=Date:From:Subject:To:Cc:From;
 b=TETUnYOcnj9cUs+MZ6Oz3QIH0Y+RCCi2l6MIfVS8gi4cEq4BFpJNp8T2snJqhT0DX
 pPQh2lJWjW2qLrJDP4R2NK58o+bGdGbO7GBYhZlLPln4h8xH56txp0JhKpR+Z4nm6z
 3Kh8ycNzYtCEyr4/WJeObFsAZ9UL6u58Xcf1FAk2rxwCHN6DXez3zHWFXUYZBO6lOU
 vajF2trceBBjEOLNNZbZAJPRrN0ZNI0R8kSBnz24da4lY5IVIUdRdmRH55y9RKOcT0
 mmo2oMFcYow2IyIRUe5LnlDf0pe6myAmpoC7d5uo/WlhhRVHAKk0rKIvbv9P06IQOe
 ir15k4GlbfBPw==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.102.4 at mail
Date: Sat, 24 Oct 2020 14:34:14 +0200
Message-Id: <e6e89abff9004e8ed2e79a9ccf1377eeac9e4134.1603542719.git.mirq-linux@rere.qmqm.pl>
From: =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Subject: [RESEND v2] ASoC: tegra20-spdif: remove "default m"
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Stephen Warren <swarren@nvidia.com>
Cc: linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

Make tegra20-spdif default to N as all other drivers do.
Add the selection to defconfigs instead.

Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
Fixes: 774fec338bfc ("ASoC: Tegra: Implement SPDIF CPU DAI")
---
 v2: add the symbol to defconfig as suggested by Thierry Reding
---
 arch/arm/configs/multi_v7_defconfig | 1 +
 arch/arm/configs/tegra_defconfig    | 1 +
 sound/soc/tegra/Kconfig             | 1 -
 3 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index e9e76e32f10f..19342ac738a5 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -743,6 +743,7 @@ CONFIG_SND_SOC_STM32_I2S=m
 CONFIG_SND_SUN4I_CODEC=m
 CONFIG_SND_SOC_TEGRA=m
 CONFIG_SND_SOC_TEGRA20_I2S=m
+CONFIG_SND_SOC_TEGRA20_SPDIF=m
 CONFIG_SND_SOC_TEGRA30_I2S=m
 CONFIG_SND_SOC_TEGRA_RT5640=m
 CONFIG_SND_SOC_TEGRA_WM8753=m
diff --git a/arch/arm/configs/tegra_defconfig b/arch/arm/configs/tegra_defconfig
index fff5fae0db30..08526eb50484 100644
--- a/arch/arm/configs/tegra_defconfig
+++ b/arch/arm/configs/tegra_defconfig
@@ -225,6 +225,7 @@ CONFIG_SND_HDA_CODEC_HDMI=y
 CONFIG_SND_SOC=y
 CONFIG_SND_SOC_TEGRA=y
 CONFIG_SND_SOC_TEGRA20_I2S=y
+CONFIG_SND_SOC_TEGRA20_SPDIF=y
 CONFIG_SND_SOC_TEGRA30_I2S=y
 CONFIG_SND_SOC_TEGRA_RT5640=y
 CONFIG_SND_SOC_TEGRA_WM8753=y
diff --git a/sound/soc/tegra/Kconfig b/sound/soc/tegra/Kconfig
index 3d91bd3e59cd..a62cc87551ac 100644
--- a/sound/soc/tegra/Kconfig
+++ b/sound/soc/tegra/Kconfig
@@ -39,7 +39,6 @@ config SND_SOC_TEGRA20_I2S
 config SND_SOC_TEGRA20_SPDIF
 	tristate "Tegra20 SPDIF interface"
 	depends on SND_SOC_TEGRA
-	default m
 	help
 	  Say Y or M if you want to add support for the Tegra20 SPDIF interface.
 	  You will also need to select the individual machine drivers to support
-- 
2.20.1

