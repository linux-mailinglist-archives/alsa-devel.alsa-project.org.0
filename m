Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F145348F60F
	for <lists+alsa-devel@lfdr.de>; Sat, 15 Jan 2022 10:10:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 360EB1B1D;
	Sat, 15 Jan 2022 10:10:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 360EB1B1D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642237853;
	bh=L02NMzlUbzAJyQaGEV7joe5ZEv1gImod2NMH6d6pK0s=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=FmH2oPH03pmJJRj2WRI5/RQvzvR2uxJ4lZmE/bBvbVB0F5JCxMr0GP/G+stlnWkr1
	 Qv5ioPtwrDNjDzKhCm+799kgxs2GHsEBWU0u8/GaKp4/mFf0CxToO+HPJrGmuCfLKm
	 fPQC1V4+j5jMY7xTPGIWMnh0j1q0sq/Iz9pzmlno=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 93FCCF8020C;
	Sat, 15 Jan 2022 10:09:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BC755F801D8; Sat, 15 Jan 2022 10:09:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 413D9F800B0
 for <alsa-devel@alsa-project.org>; Sat, 15 Jan 2022 10:09:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 413D9F800B0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="mta5Voty"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="/2cViz8Q"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 497F221999
 for <alsa-devel@alsa-project.org>; Sat, 15 Jan 2022 09:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1642237772; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=k0OnU/X79ipQplicstJsyQd+r3OEDjRGDbD4p3h7bd0=;
 b=mta5VotyYzDi+BL5PA9nmSUKwZvunrCGnUxRcKWGbDU29FYyxmP01Mew0lbVTP7zK0WPBK
 0E4EJIgYUWXVD99/W4FZxAaxpK2ZmNyft8KKgFp6uYx/TlG/OyZp8XC0G4kxM8Q7Bvyq2h
 29rBW+HTjq84NInYpyUTFHd5pdQfOF0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1642237772;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=k0OnU/X79ipQplicstJsyQd+r3OEDjRGDbD4p3h7bd0=;
 b=/2cViz8QF7pUmmgY2KNY16M7rAQEvmClNdzzP8qq4YBvfO+e342grsU4XstZAK2oIwQBVF
 o0Jjmgxjdw8TbFBw==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 399CEA3B81;
 Sat, 15 Jan 2022 09:09:32 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: core: Fix SSID quirk lookup for subvendor=0
Date: Sat, 15 Jan 2022 10:09:29 +0100
Message-Id: <20220115090929.4119-1-tiwai@suse.de>
X-Mailer: git-send-email 2.31.1
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

Some weird devices set the codec SSID vendor ID 0, and
snd_pci_quirk_lookup_id() loop aborts at the point although it should
still try matching with the SSID device ID.  This resulted in a
missing quirk for some old Macs.

Fix the loop termination condition to check both subvendor and
subdevice.

Fixes: 73355ddd8775 ("ALSA: hda: Code refactoring snd_hda_pick_fixup()")
Cc: <stable@vger.kernel.org>
BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=215495
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/misc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/core/misc.c b/sound/core/misc.c
index 3579dd7a161f..a512c849a9e5 100644
--- a/sound/core/misc.c
+++ b/sound/core/misc.c
@@ -112,7 +112,7 @@ snd_pci_quirk_lookup_id(u16 vendor, u16 device,
 {
 	const struct snd_pci_quirk *q;
 
-	for (q = list; q->subvendor; q++) {
+	for (q = list; q->subvendor && q->subdevice; q++) {
 		if (q->subvendor != vendor)
 			continue;
 		if (!q->subdevice ||
-- 
2.31.1

