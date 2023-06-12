Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1625A72B9E3
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Jun 2023 10:12:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A2F36C0;
	Mon, 12 Jun 2023 10:11:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A2F36C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686557534;
	bh=oiy4OuD34fvwb++mtTwvdLzk0XhcezR7ZHRpIIxI2/E=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=fZLT5zxugmnv08PZyrsC2xThtXB47TZ+027o11kR6SSA9EYt2eJDxaKC4x0I3v4zX
	 FqKa5baxIi1p1uvdo2jOb3p7SadL6YS33N8jd6lfaivBRP8kR0wevv69fkXCAxhRs2
	 6hrqiMYGF9sxyJLANRjKlUwlbThywHLWs8sFnyww=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 93BA4F800BA; Mon, 12 Jun 2023 10:11:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 479B3F80549;
	Mon, 12 Jun 2023 10:11:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B4AA9F80551; Mon, 12 Jun 2023 10:11:19 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 871E0F800BA
	for <alsa-devel@alsa-project.org>; Mon, 12 Jun 2023 10:11:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 871E0F800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=n7u9OjPm;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=AHaqYtKl
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id CD181224FC;
	Mon, 12 Jun 2023 08:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1686557465;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=d4onWRD0uQuxv/zo2IFQ1pl6oFXHj09eFtoJOf6sS80=;
	b=n7u9OjPmGs/Bv8ehuXy2XMkJaYHnQyId+PK+wbByCTrD1SI16l1hHDVMULLZYKeTFU3VAo
	WkY9+zjFruE/05M7K5AttngM0OZoajkGNyvWdUYlI/n0o0hNpkGOTQy9tgGs2OnAanhxEZ
	HemlVJPhbNnX9VH5pWlM9AGbBeDNRpQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1686557465;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=d4onWRD0uQuxv/zo2IFQ1pl6oFXHj09eFtoJOf6sS80=;
	b=AHaqYtKlpRexc1JbJ+uYQZL8CJUBIHvBQA0UAtA6qseSzELgEjNJ3+Qz36MiujcMXmjRRW
	dYoRR77dZF+x5WDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id ADBB1138EC;
	Mon, 12 Jun 2023 08:11:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id GEZkKRnThmSLcAAAMHmgww
	(envelope-from <tiwai@suse.de>); Mon, 12 Jun 2023 08:11:05 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 00/10] ALSA: Catch up MIDI 2.0 updates for UMP 1.1
Date: Mon, 12 Jun 2023 10:10:44 +0200
Message-Id: <20230612081054.17200-1-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: AUCWSL7IR6XYPEKMQZV5JCBWBT4FQGMJ
X-Message-ID-Hash: AUCWSL7IR6XYPEKMQZV5JCBWBT4FQGMJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AUCWSL7IR6XYPEKMQZV5JCBWBT4FQGMJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

as the updated MIDI 2.0 spec has been published freshly [*], this is a
catch up to add the support for new specs, especially UMP v1.1
features, on Linux kernel.

The new UMP v1.1 introduced the concept of Function Blocks (FB), which
is a kind of superset of USB MIDI 2.0 Group Terminal Blocks (GTB).
The patch set adds the support for FB as the primary information
source while keeping the parse of GTB as fallback.  Also UMP v1.1
supports the groupless messages, the protocol switch, static FBs, and
other new fundamental features, and those are supported as well.


Takashi

[*] https://www.midi.org/midi-articles/details-about-midi-2-0-midi-ci-profiles-and-property-exchange

===

Takashi Iwai (10):
  ALSA: ump: Add more attributes to UMP EP and FB info
  ALSA: ump: Support UMP Endpoint and Function Block parsing
  ALSA: usb-audio: Parse UMP Endpoint and Function Blocks at first
  ALSA: usb-audio: Add midi2_ump_probe option
  ALSA: seq: ump: Handle groupless messages
  ALSA: seq: ump: Handle FB info update
  ALSA: seq: ump: Notify port changes to system port
  ALSA: seq: ump: Notify UMP protocol change to sequencer
  ALSA: ump: Add info flag bit for static blocks
  ALSA: docs: Update MIDI 2.0 documentation for UMP 1.1 enhancement

 Documentation/sound/designs/midi-2.0.rst |  39 +-
 include/sound/ump.h                      |  89 +++++
 include/sound/ump_msg.h                  | 225 +++++++++++
 include/uapi/sound/asequencer.h          |   5 +-
 include/uapi/sound/asound.h              |  21 +-
 sound/core/seq/seq_system.c              |   1 +
 sound/core/seq/seq_ump_client.c          |  79 +++-
 sound/core/seq/seq_ump_convert.c         |   3 +
 sound/core/ump.c                         | 470 +++++++++++++++++++++++
 sound/usb/midi2.c                        |  42 +-
 10 files changed, 962 insertions(+), 12 deletions(-)

-- 
2.35.3

