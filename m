Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D917F48033
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jun 2019 13:06:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 518A31729;
	Mon, 17 Jun 2019 13:05:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 518A31729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560769580;
	bh=2FEdqnRsacrhIPbf3NoHpya7mCPGbx4G1gZ0Qddy0rs=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=TYrRvfqRhVhxMyUvktHzNsuCeHjnQ6bMx9zwAbrnyAqdsbLUTrOdvI2O45cnTKb5I
	 mZzerkuCTyprKzFuKHx4NWF/gw/U9Jxz2sgXpcBke2rby7AIFVm8INO9dqOvJty5W8
	 RAKT3w76C3F1XUybPl7/mQHjBHUhF2V0Y0N3EZGk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 44DB2F896C7;
	Mon, 17 Jun 2019 13:04:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 29887F896C7; Mon, 17 Jun 2019 13:04:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H2,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A47D6F89682
 for <alsa-devel@alsa-project.org>; Mon, 17 Jun 2019 13:04:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A47D6F89682
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.145]) with ESMTPA (Nemesis) id
 1Mj8eB-1iFAr734RJ-00fBNP; Mon, 17 Jun 2019 13:04:24 +0200
From: Arnd Bergmann <arnd@arndb.de>
To: Mark Brown <broonie@kernel.org>
Date: Mon, 17 Jun 2019 13:03:51 +0200
Message-Id: <20190617110415.2084205-1-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:RQUeaFNGGn1EAUOJ+4Zq3U9Xg93dFdoGITN3ZKm3Mt4YbKTsksr
 /Nb5nKnunoTBlLqFGpZWA9oXu9HPZ4ooTs1PKfIUNNUH5c8OdpM9y5ix03RPi90uP8mhFUV
 9sef2XlRxJsu4Em1+4Jl7xTmRcNS727kWov9tH/9ugCaLfPF+pyKE/2opwfYI1/uTAULabq
 C5OfVG/T7vycW0msxCGig==
X-UI-Out-Filterresults: notjunk:1;V03:K0:TgeddKwT1bQ=:+0nAmfdfN0DrHy0szFSDxd
 E97/qsS1VXgSEQ9Kd9UM8LUmS2rDvT8u8ENSePmCM8L5TPoigst9b5PpOt5gQXY4w/6/k2vdi
 GPlMTAQjWQxxHAqcUyyrFwNr0A7jljiNSZ4XPoTUTSHp4P8mYysAR4i4kVQrTuWSqtpcshFAx
 frleG1h6TqhiR3kn/x6UQhrQlpJwKeiXqQSjicC5pldL/n3LULCpGxPuwoGnz9UHMLHA8u8vY
 /K1ftN31dtrN73VQ+S7TsxRcjiD5c1JRn93SdwhuFs0cAF0BS2xmBdzcX+M5Y3QH5t4hau+ug
 RnKA/CzG9cS1KOVvA/sfahClyagQHFGXk9ZKHark+8g/7E0EJ5lQSsbRlUL1np++MmiwP6Z90
 eTezWa9VSrMf1PzATR8+/V7X/OmPlwDjJxbSh4hwYKXbhIKWgAsF2Dx0Himn6AUOdBVaAPTkC
 agTTz1y0ppeyET6Vd5JHfjc9a8SnYJph9o0Y+mLvjyxp6VMvemow0EMxGeIR4C1wdpwI4WC4w
 7ADR9bijyRaq4WT/0OLwqdeFQ7M2uVHMqd3e4J9B9q1E5dH3gHnPV09SAmC++ybSYOjA9MIIL
 tdG8aPKFXJDyEnH9SiUWWzlu1rixOSpRQo8e2fseE6D8GmQVz6CnJJCmJRHnDwE16yfU4dJX7
 JKGaLRDElTyJ/ehi37iXnQAULGay4vAx+KpY2/tvxZH+wixT05wCB93gM6RfdxNk2/+c3sgdC
 ikEUF7R9U1+VpjOcGVmdFJ579sUlQGHYws5bFQ==
Cc: alsa-devel@alsa-project.org, Heiko Stuebner <heiko@sntech.de>,
 Arnd Bergmann <arnd@arndb.de>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Sugar Zhang <sugar.zhang@rock-chips.com>,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] [PATCH] ASoC: rockchip: pdm: select CONFIG_RATIONAL
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Without this, we get a link error:

sound/soc/rockchip/rockchip_pdm.o: In function `rockchip_pdm_hw_params':
rockchip_pdm.c:(.text+0x754): undefined reference to `rational_best_approximation'

Fixes: 624e8e00acaf ("ASoC: rockchip: pdm: fixup pdm fractional div")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 sound/soc/rockchip/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/rockchip/Kconfig b/sound/soc/rockchip/Kconfig
index 28a80c1cb41d..b43657e6e655 100644
--- a/sound/soc/rockchip/Kconfig
+++ b/sound/soc/rockchip/Kconfig
@@ -20,6 +20,7 @@ config SND_SOC_ROCKCHIP_PDM
 	tristate "Rockchip PDM Controller Driver"
 	depends on CLKDEV_LOOKUP && SND_SOC_ROCKCHIP
 	select SND_SOC_GENERIC_DMAENGINE_PCM
+	select RATIONAL
 	help
 	  Say Y or M if you want to add support for PDM driver for
 	  Rockchip PDM Controller. The Controller supports up to maximum of
-- 
2.20.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
