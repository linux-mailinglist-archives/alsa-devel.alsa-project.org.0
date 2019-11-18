Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D47CA10077A
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Nov 2019 15:36:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 52BDD168F;
	Mon, 18 Nov 2019 15:35:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 52BDD168F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574087791;
	bh=hpXVrsR73lvRK4EwFCUXmZjafaSfsz1YqFhV5r6hiuE=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YSXHjp2mzyJf/WHrY45qsKGQ08kaCNo0qX+DR8e3ZLZX1qrDUl05mkWBfBABlzNK1
	 qaNcLdb43HuZ86uEkMrJk3luhNpN9q5Iz/iJiN+uYeV5PY0ePU69VUE45s4uqVfyM5
	 mqhtoRkCn2c0V2kJ7IsYKLRTacWS1BY+qYyfFKIc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6CD70F800F6;
	Mon, 18 Nov 2019 15:34:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 18E70F8013B; Mon, 18 Nov 2019 15:34:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0D98DF800F6
 for <alsa-devel@alsa-project.org>; Mon, 18 Nov 2019 15:34:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D98DF800F6
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id CD33B1C17F8; Mon, 18 Nov 2019 15:34:40 +0100 (CET)
Date: Mon, 18 Nov 2019 15:34:40 +0100
From: Pavel Machek <pavel@denx.de>
To: Takashi Iwai <tiwai@suse.de>
Message-ID: <20191118143440.GB22736@duo.ucw.cz>
References: <20191113111259.24123-1-tiwai@suse.de>
MIME-Version: 1.0
In-Reply-To: <20191113111259.24123-1-tiwai@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Pavel Machek <pavel@denx.de>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH] ALSA: usb-audio: Fix incorrect NULL check
 in create_yamaha_midi_quirk()
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============4450188665092475095=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============4450188665092475095==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qcHopEYAB45HaUaB"
Content-Disposition: inline


--qcHopEYAB45HaUaB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2019-11-13 12:12:59, Takashi Iwai wrote:
> The commit 60849562a5db ("ALSA: usb-audio: Fix possible NULL
> dereference at create_yamaha_midi_quirk()") added NULL checks in
> create_yamaha_midi_quirk(), but there was an overlook.  The code
> allows one of either injd or outjd is NULL, but the second if check
> made returning -ENODEV if any of them is NULL.  Fix it in a proper
> form.
>=20
> Fixes: 60849562a5db ("ALSA: usb-audio: Fix possible NULL dereference at c=
reate_yamaha_midi_quirk()")
> Reported-by: Pavel Machek <pavel@denx.de>
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Takashi Iwai <tiwai@suse.de>

Thanks for doing this.

Acked-by: Pavel Machek <pavel@denx.de>
								Pavel
--=20
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany

--qcHopEYAB45HaUaB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXdKsAAAKCRAw5/Bqldv6
8uJHAJ0V4w8ERJieyS0YtELNz6wNz7/WQACffTMMwfwbjocL5KTpauKs4pQYtRA=
=GZs0
-----END PGP SIGNATURE-----

--qcHopEYAB45HaUaB--

--===============4450188665092475095==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============4450188665092475095==--
