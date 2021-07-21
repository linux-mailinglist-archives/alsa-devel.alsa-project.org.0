Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC683D11EF
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Jul 2021 17:07:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1817A16EC;
	Wed, 21 Jul 2021 17:06:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1817A16EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626880020;
	bh=LlZsTCwo55N+RZAir1Av59XUrJ9QoPgdyfVVcThgmU0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Ute2S+6Qh0NYaFhjLfcmKua5n6WfxYi5qTrP7y19qO5XPBbCUTmLwL2RM/VCzKzDP
	 AJDiDsl98WJ0rqNae/+CA96O0+J/9U4KLgmaAEPZ8d/2fF4uP314kO21AHNKDXCiMk
	 YWLKDjc96YE64WRpT3Ppm2Rb/E4+VfGqgFy3MAjU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 63061F804AD;
	Wed, 21 Jul 2021 17:05:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 748EAF800DA; Wed, 21 Jul 2021 17:05:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 03109F800DA
 for <alsa-devel@alsa-project.org>; Wed, 21 Jul 2021 17:05:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03109F800DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="WKZDCgOB"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 19E1B60FF1;
 Wed, 21 Jul 2021 15:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626879914;
 bh=LlZsTCwo55N+RZAir1Av59XUrJ9QoPgdyfVVcThgmU0=;
 h=From:To:Cc:Subject:Date:From;
 b=WKZDCgOBjqILAGhDpdTVHkDHsrxce8rMUvBPzPZqC3HXdO83Q8ga62HWf2xGvmovt
 7jg+Y5v/9rdSQx9w9jJUsnOHWep2quxQfaVP4OYKRfhsJHaWUimWOu7iGbFeaDsjYL
 R1y/p7bPfifpppU71AMjt7JQ+vYjCcZ72UqJ1nHiCOA93IgEDuOlufjpxP4MO6JQU3
 w7/6maXf1yz+hBbvHGYaYnrZyXQmyrEMFQWoqecWo44Cw2DI3HCbCgjzpDi9nbxnOJ
 pJrdqsrwvsmBjSfyCWrkMtn1F4j1+4GqezA1TZR0wAtFYHp1fb2A0d3/+3x6Mc89on
 A5Aud3XlQad9A==
From: Arnd Bergmann <arnd@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH] ASoC: codecs: wcd938x: fix wcd module dependency
Date: Wed, 21 Jul 2021 17:04:45 +0200
Message-Id: <20210721150510.1837221-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>
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

With SND_SOC_ALL_CODECS=y and SND_SOC_WCD938X_SDW=m, there is a link
error from a reverse dependency, since the built-in codec driver calls
into the modular soundwire back-end:

x86_64-linux-ld: sound/soc/codecs/wcd938x.o: in function `wcd938x_codec_free':
wcd938x.c:(.text+0x2c0): undefined reference to `wcd938x_sdw_free'
x86_64-linux-ld: sound/soc/codecs/wcd938x.o: in function `wcd938x_codec_hw_params':
wcd938x.c:(.text+0x2f6): undefined reference to `wcd938x_sdw_hw_params'
x86_64-linux-ld: sound/soc/codecs/wcd938x.o: in function `wcd938x_codec_set_sdw_stream':
wcd938x.c:(.text+0x332): undefined reference to `wcd938x_sdw_set_sdw_stream'
x86_64-linux-ld: sound/soc/codecs/wcd938x.o: in function `wcd938x_tx_swr_ctrl':
wcd938x.c:(.text+0x23de): undefined reference to `wcd938x_swr_get_current_bank'
x86_64-linux-ld: sound/soc/codecs/wcd938x.o: in function `wcd938x_bind':
wcd938x.c:(.text+0x2579): undefined reference to `wcd938x_sdw_device_get'
x86_64-linux-ld: wcd938x.c:(.text+0x25a1): undefined reference to `wcd938x_sdw_device_get'
x86_64-linux-ld: wcd938x.c:(.text+0x262a): undefined reference to `__devm_regmap_init_sdw'

Work around this using two small hacks: An added Kconfig dependency
prevents the main driver from being built-in when soundwire support
itself is a loadable module to allow calling devm_regmap_init_sdw(),
and a Makefile trick links the wcd938x-sdw backend as built-in
if needed to solve the dependency between the two modules.

Fixes: 045442228868 ("ASoC: codecs: wcd938x: add audio routing and Kconfig")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
I saw this on -rc2, please ignore if this is already fixed
---
 sound/soc/codecs/Kconfig  | 1 +
 sound/soc/codecs/Makefile | 5 ++++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 7ebae3f09435..459deba31485 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -1558,6 +1558,7 @@ config SND_SOC_WCD934X
 
 config SND_SOC_WCD938X
 	tristate
+	depends on SOUNDWIRE || !SOUNDWIRE
 
 config SND_SOC_WCD938X_SDW
 	tristate "WCD9380/WCD9385 Codec - SDW"
diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
index de8b83dd2c76..7bb38c370842 100644
--- a/sound/soc/codecs/Makefile
+++ b/sound/soc/codecs/Makefile
@@ -583,7 +583,10 @@ obj-$(CONFIG_SND_SOC_WCD_MBHC)	+= snd-soc-wcd-mbhc.o
 obj-$(CONFIG_SND_SOC_WCD9335)	+= snd-soc-wcd9335.o
 obj-$(CONFIG_SND_SOC_WCD934X)	+= snd-soc-wcd934x.o
 obj-$(CONFIG_SND_SOC_WCD938X)	+= snd-soc-wcd938x.o
-obj-$(CONFIG_SND_SOC_WCD938X_SDW) += snd-soc-wcd938x-sdw.o
+ifdef CONFIG_SND_SOC_WCD938X_SDW
+# avoid link failure by forcing sdw code built-in when needed
+obj-$(CONFIG_SND_SOC_WCD938X) += snd-soc-wcd938x-sdw.o
+endif
 obj-$(CONFIG_SND_SOC_WL1273)	+= snd-soc-wl1273.o
 obj-$(CONFIG_SND_SOC_WM0010)	+= snd-soc-wm0010.o
 obj-$(CONFIG_SND_SOC_WM1250_EV1) += snd-soc-wm1250-ev1.o
-- 
2.29.2

