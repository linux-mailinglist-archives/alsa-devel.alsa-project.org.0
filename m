Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB07326C39
	for <lists+alsa-devel@lfdr.de>; Sat, 27 Feb 2021 09:21:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 08CB21686;
	Sat, 27 Feb 2021 09:20:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 08CB21686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614414107;
	bh=HYBSVRMHUDryGSFT06nALAaQF+ZRDv/e6IoQTCyth+g=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=gVbWlEkoqTCy/XG3EdTiwo/D2/OoOidj3KyhTYOVi8GOrBS2vnMvA6Ad5dU00KxLg
	 Rp326+wjGiCVaA7VAkSOQyjwJ6xO7x4bS779owMKCSYfWf8IOUYtZdLImRan6extmF
	 WRLDRlIpmL/MpytMQOUHjzt2HhuzGXHu4VUwQTe4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DB53FF8016D;
	Sat, 27 Feb 2021 09:20:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C2EE4F8016A; Sat, 27 Feb 2021 09:20:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D07ADF8010B
 for <alsa-devel@alsa-project.org>; Sat, 27 Feb 2021 09:20:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D07ADF8010B
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D2511AFCB
 for <alsa-devel@alsa-project.org>; Sat, 27 Feb 2021 08:20:02 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: usb-audio: Don't abort even if the clock rate differs
Date: Sat, 27 Feb 2021 09:20:02 +0100
Message-Id: <20210227082002.21185-1-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The commit 93db51d06b32 ("ALSA: usb-audio: Check valid altsetting at
parsing rates for UAC2/3") changed the behavior of the function
set_sample_rate_v2v3() slightly to treat the inconsistent sample rate
as an error.  It was done by assumption that the sample rate
validation should have been done at the parser phase as implemented in
that patch.  But the validation is later selectively enabled only for
certain devices as it causes a regression (the commit fe773b8711e3
"ALSA: usb-audio: workaround for iface reset issue"), and now the
inconsistency surfaced as a fatal error while it worked in the past as
is, as reported for FiiO M3K DAC.

For recovering from the regression, change set_sample_rate_v2v3()
again to ignore the sample rate difference as non-error.

BugLink: https://bugzilla.opensuse.org/show_bug.cgi?id=1182633
Fixes: 93db51d06b32 ("ALSA: usb-audio: Check valid altsetting at parsing rates for UAC2/3")
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/clock.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/usb/clock.c b/sound/usb/clock.c
index 8243652d5604..a746802d0ac3 100644
--- a/sound/usb/clock.c
+++ b/sound/usb/clock.c
@@ -652,10 +652,10 @@ static int set_sample_rate_v2v3(struct snd_usb_audio *chip,
 		cur_rate = prev_rate;
 
 	if (cur_rate != rate) {
-		usb_audio_warn(chip,
-			       "%d:%d: freq mismatch (RO clock): req %d, clock runs @%d\n",
-			       fmt->iface, fmt->altsetting, rate, cur_rate);
-		return -ENXIO;
+		usb_audio_dbg(chip,
+			      "%d:%d: freq mismatch: req %d, clock runs @%d\n",
+			      fmt->iface, fmt->altsetting, rate, cur_rate);
+		/* continue processing */
 	}
 
 validation:
-- 
2.26.2

