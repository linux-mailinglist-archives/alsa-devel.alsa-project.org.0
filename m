Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C2250160E07
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Feb 2020 10:06:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5D43B15E2;
	Mon, 17 Feb 2020 10:05:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5D43B15E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581930406;
	bh=DitJ539oPVArmRNNZCny1lOEoMZ3pQ59ID98M8IvMHU=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ZyAxt+7nJOM3/a9jy45+SisjXMvltPTpNdRHc8+LuDemMJ6waICM4mnJM3gnuuYLo
	 tdFI/iX2Yzvw32Ev5Bn5ifuUavjM/ni7+puOdWSRnt000hwKX2bGqDNx2cvqSUJ1YR
	 /bySzLib2Uoku3N5GNWCR8W1inPNO1/NyJ4TvJwE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6CBBDF800B6;
	Mon, 17 Feb 2020 10:05:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 44485F8013E; Fri, 14 Feb 2020 01:25:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from sdfa3.org (sdfa3.org [62.210.178.46])
 by alsa1.perex.cz (Postfix) with ESMTP id 331D6F800F0
 for <alsa-devel@alsa-project.org>; Fri, 14 Feb 2020 01:25:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 331D6F800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sdfa3.org header.i=@sdfa3.org
 header.b="PRuHjVgz"
Received: from pavo.lan (unknown [78.193.54.22])
 by sdfa3.org (Postfix) with ESMTPSA id 093862300C7D;
 Fri, 14 Feb 2020 01:25:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=sdfa3.org; s=mail;
 t=1581639913; bh=1zZw9u7suLWTXUQtbU1oGnBmVyU/Raq2e6p/FRGo27Y=;
 h=From:To:Cc:Subject:Date:From;
 b=PRuHjVgzklEC1YneTHtGQyC7Wj+fL2Iu+AEEP+5MBRE8QE1n2svir2fGNFPUfrEIc
 s8vGlDXn4QX7GEddKFCCTk+ANgeeWb6Ncre9sv0uLFKCtl0g/P+ar0hXof2QoCG8W6
 nE91bMIYvfbN8NhVR4OJtmM66l4+qbv/5pwBBMhY=
From: David Douard <david.douard@sdfa3.org>
To: alsa-devel@alsa-project.org
Date: Fri, 14 Feb 2020 01:25:05 +0100
Message-Id: <20200214002505.13112-1-david.douard@sdfa3.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 17 Feb 2020 10:05:03 +0100
Cc: David Douard <david.douard@sdfa3.org>
Subject: [alsa-devel] [PATCH] ASoC: codecs: make PCM5102A codec selectable
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

The PCM5102A codec entry in the Kconfig file lacks a title/description
to make it selectable in menuconfig (since it has no dependent i2s/spi 
sub-modules like e.g. the pcm512x one).
---
 sound/soc/codecs/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 7e90f5d83097..676fa62e9b7f 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -934,7 +934,7 @@ config SND_SOC_PCM3168A_SPI
 	select REGMAP_SPI
 
 config SND_SOC_PCM5102A
-	tristate
+	tristate "Texas Instruments PCM5102A CODEC"
 
 config SND_SOC_PCM512x
 	tristate
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
