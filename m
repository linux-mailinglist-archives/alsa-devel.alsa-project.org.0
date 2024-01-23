Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ABAF839067
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Jan 2024 14:47:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 889FA204;
	Tue, 23 Jan 2024 14:47:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 889FA204
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706017650;
	bh=ARkDdwdsBsnxFsfJzyLNyikn0zpjXceKvmHfKKzd23Q=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ZPG/80egb8kdQ29GlMQ4X6+JF9I37fJ6fTGTaR3VnOR0YzC34TmA3IP6CyMO2fd+/
	 ZgDOI4ssU7CPYZnWtKj5/EHTYZnEM7rHmaeBizLL2G/eUbi+DfGkCrTvbjOa/O9Gc2
	 rx85k9OMnkxoO3rhp9u3UhQgxOkD51biCQBZa/bo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 53798F80579; Tue, 23 Jan 2024 14:46:59 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C346EF80568;
	Tue, 23 Jan 2024 14:46:58 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A2C3BF8028D; Tue, 23 Jan 2024 14:46:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from puleglot.ru (puleglot.ru [IPv6:2a01:4f8:1c0c:58e8::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 39D7DF80149
	for <alsa-devel@alsa-project.org>; Tue, 23 Jan 2024 14:46:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 39D7DF80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=tsoy.me header.i=@tsoy.me header.a=rsa-sha256
 header.s=mymail header.b=fD+oeu0X
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tsoy.me;
	s=mymail; h=Sender:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=s6qvEiaJh55KthDrV+RPsaHAR9G/cOjOf2CUuFneEJU=; b=fD+oeu0XP1hj+8jY22FGdKvsqH
	T69vS9lR7SAf0pERwgvgCrgYNkyPq9QrBUg+Is7OlQrrIHx1vEH/8QeiFhIeYiCV2ClvBx9yK0fTl
	sBCOS3W3NMBU2jJJ1yuRtxiCFdqGx3VBdtAx6DsPYceZ3JyKwxMJOw1aChRyRmQReBkI=;
Received: from [2a00:1370:819a:c53:3baa:da0a:1172:ed3d] (helo=home..)
	by puleglot.ru with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <puleglot@puleglot.ru>)
	id 1rSH6z-00000000ElK-2QZT;
	Tue, 23 Jan 2024 16:46:46 +0300
From: Alexander Tsoy <alexander@tsoy.me>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH] ALSA: usb-audio: Skip setting clock selector for single
 connections
Date: Tue, 23 Jan 2024 16:46:35 +0300
Message-ID: <20240123134635.54026-1-alexander@tsoy.me>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: puleglot@puleglot.ru
Message-ID-Hash: E7GYIVLUWP2CVA6RHLEV3L3IBGEMAVJB
X-Message-ID-Hash: E7GYIVLUWP2CVA6RHLEV3L3IBGEMAVJB
X-MailFrom: puleglot@puleglot.ru
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/E7GYIVLUWP2CVA6RHLEV3L3IBGEMAVJB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Since commit 086b957cc17f5 ("ALSA: usb-audio: Skip the clock selector
inquiry for single connections") we are already skipping clock selector
inquiry if only one clock source is connected, but we are still sending
a set request. Lets skip that too.

This should fix errors when setting a sample rate on devices that don't
have any controls present within the clock selector. An example of such
device is the new revision of MOTU M Series (07fd:000b):

      AudioControl Interface Descriptor:
        bLength                 8
        bDescriptorType        36
        bDescriptorSubtype     11 (CLOCK_SELECTOR)
        bClockID                1
        bNrInPins               1
        baCSourceID(0)          2
        bmControls           0x00
        iClockSelector          0

Perhaps we also should check if clock selectors are readable and writeable
like we already do for clock sources, but this is out of scope of this
patch.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=217601
Signed-off-by: Alexander Tsoy <alexander@tsoy.me>
---
 sound/usb/clock.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/usb/clock.c b/sound/usb/clock.c
index 33db334e6556..94e4aaeafe58 100644
--- a/sound/usb/clock.c
+++ b/sound/usb/clock.c
@@ -325,7 +325,8 @@ static int __uac_clock_find_source(struct snd_usb_audio *chip,
 					      visited, validate);
 		if (ret > 0) {
 			/* Skip setting clock selector again for some devices */
-			if (chip->quirk_flags & QUIRK_FLAG_SKIP_CLOCK_SELECTOR)
+			if (chip->quirk_flags & QUIRK_FLAG_SKIP_CLOCK_SELECTOR ||
+			    pins == 1)
 				return ret;
 			err = uac_clock_selector_set_val(chip, entity_id, cur);
 			if (err < 0)
-- 
2.43.0

