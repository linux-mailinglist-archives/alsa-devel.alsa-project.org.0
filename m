Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D247E893A19
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Apr 2024 12:14:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 680E1219F;
	Mon,  1 Apr 2024 12:14:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 680E1219F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711966481;
	bh=E3L0WmHOl5GKJTH3cqokBKLW8ALeRQO2vPWF6cehG4U=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=nvPt8SoZRDrSCblPUn7STTs5LomYYiyTHUdgF9y1DgvSD5c3OUYlcPiGfMTiJ7ObZ
	 Pk8oZSE6NFlL8Y0Xn5R/HFVtG6MbnwyBMexJyVRMHRPeKmyACMBFpsUNYDjB03b+TE
	 GwRv9iG+yGmAghgRyJksHyg4eV4+ONjJbzZxzrx0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B83F4F805D2; Mon,  1 Apr 2024 12:13:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E9D5F805C5;
	Mon,  1 Apr 2024 12:13:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 583AAF805B1; Mon,  1 Apr 2024 12:13:49 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 20747F8016E
	for <alsa-devel@alsa-project.org>; Mon,  1 Apr 2024 12:13:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 20747F8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=oswald.buddenhagen@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=N3VvE5ly
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1711966420; x=1712571220;
	i=oswald.buddenhagen@gmx.de;
	bh=iexV1y592ZZUIUwudSRj4bVo5Gq3vki6sEFboJqq3bg=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
	b=N3VvE5lyrUbAKnpWD7CXrZxpVGhOoqRmepVDfl5t8gg+TAVEP77f56hY8YgeBNe/
	 qxibpvyNbiWzfRddidqkeBhUSH1WqqN3HxfMiQ4QKeaCVWR6XZmFDOFTQwXM/9DJ7
	 evzS4/AtVwajMguMt8UGGUuS4zCbl95zbaLuJ7jV/NhDYZD/rEDkE6NIC9tDShRok
	 BZFNCVwcgDczeFPvAAQtqIH+LZHUroj4s5FoaB1TdJzSOuFqcN0b99LKH5YGkHE0+
	 YgXY7SAcRY8u4DY/c76EmPd3rnHW7z8rUOyfnuCfu1Yb6+ZBSLRKwvwCUB5RPWRK0
	 F0vOV0Qs28dg6b3AYg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from ugly.fritz.box ([89.247.162.100]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MBlxM-1ryxui0pMC-00CBNx; Mon, 01
 Apr 2024 12:13:40 +0200
Received: by ugly.fritz.box (masqmail 0.3.6-dev, from userid 1000)
	id 1rrEfb-7nW-00; Mon, 01 Apr 2024 12:13:39 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Russell King <rmk@arm.linux.org.uk>
Subject: [PATCH] ALSA: aaci: report FIFO size in frames
Date: Mon,  1 Apr 2024 12:13:39 +0200
Message-ID: <20240401101339.506625-1-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.42.0.419.g70bf8a5751
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:w9ttcMKnZnKcCLHpNRgaYDGlKQLOYIf07j0+OXaXpU6VJfvqe9u
 6Q7V82iDfpaVxti01qkiuOQ/Ip6PBoxXuG647nUW8YwANMBwqDEp73QO/sUTq9Hmc7HN81Q
 LQyw+h+0f2INFECW7qO+CZsUhDq8ZUL9o5bFAXY9NCwHy1Ny/e6vBRPy1Jg2ylksJ35i861
 jHkEswoe5lHSuQV2EOThw==
UI-OutboundReport: notjunk:1;M01:P0:byQfDvuHAPg=;ssHRcRLNI7x2t7V8e/ikyDqpTeu
 4XvywO2YAwQtzn0lt1nmNZL/T2x6cb0FlYJA7alA3rmW9TTssHBPR2bOZCdU9xrMfWk+cE422
 WiQfkjFEHYvt89U2bBGzqM15Pr2ORGp35tj9kFyKfp8N16HCZ0Pj+t+Q9iSG5cODFKoVCrSOH
 R6+nIkOw8qQxoR7AvjJAjSNd6aps+ITTVEFPewNfh1vSAOCS2obHm5Q6CheeXoCxeKtlOLpVP
 iEdVoLIJSJ6pd/1hSNbGp0fGSGcpiom8WCD6UzczxPeoW6QHC1MjsW+Qvy9b7S70JvYHiuau2
 qVbV9S5OBtRZvlPgteAqHetJRq/kNfdfPUcHXBk+9lFN2kQOm+zLoR72cW9IAmg7+AEaWyxt/
 NN9BAK1L2JstZqYU1LrSgH2ga9g/wLj6AiCmvOwjSZjElUXoEs5m9LzsPzsqP+I2bU95djcAG
 A1yGbX2H7EZefxflUcHxRMOJwV6+GlhDEQTI9xFbqtGivd/ILeGxgX0fCpHfHKpYlHQ9PRRPx
 bkAP9TToreLoP8wwk2bjQl+Xtexo+yG6ACUW/zPvI/O/sYxoVJEsaVlSlxCsPvxIcfhO4XG1i
 DDOr3dO72BzWhSd3juSlUKb6mYvGglQek1EWm5Houfnq0Al5X/yZrWlslkhjSzQl3fXiWsuSs
 ZrcJc2taC7bbqTScZEueEqKvdp22d11HVN5we4y7/GM2IfNZ9u7L9ubrj38G0qdirip0XB91Y
 6s2PLpNIaGfebpLYoIjTfs4zA/m0NK9YV4lMF0MS1FogEt6C6f0W3lacJzsSBQXHqI4DoVk+z
 SvQ/CkKlsYDNcE570b48d5iYeWug8KfQGkGyP8NfO+JGk=
Message-ID-Hash: BKCW6RMXMTOHCJF5C4F4XGMTZAJOP3MS
X-Message-ID-Hash: BKCW6RMXMTOHCJF5C4F4XGMTZAJOP3MS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BKCW6RMXMTOHCJF5C4F4XGMTZAJOP3MS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

We already have frames, so don't convert them to bytes - the mid-layer
would convert them to frames again anyway.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
=2D--

Is this actually right? What about stereo?
cf. 5d350cba486de34eff99d0394d8fb436af54522e

Cc: Russell King <rmk@arm.linux.org.uk>
=2D--
 sound/arm/aaci.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/sound/arm/aaci.c b/sound/arm/aaci.c
index c3340b8ff3da..3655e88f3fca 100644
=2D-- a/sound/arm/aaci.c
+++ b/sound/arm/aaci.c
@@ -350,6 +350,7 @@ static const struct snd_pcm_hardware aaci_hw_info =3D =
{
 				  SNDRV_PCM_INFO_MMAP_VALID |
 				  SNDRV_PCM_INFO_INTERLEAVED |
 				  SNDRV_PCM_INFO_BLOCK_TRANSFER |
+				  SNDRV_PCM_INFO_FIFO_IN_FRAMES |
 				  SNDRV_PCM_INFO_RESUME,

 	/*
@@ -430,12 +431,7 @@ static int aaci_pcm_open(struct snd_pcm_substream *su=
bstream)
 			snd_ac97_pcm_double_rate_rules(runtime);
 	}

-	/*
-	 * ALSA wants the byte-size of the FIFOs.  As we only support
-	 * 16-bit samples, this is twice the FIFO depth irrespective
-	 * of whether it's in compact mode or not.
-	 */
-	runtime->hw.fifo_size =3D aaci->fifo_depth * 2;
+	runtime->hw.fifo_size =3D aaci->fifo_depth;

 	mutex_lock(&aaci->irq_lock);
 	if (!aaci->users++) {
=2D-
2.42.0.419.g70bf8a5751

