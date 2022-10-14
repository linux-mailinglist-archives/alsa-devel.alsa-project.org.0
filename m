Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DA9E75FEDB1
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Oct 2022 13:58:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0E0D54B47;
	Fri, 14 Oct 2022 13:57:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0E0D54B47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665748699;
	bh=dZm4/4W6/VrnL4ShazweqPwE63DywB01yaodX1tg2/0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=joo4HWH0Fbc4JrAjU4yXHJ0ZAPl5F12YsgBtvSkgB8tqirKfnrbT2xy6l98AETnxf
	 VyueOuj66rMpxn72MT0Mp6gON3CYZThdEuvi+OV9vbP9XZcT7ZYWK8hZKmEfOLgrKE
	 qPn48eyDr+Or42VkWCxKl9qcAOziw4JpIWtmodjI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 780FEF80115;
	Fri, 14 Oct 2022 13:57:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7D890F80240; Fri, 14 Oct 2022 13:57:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7731EF801EC
 for <alsa-devel@alsa-project.org>; Fri, 14 Oct 2022 13:57:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7731EF801EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="m1szGhC8"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6369EB822E8;
 Fri, 14 Oct 2022 11:57:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7187C433D6;
 Fri, 14 Oct 2022 11:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1665748629;
 bh=dZm4/4W6/VrnL4ShazweqPwE63DywB01yaodX1tg2/0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=m1szGhC8WgVq4Uwl3aFrJ6fZYl4Wmmseuw4zSphlsrBllfSKGQq09fo9PchhqP0yy
 eKkl0FuhPRVJxZPECx01HNy2ocTZAXf1ad1OV0RxXc7ELRBI1hE8Z+3IkuKJuf0WNi
 c9TjWO2o4O6qbGknQtHvt9Ur678Zkt3B/1EgF8xgbXi29OHl6jHn5O96BCvy4iBYyC
 9HZchYsghJXvEGv430VENPrMSz9pwv+YdGPrb0q3j15R0A5BG6pUxTAX9yc9ZR84+9
 dTNznaQ2pgys5vPGbBnykH/+3UQkcGSHKhhLasPpRB5FiNyfZrgtAVBKN/usJOEF7u
 7cFXm8vQd17wQ==
Date: Fri, 14 Oct 2022 12:57:03 +0100
From: Mark Brown <broonie@kernel.org>
To: Benjamin Marty <info@benjaminmarty.ch>
Subject: Re: [PATCH v2] ASoC: nau8822: add spk boost and spk btl options
Message-ID: <Y0lOj2pukpY9qV0/@sirena.org.uk>
References: <20221014085253.73733-1-info@benjaminmarty.ch>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="jTove93RxRlC2vea"
Content-Disposition: inline
In-Reply-To: <20221014085253.73733-1-info@benjaminmarty.ch>
X-Cookie: There's only one everything.
Cc: wtli@nuvoton.com, alsa-devel@alsa-project.org, kchsu0@nuvoton.com,
 lgirdwood@gmail.com, Francesco Dolcini <francesco@dolcini.it>
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


--jTove93RxRlC2vea
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 14, 2022 at 10:52:54AM +0200, Benjamin Marty wrote:

> The Speaker Boost flag is explained in the Datasheet on page 80.
> The Speaker BTL flag is explained in the Datasheet on page 78.

Not according to=20

   https://www.nuvoton.com/resource-files/NAU8822LDataSheetRev1.9.pdf=20

where the page numbers changed.  It's better to actually describe things
directly...  In any case, as Francesco said things that depend on the
physical design of the board should be in firmware description not user
controllable, users can't meaningfully change them at runtime and there
is only ever one correct setting for a given system.

> +	SOC_SINGLE("Speaker Gain Boost Control",
> +		NAU8822_REG_OUTPUT_CONTROL, 2, 1, 0),

This looks on the edge of what could be user controllable since while
the datasheet does recommend settings based on supply voltage it looks
like it's just a gain control so you could reasonably use it at runtime
in spite of what the datasheet recommends.  However if it is being
exposed it should end in Volume as per control-names.rst and ideally
have TLV information.

> +	SOC_SINGLE("Speaker BTL Configuration",
> +		NAU8822_REG_RIGHT_SPEAKER_CONTROL, 4, 1, 0),

Like Francesco says this should be done in firmware configuration since
especially in the case where there is a BTL speaker there really only is
one correct setting for the system.  I guess you might for some reason
want to invert the signal on a non-BTL system but it's hard to see what
the use case might be.

--jTove93RxRlC2vea
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmNJTo8ACgkQJNaLcl1U
h9BENgf/XSDU41mkr0glHaeY+K2sL3n18a0fjZasWB1szNfcvwTz/9VXydoVRefA
MMNj9+3qpSg541r9h+Wn1LsLxR+E9q7mY/m3+g9NBvG3Sru/yNfYVM62wby8s388
feidXoRiJtv7ezUI8BdOBQIeFvR2hTFu4M1oosBQVNaKXnuiQcJ8Z45gDL6XH5jz
kkDoo8I5vfv3o5vsvkaOw7mC8MNLIIAjvXUrL8HNFhXTKFKe0Ty3xmto88zPM2dX
eWKaIeiegwPp3ph2ToE9V2GhvsyYSZT6gz8u4rZogZpcSzlaY/WbwnaaOLjHSZvB
ouOGAEqXLjjNodN5TskTuFAt7CR5Kg==
=WXH9
-----END PGP SIGNATURE-----

--jTove93RxRlC2vea--
