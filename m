Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FFE9AC538
	for <lists+alsa-devel@lfdr.de>; Sat,  7 Sep 2019 09:48:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A95611607;
	Sat,  7 Sep 2019 09:47:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A95611607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567842511;
	bh=MHaenXxtN2jUr0eYHUNBJ3tNS9YN/cMzZaprdyDvDTo=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=sc3rd2u/J9R5Jwc1WV89rRGqAu6tQGW9N/gilCF8wdxLg4SO9EIvNGDiuXTt04ni3
	 HQgXhj3SWeWUHyWa8YPFsyBpf/rsNoUMOZmUfod9yV674O792MqrrCQN6WbBnZNsXr
	 fM6P692UmrMeVRshxLd2TUJgMQmRy+ms9NXK4hD4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A9FDF80448;
	Sat,  7 Sep 2019 09:46:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A393CF80448; Sat,  7 Sep 2019 09:46:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BBACEF800C6
 for <alsa-devel@alsa-project.org>; Sat,  7 Sep 2019 09:46:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BBACEF800C6
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.76) (envelope-from <colin.king@canonical.com>)
 id 1i6VQY-0006LA-Co; Sat, 07 Sep 2019 07:46:34 +0000
From: Colin King <colin.king@canonical.com>
To: Bard Liao <bardliao@realtek.com>, Oder Chiou <oder_chiou@realtek.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org
Date: Sat,  7 Sep 2019 08:46:34 +0100
Message-Id: <20190907074634.22144-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH] ASoC: rt1308: make array pd static const,
	makes object smaller
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

From: Colin Ian King <colin.king@canonical.com>

Don't populate the array pd on the stack but instead make it
static const. Makes the object code smaller by 82 bytes.

Before:
   text	   data	    bss	    dec	    hex	filename
  26548	   7288	     64	  33900	   846c	sound/soc/codecs/rt1308.o

After:
   text	   data	    bss	    dec	    hex	filename
  26370	   7384	     64	  33818	   841a	sound/soc/codecs/rt1308.o

(gcc version 9.2.1, amd64)

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 sound/soc/codecs/rt1308.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt1308.c b/sound/soc/codecs/rt1308.c
index 6f2ee6809dbb..b75931a69a1c 100644
--- a/sound/soc/codecs/rt1308.c
+++ b/sound/soc/codecs/rt1308.c
@@ -436,7 +436,8 @@ static const struct snd_soc_dapm_route rt1308_dapm_routes[] = {
 
 static int rt1308_get_clk_info(int sclk, int rate)
 {
-	int i, pd[] = {1, 2, 3, 4, 6, 8, 12, 16};
+	int i;
+	static const int pd[] = {1, 2, 3, 4, 6, 8, 12, 16};
 
 	if (sclk <= 0 || rate <= 0)
 		return -EINVAL;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
