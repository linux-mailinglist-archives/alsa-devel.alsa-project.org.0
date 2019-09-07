Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 16581AC536
	for <lists+alsa-devel@lfdr.de>; Sat,  7 Sep 2019 09:43:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A71391658;
	Sat,  7 Sep 2019 09:43:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A71391658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567842233;
	bh=hV+KCmYOs3yAYxCwOQJviFP5besAmcIJniUAdfEJRnA=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=aJ3viP712obt/o9u96o8bdQhFua1E5V3/nLrIlw54gWHpVdPJZM1zitW+C5A/IVda
	 nLHaX4p3HSqbZgi0R2WzksV5wwfcj4V0EYeKg5Ys5+MdmqnW/tFIug6+xRea2n3Nkc
	 zmXqo11VjEhnKFU0Z1VE4u60QkwcuL2pXRlwhbEQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F0C6F8049B;
	Sat,  7 Sep 2019 09:42:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AF01CF80448; Sat,  7 Sep 2019 09:42:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 76C1EF80171
 for <alsa-devel@alsa-project.org>; Sat,  7 Sep 2019 09:42:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 76C1EF80171
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.76) (envelope-from <colin.king@canonical.com>)
 id 1i6VM4-00062S-Mj; Sat, 07 Sep 2019 07:41:56 +0000
From: Colin King <colin.king@canonical.com>
To: Bard Liao <bardliao@realtek.com>, Oder Chiou <oder_chiou@realtek.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org
Date: Sat,  7 Sep 2019 08:41:56 +0100
Message-Id: <20190907074156.21907-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH] ASoC: rt1305: make array pd static const,
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
static const. Makes the object code smaller by 93 bytes.

Before:
   text	   data	    bss	    dec	    hex	filename
  38961	   9784	     64	  48809	   bea9	sound/soc/codecs/rt1305.o

After:
   text	   data	    bss	    dec	    hex	filename
  38804	   9848	     64	  48716	   be4c	sound/soc/codecs/rt1305.o

(gcc version 9.2.1, amd64)

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 sound/soc/codecs/rt1305.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt1305.c b/sound/soc/codecs/rt1305.c
index 9909369483f0..e27742abfa76 100644
--- a/sound/soc/codecs/rt1305.c
+++ b/sound/soc/codecs/rt1305.c
@@ -608,7 +608,8 @@ static const struct snd_soc_dapm_route rt1305_dapm_routes[] = {
 
 static int rt1305_get_clk_info(int sclk, int rate)
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
