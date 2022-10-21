Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C46A6076E0
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Oct 2022 14:28:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 158DC43B3;
	Fri, 21 Oct 2022 14:27:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 158DC43B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666355304;
	bh=k0o3aNPWUD/SvjxWabbi8GUsNJRA/AKF8W3UBXyId2U=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=cSbzmJrM51C+MEidt322S9p1kMsn3xI+7dPia4/12/hHoUf0/jtM4E3l5P48KWhA7
	 y634+AcTfuUM8YZwqKF9/00r5P3q697IPMSdYSPHL5BHUzrLWDvzvtIov1nr4kAp8f
	 UohMhEyMjEp7kzEt+9jz1XFeSToM4R2HEtEMm37w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7853FF802E8;
	Fri, 21 Oct 2022 14:27:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 80CF0F80256; Fri, 21 Oct 2022 14:27:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3BF25F80118
 for <alsa-devel@alsa-project.org>; Fri, 21 Oct 2022 14:27:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3BF25F80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="ul5ZjBDl"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="ut38rL/X"
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7A79121FC1;
 Fri, 21 Oct 2022 12:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1666355244; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=fBKaCbBXPiqSwbJDmELMQOoQpdiFv+BTi03wxlxvGPY=;
 b=ul5ZjBDl6F/yCyXUKuq+da6OvxKNXyj7q5Pm3JatmTWZrfs/dXjwTNKL5rr0dolvedZWx8
 mmyJK3SWQ7UiUnDwklcmHM1hndNOZMdcb/7M+IJGcv/89Tcq05IuypjMf1djnwYn33Ca9q
 JPByJ6Rh7ovG6S1ZpXmp53LdKusx5WE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1666355244;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=fBKaCbBXPiqSwbJDmELMQOoQpdiFv+BTi03wxlxvGPY=;
 b=ut38rL/XNyCDGq6Rc1YwJZ9S5vND09pjyCieDsthmqcLtGcfON6B8y997pER11INdNifx4
 15WBbCIN+Cl2FNDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5D1B513A0E;
 Fri, 21 Oct 2022 12:27:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id b5LrFSyQUmM/XwAAMHmgww
 (envelope-from <tiwai@suse.de>); Fri, 21 Oct 2022 12:27:24 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: usb-audio: Add quirks for M-Audio Fast Track C400/600
Date: Fri, 21 Oct 2022 14:27:22 +0200
Message-Id: <20221021122722.24784-1-tiwai@suse.de>
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

M-Audio Fast Track C400 and C600 devices (0763:2030 and 0763:2031,
respectively) seem requiring the explicit setup for the implicit
feedback mode.  This patch adds the quirk entries for those.

BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=214817
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/implicit.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/usb/implicit.c b/sound/usb/implicit.c
index e1bf1b5da423..f3e8484b3d9c 100644
--- a/sound/usb/implicit.c
+++ b/sound/usb/implicit.c
@@ -47,6 +47,8 @@ struct snd_usb_implicit_fb_match {
 static const struct snd_usb_implicit_fb_match playback_implicit_fb_quirks[] = {
 	/* Fixed EP */
 	/* FIXME: check the availability of generic matching */
+	IMPLICIT_FB_FIXED_DEV(0x0763, 0x2030, 0x81, 3), /* M-Audio Fast Track C400 */
+	IMPLICIT_FB_FIXED_DEV(0x0763, 0x2031, 0x81, 3), /* M-Audio Fast Track C600 */
 	IMPLICIT_FB_FIXED_DEV(0x0763, 0x2080, 0x81, 2), /* M-Audio FastTrack Ultra */
 	IMPLICIT_FB_FIXED_DEV(0x0763, 0x2081, 0x81, 2), /* M-Audio FastTrack Ultra */
 	IMPLICIT_FB_FIXED_DEV(0x2466, 0x8010, 0x81, 2), /* Fractal Audio Axe-Fx III */
-- 
2.35.3

