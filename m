Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F8429D933
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Oct 2020 23:49:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 99C03843;
	Wed, 28 Oct 2020 23:49:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 99C03843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603925390;
	bh=GmVRoXMgIpLjRV1MtCfP4Y33+nWTcUFIfZX3NQeEk3Q=;
	h=Date:In-Reply-To:References:From:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=klAhXE6kITYNlT62aF2kI8JMBmULmTeNIQ8KutXnSOdKODx5LZTS6zaHErLELsgah
	 nqZBUfq6n0g8i6bLphi7zPLy5wfszst9y21MD1fsPr94YhexFsd941bNaBQgGqae45
	 Y1b9bzpLkfsvY0Mw7SaRB6EhPxB+q6O9Yo4G7vuw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E1387F80249;
	Wed, 28 Oct 2020 23:48:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 089BAF80212; Wed, 28 Oct 2020 23:48:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from rere.qmqm.pl (rere.qmqm.pl [91.227.64.183])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 20350F801D5
 for <alsa-devel@alsa-project.org>; Wed, 28 Oct 2020 23:48:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 20350F801D5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=rere.qmqm.pl header.i=@rere.qmqm.pl
 header.b="CLTm37zS"
Received: from remote.user (localhost [127.0.0.1])
 by rere.qmqm.pl (Postfix) with ESMTPSA id 4CM3d36WwDzBl;
 Wed, 28 Oct 2020 23:48:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
 t=1603925288; bh=GmVRoXMgIpLjRV1MtCfP4Y33+nWTcUFIfZX3NQeEk3Q=;
 h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
 b=CLTm37zSuIC3+w5yRdHbUp6edZU05Jws7T3eCt1u7aw+hkUkozIHLQy8RMe5qwfdl
 hrjBDnyvZqqbpVLC9Hkx1QcpTaGY3kUntyKExD9b2Dbrbl6cIy2L+z+n6swZcKq7B0
 zUgE2pH+fk1hZ19epYMWBczaAd27+jQho4DDt4DCTNrUXIytbLWOdfPMfPCp4XghBE
 EDJn5X6Wc1kgmkEb4Ddc4KLYg9n7XNR7CeskGwN3AgfAIeIPmUMPj8DVInzwxfe+oZ
 dVCdhG+tvKVlQnGeV0g9bxgPB773VupGMd6cnhr0WhTknaX7MTGurncGHS15KQOVIq
 unVSscbUrZe4A==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.102.4 at mail
Date: Wed, 28 Oct 2020 23:48:07 +0100
Message-Id: <eb2ab1666f39575f65467ac6e0dd7d987a35b926.1603925200.git.mirq-linux@rere.qmqm.pl>
In-Reply-To: <8756eb5aac561173aa222c9cb64dd314ab1b1f9b.1603925200.git.mirq-linux@rere.qmqm.pl>
References: <8756eb5aac561173aa222c9cb64dd314ab1b1f9b.1603925200.git.mirq-linux@rere.qmqm.pl>
From: =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Subject: [PATCH v3 2/2] arm: defconfig: enable tegra20-spdif
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Stephen Warren <swarren@nvidia.com>, Takashi Iwai <tiwai@suse.com>
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

Enable tegra20-spdif in tegra and multiplatform defconfigs. The driver
will be switched to "default n" in another patch.

Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
---
  v3: split from main patch
  v2: add the symbol to defconfig as suggested by Thierry Reding
---
 arch/arm/configs/multi_v7_defconfig | 1 +
 arch/arm/configs/tegra_defconfig    | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index e731cdf7c88c..681742f81c08 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -745,6 +745,7 @@ CONFIG_SND_SOC_STM32_I2S=m
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
-- 
2.20.1

