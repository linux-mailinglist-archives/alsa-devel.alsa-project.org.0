Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2567389A970
	for <lists+alsa-devel@lfdr.de>; Sat,  6 Apr 2024 08:54:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 67D7B2D4A;
	Sat,  6 Apr 2024 08:53:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 67D7B2D4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712386446;
	bh=W1q0ORYEUy1ngm+KQcSVJa1wB90nH90F5UPFzkDKfXA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kZzPZ0Gj4ChcOFH58ZKmvHd06f+lZ7/e8GN62DukPZVau0n/GdSVQ5xQh2OaT6fj/
	 f/LeK8RKTWlIPsT0mHjAut0UHrqbyiofHtDmFAq28G9An3lr+QzhdcXpU6D0fP1k50
	 ltxHsqTNU4In1WDqR/0gd5NeVMO5KJcuGMCVxbtI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E2593F805F3; Sat,  6 Apr 2024 08:53:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 88E6BF805F3;
	Sat,  6 Apr 2024 08:53:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1EBD2F80578; Sat,  6 Apr 2024 08:49:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H2,RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8693CF80114
	for <alsa-devel@alsa-project.org>; Sat,  6 Apr 2024 08:48:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8693CF80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=oswald.buddenhagen@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=VhA9cLV8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1712386113; x=1712990913;
	i=oswald.buddenhagen@gmx.de;
	bh=mCiF/7y5sPx+hhSFI7OtFyOT6jvTkqkO+OyMmEn0OYY=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
	 References;
	b=VhA9cLV8gBqEzUTh8o9qpnsk0gh4Lb2/S1tM0uK46oBT7CwgkW4ZK2lle2No9S8c
	 QJPzL/bCMwyw4BfuEKzRZuyPhza7QugwGraZoWTmYFrZqGPJNkSB532WVbcWdjta/
	 tlUIY0JLmdi+CRe5zQ88sFE+b1+kNS1atfdMYd6fXWv2hKkmN70+CRW26W9Oc4KHW
	 XbPgMywgM4JxImrjTCsnbIqYYS7yWnzr+qPh9NYYlku08cW5DAl6fckq42qUTgB2K
	 1WiomOgLvfwQhQQ69dBAc7tccZ1ZOTrNl2k/oRlL0EHov+4UBgbXuLhWmFXQ+D7zG
	 Fk2MrsA791IC+BqhCg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from ugly.fritz.box ([89.247.162.118]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mr9Fs-1sY3su3Ahy-00oCt2; Sat, 06
 Apr 2024 08:48:33 +0200
Received: by ugly.fritz.box (masqmail 0.3.6-dev, from userid 1000)
	id 1rszqo-Jqb-00; Sat, 06 Apr 2024 08:48:30 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Arthur Marsh <arthur.marsh@internode.on.net>
Subject: [PATCH v3 02/17] ALSA: emux: prune unused parameter from
 snd_soundfont_load_guspatch()
Date: Sat,  6 Apr 2024 08:48:15 +0200
Message-ID: <20240406064830.1029573-3-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.44.0.701.g2cf7baacf3.dirty
In-Reply-To: <20240406064830.1029573-1-oswald.buddenhagen@gmx.de>
References: <20240406064830.1029573-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:yuUhBpK4Ba6OLiTP7mkFMPbHP/xv40Z21hZSPGwVyLqR8bnrkPN
 JbFifVGPc3jv5bf5QDYpbOiS/5lbVWv0M4i++o99NNBTKilYPsPT/gz5z0Cr0Qo4flgBQiw
 mVxNc7Wa17KjOE4e+P8pbvHcpwOK4PkI/FT86imHbqcQfIZm01jj/8PCkVpkxFd9g0hrQbN
 59NT9QDP0pAoQ+idYhs9A==
UI-OutboundReport: notjunk:1;M01:P0:qGk/bqhzG4c=;YNGQ34YrUteBnejP63kBaptJevS
 /R9fDGjOd3YnK3GPwA5FCzzHqz0840d/gLX3XOLuadg/t2aI3k7rfWlBVFOqM0fJGkpIZ+ELT
 bhTS7IW1C3/O5XLSQPmCzcOIl/SvtQ5n0H1B47Vma8pjRT79R1GiGmzGqupb1mbzINA9tKkqu
 PRn8hoRIRbt7FUvznJoUO2Qv3VYOvDI15Hi4b9yJlKX/JTzsIihWZWbXVgX8Ml1+UePin2yrK
 489RXlKVkU+6n8ZbFhnUl2n3wl42uBtasfsN1jzjCWGpFNyx/m/Wk5sfrYGOAGH/U4BrFve0a
 8hudgF/LpO1qzhA/JX4KIB6mgDb5RWVRUgyDt45jyiB2SeIU+n7cB+5Qb7UX5izy4iPOvg1c3
 +EoR4nNkL7ULp5lE/WdRaQsp5Mtatz517SbCLqfRGLnZ+x65TN3GRSOgCmkgXLdAd+7l/nu6O
 IaWex6V08OL0PZUDw+YyHXWll2KT0rNA1TePyrSAZP7nZG10qVT/BBkkt2GWZbKKddOQd3kZJ
 gorF+mTPc8/VA4HdyB/sTQF5dVutCjzRdwkm1NFsfjrMVIArpHY+JmA7tUIXhxyCPVeWszNZv
 Mu7XSngKSVdVfBcEo9qKhmogj2RWs785Ix0uae1/tGVWmrPeffkiv6sBgGOEECf2hWahL93Pk
 scpbvE0Y1EZDaNNwELMCB/pXj10XNXwhArPMdlyrS9/JQf+ZRot70YiWP0ZO/C8M/WZ+rPjLA
 oCVNeEsGP7kSr6y8MjA4K99dluv60aMR2cmKxbe0AQxJ/zCPnC3TuWA067qibX+keY9p7QpYT
 Z3baKP8/12L5T/kfaGBsWEbD2cClKIRI2kAm1acRhJ9PA=
Message-ID-Hash: JXKQLT6Z6FITVOEMFJUBA6IA6N2CRTBL
X-Message-ID-Hash: JXKQLT6Z6FITVOEMFJUBA6IA6N2CRTBL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JXKQLT6Z6FITVOEMFJUBA6IA6N2CRTBL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The `client` parameter was not used, so eliminate it from the call
chain.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 include/sound/soundfont.h     | 2 +-
 sound/synth/emux/emux_hwdep.c | 3 +--
 sound/synth/emux/emux_oss.c   | 3 +--
 sound/synth/emux/soundfont.c  | 7 +++----
 4 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/include/sound/soundfont.h b/include/sound/soundfont.h
index e445688a4f4f..98ed98d89d6d 100644
--- a/include/sound/soundfont.h
+++ b/include/sound/soundfont.h
@@ -89,7 +89,7 @@ struct snd_sf_list {
 int snd_soundfont_load(struct snd_sf_list *sflist, const void __user *data,
 		       long count, int client);
 int snd_soundfont_load_guspatch(struct snd_sf_list *sflist, const char __u=
ser *data,
-				long count, int client);
+				long count);
 int snd_soundfont_close_check(struct snd_sf_list *sflist, int client);
=20
 struct snd_sf_list *snd_sf_new(struct snd_sf_callback *callback,
diff --git a/sound/synth/emux/emux_hwdep.c b/sound/synth/emux/emux_hwdep.c
index 81719bfb8ed7..fd8f978cde1c 100644
--- a/sound/synth/emux/emux_hwdep.c
+++ b/sound/synth/emux/emux_hwdep.c
@@ -27,8 +27,7 @@ snd_emux_hwdep_load_patch(struct snd_emux *emu, void __us=
er *arg)
=20
 	if (patch.key =3D=3D GUS_PATCH)
 		return snd_soundfont_load_guspatch(emu->sflist, arg,
-						   patch.len + sizeof(patch),
-						   TMP_CLIENT_ID);
+						   patch.len + sizeof(patch));
=20
 	if (patch.type >=3D SNDRV_SFNT_LOAD_INFO &&
 	    patch.type <=3D SNDRV_SFNT_PROBE_DATA) {
diff --git a/sound/synth/emux/emux_oss.c b/sound/synth/emux/emux_oss.c
index d8d32671f703..04df46b269d3 100644
--- a/sound/synth/emux/emux_oss.c
+++ b/sound/synth/emux/emux_oss.c
@@ -205,8 +205,7 @@ snd_emux_load_patch_seq_oss(struct snd_seq_oss_arg *arg=
, int format,
 		return -ENXIO;
=20
 	if (format =3D=3D GUS_PATCH)
-		rc =3D snd_soundfont_load_guspatch(emu->sflist, buf, count,
-						 SF_CLIENT_NO(p->chset.port));
+		rc =3D snd_soundfont_load_guspatch(emu->sflist, buf, count);
 	else if (format =3D=3D SNDRV_OSS_SOUNDFONT_PATCH) {
 		struct soundfont_patch_info patch;
 		if (count < (int)sizeof(patch))
diff --git a/sound/synth/emux/soundfont.c b/sound/synth/emux/soundfont.c
index 16f00097cb95..e1e47518ac92 100644
--- a/sound/synth/emux/soundfont.c
+++ b/sound/synth/emux/soundfont.c
@@ -941,8 +941,7 @@ int snd_sf_vol_table[128] =3D {
=20
 /* load GUS patch */
 static int
-load_guspatch(struct snd_sf_list *sflist, const char __user *data,
-	      long count, int client)
+load_guspatch(struct snd_sf_list *sflist, const char __user *data, long co=
unt)
 {
 	struct patch_info patch;
 	struct snd_soundfont *sf;
@@ -1122,11 +1121,11 @@ load_guspatch(struct snd_sf_list *sflist, const cha=
r __user *data,
 /* load GUS patch */
 int
 snd_soundfont_load_guspatch(struct snd_sf_list *sflist, const char __user =
*data,
-			    long count, int client)
+			    long count)
 {
 	int rc;
 	lock_preset(sflist);
-	rc =3D load_guspatch(sflist, data, count, client);
+	rc =3D load_guspatch(sflist, data, count);
 	unlock_preset(sflist);
 	return rc;
 }
--=20
2.44.0.701.g2cf7baacf3.dirty

