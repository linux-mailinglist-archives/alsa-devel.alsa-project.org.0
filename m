Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F2E36818E
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Apr 2021 15:36:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 30853167D;
	Thu, 22 Apr 2021 15:35:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 30853167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1619098579;
	bh=M4gtxOQ2wfWhXhavoI25WZyeG6DPnIuVBk7gtqGyo78=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=j1U0ZRF60ouvKJS1d3FxHO+wzjWFrkag37cw2ZFNgoJlfsEabz3xHIN/Hn6OMddGL
	 CtcfC6AL+BemvrKSEawutcLTYy1Yme+F7DGQUhFZhqvkg21ZYeEY2d2OcXmrKg7bCk
	 ZhR6DRuz49xeK1PrBHogxKrRP1jw24tvluCFEFFQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 77BA5F80168;
	Thu, 22 Apr 2021 15:34:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 263B5F80253; Thu, 22 Apr 2021 15:34:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C9DC4F800AE
 for <alsa-devel@alsa-project.org>; Thu, 22 Apr 2021 15:34:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C9DC4F800AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="mHy/NX6b"
Received: by mail.kernel.org (Postfix) with ESMTPSA id BD1316145B;
 Thu, 22 Apr 2021 13:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619098467;
 bh=M4gtxOQ2wfWhXhavoI25WZyeG6DPnIuVBk7gtqGyo78=;
 h=From:To:Cc:Subject:Date:From;
 b=mHy/NX6btZoxdSzXT9qQFFWD3SKtJBkyd015oGHWEHuLQs8GNJqR8aRVljaqly5ue
 L0Lvjo05BLOQou6rYdE0Dg2izYCtRDrhxFmNGqNrz4Le5fmy4MIX9gBJANIP3UPqTn
 vqYOc43kD54cH1Ly1AEqwmsNbrD9oIXFswALdb6pgmeUFFFHR5Izk5Uf0hIWR5ZTwG
 fxWLlbyxF5rOJQYIU0zDHqIGJNAooSECH/Pq0/3YrWPtAKTo/qng8wb3mAdP7qs1Xc
 VdA6CDlNut/7agw2uWAJEnKWV7mQFzIwkRxlLYSCICrKSJKshDcL2tAvSIGcOu99cX
 YVPqx1LbLFBxw==
From: Arnd Bergmann <arnd@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH] ASoC: tegra: mark runtime-pm functions as __maybe_unused
Date: Thu, 22 Apr 2021 15:34:00 +0200
Message-Id: <20210422133418.1757893-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Arnd Bergmann <arnd@arndb.de>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>, Qiushi Wu <wu000273@umn.edu>,
 linux-tegra@vger.kernel.org
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

From: Arnd Bergmann <arnd@arndb.de>

A reorganization of the driver source led to two of them causing
a compile time warning in some configurations:

tegra/tegra20_spdif.c:36:12: error: 'tegra20_spdif_runtime_resume' defined but not used [-Werror=unused-function]
   36 | static int tegra20_spdif_runtime_resume(struct device *dev)
      |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
tegra/tegra20_spdif.c:27:12: error: 'tegra20_spdif_runtime_suspend' defined but not used [-Werror=unused-function]
   27 | static int tegra20_spdif_runtime_suspend(struct device *dev)
      |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
tegra/tegra30_ahub.c:64:12: error: 'tegra30_ahub_runtime_resume' defined but not used [-Werror=unused-function]
   64 | static int tegra30_ahub_runtime_resume(struct device *dev)
      |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
tegra/tegra30_ahub.c:43:12: error: 'tegra30_ahub_runtime_suspend' defined but not used [-Werror=unused-function]
   43 | static int tegra30_ahub_runtime_suspend(struct device *dev)
      |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~

Mark these functions as __maybe_unused to avoid this kind of warning.

