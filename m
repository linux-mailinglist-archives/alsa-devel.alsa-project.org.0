Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ECB49429B1
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Jul 2024 10:54:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3CB3A2D46;
	Wed, 31 Jul 2024 10:54:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3CB3A2D46
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722416070;
	bh=yRwttLVnCbGv+EaWNEn53RVQvpUMZ1hdRbs/Bciab/U=;
	h=Date:To:From:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SmJtmZLNK7LOMElKY+2AdIh2XxhrAqzcOO5XMRUJWU4WJeD1ChsZwsrZtoUM/7rOm
	 BJQkF4RzPw5iIUplp5W1GP6npeH/Ab+PxTAbJ5tnxXfGLINXEveTlnU7P/kMIb2zxV
	 xMLh3fogFeFlJp4uWAUKWfjU7NL6pgJ91+wpenRc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 27144F80CB1; Wed, 31 Jul 2024 10:50:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2DDFAF89610;
	Wed, 31 Jul 2024 10:50:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CBAD2F80448; Mon, 29 Jul 2024 23:51:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	TIME_LIMIT_EXCEEDED,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable version=3.4.6
Received: from mail-0201.mail-europe.com (mail-0201.mail-europe.com
 [51.77.79.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 151CDF802DB
	for <alsa-devel@alsa-project.org>; Mon, 29 Jul 2024 23:44:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 151CDF802DB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=protonmail.com header.i=@protonmail.com
 header.a=rsa-sha256 header.s=protonmail3 header.b=r1l45ICv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1722289349; x=1722548549;
	bh=yRwttLVnCbGv+EaWNEn53RVQvpUMZ1hdRbs/Bciab/U=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=r1l45ICvIsF9l4qaWTKsGDN7U//lQ6Wzlfv7AI5q3jqSTj4zPz0vLfQZN8DdrnRZ2
	 FJ732EVN2J5pK19ytKvjmHDhKAnjIexFvG76U6acvLPVVAIWLz5pAS8ud6wC2BdDRw
	 C8AYnNOyrmqUEG9IJwmR9WiKjRwGNBqUsHJaQXMJylxItlKKg0cUQptYATGEBp0D+H
	 IPRqiw4BPz8OXcQJpQwbhBjuA8tIpzcLOGZR3spWZZzaUXCN/BKkYNGo8wRIMdIf+3
	 FGdUCL8gBGjSyCU6USjUBxRMhrUoHNu5RYEAuBUi3QjSJEBE57BDYYX4aZodQarO8c
	 6sVxOja8RCQqA==
Date: Mon, 29 Jul 2024 21:42:26 +0000
To: o-takashi@sakamocchi.jp, clemens@ladisch.de
From: Edmund Raile <edmund.raile@protonmail.com>
Cc: tiwai@suse.com, alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: [PATCH v3 3/3] ALSA: firewire-lib: amdtp-stream work queue inline
 description
Message-ID: <20240729214149.752663-4-edmund.raile@protonmail.com>
In-Reply-To: <20240729214149.752663-1-edmund.raile@protonmail.com>
References: <20240729214149.752663-1-edmund.raile@protonmail.com>
Feedback-ID: 43016623:user:proton
X-Pm-Message-ID: c866ae9e4304cd5c42ed2f9839a224dbc09265d4
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-MailFrom: edmund.raile@protonmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: B2YXJHHWEH753SFIJJ56VDWFZF3CKVKI
X-Message-ID-Hash: B2YXJHHWEH753SFIJJ56VDWFZF3CKVKI
X-Mailman-Approved-At: Wed, 31 Jul 2024 08:50:12 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/B2YXJHHWEH753SFIJJ56VDWFZF3CKVKI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Replace prior inline description to prevent future deadlock.

Cc: stable@vger.kernel.org
Link: https://lore.kernel.org/r/kwryofzdmjvzkuw6j3clftsxmoolynljztxqwg76hze=
o4simnl@jn3eo7pe642q/
Signed-off-by: Edmund Raile <edmund.raile@protonmail.com>
---
 sound/firewire/amdtp-stream.c | 20 ++++++--------------
 1 file changed, 6 insertions(+), 14 deletions(-)

diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index a07b0452267d..7438999e0510 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -1857,20 +1857,12 @@ unsigned long amdtp_domain_stream_pcm_pointer(struc=
t amdtp_domain *d,
 =09struct amdtp_stream *irq_target =3D d->irq_target;
=20
 =09if (irq_target && amdtp_stream_running(irq_target)) {
-=09=09// This function is called in software IRQ context of
-=09=09// period_work or process context.
-=09=09//
-=09=09// When the software IRQ context was scheduled by software IRQ
-=09=09// context of IT contexts, queued packets were already handled.
-=09=09// Therefore, no need to flush the queue in buffer furthermore.
-=09=09//
-=09=09// When the process context reach here, some packets will be
-=09=09// already queued in the buffer. These packets should be handled
-=09=09// immediately to keep better granularity of PCM pointer.
-=09=09//
-=09=09// Later, the process context will sometimes schedules software
-=09=09// IRQ context of the period_work. Then, no need to flush the
-=09=09// queue by the same reason as described in the above
+=09=09// use wq to prevent AB/BA deadlock competition for
+=09=09// substream lock:
+=09=09// fw_iso_context_flush_completions() acquires
+=09=09// lock by ohci_flush_iso_completions(),
+=09=09// amdtp-stream process_rx_packets() attempts to
+=09=09// acquire same lock by snd_pcm_elapsed()
 =09=09if (current_work() !=3D &s->period_work)
 =09=09=09fw_iso_context_flush_completions(irq_target->context);
 =09}
--=20
2.45.2


