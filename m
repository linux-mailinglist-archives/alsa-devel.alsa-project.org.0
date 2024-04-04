Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 234C6898497
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Apr 2024 12:03:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 65B422C6F;
	Thu,  4 Apr 2024 12:03:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 65B422C6F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712225029;
	bh=w80JfGIsSC3/iFftH3e/00GvagaEyUQiANdz/LDp858=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QNEcGUzCJq7+2tmhQSh+9FuLdXH0Ut6pNc3qV7sa2nR2X2xtFb+GyMV+P8+kXyhmg
	 52bbNhCpnsA6EM4HWysNuNK/OnDvkWHM3DQ26wmIkPdwW1mlWvPZckN/+UXNgmQyBI
	 MdxXy2QaBSe3iI6aUTT7U37Hv2nAnIfH73XTmMS8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0A9C6F8060F; Thu,  4 Apr 2024 12:02:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2F533F8060B;
	Thu,  4 Apr 2024 12:02:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5696BF8016E; Thu,  4 Apr 2024 12:01:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A0151F80238
	for <alsa-devel@alsa-project.org>; Thu,  4 Apr 2024 12:00:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A0151F80238
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=oswald.buddenhagen@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=KMrfxJfA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1712224851; x=1712829651;
	i=oswald.buddenhagen@gmx.de;
	bh=gT0Fc3s0V7arG50ohbQehwLq67lOsar3syDQYGHBBr4=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
	 References;
	b=KMrfxJfARCra9fgBv/Utwp0sggsnZkJtbu2yv5bmkH1drOrk+iA0fAJFNlsEhdff
	 6chOm/fKAR4XkcgpFWEgnm8PQIXu0oiBdXCNt/S8M0MahqIXxK+zhOa+T80Tr81Vj
	 IU2HXUrPmpQf5l9MKlZTuynxefmKxgxI75rOn0dKW3dnk1+K7MxvFcdHHPiE3Q/AC
	 rf4KWcIXivOMnr4LGiP1bYdg0+lOqzYWt2XuOYHzrrUw9pmvQqnmYqlTn1BBDtQH8
	 C4qCFwfadKUo76jtk8xEXGNAQ/xsbsrqtuOuFfbnrdF1WCLv8pCJ4xpz/HnzonX2q
	 YCDCmFWHQOx75bDJdw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from ugly.fritz.box ([89.247.162.126]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MBlxW-1rxmUZ0du0-00CD33; Thu, 04
 Apr 2024 12:00:51 +0200
Received: by ugly.fritz.box (masqmail 0.3.6-dev, from userid 1000)
	id 1rsJto-RF8-00; Thu, 04 Apr 2024 12:00:48 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Arthur Marsh <arthur.marsh@internode.on.net>
Subject: [PATCH v2 02/17] ALSA: emux: prune unused parameter from
 snd_soundfont_load_guspatch()
Date: Thu,  4 Apr 2024 12:00:33 +0200
Message-ID: <20240404100048.819674-3-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.42.0.419.g70bf8a5751
In-Reply-To: <20240404100048.819674-1-oswald.buddenhagen@gmx.de>
References: <20240404100048.819674-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:1DhF6qoHkopmsJvlbNJaTK0nG5cvGVDuXx4Y8cTzKa8OwROg39v
 68Z9aAfTCi3nb5a72Yu17uYZ5qoGvK56MIB7cDn7AMnFD4UVQpAgToKGOL/rED18pumagJX
 yAxK90+6wV+9IE2NQ/JRJ8jsY2idirHeF3UQDFFYE9pjojUgiJEd7xWJ9/bOAZSL/vrGNdY
 +3YDN5EKYn3/A5sL+StLw==
UI-OutboundReport: notjunk:1;M01:P0:hao7kNkAiek=;56He34GNceFiD6051Kim49nunjx
 qeyZxCKOK/rgNOVSewQToqwX01/yLQ1pY6rignnNKOBK9IACS8F9yIAenh0vuDBERi8TNRsbl
 HG1LekRcorneRTaJqCyC4S9JwqcWmTPXJIviVs2zzLmw3taK4UtnunQWeRUIeyxZDgj4F5rkz
 DK6LTUwG0z1AhgRFDrgLCbaqh9iD6GtW5bRGfzKVFFSeX5e2dX2uUFrNQOFfVRaxbLxla4RLh
 mxnJ3DWKCfdzaSi9xFED25sGcvXGR2RcFyL1h6zKJO+BuKvhNI3Si6ts19KaJGz4/wZUFWazC
 lhUt4PyCtjMpQ8fx8C0XWGqxhVramhtmY+0gTtosCIeMaaBnPFeiLFG50qJQ0Yr8SO7YbVuq3
 dlptMZjb7bzCP04NgV4CpEISQzD6JRqhgCMybwlov8wVzqR5WiJ3O9zTeGq/5ygsjbBTvz5J0
 crPtlPuuQxoYYeCrHU9XbHKAFY0v9eL996ScYAseNENgYdGxqtR11XQhss25Tmlv9VLRYgFkz
 ddp6DNfFW8vufD6sQ1QHDle88T5iiAlJuxxa6Nruvtre64nP5sjPIKgZRw6VYGTQC33gDrshL
 oY7cg6kLmugTqcc5QSK3Vzjnf/E+EFHTanUfUJPB/8GVlEt3veflW8ZUt2Y2K0EWpt9r6F8uJ
 AGwvEHlXbMf9RjN+Dj+V/rYNBLop6WP9jbVzM3V74yoXxa1tA4MT9pxWvyR4L4V9T0jvnrOZN
 Su9P1oxDQ+MFnqeTRlJTdfec5gSyMjoaWKGnA9ipLv3PvmAEnnAd6LnxdsHuGBOUEvKThtt8M
 a2hUXOTAas6Bt7Ph7GjCqds4E7jViyeBgyfp5+09qgvdw=
Message-ID-Hash: MTFVKWUA26SBVI4RQEYRU4NBPYXHXRVD
X-Message-ID-Hash: MTFVKWUA26SBVI4RQEYRU4NBPYXHXRVD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MTFVKWUA26SBVI4RQEYRU4NBPYXHXRVD/>
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
=2D--
 include/sound/soundfont.h     | 2 +-
 sound/synth/emux/emux_hwdep.c | 3 +--
 sound/synth/emux/emux_oss.c   | 3 +--
 sound/synth/emux/soundfont.c  | 7 +++----
 4 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/include/sound/soundfont.h b/include/sound/soundfont.h
index e445688a4f4f..98ed98d89d6d 100644
=2D-- a/include/sound/soundfont.h
+++ b/include/sound/soundfont.h
@@ -89,7 +89,7 @@ struct snd_sf_list {
 int snd_soundfont_load(struct snd_sf_list *sflist, const void __user *dat=
a,
 		       long count, int client);
 int snd_soundfont_load_guspatch(struct snd_sf_list *sflist, const char __=
user *data,
-				long count, int client);
+				long count);
 int snd_soundfont_close_check(struct snd_sf_list *sflist, int client);

 struct snd_sf_list *snd_sf_new(struct snd_sf_callback *callback,
diff --git a/sound/synth/emux/emux_hwdep.c b/sound/synth/emux/emux_hwdep.c
index 81719bfb8ed7..fd8f978cde1c 100644
=2D-- a/sound/synth/emux/emux_hwdep.c
+++ b/sound/synth/emux/emux_hwdep.c
@@ -27,8 +27,7 @@ snd_emux_hwdep_load_patch(struct snd_emux *emu, void __u=
ser *arg)

 	if (patch.key =3D=3D GUS_PATCH)
 		return snd_soundfont_load_guspatch(emu->sflist, arg,
-						   patch.len + sizeof(patch),
-						   TMP_CLIENT_ID);
+						   patch.len + sizeof(patch));

 	if (patch.type >=3D SNDRV_SFNT_LOAD_INFO &&
 	    patch.type <=3D SNDRV_SFNT_PROBE_DATA) {
diff --git a/sound/synth/emux/emux_oss.c b/sound/synth/emux/emux_oss.c
index d8d32671f703..04df46b269d3 100644
=2D-- a/sound/synth/emux/emux_oss.c
+++ b/sound/synth/emux/emux_oss.c
@@ -205,8 +205,7 @@ snd_emux_load_patch_seq_oss(struct snd_seq_oss_arg *ar=
g, int format,
 		return -ENXIO;

 	if (format =3D=3D GUS_PATCH)
-		rc =3D snd_soundfont_load_guspatch(emu->sflist, buf, count,
-						 SF_CLIENT_NO(p->chset.port));
+		rc =3D snd_soundfont_load_guspatch(emu->sflist, buf, count);
 	else if (format =3D=3D SNDRV_OSS_SOUNDFONT_PATCH) {
 		struct soundfont_patch_info patch;
 		if (count < (int)sizeof(patch))
diff --git a/sound/synth/emux/soundfont.c b/sound/synth/emux/soundfont.c
index 16f00097cb95..e1e47518ac92 100644
=2D-- a/sound/synth/emux/soundfont.c
+++ b/sound/synth/emux/soundfont.c
@@ -941,8 +941,7 @@ int snd_sf_vol_table[128] =3D {

 /* load GUS patch */
 static int
-load_guspatch(struct snd_sf_list *sflist, const char __user *data,
-	      long count, int client)
+load_guspatch(struct snd_sf_list *sflist, const char __user *data, long c=
ount)
 {
 	struct patch_info patch;
 	struct snd_soundfont *sf;
@@ -1122,11 +1121,11 @@ load_guspatch(struct snd_sf_list *sflist, const ch=
ar __user *data,
 /* load GUS patch */
 int
 snd_soundfont_load_guspatch(struct snd_sf_list *sflist, const char __user=
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
=2D-
2.42.0.419.g70bf8a5751

