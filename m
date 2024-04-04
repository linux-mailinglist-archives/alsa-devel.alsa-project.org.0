Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B67DB8984AE
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Apr 2024 12:07:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D06A2CBE;
	Thu,  4 Apr 2024 12:06:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D06A2CBE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712225224;
	bh=dJcSfwcjGZwXSI1L1lIntiuYVFyMF8fd9RGOCI5IqaA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=O6N4AfRBil3bbPXolw9iKjC7QK0WWECERX5S2cbQ2/WMMvK3sEYvRsVPoacjh2n8n
	 nlmC6jtAPUGzR8nXljzeFrjb4RaNpyGOEgoz4sQLz2BcqoWVlmnDRglJvTTHLePzFO
	 h2emfajzNU5Njm0eY8vii7bp9kQNGNlfWkRkzr2Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B57F6F807B6; Thu,  4 Apr 2024 12:03:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2EF13F80798;
	Thu,  4 Apr 2024 12:03:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A875BF80796; Thu,  4 Apr 2024 12:03:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B3D21F8057B
	for <alsa-devel@alsa-project.org>; Thu,  4 Apr 2024 12:03:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B3D21F8057B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=oswald.buddenhagen@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=heFkiQz4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1712224977; x=1712829777;
	i=oswald.buddenhagen@gmx.de;
	bh=Rifiz2tzvBk5vL5iFP4v7h+O9i+ihFbVM/EJLCqOuNM=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
	 References;
	b=heFkiQz4L6RjbpHR0KkfP+kxrBv5h/L9kj3TXjDYSjG4XnicJpvJLAiPucgfHEf+
	 zftTBAwvu8ot+39248XbDg8chvTFS/o0A/X+lzoj5T+f6qO15wib43f+cA/1FUs0E
	 zPC994onLp6FzeE1JmsJnAMRaie8dt281+K5b5JR6svDLFthXBTrRwkM1aWEov6oS
	 i6osCv1CMfHuOGVlrKEWr8d8IoDKjktXDKkxjXudUP+LbDTxUVfPJx7pM7+hKzVRI
	 vDmjN1nhTkaPnUpaiflci1cyjpyyukSQ4SiA9h4T0bV2wwlqAwtdQhkTOk4489vSZ
	 Sgn88150/7XPjCRiVw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from ugly.fritz.box ([89.247.162.126]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MbzuB-1sO4ic1izX-00dVsV; Thu, 04
 Apr 2024 12:02:57 +0200
Received: by ugly.fritz.box (masqmail 0.3.6-dev, from userid 1000)
	id 1rsJto-RFw-00; Thu, 04 Apr 2024 12:00:48 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Arthur Marsh <arthur.marsh@internode.on.net>
Subject: [PATCH v2 12/17] ALSA: emu10k1: fix wavetable offset recalculation
Date: Thu,  4 Apr 2024 12:00:43 +0200
Message-ID: <20240404100048.819674-13-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.42.0.419.g70bf8a5751
In-Reply-To: <20240404100048.819674-1-oswald.buddenhagen@gmx.de>
References: <20240404100048.819674-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:pOUdD7xcVm9jB9KUAkRGqrnAezulu590VAqRw1SLVJgX4PRhM22
 KdJwtjViqE8/EdwzUjpEU42Y7sH7VuBPTWwkt0GdkhDhnLC828c8RyzxYg6IIIOj25dnK9D
 6PxKqJ+GWs9sEUjEH1XxhdjWi1X/fB62J3IYWpj53iop8PvWdalhjAg4+Rwv0nNS0vm4gmI
 i3tRYAehBn+jSJjT5hY2w==
UI-OutboundReport: notjunk:1;M01:P0:EfW1tp/gnWU=;eV4XQJCPXoUdJB03vcJHM8wtMTE
 48frAg420LmYiSDGK8tzN9cs4iXuJz/fY0OEc9Bjk3LoeJvW/NyaxhnArnmdELMMaS3Hrmm0Z
 6gwn0t5dzHSZVnUUO4o42G4Qie3JzMIxGdIUZNPYwVycMZUbHraDP/gehy5IZSJemyePyu771
 ij/sGQBKulBgAhMPh4fycz6hOiE1OAf+v3yiQoBDKKKmLnwf/BJtgDZZSfdGMWtsTnmX6B0Hk
 VZ0gqdxAnXbOWHwmqIQuTmG3ujwDV56sIXuAhslTPnAUKj4rXBAom5MbpzviWmC/IVzyNj5ma
 SNWbSR7Fx7Mtmgt3d2gasjBXvYfkXYQ+WyNDMwGI4Jol5mstk0dMa/d1XtRhMeCsRd/7N5y4Z
 qbG4R4EDuwWWCif5oKrA0fYsQpstuN6NxQ3WgwO2k2LK0kV22lY+l7fMEXcFzAYpiMUE6r0es
 85e5h7IKC1WNJEJHmSxJqbIIHYuJFA/DhDMA246PP0Iohi5yDLAnHEEo8X8Q+c61fbfOTR8yo
 M3kD+4q2jXaXHKG5ts5OilXySkbXW7wkkL7OCyJ6aZL4ajJPnHORccTJzFlZ1l6jgc1pHl5R4
 COeIYP/9cUywILTtPsaSdGtU+ZECn4jhTi6r6ufrZS8g9Ahinu6RZ8tuiI1JwhZq6o0LqaZd0
 qEmwKV4riuU+/s8/d6gRwxAp2z53NRrxkWqAYnBvacJQJzbofs7ro1Ke0IDwoG/5Rl75O5jY8
 Mcs1lSPptjEwFWwA6SjYaVurtVWdy2juUjurLguTU8ukQySMBBSqlGnIMSdF0ZSfghm/zQ1+4
 G5svPprTmwDEitmM/bv44SLk69r6utm/m5uAMGZdGrz08=
Message-ID-Hash: S474I7ZDQTNAMQZ4HZUL6KD6Y55VEP7S
X-Message-ID-Hash: S474I7ZDQTNAMQZ4HZUL6KD6Y55VEP7S
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/S474I7ZDQTNAMQZ4HZUL6KD6Y55VEP7S/>
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
=2D--
 sound/pci/emu10k1/emu10k1_patch.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/sound/pci/emu10k1/emu10k1_patch.c b/sound/pci/emu10k1/emu10k1=
_patch.c
index 281881f7d0a4..ad16de99b800 100644
=2D-- a/sound/pci/emu10k1/emu10k1_patch.c
+++ b/sound/pci/emu10k1/emu10k1_patch.c
@@ -30,7 +30,6 @@ snd_emu10k1_sample_new(struct snd_emux *rec, struct snd_=
sf_sample *sp,
 	u32 xor;
 	int offset;
 	int truesize, size, blocksize;
-	unsigned int start_addr;
 	struct snd_emu10k1 *emu;

 	emu =3D rec->hw;
@@ -62,6 +61,12 @@ snd_emu10k1_sample_new(struct snd_emux *rec, struct snd=
_sf_sample *sp,
 		}
 	}

+	/* recalculate offset */
+	sp->v.start +=3D BLANK_HEAD_SIZE;
+	sp->v.end +=3D BLANK_HEAD_SIZE;
+	sp->v.loopstart +=3D BLANK_HEAD_SIZE;
+	sp->v.loopend +=3D BLANK_HEAD_SIZE;
+
 	/* try to allocate a memory block */
 	blocksize =3D truesize;
 	if (! (sp->v.mode_flags & SNDRV_SFNT_SAMPLE_8BITS))
@@ -99,15 +104,6 @@ snd_emu10k1_sample_new(struct snd_emux *rec, struct sn=
d_sf_sample *sp,
 	if (offset < blocksize)
 		snd_emu10k1_synth_memset(emu, sp->block, offset, blocksize - offset, fi=
ll);

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

=2D-
2.42.0.419.g70bf8a5751

