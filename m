Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 764E37827CD
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Aug 2023 13:19:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AD0FE846;
	Mon, 21 Aug 2023 13:19:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AD0FE846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692616797;
	bh=RlBGPRxzF/CnKp5k0SHXHpdnNsyqr16TuE1JFC7QPko=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=tgLj0EAIJf3Yl4qiz0yfLhaZyv3JE4kuM8zTLKredUVr9u6/nW3qE3NdqvfQ1osUz
	 tS2bwn5hj/Vr96IT5kWEwaJwIJZpeNkFJS281s762Y6tE1k2C3Nge56YMMKBlGmcgG
	 JqOh9q6Xhxb7ZxmkxMUqWNShwVtMNDslwSkKmU/g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 11648F8016C; Mon, 21 Aug 2023 13:19:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CBC20F8016C;
	Mon, 21 Aug 2023 13:19:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A3B17F80199; Mon, 21 Aug 2023 13:19:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 06E84F800BF
	for <alsa-devel@alsa-project.org>; Mon, 21 Aug 2023 13:19:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06E84F800BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=Yu0BXYgy;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=Tp4clH6E
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 41A6422BB9;
	Mon, 21 Aug 2023 11:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1692616741;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=wpR5IQ/zwippA94Ugk0VXHzUIsWJJw1cv+GIHIdZNBU=;
	b=Yu0BXYgym+CcGWn6U/pHHHeNmGdoEX6QZydwvg5YpmQp9tumVrenuDUhtJHYfD07PdX5es
	gJcE+IHe8zHo7DCSsuEJRMChRl5fKKBdXrcJSTrDANzDhBoSdCIGfIjtCCoNjD8YgdOlhZ
	J+PPLnJoHxZR7+SlFJo0afVPwN0KOfE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1692616741;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=wpR5IQ/zwippA94Ugk0VXHzUIsWJJw1cv+GIHIdZNBU=;
	b=Tp4clH6EFv8STxl1tO1Hq4aXjyHqakEB7Wf86aquzkmH2Up7GJlDA5Nsd0fkyWA04rC6DY
	B9RkovQNesyQB7Aw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 23EA013421;
	Mon, 21 Aug 2023 11:19:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id lDXBByVI42TwFwAAMHmgww
	(envelope-from <tiwai@suse.de>); Mon, 21 Aug 2023 11:19:01 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: Joakim Tjernlund <joakim.tjernlund@infinera.com>
Subject: [PATCH] ALSA: usb-audio: Fix init call orders for UAC1
Date: Mon, 21 Aug 2023 13:18:57 +0200
Message-Id: <20230821111857.28926-1-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: H7VXZ57J7XNUXS5QQLSSYOPHD3SSFCIG
X-Message-ID-Hash: H7VXZ57J7XNUXS5QQLSSYOPHD3SSFCIG
X-MailFrom: tiwai@suse.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/H7VXZ57J7XNUXS5QQLSSYOPHD3SSFCIG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

There have been reports of USB-audio driver spewing errors at the
probe time on a few devices like Jabra and Logitech.  The suggested
fix there couldn't be applied as is, unfortunately, because it'll
likely break other devices.

But, the patch suggested an interesting point: looking at the current
init code in stream.c, one may notice that it does initialize
differently from the device setup in endpoint.c.  Namely, for UAC1, we
should call snd_usb_init_pitch() and snd_usb_init_sample_rate() after
setting the interface, while the init sequence at parsing calls them
before setting the interface blindly.

This patch changes the init sequence at parsing for UAC1 (and other
devices that need a similar behavior) to be aligned with the rest of
the code, setting the interface at first.  And, this fixes the
long-standing problems on a few UAC1 devices like Jabra / Logitech,
as reported, too.

Reported-and-tested-by: Joakim Tjernlund <joakim.tjernlund@infinera.com>
Closes: https://lore.kernel.org/r/202bbbc0f51522e8545783c4c5577d12a8e2d56d.camel@infinera.com
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/stream.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/sound/usb/stream.c b/sound/usb/stream.c
index f10f4e6d3fb8..3d4add94e367 100644
--- a/sound/usb/stream.c
+++ b/sound/usb/stream.c
@@ -1093,6 +1093,7 @@ static int __snd_usb_parse_audio_interface(struct snd_usb_audio *chip,
 	int i, altno, err, stream;
 	struct audioformat *fp = NULL;
 	struct snd_usb_power_domain *pd = NULL;
+	bool set_iface_first;
 	int num, protocol;
 
 	dev = chip->dev;
@@ -1223,11 +1224,19 @@ static int __snd_usb_parse_audio_interface(struct snd_usb_audio *chip,
 				return err;
 		}
 
+		set_iface_first = false;
+		if (protocol == UAC_VERSION_1 ||
+		    (chip->quirk_flags & QUIRK_FLAG_SET_IFACE_FIRST))
+			set_iface_first = true;
+
 		/* try to set the interface... */
 		usb_set_interface(chip->dev, iface_no, 0);
+		if (set_iface_first)
+			usb_set_interface(chip->dev, iface_no, altno);
 		snd_usb_init_pitch(chip, fp);
 		snd_usb_init_sample_rate(chip, fp, fp->rate_max);
-		usb_set_interface(chip->dev, iface_no, altno);
+		if (!set_iface_first)
+			usb_set_interface(chip->dev, iface_no, altno);
 	}
 	return 0;
 }
-- 
2.35.3

