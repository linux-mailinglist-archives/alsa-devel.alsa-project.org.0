Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3900E893A01
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Apr 2024 12:10:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D2099218B;
	Mon,  1 Apr 2024 12:10:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D2099218B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711966211;
	bh=w80JfGIsSC3/iFftH3e/00GvagaEyUQiANdz/LDp858=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=i0Gb+K/KR5YWBu30TTfgs1n7lIfXYA16CjAEcccshoYY7hwTIs5zIuAuNdAuaNqXc
	 7vZ9VEq8S27iRgUx134K6e3PLGMIhUW/X+dEtyweKNGlPvnNvPd3jua8/EIK9+6FfL
	 F6KyEP153Ee7idNwWJZEzCis0vmHvGNgv5CCB38c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 157D6F806A2; Mon,  1 Apr 2024 12:08:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B967F806AA;
	Mon,  1 Apr 2024 12:08:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0A1B8F8065E; Mon,  1 Apr 2024 12:08:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 20D23F8056F
	for <alsa-devel@alsa-project.org>; Mon,  1 Apr 2024 12:07:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 20D23F8056F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=oswald.buddenhagen@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=OVjne0oK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1711966063; x=1712570863;
	i=oswald.buddenhagen@gmx.de;
	bh=gT0Fc3s0V7arG50ohbQehwLq67lOsar3syDQYGHBBr4=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
	 References;
	b=OVjne0oKC2+wMJFxooPr0tGh3wceA4nJr+g44rg+Zqg+U+o7m/8YRSJEKf6dFMv0
	 zcR300BW8SSHY14mNdH7CiaCIss+CiBBpB9X5FykMitPughRUVeI8gA8LVmNWdQaZ
	 srPdreawoIWLjHSRRMiTIR4pY/mLoUiApCG5Sx3v6FIEtM+g2K0FBc0TQ+X/UU+wr
	 6EoZxqId7YoeXgUMsI2lV1t4AvrzGqOFtdpI7zcV6+11+NwwX/Ec6RctVwViTVN/X
	 5DLbu1KeFNafNGw6IfUO0RiUreksME8lvMjOWQwOLvPO6HC/w+xQNriVVe4ZirNcm
	 n/FXiC7woHTxFsCXOg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from ugly.fritz.box ([89.247.162.100]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M6DWi-1rtSZL0qDY-006frn; Mon, 01
 Apr 2024 12:07:43 +0200
Received: by ugly.fritz.box (masqmail 0.3.6-dev, from userid 1000)
	id 1rrEZq-7du-00; Mon, 01 Apr 2024 12:07:42 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Arthur Marsh <arthur.marsh@internode.on.net>
Subject: [PATCH 02/18] ALSA: emux: prune unused parameter from
 snd_soundfont_load_guspatch()
Date: Mon,  1 Apr 2024 12:07:26 +0200
Message-ID: <20240401100742.506001-3-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.42.0.419.g70bf8a5751
In-Reply-To: <20240401100742.506001-1-oswald.buddenhagen@gmx.de>
References: <20240401100742.506001-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:iESeTNFIgd6pizp9aZxMAcRK/xLC4yhcdfRAfLxZzjcnKmZF3qs
 UP4fgAwNX5WDFnJaySbWm7H4y8xyotGQoAc1fRX2LseEV8MMXAs/fIVLgfbTWm6LjzAe93y
 6Vxo+xMepA2YiWboY+BNxkmuJtatcRhcvt5deLN9mrv4ZX+gG2MyNZK+Q6TZCyVqXHLCb+I
 r3nzJzyd+2+Ws+QNeiDkA==
UI-OutboundReport: notjunk:1;M01:P0:w4FXZXYjTRA=;YhCtQBtFOSYDwVeHWcxKJk2UiK5
 a3kfcJU1AqxFWAQ2g5TAPcEMXpQGBDmL0iB0TH+fcpku5ZM3CJLdCjb9gWaqwYmbihSIHFFI9
 QbXXySoIJUF3tIXDycsltsG4tr2XabSLtlH3mFnvhBXFZw/RcVDYJfiZ7b0DQWjM9maolfDna
 PaDxoNflM82bz4fnGTqKSLLW0vMWuKVK1IUv0KdmZwEvb6VhdmfVMriIJRMrwUH07wIyz9OGf
 xmCBX03uzChsg8jRJ+2lkv+M6UwWL1BFiBuzZHxWOVLU1yttuM38u32d1WoihfZvrDD6PBuYI
 O7N7elFODdvJ3swsKWtBnIlE1NETKaA+dTVQxV9RoFG0VJr4yfGChIq5xDRg6HDv3/Nz71kp/
 mmm8ci2iSnEGxoK2fH8ZHpjIG6OOZo2ZeqnZ3yy2U2FuUbIm6aw5CoRFg9dFn4qD8QZ15J20b
 bKcLoj4H/7gUDvgT1Dj0Wctyh+G1gvUkWmToDBrUcSL6Pfxi663BxbhRkjJNoVrx1rD5vLdEq
 6PpCy/5U7H2xPgAtQEEg565M1WbgZqPh/6LHmv69de/BrwPSqtd+kBdB8dOp20fsfRkAe3PA2
 G3jq9fvBpoSzUOkDOXRFHONN7U5SO7kC8a27rQass4uq3KnSMXgtd0TEeZR/HVU4Ep5bmLawQ
 1HLLsyf5eANZWVqV8wdDpQP5lrLsUYYEEeq8x/QuhXXQDuG2+VchUSXgCBoA9M4w+FuqgFvt4
 xzgs9zpLRtHyCsssWpn4rwIR5CjGRaMYsWctiIDTUatuP4g4abBHlE/MeTo2AZXWxGA72hT51
 VNYwR+sdosyKotN24TKtcSr1t5rsd0HVdZdk7o+nHwGos=
Message-ID-Hash: KSMA2SLIV5BWQITBEDAA7WTVGO3TI57N
X-Message-ID-Hash: KSMA2SLIV5BWQITBEDAA7WTVGO3TI57N
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KSMA2SLIV5BWQITBEDAA7WTVGO3TI57N/>
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

