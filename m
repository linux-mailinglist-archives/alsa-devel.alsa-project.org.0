Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE6B76FDB5
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Aug 2023 11:46:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CF4B2847;
	Fri,  4 Aug 2023 11:45:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CF4B2847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691142364;
	bh=RPg+ldLp7Md/Q2X3VhrsjjAlAybedZ/hp81D2bwwHS4=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=AWwYf/0CncG4oE7tpWLhtruK8ozR9Jl++TmpRmGmXIzhK/4Ot5Sst2FkiAFR4hwA+
	 pjdWdkZBzHGZshtT4dHEZj/jXNDb+OsaAArWjvO1GFZ2F+r0aeb0UjxcBCzbJmRvVw
	 4GI0WcK2UXhHgKNyd8Poif7SYCQX9/JunEWOMxDE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AC03AF805D4; Fri,  4 Aug 2023 11:43:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 12033F805C7;
	Fri,  4 Aug 2023 11:43:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 27340F8025A; Thu,  3 Aug 2023 04:47:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=5.0 tests=RCVD_IN_DNSWL_HI,RDNS_NONE,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail.nfschina.com (unknown [42.101.60.195])
	by alsa1.perex.cz (Postfix) with SMTP id 3A17DF80149
	for <alsa-devel@alsa-project.org>; Thu,  3 Aug 2023 04:46:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3A17DF80149
Received: from localhost.localdomain (unknown [180.167.10.98])
	by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPA id 91E3060679448;
	Thu,  3 Aug 2023 10:46:49 +0800 (CST)
X-MD-Sfrom: dengxiang@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: dengxiang <dengxiang@nfschina.com>
To: tiwai@suse.com,
	perex@perex.cz,
	alsa-devel@alsa-project.org
Cc: linux-kernel@vger.kernel.org,
	dengxiang@nfschina.com
Subject: [PATCH] ALSA: usb-audio: Add support for Mythware XA001AU capture and
 playback interfaces.
Date: Thu,  3 Aug 2023 10:44:37 +0800
Message-Id: <20230803024437.370069-1-dengxiang@nfschina.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: dengxiang@nfschina.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: DDPEXDKBPEMYEDRGQAC5EXF7LODDNP2O
X-Message-ID-Hash: DDPEXDKBPEMYEDRGQAC5EXF7LODDNP2O
X-Mailman-Approved-At: Fri, 04 Aug 2023 09:42:54 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DDPEXDKBPEMYEDRGQAC5EXF7LODDNP2O/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patch adds a USB quirk for Mythware XA001AU USB interface.

Signed-off-by: dengxiang <dengxiang@nfschina.com>
---
 sound/usb/quirks-table.h | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/sound/usb/quirks-table.h b/sound/usb/quirks-table.h
index efb4a3311cc5..5d72dc8441cb 100644
--- a/sound/usb/quirks-table.h
+++ b/sound/usb/quirks-table.h
@@ -4507,6 +4507,35 @@ YAMAHA_DEVICE(0x7010, "UB99"),
 		}
 	}
 },
+{
+	/* Advanced modes of the Mythware XA001AU.
+	 * For the standard mode, Mythware XA001AU has ID ffad:a001
+	 */
+	USB_DEVICE_VENDOR_SPEC(0xffad, 0xa001),
+	.driver_info = (unsigned long) &(const struct snd_usb_audio_quirk) {
+		.vendor_name = "Mythware",
+		.product_name = "XA001AU",
+		.ifnum = QUIRK_ANY_INTERFACE,
+		.type = QUIRK_COMPOSITE,
+		.data = (const struct snd_usb_audio_quirk[]) {
+			{
+				.ifnum = 0,
+				.type = QUIRK_IGNORE_INTERFACE,
+			},
+			{
+				.ifnum = 1,
+				.type = QUIRK_AUDIO_STANDARD_INTERFACE,
+			},
+			{
+				.ifnum = 2,
+				.type = QUIRK_AUDIO_STANDARD_INTERFACE,
+			},
+			{
+				.ifnum = -1
+			}
+		}
+	}
+},
 
 #undef USB_DEVICE_VENDOR_SPEC
 #undef USB_AUDIO_DEVICE
-- 
2.30.2

