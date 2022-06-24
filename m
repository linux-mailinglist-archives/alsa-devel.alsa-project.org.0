Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9CB55976A
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Jun 2022 12:12:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DEB941895;
	Fri, 24 Jun 2022 12:11:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DEB941895
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656065566;
	bh=UBgJKQnJneZieJpaeJdBneqkibCUH3xfQ8g4Car3bGw=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YBpMshbyswe0FuJD7nL27EYSQbGmVFufzH20OO/IBmQ+Q0YWmhQXTA2aa4s87XhPD
	 QoFXAT9ti/YPNS9ZYvGzxAZixMtzEfOwRueKSKouz9v/wTQzB9iRFgfk0kGea/mvbO
	 +feCChJ330JD8qVBjCaicY+tVj5AnqfarIAFs+Zg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 499EFF80165;
	Fri, 24 Jun 2022 12:11:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 68641F80139; Fri, 24 Jun 2022 12:11:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4403BF80109
 for <alsa-devel@alsa-project.org>; Fri, 24 Jun 2022 12:11:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4403BF80109
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="tX4sBM9f"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="lInipVxM"
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2910E1F8BD;
 Fri, 24 Jun 2022 10:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1656065496; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=oQqRqZOsg2TyA1UIU2LTuPnPHMA4RBT7ebtsqrjDj00=;
 b=tX4sBM9f3I+831EEwXa8RurPkc0GBR3NyppAAJUuzEWQwnztrbcMaIh8TOMrnWyFH/QI8J
 PXvXuyN9cu9ZdF6I4GPXl7CXhUYyKsYWpv2phGcHgPvlgQ0fGgjJstHgyAUGbwd0UKU0Ur
 HMJ6l+3Raz07MZsv6XlAmzECcB6Oqek=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1656065496;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=oQqRqZOsg2TyA1UIU2LTuPnPHMA4RBT7ebtsqrjDj00=;
 b=lInipVxMx0uYbveQc6PJV0QFSc8qNhSAL8ZSzWJvuA2cSg08dhhvnWgGI4ewGBcq83sVRk
 S009ruw4XGVCfYBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0EA2813ACA;
 Fri, 24 Jun 2022 10:11:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id frHAAtiNtWKfHwAAMHmgww
 (envelope-from <tiwai@suse.de>); Fri, 24 Jun 2022 10:11:36 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: usb-audio: Workarounds for Behringer UMC 204/404 HD
Date: Fri, 24 Jun 2022 12:11:32 +0200
Message-Id: <20220624101132.14528-1-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
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

Both Behringer UMC 202 HD and 404 HD need explicit quirks to enable
the implicit feedback mode and start the playback stream primarily.
The former seems fixing the stuttering and the latter is required for
a playback-only case.

Note that the "clock source 41 is not valid" error message still
appears even after this fix, but it should be only once at probe.
The reason of the error is still unknown, but this seems to be mostly
harmless as it's a one-off error and the driver retires the clock
setup and it succeeds afterwards.

BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=215934
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/quirks.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index e8468f9b007d..12ce69b04f63 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -1842,6 +1842,10 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 		   QUIRK_FLAG_SHARE_MEDIA_DEVICE | QUIRK_FLAG_ALIGN_TRANSFER),
 	DEVICE_FLG(0x1395, 0x740a, /* Sennheiser DECT */
 		   QUIRK_FLAG_GET_SAMPLE_RATE),
+	DEVICE_FLG(0x1397, 0x0508, /* Behringer UMC204HD */
+		   QUIRK_FLAG_PLAYBACK_FIRST | QUIRK_FLAG_GENERIC_IMPLICIT_FB),
+	DEVICE_FLG(0x1397, 0x0509, /* Behringer UMC404HD */
+		   QUIRK_FLAG_PLAYBACK_FIRST | QUIRK_FLAG_GENERIC_IMPLICIT_FB),
 	DEVICE_FLG(0x13e5, 0x0001, /* Serato Phono */
 		   QUIRK_FLAG_IGNORE_CTL_ERROR),
 	DEVICE_FLG(0x154e, 0x1002, /* Denon DCD-1500RE */
-- 
2.35.3

