Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 573DE89A983
	for <lists+alsa-devel@lfdr.de>; Sat,  6 Apr 2024 09:16:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF28B2CED;
	Sat,  6 Apr 2024 09:16:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF28B2CED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712387779;
	bh=8UuZDYkxvUvLVrG1yELcEIVYz+Yz1gCh76RSIPzfC4o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MUtU2B3glR7fc7VbDycq9i7XYsbRYsVuKIg8hlRkEeIc8vxgsbDvOfvE9wIOWoQYU
	 rlx3j2cY2Gm2QU5KpYsg/5/bFzbmiKsRO+QHdIM7PxOnnJ5D05ZT4abhx/7RZ89+j0
	 07yid6yuM/YMACdUNTnc9tSchIJwwQtg4RgdqLLg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4A0BEF805D6; Sat,  6 Apr 2024 09:15:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 88706F805AF;
	Sat,  6 Apr 2024 09:15:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 75690F8020D; Sat,  6 Apr 2024 08:51:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H2,RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 599C5F8016E
	for <alsa-devel@alsa-project.org>; Sat,  6 Apr 2024 08:48:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 599C5F8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=oswald.buddenhagen@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=HMq9Guhi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1712386113; x=1712990913;
	i=oswald.buddenhagen@gmx.de;
	bh=Rms+ZeEyJCKqoK2eujFCLJP5kZmmnSCDeFDpdkDzd5w=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
	 References;
	b=HMq9Guhi12c4rDfvqPmqKR/sH3IE/Oc/cwrAXZVvHnSDqfEFZwANybGyoCwy047N
	 Pguxz6DMgiC5nKrZMq9q2+9bEw3rzUcVnvDVtVVvRq318KNb74fyDajpZqdX0g83g
	 BV/45esVG3OpwAB0cWKfIfepyhy4KfOwv2pRDLeC3xhgyLM98hIwP/hkqUiHpBTUN
	 WYaz2vmcwa0e6FXADkQwyKoDVCmNGQmLtLNuqxCuUX+EXi5Ic7AdZzUtMMVHziiSH
	 de9NylK04m0YOBhQAubOl5Bx15/1egTKXusKwMhaetN077+/J1xSKAXL67UFfiz/N
	 c663SQd7xVwR7fbl+g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from ugly.fritz.box ([89.247.162.118]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M2f5Z-1rx8a138jX-004AS3; Sat, 06
 Apr 2024 08:48:33 +0200
Received: by ugly.fritz.box (masqmail 0.3.6-dev, from userid 1000)
	id 1rszqo-Jr0-00; Sat, 06 Apr 2024 08:48:30 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Arthur Marsh <arthur.marsh@internode.on.net>
Subject: [PATCH v3 07/17] ALSA: emux: improve patch ioctl data validation
Date: Sat,  6 Apr 2024 08:48:20 +0200
Message-ID: <20240406064830.1029573-8-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.44.0.701.g2cf7baacf3.dirty
In-Reply-To: <20240406064830.1029573-1-oswald.buddenhagen@gmx.de>
References: <20240406064830.1029573-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:9APvY0lbeI7/aAQTZgYgcBn7R8DcClVpigvCSVoDZmW9BR+DDJe
 3NlyGoFY/SucBg4c/OudITYTktG2jL9d5+MdrQE4317F3fSkkadrkpUXU+mDXbHbWD9H7Iy
 XyF2/LF0hUGL0jLnyqKBcSzKAYnbME3fNrX34T0RviaZ4FtIpP8mrks9v3b03wQCClohkil
 CwxYNsptdUyZHB7ZSZvFQ==
UI-OutboundReport: notjunk:1;M01:P0:1GtagElvqUw=;jlyy2yFh3xxchXNrTB2rx30Zizl
 3XRh1IgkPzTWwJ36DLSSSzbjdvoGWkuAbvUrGaMXld1HRolWU+0vZy+ybSQerc6Gcwu3PDtsi
 Rq4VaQE/WF3fSx5hjOCY6khkmuqCADKvSHKkuxAyMgJ1FLX9PGd2b2sT1JnUiPwTIz8cJvUyG
 qHdRMkSFs386fs+vDC+YoytJW5BSqZUlGbgQuEIXOKt3TSz6iGvLrXtIMTojurmxJgtoekMhH
 Z+C09yio9dTnajWwqeP1mMUVdR+Rj5PH2lVM96nDVWPKlghRCCIMYQ96cBsiDV7n+hUGA8Al5
 l/S0C5q6IC3fBzUubjvXUn0yq5s0kTy7nbc8n3ja/HYCzbzLJ17WaTuJEXY8WHk1EFHljZch6
 lY1l+v/+L6nZCzz1sOvLyrNu3bh4YVyjolelArJaduDNWLdU+uZceJ57s3q/PV6dwMBuda+Sb
 I4imEkIFFF9tXEZYQeCsezVUDHNrkHjA09m4YGkqKUBoH4B3wamcqjIb6pMoVkvRpTdTQVc2v
 npjnfhZvuto0pX98WIfGShRunAn63eN/ebUFX24I3GWiK/WKzcEFusYHnNdxPUpfofHJytfan
 eix98HFKsAebLkJP5YMY84WbZEaCtbAxI2rJRcybS6837dwrEfR2Ekdxbi8fD7alSK01gY+Z3
 d+Urx7F3yXqtTysem1OvC9xuNtyvUykZWv4Qt0rftMp2DIzYvbT0FNfZdog/t1UzYXma8TeGc
 qf7ODs3Hq6H+vS0wzuZHH9+uU7FO/VGbt9D/xLYL0L6Z3mNNvOKn+OwFGpMsDI8Z5L5SARXwU
 e0rqEWQax+8fZMWJtpWH1aC+r/rat7Ot/qD/EDGIpgwa0=
Message-ID-Hash: ZFMI74KZNPRIFCIY7YVMRJUTQZ3SSUAX
X-Message-ID-Hash: ZFMI74KZNPRIFCIY7YVMRJUTQZ3SSUAX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZFMI74KZNPRIFCIY7YVMRJUTQZ3SSUAX/>
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
---
 sound/synth/emux/soundfont.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/sound/synth/emux/soundfont.c b/sound/synth/emux/soundfont.c
index 6d6f0102ed5b..4edc693da8e7 100644
--- a/sound/synth/emux/soundfont.c
+++ b/sound/synth/emux/soundfont.c
@@ -716,22 +716,25 @@ load_data(struct snd_sf_list *sflist, const void __us=
er *data, long count)
 	struct snd_soundfont *sf;
 	struct soundfont_sample_info sample_info;
 	struct snd_sf_sample *sp;
-	long off;
=20
 	/* patch must be opened */
 	sf =3D sflist->currsf;
 	if (!sf)
 		return -EINVAL;
=20
 	if (is_special_type(sf->type))
 		return -EINVAL;
=20
+	if (count < (long)sizeof(sample_info)) {
+		return -EINVAL;
+	}
 	if (copy_from_user(&sample_info, data, sizeof(sample_info)))
 		return -EFAULT;
+	data +=3D sizeof(sample_info);
+	count -=3D sizeof(sample_info);
=20
-	off =3D sizeof(sample_info);
-
-	if (sample_info.size !=3D (count-off)/2)
+	// SoundFont uses S16LE samples.
+	if (sample_info.size * 2 !=3D count)
 		return -EINVAL;
=20
 	/* Check for dup */
@@ -774,7 +777,7 @@ load_data(struct snd_sf_list *sflist, const void __user=
 *data, long count)
 		int  rc;
 		rc =3D sflist->callback.sample_new
 			(sflist->callback.private_data, sp, sflist->memhdr,
-			 data + off, count - off);
+			 data, count);
 		if (rc < 0) {
 			sf_sample_delete(sflist, sf, sp);
 			return rc;
@@ -986,10 +989,12 @@ load_guspatch(struct snd_sf_list *sflist, const char =
__user *data, long count)
 	}
 	if (copy_from_user(&patch, data, sizeof(patch)))
 		return -EFAULT;
-=09
 	count -=3D sizeof(patch);
 	data +=3D sizeof(patch);
=20
+	if ((patch.len << (patch.mode & WAVE_16_BITS ? 1 : 0)) !=3D count)
+		return -EINVAL;
+
 	sf =3D newsf(sflist, SNDRV_SFNT_PAT_TYPE_GUS|SNDRV_SFNT_PAT_SHARED, NULL);
 	if (sf =3D=3D NULL)
 		return -ENOMEM;
--=20
2.44.0.701.g2cf7baacf3.dirty

