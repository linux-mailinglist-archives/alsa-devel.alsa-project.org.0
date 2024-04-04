Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 350D189849F
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Apr 2024 12:05:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A8DCC2CB5;
	Thu,  4 Apr 2024 12:05:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A8DCC2CB5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712225128;
	bh=rPXQPugvGLGgdzjUfMrFaept3p4iWG4Qqh732gVllDY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=q3QDSOqnqCd8NZ5Og2+zkCiFj0ZzfDHN5g4qzjSqPXgxrvAFxpLobFDn0Lxxd1WJm
	 ErLtQdzvbPfUv6hCg2aANN6Lb2//G6yHas9CpbJ3l/o35438tGt1fYw2swHwOoyJdd
	 vJZD33DqYLEyX4o5MMC5Dw4ubAQtZVmR7UEePeZQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BBB0BF8057F; Thu,  4 Apr 2024 12:03:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6BE8AF806AD;
	Thu,  4 Apr 2024 12:03:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 691CFF805D2; Thu,  4 Apr 2024 12:03:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CAF5EF805D5
	for <alsa-devel@alsa-project.org>; Thu,  4 Apr 2024 12:03:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CAF5EF805D5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=oswald.buddenhagen@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=lga2SKAm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1712224978; x=1712829778;
	i=oswald.buddenhagen@gmx.de;
	bh=MUOivZ7Cu3IgAolz222zrK5VXW8zypYQVAP8txCHrVw=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
	 References;
	b=lga2SKAmYxCpdoFK8gcu+FYaY8UaOB3eLh4He8wc8wDboUUVpYPFoNyfKrdycLUH
	 m3iotnNidIyD1JIxkTmKDBDuKFsivreGAVY2W11uNnRLeTeq2YBeXFLwGXDkFvbwU
	 SprJbHKsUsuqKieGdmxt9qQiMySDCWsY54HTSzmfIeSeh7CbLEpzqv5s0oXFbNEnQ
	 4xVgycOaTlK6v8CMOK/4i4RPfdFuzF0IcDXe/qwJBadJS1Vme3ZDH1dkRbggvdYeD
	 8aaJX50xcspgBFtsXsQxNiK8O6H53DQHpTwg2HyumDfd88PcjnB9NOy9DexoafMuL
	 V/iFEtHr4uIvsGJMcw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from ugly.fritz.box ([89.247.162.126]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MEm27-1s2z3B0ECR-00GEKp; Thu, 04
 Apr 2024 12:02:58 +0200
Received: by ugly.fritz.box (masqmail 0.3.6-dev, from userid 1000)
	id 1rsJto-RGL-00; Thu, 04 Apr 2024 12:00:48 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Arthur Marsh <arthur.marsh@internode.on.net>
Subject: [PATCH v2 17/17] ALSA: emux: simplify snd_sf_list.callback handling
Date: Thu,  4 Apr 2024 12:00:48 +0200
Message-ID: <20240404100048.819674-18-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.42.0.419.g70bf8a5751
In-Reply-To: <20240404100048.819674-1-oswald.buddenhagen@gmx.de>
References: <20240404100048.819674-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:MCMfKnoV/bK7BfAeOwOPkyphksOyanzWAdq0F7eCAipYbNeWT67
 okxEigcOemaXDUyHIfbdpuxBxr5VJRrtfCJeGB6aT8lYLrzVukZNNqiS1ke9dmpIwhGlx/r
 W37cTfqJE0W5HkratL0ly++LS/Tvo0KfmlvsvdHUuQgx0HR5DD5ZeFsau7NNupmCeDzTY9e
 L8m3ekRqcUcgebD/DhksQ==
UI-OutboundReport: notjunk:1;M01:P0:Gc7z00Buc3c=;kE+IuqjF2FpDsoxfMnZcup1Xip7
 +Yy/3k4AtK7YIunCvWhv4VqZqpxdZ+1SNytpug5QePlMAT6ijuyT0AOtmok0jyaxV53XlI5de
 0kxBfiyV5Zx4/xZjwxAAeb+EfPZ3Yw4XQeYdK1oc/xZBCvaX1TM3bbT7YBKtQbcL3SZPV1qo8
 a0jNOqLVU/kP/PE1upBfPVGjeMjG+wBWn5mOomr5SJknAbwXF3R0qa7E69uul2V/QQUvUCfmE
 LoQb/lmoGqor8PTNgGxK7HHKqpdrGRYhox1me2CcexsgG5MzdnhIO0C6GlhePMgnp5A8h2+rl
 ZhD57BPx+WAEHPL4gm0muteONRmMKaxgADVZC/UYp4LhVVpWysLgyoPtIpxdA8BeQGKFoFtSt
 XQGd2B4Q1pVuPESJPxC3RyHJMBGCl5jqVg1WRTKXOtW+UM8icnB84fgpOx67WUG8HjVqr8BhV
 dqY3FZGmKCG6ReKMuenOC/4ldtoGHe+MCVv24om+5KGFuGUHFdcBX8rzZ+P84eAOAIheooo2F
 OHQnt1ltlrgQ/FrBkDNPZ2I+KyM4FMZzmSCJKYLZKw2KMx6mtJ13TbqU7J/VGs7y8GlG1V454
 fx6GQqlp3oO+GdZcT2Cih2vbOD2luZvBtlD2wNbU5qfVZrOyEB0jdl3PzuteVwYUrVzaAMUHo
 Hi6QmgsNQSDEEMCfx9gZ9K8D3tCWO1XK8caEaF3B8g806azpV9IVHFyDbtX00n2fMqeW0ImUe
 5l8ALqZz1c4kNeiwc4ioDD7P4gIS0M1ek3+uG/HO25Mtn4DKq1owAINh6Wv8sMBOX22nBw4lf
 WXYV4/ftLpucAZ3GfqeJ8ttbpw6f+jKOOVwFYtbAqq7Q0=
Message-ID-Hash: ATC3MSFZ33OTE6MNPUETTA3GWJZTWESN
X-Message-ID-Hash: ATC3MSFZ33OTE6MNPUETTA3GWJZTWESN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ATC3MSFZ33OTE6MNPUETTA3GWJZTWESN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Both drivers provide both sample_new and sample_free, and it makes no
sense to pretend that they could not. In fact, load_data() would already
crash if sample_new was null. So remove the remaining null checks.

Contrary to that, the emu10k1 driver actually has a null sample_reset,
though I'm not convinced that this inconsistency is justified.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
=2D--
 sound/synth/emux/emux.c      |  6 ++----
 sound/synth/emux/soundfont.c | 12 +++++-------
 2 files changed, 7 insertions(+), 11 deletions(-)

diff --git a/sound/synth/emux/emux.c b/sound/synth/emux/emux.c
index a82af9374852..01444fc960d0 100644
=2D-- a/sound/synth/emux/emux.c
+++ b/sound/synth/emux/emux.c
@@ -94,10 +94,8 @@ int snd_emux_register(struct snd_emux *emu, struct snd_=
card *card, int index, ch
 	/* create soundfont list */
 	memset(&sf_cb, 0, sizeof(sf_cb));
 	sf_cb.private_data =3D emu;
-	if (emu->ops.sample_new)
-		sf_cb.sample_new =3D sf_sample_new;
-	if (emu->ops.sample_free)
-		sf_cb.sample_free =3D sf_sample_free;
+	sf_cb.sample_new =3D sf_sample_new;
+	sf_cb.sample_free =3D sf_sample_free;
 	if (emu->ops.sample_reset)
 		sf_cb.sample_reset =3D sf_sample_reset;
 	emu->sflist =3D snd_sf_new(&sf_cb, emu->memhdr);
diff --git a/sound/synth/emux/soundfont.c b/sound/synth/emux/soundfont.c
index 4edc693da8e7..2373ed580bf8 100644
=2D-- a/sound/synth/emux/soundfont.c
+++ b/sound/synth/emux/soundfont.c
@@ -1051,7 +1051,7 @@ load_guspatch(struct snd_sf_list *sflist, const char=
 __user *data, long count)
 	/*
 	 * load wave data
 	 */
-	if (smp->v.size > 0 && sflist->callback.sample_new) {
+	if (smp->v.size > 0) {
 		rc =3D sflist->callback.sample_new
 			(sflist->callback.private_data, smp, sflist->memhdr,
 			 data, count);
@@ -1416,9 +1416,8 @@ snd_sf_clear(struct snd_sf_list *sflist)
 		}
 		for (sp =3D sf->samples; sp; sp =3D nextsp) {
 			nextsp =3D sp->next;
-			if (sflist->callback.sample_free)
-				sflist->callback.sample_free(sflist->callback.private_data,
-							     sp, sflist->memhdr);
+			sflist->callback.sample_free(sflist->callback.private_data,
+						     sp, sflist->memhdr);
 			kfree(sp);
 		}
 		kfree(sf);
@@ -1520,9 +1519,8 @@ snd_soundfont_remove_unlocked(struct snd_sf_list *sf=
list)
 			nextsp =3D sp->next;
 			sf->samples =3D nextsp;
 			sflist->mem_used -=3D sp->v.truesize;
-			if (sflist->callback.sample_free)
-				sflist->callback.sample_free(sflist->callback.private_data,
-							     sp, sflist->memhdr);
+			sflist->callback.sample_free(sflist->callback.private_data,
+						     sp, sflist->memhdr);
 			kfree(sp);
 		}
 	}
=2D-
2.42.0.419.g70bf8a5751

