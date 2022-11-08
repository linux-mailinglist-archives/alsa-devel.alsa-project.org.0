Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D54C621EE6
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Nov 2022 23:14:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E968A836;
	Tue,  8 Nov 2022 23:13:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E968A836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667945645;
	bh=yfNhhOKJ2qlg/AWA6EO7O9Vq1GmOAMh1xLpxJBPeUlg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PtifOxoiu6iapBR2DFJa2kRqrf6yd/fTdLxLj6UuHJ5NFLjCaMnoHwr9zzW5jhqR+
	 m32HnvR8LQGXwl8S92NRdFEqA1feo6gu26voteqpKZGG5yqU1pCeF7qGkVxIQKCOq/
	 J+D3SBKjzTeEPcPcPDb710vUozMZXi1NklR8OquE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6D603F8020D;
	Tue,  8 Nov 2022 23:13:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 36B05F801D8; Tue,  8 Nov 2022 23:13:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled
 version=3.4.0
Received: from mail.sonarnerd.net (rankki.sonarnerd.net [194.157.85.202])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E8214F800F4
 for <alsa-devel@alsa-project.org>; Tue,  8 Nov 2022 23:13:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8214F800F4
Received: from porkkala.uworld (porkkala.uworld [IPv6:fc00::2])
 by mail.sonarnerd.net (Postfix) with ESMTP id 5F583231091;
 Wed,  9 Nov 2022 00:12:58 +0200 (EET)
From: Jussi Laako <jussi@sonarnerd.net>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: usb-audio: Add DSD support for Accuphase DAC-60
Date: Wed,  9 Nov 2022 00:12:41 +0200
Message-Id: <20221108221241.1220878-1-jussi@sonarnerd.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Jussi Laako <jussi@sonarnerd.net>
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

Accuphase DAC-60 option card supports native DSD up to DSD256,
but doesn't have support for auto-detection. Explicitly enable
DSD support for the correct altsetting.

Signed-off-by: Jussi Laako <jussi@sonarnerd.net>
---
 sound/usb/quirks.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 2dd19a5c3026..aedc3987a4cf 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -1875,6 +1875,7 @@ u64 snd_usb_interface_dsd_format_quirks(struct snd_usb_audio *chip,
 	/* XMOS based USB DACs */
 	switch (chip->usb_id) {
 	case USB_ID(0x1511, 0x0037): /* AURALiC VEGA */
+	case USB_ID(0x21ed, 0xd75a): /* Accuphase DAC-60 option card */
 	case USB_ID(0x2522, 0x0012): /* LH Labs VI DAC Infinity */
 	case USB_ID(0x2772, 0x0230): /* Pro-Ject Pre Box S2 Digital */
 		if (fp->altsetting == 2)
-- 
2.34.1

