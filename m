Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8866FE349
	for <lists+alsa-devel@lfdr.de>; Wed, 10 May 2023 19:31:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5399D1047;
	Wed, 10 May 2023 19:30:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5399D1047
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683739864;
	bh=0bT5NrcOAVzoHodt3oI6D1EM/pGw9sVK/2GQeIWiPAQ=;
	h=Date:From:To:Cc:Subject:Reply-To:List-Id:List-Archive:List-Help:
	 List-Owner:List-Post:List-Subscribe:List-Unsubscribe:From;
	b=HJXBgb7WztGa3dquQ0c8Djhj+KPXWMbrBFTl3XndN0+8FeZ9r2rCV7oKe6IKTZ3kM
	 wRRg3xLdDDwXo0Eh5T5FWDgW/bVyWIiz3ovGVsO6Nv2t9rNBunRyADH9djZOic18Lp
	 K5QkJEYMdCK1/8UigcMShXYwWj2PFdtRG8fxRAJw=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B88B8F805AC;
	Wed, 10 May 2023 19:27:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D16A7F80544; Wed, 10 May 2023 18:20:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RDNS_DYNAMIC,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail.icequake.net (64-251-151-187.fidnet.com [64.251.151.187])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 89E72F8052E
	for <alsa-devel@alsa-project.org>; Wed, 10 May 2023 18:20:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89E72F8052E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=icequake.net header.i=@icequake.net header.a=rsa-sha256
 header.s=mail-1 header.b=n6Ekn8bb
Received: from mail.icequake.net (aurora [127.0.0.1])
	by mail.icequake.net (Postfix) with ESMTP id A571CD40D3;
	Wed, 10 May 2023 11:20:10 -0500 (CDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icequake.net;
	s=mail-1; t=1683735610; x=1684340410;
	bh=6cS+j1VRYNpWo0Wuv7yVjob9ieRCBGEGS8tiLASM/To=;
	h=Date:From:To:Cc:Subject:Reply-To:Subject:From:To:Date;
	b=n6Ekn8bbIpwtx12UqCvx7E7uvT8FYn3NQ6yxhyq8EjFRcXbGFDEfwswf5uVt9xqH5
	 /X4TwayNemtg4fB81SW3lqHKjSaPTQDOzpG59/X4Q/VgOBx9OKo0DKPTAjnDKV46uA
	 mCzhlqA9qJpBy9mXmDTmjQ2ZOkiwI+o0dMDjMfow=
Received: from localhost (aurora [127.0.0.1])
	by mail.icequake.net (Postfix) with ESMTP id 7697ED42C7;
	Wed, 10 May 2023 11:20:10 -0500 (CDT)
X-Virus-Scanned: Debian amavisd-new at icequake.net
Received: from mail.icequake.net ([127.0.0.1])
	by localhost (aurora.icequake.net [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O_wH484lYCTR; Wed, 10 May 2023 11:20:08 -0500 (CDT)
Received: from localhost (rrcs-71-42-125-220.sw.biz.rr.com [71.42.125.220])
	(Authenticated sender: nemesis@icequake.net)
	by mail.icequake.net (Postfix) with ESMTPSA id A0B2AD40D3;
	Wed, 10 May 2023 11:20:08 -0500 (CDT)
Date: Wed, 10 May 2023 11:19:08 -0500
From: "Ryan C. Underwood" <nemesis-lists@icequake.net>
To: alsa-devel@alsa-project.org
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Stefan Binding <sbinding@opensource.cirrus.com>,
	Meng Tang <tangmeng@uniontech.com>,
	Andy Chi <andy.chi@canonical.com>,
	"Luke D. Jones" <luke@ljones.dev>,
	Philipp Jungkamp <p.jungkamp@gmx.net>,
	Kacper =?utf-8?Q?Michaj=C5=82ow?= <kasper93@gmail.com>,
	Yuchi Yang <yangyuchi66@gmail.com>, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] snd-hda-intel: Apply HP B&O top speaker profile to Pavilion
 15
Message-ID: <ZFvD/HwNPd6xuCMo@icequake.net>
Mail-Followup-To: alsa-devel@alsa-project.org,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Stefan Binding <sbinding@opensource.cirrus.com>,
	Meng Tang <tangmeng@uniontech.com>,
	Andy Chi <andy.chi@canonical.com>,
	"Luke D. Jones" <luke@ljones.dev>,
	Philipp Jungkamp <p.jungkamp@gmx.net>,
	Kacper =?utf-8?Q?Michaj=C5=82ow?= <kasper93@gmail.com>,
	Yuchi Yang <yangyuchi66@gmail.com>, linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="90BXrl9KsEnGw98J"
Content-Disposition: inline
X-MailFrom: nemesis-lists@icequake.net
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: D64D4FZJDD3ECAEJIZFRJPS533TMMHMS
X-Message-ID-Hash: D64D4FZJDD3ECAEJIZFRJPS533TMMHMS
X-Mailman-Approved-At: Wed, 10 May 2023 17:27:06 +0000
X-Mailman-Version: 3.3.8
Precedence: list
Reply-To: nemesis@icequake.net
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/D64D4FZJDD3ECAEJIZFRJPS533TMMHMS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--90BXrl9KsEnGw98J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


The Pavilion 15 line has B&O top speakers similar to the x360 and
applying the same profile produces good sound.  Without this, the sound
would be tinny and underpowered without either applying
model=3Dalc295-hp-x360 or booting another OS first.
---
 sound/pci/hda/patch_realtek.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index e103bb3693c0..7cb232a23a08 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -9335,7 +9335,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] =
=3D {
 	SND_PCI_QUIRK(0x103c, 0x802f, "HP Z240", ALC221_FIXUP_HP_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x103c, 0x8077, "HP", ALC256_FIXUP_HP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x103c, 0x8158, "HP", ALC256_FIXUP_HP_HEADSET_MIC),
-	SND_PCI_QUIRK(0x103c, 0x820d, "HP Pavilion 15", ALC269_FIXUP_HP_MUTE_LED_=
MIC3),
+	SND_PCI_QUIRK(0x103c, 0x820d, "HP Pavilion 15", ALC295_FIXUP_HP_X360),
 	SND_PCI_QUIRK(0x103c, 0x8256, "HP", ALC221_FIXUP_HP_FRONT_MIC),
 	SND_PCI_QUIRK(0x103c, 0x827e, "HP x360", ALC295_FIXUP_HP_X360),
 	SND_PCI_QUIRK(0x103c, 0x827f, "HP x360", ALC269_FIXUP_HP_MUTE_LED_MIC3),
--=20
2.39.2


--=20
Ryan C. Underwood, <nemesis@icequake.net>

--90BXrl9KsEnGw98J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSqqegowG2kcGXAAAMiiceeH7ruOQUCZFvD+AAKCRAiiceeH7ru
OWuxAJ4/b/bKgxGdMv4EroO2HzeGV/b85gCdEgaJIiCFKUsShQnEFF+WBEBBYO4=
=jase
-----END PGP SIGNATURE-----

--90BXrl9KsEnGw98J--
