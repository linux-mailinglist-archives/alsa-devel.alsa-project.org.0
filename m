Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 66EC88939FD
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Apr 2024 12:09:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A7DFA2235;
	Mon,  1 Apr 2024 12:09:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A7DFA2235
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711966163;
	bh=yNlbA+5v9353GezzUIbNK70BCnj9zI4T7LWgvcgAZRI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=leCl/fcUfmpZG/Sns1Xc19UuQo2bF4pow6zXTNDK9OKEZGut2SNvLsqt9QWHinoyy
	 p13P/i7coSAXuFwmDVt9VcFx4pyqOUTl0AijihMqI+lnkqOtVIt5q8GapUaOduy8uB
	 bz3apT6aAB7f3jQF8ZOvF3HZamIQeoQUZ+NC2iBg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5F910F8061C; Mon,  1 Apr 2024 12:08:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AFE3EF80620;
	Mon,  1 Apr 2024 12:08:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A71D1F805F3; Mon,  1 Apr 2024 12:08:06 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 5F587F80570
	for <alsa-devel@alsa-project.org>; Mon,  1 Apr 2024 12:07:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F587F80570
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=oswald.buddenhagen@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=R2waYRo9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1711966063; x=1712570863;
	i=oswald.buddenhagen@gmx.de;
	bh=2GdLrZxDjdbvVF1lEmdcI8u4pC5LW9+4fvqwPQfg7dw=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
	 References;
	b=R2waYRo9TMJcjzT3uIiSy4Gtlo6KTrx1aYA58WmBIuCWvlEMakfCS+kay/q9NKAm
	 3ytxh8y0POmrHk4U4ocpnzBaHkKBmM6uGjqSRbXDSyvjhSzm9hQy8ShmX5oZqn0HT
	 iuL06iDyhaqmlV+YB77H5th1gcniPoQEd/FgCbXQpUaOnJDzIlQrRWbEYtdv1HPH4
	 dGBNdvNlc4tgzyhGD1jzh7UVKdIEt+8goQB0yOrGdDpF9AsQh9puncy9E5HMfVs95
	 JglC8iPqz9zdpa/VFwIrhdHf/hAjSDV8gf+ZtxQcppupndokKPCDpy9cVg1NQrRne
	 DCgKmJZYXoUXkKXCZw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from ugly.fritz.box ([89.247.162.100]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MaJ81-1sNWP40qF3-00WCHO; Mon, 01
 Apr 2024 12:07:43 +0200
Received: by ugly.fritz.box (masqmail 0.3.6-dev, from userid 1000)
	id 1rrEZq-7eJ-00; Mon, 01 Apr 2024 12:07:42 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Arthur Marsh <arthur.marsh@internode.on.net>
Subject: [PATCH 07/18] ALSA: emux: improve patch ioctl data validation
Date: Mon,  1 Apr 2024 12:07:31 +0200
Message-ID: <20240401100742.506001-8-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.42.0.419.g70bf8a5751
In-Reply-To: <20240401100742.506001-1-oswald.buddenhagen@gmx.de>
References: <20240401100742.506001-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Z/q+2LLGyEN7//d4CiaT3co7zvWHxi2sZ23coWRxZWomUAsqoaT
 89PG4vH8P1y4Imy5xIyLP+egNvsiV9pdkjQmHfWKI/J4P1m+UtxyXJ9ftaAEAJ91iFi/Hac
 kfKGJB+7agDKIMPIc/ItwN7envZpkDlzyrQQou1lLOzlANHvvazjdCwBWSxwx/jrXV1p3GF
 8pTmnota+rDeE1IEOzotA==
UI-OutboundReport: notjunk:1;M01:P0:qd9jzYW/y38=;ZdtGEmiOd6tOegKEtv6GMDIVuv7
 VDLt2bScllC+Oo7Hi43fZP9VYJkL2QB8iXKx61Ge+qZ6BvFVZBVCsWES5t4iqVg0SbOKe5var
 IzLxm+FZ0Ou3lctqh+x8xDED6tw6GGpBI2UDp9swKeruyrGYC6C1AkwCfr7RXpwNcxUyZ8hPu
 4Yx/YDJH+sckASGU/EHG5fnPibzMhUX21tAICUzVVF1D1Pbncpda1Wq4dFE8YitQclgY/urEu
 ZuqrY3WVN4ADWUXQzdPK6/XRLJp0VMuG+c1m4jnFkp1EyXGUIPcdnEt/9vp2SGP1F5FlRCY2q
 86y2ezurkXlWOgQyBGp9U2Cf7CdtsnOTs9XXtsbTzKI5Sp+tBczRuw1S2kwwGx7ngZrx3tyiB
 5F1nBHYid18sU37WjSk+xQee2MZ2SqjWeLPQcHmBjGwvhUtsj3gUoEKQgj44M8eFfNgcmRHU8
 oSIeAnvrpU3//nKzOjkY4yA0foru0gOm5ynK0cFi1zem1wet9FDE0Gpz92PwnAjBQxv28enOg
 ciGqb9+wISKxtDIzdUIOUNvxTDrcS3N2qGWeJdg0PJLOEi+vahDkytv/jk9WLY+RUEetXDQRm
 3vvNDma7K2Onr8Zo3YKw1x5Btf/9OHxBtcQn9Q0U65QZOTbZjqEuEcKqmQSd+c9Ym67uACWNy
 I7MU59c9q47rVPBALqkNGDsP7f/n+jXEBdO+z5UksXkGDooxjKbtWO0OvjIo9pQm2CeyaMRkz
 RiUzKM/ziNgt5j83lfPzCecKscB3fxpt350hLisqwJpdxsFRaFb6x6zLjUJoOpYi4ZaaLE1gX
 TQdJQ/Ew/JzS+R4lhhMEA2FRKfIhFBlA2SH01YmaG4MYQ=
Message-ID-Hash: 2JKIT364YL7B4UKNR7O3YWBMVW5IOY6G
X-Message-ID-Hash: 2JKIT364YL7B4UKNR7O3YWBMVW5IOY6G
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2JKIT364YL7B4UKNR7O3YWBMVW5IOY6G/>
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

