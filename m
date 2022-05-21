Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B5852F966
	for <lists+alsa-devel@lfdr.de>; Sat, 21 May 2022 08:55:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E506916AE;
	Sat, 21 May 2022 08:54:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E506916AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653116127;
	bh=RJzzM0Svty+uNdx+gL/FYLuQAt2sQMpNaxWbm6W4fds=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=pWQ7Q5HiMocvXbhGjXkH94DCJy/PD+8OxvIasOYQEPJgcCrvds9ZqRYPbgmw3/gMr
	 KyzCBxZnGsMJTWyIn1313BPlal7LvYWyaDTRhszPg6cibGnGo/JlyngOnDxKYAVi+z
	 lrnnqzjS60GsDux7L/BtDJs0dM3Nh7Ayr3FMy2Vw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CB71FF80105;
	Sat, 21 May 2022 08:54:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 50009F80212; Sat, 21 May 2022 08:54:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1DDDBF80153
 for <alsa-devel@alsa-project.org>; Sat, 21 May 2022 08:53:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1DDDBF80153
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="kFzlpqIP"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="XFr5iPv2"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 602381F37C;
 Sat, 21 May 2022 06:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1653116007; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=/d8vBcGGz1Osh/ouvGRwBuIeJaIvDuAK1qsh4+3wCHQ=;
 b=kFzlpqIP5qBnieXi45XZQuCAcqQvRL8ag2n5FPA28E+xqz5E/Wn8ax3YVAOXa1pHq/GPHV
 NCF216fJGzetUQyU57r8uIiG0wMLRh86p9ajvo+PxSYh/jmNojRGbN7jeZnmYrL6MesIKx
 AGQ3dg/B2HkWD8vLBgli9yv0j77d7es=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1653116007;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=/d8vBcGGz1Osh/ouvGRwBuIeJaIvDuAK1qsh4+3wCHQ=;
 b=XFr5iPv2CUTxTfEVMZG26Sl/l9KZ+4e7PhTol1QR2UDA7u1TN0wHnohNtftYW/dAfITSb4
 U9ISHo1w1ORWbUBQ==
Received: from valkyrie.site.de (unknown [10.163.18.242])
 by relay2.suse.de (Postfix) with ESMTP id 324E12C141;
 Sat, 21 May 2022 06:53:27 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: usb-audio: Add missing ep_idx in fixed EP quirks
Date: Sat, 21 May 2022 08:53:25 +0200
Message-Id: <20220521065325.426-1-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: =?UTF-8?q?Andr=C3=A9=20Kapelrud?= <a.kapelrud@gmail.com>
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

The quirk entry for Focusrite Saffire 6 had no proper ep_idx for the
capture endpoint, and this confused the driver, resulting in the
broken sound.  This patch adds the missing ep_idx in the entry.

While we are at it, a couple of other entries (for Digidesign MBox and
MOTU MicroBook II) seem to have the same problem, and those are
covered as well.

Fixes: bf6313a0ff76 ("ALSA: usb-audio: Refactor endpoint management")
Reported-by: André Kapelrud <a.kapelrud@gmail.com>
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/quirks-table.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/usb/quirks-table.h b/sound/usb/quirks-table.h
index 40a5e3eb4ef2..78eb41b621d6 100644
--- a/sound/usb/quirks-table.h
+++ b/sound/usb/quirks-table.h
@@ -2672,6 +2672,7 @@ YAMAHA_DEVICE(0x7010, "UB99"),
 					.altset_idx = 1,
 					.attributes = 0,
 					.endpoint = 0x82,
+					.ep_idx = 1,
 					.ep_attr = USB_ENDPOINT_XFER_ISOC,
 					.datainterval = 1,
 					.maxpacksize = 0x0126,
@@ -2875,6 +2876,7 @@ YAMAHA_DEVICE(0x7010, "UB99"),
 					.altset_idx = 1,
 					.attributes = 0x4,
 					.endpoint = 0x81,
+					.ep_idx = 1,
 					.ep_attr = USB_ENDPOINT_XFER_ISOC |
 						USB_ENDPOINT_SYNC_ASYNC,
 					.maxpacksize = 0x130,
@@ -3391,6 +3393,7 @@ YAMAHA_DEVICE(0x7010, "UB99"),
 					.altset_idx = 1,
 					.attributes = 0,
 					.endpoint = 0x03,
+					.ep_idx = 1,
 					.rates = SNDRV_PCM_RATE_96000,
 					.ep_attr = USB_ENDPOINT_XFER_ISOC |
 						   USB_ENDPOINT_SYNC_ASYNC,
-- 
2.35.3

