Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 508A0898495
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Apr 2024 12:03:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 027A82C51;
	Thu,  4 Apr 2024 12:03:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 027A82C51
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712225016;
	bh=FnOnXxs8cQNILDz6eCQFTAc8g65/4WFFfJ64clc+g3Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=X7Ebe2U8iAbnNDcc6ycsChjmhCY/eR+GMe3CsUgT1TYzlqlWxiVeG0Nb376poPMqB
	 xsvnjO89a1VLUQ2JQblqiyf538jj3OLuRUwDIbFmmgGwn/6lCNudLkap+q9pmNLE+a
	 6RQzuTdPKIb7WVcXjIz48w9821N6gVtwfNvdacmc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0ACB9F805BF; Thu,  4 Apr 2024 12:02:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 834A0F805BE;
	Thu,  4 Apr 2024 12:02:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 56513F8016E; Thu,  4 Apr 2024 12:01:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
	SPF_HELO_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4F00DF80236
	for <alsa-devel@alsa-project.org>; Thu,  4 Apr 2024 12:00:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4F00DF80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=oswald.buddenhagen@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=gHJI5jeY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1712224852; x=1712829652;
	i=oswald.buddenhagen@gmx.de;
	bh=WsiPGGqNN85sMCbUgri9GR8KKSrWW90a8p1Jz8kA+Oo=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
	 References;
	b=gHJI5jeYteWtunxAKCnhfeXz1BzvCVr9fhP/LIdBD2UGfOlvxrl6kBJXAoo8Msd9
	 225V0TqOFojsfGM+Uawcu2OTKh/SmuUNdZLthUmDbCWOfl4VSXBO1t+I39v7PeShc
	 iTg1wjtRDNdOSDR+G4N9w6c+cuDHIFFY6bG2OzFCuc4/pqycZmOefS2tTUTxGNCbb
	 OisJ2SjCWbvlTlRP8dfwETFfj1G23LP8hOT0PpCL/aOEbvWUEkkMK6Erjyr6Fe7Zm
	 dtf/aaRktqs4pKqMGZ1lf5t02MVOykzXe3bQ006iIa8f1zCYtW4PeHTYLefJkHR9f
	 kpb0OMxd/fOzWguZNA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from ugly.fritz.box ([89.247.162.126]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Ma24s-1sLtye3QsG-00VzAi; Thu, 04
 Apr 2024 12:00:51 +0200
Received: by ugly.fritz.box (masqmail 0.3.6-dev, from userid 1000)
	id 1rsJto-RFc-00; Thu, 04 Apr 2024 12:00:48 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Arthur Marsh <arthur.marsh@internode.on.net>
Subject: [PATCH v2 08/17] ALSA: emu10k1: move patch loader assertions into
 low-level functions
Date: Thu,  4 Apr 2024 12:00:39 +0200
Message-ID: <20240404100048.819674-9-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.42.0.419.g70bf8a5751
In-Reply-To: <20240404100048.819674-1-oswald.buddenhagen@gmx.de>
References: <20240404100048.819674-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:e6i01XEIphHuqT69UyOciKR1WlKC9JZEMwg9A9838Sybp/OuDaB
 Nih8BjeFwMWA0wCbL4TYzPKEI25M9WEn3kyKQ292WuBiM1ABiiwGXcmAk3JuKSaG/LaWiI4
 4Zg42EHNodpHeJuusB2mYbiYJg4iXHDqeyxjhh1KmMHeTxg8yHwN+NKHghHjPV6JW2D9z46
 DvVDkuCF0vGAITyZhLLQQ==
UI-OutboundReport: notjunk:1;M01:P0:bOPHSf1hwQw=;dC6Y3WbK9GwlH9PaSffvvfrKFv/
 eSpP3CKxt1wTAWswmf+5P9CJjPRw3QsFofYBgYaRP7LJ7JQGpkef9Jn/xouqECHo8N4NQRZhp
 9KV2YNkByCp9J8bfXFKn7/YRGUq79mL2bzpa0dDsLupmcKtJLU1iiCnlLkqGjvrPwHcjWhiwI
 OAb4Cgyj04ntp68xc58Hm2jKVuxlFD5kehwrTnMQFV9eYsrAABJZL+2c+/13OGU3HbWAQJ/zW
 8ilbjKI1cDwkJmA6BNiH8Zj4jz6X8x4k11Jo6N4MzMFDD057JJnDVvluq/6IcjRSeePZkfov8
 n9g3pM4EDwWGfi0LTSnXfSgwJzv17chvoxvLc0h1FLwpo6B0igcuRv68AKqbK9oOwaOf2Xth8
 +ECiaIxDHp8Ed0qCsDqnHWPKjFR0clVvO3aBomYu/MZVcUmHMQAJjxsj4yHQZ8nCNAeKjzWg+
 DDbkzwf1W70fvT5IXcdN5pmQVepxvpRIwhNSr75efBldIYZ/80w/gyTIh6RKySiKoHrMf/GPU
 1etb0mC7JmWPkBuVKcWefm0IEInDZ3Ye/lOHF79xQkAlX0yioFu8of9ufeYmpbWnx80T0j3p2
 OFprH8JuyFyXr5mctGajun4jFmoIPBqrrP/VHnB5zvCvCc9y7eWKpps4+PxqL24q7biRc0X7/
 Z5JwYR/mRxBxMKTptXaNUFJWG7fy3gVVisN37fN7zyKnVUlNjlHeIGmyNaIiUtPZecyCkxdGm
 n6v1QCy23DDsl/M0vYZOFkHyZ5RVp7KqIw7NgH7MwKGaxYC5exXJMdSnR8gmJ+RzRZ+xnxIuh
 7XNyyMUhe8snEqQaXZ6xlD+wjV7gLSrWWmJdaFs/GaLrQ=
Message-ID-Hash: NYC2ITBTIFTAULSQKKKCBAWRERBLF7PA
X-Message-ID-Hash: NYC2ITBTIFTAULSQKKKCBAWRERBLF7PA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NYC2ITBTIFTAULSQKKKCBAWRERBLF7PA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Convert some checks in snd_emu10k1_sample_new() back into assertions (as
they were prior to da3cec35dd (ALSA: Kill snd_assert() in sound/pci/*,
2008-08-08)), and move them into the low-level memory access functions
they protect.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>

=2D--

Side note: this eliminates the memory leaks in the now gone error paths.
I don't think it was actually possible to trigger these even before the
foregoing cleanups. But if it were, it would allow a user with access to
the audio device a scope-limited DoS attack on it. This would be only a
very minor security hole, given that on modern systems it would merely
enable the current seat owner to be a nuisance to their successor, by
making a reboot necessary.
=2D--
 sound/pci/emu10k1/emu10k1_patch.c | 4 ----
 sound/pci/emu10k1/memory.c        | 6 ++++++
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/sound/pci/emu10k1/emu10k1_patch.c b/sound/pci/emu10k1/emu10k1=
_patch.c
index 47d69a0e44bc..55bb60d31fe4 100644
=2D-- a/sound/pci/emu10k1/emu10k1_patch.c
+++ b/sound/pci/emu10k1/emu10k1_patch.c
@@ -65,17 +65,13 @@ snd_emu10k1_sample_new(struct snd_emux *rec, struct sn=
d_sf_sample *sp,
 	size =3D BLANK_HEAD_SIZE;
 	if (! (sp->v.mode_flags & SNDRV_SFNT_SAMPLE_8BITS))
 		size *=3D 2;
-	if (offset + size > blocksize)
-		return -EINVAL;
 	snd_emu10k1_synth_bzero(emu, sp->block, offset, size);
 	offset +=3D size;

 	/* copy provided samples */
 	size =3D sp->v.size;
 	if (! (sp->v.mode_flags & SNDRV_SFNT_SAMPLE_8BITS))
 		size *=3D 2;
-	if (offset + size > blocksize)
-		return -EINVAL;
 	if (snd_emu10k1_synth_copy_from_user(emu, sp->block, offset, data, size)=
) {
 		snd_emu10k1_synth_free(emu, sp->block);
 		sp->block =3D NULL;
diff --git a/sound/pci/emu10k1/memory.c b/sound/pci/emu10k1/memory.c
index 20b07117574b..fc9444404151 100644
=2D-- a/sound/pci/emu10k1/memory.c
+++ b/sound/pci/emu10k1/memory.c
@@ -574,6 +574,9 @@ int snd_emu10k1_synth_bzero(struct snd_emu10k1 *emu, s=
truct snd_util_memblk *blk
 	void *ptr;
 	struct snd_emu10k1_memblk *p =3D (struct snd_emu10k1_memblk *)blk;

+	if (snd_BUG_ON(offset + size > p->mem.size))
+		return -EFAULT;
+
 	offset +=3D blk->offset & (PAGE_SIZE - 1);
 	end_offset =3D offset + size;
 	page =3D get_aligned_page(offset);
@@ -604,6 +607,9 @@ int snd_emu10k1_synth_copy_from_user(struct snd_emu10k=
1 *emu, struct snd_util_me
 	void *ptr;
 	struct snd_emu10k1_memblk *p =3D (struct snd_emu10k1_memblk *)blk;

+	if (snd_BUG_ON(offset + size > p->mem.size))
+		return -EFAULT;
+
 	offset +=3D blk->offset & (PAGE_SIZE - 1);
 	end_offset =3D offset + size;
 	page =3D get_aligned_page(offset);
=2D-
2.42.0.419.g70bf8a5751

