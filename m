Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 190BC1A6D23
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Apr 2020 22:21:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9EAC6169F;
	Mon, 13 Apr 2020 22:20:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9EAC6169F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586809271;
	bh=9vpCZ0bU4gkmdKRVrRNVkLiRvz5E4EdlB1IC+laC00g=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dDfJ8es+vDWj0JusiL1k/NtUuyWjtM5wdwNmQ5R414yTbABHepm51wG8zYQaXEPDC
	 DOcES2nRoM0BrtJuiQYhqHjkUigJsoBYqrea+4POUTpsz5PQJImo6NuJTDw0gWOGeb
	 /gpyDer01YlFZznc/HjmfIemav4YYFTG6KhO/sqk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B2771F80229;
	Mon, 13 Apr 2020 22:19:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 42D42F80245; Mon, 13 Apr 2020 22:19:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D97D5F8010E
 for <alsa-devel@alsa-project.org>; Mon, 13 Apr 2020 22:19:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D97D5F8010E
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 68685ABAD
 for <alsa-devel@alsa-project.org>; Mon, 13 Apr 2020 20:19:19 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: hda: Allow setting preallocation again for x86
Date: Mon, 13 Apr 2020 22:19:19 +0200
Message-Id: <20200413201919.24241-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
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

The commit c31427d0d21e ("ALSA: hda: No preallocation on x86
platforms") changed CONFIG_SND_HDA_PREALLOC_SIZE setup and its default
to zero for x86, as the preallocation should work almost all cases.
However, this expectation was too naive; some applications try to
allocate as the max buffer size as possible, and it leads to the
memory exhaustion.  More badly, the commit changed the kconfig no
longer adjustable for x86, so you can't fix it statically (although it
can be still adjusted via procfs).

So, practically seen, it's more recommended to set a reasonable limit
for x86, too.  This patch follows to that experience, and changes the
default to 2048 and allow the kconfig adjustable again.

Fixes: c31427d0d21e ("ALSA: hda: No preallocation on x86 platforms")
Cc: <stable@vger.kernel.org>
BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=207223
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/Kconfig | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/sound/hda/Kconfig b/sound/hda/Kconfig
index 4ca6b09056f3..3bc9224d5e4f 100644
--- a/sound/hda/Kconfig
+++ b/sound/hda/Kconfig
@@ -21,16 +21,17 @@ config SND_HDA_EXT_CORE
        select SND_HDA_CORE
 
 config SND_HDA_PREALLOC_SIZE
-	int "Pre-allocated buffer size for HD-audio driver" if !SND_DMA_SGBUF
+	int "Pre-allocated buffer size for HD-audio driver"
 	range 0 32768
-	default 0 if SND_DMA_SGBUF
+	default 2048 if SND_DMA_SGBUF
 	default 64 if !SND_DMA_SGBUF
 	help
 	  Specifies the default pre-allocated buffer-size in kB for the
 	  HD-audio driver.  A larger buffer (e.g. 2048) is preferred
 	  for systems using PulseAudio.  The default 64 is chosen just
 	  for compatibility reasons.
-	  On x86 systems, the default is zero as we need no preallocation.
+	  On x86 systems, the default is 2048 as a reasonable value for
+	  most of modern systems.
 
 	  Note that the pre-allocation size can be changed dynamically
 	  via a proc file (/proc/asound/card*/pcm*/sub*/prealloc), too.
-- 
2.16.4

