Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D0A6194558
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Mar 2020 18:22:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1D2951672;
	Thu, 26 Mar 2020 18:21:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1D2951672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585243329;
	bh=8ruYhPBxpfhZ1HgYnYOdvyekQGeuQb0Tr8c8iz0W5Ck=;
	h=Subject:From:To:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=oJ8V7LB/mK8NuaYCRIw95mjP+9IpLFZnqvNpIIf7cNY97/j0d0ojBG/AU3x/gCATT
	 ouo30m+6Lz6jGv3k/sS6AFZ2QJkIlUM7fqtb8aQMHJrurSrBTxipxwhB3eM8AL21h2
	 vbZ/MVHYH9l1PEeVF8M4OqApyQXC5+aaPtkA5OBs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AB49CF8011B;
	Thu, 26 Mar 2020 18:20:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 22E53F80258; Thu, 26 Mar 2020 18:20:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from zeus.domdv.de (zeus.domdv.de [IPv6:2a02:2ad0:c00::11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8EC3EF801F9
 for <alsa-devel@alsa-project.org>; Thu, 26 Mar 2020 18:20:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8EC3EF801F9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=domdv.de header.i=@domdv.de
 header.b="esx2JXwk"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=domdv.de;
 s=dk3; h=Content-Transfer-Encoding:MIME-Version:Content-Type:Date:Cc:To:From
 :Subject:Message-ID:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yRQUZJGC3YBmGTFhSSBts+sowM/96XsTMNgEOnZBmCg=; b=esx2JXwkaa0hq5eUqNpjBIgSXs
 MA0rmDxqK2+SAHmNJ05QtliWnypq+7/L37XkHMKj5D4lXKaUYM0tfQT3wamObFz1XhenuIYGMCULr
 6OK/ItETFV5fkE5JG0jSWNzbRDJToIcoaKFUdWhJiL58gnZCN1EMg65Uzg9of2vvz3Jo=;
Received: from [fd06:8443:81a1:74b0::212] (port=2054 helo=castor.lan.domdv.de)
 by zeus.domdv.de with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <ast@domdv.de>)
 id 1jHW9f-00040T-VT; Thu, 26 Mar 2020 18:18:56 +0100
Received: from woody.lan.domdv.de ([10.1.9.28]
 helo=host028-server-9.lan.domdv.de)
 by castor.lan.domdv.de with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 (Exim 4.92.3) (envelope-from <ast@domdv.de>)
 id 1jHW9f-0004La-QK; Thu, 26 Mar 2020 18:18:55 +0100
Message-ID: <00decacc4cac6a9d88fe696f94a077284fb8bbb9.camel@domdv.de>
Subject: PATCH: ALSA USB MIDI: Fix case when USB MIDI interface has more
 than one extra endpoint descriptor
From: Andreas Steinmetz <ast@domdv.de>
To: alsa-devel@alsa-project.org
Date: Thu, 26 Mar 2020 18:18:55 +0100
Organization: D.O.M. Datenverarbeitung GmbH
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: clemens@ladisch.de
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

The Miditech MIDIFACE 16x16 (USB ID 1290:1749) has more than one extra
endpoint descriptor.

The first extra descriptor is: 0x06 0x30 0x00 0x00 0x00 0x00

As the code in snd_usbmidi_get_ms_info() looks only at the
first extra descriptor to find USB_DT_CS_ENDPOINT the device
as such is recognized but there is neither input nor output
configured.

The patch iterates through the extra descriptors to find the
proper one. With this patch the device is correctly configured.

Signed-off-by: Andreas Steinmetz <ast@domdv.de>

--- a/sourd/usb/midi.c	2020-03-26 17:34:40.073929497 +0100
+++ b/sound/usb/midi.c	2020-03-26 17:43:39.123252612 +0100
@@ -1839,7 +1839,8 @@
 	struct usb_host_endpoint *hostep;
 	struct usb_endpoint_descriptor *ep;
 	struct usb_ms_endpoint_descriptor *ms_ep;
-	int i, epidx;
+	int i, epidx, extralen;
+	unsigned char *extra;
 
 	intf = umidi->iface;
 	if (!intf)
@@ -1863,12 +1864,21 @@
 		ep = get_ep_desc(hostep);
 		if (!usb_endpoint_xfer_bulk(ep) && !usb_endpoint_xfer_int(ep))
 			continue;
-		ms_ep = (struct usb_ms_endpoint_descriptor *)hostep->extra;
-		if (hostep->extralen < 4 ||
+		extralen = hostep->extralen;
+		extra = hostep->extra;
+repeat:		ms_ep = (struct usb_ms_endpoint_descriptor *)extra;
+		if (extralen < 1)
+			continue;
+		if (extralen < 4 ||
 		    ms_ep->bLength < 4 ||
 		    ms_ep->bDescriptorType != USB_DT_CS_ENDPOINT ||
-		    ms_ep->bDescriptorSubtype != UAC_MS_GENERAL)
-			continue;
+		    ms_ep->bDescriptorSubtype != UAC_MS_GENERAL) {
+			if (!extra[0])
+				continue;
+			extralen -= extra[0];
+			extra += extra[0];
+			goto repeat;
+		}
 		if (usb_endpoint_dir_out(ep)) {
 			if (endpoints[epidx].out_ep) {
 				if (++epidx >= MIDI_MAX_ENDPOINTS) {

