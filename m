Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD3B8939FF
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Apr 2024 12:09:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6F7E1211D;
	Mon,  1 Apr 2024 12:09:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6F7E1211D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711966176;
	bh=YIwbIZ6D+FCvdDacAGPsNTeusqvHMyZJnVxHcW8EYOw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=oKy26aW41QrxaErL/g+ovESlwCg+321QqZ+p27oWlYIIIStdYzLgYFODN6ejbjAPh
	 U9QhQrco/5nOg2jVED4bashX/tfV4cBR2HoVuyhi1rkPEJe/9gX/8V+HqtmXxGqjRF
	 CSlNGGCNGRqLLKwE/pfAK1CkKchjQCoicH3vn6z8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 66E2FF80652; Mon,  1 Apr 2024 12:08:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DC27FF80571;
	Mon,  1 Apr 2024 12:08:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B1E62F80609; Mon,  1 Apr 2024 12:08:09 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 84760F8055C
	for <alsa-devel@alsa-project.org>; Mon,  1 Apr 2024 12:07:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84760F8055C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=oswald.buddenhagen@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=rf1tWWQe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1711966063; x=1712570863;
	i=oswald.buddenhagen@gmx.de;
	bh=BKRzh0jN6jwk4FV1MW84OiCzx2QTtPr9DeRxFjCpOmA=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
	 References;
	b=rf1tWWQeAFYRzwoP8GsxHe+FKUWcEReWvWfz7xBfBFrihABesqA7V5BBSNolC68C
	 99qI1SCXD4KWunq91PqZ1BBqR+2HQDOgeJrPsyHUyii92xhUEDSKbsBEZUUIKn1kz
	 TKrH71tw5cH+o2oKxM8wNdIdKlsk+4Cm3iu7Z2hr+UCXOxkoONZb3i4ULxbIhIFsP
	 smd9Hb3qpyC+JPaZfegaxmCgNTYebSku+bLUu5HwJbirTQOU/JqodvB6bay9Hj0sZ
	 B5Fwp0bzIfpkJO244XshJZtrW7TJgBewtWwUnicMXyNXFJnvmhUqQ84qPUNKlEcH/
	 oUyrzz+6jL93WIkLpQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from ugly.fritz.box ([89.247.162.100]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MPokN-1sD2YW10p1-00MptT; Mon, 01
 Apr 2024 12:07:43 +0200
Received: by ugly.fritz.box (masqmail 0.3.6-dev, from userid 1000)
	id 1rrEZq-7e4-00; Mon, 01 Apr 2024 12:07:42 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Arthur Marsh <arthur.marsh@internode.on.net>
Subject: [PATCH 04/18] ALSA: emux: fix init of patch_info.truesize in
 load_data()
Date: Mon,  1 Apr 2024 12:07:28 +0200
Message-ID: <20240401100742.506001-5-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.42.0.419.g70bf8a5751
In-Reply-To: <20240401100742.506001-1-oswald.buddenhagen@gmx.de>
References: <20240401100742.506001-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:G3rSiJ8DS/wmwmyxOX+mRs56xPxKj+7FyV5rH1619Y4yEO+3h/t
 iMslymP6AaCHvF+lWi+jXm1naB9FJs9IhfQehf0q/kYy5lG1MC55AECY5WBHtAoS9y2fn97
 LtIzj9Qdjn1k32dI/NNCAyLtZjegRfiepE1v3YdGLQTCqoj4cGothwK/tcNvvDf9HvguvLo
 fMFvEW7IB0JWBdklMl+uA==
UI-OutboundReport: notjunk:1;M01:P0:2ild0AsdVjA=;SPNsFEKCgEG5bEzFRC2SyFK/iqb
 zUqacry6LTZZii6eNFoYx3CIm2XZBPOz8ylIA6QTyVxrojaUYZcFN1EeQ3/DGYky/JQpRcyht
 Ks20sk/48Ekk2UJ7LoYJBQn05EWaA+zozRDA4OfbYJuzrj01TdfY8l7/w4SrWNaeH+gR6PZIJ
 oU8yTN3Mf0vx3UKf66eMSUpTCB71bHECGRmRdDcHHr2mcFXkOYAsx9G7H29s+kG+wOJvaS8GO
 vLD26iA8ON6DeVXB49kOZvzewhn5NzC8YLq9QbBvotpFw5LnwG+iYrBy5l0R7uuLyX3s0AJIJ
 6OXGhVOAlrZMWxu77miq+v8kQefQW3zkQz3Qo6Q4n0Y4ZpbSnxOluEDFTPvcki5XZi3ggBrx3
 99Ux7S63uXueEiYDmGAr5fNRKfz9DXj0LC7ko60Ou+vSaMJcPogQc1fzrd8BsMPMPeUCmq3be
 y8vJloEYRstYVjg0QOtgb2Vyjn39cySsB4sTgEmf2gs9iZ9Edi/Gb8N5cC01TkEPHjSKlAGvK
 PXihzZT8f36X7eLN+XHMLEUlUBMfFpNskE4lw1B96XTO3vbMM/IJbivbvcdLuwFPRAlth8rFV
 qiLYDdEE9qXvvopxU+IL5sQNm+DjOVKig0U26bx/EqJdWc8MUzQpJBmZVDETLzhbNzEmttHxz
 wj+29fCvM2Vk3LNxSnDcVmJBTJxMhHsKk84yB4iuJiexag9f0o/18U0JaJiEdd54iLGTG0uHQ
 yDDT4MiRLn17SDh4En5tT0+M/LXaXf554nV2RkgvvJWDmj4FuW2vVpIvTx8S0JfYsHpVD1b/c
 AiD5GkT1bktKeAo8Up9PWI+akgBnvzIt5R8q6cOjC4W48=
Message-ID-Hash: INISSTAQLD5V6K3PU5BUFJVTWOZZEO6D
X-Message-ID-Hash: INISSTAQLD5V6K3PU5BUFJVTWOZZEO6D
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/INISSTAQLD5V6K3PU5BUFJVTWOZZEO6D/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The field is explicitly documented to be initialized by the driver
(which it actually is). Also, using patch_info.size would be actually
wrong for 16-bit data, as one field counts samples, while the other
counts bytes.

load_guspatch() already did it right.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
=2D--
 sound/synth/emux/soundfont.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/synth/emux/soundfont.c b/sound/synth/emux/soundfont.c
index e1e47518ac92..ad0231d7a39d 100644
=2D-- a/sound/synth/emux/soundfont.c
+++ b/sound/synth/emux/soundfont.c
@@ -735,7 +735,7 @@ load_data(struct snd_sf_list *sflist, const void __use=
r *data, long count)
 	sp->v =3D sample_info;
 	sp->v.sf_id =3D sf->id;
 	sp->v.dummy =3D 0;
-	sp->v.truesize =3D sp->v.size;
+	sp->v.truesize =3D 0;

 	/*
 	 * If there is wave data then load it.
=2D-
2.42.0.419.g70bf8a5751

