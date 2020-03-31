Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A90199681
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Mar 2020 14:28:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C2E261671;
	Tue, 31 Mar 2020 14:27:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C2E261671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585657698;
	bh=Jky1JZxRMm1Kj/N/84TBK/ADloLtEuQGZrctWUv92Fc=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Y4u812oEXmr6PR4P7TKp8TMt/9SY1E5jRwChB7MonRSYDjYqDlW6v4oCczPvXoQY5
	 TczTRS1r08mDQL1/SRB+uGt4XZsvIi/Jn3qvQbtNL/N3gxzKxZccTHNIJBSogpMpOY
	 jsbSHffJn4de2/QdIRrdbQcAP9zKery5Hzk94xuI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 035CDF8014F;
	Tue, 31 Mar 2020 14:27:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E4269F80157; Tue, 31 Mar 2020 14:27:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from zeus.domdv.de (zeus.domdv.de [IPv6:2a02:2ad0:c00::11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 15166F8010D
 for <alsa-devel@alsa-project.org>; Tue, 31 Mar 2020 14:27:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15166F8010D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=domdv.de header.i=@domdv.de
 header.b="Wh0gtsFB"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=domdv.de;
 s=dk3; h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WUOLMV0LJUjI9PMXYZkTi5ZwUmmoAA31Y0TWNFYBk5k=; b=Wh0gtsFB0JL7PTf3NvVzVBC5cO
 rg7vxDf1+pSLyz5+qaJ/Us7VkW/sjLh+5Ebm0/vVovgrA9NUveZdLiuQdCwvLu7LSRBkPh5VqLa5W
 aDrNHJNanhb8OPqP5eXxqy3R6OAcC9dwAEJ1sfmPbKrGiKmM0DoWCpf8hl59lU/g/NEo=;
Received: from [fd06:8443:81a1:74b0::212] (port=3752 helo=castor.lan.domdv.de)
 by zeus.domdv.de with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <ast@domdv.de>)
 id 1jJFxq-0003Lr-Qb; Tue, 31 Mar 2020 14:25:54 +0200
Received: from woody.lan.domdv.de ([10.1.9.28]
 helo=host028-server-9.lan.domdv.de)
 by castor.lan.domdv.de with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 (Exim 4.92.3) (envelope-from <ast@domdv.de>)
 id 1jJFxq-0000j1-L0; Tue, 31 Mar 2020 14:25:54 +0200
Message-ID: <1c3b431a86f69e1d60745b6110cdb93c299f120b.camel@domdv.de>
Subject: PATCH v2: ALSA USB MIDI: Fix case when USB MIDI interface has more
 than one extra endpoint descriptor
From: Andreas Steinmetz <ast@domdv.de>
To: Takashi Iwai <tiwai@suse.de>
Date: Tue, 31 Mar 2020 14:25:54 +0200
In-Reply-To: <s5hh7y7czwk.wl-tiwai@suse.de>
References: <00decacc4cac6a9d88fe696f94a077284fb8bbb9.camel@domdv.de>
 <s5hh7y7czwk.wl-tiwai@suse.de>
Organization: D.O.M. Datenverarbeitung GmbH
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, clemens@ladisch.de
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

[v2: Patch reworked as per comment from Takashi Iwai.]

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

--- a/sound/usb/midi.c	2020-03-29 17:04:37.459599241 +0200
+++ b/sound/usb/midi.c	2020-03-29 17:16:23.975423372 +0200
@@ -1826,6 +1826,28 @@
 	return 0;
 }
 
+static struct usb_ms_endpoint_descriptor *find_usb_ms_endpoint_descriptor(
+					struct usb_host_endpoint *hostep)
+{
+	unsigned char *extra = hostep->extra;
+	int extralen = hostep->extralen;
+
+	while (extralen > 3) {
+		struct usb_ms_endpoint_descriptor *ms_ep =
+				(struct usb_ms_endpoint_descriptor *)extra;
+
+		if (ms_ep->bLength > 3 &&
+		    ms_ep->bDescriptorType == USB_DT_CS_ENDPOINT &&
+		    ms_ep->bDescriptorSubtype == UAC_MS_GENERAL)
+			return ms_ep;
+		if (!extra[0])
+			break;
+		extralen -= extra[0];
+		extra += extra[0];
+	}
+	return NULL;
+}
+
 /*
  * Returns MIDIStreaming device capabilities.
  */
@@ -1863,11 +1885,8 @@
 		ep = get_ep_desc(hostep);
 		if (!usb_endpoint_xfer_bulk(ep) && !usb_endpoint_xfer_int(ep))
 			continue;
-		ms_ep = (struct usb_ms_endpoint_descriptor *)hostep->extra;
-		if (hostep->extralen < 4 ||
-		    ms_ep->bLength < 4 ||
-		    ms_ep->bDescriptorType != USB_DT_CS_ENDPOINT ||
-		    ms_ep->bDescriptorSubtype != UAC_MS_GENERAL)
+		ms_ep = find_usb_ms_endpoint_descriptor(hostep);
+		if (!ms_ep)
 			continue;
 		if (usb_endpoint_dir_out(ep)) {
 			if (endpoints[epidx].out_ep) {

