Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED45A9429B0
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Jul 2024 10:54:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 34D382D3E;
	Wed, 31 Jul 2024 10:54:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 34D382D3E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722416065;
	bh=jC/KhaJqTmeXOybIabumropkSzYE0inJWgtzdauR0uY=;
	h=Date:To:From:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FNb1v78p0qPJviTovWmc2qa8rzhO1SfQjG4M44mL6t193GA9o6fOQLwvfkZJJWPRU
	 qK0urqvYbLOSpoQTL69wEQU86hdy+tD8pEDDcFegz2cgscAiYZ+4hH86/84wkMMVcB
	 Y/0Cp/gtI+dhApjBba8pozVcScr+zWxQrX9tvSGg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6D232F80C95; Wed, 31 Jul 2024 10:50:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7ACDDF80C93;
	Wed, 31 Jul 2024 10:50:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 468EBF8026A; Mon, 29 Jul 2024 23:51:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	TIME_LIMIT_EXCEEDED,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable version=3.4.6
Received: from mail-0301.mail-europe.com (mail-0301.mail-europe.com
 [188.165.51.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 01A84F8026A
	for <alsa-devel@alsa-project.org>; Mon, 29 Jul 2024 23:44:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 01A84F8026A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=protonmail.com header.i=@protonmail.com
 header.a=rsa-sha256 header.s=protonmail3 header.b=PGAhNV8+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1722289336; x=1722548536;
	bh=0qv70E0VnYWx518cQ856tZOi8XtGafmVVQLWE08yAXM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=PGAhNV8+QoY6wSrpGHnI0EmFTa50atee4UlSqQYnGlrBHiYPtWG1/ynQXWj3D8K9t
	 TaasUrFwsuLg0nj7420s5KCYUFV3GqpBK7QrI20CbToKBxW7BpVAw78ccMY9TT7Caq
	 Y7iLTeiLeSLeokU8gCsxlel+Rwbv/UeRodI/kYOjbDI49heKGzClgaLpsmKJp4Q6m/
	 k3aQJIuuVrBbYnx9lxU7wQ0Eoei0dJoZkPZKjLCUCrPPpkrZIDu1pBjKENutufch+x
	 Rv3iI3f+3PgV8xf6MKLy/VjkTCh7i3WLQDb1QwEBsyRohKXVezFQ5L8DMz8JEVGeQa
	 4WA3U/XBP2hmw==
Date: Mon, 29 Jul 2024 21:42:11 +0000
To: o-takashi@sakamocchi.jp, clemens@ladisch.de
From: Edmund Raile <edmund.raile@protonmail.com>
Cc: tiwai@suse.com, alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: [PATCH v3 1/3] Revert "ALSA: firewire-lib: obsolete workqueue for
 period update"
Message-ID: <20240729214149.752663-2-edmund.raile@protonmail.com>
In-Reply-To: <20240729214149.752663-1-edmund.raile@protonmail.com>
References: <20240729214149.752663-1-edmund.raile@protonmail.com>
Feedback-ID: 43016623:user:proton
X-Pm-Message-ID: ef79e849b7a2927f46f7a6f6a07e5d260af1f69f
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-MailFrom: edmund.raile@protonmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: PNQUTOPQ6BJSHYPNYNVKCZNWXZQK4P4L
X-Message-ID-Hash: PNQUTOPQ6BJSHYPNYNVKCZNWXZQK4P4L
X-Mailman-Approved-At: Wed, 31 Jul 2024 08:50:12 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PNQUTOPQ6BJSHYPNYNVKCZNWXZQK4P4L/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

prepare resolution of AB/BA deadlock competition for substream lock:
restore workqueue previously used for process context:

revert commit b5b519965c4c ("ALSA: firewire-lib: obsolete workqueue for
period update")

Cc: stable@vger.kernel.org
Link: https://lore.kernel.org/r/kwryofzdmjvzkuw6j3clftsxmoolynljztxqwg76hze=
o4simnl@jn3eo7pe642q/
Signed-off-by: Edmund Raile <edmund.raile@protonmail.com>
---
 sound/firewire/amdtp-stream.c | 15 +++++++++++++++
 sound/firewire/amdtp-stream.h |  1 +
 2 files changed, 16 insertions(+)

diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index d35d0a420ee0..31201d506a21 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -77,6 +77,8 @@
 // overrun. Actual device can skip more, then this module stops the packet=
 streaming.
 #define IR_JUMBO_PAYLOAD_MAX_SKIP_CYCLES=095
=20
+static void pcm_period_work(struct work_struct *work);
+
 /**
  * amdtp_stream_init - initialize an AMDTP stream structure
  * @s: the AMDTP stream to initialize
@@ -105,6 +107,7 @@ int amdtp_stream_init(struct amdtp_stream *s, struct fw=
_unit *unit,
 =09s->flags =3D flags;
 =09s->context =3D ERR_PTR(-1);
 =09mutex_init(&s->mutex);
+=09INIT_WORK(&s->period_work, pcm_period_work);
 =09s->packet_index =3D 0;
=20
 =09init_waitqueue_head(&s->ready_wait);
@@ -347,6 +350,7 @@ EXPORT_SYMBOL(amdtp_stream_get_max_payload);
  */
 void amdtp_stream_pcm_prepare(struct amdtp_stream *s)
 {
+=09cancel_work_sync(&s->period_work);
 =09s->pcm_buffer_pointer =3D 0;
 =09s->pcm_period_pointer =3D 0;
 }
@@ -624,6 +628,16 @@ static void update_pcm_pointers(struct amdtp_stream *s=
,
 =09}
 }
=20
+static void pcm_period_work(struct work_struct *work)
+{
+=09struct amdtp_stream *s =3D container_of(work, struct amdtp_stream,
+=09=09=09=09=09      period_work);
+=09struct snd_pcm_substream *pcm =3D READ_ONCE(s->pcm);
+
+=09if (pcm)
+=09=09snd_pcm_period_elapsed(pcm);
+}
+
 static int queue_packet(struct amdtp_stream *s, struct fw_iso_packet *para=
ms,
 =09=09=09bool sched_irq)
 {
@@ -1910,6 +1924,7 @@ static void amdtp_stream_stop(struct amdtp_stream *s)
 =09=09return;
 =09}
=20
+=09cancel_work_sync(&s->period_work);
 =09fw_iso_context_stop(s->context);
 =09fw_iso_context_destroy(s->context);
 =09s->context =3D ERR_PTR(-1);
diff --git a/sound/firewire/amdtp-stream.h b/sound/firewire/amdtp-stream.h
index a1ed2e80f91a..775db3fc4959 100644
--- a/sound/firewire/amdtp-stream.h
+++ b/sound/firewire/amdtp-stream.h
@@ -191,5 +191,6 @@ struct amdtp_stream {
=20
 =09/* For a PCM substream processing. */
 =09struct snd_pcm_substream *pcm;
+=09struct work_struct period_work;
 =09snd_pcm_uframes_t pcm_buffer_pointer;
 =09unsigned int pcm_period_pointer;
--=20
2.45.2


