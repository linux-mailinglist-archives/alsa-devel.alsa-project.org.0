Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9812253E5AE
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Jun 2022 18:18:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 450681A41;
	Mon,  6 Jun 2022 18:17:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 450681A41
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654532319;
	bh=cL02EFnsI2kswr/vUjpRPrP2hvEJIYbboXkvokpSilY=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QqEN/VaiS6xUCwsGdQdzqPVYc/fTTqUAZQplqeF19jkccR1xMU3z7gkB00wZ/p3yz
	 jkMtLex48k2K28tvu61W/C2ou6/51/zHEjOvBLxhUU0UEdL7Eidfh6UcY/Cld5VUyt
	 rKpWWthrgKeW7hU4BjiDpiTN5A8Ijmm5gmDq+Vlo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BB720F80310;
	Mon,  6 Jun 2022 18:17:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 04C43F801D8; Mon,  6 Jun 2022 18:17:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CCB55F80109
 for <alsa-devel@alsa-project.org>; Mon,  6 Jun 2022 18:17:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CCB55F80109
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de
 header.b="NiP6Zi5T"
Received: from ktm (85-222-111-42.dynamic.chello.pl [85.222.111.42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: lukma@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id A8732805FE;
 Mon,  6 Jun 2022 18:17:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1654532252;
 bh=eP279UjGMMblW/RjkeTp8zITZb3eYCq6RyDyFwrQ+7A=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=NiP6Zi5TLlJAUa34eeVil1qNPMOCzpnJ2vi3EUZ02x+nNIN/wC1eswPRa5LWX82gW
 xQsAbGE/b5fXwDTAe8gPQkVcLuwqjW9Gu2+njDvtRixFig1jguRVHf2HZer71OcUCm
 1mU0ZDBn35HZ0l5fbV4fRuhg+05hRjLKPqYs/RSE5AyyxXDl2PM6ZUE5IO2obcmome
 6j1BD5H6cQ7KTSGxiKQNxDUIuYRrvBxmhoX4UWFONLR7cY7kIyI417gU6YVK2B7UQG
 5rebzhBycZjddEqwOc5g/y3VcrB4HjpiPN67tizBDgf1F4Td+vzVRPPRIv7rAq9vxC
 IrUOLctsGkBIg==
Date: Mon, 6 Jun 2022 18:17:31 +0200
From: Lukasz Majewski <lukma@denx.de>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/3] ASoC: wm8940: Remove warning when no plat data
Message-ID: <20220606181731.04b6f771@ktm>
In-Reply-To: <Yp4iGvGFD9jo4WUP@sirena.org.uk>
References: <20220606154441.20848-1-lukma@denx.de>
 <Yp4iGvGFD9jo4WUP@sirena.org.uk>
Organization: denx.de
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 boundary="Sig_/3EtfwSfo=U0Fi_=NClQYqiP"; protocol="application/pgp-signature"
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 patches@opensource.cirrus.com, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

--Sig_/3EtfwSfo=U0Fi_=NClQYqiP
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Mark,

> On Mon, Jun 06, 2022 at 05:44:39PM +0200, Lukasz Majewski wrote:
> > The lack of platform data in the contemporary Linux
> > shall not be the reason to display warnings to the
> > kernel logs.
> >=20
> > Signed-off-by: Lukasz Majewski <lukma@denx.de> =20
>=20
> Given that the device requires configuration and doesn't appear to
> have any other firmware interface support that's rather a strong
> statement...

Thanks for the comment :-)

My point is that - similar codec - wm8974 don't display such warnings.
(this code was not updated/refactored for a quite long time).

Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/3EtfwSfo=U0Fi_=NClQYqiP
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAmKeKJsACgkQAR8vZIA0
zr2YUgf/WLcHyS0nmSaNYGAiWqnLDVVXJzE7LDBHx5qszYi5HnaSvEoULIBRkLln
AbuRhbSM2WaBP2yqDQcm9YXg59zQM9WhCpuw4/Ai5G+8s9yw0vJhw54t+FCK0bqg
WvtYhHFY7VjdqkzQ7MrnoMLiG7Cjv/ZAy2l7Ba6Fmte/VL6ycMtqGtfz4ZUv0HbU
+YZ9w59YqnD4Uh5RdU47ZtNbTDgnRXilhEUSu6mMGsgeQJoNRYqtfxRva/9hGCgv
R/IYjUEBFA94mkMMD9NWQ/QteAAyclqrCxnpEFYcfPuR1Y944do5c7eOywep0J+n
tolWcSNafAhy+/+WL/n2to+BWduxZQ==
=WLzo
-----END PGP SIGNATURE-----

--Sig_/3EtfwSfo=U0Fi_=NClQYqiP--
