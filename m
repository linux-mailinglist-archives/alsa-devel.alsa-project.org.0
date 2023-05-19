Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 43AE170934D
	for <lists+alsa-devel@lfdr.de>; Fri, 19 May 2023 11:35:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9FD47207;
	Fri, 19 May 2023 11:34:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9FD47207
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684488900;
	bh=0Gn2FMYZ0wbJMJjsLn/4OUoOlGpsZKKGGDUpBd9cnyE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pOmX+/iWXY5g+O+QlN2okS43UvPlQmxXz/P1ryScREsyeTS43pM7P4ZKiisyFgFen
	 j247gN0L9mIAvdLQb9nnZWfz6nP/GpuEGZcc/QjEU7HWd2X2HIfylQ7YYLXvO4T2R9
	 xPzHkek3idujMaGkHYTD07qBV/thzQc1WOllqXLQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C8F27F80544; Fri, 19 May 2023 11:32:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9FCFCF80544;
	Fri, 19 May 2023 11:32:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A4E2CF80549; Fri, 19 May 2023 11:31:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7D4A3F80549
	for <alsa-devel@alsa-project.org>; Fri, 19 May 2023 11:31:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7D4A3F80549
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=XHlsMepz;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=fpkqDSsC
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 306C9222AD;
	Fri, 19 May 2023 09:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1684488696;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HpltZXyn7IFUsWYubb3YXnbYdNZhgEiIMwEl6o8+pfI=;
	b=XHlsMepz9Ecz5V3B5jMYmkMAhmrpWcTfpzRCSnLhpsK52nMLN4v/exslyBR4xYO5WBZ1oa
	XYtp1dHj53CyNtaBWTSRUWu6I3E4B2sB78mqY2M5tL9/MXyIw7NwsgizZGTEAG2QkKNpx0
	rhFEXW/1l8YJZigqMFZShcRdIDIbzWw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1684488696;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HpltZXyn7IFUsWYubb3YXnbYdNZhgEiIMwEl6o8+pfI=;
	b=fpkqDSsCF6U/EotfWEZ2rlrvzm2cr5QeZMRvJe2C5H4t5OH817O1OMas25Z0AgDEP65Te+
	j/os724xbF0dw3DQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0E93713A12;
	Fri, 19 May 2023 09:31:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id OFO6APhBZ2RXJAAAMHmgww
	(envelope-from <tiwai@suse.de>); Fri, 19 May 2023 09:31:36 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 10/36] ALSA: usb-audio: Trim superfluous "MIDI" suffix from
 UMP EP name
Date: Fri, 19 May 2023 11:30:48 +0200
Message-Id: <20230519093114.28813-11-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230519093114.28813-1-tiwai@suse.de>
References: <20230519093114.28813-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: AZLTINQKRODC2NORHDQZOXKCMJ7CQAEH
X-Message-ID-Hash: AZLTINQKRODC2NORHDQZOXKCMJ7CQAEH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AZLTINQKRODC2NORHDQZOXKCMJ7CQAEH/>
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

