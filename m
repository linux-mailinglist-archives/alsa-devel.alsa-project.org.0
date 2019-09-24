Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD86BC260
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Sep 2019 09:13:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E592A16C1;
	Tue, 24 Sep 2019 09:12:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E592A16C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569309226;
	bh=dvNYEv6hIScOOHIQ+R6RQH2fjnX+6ZTYg3fyl3g4X+Q=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=n8qUxMHSlAH9sHEd3YQ4TnRZLhwQzwIqHoBKJlYQrKLBeO3XQnPmeBnAD6/LFd3Bm
	 6IQiJWvJepMxgZByRA2y9VLQUTV0he7coLoEelfKZeLGfSjGej/qa2nVIhiTfSaRzS
	 tnAOYE+E1z1FgbCmmnIW9+66GL17a77Oi1wnFTSg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 467C3F803F4;
	Tue, 24 Sep 2019 09:12:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3FD8FF8045F; Tue, 24 Sep 2019 09:11:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail.sonarnerd.net (rankki.sonarnerd.net [194.142.149.154])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D62FAF802BD
 for <alsa-devel@alsa-project.org>; Tue, 24 Sep 2019 09:11:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D62FAF802BD
Received: from porkkala.uworld (porkkala.uworld [IPv6:fc00::2])
 by mail.sonarnerd.net (Postfix) with ESMTP id B7D4C2311F0;
 Tue, 24 Sep 2019 10:11:54 +0300 (EEST)
From: Jussi Laako <jussi@sonarnerd.net>
To: alsa-devel@alsa-project.org
Date: Tue, 24 Sep 2019 10:11:43 +0300
Message-Id: <20190924071143.30911-1-jussi@sonarnerd.net>
X-Mailer: git-send-email 2.17.1
Cc: tiwai@suse.de, Jussi Laako <jussi@sonarnerd.net>
Subject: [alsa-devel] [PATCH] ALSA: usb-audio: Add DSD support for EVGA NU
	Audio
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

EVGA NU Audio is actually a USB audio device on a PCIexpress card,
with it's own USB controller. It supports both PCM and DSD.

Signed-off-by: Jussi Laako <jussi@sonarnerd.net>
---
 sound/usb/quirks.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 5fd4ccce452d..fbfde996fee7 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -1658,6 +1658,7 @@ u64 snd_usb_interface_dsd_format_quirks(struct snd_usb_audio *chip,
 	case 0x25ce:  /* Mytek devices */
 	case 0x278b:  /* Rotel? */
 	case 0x2ab6:  /* T+A devices */
+	case 0x3842:  /* EVGA */
 	case 0xc502:  /* HiBy devices */
 		if (fp->dsd_raw)
 			return SNDRV_PCM_FMTBIT_DSD_U32_BE;
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
