Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7548489A987
	for <lists+alsa-devel@lfdr.de>; Sat,  6 Apr 2024 09:17:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 103852CF6;
	Sat,  6 Apr 2024 09:16:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 103852CF6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712387829;
	bh=ZNxz9XRfUws3hzgYnAmMbJsNLrK48W67Ch08nhuDE14=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nnHDaPGgMnl6pR33N7Hyq5N+c/jKA46TG5JFkJgt9kJrRy8tpAYiJGNa8ZOK/SKd+
	 AIaYJbWCQWKvCDo24THK8On+QLrw2NqMQW/1eIeaUkxuNIOWhw8Ax+xZ44B+/N7R6K
	 iwm66aQ1BuDeyNMlE2CCzNA5wQ+qul/Msmfef6TI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D5F2DF80632; Sat,  6 Apr 2024 09:15:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6C45AF80621;
	Sat,  6 Apr 2024 09:15:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BDC23F80570; Sat,  6 Apr 2024 09:01:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_MSPIKE_H2,
	RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DBF37F8055C
	for <alsa-devel@alsa-project.org>; Sat,  6 Apr 2024 09:00:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DBF37F8055C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=oswald.buddenhagen@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=oKskrQ4y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1712386851; x=1712991651;
	i=oswald.buddenhagen@gmx.de;
	bh=xn63gzqr9xb3rSSv9m6pshIRgF/4ohQI6zGY6rUcaZo=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
	 References;
	b=oKskrQ4y6TTCXQX4Szz3VPB+q0q6B6hn6ad2X4Lr/HdMvi6dHsQQdWX5rQSdaUsa
	 EBQOQQqmLqq7fwHy2hzd9bnogIpajONqM4EkF0akylRl36VieefYJjQxqzQbbdloU
	 Gaa6oeCEMXGUnVNbA3P0yfcxXXEO9eklwUr5X0M2shAWE33bixIHGN/lQhq3FXcLE
	 nVVeYMoBYmf4A9+RboLaDYCmyhQ9uLPj8ceiL0B0wdhqa6znGBeam3aqigKuLCYlQ
	 Dlnkz4zajhHMFD4qd30CDNBYj8zRJBhnU63uqxxjhZhEfAx5j1TPasSXtajpqMeu7
	 +KiDPefLbmGFFPnsJQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from ugly.fritz.box ([89.247.162.118]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MqJqD-1sXELA2Voh-00nUO6; Sat, 06
 Apr 2024 09:00:51 +0200
Received: by ugly.fritz.box (masqmail 0.3.6-dev, from userid 1000)
	id 1rszqo-JrP-00; Sat, 06 Apr 2024 08:48:30 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Arthur Marsh <arthur.marsh@internode.on.net>
Subject: [PATCH v3 12/17] ALSA: emu10k1: fix wavetable offset recalculation
Date: Sat,  6 Apr 2024 08:48:25 +0200
Message-ID: <20240406064830.1029573-13-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.44.0.701.g2cf7baacf3.dirty
In-Reply-To: <20240406064830.1029573-1-oswald.buddenhagen@gmx.de>
References: <20240406064830.1029573-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:nx0bvHlTGeloEcsuMiRFqWaVqwANfyyLmZrond+BPLQGiPM3ec1
 yzz2crerYycGnFHUiVStY4sq0HLwkUbxWZX1Lr0/+TgY56CwrUkMSN+/p4VyOrts3/EO8g2
 oyyo/xrILGCTBeBhPKh87/3IiGbhXAJ/IgADiQu5+kg79vmv1RyT1Qi5hdob3xRhikiWLpP
 IN+mTYC+P9me8KXWylHZg==
UI-OutboundReport: notjunk:1;M01:P0:9tkejHezi1Y=;LSa+tYg1c/YNvmmEzZLhGqAc3Bw
 PJEliYfh8mAWbKSrWexLxMfnTgvrSRVnQtVLsWeBJqi4G45sckieeUiRdxl5gSPvGd5fP5elI
 8vjutBOA5owZ9RERnHRY8MtK5DWAbDPBkbojQ7gLg/D6meR7t5HaVqrl/hJRR3gg5mQt1r07h
 ypycou61TzmtvMwXggygh8Vof8UIn08jCt5WGNGPT9J3T6o3en6ZXKejPxIfm40wxjmjtLp5l
 NvWHQ0Pe5pDZsb0gSdO0SQVlNBjo7Qun2pTrS6hnx2p9JJboVya+ndX2QBclVcNw94pEknlHx
 LEC1w+cU2MeKav0lyra0II7x14C5pcDf+bXtdJF2OhF8mYBdyvgAEYbhaOVg1OyGLvxONUKNv
 wMooiZdTikLXOvQ4tYB4mQ/SCV3CzvgcNEzVIOvitR0kxN1nI6+KZBOxyOp7MGxbE2zS+MYE6
 BqDjWTdCGr3tDGz0vVG0C+A1LhfqR1hwBDgeyRsMgAE2m+l9A7l4eIoS1cq1oVPnEFwLKM5pH
 8xc3uUqcbVfq4fuv5GWWGhKzQGa+N9wJykviMjGCp52zjlZOt3+cWlBqopb11vx940iN0ygab
 iEcvbXw1kYjt4ggCGFerw78ef1wKXoqAHoTR16IvzLW+V9Dry63VlwG3n5s2afF7liiW+jzER
 akgOOUmef/BD+OoO1vF7nStRqv62ntgkVa3iL7YfAWnSwgIsy5Gt6LCfebntRmEFaZww9RF+c
 Q/WSvcjdoEkyvGCPcdeahL8P5kfuO5KXiG7NuoAEi3w1zL99cVs9Nr03aNFHfuRNOw2i7RRuZ
 mIOIW+cpSvyX51B75Ih4JB0a1LXECPRUaOh6LAaapReQA=
Message-ID-Hash: AAMCKWTZRS3X247GDWJ32GAMTFACOTAP
X-Message-ID-Hash: AAMCKWTZRS3X247GDWJ32GAMTFACOTAP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AAMCKWTZRS3X247GDWJ32GAMTFACOTAP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The offsets are counted in samples, not in bytes.

While the code block is being rewritten, also move it up a bit, to avoid
churn in a subsequent patch.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 sound/pci/emu10k1/emu10k1_patch.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/sound/pci/emu10k1/emu10k1_patch.c b/sound/pci/emu10k1/emu10k1_=
patch.c
index 281881f7d0a4..ad16de99b800 100644
--- a/sound/pci/emu10k1/emu10k1_patch.c
+++ b/sound/pci/emu10k1/emu10k1_patch.c
@@ -30,7 +30,6 @@ snd_emu10k1_sample_new(struct snd_emux *rec, struct snd_s=
f_sample *sp,
 	u32 xor;
 	int offset;
 	int truesize, size, blocksize;
-	unsigned int start_addr;
 	struct snd_emu10k1 *emu;
=20
 	emu =3D rec->hw;
@@ -62,6 +61,12 @@ snd_emu10k1_sample_new(struct snd_emux *rec, struct snd_=
sf_sample *sp,
 		}
 	}
=20
+	/* recalculate offset */
+	sp->v.start +=3D BLANK_HEAD_SIZE;
+	sp->v.end +=3D BLANK_HEAD_SIZE;
+	sp->v.loopstart +=3D BLANK_HEAD_SIZE;
+	sp->v.loopend +=3D BLANK_HEAD_SIZE;
+
 	/* try to allocate a memory block */
 	blocksize =3D truesize;
 	if (! (sp->v.mode_flags & SNDRV_SFNT_SAMPLE_8BITS))
@@ -99,15 +104,6 @@ snd_emu10k1_sample_new(struct snd_emux *rec, struct snd=
_sf_sample *sp,
 	if (offset < blocksize)
 		snd_emu10k1_synth_memset(emu, sp->block, offset, blocksize - offset, fil=
l);
=20
-	/* recalculate offset */
-	start_addr =3D BLANK_HEAD_SIZE * 2;
-	if (! (sp->v.mode_flags & SNDRV_SFNT_SAMPLE_8BITS))
-		start_addr >>=3D 1;
-	sp->v.start +=3D start_addr;
-	sp->v.end +=3D start_addr;
-	sp->v.loopstart +=3D start_addr;
-	sp->v.loopend +=3D start_addr;
-
 	return 0;
 }
=20
--=20
2.44.0.701.g2cf7baacf3.dirty

