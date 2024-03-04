Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C1BF086FBF5
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Mar 2024 09:34:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4D6D383E;
	Mon,  4 Mar 2024 09:33:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4D6D383E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709541242;
	bh=eYtZPEx+07UJa3cQ56bmqdmhg0yCVbIb+3F6bgoeDo0=;
	h=Date:From:To:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=R8zIfQev9mOc7jMjaTRQ+Qg8xMPqDRJ2rTHNAT/xJnXIGQA61QQbMBLDGn280gAk2
	 B2tD+NTyLxtFbBnU93clOLAqBy9xE9GU+30BXf5Xhsdh4ufYfYC6if8CvL/qRYJv7C
	 BHHDHXwFzyJRuCYk43bwQiqcgYCWjEgPWFt0rHfY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E8644F805A8; Mon,  4 Mar 2024 09:33:30 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 90703F8059F;
	Mon,  4 Mar 2024 09:33:28 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F111EF8024E; Mon,  4 Mar 2024 09:29:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EFBF2F80093
	for <alsa-devel@alsa-project.org>; Mon,  4 Mar 2024 09:29:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EFBF2F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=b4.vu header.i=@b4.vu header.a=rsa-sha256 header.s=m1
 header.b=aA1Vnvyr
Received: by m.b4.vu (Postfix, from userid 1000)
	id 48390604B9CB; Mon,  4 Mar 2024 18:59:35 +1030 (ACDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu 48390604B9CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1709540975; bh=03NkfLGbymydbLJWR1DaTvuFB7M+E8jeSeaMKnEzYPM=;
	h=Date:From:To:Cc:Subject:From;
	b=aA1VnvyrM4k/KOppt/EMYLJ95HTgWAhe2QPMyJH+9LcGmMKjzGVqv4LM4Kymssx9D
	 7xaDArDFZ20kVV/73BuVQpNYn793n3fcGjB+XqMwqwSlmC1d1KZduMhZJKfnIhTOlN
	 xjta0HjmgGYpXA8jKbSPMxJry4xBvcm5QSYR2H9JYzkavK29qgQ46p599n59uppvXN
	 0TRIgOnOE9BH4/9hLbwxe3FHtI4hKsccMDtx3hwJuNIyBxhP50EDR6HE40q5zFRN7N
	 AZWYuWYvx765F9sO9rM8x8Z7Lo2T2k/7NOLjplgZBwPRwY9D9qDQV4YOZtpzotVSa3
	 q5SdWbfXykd5Q==
Date: Mon, 4 Mar 2024 18:59:35 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org
Subject: [PATCH RESEND] conf: USB-Audio: Add more Scarlett devices to the
 IEC958 blacklist
Message-ID: <ZeWGbxZIc7AF96h0@m.b4.vu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID-Hash: PRJTK7WMHVXHDEOWXW62URAKL4HXQA3J
X-Message-ID-Hash: PRJTK7WMHVXHDEOWXW62URAKL4HXQA3J
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PRJTK7WMHVXHDEOWXW62URAKL4HXQA3J/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The Scarlett Solo and 2i2 don't have S/PDIF outputs.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 src/conf/cards/USB-Audio.conf | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/src/conf/cards/USB-Audio.conf b/src/conf/cards/USB-Audio.conf
index 80631b2e..05384a32 100644
--- a/src/conf/cards/USB-Audio.conf
+++ b/src/conf/cards/USB-Audio.conf
@@ -66,8 +66,11 @@ USB-Audio.pcm.iec958_device {
 	"Plantronics USB Headset" 999
 	"Plantronics Wireless Audio" 999
 	"SB WoW Headset" 999
+	"Scarlett 2i2 4th Gen" 999
 	"Scarlett 2i2 USB" 999
 	"Scarlett 2i4 USB" 999
+	"Scarlett Solo 4th Gen" 999
+	"Scarlett Solo USB" 999
 	"Sennheiser USB headset" 999
 	"SWTOR Gaming Headset by Razer" 999
 	"ThinkStation P620 Main" 999
-- 
2.43.0

