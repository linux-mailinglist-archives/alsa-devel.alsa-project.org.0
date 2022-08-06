Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D82258B699
	for <lists+alsa-devel@lfdr.de>; Sat,  6 Aug 2022 17:50:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4CEDF1E0;
	Sat,  6 Aug 2022 17:49:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4CEDF1E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659801024;
	bh=BGvYM5Ag7GccAAisp2HvDRdoRrDTqvw60wxQj4BDJjM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lgDifv4Li8a+JFhw69QECPXHm7BJ7pZ0zugdCHLqquhoo3J0254fvY3Uhali/VaCl
	 ka4VngdltThlN9Hk7VEHBWms5/tpWMLn2mkndvFZeRaiPMqiS3Tpk/pH48xRG37Zxp
	 OaBfxuFEWVKNhbpZV//MhukyClqyMWc89PKupt/0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BDFC5F80171;
	Sat,  6 Aug 2022 17:49:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 44C29F80155; Sat,  6 Aug 2022 17:49:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=KHOP_HELO_FCRDNS,
 NO_DNS_FOR_FROM,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp.smtpout.orange.fr (smtp08.smtpout.orange.fr
 [80.12.242.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 20D96F80100
 for <alsa-devel@alsa-project.org>; Sat,  6 Aug 2022 17:49:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 20D96F80100
Received: from pop-os.home ([90.11.190.129]) by smtp.orange.fr with ESMTPA
 id KM39oZntuGDTnKM3AobZvu; Sat, 06 Aug 2022 17:49:17 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Sat, 06 Aug 2022 17:49:17 +0200
X-ME-IP: 90.11.190.129
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH] ASoC: Fix the include guard used for include/sound/wm8904.h
Date: Sat,  6 Aug 2022 17:49:14 +0200
Message-Id: <eff524b78d1f851e3dc42999e68c286492f92b21.1659800938.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
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

__MFD_WM8994_PDATA_H__ is already used for:
  include/linux/mfd/wm8994/pdata.h

Based on file names, use __MFD_WM8904_PDATA_H__ instead here.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Not sure of if a Fixes: tag is needed.
If yes, I would use:
  9e50108668a7 ("mfd: Add initial WM8994 support")
which introduced the conflict,

even if:
 a91eb199e4dc8 ("ASoC: Initial WM8904 CODEC driver")
which introduced the typo is more logical.

No strong opinion on it.
---
 include/sound/wm8904.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/sound/wm8904.h b/include/sound/wm8904.h
index 88ac1870510e..f74293a83a17 100644
--- a/include/sound/wm8904.h
+++ b/include/sound/wm8904.h
@@ -7,8 +7,8 @@
  * Author: Mark Brown <broonie@opensource.wolfsonmicro.com>
  */
 
-#ifndef __MFD_WM8994_PDATA_H__
-#define __MFD_WM8994_PDATA_H__
+#ifndef __MFD_WM8904_PDATA_H__
+#define __MFD_WM8904_PDATA_H__
 
 /* Used to enable configuration of a GPIO to all zeros */
 #define WM8904_GPIO_NO_CONFIG 0x8000
-- 
2.34.1

