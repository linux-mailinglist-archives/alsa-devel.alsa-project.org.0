Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DF6278939FA
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Apr 2024 12:08:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 64EC3219F;
	Mon,  1 Apr 2024 12:08:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 64EC3219F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711966098;
	bh=FnOnXxs8cQNILDz6eCQFTAc8g65/4WFFfJ64clc+g3Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vMA3OmlZBRG9cse9t5sRDXW2FXNv4pdyxwQ+5LNwhrME9nB8YT9ISrndNmfujt/Be
	 8tsU9RtpmqpUdDGnaVVLIkwsoEDD6ByMOIHKUnYvMORTOjk93htx3/R6ySjN3aX38B
	 YTqI+pwzREnXfbF1LxsoiUQZk4HuiTEGv7IUwsQ8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D5CBBF80578; Mon,  1 Apr 2024 12:07:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E130F80587;
	Mon,  1 Apr 2024 12:07:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4965AF80579; Mon,  1 Apr 2024 12:07:53 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 87474F80130
	for <alsa-devel@alsa-project.org>; Mon,  1 Apr 2024 12:07:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 87474F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=oswald.buddenhagen@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=LyvRRhcT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1711966066; x=1712570866;
	i=oswald.buddenhagen@gmx.de;
	bh=WsiPGGqNN85sMCbUgri9GR8KKSrWW90a8p1Jz8kA+Oo=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
	 References;
	b=LyvRRhcTU5Fuco0uMLMUhQs3geq09NNGdcmbVSKFwkr1Zxgqb3PQQJr3FK0F314k
	 8cC6wISkZZxCPnN+JMLBb9OH+RHZckDM0TKDoHpbmC76fZpqc8pj/KvaZQzKBW1JM
	 5Yu0mCxAYDEJXeYDZMV9TcvHFfDIvztd8AqUKBKlyiEkYZ+b+AQc/5T+NKqNGvbaL
	 lbgT4tDe7Bo5/cWkmrt2eTjA/7n1G9KIVMrw6aJstyYOA25n6Bcvbbu2umWK70e5S
	 U1xJQOWVSOSl2/9ddHqWP8Qbqy6fhClRa42XncYyCS0kCxReP6Vl9LnpLW0zc9wHj
	 PBu5q6KhUXETZZw16A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from ugly.fritz.box ([89.247.162.100]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MA7KU-1rxKAm3T7S-00Bf9y; Mon, 01
 Apr 2024 12:07:45 +0200
Received: by ugly.fritz.box (masqmail 0.3.6-dev, from userid 1000)
	id 1rrEZq-7eO-00; Mon, 01 Apr 2024 12:07:42 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Arthur Marsh <arthur.marsh@internode.on.net>
Subject: [PATCH 08/18] ALSA: emu10k1: move patch loader assertions into
 low-level functions
Date: Mon,  1 Apr 2024 12:07:32 +0200
Message-ID: <20240401100742.506001-9-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.42.0.419.g70bf8a5751
In-Reply-To: <20240401100742.506001-1-oswald.buddenhagen@gmx.de>
References: <20240401100742.506001-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:AlLLswnd6yDoX8NBc7X9uCfMIB1oc4qRk9ghrRUYYu7eqvl3pcI
 sywBO8R8TjQd33tnEbOJn/Wsqjkphc/QyoVzFluDMBeE6APBCffiQd9Flx3xleVis3UlqYN
 99cmPSU9jbqcBzisRysAFdlo/BnYkXqYJBPkWjkfY6N9Yq3L6hqHt0potOK0kl05W8fZ//g
 Gil8U2y6ktSG9vR/mJiLg==
UI-OutboundReport: notjunk:1;M01:P0:6o5uZYfoP0E=;+uWuajZ6OP+fMMJFOYPcFRcxbUy
 klshLIHL3WAUSOZik2kjLepmeks8CjjcMnKKrRPpIRe9a/VRuxRsVk/d1G65f9m/eZe3rtv8T
 KTL49r07k3fOz8TvrkxnqwTMm5mvkd6PPPgUz4ENdlHRy7wYQRpGODBWXgW5j1ZrJfTCFpT13
 8D4WX19kQq3nhybbf+VGft5/ZAIHI9tFqRO0vKRktKSeARYmP4amLnPR4/Pfdfqt6tJ3pmntZ
 ZdvLkFs7SLQqfyE8ydCZVn0RLT3uOJnwNp/w7mmm2+zDp4rQSjEk0VbIXH9PxrYvU0LymBToO
 FrDJ0ue/BesSoj1o0VS53kGX7O22YEtM5xpXuQgll84hyjPVovUC//Hf/ss5Mw3C5r1hb3yoP
 /uGiOtPqgq2HrvkATylZdblM31vb0P6Ahu0qwvpRzLe9tqzw75YB7lWFGoTFcpRgY0mflR7DU
 f1GhOboM1iU6Fm2+FmuCcdxcVRj/RY2o+0Jq8NBI3K3yiAzPED7DxkUZhKGrLaivrg+Ksc7/R
 ZvmHWJai9NrhEoWi/rjdv4DPWNwyBn/24V3bf0JnDrytGrz32w12XnNMQf5EYlVDY5+V8+t4D
 COw9c/HY3PsA9ukZQ2Uufspa3aC4XT6zeUKjo+NSVRUcaOAvGIxicM9ySLMkuSgkjXbPSTq6Q
 JY3RGSmUg6RlsLiujsZlgIMHLvNLSvMnLohPeRmx87em5Pjto/EIP6+pM8juTXRNZQESC4xFW
 7eHzll7WDdbD7py107hrRYDSJrPvD9pvWiBZl8+NtcJ3dI5BMJJKZYb86fCs8tDSyie4JII2j
 dDlnS8FxC6zDi3vvmK+5YNo3ugRthzAMLFS7mqsfRoZWo=
Message-ID-Hash: SCKLCX6SK4QES6VH5X2RRH4QHKWNULQZ
X-Message-ID-Hash: SCKLCX6SK4QES6VH5X2RRH4QHKWNULQZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SCKLCX6SK4QES6VH5X2RRH4QHKWNULQZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Convert some checks in snd_emu10k1_sample_new() back into assertions (as
they were prior to da3cec35dd (ALSA: Kill snd_assert() in sound/pci/*,
2008-08-08)), and move them into the low-level memory access functions
they protect.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>

=2D--

Side note: this eliminates the memory leaks in the now gone error paths.
I don't think it was actually possible to trigger these even before the
foregoing cleanups. But if it were, it would allow a user with access to
the audio device a scope-limited DoS attack on it. This would be only a
very minor security hole, given that on modern systems it would merely
enable the current seat owner to be a nuisance to their successor, by
making a reboot necessary.
=2D--
 sound/pci/emu10k1/emu10k1_patch.c | 4 ----
 sound/pci/emu10k1/memory.c        | 6 ++++++
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/sound/pci/emu10k1/emu10k1_patch.c b/sound/pci/emu10k1/emu10k1=
_patch.c
index 47d69a0e44bc..55bb60d31fe4 100644
=2D-- a/sound/pci/emu10k1/emu10k1_patch.c
+++ b/sound/pci/emu10k1/emu10k1_patch.c
@@ -65,17 +65,13 @@ snd_emu10k1_sample_new(struct snd_emux *rec, struct sn=
d_sf_sample *sp,
 	size =3D BLANK_HEAD_SIZE;
 	if (! (sp->v.mode_flags & SNDRV_SFNT_SAMPLE_8BITS))
 		size *=3D 2;
-	if (offset + size > blocksize)
-		return -EINVAL;
 	snd_emu10k1_synth_bzero(emu, sp->block, offset, size);
 	offset +=3D size;

 	/* copy provided samples */
 	size =3D sp->v.size;
 	if (! (sp->v.mode_flags & SNDRV_SFNT_SAMPLE_8BITS))
 		size *=3D 2;
-	if (offset + size > blocksize)
-		return -EINVAL;
 	if (snd_emu10k1_synth_copy_from_user(emu, sp->block, offset, data, size)=
) {
 		snd_emu10k1_synth_free(emu, sp->block);
 		sp->block =3D NULL;
diff --git a/sound/pci/emu10k1/memory.c b/sound/pci/emu10k1/memory.c
index 20b07117574b..fc9444404151 100644
=2D-- a/sound/pci/emu10k1/memory.c
+++ b/sound/pci/emu10k1/memory.c
@@ -574,6 +574,9 @@ int snd_emu10k1_synth_bzero(struct snd_emu10k1 *emu, s=
truct snd_util_memblk *blk
 	void *ptr;
 	struct snd_emu10k1_memblk *p =3D (struct snd_emu10k1_memblk *)blk;

+	if (snd_BUG_ON(offset + size > p->mem.size))
+		return -EFAULT;
+
 	offset +=3D blk->offset & (PAGE_SIZE - 1);
 	end_offset =3D offset + size;
 	page =3D get_aligned_page(offset);
@@ -604,6 +607,9 @@ int snd_emu10k1_synth_copy_from_user(struct snd_emu10k=
1 *emu, struct snd_util_me
 	void *ptr;
 	struct snd_emu10k1_memblk *p =3D (struct snd_emu10k1_memblk *)blk;

+	if (snd_BUG_ON(offset + size > p->mem.size))
+		return -EFAULT;
+
 	offset +=3D blk->offset & (PAGE_SIZE - 1);
 	end_offset =3D offset + size;
 	page =3D get_aligned_page(offset);
=2D-
2.42.0.419.g70bf8a5751

