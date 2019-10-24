Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7A9E36C1
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Oct 2019 17:33:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 75E2516FC;
	Thu, 24 Oct 2019 17:32:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 75E2516FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571931204;
	bh=K+bMR4Es9oML8AihxuGu5pmS4/m7R5IdcTv4jQ/kDWo=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=eoUux02jltAs2v/TGI79mvZrdZqhtyRfKw5ogbnI1HGyrsNjE9ZAntwGcsf6+GYQC
	 xomLs7LRxssfkUFoJpKUfK2oN6+u/ODEcF/MUCTnO5iqDmW12vkfy7Z+htv8PNbymR
	 iqwpA5fY3PQu0LdJbQ+xMYBG1GkSnPG5XS0F4mPI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D5F71F8036E;
	Thu, 24 Oct 2019 17:31:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3CF54F8036B; Thu, 24 Oct 2019 17:31:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_NONE, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from andre.telenet-ops.be (andre.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 495C4F80274
 for <alsa-devel@alsa-project.org>; Thu, 24 Oct 2019 17:31:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 495C4F80274
Received: from ramsan ([84.195.182.253]) by andre.telenet-ops.be with bizsmtp
 id HTXX210015USYZQ01TXXHk; Thu, 24 Oct 2019 17:31:33 +0200
Received: from rox.of.borg ([192.168.97.57]) by ramsan with esmtp (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1iNf5G-00078z-UO; Thu, 24 Oct 2019 17:31:30 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1iNf5G-000863-Ss; Thu, 24 Oct 2019 17:31:30 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Jiri Kosina <trivial@kernel.org>
Date: Thu, 24 Oct 2019 17:31:30 +0200
Message-Id: <20191024153130.31082-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Cc: alsa-devel@alsa-project.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] [PATCH trivial] ASoC: pxa: poodle: Spelling
	s/enpoints/endpoints/, s/connetion/connection/
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Fix misspelling of "endpoints" and "connection".

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 sound/soc/pxa/poodle.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/pxa/poodle.c b/sound/soc/pxa/poodle.c
index 48d5c2252b10081d..59ef04d0467a622d 100644
--- a/sound/soc/pxa/poodle.c
+++ b/sound/soc/pxa/poodle.c
@@ -56,7 +56,7 @@ static void poodle_ext_control(struct snd_soc_dapm_context *dapm)
 		snd_soc_dapm_disable_pin(dapm, "Headphone Jack");
 	}
 
-	/* set the enpoints to their new connetion states */
+	/* set the endpoints to their new connection states */
 	if (poodle_spk_func == POODLE_SPK_ON)
 		snd_soc_dapm_enable_pin(dapm, "Ext Spk");
 	else
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
