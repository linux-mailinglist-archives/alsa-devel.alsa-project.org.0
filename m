Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9225A1C3816
	for <lists+alsa-devel@lfdr.de>; Mon,  4 May 2020 13:29:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1D6DA170C;
	Mon,  4 May 2020 13:28:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1D6DA170C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588591749;
	bh=1fpjgMGytAN6CHMwPuvksWBl9foQbSpLbXlPr5VeXEM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cYL64IMcGUPnVdER4r2dZwaTI/q+deGc9TksIdTwVh6MvcUeY6d0tSxW+JhnmnD6B
	 ht5DtBEYuI30fQGmxgdYCccMZnT5OSz9cE8bKhltCX8N2FFr3BTc3UOPi3S/eYi4G3
	 R1hf3J7crYXc0w9lp7KFRf9q5ZTuXiL58Wm5LSpk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 33BB9F800E5;
	Mon,  4 May 2020 13:27:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1F1C4F80249; Mon,  4 May 2020 13:27:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3B4DDF800EE
 for <alsa-devel@alsa-project.org>; Mon,  4 May 2020 13:27:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3B4DDF800EE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="wbVkCUgG"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CA03220721;
 Mon,  4 May 2020 11:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588591638;
 bh=1fpjgMGytAN6CHMwPuvksWBl9foQbSpLbXlPr5VeXEM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=wbVkCUgGNR49IYOIYQp3LeIZ9alKsVhZD5jJKIMgh5CWgKgHhRKen7JpEla3Sjb89
 eK3GbIZQlbMCNwEzjPMaYUQ+J2N3kKwIfTEhcby7Hhhh84YmGZE7qLNEKBHGxkzsd7
 EGZXxrXhHydtxwdI1jMQkZ+Y/6aaOcarKHI4H+wI=
Date: Mon, 4 May 2020 12:27:15 +0100
From: Mark Brown <broonie@kernel.org>
To: chris.d.garren@gmail.com
Subject: Re: [PATCH] Mark the ADAU7118 reset register as volatile.
Message-ID: <20200504112715.GC5491@sirena.org.uk>
References: <1588365034-59198-1-git-send-email-cdgarren@indesign-llc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Izn7cH1Com+I3R9J"
Content-Disposition: inline
In-Reply-To: <1588365034-59198-1-git-send-email-cdgarren@indesign-llc.com>
X-Cookie: My life is a patio of fun!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Lars-Peter Clausen <lars@metafoo.de>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>
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


--Izn7cH1Com+I3R9J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 01, 2020 at 04:30:06PM -0400, chris.d.garren@gmail.com wrote:
> From: Chris Garren <cdgarren@indesign-llc.com>
>=20
> Without this the previously written value was written to this reg,
> which caused the different configuration registers to be reset.
> ---

I can't do anything with this, you've not provided a Signed-off-by -
please see submitting-patches.rst for details on what that means and why
it's important.

--Izn7cH1Com+I3R9J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6v/BMACgkQJNaLcl1U
h9BS2Qf6A0xJSBBUeONbY0mGEU5U2SBR2LYqNZclY3BNcDVBht83P61pooW8Ush4
kgn0SJpuqNJob8E7Ib5weNc8Y/CQ6Kyg0CrsCAUy+ICzBv5OBbXa3YRZsKfNNUzN
P8d3nVHvnwNnDMVWiYuHr4BqfVPaMkZMyryvmMp4thwtbBldd9q2/aTLrANpgk0q
6piy7Jv6PaRrTc0gKzC/rSRwormK4H4hKEVWebLIPQqc8wzSCatt4dIt8lO5V8SU
MX42SBe3oBsAPWmpHFml7+C33r5M9BfZsQyfVnd7WK1JepyAF35IeA/hceK2fs3s
lzitI6cvTMQcylq+POq4ujQ4DF3GkQ==
=42fM
-----END PGP SIGNATURE-----

--Izn7cH1Com+I3R9J--
