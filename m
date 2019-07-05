Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A3E603AD
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Jul 2019 11:59:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B20E91694;
	Fri,  5 Jul 2019 11:58:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B20E91694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562320762;
	bh=ne8nyOG0wgyVQAGSP0mRpRRnKd5+Ga9BtvZjpB67kC0=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=RKkFV96bRXxILsW69oOtT5aNDiEX2kplIvBDb51kJfoGu3F1Iwp0axqfuIkorOPHw
	 PyByEO0Yo6rDWe9j4AgAp8mWUDKcPU7yhQ78Avr3DeW3SL5DruWuvg07FXtldA2HQ5
	 Whn/v8jJXHmviBUIm0I10MY8UeCWVFsbHvyQQhj4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D5670F80133;
	Fri,  5 Jul 2019 11:57:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F3B35F8011F; Fri,  5 Jul 2019 11:57:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7B8A0F800E1
 for <alsa-devel@alsa-project.org>; Fri,  5 Jul 2019 11:57:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B8A0F800E1
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.76) (envelope-from <colin.king@canonical.com>)
 id 1hjKxk-0003b7-AS; Fri, 05 Jul 2019 09:57:04 +0000
From: Colin King <colin.king@canonical.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org
Date: Fri,  5 Jul 2019 10:57:04 +0100
Message-Id: <20190705095704.26050-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH] ALSA: cs4281: remove redundant assignment to
	variable val and remove a goto
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

The variable val is being assigned with a value that is never
read and it is being updated later with a new value. The
assignment is redundant and can be removed.  Also remove a
goto statement and a label and replace with a break statement.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 sound/pci/cs4281.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/pci/cs4281.c b/sound/pci/cs4281.c
index a2cce3ecda6f..04c712647853 100644
--- a/sound/pci/cs4281.c
+++ b/sound/pci/cs4281.c
@@ -694,7 +694,7 @@ static int snd_cs4281_trigger(struct snd_pcm_substream *substream, int cmd)
 
 static unsigned int snd_cs4281_rate(unsigned int rate, unsigned int *real_rate)
 {
-	unsigned int val = ~0;
+	unsigned int val;
 	
 	if (real_rate)
 		*real_rate = rate;
@@ -707,9 +707,8 @@ static unsigned int snd_cs4281_rate(unsigned int rate, unsigned int *real_rate)
 	case 44100:	return 1;
 	case 48000:	return 0;
 	default:
-		goto __variable;
+		break;
 	}
-      __variable:
 	val = 1536000 / rate;
 	if (real_rate)
 		*real_rate = 1536000 / val;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
