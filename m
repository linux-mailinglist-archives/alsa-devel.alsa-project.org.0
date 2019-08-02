Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F2B07F640
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Aug 2019 13:56:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1451E170D;
	Fri,  2 Aug 2019 13:55:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1451E170D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564746966;
	bh=aMoq2zUXFOT/LUbqGAAtEMz4CHCv0bDAccjHYBvKLpI=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JMpqVVd4m4Zg9xKc/mEg8pFdsutwJTqSfCl3KQGc8w40GWMuAYLugwaeXPA3bMlqR
	 LDXYOcPkvblq93bdBOizcPNqSp3IAegVThXV73DLnt+z0P4MKK44sTQhrSIh2dwO63
	 4kew9r4LyrkP4wRgS+N+r9wLmdew3WgR5WM/EDxo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A70EF80519;
	Fri,  2 Aug 2019 13:52:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0E6B7F80507; Fri,  2 Aug 2019 13:52:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail.kwaak.net (gw-fsck-sorbs.kwaak.net [82.197.218.155])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BF7FBF8049B
 for <alsa-devel@alsa-project.org>; Fri,  2 Aug 2019 13:52:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BF7FBF8049B
Received: from [192.168.0.171] (port=59312 helo=lenny.kwaak.net)
 by mail.kwaak.net with esmtp (Exim 4.50)
 id 1htW6z-0006ye-J3; Fri, 02 Aug 2019 13:52:42 +0200
From: Ard van Breemen <ard@kwaak.net>
To: alsa-devel@alsa-project.org
Date: Fri,  2 Aug 2019 13:52:15 +0200
Message-Id: <20190802115215.311-3-ard@kwaak.net>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190802115215.311-1-ard@kwaak.net>
References: <20190802115215.311-1-ard@kwaak.net>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 192.168.0.171 (failed)
X-Kwaak-Spam-Score: -2.4
X-kwaak-MailScanner: Found to be clean
X-kwaak-MailScanner-SpamCheck: not spam, SpamAssassin (score=-2.119,
 required 5, AWL 0.16, BAYES_00 -2.60, DNS_FROM_AHBL_RHSBL 0.29,
 UPPERCASE_25_50 0.03)
X-MailScanner-From: ard@kwaak.net
Cc: Ard van Breemen <ard@kwaak.net>
Subject: [alsa-devel] [PATCH 2/2] ALSA snd-usb-audio: Add Pioneer DDJ-SX3
	PCM quirck.
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

The Pioneer DDJ-SX3 is a plain 12 32bit channel out and 10 channel in
PCM/midi controller. The PCM part is "vendor specific".
It needs the "ignore invalid bsynchaddress" patch as it uses 0 for that.

Signed-off-by: Ard van Breemen <ard@kwaak.net>
---
 sound/usb/quirks-table.h | 57 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/sound/usb/quirks-table.h b/sound/usb/quirks-table.h
index 9e049f60e80e..858c6fb17b78 100644
--- a/sound/usb/quirks-table.h
+++ b/sound/usb/quirks-table.h
@@ -3534,5 +3534,62 @@ AU0828_DEVICE(0x2040, 0x7270, "Hauppauge", "HVR-950Q"),
 		}
 	}
 },
+{
+	/*
+	 * PIONEER DJ DDJ-SX3
+	 * PCM is 12 channels out, 10 channels in @ 44.1 fixed
+	 * interface 0, vendor class alt setting 1 for endpoints 5 and 0x86
+	 * The feedback for the output is the input.
+	 */
+	USB_DEVICE_VENDOR_SPEC(0x2b73, 0x0023),
+	.driver_info = (unsigned long) &(const struct snd_usb_audio_quirk) {
+		.ifnum = QUIRK_ANY_INTERFACE,
+		.type = QUIRK_COMPOSITE,
+		.data = (const struct snd_usb_audio_quirk[]) {
+			{
+				.ifnum = 0,
+				.type = QUIRK_AUDIO_FIXED_ENDPOINT,
+				.data = &(const struct audioformat) {
+					.formats = SNDRV_PCM_FMTBIT_S32_LE,
+					.channels = 12,
+					.iface = 0,
+					.altsetting = 1,
+					.altset_idx = 1,
+					.endpoint = 0x05,
+					.ep_attr = USB_ENDPOINT_XFER_ISOC|
+						   USB_ENDPOINT_SYNC_ASYNC,
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
+					.formats = SNDRV_PCM_FMTBIT_S32_LE,
+					.channels = 10,
+					.iface = 0,
+					.altsetting = 1,
+					.altset_idx = 1,
+					.endpoint = 0x86,
+					.ep_attr = USB_ENDPOINT_XFER_ISOC|
+						 USB_ENDPOINT_SYNC_ASYNC|
+						 USB_ENDPOINT_USAGE_IMPLICIT_FB,
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
 
 #undef USB_DEVICE_VENDOR_SPEC
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
