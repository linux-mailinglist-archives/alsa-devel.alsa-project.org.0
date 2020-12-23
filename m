Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 386E52E2020
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Dec 2020 18:48:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CCC4D174E;
	Wed, 23 Dec 2020 18:47:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CCC4D174E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608745702;
	bh=ILYQBT2VBsJ1aXZek4CMzDy95Z2JOOWDkqg3+MXeMTc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZGfe7Ox84N7qWLHM70inLy2MglOHrvUwt/E84KnD0tJnjH0TMkxxj7NfPs92VTJWZ
	 95vYgL9reSyP7pfan/NMv5AG25t6kxEAmEWs/H2RIuuGmSCFax2qbOUVhIklKrI/Tw
	 vNlzkBBs6SHf+FrIh5TGCqaRxTJNChvwJa0SXDtA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6D13BF804F2;
	Wed, 23 Dec 2020 18:44:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 13189F804E0; Wed, 23 Dec 2020 18:44:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from www381.your-server.de (www381.your-server.de [78.46.137.84])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 56C4AF801EB
 for <alsa-devel@alsa-project.org>; Wed, 23 Dec 2020 18:44:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56C4AF801EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=metafoo.de header.i=@metafoo.de
 header.b="BQBbZpFV"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=metafoo.de; 
 s=default2002;
 h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID;
 bh=jas3II4B6NhABFSwerDEfkIJ+sDOaowYWFKzYUUXVK0=; b=BQBbZpFV7130fkbvf4Uj+qdZqs
 O/RVsMUxQpIAAkV5DIDt0TUKwNZVsBZ55V/Srr7YcjX1gGp6S/DMEENUoPvaP0BlvVAT5i+MzDiE/
 ouaKRUwoToRQADdta4Sk30HaXqX9GZ8gcu/TA5sjotjyKkmy1DQilkolOvPERy/ZX/ZIM3c8wRcHW
 peI+jMmBVDONSB6M+wfxpVdMV5p4E7z/eItac+XYn6RpkFdF4ygUf8Zjfm4G26llErHrBTmpMP1vh
 iNxYHTsDEL58WKSFrSj3UgAT5kZ0Wu22Yf7Waj064K70obDTvRswc23EbPYEQH6H5/kiUSE9XuWYb
 jI0tItBw==;
Received: from sslproxy01.your-server.de ([78.46.139.224])
 by www381.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92.3) (envelope-from <lars@metafoo.de>)
 id 1ks8BZ-0001O8-Rd; Wed, 23 Dec 2020 18:44:29 +0100
Received: from [62.216.202.54] (helo=lars-desktop.fritz.box)
 by sslproxy01.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <lars@metafoo.de>)
 id 1ks7qo-000Crk-Pp; Wed, 23 Dec 2020 18:23:02 +0100
From: Lars-Peter Clausen <lars@metafoo.de>
To: Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 15/18] ALSA: trident: Use DIV_ROUND_CLOSEST() instead of
 open-coding it
Date: Wed, 23 Dec 2020 18:22:26 +0100
Message-Id: <20201223172229.781-15-lars@metafoo.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201223172229.781-1-lars@metafoo.de>
References: <20201223172229.781-1-lars@metafoo.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: lars@metafoo.de
X-Virus-Scanned: Clear (ClamAV 0.102.4/26026/Wed Dec 23 13:53:03 2020)
Cc: alsa-devel@alsa-project.org, Lars-Peter Clausen <lars@metafoo.de>
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

Use DIV_ROUND_CLOSEST() instead of open-coding it. This documents intent
and makes it more clear what is going on for the casual reviewer.

Generated using the following the Coccinelle semantic patch.

// <smpl>
@@
expression x, y;
@@
-((x) + ((y) / 2)) / (y)
+DIV_ROUND_CLOSEST(x, y)

@r1@
expression x;
constant C1;
constant C2;
@@
 ((x) + C1) / C2

@script:python@
C1 << r1.C1;
C2 << r1.C2;
@@
try:
	if int(C1) * 2 != int(C2):
		cocci.include_match(False)
except:
	cocci.include_match(False)

@@
expression r1.x;
constant r1.C1;
constant r1.C2;
@@
-(((x) + C1) / C2)
+DIV_ROUND_CLOSEST(x, C2)
// </smpl>

Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
---
 sound/pci/trident/trident_main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/pci/trident/trident_main.c b/sound/pci/trident/trident_main.c
index 6e50376163a2..8d0d0d8335ec 100644
--- a/sound/pci/trident/trident_main.c
+++ b/sound/pci/trident/trident_main.c
@@ -678,7 +678,7 @@ static unsigned int snd_trident_convert_rate(unsigned int rate)
 	else if (rate == 48000)
 		delta = 0x1000;
 	else
-		delta = (((rate << 12) + 24000) / 48000) & 0x0000ffff;
+		delta = DIV_ROUND_CLOSEST(rate << 12, 48000) & 0x0000ffff;
 	return delta;
 }
 
@@ -1034,7 +1034,7 @@ static int snd_trident_capture_prepare(struct snd_pcm_substream *substream)
 	ESO_bytes++;
 
 	// Set channel sample rate, 4.12 format
-	val = (((unsigned int) 48000L << 12) + (runtime->rate/2)) / runtime->rate;
+	val = DIV_ROUND_CLOSEST(48000U << 12, runtime->rate);
 	outw(val, TRID_REG(trident, T4D_SBDELTA_DELTA_R));
 
 	// Set channel interrupt blk length
-- 
2.20.1

