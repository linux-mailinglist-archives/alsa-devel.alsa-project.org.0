Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C722389A98D
	for <lists+alsa-devel@lfdr.de>; Sat,  6 Apr 2024 09:20:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 012022D5E;
	Sat,  6 Apr 2024 09:20:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 012022D5E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712388016;
	bh=cLtY130+PEFam7ffB8P4qGwOien/n8p+NeRIB2hPy7Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=u7w84xgeusnKAHSBelEYixU75Cr80xNvHe4Xm5SqNNPX87JaWrcUMoJsGK3fCIfvb
	 QfLGeLidHzqqfMnCNFSA67OFwkMilr5X+WKH1LB22wNvAzJ/aEkyG8/fgWBJLxbzl1
	 HXVXTpTE+Sq6if1SDtrZW2aSEGPbv+fVD4Mi1IH8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6FFBBF805C9; Sat,  6 Apr 2024 09:19:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E546BF805C9;
	Sat,  6 Apr 2024 09:19:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 604E8F8020D; Sat,  6 Apr 2024 09:01:16 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id C3871F8015B
	for <alsa-devel@alsa-project.org>; Sat,  6 Apr 2024 09:00:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C3871F8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=oswald.buddenhagen@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=jkN87bln
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1712386853; x=1712991653;
	i=oswald.buddenhagen@gmx.de;
	bh=MK7C7/qbd6SpeemEa5wD3OKm4EbYaThgvFONupi9WjM=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
	 References;
	b=jkN87bln5w+u3xwzulbLGkSQzW0zQrmPYi+9by3E5E8o8B2yo5y3fI2tZjOF0prM
	 XboCPcr8ocP6mbF+nt6XWJIHLArnHwuDsAfNxgjvq9VwIa62PlxnAyN5k/BmULOaz
	 fOkaav11z5V6iAFFHnSe9/T6zlJVgxKI0LgPcFDRhLrzlooYqokbUHysy4khR8nGW
	 j2Ez8Evym68MP18P1zK9Ik9zGbp0FVGbVdhRManqcc7icqIKSsGstu69cXqw5WPZg
	 TNFQbcgNb1JtwK5Ep9+GmTaAvYvQbfmS9gvWmV0OSm5Gn98NPAJP557kkzAuKwaaR
	 JzqBrc5057HLwKnmIg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from ugly.fritz.box ([89.247.162.118]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MxDkw-1shNmO3sPA-00xYKb; Sat, 06
 Apr 2024 09:00:53 +0200
Received: by ugly.fritz.box (masqmail 0.3.6-dev, from userid 1000)
	id 1rszqo-Jro-00; Sat, 06 Apr 2024 08:48:30 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Arthur Marsh <arthur.marsh@internode.on.net>
Subject: [PATCH v3 17/17] ALSA: emux: simplify snd_sf_list.callback handling
Date: Sat,  6 Apr 2024 08:48:30 +0200
Message-ID: <20240406064830.1029573-18-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.44.0.701.g2cf7baacf3.dirty
In-Reply-To: <20240406064830.1029573-1-oswald.buddenhagen@gmx.de>
References: <20240406064830.1029573-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:GDkzlo9rojuPSQs37f1lTfMO8kpFNuoXP/r8KIas0vE9EM+EEbP
 GBWvSAUoslXlDUfR9XeW8H3yRsdAKxzAamhLITTX1mNCKwc2AoSHKX70lythecaYUJTr3s4
 +SOa4EwkJ/X2xTF65gjid/MQx21ykK23tmCUVVSu5iMo9LZ31VZyMoJy0k5hqplv3Uv9P2I
 En+TcyvxwqJjlp0L7u7hA==
UI-OutboundReport: notjunk:1;M01:P0:+sT6CLk85HA=;nt6PCZZ0JfqiU1sLFD56Cd++GZG
 +VLhgkFpJNPDRztPhX43RakSw2FqA70ZpKqUc3VK9SjaSmKF+/vs12NVaROFgwdtD6fFse2XC
 /9tZo+zFhqp7TVys5hbMjWMBZfxspBk/mzAzgW+FMB2gqzLKoNXyIIfbMVu9kGM8uEQyzE1Bx
 hU3Oxy/B7JitCcbg52BFCi+/C8pbbr5+r3lpSHvktw0Nh89a2UGtwBuA5/WVdvCdOYLfmP6YH
 6hO7oOjr3jUnqsU7kYDdCBILjp39YZXVzUheOqEs/H65WezDHf3rY/X6f4nuufvCkrT2H+jPE
 OLqNbKhXJD1k6Y20Hq+lhes9wzgFMu+5AnOdGPp6WlM02zGcmDaSkQ+5PvZpVve0xi6Wdw5Mn
 bmUo2JtQkAVGsy3CelMY4HyrWQYn0TZAB5BmNtVg9C9FMerWvi6maGD1g0Z+0S8LEC3XPScNM
 zEsVtyTNiKTg3cB+12EQs83jztlNtfl7xHVgqPCRLVBrD932qsBOdnze9fyV9sRadQskiaKYC
 rNqyeZYUECAPNy+RK7QpfmnzhsL+JKM0eD6UZcJ1AvzABZqX6fLJ8y+J+jOO3bMT9pfA+zhvv
 62TFfog4jn2EX7BQSDsof3W6Rs/4tImybc+Y2z3u4tiNbbGhy7PhIfZ1eNSjdInZcoF2wEaHz
 JQqG/BRrwXZ89EaYstYi5fpw+ANvfIOqDmyepF+CqB2AJC4mnsMXB+u5KTUGNlPCXdfDwrqNw
 pF1DjeFHpoCSP0W6ny1Dz9OWcuRMakEbV2N2B5QFtgI+1/6Ca8DeMOHvPbBFmAbKZpHbHlo1K
 1YDKZSeN7N0R/QRr9Ex63ka9M5jeqbq10YsPnbZbtcwnk=
Message-ID-Hash: P6B6NFF333PJX6MZCDOND7ZX3HWY5MG2
X-Message-ID-Hash: P6B6NFF333PJX6MZCDOND7ZX3HWY5MG2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/P6B6NFF333PJX6MZCDOND7ZX3HWY5MG2/>
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
---
 sound/synth/emux/emux.c      |  6 ++----
 sound/synth/emux/soundfont.c | 12 +++++-------
 2 files changed, 7 insertions(+), 11 deletions(-)

diff --git a/sound/synth/emux/emux.c b/sound/synth/emux/emux.c
index a82af9374852..01444fc960d0 100644
--- a/sound/synth/emux/emux.c
+++ b/sound/synth/emux/emux.c
@@ -94,10 +94,8 @@ int snd_emux_register(struct snd_emux *emu, struct snd_c=
ard *card, int index, ch
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
--- a/sound/synth/emux/soundfont.c
+++ b/sound/synth/emux/soundfont.c
@@ -1051,7 +1051,7 @@ load_guspatch(struct snd_sf_list *sflist, const char =
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
@@ -1520,9 +1519,8 @@ snd_soundfont_remove_unlocked(struct snd_sf_list *sfl=
ist)
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
--=20
2.44.0.701.g2cf7baacf3.dirty

