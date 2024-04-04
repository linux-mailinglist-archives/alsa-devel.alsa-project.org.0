Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C18E8984A6
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Apr 2024 12:06:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B4DDB2CC3;
	Thu,  4 Apr 2024 12:06:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B4DDB2CC3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712225191;
	bh=yNlbA+5v9353GezzUIbNK70BCnj9zI4T7LWgvcgAZRI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PCmSOmm4Bve9lVPwHxef8dhFsAgu3d+/eMnacxk5arpqjWhA+yYNRAsbhzzJdp5Vu
	 Y9bsEXmk6xsudb1MAJ1xVNKKXP7tA/sUwXoaKXTFV88taxHJ+OgSZjGuGL22r0nfC+
	 AltLWy18gMuJxIsFjL2Q1wum715lbRAa/SRasvQM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E8FCAF80743; Thu,  4 Apr 2024 12:03:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7322CF80735;
	Thu,  4 Apr 2024 12:03:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DD96BF8020D; Thu,  4 Apr 2024 12:03:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,URIBL_BLOCKED shortcircuit=no autolearn=unavailable
	autolearn_force=no version=3.4.6
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5BE3AF8055C
	for <alsa-devel@alsa-project.org>; Thu,  4 Apr 2024 12:00:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5BE3AF8055C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=oswald.buddenhagen@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=ZuZvRQui
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1712224851; x=1712829651;
	i=oswald.buddenhagen@gmx.de;
	bh=2GdLrZxDjdbvVF1lEmdcI8u4pC5LW9+4fvqwPQfg7dw=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
	 References;
	b=ZuZvRQuiTzxTn8dCuJdIW7MfwNqWsfJTwrmKeQknlXcA1vzKR1qxX3ItG2Z91RxM
	 4fUKSJZ919cJTa10rxm/F9OOrzAKf8V0Dd+WphBi9/j5I5rnVZCsLa1TCXCdwwwo0
	 85wNtu3TClfZJ4S7O8sk82Tdjnr72BEWwXtIuwhNCneNdIJffl7Ts7tmchymMtJAM
	 YGNDee30SbuyTyope2fYEDkwmn3GOC+ovj9kDh89BLjLec/edn3tCqWkO8TR7sUlj
	 CZOF7n8F09qbna+hNg4aOuBJi8MYTFmMtWfV1Y873/CVbn75IFDXWcZkk0tBoHb0Q
	 QASL/xKSxyEF2d3WlQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from ugly.fritz.box ([89.247.162.126]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MwQXH-1siMkw0lKn-00sJyq; Thu, 04
 Apr 2024 12:00:51 +0200
Received: by ugly.fritz.box (masqmail 0.3.6-dev, from userid 1000)
	id 1rsJto-RFX-00; Thu, 04 Apr 2024 12:00:48 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Arthur Marsh <arthur.marsh@internode.on.net>
Subject: [PATCH v2 07/17] ALSA: emux: improve patch ioctl data validation
Date: Thu,  4 Apr 2024 12:00:38 +0200
Message-ID: <20240404100048.819674-8-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.42.0.419.g70bf8a5751
In-Reply-To: <20240404100048.819674-1-oswald.buddenhagen@gmx.de>
References: <20240404100048.819674-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:OyPmB4NFJuE3anL3mC3APIoT4TtFGbl9zdn3481ckOXlWqe5R0J
 K1BO20LFvKTSFB7zbv1Y8Lelez7n2ypYybMJYwuB6/NOwTCJmAK+43XmlI4GSXDbtd21dtG
 klzZ+5lTiAGSW+S/6rQdSU8AhpA6nIn8vpf7ejwSWfvGAVRdzY3h44DoBD/j8SFWKHRZ1m8
 NZd5V/+F2sLnXMXYLxRyg==
UI-OutboundReport: notjunk:1;M01:P0:61d9gOi6YAk=;ad3dicwwrJTEUhLovQzCA0pZweY
 g13mxxU3QnygYjF2LH55YWlnTrmXoKBdiSNXwUU3H1ueLTpm+J4yhsHfhsu+aVDNcy5zImrwd
 b0PkwlWOft1KcCo9310qZOooNOJIhYVgWwTTEoLXgpab5yRFt5lNxrF2KeobC4dc/eCJhzXAA
 49zOhfoPLo4JaNRGvqYVbbHL7KPgROl60uaRo4z4UVH/Kki+yDvrhtq2yg/hYz+vtbpU2YK5V
 uavBRWlfhas0ZcyQFyswSF0ndOfCvR5RjVar6QnJVEuR41C0hkqf282kcCvWKP5QlkBD48gQI
 Zp03uetWN8j/r383c5zhraNkMoZVcpNzRNtjzWhbQO76/kWNsm7f2827Fxju88AA+xKmYMu5H
 442B5xfyoH/gGLE/v7engzFm5IsYs4jAl3aVdY7f28h09QAlEISFxZQjzEhJA9qxd842H7Quz
 IJxyOv/jkOBVpK/u8oB9lCzgvf+ed+AmgqKFz08QE1C9Lwh7vrvJ9GZB6a66r9uwRb/3LNmva
 nh20BTBU9uCAvQaxGvlK2pnPyUFWVQX3yfM7PYQizX0fUkSbDBVaO6EOydamGLHQTIRIWm8za
 8nPmTVsgkH2wlzBi4erEAr00aceecr2FzgX2Up27sFcRbpwOnSW4bA3x7d+W84L8d8LYi5Tq0
 X9eREKIkR4TigZ/68tNnz4ZwhyNPR+yuskQ/ZBN2hPHMpiMCsbNK5Rbx5QCTdKM3wtcYbVngX
 b/5AWXuHYFvy1S3q9aTawcpLgZk0YEjxiIpnebdM97uxf2eHX8bLmk6qCz9n0Yvq+ocKuOk7u
 4rhTlS0A/DnBdfLOKarfAmph2dCQ5yKzfbJci79jbS67E=
Message-ID-Hash: HRRTTDFIJMQCZHT7II7U54ANVA3V35OI
X-Message-ID-Hash: HRRTTDFIJMQCZHT7II7U54ANVA3V35OI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HRRTTDFIJMQCZHT7II7U54ANVA3V35OI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

In load_data(), make the validation of and skipping over the main info
block match that in load_guspatch().

In load_guspatch(), add checking that the specified patch length matches
the actually supplied data, like load_data() already did.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
=2D--
 sound/synth/emux/soundfont.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/sound/synth/emux/soundfont.c b/sound/synth/emux/soundfont.c
index 6d6f0102ed5b..4edc693da8e7 100644
=2D-- a/sound/synth/emux/soundfont.c
+++ b/sound/synth/emux/soundfont.c
@@ -716,22 +716,25 @@ load_data(struct snd_sf_list *sflist, const void __u=
ser *data, long count)
 	struct snd_soundfont *sf;
 	struct soundfont_sample_info sample_info;
 	struct snd_sf_sample *sp;
-	long off;

 	/* patch must be opened */
 	sf =3D sflist->currsf;
 	if (!sf)
 		return -EINVAL;

 	if (is_special_type(sf->type))
 		return -EINVAL;

+	if (count < (long)sizeof(sample_info)) {
+		return -EINVAL;
+	}
 	if (copy_from_user(&sample_info, data, sizeof(sample_info)))
 		return -EFAULT;
+	data +=3D sizeof(sample_info);
+	count -=3D sizeof(sample_info);

-	off =3D sizeof(sample_info);
-
-	if (sample_info.size !=3D (count-off)/2)
+	// SoundFont uses S16LE samples.
+	if (sample_info.size * 2 !=3D count)
 		return -EINVAL;

 	/* Check for dup */
@@ -774,7 +777,7 @@ load_data(struct snd_sf_list *sflist, const void __use=
r *data, long count)
 		int  rc;
 		rc =3D sflist->callback.sample_new
 			(sflist->callback.private_data, sp, sflist->memhdr,
-			 data + off, count - off);
+			 data, count);
 		if (rc < 0) {
 			sf_sample_delete(sflist, sf, sp);
 			return rc;
@@ -986,10 +989,12 @@ load_guspatch(struct snd_sf_list *sflist, const char=
 __user *data, long count)
 	}
 	if (copy_from_user(&patch, data, sizeof(patch)))
 		return -EFAULT;
-
 	count -=3D sizeof(patch);
 	data +=3D sizeof(patch);

+	if ((patch.len << (patch.mode & WAVE_16_BITS ? 1 : 0)) !=3D count)
+		return -EINVAL;
+
 	sf =3D newsf(sflist, SNDRV_SFNT_PAT_TYPE_GUS|SNDRV_SFNT_PAT_SHARED, NULL=
);
 	if (sf =3D=3D NULL)
 		return -ENOMEM;
=2D-
2.42.0.419.g70bf8a5751

