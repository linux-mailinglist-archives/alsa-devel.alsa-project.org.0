Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 299F17E068D
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Nov 2023 17:29:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A79E4A4B;
	Fri,  3 Nov 2023 17:28:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A79E4A4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699028977;
	bh=sQ38kshLYACTrXrWVRjogfck8npKBiMFbq8d63/p4PA=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ACswwinbRf68ghBea7itsxoetOmJBhJ7An0d/aMdN390Q4jP6qgsApdfXI/hs9Ohm
	 SFjZv13+qQ5bSRdn/cqubyeziSq6BOwZfjcKbNv2I2nEjYo7g+xYgLGXx0vYTi0YLx
	 de1FPaNIWC93hobd9YSIXbxby3trcJZuEHm6dqNA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1B383F805E0; Fri,  3 Nov 2023 17:26:36 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 35B12F805E8;
	Fri,  3 Nov 2023 17:26:36 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 93B42F80290; Thu,  2 Nov 2023 16:20:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mx.skole.hr (mx1.hosting.skole.hr [161.53.165.185])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BC0BAF80152
	for <alsa-devel@alsa-project.org>; Thu,  2 Nov 2023 16:20:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BC0BAF80152
Received: from mx1.hosting.skole.hr (localhost.localdomain [127.0.0.1])
	by mx.skole.hr (mx.skole.hr) with ESMTP id A56FD83FE9;
	Thu,  2 Nov 2023 16:20:48 +0100 (CET)
From: =?UTF-8?q?Duje=20Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	=?UTF-8?q?Duje=20Mihanovi=C4=87?= <duje.mihanovic@skole.hr>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Leo Yan <leoy@marvell.com>,
	Zhangfei Gao <zhangfei.gao@marvell.com>,
	Lubomir Rintel <lkundrak@v3.sk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Kees Cook <keescook@chromium.org>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G . Piccoli" <gpiccoli@igalia.com>
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-hardening@vger.kernel.org,
	phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	Karel Balej <balejk@matfyz.cz>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH v7 06/10] ASoC: pxa: Suppress SSPA on ARM64
Date: Thu,  2 Nov 2023 16:20:29 +0100
Message-ID: <20231102152033.5511-1-duje.mihanovic@skole.hr>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MailFrom: duje.mihanovic@skole.hr
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: AMTEZJSICP43HUCT27PLF5VJGIES7BOA
X-Message-ID-Hash: AMTEZJSICP43HUCT27PLF5VJGIES7BOA
X-Mailman-Approved-At: Fri, 03 Nov 2023 16:26:08 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AMTEZJSICP43HUCT27PLF5VJGIES7BOA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The SSPA driver currently seems to generate ARM32 assembly, which causes
build errors when building a kernel for an ARM64 ARCH_MMP platform.

Fixes: fa375d42f0e5 ("ASoC: mmp: add sspa support")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202310230518.zs9Qpg3j-lkp@intel.com/
Signed-off-by: Duje Mihanović <duje.mihanovic@skole.hr>
---
 sound/soc/pxa/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/pxa/Kconfig b/sound/soc/pxa/Kconfig
index e6bca9070953..8ebce669e4a7 100644
--- a/sound/soc/pxa/Kconfig
+++ b/sound/soc/pxa/Kconfig
@@ -33,7 +33,7 @@ config SND_PXA_SOC_SSP
 
 config SND_MMP_SOC_SSPA
 	tristate "SoC Audio via MMP SSPA ports"
-	depends on ARCH_MMP
+	depends on ARCH_MMP && ARM
 	select SND_SOC_GENERIC_DMAENGINE_PCM
 	select SND_ARM
 	help
-- 
2.42.0


