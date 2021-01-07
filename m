Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E5F2ED140
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Jan 2021 15:00:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0034E16BF;
	Thu,  7 Jan 2021 14:59:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0034E16BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610028048;
	bh=pBvHVjmxvZDv1CsEJ1+pw3LQO4JWZtM2PsQuEngSR6A=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UdhBGNGuwfRXoUfV/TfhRHdySgrvLl8Gn6LeN4wtFan6yt4EmEkR4W6tdBZr8DyNX
	 TOBm+wjEU8B15sGm/tL7A2A9yOlwmaL61n9wOVSrYHZyIgPmsooiRi0//d1p2gNflz
	 CX7d0un9HiIomocwiEXqahaigqZnFhVq3FVoMNTo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 81FF7F804E2;
	Thu,  7 Jan 2021 14:58:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 45E0AF804CC; Thu,  7 Jan 2021 14:58:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5B38BF800FD
 for <alsa-devel@alsa-project.org>; Thu,  7 Jan 2021 14:58:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B38BF800FD
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AD2C3B71B;
 Thu,  7 Jan 2021 13:58:05 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH v4 2/5] ALSA: usb-audio: Choose audioformat of a counter-part
 substream
Date: Thu,  7 Jan 2021 14:57:58 +0100
Message-Id: <20210107135801.23860-3-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210107135801.23860-1-tiwai@suse.de>
References: <20210107135801.23860-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: =?UTF-8?q?Franti=C5=A1ek=20Ku=C4=8Dera?= <konference@frantovo.cz>,
 Geraldo <geraldogabriel@gmail.com>
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

The implicit feedback mode needs to handle two endpoints and the
choice of the audioformat object for the sync EP is important since
this determines the compatibility of the hw_params.  The current code
uses the same audioformat object if both the main EP and the sync EP
point to the same iface/altsetting.  This was done in consideration of
the non-implicit-fb sync EP handling, and it doesn't match well with
the cases where actually to endpoints are defined in the sameiface /
altsetting like a few Pioneer devices.

Modify snd_usb_find_implicit_fb_sync_format() to pick up the
audioformat that is assigned in the counter-part substreams primarily,
so that the actual capture stream can be opened properly.  We keep the
same audioformat object only as a fallback in case nothing found,
though.

Fixes: 9fddc15e8039 ("ALSA: usb-audio: Factor out the implicit feedback quirk code")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/implicit.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/sound/usb/implicit.c b/sound/usb/implicit.c
index 931042a6a051..9724efe1cdce 100644
--- a/sound/usb/implicit.c
+++ b/sound/usb/implicit.c
@@ -378,20 +378,19 @@ snd_usb_find_implicit_fb_sync_format(struct snd_usb_audio *chip,
 				     int stream)
 {
 	struct snd_usb_substream *subs;
-	const struct audioformat *fp, *sync_fmt;
+	const struct audioformat *fp, *sync_fmt = NULL;
 	int score, high_score;
 
-	/* When sharing the same altset, use the original audioformat */
+	/* Use the original audioformat as fallback for the shared altset */
 	if (target->iface == target->sync_iface &&
 	    target->altsetting == target->sync_altsetting)
-		return target;
+		sync_fmt = target;
 
 	subs = find_matching_substream(chip, stream, target->sync_ep,
 				       target->fmt_type);
 	if (!subs)
-		return NULL;
+		return sync_fmt;
 
-	sync_fmt = NULL;
 	high_score = 0;
 	list_for_each_entry(fp, &subs->fmt_list, list) {
 		score = match_endpoint_audioformats(subs, fp,
-- 
2.26.2

