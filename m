Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B37396DB2
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Jun 2021 09:03:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 75E691697;
	Tue,  1 Jun 2021 09:02:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 75E691697
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622530981;
	bh=Tqxsu9Vh460p022HOR0t9dgwtouNeW+PMQjt3/XgdL8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=CQF2U7ViLCLiDPMLyoKsK/IApD/6wzPxVkpYl+Z69n+vvOHwgkZuwYP4ovCsa6usT
	 sM8rSXqVvd88Z/V1kiJECCyH7Jqhs9AleklxQo7kcComz6TbBiR4cCbIf+C3g8IB8E
	 me4rcH+xj7T9om+WymOnBFMfLHfSBcLIyD7onE1g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 11C9BF80141;
	Tue,  1 Jun 2021 09:01:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6EE7AF80169; Sat, 29 May 2021 20:50:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from toothrot.meleeweb.net (toothrot.meleeweb.net [62.210.131.231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CE56AF8013A
 for <alsa-devel@alsa-project.org>; Sat, 29 May 2021 20:50:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE56AF8013A
Received: from [80.111.226.61] (port=55984 helo=lady-voodoo.local)
 by toothrot.meleeweb.net with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
 id 1ln42R-000bkg-C6; Sat, 29 May 2021 20:50:23 +0200
From: Bertrand Jacquin <bertrand@jacquin.bzh>
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 pierre-louis.bossart@linux.intel.com, srinivas.kandagatla@linaro.org,
 alexandre.belloni@bootlin.com
Subject: [PATCH] ASoC: snd-soc-lpass requires REGMAP_MMIO
Date: Sat, 29 May 2021 19:49:57 +0100
Message-Id: <20210529184957.373232-1-bertrand@jacquin.bzh>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 01 Jun 2021 09:01:32 +0200
Cc: alsa-devel@alsa-project.org
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

With CONFIG_SND_SOC_LPASS_RX_MACRO=m and CONFIG_REGMAP_MMIO undefined,
build fails with the following error

  make -f /var/tmp/portage/sys-kernel/stable-sources-5.12.8/work/linux-5.12.8-stable/scripts/Makefile.modpost
    sed 's/\.ko$/\.o/' modules.order | scripts/mod/modpost   -E  -o modules-only.symvers -i vmlinux.symvers   -T -
  ERROR: modpost: "__devm_regmap_init_mmio_clk" [sound/soc/codecs/snd-soc-lpass-rx-macro.ko] undefined!

This does also apply to other Qualcomm Macro LPASS all making call to
devm_regmap_init_mmio()
---
 sound/soc/codecs/Kconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 1c87b42606c9..f5614f47f44d 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -1824,18 +1824,22 @@ config SND_SOC_TPA6130A2
 
 config SND_SOC_LPASS_WSA_MACRO
 	depends on COMMON_CLK
+	select REGMAP_MMIO
 	tristate "Qualcomm WSA Macro in LPASS(Low Power Audio SubSystem)"
 
 config SND_SOC_LPASS_VA_MACRO
 	depends on COMMON_CLK
+	select REGMAP_MMIO
 	tristate "Qualcomm VA Macro in LPASS(Low Power Audio SubSystem)"
 
 config SND_SOC_LPASS_RX_MACRO
 	depends on COMMON_CLK
+	select REGMAP_MMIO
 	tristate "Qualcomm RX Macro in LPASS(Low Power Audio SubSystem)"
 
 config SND_SOC_LPASS_TX_MACRO
 	depends on COMMON_CLK
+	select REGMAP_MMIO
 	tristate "Qualcomm TX Macro in LPASS(Low Power Audio SubSystem)"
 
 endmenu
