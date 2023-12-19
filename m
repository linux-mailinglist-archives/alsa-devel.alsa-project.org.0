Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 975A3818E53
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Dec 2023 18:40:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1E8CFEA6;
	Tue, 19 Dec 2023 18:40:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1E8CFEA6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1703007619;
	bh=dmu5WhRsGcFZw9k5Y+O97oyAhHLWwCpvYCbBnGTC3WY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BHjicC4JJzSf9+z9vBMeQYVU2h4VM3zoXdi+y9Yd6OB+9xz9hGNgwmIzxCn6F4Drk
	 gTRhow1S2wZR34g4tq0nfmfW/8cNUSTs9rDQ+7qe7If/wxLUgKlB1Xs5Avilg/ebaS
	 DgVXw+2OF+bYVC1NnqbNcdaCmYnFUfzu7y8Xh03w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 85774F8061E; Tue, 19 Dec 2023 18:39:36 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C3A17F805AC;
	Tue, 19 Dec 2023 18:39:33 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 10DDBF8057C; Tue, 19 Dec 2023 18:39:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CC2DBF80578
	for <alsa-devel@alsa-project.org>; Tue, 19 Dec 2023 18:38:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC2DBF80578
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=b4.vu header.i=@b4.vu header.a=rsa-sha256 header.s=m1
 header.b=tb1sscCU
Received: by m.b4.vu (Postfix, from userid 1000)
	id 141F8604B9F7; Wed, 20 Dec 2023 04:08:42 +1030 (ACDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu 141F8604B9F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1703007522; bh=NHjcjEOW30LqDt4IfDXMQ9aPNo751eyY/StHwOP1mLE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tb1sscCUykSPgoRHHihX2OnSiwKUlM4LfDpvrTM051ia1FS8gbOhavuqhCSA5ntM2
	 yTVn7+GHII6JVFG0GhvPMIUBenDodRJLJ8oIrp0auU2hvTTKr74qkEnG7wHKvxaGVa
	 EmPZ17k1Jx1/Lu4e8dDehEHI5+6AJTrA5lcT1CuPeDculRlxbQ7kFDR1K87c9asAgt
	 yJ79e9ldGlDQE057gNlGeYuo9alfHvwgeYvLa4XpxfE6bZ6bErxR9Zp0d4KMADjcz5
	 CCKH6Vnyf+Z2lJcGviZl0sMf2oUBVRg0SbW8XAPFbjWkzWFDKeJqzCBTBVJmZxHjBN
	 ge5JBCR2l3bTg==
Date: Wed, 20 Dec 2023 04:08:42 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
Subject: [PATCH 07/11] ALSA: scarlett2: Add #defines for firmware upgrade
Message-ID: <3077651c21bc8d4f046c68b79ec387aa16fcc5e4.1703001053.git.g@b4.vu>
References: <cover.1703001053.git.g@b4.vu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1703001053.git.g@b4.vu>
Message-ID-Hash: 3QVAC25NSRALI6Y6FCUOLCCBLFJCUKLS
X-Message-ID-Hash: 3QVAC25NSRALI6Y6FCUOLCCBLFJCUKLS
X-MailFrom: g@b4.vu
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3QVAC25NSRALI6Y6FCUOLCCBLFJCUKLS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add #defines for SCARLETT2_USB_* needed for firmware upgrade:
reboot, info-flash, info-segment, erase-segment, get-erase, and
write-segment.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_scarlett2.c | 28 +++++++++++++++++-----------
 1 file changed, 17 insertions(+), 11 deletions(-)

diff --git a/sound/usb/mixer_scarlett2.c b/sound/usb/mixer_scarlett2.c
index 73f5badceb19..129b9c97871a 100644
--- a/sound/usb/mixer_scarlett2.c
+++ b/sound/usb/mixer_scarlett2.c
@@ -1137,17 +1137,23 @@ static int scarlett2_get_port_start_num(
 #define SCARLETT2_USB_CMD_REQ  2
 #define SCARLETT2_USB_CMD_RESP 3
 
-#define SCARLETT2_USB_INIT_1    0x00000000
-#define SCARLETT2_USB_INIT_2    0x00000002
-#define SCARLETT2_USB_GET_METER 0x00001001
-#define SCARLETT2_USB_GET_MIX   0x00002001
-#define SCARLETT2_USB_SET_MIX   0x00002002
-#define SCARLETT2_USB_GET_MUX   0x00003001
-#define SCARLETT2_USB_SET_MUX   0x00003002
-#define SCARLETT2_USB_GET_SYNC  0x00006004
-#define SCARLETT2_USB_GET_DATA  0x00800000
-#define SCARLETT2_USB_SET_DATA  0x00800001
-#define SCARLETT2_USB_DATA_CMD  0x00800002
+#define SCARLETT2_USB_INIT_1        0x00000000
+#define SCARLETT2_USB_INIT_2        0x00000002
+#define SCARLETT2_USB_REBOOT        0x00000003
+#define SCARLETT2_USB_GET_METER     0x00001001
+#define SCARLETT2_USB_GET_MIX       0x00002001
+#define SCARLETT2_USB_SET_MIX       0x00002002
+#define SCARLETT2_USB_GET_MUX       0x00003001
+#define SCARLETT2_USB_SET_MUX       0x00003002
+#define SCARLETT2_USB_INFO_FLASH    0x00004000
+#define SCARLETT2_USB_INFO_SEGMENT  0x00004001
+#define SCARLETT2_USB_ERASE_SEGMENT 0x00004002
+#define SCARLETT2_USB_GET_ERASE     0x00004003
+#define SCARLETT2_USB_WRITE_SEGMENT 0x00004004
+#define SCARLETT2_USB_GET_SYNC      0x00006004
+#define SCARLETT2_USB_GET_DATA      0x00800000
+#define SCARLETT2_USB_SET_DATA      0x00800001
+#define SCARLETT2_USB_DATA_CMD      0x00800002
 
 #define SCARLETT2_USB_CONFIG_SAVE 6
 
-- 
2.43.0

