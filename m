Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A55130898
	for <lists+alsa-devel@lfdr.de>; Sun,  5 Jan 2020 16:14:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E849D17FC;
	Sun,  5 Jan 2020 16:13:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E849D17FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578237273;
	bh=u12yHHa/kqfeK7ljGnA7jvrJyCZpUWA0zyqFrZi4MF0=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eBRn5+HQI+xupPvfLMVxT17OoclePHi5qpkHXM2DwBL4Unnh10GIzM0IhkeUgrBKS
	 VEyMSVBF1ZnkJgI5N1fjL1/6yd3LPk8SBf7FmMFIubKs9C7PKsGIXVbqFriuyajgnf
	 ccqnEzysYzZWLdKEUgZF7tow3IFlGCmV2R4aXGmc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 174A4F80474;
	Sun,  5 Jan 2020 15:50:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 38813F8038E; Sun,  5 Jan 2020 15:49:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5A6F4F8029B
 for <alsa-devel@alsa-project.org>; Sun,  5 Jan 2020 15:48:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A6F4F8029B
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 6567FB2B5
 for <alsa-devel@alsa-project.org>; Sun,  5 Jan 2020 14:48:33 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Sun,  5 Jan 2020 15:47:52 +0100
Message-Id: <20200105144823.29547-38-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200105144823.29547-1-tiwai@suse.de>
References: <20200105144823.29547-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 37/68] ALSA: sparc: More constifications
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

Apply const prefix to the static tables for rates, bits and strings.

Just for minor optimization and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/sparc/cs4231.c | 4 ++--
 sound/sparc/dbri.c   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/sparc/cs4231.c b/sound/sparc/cs4231.c
index 59f812b5ce59..0eed5f79a2bf 100644
--- a/sound/sparc/cs4231.c
+++ b/sound/sparc/cs4231.c
@@ -184,7 +184,7 @@ struct snd_cs4231 {
  *  Some variables
  */
 
-static unsigned char freq_bits[14] = {
+static const unsigned char freq_bits[14] = {
 	/* 5510 */	0x00 | CS4231_XTAL2,
 	/* 6620 */	0x0E | CS4231_XTAL2,
 	/* 8000 */	0x00 | CS4231_XTAL1,
@@ -218,7 +218,7 @@ static int snd_cs4231_xrate(struct snd_pcm_runtime *runtime)
 					  &hw_constraints_rates);
 }
 
-static unsigned char snd_cs4231_original_image[32] =
+static const unsigned char snd_cs4231_original_image[32] =
 {
 	0x00,			/* 00/00 - lic */
 	0x00,			/* 01/01 - ric */
diff --git a/sound/sparc/dbri.c b/sound/sparc/dbri.c
index aaa1493b9ef9..cf7049999261 100644
--- a/sound/sparc/dbri.c
+++ b/sound/sparc/dbri.c
@@ -104,7 +104,7 @@ module_param(dbri_debug, int, 0644);
 MODULE_PARM_DESC(dbri_debug, "Debug value for Sun DBRI soundcard.");
 
 #ifdef DBRI_DEBUG
-static char *cmds[] = {
+static const char * const cmds[] = {
 	"WAIT", "PAUSE", "JUMP", "IIQ", "REX", "SDP", "CDP", "DTS",
 	"SSP", "CHI", "NT", "TE", "CDEC", "TEST", "CDM", "RESRV"
 };
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