Fixes: b5571449e618 ("ASoC: tegra30: ahub: Remove handing of disabled runtime PM")
Fixes: c53b396f0dd4 ("ASoC: tegra20: spdif: Remove handing of disabled runtime PM")
Fixes: 80ec4a4cb36d ("ASoC: tegra20: i2s: Remove handing of disabled runtime PM")
Fixes: b5f6f781fcb2 ("ASoC: tegra30: i2s: Remove handing of disabled runtime PM")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 sound/soc/tegra/tegra20_i2s.c   | 4 ++--
 sound/soc/tegra/tegra20_spdif.c | 4 ++--
 sound/soc/tegra/tegra30_ahub.c  | 4 ++--
 sound/soc/tegra/tegra30_i2s.c   | 4 ++--
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/soc/tegra/tegra20_i2s.c b/sound/soc/tegra/tegra20_i2s.c
index 1b27f81c10fe..b280ebd72591 100644
--- a/sound/soc/tegra/tegra20_i2s.c
+++ b/sound/soc/tegra/tegra20_i2s.c
@@ -34,7 +34,7 @@
 
 #define DRV_NAME "tegra20-i2s"
 
-static int tegra20_i2s_runtime_suspend(struct device *dev)
+static __maybe_unused int tegra20_i2s_runtime_suspend(struct device *dev)
 {
 	struct tegra20_i2s *i2s = dev_get_drvdata(dev);
 
@@ -45,7 +45,7 @@ static int tegra20_i2s_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static int tegra20_i2s_runtime_resume(struct device *dev)
+static __maybe_unused int tegra20_i2s_runtime_resume(struct device *dev)
 {
 	struct tegra20_i2s *i2s = dev_get_drvdata(dev);
 	int ret;
diff --git a/sound/soc/tegra/tegra20_spdif.c b/sound/soc/tegra/tegra20_spdif.c
index 7b597ee63cb5..de698ff2a69c 100644
--- a/sound/soc/tegra/tegra20_spdif.c
+++ b/sound/soc/tegra/tegra20_spdif.c
@@ -24,7 +24,7 @@
 
 #define DRV_NAME "tegra20-spdif"
 
-static int tegra20_spdif_runtime_suspend(struct device *dev)
+static __maybe_unused int tegra20_spdif_runtime_suspend(struct device *dev)
 {
 	struct tegra20_spdif *spdif = dev_get_drvdata(dev);
 
@@ -33,7 +33,7 @@ static int tegra20_spdif_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static int tegra20_spdif_runtime_resume(struct device *dev)
+static __maybe_unused int tegra20_spdif_runtime_resume(struct device *dev)
 {
 	struct tegra20_spdif *spdif = dev_get_drvdata(dev);
 	int ret;
diff --git a/sound/soc/tegra/tegra30_ahub.c b/sound/soc/tegra/tegra30_ahub.c
index d1718f3af3cd..4692c70ed933 100644
--- a/sound/soc/tegra/tegra30_ahub.c
+++ b/sound/soc/tegra/tegra30_ahub.c
@@ -40,7 +40,7 @@ static inline void tegra30_audio_write(u32 reg, u32 val)
 	regmap_write(ahub->regmap_ahub, reg, val);
 }
 
-static int tegra30_ahub_runtime_suspend(struct device *dev)
+static __maybe_unused int tegra30_ahub_runtime_suspend(struct device *dev)
 {
 	regcache_cache_only(ahub->regmap_apbif, true);
 	regcache_cache_only(ahub->regmap_ahub, true);
@@ -61,7 +61,7 @@ static int tegra30_ahub_runtime_suspend(struct device *dev)
  * stopping streams should dynamically adjust the clock as required.  However,
  * this is not yet implemented.
  */
-static int tegra30_ahub_runtime_resume(struct device *dev)
+static __maybe_unused int tegra30_ahub_runtime_resume(struct device *dev)
 {
 	int ret;
 
diff --git a/sound/soc/tegra/tegra30_i2s.c b/sound/soc/tegra/tegra30_i2s.c
index 8730ffa0f691..36344f0a64c1 100644
--- a/sound/soc/tegra/tegra30_i2s.c
+++ b/sound/soc/tegra/tegra30_i2s.c
@@ -36,7 +36,7 @@
 
 #define DRV_NAME "tegra30-i2s"
 
-static int tegra30_i2s_runtime_suspend(struct device *dev)
+static __maybe_unused int tegra30_i2s_runtime_suspend(struct device *dev)
 {
 	struct tegra30_i2s *i2s = dev_get_drvdata(dev);
 
@@ -47,7 +47,7 @@ static int tegra30_i2s_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static int tegra30_i2s_runtime_resume(struct device *dev)
+static __maybe_unused int tegra30_i2s_runtime_resume(struct device *dev)
 {
 	struct tegra30_i2s *i2s = dev_get_drvdata(dev);
 	int ret;
-- 
2.29.2

