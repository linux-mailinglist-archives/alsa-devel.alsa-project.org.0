Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA0389A98E
	for <lists+alsa-devel@lfdr.de>; Sat,  6 Apr 2024 09:20:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5D6EC2CE1;
	Sat,  6 Apr 2024 09:20:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5D6EC2CE1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712388033;
	bh=vMocICrvAW1bjsRzhL21KFzjSIGcLj6CqF/xTe36Sao=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=oM0lLLHV24lcgNpHMlmm15eKyAGc0RJA2y8FFkgu54LqtnOsACzNo2ws2Be+3Ocsg
	 9kzHD9thP/p/e7l8aL62/RDvVxcPmKEWivpOmPPGC6VWRE6nwDmEpw6MgXLxy22JAS
	 dwM1PjqxTUdOV5xYzOcLEYDXsPyNuc1mQCdVKA68=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D6D67F805A0; Sat,  6 Apr 2024 09:20:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C76E5F8020D;
	Sat,  6 Apr 2024 09:20:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 85C0CF8016E; Sat,  6 Apr 2024 09:01:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H2,RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2542BF8056F
	for <alsa-devel@alsa-project.org>; Sat,  6 Apr 2024 09:00:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2542BF8056F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=oswald.buddenhagen@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=da9h/fwU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1712386852; x=1712991652;
	i=oswald.buddenhagen@gmx.de;
	bh=h1Zi44w73xqIr7qI+WEi+WXB3H7fY5BzJEXJfftEUYo=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
	 References;
	b=da9h/fwUkUZh62r6U6yXxELh4FwFQlFvdYKehVwhx4jgiAO+j8KoHA54bYiyQjbz
	 4SgMRaV7P4JCcxGpldpoUe6nG7HQSCNH6hSilCP3mquyh1X0+h2uP0QPTJXEx2nd0
	 ToWJPXUi/NFfXO98UmIBDaAQFqPYCEEgOTArxP4WWaA5bN9fVt+F1enC610Ccqh6U
	 DOD4XiyOLCZGrCYthn+2cnlhXmCdAKegp5aqTH8POvB+EKCKZJqGO0DMa3YV18hl0
	 ILHIpDIo9Ek/MrDAvAlmyRYR3if/qPC6tiqR7HmYQinJ993CoDn5kXcPYv1VHUV22
	 vJIW0qJ4FHZoBEihZg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from ugly.fritz.box ([89.247.162.118]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N1wq3-1suq210TIP-012FI4; Sat, 06
 Apr 2024 09:00:52 +0200
Received: by ugly.fritz.box (masqmail 0.3.6-dev, from userid 1000)
	id 1rszqo-JrF-00; Sat, 06 Apr 2024 08:48:30 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Arthur Marsh <arthur.marsh@internode.on.net>
Subject: [PATCH v3 10/17] ALSA: emu10k1: fix playback of 8-bit wavetable
 samples
Date: Sat,  6 Apr 2024 08:48:23 +0200
Message-ID: <20240406064830.1029573-11-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.44.0.701.g2cf7baacf3.dirty
In-Reply-To: <20240406064830.1029573-1-oswald.buddenhagen@gmx.de>
References: <20240406064830.1029573-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:k6J4J/IRHhtxoesp93tenb2Pw1oStDaxdcHJH8Ma+nbQbfXsQ0k
 VjgpBDe8SCMurkGXp3McHsGC9KEdAYNIkZXxOw4yuAOofrAmMo7M4mFEZCnfgk4Xvvjwivr
 ius22UCOUDRj0mZAZVCv+afmNZZW9JgcyJt0a8BNqLx5YOJ2yteQZo9v1uR1C3B58nslSeT
 /tYC+0eo1u92GkXpm8eBw==
UI-OutboundReport: notjunk:1;M01:P0:+QcUMwBEIg4=;HLoeVhRmtgAeKlVN2j/wSnh/3vq
 w8quGvPhs92rqsEKb7aR4OoUcvjwaAkuZg6YFAYQWSBdxtFUgNhaamQvJQLCH+QrMDz1ccW6M
 Tfmn2+Njog1vYoMc7mdFZKbD4kES08tZ6n2FtAyUmlGu1p/SK+CTR0HCUhDgd7z3w8wBKNOGr
 5fB7KrNL9CF1JEFFZjmMo6cKwGMwECEGbwRniDSb+DoGRUxWdsGPxgyt5S77pzNMtQHjFTzRP
 dOObVzN+8R5s1JJWNgXLMH9Zm+nKGW8LHRCiEvROwOLEmbJP4nHajSxiU9ppVso7Gs4IbwnIN
 A8sSSgvXXoDB/WXmRpNEE+7RuMkDgtX51PzAX3V5DaO74EJwRfO0t5b7GYg6NwMidopu5mFXz
 eztGJLW7t8wzGRv7gdCu4o+uy+CpLHVfL4ypXJmmHlzMRjaO5RFIJGMr5zBM7OGHK3mOKPmud
 qn7poVf8H3dcHv89oIXgFOTy8aSF9eVXTwUVzkltO2tRQxMwuIgCVp/bxrDndBXaGq3AmqaHW
 QOdZRBppbHk/gSOG3TUqAZguQdbizfNpTo1bgE2IenPd07aEVz+iZLc1OlLKVSP6bwHRxiXNB
 sAUucCXmp6UuzyHDadU9BwX5Fn3WwtA9uwdVGDl5rt304YXNkmGcPOdj/lLE6AypxKzYbA3SS
 Mj3NNMjIlUloZQzscUEBsKhBSswGI+4t19Jo0L5Jh/QzNVkadyQ/VsYPaGJJE49bJ9lMYdYSk
 FiNIIToFKBQhxAg1tVhaUMY/AClXQIP/4h2n/Ydg2iuKVa9tQ7ruJ5+RUf/K3/QqIRPjpD4wr
 Du1c1gwhfcTM2szolfGtpOexMEXRsM9LEs8mZ3qe0iBV4=
Message-ID-Hash: PIGBCWWAXLSRM2D26CJ7GBK74AUJTZZ2
X-Message-ID-Hash: PIGBCWWAXLSRM2D26CJ7GBK74AUJTZZ2
X-MailFrom: oswald.buddenhagen@gmx.de
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PIGBCWWAXLSRM2D26CJ7GBK74AUJTZZ2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Samples are byte-sized in this mode, and thus the offset calculation
needs no shifting.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 sound/pci/emu10k1/emu10k1_callback.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/pci/emu10k1/emu10k1_callback.c b/sound/pci/emu10k1/emu10=
k1_callback.c
index 941bfbf812ed..5f6c47cbb809 100644
--- a/sound/pci/emu10k1/emu10k1_callback.c
+++ b/sound/pci/emu10k1/emu10k1_callback.c
@@ -310,27 +310,29 @@ start_voice(struct snd_emux_voice *vp)
 {
 	unsigned int temp;
 	int ch;
+	bool w_16;
 	u32 psst, dsl, map, ccca, vtarget;
 	unsigned int addr, mapped_offset;
 	struct snd_midi_channel *chan;
 	struct snd_emu10k1 *hw;
 	struct snd_emu10k1_memblk *emem;
=20=09
 	hw =3D vp->hw;
 	ch =3D vp->ch;
 	if (snd_BUG_ON(ch < 0))
 		return -EINVAL;
 	chan =3D vp->chan;
+	w_16 =3D !(vp->reg.sample_mode & SNDRV_SFNT_SAMPLE_8BITS);
=20
 	emem =3D (struct snd_emu10k1_memblk *)vp->block;
 	if (emem =3D=3D NULL)
 		return -EINVAL;
 	emem->map_locked++;
 	if (snd_emu10k1_memblk_map(hw, emem) < 0) {
 		/* dev_err(hw->card->devK, "emu: cannot map!\n"); */
 		return -ENOMEM;
 	}
-	mapped_offset =3D snd_emu10k1_memblk_offset(emem) >> 1;
+	mapped_offset =3D snd_emu10k1_memblk_offset(emem) >> w_16;
 	vp->reg.start +=3D mapped_offset;
 	vp->reg.end +=3D mapped_offset;
 	vp->reg.loopstart +=3D mapped_offset;
@@ -371,7 +373,7 @@ start_voice(struct snd_emux_voice *vp)
 		unsigned int shift =3D (vp->apitch - 0xe000) >> 10;
 		ccca |=3D shift << 25;
 	}
-	if (vp->reg.sample_mode & SNDRV_SFNT_SAMPLE_8BITS)
+	if (!w_16)
 		ccca |=3D CCCA_8BITSELECT;
=20
 	vtarget =3D (unsigned int)vp->vtarget << 16;
--=20
2.44.0.701.g2cf7baacf3.dirty

