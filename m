Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F47893AE3
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Apr 2024 14:23:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8F1942368;
	Mon,  1 Apr 2024 14:23:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8F1942368
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711974216;
	bh=lF1BBIluGxrDjhQOQ3oCHejcgQ7bQW4CJ1hx/bEh7ro=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fHondS40x+i1UvNa+AMbibexuIfrTYhJHuul0JPyrqI9jwCwR/J4rpAsAEdNmDhFA
	 5IdYbOWlOMMJTXrvN+Bmwre0cbtfb4/49BD+w67v5B9J4JN0jZwmpLd1dfgSchK8Le
	 abad7gFWvnueOswDknq0KsLkmDdUnMON0WbXz1pI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3D595F80671; Mon,  1 Apr 2024 14:21:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 44835F80685;
	Mon,  1 Apr 2024 14:21:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EC650F805EB; Mon,  1 Apr 2024 14:21:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F18CCF80238
	for <alsa-devel@alsa-project.org>; Mon,  1 Apr 2024 14:21:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F18CCF80238
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=oswald.buddenhagen@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=eajH5Cr1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1711974088; x=1712578888;
	i=oswald.buddenhagen@gmx.de;
	bh=lIxFNvaFLMZ4Wu3nEyl/CSG1r9On5GGz5QAPXFujn64=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
	 References;
	b=eajH5Cr1SrqdXw3Fu9EJA2S2AZt7youyP91e4d9PV0jvQl30tCMi0qcFQggpk7h9
	 /mCj9YJwj+bixH/WI3yD6+fEdRGUVlmKy6FKGwZjrG2FnlxmMrA+GTrMbQjgRdBIk
	 f9zXrcTwZKuJRnKmyGtPdictiE6nfID2ItQFMlyGtCqs96B3oCeAhR4qP/lWsTEjZ
	 dFHDF3Jx3/serQZbP0vKagyY0lRKucX+MJxcjT9kR6EPScbWbEhK6ZVGgIRC6UyNm
	 vToo16wqGPEAHp1ELUgxlN032HYe9JvWdCGQyI2Wt0qY/0NtHlNKFHhuMIgqiZjmZ
	 qq3WX090cAhf1/gSYA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from ugly.fritz.box ([89.247.162.100]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MkHQh-1sXB451nar-00kiQu; Mon, 01
 Apr 2024 14:21:28 +0200
Received: by ugly.fritz.box (masqmail 0.3.6-dev, from userid 1000)
	id 1rrEZq-7en-00; Mon, 01 Apr 2024 12:07:42 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Arthur Marsh <arthur.marsh@internode.on.net>
Subject: [PATCH 13/18] ALSA: emu10k1: merge conditions in patch loader
Date: Mon,  1 Apr 2024 12:07:37 +0200
Message-ID: <20240401100742.506001-14-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.42.0.419.g70bf8a5751
In-Reply-To: <20240401100742.506001-1-oswald.buddenhagen@gmx.de>
References: <20240401100742.506001-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:L/zRDdry4zhkaDjB4nGt8K5rDJCZOctdxN78+SSdRmS7RRsumlL
 TrovMcsLwZy1n75T4hdxm96EDlqa43lcuH0QlPGk8i/FHmD4TZb6B4+JK21T1KXSYmnvaDz
 fz1xg40hRIc7xD/tY75vaCOnZbMPWH9n1w/boFNaawCHkF7H/Myc3HrZJfoJ1RC39gcCQf+
 xGlxc18aps2m+RDzhzEiw==
UI-OutboundReport: notjunk:1;M01:P0:dgrhDZwhw+4=;4czIy96roT6fRlBYa4AX+tHNjrz
 d/rmH+0+7BS/YcxIu6YpZxvJwfJVK51muo5WNdvgOyza6UTCce26+70bujDzO4+nYU9hpvOWL
 2mgLWl8GScDRpRGUc6A/56EAT4gtElRwvM5s4+wB7r5TDhzCk0xctRSTXemUqwVC7qu4Y0YXC
 p1aQL7QyH8hvFXIrbTzeX9C5HeULdUxVA/RgIym+mgZtHzUxdMWvd9sZ0Shh3SVpm95jkq5a5
 G62/kzHopeyR9pz+wm/4alByJOkfPVLLXrGa4463UfXZ0YD7z5EiMer5/fvlZd98aRs7n4H5m
 ucHlOPappJVxfg0T1m/7/6Ot7+ii0NyrbUIPUKVgwWcNRKG4fyaAiOupGF4vd5mEgVC21O+fw
 nLKQK7vOoag1JXKx/ah72jn8MrHp5n+r1miS+V/YD5Jfx2IagG7/1gJkuN/aJ98y9Vx2RXu60
 QfGECQ4IdoBBTDe/q8Me1sKjpeWEyjE+Y1EcpQDXD1kvNjtNd81dLStwT50AjUCY4LTKffoDk
 vm5SK0VHFtqoix/teikgchvZwkOTpK//iXqLMU6PN4BqLmRjxRNbsyjhhHtbYHhim7rTQotot
 BsXwwZ+tWLCqFhXf1tAh7JEBHJoI/rlgPGfOIsMz/5S0uxrYv8bwcwHMnzf6WDa6NLzldFXye
 c19VAZ7XMPiC3yGKMeDU5z3Kndr99ZdskowJjU7rlMCTnTt0PMUmpZbKd6QEx1dgxmQ9836gF
 NL6tGkgizLetEhdB5bZrJTBqruEYFnulTZfYNYhUkDbWQMMlVhA8uy1pm6cS7SEY10iNidKpE
 SDd3C2g6j1LTJoAX1pBj5SRl8u45zesIBJ65tCj9benCU=
Message-ID-Hash: LIPZGUD4GK6A5WMKWRCP54DJZCXB7UWY
X-Message-ID-Hash: LIPZGUD4GK6A5WMKWRCP54DJZCXB7UWY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LIPZGUD4GK6A5WMKWRCP54DJZCXB7UWY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This de-duplicates the code slightly. But the real reason is that it
moves the code up, which the next patch will depend on.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
=2D--
 sound/pci/emu10k1/emu10k1_patch.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/sound/pci/emu10k1/emu10k1_patch.c b/sound/pci/emu10k1/emu10k1=
_patch.c
index a2ba6246dbc7..c7d54f38d28c 100644
=2D-- a/sound/pci/emu10k1/emu10k1_patch.c
+++ b/sound/pci/emu10k1/emu10k1_patch.c
@@ -53,8 +53,14 @@ snd_emu10k1_sample_new(struct snd_emux *rec, struct snd=
_sf_sample *sp,

 	/* compute true data size to be loaded */
 	truesize =3D sp->v.size + BLANK_HEAD_SIZE;
-	if (sp->v.mode_flags & SNDRV_SFNT_SAMPLE_NO_BLANK)
+	if (sp->v.mode_flags & SNDRV_SFNT_SAMPLE_NO_BLANK) {
 		truesize +=3D BLANK_LOOP_SIZE;
+		/* if no blank loop is attached in the sample, add it */
+		if (sp->v.mode_flags & SNDRV_SFNT_SAMPLE_SINGLESHOT) {
+			sp->v.loopstart =3D sp->v.end + BLANK_LOOP_START;
+			sp->v.loopend =3D sp->v.end + BLANK_LOOP_END;
+		}
+	}

 	/* try to allocate a memory block */
 	blocksize =3D truesize;
@@ -93,14 +99,6 @@ snd_emu10k1_sample_new(struct snd_emux *rec, struct snd=
_sf_sample *sp,
 	if (offset < blocksize)
 		snd_emu10k1_synth_memset(emu, sp->block, offset, blocksize - offset, fi=
ll);

-	if (sp->v.mode_flags & SNDRV_SFNT_SAMPLE_NO_BLANK) {
-		/* if no blank loop is attached in the sample, add it */
-		if (sp->v.mode_flags & SNDRV_SFNT_SAMPLE_SINGLESHOT) {
-			sp->v.loopstart =3D sp->v.end + BLANK_LOOP_START;
-			sp->v.loopend =3D sp->v.end + BLANK_LOOP_END;
-		}
-	}
-
 	/* recalculate offset */
 	start_addr =3D BLANK_HEAD_SIZE * 2;
 	if (! (sp->v.mode_flags & SNDRV_SFNT_SAMPLE_8BITS))
=2D-
2.42.0.419.g70bf8a5751

