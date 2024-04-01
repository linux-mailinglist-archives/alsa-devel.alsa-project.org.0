Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 18878893A05
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Apr 2024 12:11:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9318A22A5;
	Mon,  1 Apr 2024 12:10:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9318A22A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711966261;
	bh=jPDkcBk/SJQNsvgeAqqI70H4V8gh3/HjBiCRa6Z+XSY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=InyRp1QjcjerZ2spXsLP1NIinh5+P9okBLYiCYQaepwEv77ofo+MuVjknF2JtVh27
	 tni/DU1kbYkncnweAWxjYx1aTJ6HpccVIS/EctudtjwndEPigOKCApaTRsB968bICw
	 ixGpFy5GwUFBnEp5m0cpXOYxmVwwpB1DRHkEnL84=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 80442F806AF; Mon,  1 Apr 2024 12:09:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E0BD5F80606;
	Mon,  1 Apr 2024 12:09:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A27DFF805C4; Mon,  1 Apr 2024 12:09:07 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id A9679F80236
	for <alsa-devel@alsa-project.org>; Mon,  1 Apr 2024 12:07:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9679F80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=oswald.buddenhagen@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=GvWnxL0t
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1711966066; x=1712570866;
	i=oswald.buddenhagen@gmx.de;
	bh=aHgNEoh2oL/YTOIIO+HEgQH655EOrifvL+ft5bV2Fk4=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
	 References;
	b=GvWnxL0t78eMq01f+ImIEGINJoMhDMOYDR7GmqUqKrfM3uvHvGvl8HHEGgp6Bz8y
	 FLhy2gjGcfPFQyTOXNGe157CLXWZ4IcNxA5PfH/z7b29QMDdKVYsDY0Ca01fJWXp5
	 q0S6++nYnH2hTxC26WGMgtr4eTk/x17VnUG0TsFUeYyCDJaOr8rusp9Vvok3jsvYM
	 fclbhQ/tt6HAztJdqXdQWYORuEJD8+qSEaYm+O1e5YfWOkBafPRO4ZVq3R5T+Tuco
	 tAP8vbUiqyM7EoHKAKjpPciyRctunItF72qJwkAbgsR8p6E+Y90aBrVWHENtvqsqB
	 L+P+U6hxbp2u1XFOXg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from ugly.fritz.box ([89.247.162.100]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MS3il-1sFGWz3Sjj-00TW2Z; Mon, 01
 Apr 2024 12:07:45 +0200
Received: by ugly.fritz.box (masqmail 0.3.6-dev, from userid 1000)
	id 1rrEZq-7dp-00; Mon, 01 Apr 2024 12:07:42 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Arthur Marsh <arthur.marsh@internode.on.net>
Subject: [PATCH 01/18] ALSA: emux: fix /proc teardown at module unload
Date: Mon,  1 Apr 2024 12:07:25 +0200
Message-ID: <20240401100742.506001-2-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.42.0.419.g70bf8a5751
In-Reply-To: <20240401100742.506001-1-oswald.buddenhagen@gmx.de>
References: <20240401100742.506001-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:bmifMtec5zWF9mNop6bbm5ohEPcIELPsG+fIH+SkJwxrDqs2cVl
 ynnyp0Bx5/dqJvYF5IzXhPD7mZtVhKORp/oH9Qt21cXDkN9MdSjyVCvP061a5d/xTdgopdP
 RHXVaMRoEbtx4fxwg6lCA+XHaY8QSRoN2VeCGp/QGHxIS1dSdThkq4ROAM9UeOKcknFJDR3
 HvR5DBQi3ePzPsYVTa+yw==
UI-OutboundReport: notjunk:1;M01:P0:FoCQEuOXREU=;fVS5wscW0aBg1q9XZijdv71ZugM
 XfldPBHosBx5BLiDmwJB5wjGs3UfpoBnvI/cYUNZnzYmvcUXzPHItuJdVch6tSZBzM4HoDyJc
 ZDwih8Vw65l20vCXVuA7GviYcuLahC+4y26E0Ef0XnUIRSoi59Oveefp1mQvhb3Lmiv7gvEae
 K7qqZt45Qzc1AZ+Hz44aJTwwulrAjtDvdCwPeBXrkWvonO6eOLIF8hMNOdWqBT32g71dG9O5h
 oqKoEqNtAZvC2wfuizq0ZHxT8FNbWbjq2O/tjPBd3Fp9X3CXGRTN1+MMSGvMniK+jBhAXjst2
 ODGGg/7YSjuDI49Ey8sN4a9f6Gxus9l7pMyQWmSm2BWHg+kES03HP5TXhfX/83fObA0gG/4kw
 eBYIX3/HcuPxGiyllUQliynKdzGu+/boLg1gLYBAKDktn/ZI+s5ECIpuhH9Sd34fS8lMvErBM
 WNcvYm7aD36+jVSewOEqmCGMXCalxig03IoAZr/Drx9SN5lq9vWkXnBFDsy1jgxgG5XaAopkD
 GmfQY4hr8kL4bVShEJz53p4ZvFQoHmPbuARUPR4mwgsWY+h2ZtKCLn5csTLozymgzJ95LMg20
 SMD4nOXeUtl9UsoITbH11dwTpaP0i/Aq6dZzJt6KYXwJM4J7sHHzK173Y9UBC24mr8Io8yq2H
 7JQz3MSUrNrlwKgW+KZ+DFkO1RterOzrGewENUsu2p9syVH9jl6FmQws/5LVhDZmw0v3hiFS3
 ApQsEzwF7cPxe4pUFHj9voIG0/TNI8nS3HBHJ9I6EISC+ijzGdmFnIjrzBCD6xE2iWdtrjYsI
 p6eh745FF6q6ELDvpueN8dBxTfssX4xTfJZa1orDU+j4I=
Message-ID-Hash: 4SX2JFMMU5PHSTQYT6BTQDP3RXKBFLIC
X-Message-ID-Hash: 4SX2JFMMU5PHSTQYT6BTQDP3RXKBFLIC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4SX2JFMMU5PHSTQYT6BTQDP3RXKBFLIC/>
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
=2D--
 sound/synth/emux/emux_proc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/synth/emux/emux_proc.c b/sound/synth/emux/emux_proc.c
index 7993e6a01e54..820351f52551 100644
=2D-- a/sound/synth/emux/emux_proc.c
+++ b/sound/synth/emux/emux_proc.c
@@ -102,6 +102,7 @@ void snd_emux_proc_init(struct snd_emux *emu, struct s=
nd_card *card, int device)
 	entry->content =3D SNDRV_INFO_CONTENT_TEXT;
 	entry->private_data =3D emu;
 	entry->c.text.read =3D snd_emux_proc_info_read;
+	emu->proc =3D entry;
 }

 void snd_emux_proc_free(struct snd_emux *emu)
=2D-
2.42.0.419.g70bf8a5751

