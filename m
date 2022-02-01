Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B18CF4A62A5
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Feb 2022 18:38:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 392C117D4;
	Tue,  1 Feb 2022 18:37:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 392C117D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643737109;
	bh=5+e2/1ovVlkoJZG7HnhqfG3Xn95vLy9k+cqRL0uJ2do=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WNTS3qAtwcRiNk2vx7J5Fnu4q5RA4lwtNnbXbfcF9OFyeGEjFzlbnpOp/IUVL/D3R
	 0dFY7iPH45RZMcprRSOAzpqmsBlV+IEBaeYa7woWGHCuLRMs7/xo1M0qUMU6D91LU0
	 fVXrt5Vlkt4hk+VJIbstPLHZ9NN1WgUqOFs7INik=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 84CD8F80139;
	Tue,  1 Feb 2022 18:37:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B7F84F80089; Tue,  1 Feb 2022 18:37:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 61695F800F8
 for <alsa-devel@alsa-project.org>; Tue,  1 Feb 2022 18:37:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61695F800F8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="sxW1qIGE"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 93470B82F26;
 Tue,  1 Feb 2022 17:37:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC84BC340EB;
 Tue,  1 Feb 2022 17:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643737034;
 bh=5+e2/1ovVlkoJZG7HnhqfG3Xn95vLy9k+cqRL0uJ2do=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sxW1qIGED3bDGK2mg5prOpEGSfiWe7+fT3a7V37OfTRi8YAXEE6+hyhVVbNrLuA32
 mznzf9FkC9qKTCzrAUGCn4of/W1v78w5mW1Vl9gJGJz5Xlvq6Y1bSCXTlXVH0IH7rP
 5yLlePfUTRbmaGnMsFHH3yUcK3EQq1nfxEOdr7zwk8+5+/dNtynakmCuofnjDoXTWW
 Yy8Lvzhk0TTU+hKzLjKb1/btwnyYv0ICzYMniyYyT/wvq/RjgUkmTHnG4e/dD6IbWP
 FP3pgRbqa9hJxOzvX2vwfNJpj8BAMyY/TkaGnp7t7wJP6uE2I+p4plxj1Jlzaw82We
 hzxMb/hloQWPw==
Date: Tue, 1 Feb 2022 17:37:08 +0000
From: Mark Brown <broonie@kernel.org>
To: Stefan Binding <sbinding@opensource.cirrus.com>
Subject: Re: [PATCH v6 2/9] spi: Create helper API to lookup ACPI info for
 spi device
Message-ID: <YflvxPmiwL0TbjPM@sirena.org.uk>
References: <20220121172431.6876-1-sbinding@opensource.cirrus.com>
 <20220121172431.6876-3-sbinding@opensource.cirrus.com>
 <36df02cc-d164-eb6a-4ce7-54d2ee916650@redhat.com>
 <001101d81791$23f56090$6be021b0$@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="NYU0R5j8dZiNHmNm"
Content-Disposition: inline
In-Reply-To: <001101d81791$23f56090$6be021b0$@opensource.cirrus.com>
X-Cookie: All's well that ends.
Cc: platform-driver-x86@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-acpi@vger.kernel.org, "'Rafael J . Wysocki'" <rafael@kernel.org>,
 linux-kernel@vger.kernel.org, 'Takashi Iwai' <tiwai@suse.com>,
 'Mark Gross' <markgross@kernel.org>, 'Hans de Goede' <hdegoede@redhat.com>,
 patches@opensource.cirrus.com, linux-spi@vger.kernel.org,
 'Len Brown' <lenb@kernel.org>
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


--NYU0R5j8dZiNHmNm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 01, 2022 at 05:28:34PM +0000, Stefan Binding wrote:

> I was just fixing this, however, I just noticed that a subset of this chain - including
> this patch - just got applied. Do you want me to fix this in a separate patch?

Quoting from the mail you got saying that the series was applied:

| If any updates are required or you are submitting further changes they
| should be sent as incremental updates against current git, existing
| patches will not be replaced.

Please delete unneeded context from mails when replying.  Doing this
makes it much easier to find your reply in the message, helping ensure
it won't be missed by people scrolling through the irrelevant quoted
material.

Please fix your mail client to word wrap within paragraphs at something
substantially less than 80 columns.  Doing this makes your messages much
easier to read and reply to.

--NYU0R5j8dZiNHmNm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmH5b8MACgkQJNaLcl1U
h9Dzzgf/Qaojnc1Tj+koHQ+yotSwO0JMyuM6KElApYmMkU67dQwQgn79wFstjmqU
I0QX8F3k8rDQaYuS7MjeWCee4raTsSQ3eQb3k0ORuUGE96RWPcsrK4MgpwIR+K/D
uR7Bvva58ALZI0Y9u2nLwQGfcOeXt3TmUIIsmIgdBu0e3KAOfKcFD+98x/AOWGON
/TiklP8RFuqYiMDAij6vS7RflZ3zlN1yR/aGqYgfgiH9UXBIpgJd8mZ42Nb3sCQg
IbILq+R6RyR6bVUODSdegfsizQLkTRFK0EWQlgVtDNkmn8feOxPC0erAhCbI1kaK
ukivFigIPevnB5Phdi5brz3lda3nGw==
=z7h3
-----END PGP SIGNATURE-----

--NYU0R5j8dZiNHmNm--
