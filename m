Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E051126EC54
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Sep 2020 04:12:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 818791751;
	Fri, 18 Sep 2020 04:11:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 818791751
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600395156;
	bh=ZOdhtg283gl1Kqzsq95npru5wbrb0UGgTLxBg0NezjI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BUGQFa8DvHepnTtMRlCLQ8lUAeQxD7kJN4yc9e46lWpoWAmLcK9c5BWoXs1gDHIqV
	 y/TVzgSVluTu7GULGhm+D+wqHUO56l2pT3Wx7TjspCA7nFu189ZbkTgNcG9Q/57/PU
	 q44z9ylcXBE5ofHJwAuE0KvHJK01dsmT2Xe9rcoY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E610CF8012D;
	Fri, 18 Sep 2020 04:10:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DCB0BF802C4; Fri, 18 Sep 2020 04:10:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 55CB6F8015C
 for <alsa-devel@alsa-project.org>; Fri, 18 Sep 2020 04:10:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 55CB6F8015C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="MbBPexjF"
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 27112208DB;
 Fri, 18 Sep 2020 02:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600395044;
 bh=ZOdhtg283gl1Kqzsq95npru5wbrb0UGgTLxBg0NezjI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MbBPexjFRF0ZV0pCaAT7aJBe9KztMu7uguKWPoMQ8Yf1QCkUplDOZHVIjZ/Tfzye1
 WBLI7MSkBPSEGVR+iqVb0EhlrOVTb8ck5GDsgMxNmnjqDp+t10ZxpCbtxOkSbhI+SM
 pf/LyGsZdZkEcnih9SWoTSVRakXG7udnhZhZznu8=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 134/206] ALSA: usb-audio: Fix case when USB MIDI
 interface has more than one extra endpoint descriptor
Date: Thu, 17 Sep 2020 22:06:50 -0400
Message-Id: <20200918020802.2065198-134-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200918020802.2065198-1-sashal@kernel.org>
References: <20200918020802.2065198-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>, Sasha Levin <sashal@kernel.org>,
 alsa-devel@alsa-project.org, Andreas Steinmetz <ast@domdv.de>
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

From: Andreas Steinmetz <ast@domdv.de>

[ Upstream commit 5c6cd7021a05a02fcf37f360592d7c18d4d807fb ]

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
Link: https://lore.kernel.org/r/1c3b431a86f69e1d60745b6110cdb93c299f120b.camel@domdv.de
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/usb/midi.c | 29 ++++++++++++++++++++++++-----
 1 file changed, 24 insertions(+), 5 deletions(-)

diff --git a/sound/usb/midi.c b/sound/usb/midi.c
index 28a3ad8b1d74b..137e1e8718d6f 100644
--- a/sound/usb/midi.c
+++ b/sound/usb/midi.c
@@ -1828,6 +1828,28 @@ static int snd_usbmidi_create_endpoints(struct snd_usb_midi *umidi,
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
@@ -1865,11 +1887,8 @@ static int snd_usbmidi_get_ms_info(struct snd_usb_midi *umidi,
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
-- 
2.25.1

