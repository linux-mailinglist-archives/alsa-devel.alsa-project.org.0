Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EFF0587DC
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Jun 2019 19:00:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 926B31612;
	Thu, 27 Jun 2019 18:59:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 926B31612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561654849;
	bh=grsuG9/ZN+E+lF4M5ueTSop5x3zLD5CSdABYxU3JKwA=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=MIKTOgKSUWlTLukyMaNA3qbv6SoQeGTmTzrtIg99LimDG2NtIaOCrUG2yzZ2P7/fs
	 vyAYAlbtBV68vSFFaLfsBkJsG3MTQxQ2p9uktztVOTW3lbMi9Xp9JRlk5yqqaPcUmv
	 faiZl3gSCA8llyo+F9NzT/Uh/w9Lnf1eYtCCO8Ac=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 173FFF896F6;
	Thu, 27 Jun 2019 18:59:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4EAC3F896F6; Thu, 27 Jun 2019 18:59:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B9F9AF80C0B
 for <alsa-devel@alsa-project.org>; Thu, 27 Jun 2019 18:58:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B9F9AF80C0B
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.76) (envelope-from <colin.king@canonical.com>)
 id 1hgXjZ-000846-Sc; Thu, 27 Jun 2019 16:58:53 +0000
From: Colin King <colin.king@canonical.com>
To: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 xen-devel@lists.xenproject.org, alsa-devel@alsa-project.org
Date: Thu, 27 Jun 2019 17:58:53 +0100
Message-Id: <20190627165853.21864-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH] ALSA: xen-front: fix unintention integer
	overflow on left shifts
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

Shifting the integer value 1 is evaluated using 32-bit
arithmetic and then used in an expression that expects a 64-bit
value, so there is potentially an integer overflow. Fix this
by using the BIT_ULL macro to perform the shift.

Addresses-Coverity: ("Unintentional integer overflow")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 sound/xen/xen_snd_front_alsa.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/xen/xen_snd_front_alsa.c b/sound/xen/xen_snd_front_alsa.c
index b14ab512c2ce..e01631959ed8 100644
--- a/sound/xen/xen_snd_front_alsa.c
+++ b/sound/xen/xen_snd_front_alsa.c
@@ -196,7 +196,7 @@ static u64 to_sndif_formats_mask(u64 alsa_formats)
 	mask = 0;
 	for (i = 0; i < ARRAY_SIZE(ALSA_SNDIF_FORMATS); i++)
 		if (pcm_format_to_bits(ALSA_SNDIF_FORMATS[i].alsa) & alsa_formats)
-			mask |= 1 << ALSA_SNDIF_FORMATS[i].sndif;
+			mask |= BIT_ULL(ALSA_SNDIF_FORMATS[i].sndif);
 
 	return mask;
 }
@@ -208,7 +208,7 @@ static u64 to_alsa_formats_mask(u64 sndif_formats)
 
 	mask = 0;
 	for (i = 0; i < ARRAY_SIZE(ALSA_SNDIF_FORMATS); i++)
-		if (1 << ALSA_SNDIF_FORMATS[i].sndif & sndif_formats)
+		if (BIT_ULL(ALSA_SNDIF_FORMATS[i].sndif) & sndif_formats)
 			mask |= pcm_format_to_bits(ALSA_SNDIF_FORMATS[i].alsa);
 
 	return mask;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
