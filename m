Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F04B89A96F
	for <lists+alsa-devel@lfdr.de>; Sat,  6 Apr 2024 08:53:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E86612D02;
	Sat,  6 Apr 2024 08:53:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E86612D02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712386431;
	bh=b9NU+IoPft5NMYDWxh1oqo91o5gSbghKURjiIckXI1Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fG8NYKJD2G0kvM97BlsaztyBQHsrMf1PyzfYouj5lUYKpz+SkL4rv+KYJuDQnScMm
	 7NqxInzDt3tW7OVKRj0tCy6kuMm+B1phY9KX7jTfwZBBXwKrQP9Owh6JMwc+xjSehz
	 F9/UbWf1iOSg7BScG+UQib2sWFtoxEoDrtNSeOlw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BB97EF805C6; Sat,  6 Apr 2024 08:53:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 449E9F805C8;
	Sat,  6 Apr 2024 08:53:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 33395F80579; Sat,  6 Apr 2024 08:48:59 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 1F933F8015B
	for <alsa-devel@alsa-project.org>; Sat,  6 Apr 2024 08:48:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F933F8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=oswald.buddenhagen@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=Cf9kQyhi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1712386113; x=1712990913;
	i=oswald.buddenhagen@gmx.de;
	bh=X24AK1KIcPQKPmxtllvKqjXta1IbOjB0Eg3I0W6YMic=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
	 References;
	b=Cf9kQyhiYICLXVBDZ03zoVQEmX/CcL5W1Vkirv9HOXq+FVkfEGF5+fwggDZlhHat
	 x4fFu66a209RSZ+okhcNnD/TQ+fmvi1UqAkjgzlmwBdI/KeigKzwTJdrcXKBawuD7
	 hrUm0gjwIGrQbYTFZ65ppqn3lHb6Lin2bT8i7yGT5PTOAtax6AuBCBUpBCS2Ivoba
	 lrDijGntgGMz6aS01bLqtxginfQW3W6uRvuH//K4V/RiQCZdgtD3oVHOM0O9PsPI+
	 ue7fqc4yX3ZEe0RuQK+PiDJtVA30XehGTuVLeZariKNVC95WhgwK8yAW5RcZ2f5r9
	 fjAOuzv2yBQx1cyjfw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from ugly.fritz.box ([89.247.162.118]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N6KUd-1sqQ7D38av-016h7R; Sat, 06
 Apr 2024 08:48:33 +0200
Received: by ugly.fritz.box (masqmail 0.3.6-dev, from userid 1000)
	id 1rszqo-JqW-00; Sat, 06 Apr 2024 08:48:30 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Arthur Marsh <arthur.marsh@internode.on.net>
Subject: [PATCH v3 01/17] ALSA: emux: fix /proc teardown at module unload
Date: Sat,  6 Apr 2024 08:48:14 +0200
Message-ID: <20240406064830.1029573-2-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.44.0.701.g2cf7baacf3.dirty
In-Reply-To: <20240406064830.1029573-1-oswald.buddenhagen@gmx.de>
References: <20240406064830.1029573-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:77DVNGq1Kj+ik+SAHMGC58pXPZKQR435JSbnv7VsgAcpkVmvZSE
 kv6JSmddjoo2PFEOYWlpCngor/gQJmOZeE8dcRLIbsBOACJa4OcOk2li1hdavGejyV+/lOp
 3drYI3aejMGH83Xdf1jk7YDu+iyNZoZywNJBtiW48PFcmKxyX8/zKAugBO8xdlLMDetaTkE
 NiRwnONbXXhMR3KA967Qg==
UI-OutboundReport: notjunk:1;M01:P0:F7iMyTDUX1w=;HYH+GvIPzL+enXdgIqgPS+Yfg90
 WOHvruMh5QapRc7fBHuXs41ZTNBXzy+rf4Aq1lqJ6bBZRhIUVIHt6a6uHE2/OR2B1lIE9bFu+
 kS5UYYj+V/ScrTZRtfBg4ZZ1hVyeE13WcnYN+wHgSl9OF6aczd+b6JNWaC294iscnq46ApT7N
 94ryF68KrukP9CGCHQMYplj6SU/aMBIPNCcZvCxCCuG31zXMQaeR5UBXvtH6z9If0NjET0BFA
 RmrJpv22a4fOEg7QtlF2qYXqfwQ+UD+XQve+GM3ROhx7Rar3IFG9ALZ3UnkhPlF+PJsgBubyd
 fhapXw3oC0Ku/QOyYP+NAzoBozlCq5y2916si1jCEgdq5Y3TMXJZitRWuf8SSycVH472ePDp3
 T4oF2s2CDSB/OborJ1po6vDpJdCHvcFadEWbU/tdfpHtGYjRi5WGvdKWEQb1BFnZz9fjgvmOp
 2mCgiuBzzgDKCk9a1bg5aZxQSNoFIOa76nB8sBT7uegg44f2qWGepT6nnQWDdoDNsASTLh4vw
 g1RAzw26R3s/SyBLwdqCQ1rbzNXAx8Q9adC6zQ3hssg1poEYDWq6LJ0Rj+zVAlTn66k2aDQ+L
 ATRDtdzyzizBZm7E1YHhImoACxNZfz0JeN/ZpxPiZKntUQeVwJFS3CALMj/BkAMh3s7hZQPC+
 Nah764S/0YyPJbXmPwyOGVuxSiw1ZT/Sb7+YQYGWjao4O9RMf6zc/YbeYv4bejP5lp6AAWa68
 uGPhICc47o/GOZV5pu78FHO+iDK6nbpPCxYYKoc8YkqyO3nyZx0VAYoFLSxx6IUtg6DNcdnjp
 ZAcehBLS5QvMYKzN9Jd+AXdXJ6zDMfdJN1uc7ny7leIwM=
Message-ID-Hash: YK4MXV6SF4UR2DPCBDIY2ZBCH5QB4SGB
X-Message-ID-Hash: YK4MXV6SF4UR2DPCBDIY2ZBCH5QB4SGB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YK4MXV6SF4UR2DPCBDIY2ZBCH5QB4SGB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

We forgot to remember the wavetable /proc entry, so we'd fail to free it
at module unload.

This matters only when only the synth module is unloaded, as unloading
the card driver would tear down the sub-entry anyway.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 sound/synth/emux/emux_proc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/synth/emux/emux_proc.c b/sound/synth/emux/emux_proc.c
index 7993e6a01e54..820351f52551 100644
--- a/sound/synth/emux/emux_proc.c
+++ b/sound/synth/emux/emux_proc.c
@@ -102,6 +102,7 @@ void snd_emux_proc_init(struct snd_emux *emu, struct sn=
d_card *card, int device)
 	entry->content =3D SNDRV_INFO_CONTENT_TEXT;
 	entry->private_data =3D emu;
 	entry->c.text.read =3D snd_emux_proc_info_read;
+	emu->proc =3D entry;
 }
=20
 void snd_emux_proc_free(struct snd_emux *emu)
--=20
2.44.0.701.g2cf7baacf3.dirty

