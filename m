Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF3E70D65E
	for <lists+alsa-devel@lfdr.de>; Tue, 23 May 2023 09:58:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0E2AD74C;
	Tue, 23 May 2023 09:57:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0E2AD74C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684828706;
	bh=SvVLV/PcyjorYA/EtWsvVnaELs25shWi5j68ffpPNgQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ksr2LbU2kA7zVa55LykZU7CpzVlwe0tDJ6WsU53f/mxd++KWYouQZ28wKe20OZyzK
	 UPvwnGCkXwBIKl47k4tJ5YXGYLWjNN7Qds4IenQSqXJwxd38T+zoxe6Hqm8aobnk7+
	 mwz7GadIkclX4MxsHTBSvb2r5+R6jzFeX8VpqmZg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B656FF80612; Tue, 23 May 2023 09:54:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 946CEF8060A;
	Tue, 23 May 2023 09:54:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5A6BDF805FB; Tue, 23 May 2023 09:54:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9E178F80552
	for <alsa-devel@alsa-project.org>; Tue, 23 May 2023 09:54:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E178F80552
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=c+GvQ5bh;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=iq20Bz5j
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 3FFBD2040A;
	Tue, 23 May 2023 07:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1684828446;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bVKMfmKZD+HwascEjydzIHk2mo8oo1vs9MeGSXjDJ5A=;
	b=c+GvQ5bhnqvqd1Rmub7KpN893zt17bAwZReyt2r3o78J0tHEAh/JQtAHFna7M9p7DmLH0w
	UtQw8x4aKR9eCqvQEmtO4Q9YWymswUzwXurWSn78/k5IGf424rS2Zi0vcjnHvpteGxSZsi
	vf6tiEeEYKQQ/i0Ce7J5vH8wAYVgyzY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1684828446;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bVKMfmKZD+HwascEjydzIHk2mo8oo1vs9MeGSXjDJ5A=;
	b=iq20Bz5jE44WbLBxUdE3iXKccn+VduVi1q1srrt8z65FH3j0mZhdlZP2E+S7TFyxteznrx
	u8hXBtLi0CpjdJDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CC60E13A1A;
	Tue, 23 May 2023 07:54:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 4AGvLR1xbGT4KgAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 23 May 2023 07:54:05 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v2 11/37] ALSA: usb-audio: Trim superfluous "MIDI" suffix from
 UMP EP name
Date: Tue, 23 May 2023 09:53:32 +0200
Message-Id: <20230523075358.9672-12-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230523075358.9672-1-tiwai@suse.de>
References: <20230523075358.9672-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: KOMOGOK52FRGXOTGCUZJVAJPJOL5QOO5
X-Message-ID-Hash: KOMOGOK52FRGXOTGCUZJVAJPJOL5QOO5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KOMOGOK52FRGXOTGCUZJVAJPJOL5QOO5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

A single USB audio device may have multiple interfaces for different
purposes (e.g. audio, MIDI and HID), where the iInterface descriptor
of each interface may contain an own suffix, e.g. "MIDI" for a MIDI
interface.  as such a suffix is superfluous as a rawmidi and UMP
Endpoint name, this patch trims the superfluous "MIDI" suffix from the
name string.

Reviewed-by: Jaroslav Kysela <perex@perex.cz>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/midi2.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/usb/midi2.c b/sound/usb/midi2.c
index 2ac3f96216bc..790e4cd5d35c 100644
--- a/sound/usb/midi2.c
+++ b/sound/usb/midi2.c
@@ -896,7 +896,14 @@ static int set_altset(struct snd_usb_midi2_interface *umidi)
 static void fill_ump_ep_name(struct snd_ump_endpoint *ump,
 			     struct usb_device *dev, int id)
 {
+	int len;
+
 	usb_string(dev, id, ump->info.name, sizeof(ump->info.name));
+
+	/* trim superfluous "MIDI" suffix */
+	len = strlen(ump->info.name);
+	if (len > 5 && !strcmp(ump->info.name + len - 5, " MIDI"))
+		ump->info.name[len - 5] = 0;
 }
 
 /* fill the fallback name string for each rawmidi instance */
-- 
2.35.3

