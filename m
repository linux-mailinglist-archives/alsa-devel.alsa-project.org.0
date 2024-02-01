Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7321E845694
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Feb 2024 12:54:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 618C6857;
	Thu,  1 Feb 2024 12:53:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 618C6857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706788443;
	bh=5oOP4bht1T8GSC5S5pLB/bIDrJgVU/QccsXrdiC1fh8=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=dcpZlLTi15vHj4cP6pktQ9pFpU/OaZEsrNb0zWbPmrPoBx4FsjQT3m1uD1SFxzODi
	 xTJoC0KqFmWNWN4oq2q58TVYoeQmFNvYj2eXyBn6PN4XEQmc0Vx6CZqNVPhQ/jRIIX
	 TV7E5jaGfPQZL2sbQe1iVLDO5KIDYgTZLiQSd45E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 98179F80568; Thu,  1 Feb 2024 12:53:31 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 25F00F805A1;
	Thu,  1 Feb 2024 12:53:31 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7A559F8055C; Thu,  1 Feb 2024 12:53:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URI_TRY_3LD
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from puleglot.ru (puleglot.ru [IPv6:2a01:4f8:1c0c:58e8::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 982E4F804E7
	for <alsa-devel@alsa-project.org>; Thu,  1 Feb 2024 12:53:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 982E4F804E7
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=tsoy.me header.i=@tsoy.me header.a=rsa-sha256
 header.s=mymail header.b=p1s4HjkT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tsoy.me;
	s=mymail; h=Sender:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=HfyPbCpGNXGGHMMxOtkxYsa+qUDoLnWX4zlJhqQCbsE=; b=p1s4HjkTw9CV8ewj8cDFnyQEnS
	oOThLLWh5iStoLMXz1ZLRB9e3A87c9EfP35cnozsHTQ8EjgM/FjWvthTeY7FVLb5y8yPzM+VoLjHA
	sZn06q8V/wZsuHPKP6CMo4mOfZFej51WDTPWluEnd+pfujoHGOVHuIgUeBCNmIa9npNk=;
Received: from [2a00:1370:819a:ceb:89dc:eced:962a:5b2f] (helo=home..)
	by puleglot.ru with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <puleglot@puleglot.ru>)
	id 1rVVd9-00000000yzA-3Twx;
	Thu, 01 Feb 2024 14:53:19 +0300
From: Alexander Tsoy <alexander@tsoy.me>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH] ALSA: usb-audio: Ignore clock selector errors for single
 connection
Date: Thu,  1 Feb 2024 14:53:08 +0300
Message-ID: <20240201115308.17838-1-alexander@tsoy.me>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: puleglot@puleglot.ru
Message-ID-Hash: XWMRFRCW3VUZUD2ZXJLK6LSFWJLYDOYZ
X-Message-ID-Hash: XWMRFRCW3VUZUD2ZXJLK6LSFWJLYDOYZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XWMRFRCW3VUZUD2ZXJLK6LSFWJLYDOYZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

For devices with multiple clock sources connected to a selector, we need
to check what a clock selector control request has returned. This is
needed to ensure that a requested clock source is indeed selected and for
autoclock feature to work.

For devices with single clock source connected, if we get an error there
is nothing else we can do about it. We can't skip clock selector setup as
it is required by some devices. So lets just ignore error in this case.

This should fix various buggy Mackie devices:

[  649.109785] usb 1-1.3: parse_audio_format_rates_v2v3(): unable to find clock source (clock -32)
[  649.111946] usb 1-1.3: parse_audio_format_rates_v2v3(): unable to find clock source (clock -32)
[  649.113822] usb 1-1.3: parse_audio_format_rates_v2v3(): unable to find clock source (clock -32)

There is also interesting info from the Windows documentation [1] (this
is probably why manufacturers dont't even test this feature):

"The USB Audio 2.0 driver doesn't support clock selection. The driver
uses the Clock Source Entity, which is selected by default and never
issues a Clock Selector Control SET CUR request."

Link: https://learn.microsoft.com/en-us/windows-hardware/drivers/audio/usb-2-0-audio-drivers [1]
Link: https://bugzilla.kernel.org/show_bug.cgi?id=217314
Link: https://bugzilla.kernel.org/show_bug.cgi?id=218175
Link: https://bugzilla.kernel.org/show_bug.cgi?id=218342
Signed-off-by: Alexander Tsoy <alexander@tsoy.me>
---
 sound/usb/clock.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/sound/usb/clock.c b/sound/usb/clock.c
index a8204c6d6fac..60fcb872a80b 100644
--- a/sound/usb/clock.c
+++ b/sound/usb/clock.c
@@ -347,8 +347,16 @@ static int __uac_clock_find_source(struct snd_usb_audio *chip,
 			    !writeable)
 				return ret;
 			err = uac_clock_selector_set_val(chip, entity_id, cur);
-			if (err < 0)
+			if (err < 0) {
+				if (pins == 1) {
+					usb_audio_dbg(chip,
+						      "%s(): selector returned an error, "
+						      "assuming a firmware bug, id %d, ret %d\n",
+						      __func__, clock_id, err);
+					return ret;
+				}
 				return err;
+			}
 		}
 
 		if (!validate || ret > 0 || !chip->autoclock)
-- 
2.43.0

