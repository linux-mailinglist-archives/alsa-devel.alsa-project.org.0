Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 202F29429A6
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Jul 2024 10:52:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D40F02C89;
	Wed, 31 Jul 2024 10:52:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D40F02C89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722415968;
	bh=DJ0+aZtEj0tlvzzOMHpKTswqeirhVvMiNDMLCWc88r4=;
	h=Date:To:From:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=s7lGqea0nazSSB02jKLLlsrwyPxX9oe63ze289JwGf6W2cK2OioNlziEfaOt+3jHx
	 ikYRQkbq/VSjD9ifOUmeoCw0c31/Cd/BpCZHrMad43dkEpAAVayTVjk/ZEuEZemyd4
	 uCAGp/PCie6JALxCUfhFZfz18A5PwdcqyHQxsBBY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 668C6F8074E; Wed, 31 Jul 2024 10:50:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 146EDF80760;
	Wed, 31 Jul 2024 10:50:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 87FF9F8007E; Sun, 28 Jul 2024 14:31:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-4027.protonmail.ch (mail-4027.protonmail.ch
 [185.70.40.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 548C5F8007E
	for <alsa-devel@alsa-project.org>; Sun, 28 Jul 2024 14:31:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 548C5F8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=protonmail.com header.i=@protonmail.com
 header.a=rsa-sha256 header.s=protonmail3 header.b=m42Dw/u7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1722169860; x=1722429060;
	bh=Q6ujAQ2rqdbruPutUk79q/5IjtuZzJ+fzsg6fKKzv+8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=m42Dw/u7Urz+pXrO7pgznBTTpCFn5Twt/QUlrUJSpHkuI44zUA+VoGiTyBGPpdVKF
	 Q4ZXYe5Prj3XWgQB3gLQLycN0c83wDoIxe7PUQLp19J2NhINBgO0FhGez6pO6x6e5T
	 GGQvcpljULF/A8z4SL0WVV77fsUB4TFICqIeV9tAJenNnFKSeP3kVCC2eYq/Q9h7eo
	 eBGkjsPvfl8gY+vkbZw3/FMhGThmzlOIsWfsMYG0dkVeyWLxUbTYK3JILW4yf+gd9K
	 d1BkCUX7gaRida4Ndff1UoqVxKaGDDhI4PebbRzegdExTvioEdLYtttbS5hhAKOhDe
	 XfLMH6us46Xhw==
Date: Sun, 28 Jul 2024 12:30:55 +0000
To: o-takashi@sakamocchi.jp, clemens@ladisch.de
From: Edmund Raile <edmund.raile@protonmail.com>
Cc: tiwai@suse.com, alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, edmund.raile@protonmail.com,
 stable@vger.kernel.org
Subject: [PATCH v2 1/2] ALSA: firewire-lib: restore process context workqueue
 to prevent deadlock
Message-ID: <20240728123041.330216-2-edmund.raile@protonmail.com>
In-Reply-To: <20240728123041.330216-1-edmund.raile@protonmail.com>
References: <20240728123041.330216-1-edmund.raile@protonmail.com>
Feedback-ID: 43016623:user:proton
X-Pm-Message-ID: cac6802b9d6e3d2461bf4a2b8402fc3fc133ff58
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-MailFrom: edmund.raile@protonmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: DEA3Y4AHR6BIIUJ3X2SPBNFYQDMKOCBY
X-Message-ID-Hash: DEA3Y4AHR6BIIUJ3X2SPBNFYQDMKOCBY
X-Mailman-Approved-At: Wed, 31 Jul 2024 08:49:10 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DEA3Y4AHR6BIIUJ3X2SPBNFYQDMKOCBY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

prepare resolution of deadlock between process context and softIRQ
context:
restore workqueue previously used for process context:
revert commit b5b519965c4c ("ALSA: firewire-lib: obsolete workqueue
for period update")

Cc: stable@vger.kernel.org
Link: https://lore.kernel.org/r/kwryofzdmjvzkuw6j3clftsxmoolynljztxqwg76hze=
o4simnl@jn3eo7pe642q/
Reported-by: edmund.raile <edmund.raile@proton.me>
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


