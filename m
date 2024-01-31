Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1234184B1D8
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Feb 2024 11:02:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A409CE9F;
	Tue,  6 Feb 2024 11:01:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A409CE9F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707213719;
	bh=H+tmu/Sh6CVTAllgTauOJsgePd6UsJx+qFoGl/IREEw=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=lELLYbxoFEq5Pp/vkuFErgdzIhW3oHR2X9oz2hY7OT1OoH7CNDw5OqGlKwk6il7Gn
	 MtDFXB4uYlWGVQqgHRr/lhJv1T4oV/mXde4/un1C1xJt/Fgn/s/jexuohgyHV0/oY+
	 xQt8FF6eUM13NJuPgh1iCfx5mB0DmKuaP2aKgxBM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C9662F805E5; Tue,  6 Feb 2024 11:00:06 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D1A44F805E6;
	Tue,  6 Feb 2024 11:00:05 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D05B2F8055C; Wed, 31 Jan 2024 21:28:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from moon.nrp.de (moon.nrp.de [IPv6:2a01:4f8:c010:47c8::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D387CF80149
	for <alsa-devel@alsa-project.org>; Wed, 31 Jan 2024 21:28:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D387CF80149
Received: from localhost (localhost [127.0.0.1])
	by moon.nrp.de (Postfix) with ESMTP id 1BE4863A44;
	Wed, 31 Jan 2024 21:28:50 +0100 (CET)
X-Virus-Scanned: amavisd-new at nrp.de
Received: from moon.nrp.de ([127.0.0.1])
	by localhost (moon.nrp.de [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mCwj1Ia_jNZb; Wed, 31 Jan 2024 21:28:49 +0100 (CET)
Received: from pc.localnet
 (p200300C2772533007e10c9FFFeB87dc5.dip0.t-ipconnect.de
 [IPv6:2003:c2:7725:3300:7e10:c9ff:feb8:7dc5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(Client did not present a certificate)
	by moon.nrp.de (Postfix) with ESMTPSA id EFEA863A35;
	Wed, 31 Jan 2024 21:28:48 +0100 (CET)
From: rp@nrp.de
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de
Subject: [PATCH] ALSA: usb-audio: Add quirk for PioneerDJ DDJ-1000
Date: Wed, 31 Jan 2024 21:28:48 +0100
Message-ID: <2322911.ElGaqSPkdT@pc>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-MailFrom: rp@nrp.de
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: WSIPYR4B7375KR3GPA2RDHLZFHP6DPRX
X-Message-ID-Hash: WSIPYR4B7375KR3GPA2RDHLZFHP6DPRX
X-Mailman-Approved-At: Tue, 06 Feb 2024 09:59:57 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Problems:
	- PioneerDJ DDJ-1000 audio channels are not recognized.
	- Jog dial displays are showing permanently "NO AUDIO DRIVER" 

The attached patch fixes this.
The jog displays and all output and input channels are working now.

Signed-off-by: Ralf Pachali <rp@nrp.de>

--- sound/usb/quirks-table.h
+++ sound/usb/quirks-table.h
@@ -3942,6 +3942,64 @@
 	}
 },
 
+{
+	/*
+	 * PIONEER DJ DDJ-1000
+	 * PCM is 6 channels out, 12 channels in @ 44.1 fixed
+	 * The Feedback for the output is the input
+	 */
+	USB_DEVICE_VENDOR_SPEC(0x2b73, 0x0020),
+		.driver_info = (unsigned long) &(const struct snd_usb_audio_quirk) {
+		.ifnum = QUIRK_ANY_INTERFACE,
+		.type = QUIRK_COMPOSITE,
+		.data = (const struct snd_usb_audio_quirk[]) {
+			{
+				.ifnum = 0,
+				.type = QUIRK_AUDIO_FIXED_ENDPOINT,
+				.data = &(const struct audioformat) {
+					.formats = SNDRV_PCM_FMTBIT_S24_3LE,
+					.channels = 6,
+					.iface = 0,
+					.altsetting = 1,
+					.altset_idx = 1,
+					.endpoint = 0x01,
+					.ep_attr = USB_ENDPOINT_XFER_ISOC|
+						USB_ENDPOINT_SYNC_ASYNC,
+					.rates = SNDRV_PCM_RATE_44100,
+					.rate_min = 44100,
+					.rate_max = 44100,
+					.nr_rates = 1,
+					.rate_table = (unsigned int[]) { 44100 }
+				}
+			},
+			{
+				.ifnum = 0,
+				.type = QUIRK_AUDIO_FIXED_ENDPOINT,
+				.data = &(const struct audioformat) {
+					.formats = SNDRV_PCM_FMTBIT_S24_3LE,
+					.channels = 12,
+					.iface = 0,
+					.altsetting = 1,
+					.altset_idx = 1,
+					.endpoint = 0x82,
+					.ep_idx = 1,
+					.ep_attr = USB_ENDPOINT_XFER_ISOC|
+						USB_ENDPOINT_SYNC_ASYNC|
+					USB_ENDPOINT_USAGE_IMPLICIT_FB,
+					.rates = SNDRV_PCM_RATE_44100,
+					.rate_min = 44100,
+					.rate_max = 44100,
+					.nr_rates = 1,
+					.rate_table = (unsigned int[]) { 44100 }
+				}
+			},
+			{
+				.ifnum = -1
+			}
+		}
+	}
+},
+
 /*
  * MacroSilicon MS2100/MS2106 based AV capture cards
  *
--- sound/usb/quirks.c
+++ sound/usb/quirks.c
@@ -1390,6 +1390,16 @@
 	return 0;
 }
 
+static int snd_usb_pioneer_ddj1000_boot_quirk(struct usb_device *dev)
+{
+	/* disable "no audio driver" message on jog wheel displays */
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0), 0,
+			USB_DIR_IN | USB_TYPE_VENDOR | USB_RECIP_DEVICE,
+			0, 0x8003, NULL, 0);
+
+	return 0;
+}
+
 /*
  * Setup quirks
  */
@@ -1630,6 +1640,8 @@
 	switch (id) {
 	case USB_ID(0x07fd, 0x0008): /* MOTU M Series */
 		return snd_usb_motu_m_series_boot_quirk(dev);
+	case USB_ID(0x2b73, 0x0020): /* Pioneer DDJ-1000 */
+		return snd_usb_pioneer_ddj1000_boot_quirk(dev);
 	}
 
 	return 0;



