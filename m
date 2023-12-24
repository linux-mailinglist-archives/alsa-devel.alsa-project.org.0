Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 58EE881DC1C
	for <lists+alsa-devel@lfdr.de>; Sun, 24 Dec 2023 20:29:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D818CE8C;
	Sun, 24 Dec 2023 20:29:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D818CE8C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1703446169;
	bh=VPUHtLGaEHArWfSgx0JBRkKYgUYkZEW1osdvqKx3fEM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=I3cMEVez9CegfQTG81wzgTxIGjlhTs+vGIubZ0TE4e5GwFg8AFKJXvtMV1qoLQgxe
	 IJ/EHKjTtsy9W04g/AiwezhPmo35uxDpdVK+iwCeSJBzQ6CwbYCJ6Ekve30sPIGjx9
	 KqnxsVYt636qs/SixrNLjMdIMkky0JVjUXrKrJF8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0A380F805FC; Sun, 24 Dec 2023 20:28:35 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 61DE7F805B4;
	Sun, 24 Dec 2023 20:28:35 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B1307F80563; Sun, 24 Dec 2023 20:28:31 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 42A2DF80568
	for <alsa-devel@alsa-project.org>; Sun, 24 Dec 2023 20:28:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42A2DF80568
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=b4.vu header.i=@b4.vu header.a=rsa-sha256 header.s=m1
 header.b=ka3SErqh
Received: by m.b4.vu (Postfix, from userid 1000)
	id A537A604B9CB; Mon, 25 Dec 2023 05:58:07 +1030 (ACDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu A537A604B9CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1703446087; bh=bmNM1ND3vfad5XE2niTPvlky+2mjYuCyMeKzrMFpkgw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ka3SErqhlyDDRuqAodbhYQcmw4v19gdRpBuqHpCeTKTmEc9jpF3Z+j65aI13Aew1/
	 2HBt2y3CGwVu90kJSsNux9hl7T6vKgutaQhdwVAfrQn9hVmeFCOwWBtgZSNKAIZ0wz
	 iJqvALvlf4/XmOpSvfUkl4uO6eVU7cOzkImt3iwE1r8HCXDWlqmmkywxxXVfVws3B6
	 0QP5xmHG0YjwecrA/qXf6vsvKWTil9+e37Q952dB62Tfp42ussDvhMprNRvwoy07Ja
	 ghQw4BHvYHshzLD/I5MMn157lWcEPuZjTuXTj/nrwhsC98rcc56vykSF0jCEWPmQ7x
	 TNutmmlpBxgYQ==
Date: Mon, 25 Dec 2023 05:58:07 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: [PATCH 13/23] ALSA: scarlett2: Change num_mux_* from int to u8
Message-ID: <886fbd9ce7f06b13c6dbf36f64e6b2d107d16a83.1703444932.git.g@b4.vu>
References: <cover.1703444932.git.g@b4.vu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1703444932.git.g@b4.vu>
Message-ID-Hash: 4UWY7STKDRFQ4S4URIOSSUCD5S75BV5V
X-Message-ID-Hash: 4UWY7STKDRFQ4S4URIOSSUCD5S75BV5V
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4UWY7STKDRFQ4S4URIOSSUCD5S75BV5V/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

num_mux_srcs and num_mux_dsts will fit into a u8, so change the type.
More similar counts are coming soon.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_scarlett2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/usb/mixer_scarlett2.c b/sound/usb/mixer_scarlett2.c
index 64476922eee8..341f23d448bc 100644
--- a/sound/usb/mixer_scarlett2.c
+++ b/sound/usb/mixer_scarlett2.c
@@ -607,8 +607,8 @@ struct scarlett2_data {
 	__u8 bEndpointAddress;
 	__u16 wMaxPacketSize;
 	__u8 bInterval;
-	int num_mux_srcs;
-	int num_mux_dsts;
+	u8 num_mux_srcs;
+	u8 num_mux_dsts;
 	u32 firmware_version;
 	u8 flash_segment_nums[SCARLETT2_SEGMENT_ID_COUNT];
 	u8 flash_segment_blocks[SCARLETT2_SEGMENT_ID_COUNT];
-- 
2.43.0

