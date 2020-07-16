Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CC65C222FB5
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jul 2020 02:06:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D79284D;
	Fri, 17 Jul 2020 02:05:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D79284D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594944370;
	bh=gJTCJPZk0JkvbVrd/FJyyfG+Ec/RDe0mEcEP2OVcd/0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Etc8iG0tzFFQXAGMwssELxX+O7i4aLGwEGPeuNwMIleH/Vp7/t/SN8xhmqhehqfWw
	 x6eiYCHsf0SHB/MF7l4XMldQtzuBOK+gPWvJuELqsEgxlehkGFZk9eBLYcybXFQ2Y9
	 l4h9N+M8rVqIIdk0lCC4umz6Np4teW6deBwzithc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A7BDF802BC;
	Fri, 17 Jul 2020 01:59:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 86FFAF802BC; Fri, 17 Jul 2020 01:59:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 82E2DF801EC
 for <alsa-devel@alsa-project.org>; Fri, 17 Jul 2020 01:59:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 82E2DF801EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="NdBeI1x4"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 85D2820760;
 Thu, 16 Jul 2020 23:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594943953;
 bh=gJTCJPZk0JkvbVrd/FJyyfG+Ec/RDe0mEcEP2OVcd/0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NdBeI1x4ywQiQBjmZCg8rPBhMBvO+KGoQR0uKvDZvT6Ked5ZwJDpEI39QzMmqMJGc
 QMgTI6EzK00TBe7emAvDmrj1YI/HVEYDsxtnklOSUNjvpYopUiRGzZUdYDPVIZFQiz
 isWP4fKz3BrtPJ3XdG1yMjmlCpQy6yHr+WCR1bD0=
Date: Fri, 17 Jul 2020 00:59:03 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v3 07/21] ASoC: atmel: merge .digital_mute() into
 .mute_stream()
Message-ID: <20200716235903.GG5105@sirena.org.uk>
References: <87h7uhxxk6.wl-kuninori.morimoto.gx@renesas.com>
 <877dvdxxi8.wl-kuninori.morimoto.gx@renesas.com>
 <20200716204403.GA10651@sirena.org.uk>
 <87mu3z2g97.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="qxfKREH7IwbezJ+T"
Content-Disposition: inline
In-Reply-To: <87mu3z2g97.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: This login session: $13.99
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
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


--qxfKREH7IwbezJ+T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 17, 2020 at 08:27:46AM +0900, Kuninori Morimoto wrote:

> > > snd_soc_dai_digital_mute() is internally using both
> > > mute_stream() (1) or digital_mute() (2), but the difference between
> > > these 2 are only handling direction.

> > At least this patch needs a rebase against current code, possibly others.

> I noticed it yesterday.
> OK, I will rebase and re-post v4

Turned out it was just that one - everything else (except the final
removal patches) was fine, git fixed up the remaining issues itself.

> Thank you for your help !!

Thank you for your hard work!

--qxfKREH7IwbezJ+T
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl8Q6cYACgkQJNaLcl1U
h9BNQAf9EMM97SpESH6bGuhLirVTecD9jaVAdRoYSwMdjH9OMgiysO9VrUTdmU9E
S3lZINTlHuU0hxHazoTX4McppSo5CPGnYlGOlodKCl4o3xwDzXt3O+DTxGMJZFWa
DwZxI64whaFQGS9EZG3nYbkePMonhAqRHMseAiTlX8dPpZ34XdEP/cILHWZGpRdL
j3aKm1iziQY6sBhK73o3fBDHzuV+8APe8mW969woKyyvoYnzToHBx2d6AL4Suo57
FyHazG4mzDNPkFkcVFnBnE1M/YWsABIlgIqN2eBagIOgMIYJrQNiP7VJgnw6MX1/
b4UXHwet1i2pYadfaoXAJ9c2+SCLhQ==
=tHYH
-----END PGP SIGNATURE-----

--qxfKREH7IwbezJ+T--
