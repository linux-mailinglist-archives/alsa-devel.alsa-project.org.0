Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D505D749B0E
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Jul 2023 13:44:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 054B0203;
	Thu,  6 Jul 2023 13:43:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 054B0203
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688643866;
	bh=ktJo01LsD6QStJzrlw+pWxwDMZrFWbHnwYUoORFYSJY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KL0hrXxYRWpBz95lSc2ZZy0KwJZY9uDdFQZUAIyC8MTMeGgMSTXlSaaJqy+2307Ea
	 641K6Vpt+fbg6uaX662Bby9P8ZP4hp4kiT7tXf51DtY8tWq0C9o7rluV94gdIL6jBT
	 /FBH3ce7ZMJ1nzYG2JEdX+B0FKS2vYl4/YoTQl5Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 38851F8057D; Thu,  6 Jul 2023 13:42:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DA9D0F80579;
	Thu,  6 Jul 2023 13:42:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 28BB9F8057A; Thu,  6 Jul 2023 13:42:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6D044F80100
	for <alsa-devel@alsa-project.org>; Thu,  6 Jul 2023 13:42:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6D044F80100
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:5979:7b6f:39a:b9cb])
	by laurent.telenet-ops.be with bizsmtp
	id Hni62A00545Xpxs01ni6hb; Thu, 06 Jul 2023 13:42:08 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1qHNN3-000fay-Ik;
	Thu, 06 Jul 2023 13:42:06 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1qHNN7-000QkN-Ut;
	Thu, 06 Jul 2023 13:42:05 +0200
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Mark Brown <broonie@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Benjamin Gray <bgray@linux.ibm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 3/3] ASoC: codecs: SND_SOC_WCD934X should select REGMAP_IRQ
Date: Thu,  6 Jul 2023 13:42:04 +0200
Message-Id: 
 <cafd878747e7951914a7d9fea33788a4a230d1f0.1688643442.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688643442.git.geert@linux-m68k.org>
References: <cover.1688643442.git.geert@linux-m68k.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ROEJG4O5M2SVRHS65B7SQII7MYNJHCMU
X-Message-ID-Hash: ROEJG4O5M2SVRHS65B7SQII7MYNJHCMU
X-MailFrom: geert@linux-m68k.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ROEJG4O5M2SVRHS65B7SQII7MYNJHCMU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

If CONFIG_SND_SOC_WCD934X=y, CONFIG_COMPILE_TEST=y,
CONFIG_MFD_WCD934X=n, CONFIG_REGMAP_IRQ=n:

    aarch64-linux-gnu-ld: sound/soc/codecs/wcd934x.o: in function `wcd934x_codec_probe':
    wcd934x.c:(.text+0x33cc): undefined reference to `regmap_irq_get_virq'
    aarch64-linux-gnu-ld: sound/soc/codecs/wcd934x.o: in function `wcd934x_comp_probe':
    wcd934x.c:(.text+0x4cb0): undefined reference to `regmap_irq_get_virq'
    aarch64-linux-gnu-ld: wcd934x.c:(.text+0x4cc0): undefined reference to `regmap_irq_get_virq'
    aarch64-linux-gnu-ld: wcd934x.c:(.text+0x4cd0): undefined reference to `regmap_irq_get_virq'
    aarch64-linux-gnu-ld: wcd934x.c:(.text+0x4ce0): undefined reference to `regmap_irq_get_virq'
    aarch64-linux-gnu-ld: sound/soc/codecs/wcd934x.o:wcd934x.c:(.text+0x4cf0): more undefined references to `regmap_irq_get_virq' follow

Fix this by making SND_SOC_WCD934X select REGMAP_IRQ.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 sound/soc/codecs/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 2a62dbd5339e4a3a..958499050c8b6a3f 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -1942,6 +1942,7 @@ config SND_SOC_WCD934X
 	tristate "WCD9340/WCD9341 Codec"
 	depends on COMMON_CLK
 	depends on SLIMBUS
+	select REGMAP_IRQ
 	select REGMAP_SLIMBUS
 	select SND_SOC_WCD_MBHC
 	depends on MFD_WCD934X || COMPILE_TEST
-- 
2.34.1

