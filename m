Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB9F1FDC21
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Jun 2020 03:17:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 599F4169E;
	Thu, 18 Jun 2020 03:16:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 599F4169E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592443026;
	bh=rGnkqzOklVdCYmtctnndT4Xj7oX+ndcWZlmsfC9t1nQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hqL4cuihlNGJfCwhVz+36OqDNYefsHVuBB5gHflVw6m+wPBStvXhyDIDyqHTNVjLm
	 bH6IdQ/kfDugplIIHBJPp8sNsGS197UbU/ieJi0daBu7ACsoiG5jVKZTQZk9A1rNLY
	 9TzHsl5XFboVDpbngY2Tt/ZjmubfxuMuN0Yb/wwY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1E1D2F802D2;
	Thu, 18 Jun 2020 03:11:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 223F7F8031A; Thu, 18 Jun 2020 03:11:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A9D15F80271
 for <alsa-devel@alsa-project.org>; Thu, 18 Jun 2020 03:11:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9D15F80271
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="XthIOUjf"
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7A996214DB;
 Thu, 18 Jun 2020 01:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592442659;
 bh=rGnkqzOklVdCYmtctnndT4Xj7oX+ndcWZlmsfC9t1nQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XthIOUjfoIfJn6EEqPux7QG7JwkqZfGdn+/wGnDRJPEInZF/cWZDcQcTlF7bzDKUU
 lxngtltCsXXcyha2RZ9bp/ztAhov6zmJqxEsKlcQ6x1qw+JvgUk01xemNosPy3SeD2
 +LzRT9+0CI1BfwT+k36G5YrYU7olLOducGLhOQXM=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.7 130/388] ASoC: Fix wrong dependency of da7210 and
 wm8983
Date: Wed, 17 Jun 2020 21:03:47 -0400
Message-Id: <20200618010805.600873-130-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200618010805.600873-1-sashal@kernel.org>
References: <20200618010805.600873-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, Wei Li <liwei391@huawei.com>
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

From: Wei Li <liwei391@huawei.com>

[ Upstream commit c1c050ee74d67aeb879fd38e3a07139d7fdb79f4 ]

As these two drivers support I2C and SPI, we should add the SND_SOC_I2C_AND_SPI
dependency instead.

Fixes: ce0c97f8a2936 ("ASoC: Fix SND_SOC_ALL_CODECS imply SPI fallout")
Signed-off-by: Wei Li <liwei391@huawei.com>
Link: https://lore.kernel.org/r/20200420202410.47327-3-liwei391@huawei.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 8cdc68c141dc..7d2cbed55a9d 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -717,7 +717,7 @@ config SND_SOC_L3
 
 config SND_SOC_DA7210
 	tristate
-	depends on I2C
+	depends on SND_SOC_I2C_AND_SPI
 
 config SND_SOC_DA7213
 	tristate "Dialog DA7213 CODEC"
@@ -1569,7 +1569,7 @@ config SND_SOC_WM8978
 
 config SND_SOC_WM8983
 	tristate
-	depends on I2C
+	depends on SND_SOC_I2C_AND_SPI
 
 config SND_SOC_WM8985
 	tristate "Wolfson Microelectronics WM8985 and WM8758 codec driver"
-- 
2.25.1

