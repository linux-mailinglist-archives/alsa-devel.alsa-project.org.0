Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE8A6FF89C
	for <lists+alsa-devel@lfdr.de>; Thu, 11 May 2023 19:36:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9FCF9EF8;
	Thu, 11 May 2023 19:35:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9FCF9EF8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683826573;
	bh=dRNvWxMtSdyGMsCX6YkgMyw6f3h6IJCgonHdGFWjfjI=;
	h=Date:From:To:Cc:Subject:Reply-To:List-Id:List-Archive:List-Help:
	 List-Owner:List-Post:List-Subscribe:List-Unsubscribe:From;
	b=LFrwb2lxUdr9+0PlxnqGPBwTwUqsVXBubodJ8bAhZD7ak7jdTJdX36PZRtGc1vozX
	 u33WtTG2ac9eN7R2gBzVGUFNh+5cdeX+XGZU4cdSBhqHhrzJOC08Wxd0CAz7C74N4G
	 fNA4W3T3zSk0pDOzBi+lCl0Pr9miMP+aCgcWIoYU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 08197F80534; Thu, 11 May 2023 19:35:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B9B74F8032D;
	Thu, 11 May 2023 19:35:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8216BF8052E; Thu, 11 May 2023 19:35:19 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id F2F3FF802E8
	for <alsa-devel@alsa-project.org>; Thu, 11 May 2023 19:35:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F2F3FF802E8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=icequake.net header.i=@icequake.net header.a=rsa-sha256
 header.s=mail-1 header.b=kUqky+Wk
Received: from mail.icequake.net (aurora [127.0.0.1])
	by mail.icequake.net (Postfix) with ESMTP id 57CA8D4317;
	Thu, 11 May 2023 12:35:10 -0500 (CDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icequake.net;
	s=mail-1; t=1683826510; x=1684431310;
	bh=DmLP6TBXhf4N5Mvc9+3GJ6/YeLZ5Yc9V31ycFmux+mU=;
	h=Date:From:To:Cc:Subject:Reply-To:Subject:From:To:Date;
	b=kUqky+WkGdDp4bHZdpOwEGkJRtgzBxLhcklleRlqGGR8uVRDaRxsRL5G4GnmJ6gQT
	 YTTmPmdQktMIXC/5LxsQ0KqAmCsAp91+S3sSWXWR7BF2eZMRmPK3z+kYf3laHwD12H
	 IM5yCM+4HLTO8kGXw5bdWQbGIZLabUP5QycjWlUU=
Received: from localhost (aurora [127.0.0.1])
	by mail.icequake.net (Postfix) with ESMTP id 3EE7BD4319;
	Thu, 11 May 2023 12:35:10 -0500 (CDT)
X-Virus-Scanned: Debian amavisd-new at icequake.net
Received: from mail.icequake.net ([127.0.0.1])
	by localhost (aurora.icequake.net [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id slBpBSYWsDK5; Thu, 11 May 2023 12:35:09 -0500 (CDT)
Received: from localhost (rrcs-71-42-125-220.sw.biz.rr.com [71.42.125.220])
	(Authenticated sender: nemesis@icequake.net)
	by mail.icequake.net (Postfix) with ESMTPSA id 9F7E7D4317;
	Thu, 11 May 2023 12:35:08 -0500 (CDT)
Date: Thu, 11 May 2023 12:32:21 -0500
From: "Ryan C. Underwood" <nemesis@icequake.net>
To: alsa-devel@alsa-project.org
Cc: Jaroslav Kysela <perex@perex.cz>, linux-kernel@vger.kernel.org
Subject: [PATCH] snd-hda-intel: Apply HP B&O top speaker profile to Pavilion
 15
Message-ID: <ZF0mpcMz3ezP9KQw@icequake.net>
Mail-Followup-To: alsa-devel@alsa-project.org,
	Jaroslav Kysela <perex@perex.cz>, linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4X/VV/xht5l+DTIS"
Content-Disposition: inline
Message-ID-Hash: I7DRHDMU52I6TR6SW7ZCYQTVD6YACRNL
X-Message-ID-Hash: I7DRHDMU52I6TR6SW7ZCYQTVD6YACRNL
X-MailFrom: nemesis@icequake.net
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
Reply-To: nemesis@icequake.net
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/I7DRHDMU52I6TR6SW7ZCYQTVD6YACRNL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--4X/VV/xht5l+DTIS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


The Pavilion 15 line has B&O top speakers similar to the x360 and
applying the same profile produces good sound.  Without this, the
sound would be tinny and underpowered without either applying
model=3Dalc295-hp-x360 or booting another OS first.

Signed-off-by: Ryan Underwood <nemesis@icequake.net>
---
 sound/pci/hda/patch_realtek.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index e103bb3693c0..7cb232a23a08 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -9335,7 +9335,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] =
=3D {
        SND_PCI_QUIRK(0x103c, 0x802f, "HP Z240", ALC221_FIXUP_HP_MIC_NO_PRE=
SENCE),
        SND_PCI_QUIRK(0x103c, 0x8077, "HP", ALC256_FIXUP_HP_HEADSET_MIC),
        SND_PCI_QUIRK(0x103c, 0x8158, "HP", ALC256_FIXUP_HP_HEADSET_MIC),
-       SND_PCI_QUIRK(0x103c, 0x820d, "HP Pavilion 15", ALC269_FIXUP_HP_MUT=
E_LED_MIC3),
+       SND_PCI_QUIRK(0x103c, 0x820d, "HP Pavilion 15", ALC295_FIXUP_HP_X36=
0),
        SND_PCI_QUIRK(0x103c, 0x8256, "HP", ALC221_FIXUP_HP_FRONT_MIC),
        SND_PCI_QUIRK(0x103c, 0x827e, "HP x360", ALC295_FIXUP_HP_X360),
        SND_PCI_QUIRK(0x103c, 0x827f, "HP x360", ALC269_FIXUP_HP_MUTE_LED_M=
IC3),
--=20
2.39.2

--=20
Ryan C. Underwood, <nemesis@icequake.net>

--4X/VV/xht5l+DTIS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSqqegowG2kcGXAAAMiiceeH7ruOQUCZF0mowAKCRAiiceeH7ru
OeeBAJ4pyw38iSUkPk3XVivjLES4ciD6PwCfdJBtyAefwhK5N8+vzabPhxLMuFg=
=/2WK
-----END PGP SIGNATURE-----

--4X/VV/xht5l+DTIS--
