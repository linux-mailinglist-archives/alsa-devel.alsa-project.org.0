Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BB71F533C86
	for <lists+alsa-devel@lfdr.de>; Wed, 25 May 2022 14:21:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 510C3166D;
	Wed, 25 May 2022 14:20:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 510C3166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653481290;
	bh=dHCpC52q14UKeud9YYZvpWEYHzyxCxY5z/moKkOrj4U=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=CF3u4KoXuKmZ2Zv7BXo3D1hA1Z7U/T5bwuHj07BWwd0hvk3jTCsN5tnXumS13/uIe
	 E0Vgzp6ri/gDkDr0iR01Ac7LMFmsnSkTHB21H4P81kvKIXw3Or6iA252apy33hHdrR
	 bPo0er6ooJ4nGPHL9GHqbjAWgCppgFIHrApTOksc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B1415F800D0;
	Wed, 25 May 2022 14:20:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 53151F8016D; Wed, 25 May 2022 14:20:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5CECFF800D0
 for <alsa-devel@alsa-project.org>; Wed, 25 May 2022 14:20:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5CECFF800D0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="eKj6l1us"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="qGF8pq61"
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id ACB61219B4;
 Wed, 25 May 2022 12:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1653481220; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=HRexfksyf77MhnIbGs8694HZUXelGxKSy8Y1D65x/vc=;
 b=eKj6l1useC8R72Jb55hZaLhmbtLOZZJ0NtxYwMP2n+/dCl9TdQmLWkLPFqoiDr1hMFQ7L1
 HZzmci1T1CcUTmTKh72Esw8+2iFHrxWx12xkdGGcaCG7j7CXTJN1Au/6XkRnfuziiOTFrz
 OMFOBuWJEKfeQodr7Ux8GZuoEdlwmeE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1653481220;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=HRexfksyf77MhnIbGs8694HZUXelGxKSy8Y1D65x/vc=;
 b=qGF8pq61k5Wkyd7HZrkiP3raoapSPNy1EIgF7RgxV47CjdQhcheoOvsDaFdMSRFiPHnZqj
 VTH12Lslrt+SANBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8A17B13487;
 Wed, 25 May 2022 12:20:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id VRYGIQQfjmL4KwAAMHmgww
 (envelope-from <tiwai@suse.de>); Wed, 25 May 2022 12:20:20 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: usb-audio: Add mixer mapping for Gigabyte B450/550 Mobos
Date: Wed, 25 May 2022 14:20:18 +0200
Message-Id: <20220525122018.3299-1-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Brock Szuszczewicz <brock@system76.com>
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

This patch implements a static mapping for Gigabyte B450/550 Mobos so
that the mixer elements appear reasonably and jack detections work
properly.

Reported-and-tested-by: Brock Szuszczewicz <brock@system76.com>
BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=215988
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/mixer_maps.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/sound/usb/mixer_maps.c b/sound/usb/mixer_maps.c
index 7ef7a8abcc2b..3c795675f048 100644
--- a/sound/usb/mixer_maps.c
+++ b/sound/usb/mixer_maps.c
@@ -439,6 +439,31 @@ static const struct usbmix_name_map msi_mpg_x570s_carbon_max_wifi_alc4080_map[]
 	{}
 };
 
+/* Gigabyte B450/550 Mobo */
+static const struct usbmix_name_map gigabyte_b450_map[] = {
+	{ 24, NULL },			/* OT, IEC958?, disabled */
+	{ 21, "Speaker" },		/* OT */
+	{ 29, "Speaker Playback" },	/* FU */
+	{ 22, "Headphone" },		/* OT */
+	{ 30, "Headphone Playback" },	/* FU */
+	{ 11, "Line" },			/* IT */
+	{ 27, "Line Capture" },		/* FU */
+	{ 12, "Mic" },			/* IT */
+	{ 28, "Mic Capture" },		/* FU */
+	{ 9, "Front Mic" },		/* IT */
+	{ 25, "Front Mic Capture" },	/* FU */
+	{}
+};
+
+static const struct usbmix_connector_map gigabyte_b450_connector_map[] = {
+	{ 13, 21 },	/* Speaker */
+	{ 14, 22 },	/* Headphone */
+	{ 19, 11 },	/* Line */
+	{ 20, 12 },	/* Mic */
+	{ 17, 9 },	/* Front Mic */
+	{}
+};
+
 /*
  * Control map entries
  */
@@ -581,6 +606,11 @@ static const struct usbmix_ctl_map usbmix_ctl_maps[] = {
 		.map = trx40_mobo_map,
 		.connector_map = trx40_mobo_connector_map,
 	},
+	{	/* Gigabyte B450/550 Mobo */
+		.id = USB_ID(0x0414, 0xa00d),
+		.map = gigabyte_b450_map,
+		.connector_map = gigabyte_b450_connector_map,
+	},
 	{	/* ASUS ROG Zenith II */
 		.id = USB_ID(0x0b05, 0x1916),
 		.map = asus_rog_map,
-- 
2.35.3

