Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF79893AE2
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Apr 2024 14:23:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 618952356;
	Mon,  1 Apr 2024 14:23:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 618952356
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711974197;
	bh=Q9tT60ciMRcMcS2X9ot+Kwz1z5LZ6bIsTpqlYG/inlk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Sm5LUvESIZORiqJ63vhXLHsiVJa/8MccPo6/CGhd2CVOq638F6DMVpAkvqSljwqgl
	 Yhc8yoEFVvxmHJBo4sUZa++HZSIEU6IQn64P4+XnWqykluPCojWTva7/YBkmjAC+Mf
	 QFMjAxt5lGvV+Or763zweoY+IK+r1iEvJXxUn0SU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9B00DF8063A; Mon,  1 Apr 2024 14:21:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1E399F80634;
	Mon,  1 Apr 2024 14:21:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7AD18F805C5; Mon,  1 Apr 2024 14:21:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6C3F4F80570
	for <alsa-devel@alsa-project.org>; Mon,  1 Apr 2024 14:21:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6C3F4F80570
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=oswald.buddenhagen@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=ORnW5ePy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1711974089; x=1712578889;
	i=oswald.buddenhagen@gmx.de;
	bh=NSV6IaeMXQT3x2MlXFGRPWdrqgOejDE8n6OulzTKamc=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
	 References;
	b=ORnW5ePya4o2t9xCkRU6roeF9f+A01RF/5GQWwbsX4S+9OCIOlP82uiET0pq9veG
	 8ZP8SVbb8RH5JV6M7l3+zMAzyXNod1jYdmzJjlddA7q5yVlKpphXHuG4uoptFRlve
	 1qTQ4UbnWL3mcHzOwEyvYDIddfIs3mRul4eQpaXZukw8U0e8TwVQzA8A9N7rAkw0e
	 jXspsqP2wyzJZlhdafu7QcVOA4JoaXHhEShhByZ+dUOTYu24IGjuFfgogh4U0JyBt
	 0gBzS4E/dHFxIP2GDyqn5gdwESlKCKz0C8uTP7ZUjLGpX99ZIsIeXpSM04cYmEZzB
	 WAepGaCHlGVPyfM58w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from ugly.fritz.box ([89.247.162.100]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MAONd-1rxZ8F3rA3-00Bva2; Mon, 01
 Apr 2024 14:21:28 +0200
Received: by ugly.fritz.box (masqmail 0.3.6-dev, from userid 1000)
	id 1rrEZq-7eY-00; Mon, 01 Apr 2024 12:07:42 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Arthur Marsh <arthur.marsh@internode.on.net>
Subject: [PATCH 10/18] ALSA: emu10k1: fix playback of 8-bit wavetable samples
Date: Mon,  1 Apr 2024 12:07:34 +0200
Message-ID: <20240401100742.506001-11-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.42.0.419.g70bf8a5751
In-Reply-To: <20240401100742.506001-1-oswald.buddenhagen@gmx.de>
References: <20240401100742.506001-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ub7K3W7n2ezRSpwOkWJMgdNmR7grRDQduLQblH6gVExcjY7Xek4
 b44GHgw6cmyplZWHo6Tlrv0YLewj5IrSfruS04EcaExohlmmbMPJ+fCERLGKSJ2FFUtnUxd
 QHr9q1kIZ8DGWpfaNpYvswtFzXb+ih7vsXgXFRiNTUz3ueeTpZOiuxoKJrlxg0iebZrT/4t
 Nviil2xLGWaZZTK/7aJdA==
UI-OutboundReport: notjunk:1;M01:P0:IpZij+8Rh4o=;rgMRXZbf2mBGS83SxpgKpQDok1q
 OpCv8Bg2MM6+8yOosCsom6BDHsLd56fnAiwDYBhX1qXvCOIzOQwwzcWkffNFPx38JHZGJQQXa
 R3Ay7Y6OAy/dAAne2uPS179VtDn1FboRVY9gKRttUmAnpOpbzcSbuFVIjQ+wDLRt0H3kkpen+
 F1/KzSMn5bAIPS7H4xyaST8Jhv9w9LMhQnVuTW1QjI9yvVAXe8dRh36Ut4r2XFe4Qi42CVR4g
 14BPFcOXQx53r5Se3lpoGS6X8cbwHrAW2qTkh9xDKrSS2g99gbL0bt4rHhbTupB7zbazYMb5E
 MMYtEQPkxXgG1MgcC4ZZRzIjYwTzDZRP4Xf6gfeBUP4N4IYny4EVm29xyxXwkSqlR8rPi1A9h
 LWXBRus3m413MeRGwkJFKrJt61AL7o50vzbHnZjHJrAIiizDHnydjOyZQLUhyi0jEyRtOze3Z
 oEBbsFGcO5tJrNzQHQ/KNRMXhdC+uwOe1HIauf0Q03DS8nDbJmRyont6tD+6ivCgxSo4PQfN7
 UKbynYhNYh6YLnjrTsNbXu/hIa86SnO/lhtREJhPjd02Gbzxjsdy53+1Dsyor6Uq0BYq509rq
 kayzOaxYwjhI36d8PyTKdON8seunsGfopviji13BP556y/hvU9IscHrzthEiSqRCRHZdSeEwa
 7skGbTpyxm8h+BtxybHsd4RkAMXZJA+CH6kKFTXQLJhxPklkZnqsYov0VJtd7YL7jDxWahiyR
 55jM8TLuLfczllgziMqlTSw2Jpg4dpBdAQyA3qhkToYej+IEZNNaqsY08YXTo6/WR6nysJxml
 4TF5HecYdouFZOasT2WyWkdsmrpglPIGR1UOjPdKgmcUA=
Message-ID-Hash: SB2TV6C45F74AIT3XWITSO3FBI2BOK72
X-Message-ID-Hash: SB2TV6C45F74AIT3XWITSO3FBI2BOK72
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SB2TV6C45F74AIT3XWITSO3FBI2BOK72/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Samples are byte-sized in this mode, and thus the offset calculation
needs no shifting.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
=2D--
 sound/pci/emu10k1/emu10k1_callback.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/pci/emu10k1/emu10k1_callback.c b/sound/pci/emu10k1/emu1=
0k1_callback.c
index d36234b88fb4..2ed72bea1d8f 100644
=2D-- a/sound/pci/emu10k1/emu10k1_callback.c
+++ b/sound/pci/emu10k1/emu10k1_callback.c
@@ -310,27 +310,29 @@ start_voice(struct snd_emux_voice *vp)
 {
 	unsigned int temp;
 	int ch;
+	bool w_16;
 	u32 psst, dsl, map, ccca, vtarget;
 	unsigned int addr, mapped_offset;
 	struct snd_midi_channel *chan;
 	struct snd_emu10k1 *hw;
 	struct snd_emu10k1_memblk *emem;

 	hw =3D vp->hw;
 	ch =3D vp->ch;
 	if (snd_BUG_ON(ch < 0))
 		return -EINVAL;
 	chan =3D vp->chan;
+	w_16 =3D !(vp->reg.sample_mode & SNDRV_SFNT_SAMPLE_8BITS);

 	emem =3D (struct snd_emu10k1_memblk *)vp->block;
 	if (emem =3D=3D NULL)
 		return -EINVAL;
 	emem->map_locked++;
 	if (snd_emu10k1_memblk_map(hw, emem) < 0) {
 		/* dev_err(hw->card->devK, "emu: cannot map!\n"); */
 		return -ENOMEM;
 	}
-	mapped_offset =3D snd_emu10k1_memblk_offset(emem) >> 1;
+	mapped_offset =3D snd_emu10k1_memblk_offset(emem) >> w_16;
 	vp->reg.start +=3D mapped_offset;
 	vp->reg.end +=3D mapped_offset;
 	vp->reg.loopstart +=3D mapped_offset;
@@ -371,7 +373,7 @@ start_voice(struct snd_emux_voice *vp)
 		unsigned int shift =3D (vp->apitch - 0xe000) >> 10;
 		ccca |=3D shift << 25;
 	}
-	if (vp->reg.sample_mode & SNDRV_SFNT_SAMPLE_8BITS)
+	if (!w_16)
 		ccca |=3D CCCA_8BITSELECT;

 	vtarget =3D (unsigned int)vp->vtarget << 16;
=2D-
2.42.0.419.g70bf8a5751

