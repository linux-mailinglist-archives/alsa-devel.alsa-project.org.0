Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C162C45EB
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Nov 2020 17:51:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 17D1E1778;
	Wed, 25 Nov 2020 17:50:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 17D1E1778
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606323071;
	bh=odQNM+XbPMNEcW21zUeTrff3YIHJk7qUR6RFH1Cl5cY=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JzmmdaPj+m++pc5S2poZdwkxjyWMC1LMwjOythsNlJOGKOC7p7TdDeS8QxFgeNnxy
	 OpZeQUX2RRUOYc3VFJu+Zpj1PaXFA0x24QXwQlCaPCvgk+045L6rFfwjZ4tj8LfGxB
	 ubQo2OMQ4ridjGwt+hjKvlTxFeI7coH1bCoKbvoM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EDE30F80520;
	Wed, 25 Nov 2020 17:46:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AC7CCF8051F; Wed, 25 Nov 2020 17:46:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2E645F80519
 for <alsa-devel@alsa-project.org>; Wed, 25 Nov 2020 17:46:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E645F80519
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="KR8QlEvl"
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch
 [84.226.167.205])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3A0BB20857;
 Wed, 25 Nov 2020 16:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606322759;
 bh=odQNM+XbPMNEcW21zUeTrff3YIHJk7qUR6RFH1Cl5cY=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=KR8QlEvl/Gb/YFhHRR9Y5RV+ct0WXUN//0AkVjSNxIZbruMGjwJKiGtPKgsVAKiIZ
 B9t8NjINT1cY9oSr1B1k80hvIiSVcTYTZb7/1PIfIOblgHBqEQz5Qc0bg8tQfN7IRD
 AHykT+7rt3lxAJZkQNo+QrqAIwnQqS2VeTGXkO4s=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Support Opensource <support.opensource@diasemi.com>,
 Oder Chiou <oder_chiou@realtek.com>,
 Kevin Cernekee <cernekee@chromium.org>,
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Patrick Lai <plai@codeaurora.org>,
 Banajit Goswami <bgoswami@codeaurora.org>,
 Heiko Stuebner <heiko@sntech.de>, Krzysztof Kozlowski <krzk@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org
Subject: [PATCH v2 11/39] ASoC: rockchip: mark OF related data as maybe unused
Date: Wed, 25 Nov 2020 17:44:24 +0100
Message-Id: <20201125164452.89239-12-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201125164452.89239-1-krzk@kernel.org>
References: <20201125164452.89239-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

The driver can be compile tested with !CONFIG_OF making certain data
unused:

  sound/soc/rockchip/rockchip_i2s.c:569:34: warning: ‘rockchip_i2s_match’ defined but not used [-Wunused-const-variable=]
  sound/soc/rockchip/rockchip_pdm.c:463:34: warning: ‘rockchip_pdm_match’ defined but not used [-Wunused-const-variable=]
  sound/soc/rockchip/rockchip_spdif.c:44:34: warning: ‘rk_spdif_match’ defined but not used [-Wunused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 sound/soc/rockchip/rockchip_i2s.c   | 2 +-
 sound/soc/rockchip/rockchip_pdm.c   | 2 +-
 sound/soc/rockchip/rockchip_spdif.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_i2s.c b/sound/soc/rockchip/rockchip_i2s.c
index 593299675b8c..eae287d905eb 100644
--- a/sound/soc/rockchip/rockchip_i2s.c
+++ b/sound/soc/rockchip/rockchip_i2s.c
@@ -566,7 +566,7 @@ static const struct rk_i2s_pins rk3399_i2s_pins = {
 	.shift = 11,
 };
 
-static const struct of_device_id rockchip_i2s_match[] = {
+static const struct of_device_id rockchip_i2s_match[] __maybe_unused = {
 	{ .compatible = "rockchip,rk3066-i2s", },
 	{ .compatible = "rockchip,rk3188-i2s", },
 	{ .compatible = "rockchip,rk3288-i2s", },
diff --git a/sound/soc/rockchip/rockchip_pdm.c b/sound/soc/rockchip/rockchip_pdm.c
index 5adb293d0435..e5f732747f71 100644
--- a/sound/soc/rockchip/rockchip_pdm.c
+++ b/sound/soc/rockchip/rockchip_pdm.c
@@ -460,7 +460,7 @@ static const struct regmap_config rockchip_pdm_regmap_config = {
 	.cache_type = REGCACHE_FLAT,
 };
 
-static const struct of_device_id rockchip_pdm_match[] = {
+static const struct of_device_id rockchip_pdm_match[] __maybe_unused = {
 	{ .compatible = "rockchip,pdm",
 	  .data = (void *)RK_PDM_RK3229 },
 	{ .compatible = "rockchip,px30-pdm",
diff --git a/sound/soc/rockchip/rockchip_spdif.c b/sound/soc/rockchip/rockchip_spdif.c
index 674810851fbc..ffb4ec306441 100644
--- a/sound/soc/rockchip/rockchip_spdif.c
+++ b/sound/soc/rockchip/rockchip_spdif.c
@@ -41,7 +41,7 @@ struct rk_spdif_dev {
 	struct regmap *regmap;
 };
 
-static const struct of_device_id rk_spdif_match[] = {
+static const struct of_device_id rk_spdif_match[] __maybe_unused = {
 	{ .compatible = "rockchip,rk3066-spdif",
 	  .data = (void *)RK_SPDIF_RK3066 },
 	{ .compatible = "rockchip,rk3188-spdif",
-- 
2.25.1

