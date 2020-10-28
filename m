Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E836029D934
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Oct 2020 23:50:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4750B15F9;
	Wed, 28 Oct 2020 23:49:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4750B15F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603925401;
	bh=yHK8V58DLeNnIRye/EkDqjDsAYo8KqTDWpngbFEDW2k=;
	h=Date:From:Subject:To:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=IwS17OqvG/ZCpZ+fg6UsOZJuimhoxqYa2xg44pMbesHAHV+mDOhGimhKURsDfb3mv
	 ntbGDNqc0QLMbrOrngcRrtQwRXt8TjeQt8rX9ED+vUfpsr9NAexOYos6poe7CQoBXi
	 rvR7rVifrFz7oCFIXrlv/VYE39NnNoult93kzjQs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C8D5BF8027B;
	Wed, 28 Oct 2020 23:48:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6AB58F80249; Wed, 28 Oct 2020 23:48:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from rere.qmqm.pl (rere.qmqm.pl [91.227.64.183])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1CDF9F80134
 for <alsa-devel@alsa-project.org>; Wed, 28 Oct 2020 23:48:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1CDF9F80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=rere.qmqm.pl header.i=@rere.qmqm.pl
 header.b="VPOzHvI4"
Received: from remote.user (localhost [127.0.0.1])
 by rere.qmqm.pl (Postfix) with ESMTPSA id 4CM3d21XGFzB1;
 Wed, 28 Oct 2020 23:48:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
 t=1603925287; bh=yHK8V58DLeNnIRye/EkDqjDsAYo8KqTDWpngbFEDW2k=;
 h=Date:From:Subject:To:Cc:From;
 b=VPOzHvI4U7ef/1rEvqJRf3fdux2eJp826q9PAo1J5O4m8KX4mWV3CbinyLpt0lbAx
 Aqy+5jb0yrYvfAf4an6M8ikqvpy3hUJd7PZoQPGBI73Xh83MDgnDK9EZ4kbOOZJwJ/
 66VYSJozuKlfx1s87uEIgUJ+xBfDe8XgRn3t4+jPs0eWHVHew3Z3f9HOgKGCp7wU7V
 fMKFrmwSDoCKCMsb5j6odRdgilmk4q5zrxuby5LVgUNBGwWNXKGhGUyfdX4Hr4Ek7I
 JdJCzqEv8Sg8RTbXRESIf2Y9nAci4V04cRNsSBT2jxDiFqBhQomGUK4p5pb9VOMR3A
 TNKgvEJCIpTdA==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.102.4 at mail
Date: Wed, 28 Oct 2020 23:48:05 +0100
Message-Id: <8756eb5aac561173aa222c9cb64dd314ab1b1f9b.1603925200.git.mirq-linux@rere.qmqm.pl>
From: =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Subject: [PATCH v3 1/2] ASoC: tegra20-spdif: remove "default m"
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Stephen Warren <swarren@nvidia.com>
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

Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
Fixes: 774fec338bfc ("ASoC: Tegra: Implement SPDIF CPU DAI")
---
v3: split-off the defconfig changes
v2: add the symbol to defconfig as suggested by Thierry Reding
---
 sound/soc/tegra/Kconfig | 1 -
 1 file changed, 1 deletion(-)

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

