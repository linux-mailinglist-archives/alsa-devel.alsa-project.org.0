Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DF98E536B8C
	for <lists+alsa-devel@lfdr.de>; Sat, 28 May 2022 10:01:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C0EA31845;
	Sat, 28 May 2022 10:01:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C0EA31845
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653724917;
	bh=/ZgDTtkCkiBojL51BeB1OMXFWJNtPz8OlEc3/vFhzsY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=pdn7OoZCzTyknaXN1QB9E+nrO8OexNA18BR5cHPnhlzihEvu4EeU+QzVd3r2RjDAa
	 C9haYEeVKnu/NQqIJPscZbnVK7XUeQG7KICB4ooO7nW7v0eyva8tT95y+XTny4XC2I
	 ATrfas+2OhCvX/jQ3FKWwBVJ+3ZzcOVDqgekApXE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5CCECF80159;
	Sat, 28 May 2022 10:01:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7B4A2F80124; Sat, 28 May 2022 10:01:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtp.smtpout.orange.fr (smtp06.smtpout.orange.fr
 [80.12.242.128])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 77039F80124
 for <alsa-devel@alsa-project.org>; Sat, 28 May 2022 10:00:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77039F80124
Received: from pop-os.home ([90.11.191.102]) by smtp.orange.fr with ESMTPA
 id urNWn1xHmP8ApurNWnc56v; Sat, 28 May 2022 10:00:56 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Sat, 28 May 2022 10:00:56 +0200
X-ME-IP: 90.11.191.102
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: tglx@linutronix.de, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Subject: [PATCH] ASoC: ab8500: Remove some leftover from the "Replace GPLv2
 boilerplate/reference with SPDX" rules
Date: Sat, 28 May 2022 10:00:53 +0200
Message-Id: <28c0833d4a11f8f75f385e5aad93c23721b06c7e.1653724847.git.christophe.jaillet@wanadoo.fr>
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
 sound/soc/codecs/ab8500-codec.c | 2 --
 sound/soc/codecs/ab8500-codec.h | 2 --
 2 files changed, 4 deletions(-)

diff --git a/sound/soc/codecs/ab8500-codec.c b/sound/soc/codecs/ab8500-codec.c
index aefafb0b7b97..cbd4a92cb06c 100644
--- a/sound/soc/codecs/ab8500-codec.c
+++ b/sound/soc/codecs/ab8500-codec.c
@@ -12,8 +12,6 @@
  *         Mikko Sarmanne <mikko.sarmanne@symbio.com>,
  *         Jarmo K. Kuronen <jarmo.kuronen@symbio.com>,
  *         for ST-Ericsson.
- *
- * License terms:
  */
 
 #include <linux/kernel.h>
diff --git a/sound/soc/codecs/ab8500-codec.h b/sound/soc/codecs/ab8500-codec.h
index 0ac87d0446c2..2a6f6409f1f8 100644
--- a/sound/soc/codecs/ab8500-codec.h
+++ b/sound/soc/codecs/ab8500-codec.h
@@ -11,8 +11,6 @@
  *         Mikko J. Lehto <mikko.lehto@symbio.com>,
  *         Mikko Sarmanne <mikko.sarmanne@symbio.com>,
  *         for ST-Ericsson.
- *
- * License terms:
  */
 
 #ifndef AB8500_CODEC_REGISTERS_H
-- 
2.34.1

