Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ABDE61308AB
	for <lists+alsa-devel@lfdr.de>; Sun,  5 Jan 2020 16:21:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 47BC5180E;
	Sun,  5 Jan 2020 16:20:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 47BC5180E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578237667;
	bh=HXSq3AUmtXKz8oRHphtCgYIQRwheztfjMKRWFxxqCwI=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=grWJzpvjbpSChAJiSAPYE5yRtMxZrColjD9HTLi0U8bB9LM/2DLkBsggFCf28hIeM
	 t4CTbcIEKkfOXXqYLdp9IEGU1Ylc5r1MDW/Qy8VdzLFP4ZXCAJaH27pXs3LhedFXKO
	 8Wb32+r8leY5tom++LttaAihdxn9+XyYLWMJjfS8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 87082F804E4;
	Sun,  5 Jan 2020 15:50:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5058CF803AD; Sun,  5 Jan 2020 15:49:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 195DDF802C4
 for <alsa-devel@alsa-project.org>; Sun,  5 Jan 2020 15:48:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 195DDF802C4
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 2A282B2BF
 for <alsa-devel@alsa-project.org>; Sun,  5 Jan 2020 14:48:34 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Sun,  5 Jan 2020 15:48:06 +0100
Message-Id: <20200105144823.29547-52-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200105144823.29547-1-tiwai@suse.de>
References: <20200105144823.29547-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 51/68] ALSA: wss: More constifications
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

Apply const prefix to the static tables for parameters.

Just for minor optimization and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/isa/wss/wss_lib.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/isa/wss/wss_lib.c b/sound/isa/wss/wss_lib.c
index d37f4642162a..ea5d3cdfe4e4 100644
--- a/sound/isa/wss/wss_lib.c
+++ b/sound/isa/wss/wss_lib.c
@@ -38,7 +38,7 @@ MODULE_LICENSE("GPL");
  *  Some variables
  */
 
-static unsigned char freq_bits[14] = {
+static const unsigned char freq_bits[14] = {
 	/* 5510 */	0x00 | CS4231_XTAL2,
 	/* 6620 */	0x0E | CS4231_XTAL2,
 	/* 8000 */	0x00 | CS4231_XTAL1,
@@ -72,7 +72,7 @@ static int snd_wss_xrate(struct snd_pcm_runtime *runtime)
 					  &hw_constraints_rates);
 }
 
-static unsigned char snd_wss_original_image[32] =
+static const unsigned char snd_wss_original_image[32] =
 {
 	0x00,			/* 00/00 - lic */
 	0x00,			/* 01/01 - ric */
@@ -108,7 +108,7 @@ static unsigned char snd_wss_original_image[32] =
 	0x00,			/* 1f/31 - cbrl */
 };
 
-static unsigned char snd_opti93x_original_image[32] =
+static const unsigned char snd_opti93x_original_image[32] =
 {
 	0x00,		/* 00/00 - l_mixout_outctrl */
 	0x00,		/* 01/01 - r_mixout_outctrl */
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
