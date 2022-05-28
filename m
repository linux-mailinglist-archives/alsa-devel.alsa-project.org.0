Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB8A536B88
	for <lists+alsa-devel@lfdr.de>; Sat, 28 May 2022 10:00:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 97A52182D;
	Sat, 28 May 2022 09:59:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 97A52182D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653724843;
	bh=T8XSks9iAm2nfA19M+5tvgvY/Jznz8+ZpSjfLLmaWC8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Lom0rQQMyubXIPPh3YOdfW3MgcB6opb4X5p/qTDJQZyBpSJPNEQ/olzIfh2fj6tjZ
	 pn57/xyQBJ7nsj4fAO4yhpWT+kb4p4X7i94VytLXU6cYdeqOweIZvV6oBv2tlfpmoe
	 VD7KtVMBcOcSHKmpioDsIfBewj8RYbwR1lX579ac=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 06F58F802DB;
	Sat, 28 May 2022 09:59:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2437EF80279; Sat, 28 May 2022 09:59:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtp.smtpout.orange.fr (smtp04.smtpout.orange.fr
 [80.12.242.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E0955F80124
 for <alsa-devel@alsa-project.org>; Sat, 28 May 2022 09:59:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0955F80124
Received: from pop-os.home ([90.11.191.102]) by smtp.orange.fr with ESMTPA
 id urMBnT8ApIaWOurMCnw1Bl; Sat, 28 May 2022 09:59:33 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Sat, 28 May 2022 09:59:33 +0200
X-ME-IP: 90.11.191.102
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: tglx@linutronix.de, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Subject: [PATCH] ASoC: ux500: Remove some leftover from the "Replace GPLv2
 boilerplate/reference with SPDX" rules
Date: Sat, 28 May 2022 09:59:22 +0200
Message-Id: <84d94977c57deee9e85249f18394ebf8d72497bc.1653724723.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
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

The "Replace GPLv2 boilerplate/reference with SPDX" has left some empty
"License terms" paragraphs.
Remove them as well.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 sound/soc/ux500/mop500.c        | 2 --
 sound/soc/ux500/mop500_ab8500.c | 2 --
 sound/soc/ux500/mop500_ab8500.h | 2 --
 sound/soc/ux500/ux500_msp_dai.c | 2 --
 sound/soc/ux500/ux500_msp_dai.h | 2 --
 sound/soc/ux500/ux500_msp_i2s.c | 2 --
 sound/soc/ux500/ux500_msp_i2s.h | 2 --
 sound/soc/ux500/ux500_pcm.c     | 2 --
 sound/soc/ux500/ux500_pcm.h     | 2 --
 9 files changed, 18 deletions(-)

diff --git a/sound/soc/ux500/mop500.c b/sound/soc/ux500/mop500.c
index 4f41bb0ab2b0..fdd55d772b8e 100644
--- a/sound/soc/ux500/mop500.c
+++ b/sound/soc/ux500/mop500.c
@@ -4,8 +4,6 @@
  *
  * Author: Ola Lilja (ola.o.lilja@stericsson.com)
  *         for ST-Ericsson.
- *
- * License terms:
  */
 
 #include <asm/mach-types.h>
diff --git a/sound/soc/ux500/mop500_ab8500.c b/sound/soc/ux500/mop500_ab8500.c
index 1ea1729984a9..e5e73a2bd9fe 100644
--- a/sound/soc/ux500/mop500_ab8500.c
+++ b/sound/soc/ux500/mop500_ab8500.c
@@ -5,8 +5,6 @@
  * Author: Ola Lilja <ola.o.lilja@stericsson.com>,
  *         Kristoffer Karlsson <kristoffer.karlsson@stericsson.com>
  *         for ST-Ericsson.
- *
- * License terms:
  */
 
 #include <linux/module.h>
diff --git a/sound/soc/ux500/mop500_ab8500.h b/sound/soc/ux500/mop500_ab8500.h
index 087ef246d87d..98de80a9cc4f 100644
--- a/sound/soc/ux500/mop500_ab8500.h
+++ b/sound/soc/ux500/mop500_ab8500.h
@@ -4,8 +4,6 @@
  *
  * Author: Ola Lilja <ola.o.lilja@stericsson.com>
  *         for ST-Ericsson.
- *
- * License terms:
  */
 
 #ifndef MOP500_AB8500_H
diff --git a/sound/soc/ux500/ux500_msp_dai.c b/sound/soc/ux500/ux500_msp_dai.c
index 21052378a32e..56532b62faf3 100644
--- a/sound/soc/ux500/ux500_msp_dai.c
+++ b/sound/soc/ux500/ux500_msp_dai.c
@@ -5,8 +5,6 @@
  * Author: Ola Lilja <ola.o.lilja@stericsson.com>,
  *         Roger Nilsson <roger.xr.nilsson@stericsson.com>
  *         for ST-Ericsson.
- *
- * License terms:
  */
 
 #include <linux/module.h>
diff --git a/sound/soc/ux500/ux500_msp_dai.h b/sound/soc/ux500/ux500_msp_dai.h
index fcd4b26f5d2d..30bf70838196 100644
--- a/sound/soc/ux500/ux500_msp_dai.h
+++ b/sound/soc/ux500/ux500_msp_dai.h
@@ -5,8 +5,6 @@
  * Author: Ola Lilja <ola.o.lilja@stericsson.com>,
  *         Roger Nilsson <roger.xr.nilsson@stericsson.com>
  *         for ST-Ericsson.
- *
- * License terms:
  */
 
 #ifndef UX500_msp_dai_H
diff --git a/sound/soc/ux500/ux500_msp_i2s.c b/sound/soc/ux500/ux500_msp_i2s.c
index fd0b88bb7921..d113411a19f8 100644
--- a/sound/soc/ux500/ux500_msp_i2s.c
+++ b/sound/soc/ux500/ux500_msp_i2s.c
@@ -6,8 +6,6 @@
  *         Roger Nilsson <roger.xr.nilsson@stericsson.com>,
  *         Sandeep Kaushik <sandeep.kaushik@st.com>
  *         for ST-Ericsson.
- *
- * License terms:
  */
 
 #include <linux/module.h>
diff --git a/sound/soc/ux500/ux500_msp_i2s.h b/sound/soc/ux500/ux500_msp_i2s.h
index 756b3973af9a..d45b5e2831cc 100644
--- a/sound/soc/ux500/ux500_msp_i2s.h
+++ b/sound/soc/ux500/ux500_msp_i2s.h
@@ -4,8 +4,6 @@
  *
  * Author: Ola Lilja <ola.o.lilja@stericsson.com>,
  *         for ST-Ericsson.
- *
- * License terms:
  */
 
 
diff --git a/sound/soc/ux500/ux500_pcm.c b/sound/soc/ux500/ux500_pcm.c
index 18191084b8b8..d3802e5ef196 100644
--- a/sound/soc/ux500/ux500_pcm.c
+++ b/sound/soc/ux500/ux500_pcm.c
@@ -5,8 +5,6 @@
  * Author: Ola Lilja <ola.o.lilja@stericsson.com>,
  *         Roger Nilsson <roger.xr.nilsson@stericsson.com>
  *         for ST-Ericsson.
- *
- * License terms:
  */
 
 #include <asm/page.h>
diff --git a/sound/soc/ux500/ux500_pcm.h b/sound/soc/ux500/ux500_pcm.h
index ff3ef7223db6..bd4348ebf9a1 100644
--- a/sound/soc/ux500/ux500_pcm.h
+++ b/sound/soc/ux500/ux500_pcm.h
@@ -5,8 +5,6 @@
  * Author: Ola Lilja <ola.o.lilja@stericsson.com>,
  *         Roger Nilsson <roger.xr.nilsson@stericsson.com>
  *         for ST-Ericsson.
- *
- * License terms:
  */
 #ifndef UX500_PCM_H
 #define UX500_PCM_H
-- 
2.34.1

