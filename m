Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 524C14F3D22
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Apr 2022 20:09:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D6C94177E;
	Tue,  5 Apr 2022 20:08:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D6C94177E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649182189;
	bh=NtBhGURVESJUSY8I9nvNgpznPalXmXHV0lFgfPnMkxk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mz+xZMn21oS+yeelR9zKFLN0NBWQohKndOSmVp0enm+MnTrF1eghLW+/M9HzYr7dx
	 mxFCH8JkOU7jr+MAQVdVp/modoQTX5GwbtC1dtb7AUOEIMWMvSlizX4esm1NNSDDrQ
	 zYAflk+EJVkqFSqmu3mEdy/lSlIvc+QciyhXrKP4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 475BAF8012C;
	Tue,  5 Apr 2022 20:08:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 52648F8016A; Tue,  5 Apr 2022 20:08:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C6D32F800D2
 for <alsa-devel@alsa-project.org>; Tue,  5 Apr 2022 20:08:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C6D32F800D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="qOy5Makr"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E57CBB81F69;
 Tue,  5 Apr 2022 18:08:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72C53C385A0;
 Tue,  5 Apr 2022 18:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649182123;
 bh=NtBhGURVESJUSY8I9nvNgpznPalXmXHV0lFgfPnMkxk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qOy5MakrI0EOT7P8JeLQx2F/MwmflIt1w4Vijv94UiEFSKbI0/LjQDFLSMNOff2cD
 FEwTAHiEAXA1xFNXLe5dtSUvC2xMorJb8wWLmzfJLN/NSCIslF2HR0YF9GH/8kBEC+
 +dL/iulLAfgdv+OvrVx9xX3a7uRTYkkvTW7u/Sv5LZTyJ+X7nQe7vqyvAvacgbJgzN
 /qTUCoowkyDFTlCKQhcGP+Q5AOfSg7yrxgRd47XSJJ8GUSaDkaqTRiKrBcgDdhGSu2
 KrD6zTRA3rx8VGMYVHbzCPF4TfzNwjNq8fvY2l9KCvufMUmghSFck/axFGWBevTcZY
 toELS8zyDBPfA==
Date: Tue, 5 Apr 2022 19:08:38 +0100
From: Mark Brown <broonie@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH v2 0/2] ASoC: meson: aiu: fix duplicate debugfs directory
 error
Message-ID: <YkyFpmHhZwg19EmL@sirena.org.uk>
References: <51953618-79b6-0df7-2d28-d5dce4dc86c7@gmail.com>
 <8a63cf25-3662-032e-b088-6a343b86462f@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="T9mryndXkvnrkI3o"
Content-Disposition: inline
In-Reply-To: <8a63cf25-3662-032e-b088-6a343b86462f@gmail.com>
X-Cookie: diplomacy, n:
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Takashi Iwai <tiwai@suse.com>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Jerome Brunet <jbrunet@baylibre.com>
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


--T9mryndXkvnrkI3o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 31, 2022 at 07:56:03AM +0200, Heiner Kallweit wrote:

> Any feedback here?

Please don't send content free pings and please allow a reasonable time
for review.  People get busy, go on holiday, attend conferences and so=20
on so unless there is some reason for urgency (like critical bug fixes)
please allow at least a couple of weeks for review.  If there have been
review comments then people may be waiting for those to be addressed.

Sending content free pings adds to the mail volume (if they are seen at
all) which is often the problem and since they can't be reviewed
directly if something has gone wrong you'll have to resend the patches
anyway, so sending again is generally a better approach though there are
some other maintainers who like them - if in doubt look at how patches
for the subsystem are normally handled.

--T9mryndXkvnrkI3o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJMhaUACgkQJNaLcl1U
h9ChEQf/fdrtl6/9MJ57RFUXrTsC2lG+dsXbtpQcaTa4gKgwY4vaKp1fejWu7nOv
WIolAlOmllu2hZGHWQqMfpoeWmAwNvTyk7Hbp2pjotT1IAK8GqqRzNXBd0C+q4tG
aj3cObZTK+03w5WNG7soIhQki0yscHapzYqx0zA2X4Io96OaAOZ+2ltF5ZIGUV4e
3GYwkO9c8mAD9Y+9iDf/LQV4pzN/IE5fnfQv59u8wc9UuJle+mr9HTcwNecmgCAo
jLhjCjskR20/m3Oj1Cj6tIaqeIjM1zzyw/Lvs9FlH2nC+OO6mJm2T57Mwvfmr0EW
ydpIMBaKkx8D4DjhbeVzJi4tou+KLg==
=5pXh
-----END PGP SIGNATURE-----

--T9mryndXkvnrkI3o--
