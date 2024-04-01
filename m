Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 903F9893AEA
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Apr 2024 14:24:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 024B21E8;
	Mon,  1 Apr 2024 14:24:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 024B21E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711974270;
	bh=rPXQPugvGLGgdzjUfMrFaept3p4iWG4Qqh732gVllDY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GFm/rs45j3rkIJPyPYNIPzpb07cDZEm9hGqa63kUOcbBFYHyLKfu842Tou6aaqPWw
	 3AQ33LEHqIaWMh/ig20RRRsU/gGUzoM7b7ekiZnCtY760lexVj17mgqsWbn161QPxQ
	 jg0acU4e7/s4z++jBZVuRWQMRcWrZRUqi466pV0E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 47611F806EC; Mon,  1 Apr 2024 14:22:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C9C9EF806E1;
	Mon,  1 Apr 2024 14:22:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C15B8F8067C; Mon,  1 Apr 2024 14:21:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CA067F80568
	for <alsa-devel@alsa-project.org>; Mon,  1 Apr 2024 14:21:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA067F80568
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=oswald.buddenhagen@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=M0sdZ9lm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1711974090; x=1712578890;
	i=oswald.buddenhagen@gmx.de;
	bh=MUOivZ7Cu3IgAolz222zrK5VXW8zypYQVAP8txCHrVw=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
	 References;
	b=M0sdZ9lmjafUWsI2P6vNPlTL+eJuhyp5jUhDug/SanDSqcDsDJe7ffU94WLWDj9l
	 GuKAymJNjFoyi0Gf1K20fphpqZ4mHe3j1piRphiKZGVa6nVcTMIP03rQuzXHhIQwe
	 HOtTqEKu6GBb2nZRnp+LsZ0ogXqdvG0aB3tZpDtHxeuy9mwiuR6oM6sx3F13UXgem
	 RuvN3RyjSO3gJaCIDYthzrpQoCbajSMuic8Py/GwGPYvvjIXQvI2rI2ZTVF0xonHO
	 KtAHEikBri0ucj/V/wxgLUE5aXtKUPz2sqGxLax4kQI26VvzRIFk3YXJisgTDHmtu
	 APWHKnQ8m9z8w+t3Sg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from ugly.fritz.box ([89.247.162.100]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Msq2E-1sfnsn4Bqa-00t8Tt; Mon, 01
 Apr 2024 14:21:30 +0200
Received: by ugly.fritz.box (masqmail 0.3.6-dev, from userid 1000)
	id 1rrEZq-7fC-00; Mon, 01 Apr 2024 12:07:42 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Arthur Marsh <arthur.marsh@internode.on.net>
Subject: [PATCH 18/18] ALSA: emux: simplify snd_sf_list.callback handling
Date: Mon,  1 Apr 2024 12:07:42 +0200
Message-ID: <20240401100742.506001-19-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.42.0.419.g70bf8a5751
In-Reply-To: <20240401100742.506001-1-oswald.buddenhagen@gmx.de>
References: <20240401100742.506001-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:slklNzdey/ZFPGtbkyCUgvuevz4tcJOgxwjYU5XPHlwfnYXD8+4
 y8ECjX8TIVvngrainvO+iTouSNSJ/MUfvuggn4UD4ZcfCqZ5v+LfMV5oejPVume2kewUTOS
 wYn6lEhShMPSPQ2IupRonOn6nEPVaw8OwNwVAgHjuayz5hdQANuvWGeelyA0QN783ASXCzn
 s5bkmbbiex7fch0ZHs2lQ==
UI-OutboundReport: notjunk:1;M01:P0:AImAWOaQO+g=;EUjdXI1603PXy22v+XsWGLyD7cf
 lQGkjD3vkedxxi3gotjtwgz02Mumaa8Dh551ORBQiqZhCSMS3Rv6PfSzj2NlaocL1T+S0dvjF
 Qx34dpEnMzaZjpgn1+Ej00YPSC/SbZhWUr31A+OFvhRpZWQgQn2++NzMI+iZ8OgRhTnFyArWb
 QAD4BGDDVFbgvwKZKFQRp7xzdlFKFf1A3cwT+Esx3WVua/BWTOVuAQDZWY6meBCjy15zyijpE
 3ljA1UTEV+gU5ZCKPCQQOCHCYXRYdTYPl2XvXE59q9xwKi41aNvUD72ADk3lNaHdzQ9UNSWpa
 2CeGzwuvxaVHU6IG18I3f3z+Ikp/LZGeVTvQn7v3rBCVNTA0MaCV6px7fSKyeTElbUqA+46eJ
 oa+/Ii0GnnjyUrsT1eaxIeGLr6edr5C3sAE5POujfoeU4S9dd37iOrXOXINW9T5byZ+dqfVj4
 4QMtjkEInkjbVOOaNrj1jZMadgV2CHx5K4mTodKNhqGY8Zwcd14L6uqtnbkms6d4gSPrkudg4
 u5XWC4xgcUTqxQxXmjcPpLbkhGYABPVHsFFdJsapgsU6GbWIrstudqJOp7cuXfMms9anuj92r
 88np01yD7JVGUnGnM+oRqW9jm2FihBt50HeTGUW5HglkWWQMFZLsdN0LgENf3EV787aXstztC
 TtvMVygwv/Yqcqnx1dknQGN4CypmNsaeYEkmSGo2bGQaJZ860RA/e0ZeLqeFcAz1d5pe6Rrvp
 VI3Qq8Z13SH8U3UfPr4Ua6bTmhefyK+0VtSpthYuUq4pGmd1OqN5LZwSWfuH9HOrSyN/+QbT3
 k0JyX7B0kZCmxC3Arw/bPI1T4noaph9KIC6yaYB6GPvdg=
Message-ID-Hash: NAAFVRFOK73CIJHPFCATSOJB4L3NVGSY
X-Message-ID-Hash: NAAFVRFOK73CIJHPFCATSOJB4L3NVGSY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NAAFVRFOK73CIJHPFCATSOJB4L3NVGSY/>
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

