Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F2770A610
	for <lists+alsa-devel@lfdr.de>; Sat, 20 May 2023 09:09:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D6B326C0;
	Sat, 20 May 2023 09:08:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D6B326C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684566573;
	bh=Z7eBvgEDPsmQ5smx7EMJFJsBKX/FiBis1mAHYUqHS2U=;
	h=From:To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=YkhzVDSwJO8UQFC2HCzncFOqTzUrNzJjyBS5+A7oIf9MpaCiPJv9hEQpANLhSfzcu
	 FkZF9fQnPEVATa7CWGDxVeONEkEF0EGpt5kLl88y2U/AZVVFnKCld8ckjQ1kN3X9Ni
	 agiIIadQu6gNqBx/TNzyJDqQdU93pjg9BkwMXk40=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 400CDF80557; Sat, 20 May 2023 09:07:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 64432F80548;
	Sat, 20 May 2023 09:07:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A0ABEF80431; Sat, 20 May 2023 09:07:49 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 16630F80087
	for <alsa-devel@alsa-project.org>; Sat, 20 May 2023 09:07:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 16630F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=yRGWdC4G;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=b73ElF4p
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 88C791FE3D;
	Sat, 20 May 2023 07:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1684566463; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=p55wFArH5JcNEMKFBp0KM1GXuHV8nk/l2Pd+NWUD/o8=;
	b=yRGWdC4GEDfJCJ/Qkogq7pJFQo6oxU7jqJQCFPDD912MK18VNY23S57VF4d/qWDl0rsz+Y
	NC3FPzgEMM51J7iW1aFGXD43sRXpKm6ixHnaGpqIpQTbwRoq0SGcRHugkSrnMMIu9lI54v
	QoEIiI9YvZesMR/uHa003hPE12gR28o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1684566463;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=p55wFArH5JcNEMKFBp0KM1GXuHV8nk/l2Pd+NWUD/o8=;
	b=b73ElF4pZDHFqG6eqOR0cBZ0Lf7ZYP1Gs7zi/lBG77lDEks5q6Fs+D/O8E/XluQmGKfwZM
	sykZjWiQ31SDAFCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 624AF134F5;
	Sat, 20 May 2023 07:07:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 9fEdFr9xaGRrHgAAMHmgww
	(envelope-from <tiwai@suse.de>); Sat, 20 May 2023 07:07:43 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH alsa-utils 0/3] Add MIDI 2.0 support
Date: Sat, 20 May 2023 09:07:35 +0200
Message-Id: <20230520070738.8382-1-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: CVVWAP6AIUA5C5XKE44QEJXC7Q6YYZQP
X-Message-ID-Hash: CVVWAP6AIUA5C5XKE44QEJXC7Q6YYZQP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CVVWAP6AIUA5C5XKE44QEJXC7Q6YYZQP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This is a small patch set for alsa-utils to add the MIDI 2.0 support.
Very minimalistic changes, covering only the sequencer programs:
aseqdump, aconnect and aplaymidi.


Takashi

---

Takashi Iwai (3):
  aseqdump: Add UMP support
  aconnect: Add UMP support
  aplaymidi: Add UMP support

 configure.ac              |   4 +
 seq/aconnect/aconnect.1   |   3 +
 seq/aconnect/aconnect.c   |  91 +++++++++++++---
 seq/aplaymidi/aplaymidi.1 |   6 ++
 seq/aplaymidi/aplaymidi.c | 216 ++++++++++++++++++++++++++++++--------
 seq/aseqdump/aseqdump.1   |   9 ++
 seq/aseqdump/aseqdump.c   | 211 ++++++++++++++++++++++++++++++++++++-
 7 files changed, 478 insertions(+), 62 deletions(-)

-- 
2.35.3

