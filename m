Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 516CE326CD1
	for <lists+alsa-devel@lfdr.de>; Sat, 27 Feb 2021 11:59:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E52D7168C;
	Sat, 27 Feb 2021 11:58:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E52D7168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614423563;
	bh=vqOTbKEtm6nlQuURqI9Nb0pMeEB45vGMiL5l+3hQ8wY=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=c/6TPh5QcEiSleLWXlo+ElrSKfwrUVkkDJr4c/knfgsZmix5/G1NyWzKQI7R0wA1h
	 7kZNjNEM6MD5JdKLE00A56SmJYEQWC4tO0EyaGKElPx3CjIctDteiGO4UAIuG7kQNB
	 pTNFTstmP5cXcKXEBCn95prGTPQo+XmjhrJp7plY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2EE3BF8016D;
	Sat, 27 Feb 2021 11:57:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BFB86F8016A; Sat, 27 Feb 2021 11:57:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 97510F80159
 for <alsa-devel@alsa-project.org>; Sat, 27 Feb 2021 11:57:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 97510F80159
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DB492AD74
 for <alsa-devel@alsa-project.org>; Sat, 27 Feb 2021 10:57:37 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: usb-audio: Drop bogus dB range in too low level
Date: Sat, 27 Feb 2021 11:57:37 +0100
Message-Id: <20210227105737.3656-1-tiwai@suse.de>
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

Some USB audio firmware seem to report broken dB values for the volume
controls, and this screws up applications like PulseAudio who blindly
trusts the given data.  For example, Edifier G2000 reports a PCM
volume from -128dB to -127dB, and this results in barely inaudible
sound.

This patch adds a sort of sanity check at parsing the dB values in
USB-audio driver and disables the dB reporting if the range looks
bogus.  Here, we assume -96dB as the bottom line of the max dB.

Note that, if one can figure out that proper dB range later, it can be
patched in the mixer maps.

BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=211929
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/mixer.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
index b1c78db0d470..b004b2e63a5d 100644
--- a/sound/usb/mixer.c
+++ b/sound/usb/mixer.c
@@ -1307,6 +1307,17 @@ static int get_min_max_with_quirks(struct usb_mixer_elem_info *cval,
 			/* totally crap, return an error */
 			return -EINVAL;
 		}
+	} else {
+		/* if the max volume is too low, it's likely a bogus range;
+		 * here we use -96dB as the threshold
+		 */
+		if (cval->dBmax <= -9600) {
+			usb_audio_info(cval->head.mixer->chip,
+				       "%d:%d: bogus dB values (%d/%d), disabling dB reporting\n",
+				       cval->head.id, mixer_ctrl_intf(cval->head.mixer),
+				       cval->dBmin, cval->dBmax);
+			cval->dBmin = cval->dBmax = 0;
+		}
 	}
 
 	return 0;
-- 
2.26.2

