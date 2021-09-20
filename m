Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A3F411286
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Sep 2021 12:03:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EBD7B1662;
	Mon, 20 Sep 2021 12:02:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EBD7B1662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632132222;
	bh=z0yF78RdBg7hKlSTk5BKsjKH8v+YlV3IKCN8scl8+PA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GgYW67tVotmkwbBy9MM/mocX7Dabv2dMtgcLBpeWacsl86kFmTbQU9xPuoPRSyTiE
	 ZGvkM7pkQ45XgJF6cjt/G9LRgR2hNo/uNIQiglipv+j1Z1a5/bI9WnIi8k5/hDlROM
	 NSSmsgHMaQLx6XpHsbfJmtHbhtmxn3BDjFacKePo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0FB2BF80246;
	Mon, 20 Sep 2021 12:02:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E074EF8025D; Mon, 20 Sep 2021 12:02:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8EEE1F80124
 for <alsa-devel@alsa-project.org>; Mon, 20 Sep 2021 12:02:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8EEE1F80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="It7WL4Jo"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 65C8C60240;
 Mon, 20 Sep 2021 10:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632132130;
 bh=z0yF78RdBg7hKlSTk5BKsjKH8v+YlV3IKCN8scl8+PA=;
 h=From:To:Cc:Subject:Date:From;
 b=It7WL4JobI3VYNZiMpQb3/orFfG9CEejphtd8OJuPHG2srcIB+ZJSwoIw/xnznw09
 Bm0bk1XPN8soXvom2a8nhGwUtGCFQRiXwyxAjh5j5znRvGzInCXjI2E4b48LU7h0pt
 m/V3Ex929pBT4rqU2LjvrccEi+vu8H3vCKf/7hMD2r76Q5fFUZFOa+BZxmjyz78S/3
 XpCan3VqcvbftRlNYSm+Uu1eN7YKqY55ba6y+802zo2BoQrKw/dqpoH2tUBFuvabv7
 umiTId0YNGfsHxcxYA2fQNL6BNtJvmpfvzJSW3GAHP60H0k+uZWKRRWaV34kF1FtWB
 344zktGw3md5Q==
From: Arnd Bergmann <arnd@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Trevor Wu <trevor.wu@mediatek.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] ASoC: mediatek: mt8195: force COMMON_CLK dependency
Date: Mon, 20 Sep 2021 12:01:58 +0200
Message-Id: <20210920100206.1418649-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 Tzung-Bi Shih <tzungbi@google.com>, linux-mediatek@lists.infradead.org,
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

From: Arnd Bergmann <arnd@arndb.de>

Without CONFIG_COMMON_CLK, this driver fails to link:

ERROR: modpost: "clk_unregister_gate" [sound/soc/mediatek/mt8195/snd-soc-mt8195-afe.ko] undefined!
ERROR: modpost: "clk_register_gate" [sound/soc/mediatek/mt8195/snd-soc-mt8195-afe.ko] undefined!

Add the proper Kconfig dependency for compile testing.

Fixes: 6746cc858259 ("ASoC: mediatek: mt8195: add platform driver")
Fixes: 940ffa194547 ("ASoC: mediatek: SND_SOC_MT8195 should depend on ARCH_MEDIATEK")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 sound/soc/mediatek/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/Kconfig b/sound/soc/mediatek/Kconfig
index 5a2f4667d50b..268c1f74aa3e 100644
--- a/sound/soc/mediatek/Kconfig
+++ b/sound/soc/mediatek/Kconfig
@@ -187,7 +187,7 @@ config SND_SOC_MT8192_MT6359_RT1015_RT5682
 
 config SND_SOC_MT8195
 	tristate "ASoC support for Mediatek MT8195 chip"
-	depends on ARCH_MEDIATEK || COMPILE_TEST
+	depends on ARCH_MEDIATEK || (COMPILE_TEST && COMMON_CLK)
 	select SND_SOC_MEDIATEK
 	help
 	  This adds ASoC platform driver support for Mediatek MT8195 chip
-- 
2.29.2

