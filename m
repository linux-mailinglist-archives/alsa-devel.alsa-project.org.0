Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EA9D72BB024
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Nov 2020 17:22:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 87EE79F6;
	Fri, 20 Nov 2020 17:22:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 87EE79F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605889370;
	bh=BHZ6nUetqig2aNv0C70O6rfOF+ARiHZiTexSCji7bWY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=O/tOCOEmZ9l1eHj29lzKUpozHd14XZCAJ2zAIl3hEPHL6i9jyXjam9ngp4kDDkpp7
	 KzYh41aa0u5hi6IOrinW8Efq15D9g2y1B0y26GRIMj9m6aKU7KVT1Xjtrtf9pawKpC
	 QBFTYnPz3NgOcRhYGtrLs/zeNQ3JHzqAeDXtBcu4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 66797F804FF;
	Fri, 20 Nov 2020 17:18:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E896FF804FD; Fri, 20 Nov 2020 17:18:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4A0C3F804FB
 for <alsa-devel@alsa-project.org>; Fri, 20 Nov 2020 17:18:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4A0C3F804FB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="qEKoIH8i"
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch
 [84.226.167.205])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6C0DA22464;
 Fri, 20 Nov 2020 16:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605889099;
 bh=BHZ6nUetqig2aNv0C70O6rfOF+ARiHZiTexSCji7bWY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qEKoIH8i5FwAd5ly1vMetYZhFMu1kpGGqVE0UUn9liC3Pi2D6HO3lIEMkW8i9iaIP
 sNmP3yJA84yDGQ6X8WBlUdXg32+sjozEnLCoNRgkwkHHoCYqRV7xID/N1XiaadZ4jB
 2FoLPoO6eL220nGxQEDKgQA4xBeZprhpFjIkGsag=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org
Subject: [PATCH 10/38] ASoC: rockchip: drop of_match_ptr from of_device_id
 table
Date: Fri, 20 Nov 2020 17:16:24 +0100
Message-Id: <20201120161653.445521-10-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201120161653.445521-1-krzk@kernel.org>
References: <20201120161653.445521-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Heiko Stuebner <heiko@sntech.de>, Takashi Iwai <tiwai@suse.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
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

The driver can match only via the DT table so the table should be always
used and the of_match_ptr does not have any sense (this also allows ACPI
matching via PRP0001, even though it is not relevant here).  This fixes
compile warning (!CONFIG_OF on x86_64):

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
index 593299675b8c..39d7ce1f53a7 100644
--- a/sound/soc/rockchip/rockchip_i2s.c
+++ b/sound/soc/rockchip/rockchip_i2s.c
@@ -714,7 +714,7 @@ static struct platform_driver rockchip_i2s_driver = {
 	.remove = rockchip_i2s_remove,
 	.driver = {
 		.name = DRV_NAME,
-		.of_match_table = of_match_ptr(rockchip_i2s_match),
+		.of_match_table = rockchip_i2s_match,
 		.pm = &rockchip_i2s_pm_ops,
 	},
 };
diff --git a/sound/soc/rockchip/rockchip_pdm.c b/sound/soc/rockchip/rockchip_pdm.c
index 5adb293d0435..171b55e4010a 100644
--- a/sound/soc/rockchip/rockchip_pdm.c
+++ b/sound/soc/rockchip/rockchip_pdm.c
@@ -614,7 +614,7 @@ static struct platform_driver rockchip_pdm_driver = {
 	.remove = rockchip_pdm_remove,
 	.driver = {
 		.name = "rockchip-pdm",
-		.of_match_table = of_match_ptr(rockchip_pdm_match),
+		.of_match_table = rockchip_pdm_match,
 		.pm = &rockchip_pdm_pm_ops,
 	},
 };
diff --git a/sound/soc/rockchip/rockchip_spdif.c b/sound/soc/rockchip/rockchip_spdif.c
index 674810851fbc..9869da7bccea 100644
--- a/sound/soc/rockchip/rockchip_spdif.c
+++ b/sound/soc/rockchip/rockchip_spdif.c
@@ -381,7 +381,7 @@ static struct platform_driver rk_spdif_driver = {
 	.remove = rk_spdif_remove,
 	.driver = {
 		.name = "rockchip-spdif",
-		.of_match_table = of_match_ptr(rk_spdif_match),
+		.of_match_table = rk_spdif_match,
 		.pm = &rk_spdif_pm_ops,
 	},
 };
-- 
2.25.1

