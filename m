Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 924D3596253
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Aug 2022 20:24:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 30777163F;
	Tue, 16 Aug 2022 20:23:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 30777163F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660674270;
	bh=LTuRP7D88emir0p2SYOrorfXbwJe+1yaFcGPI0uy3cw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vUY7IN81NVHCA/fY8ura9jf6EFLp+dwmMYROBQPhygGmWSqujVXOxNtorFcMmeCnU
	 9GswAkCKlXuCYF98zimaWNAwX09w41qoHMbK+OQ/2SXlpBX9ZwaA5FRkpevylMpVOI
	 2J9nYEuJtyZGIP01HywLK2XpR9weXc49h/RTfx48=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A152FF80424;
	Tue, 16 Aug 2022 20:23:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C4039F8032D; Tue, 16 Aug 2022 20:23:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 75153F80095
 for <alsa-devel@alsa-project.org>; Tue, 16 Aug 2022 20:23:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 75153F80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="uCNfDaXR"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 490EAB817B7;
 Tue, 16 Aug 2022 18:23:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BA7FC433D6;
 Tue, 16 Aug 2022 18:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660674205;
 bh=LTuRP7D88emir0p2SYOrorfXbwJe+1yaFcGPI0uy3cw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uCNfDaXRzVPHewHp5yXC3uZtE4rYsIkxtN313cS7b3FGm8tTYthbgWz30Fc8Rvht5
 7YeNMJRRZz6k8/B4gwMiYbSKH29ga6qs0ACLZYIMacAF0Aggkmfx+Ok54pSW9P9Ftq
 aTyOz19EsXKcVsgkILEggikhrqxaOdKETkU/eOVGR4WEkXRTgPdHM6zbRx+9alKKTB
 +e8RKHDbenbPVs2CJ+z7GyrqKWNNTZVrqi3+Ft/mmooFvWfVebLZol8zI25sVaZsmC
 gQ/7qFYyiwA/GZ+tYOMLs8zfZ+LMyi3JqNqZy8Cv8ij4SJQT+bikmY+vFjvl1Ay035
 L98HzNe//dVcw==
Date: Tue, 16 Aug 2022 19:23:20 +0100
From: Mark Brown <broonie@kernel.org>
To: Geraldo Nascimento <geraldogabriel@gmail.com>
Subject: Re: Rockchip I2S commit possibly ignored
Message-ID: <YvvgmO+JFm6Hwfw6@sirena.org.uk>
References: <YvuYZE0biiAn/sxQ@geday> <YvuZbrBWzRjHYQZj@sirena.org.uk>
 <Yvudjkjxtv7M/DPL@geday> <Yvu2PRrQvsRAJSm7@sirena.org.uk>
 <YvvZzkYQ8Ce3/Lwj@geday>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="oqajXrr+tNzFbuGg"
Content-Disposition: inline
In-Reply-To: <YvvZzkYQ8Ce3/Lwj@geday>
X-Cookie: A bachelor is an unaltared male.
Cc: Sugar Zhang <sugar.zhang@rock-chips.com>,
 ALSA-devel <alsa-devel@alsa-project.org>
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


--oqajXrr+tNzFbuGg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 16, 2022 at 02:54:22PM -0300, Geraldo Nascimento wrote:
> On Tue, Aug 16, 2022 at 04:22:37PM +0100, Mark Brown wrote:

> > There's absolutely no problem with reposting someone else's patch - just
> > add your Signed-off-by at the end of the signoff chain.

> Mark, I'm in no position to lecture anyone, least of who, you, hard-working
> ASoC maintainer that you are. But there are *tons* of problems with
> reposting someone else's patch, even if they had been previously given
> the green-light but misteriously vanished.

> You are assuming responsibility for someone else's work! Let's see in

Oh, sure - but TBH if you're chasing a patch via e-mail you're pretty
much going to be in a similar situation if that results in the patch
getting applied.  A big part of the goal behind getting things reposted
is to push them through the normal test/review cycle properly so if
there was some reason for it to not get applied the first time around
it's more likely that someone will notice than if it's just pulled out
of list archives or whatever.

> My main point is that without adding "resets" and "reset-names" to *at
> least* every Rockchip device tree that enables sound over HDMI, just an
> example, you get systems with non-working HDMI. I just tested it, I
> omitted "resets" and "reset-names" from my device tree and then had
> to SSH into the black screen to revert the changes to my boot partition.

> So it's not trivial to RESEND this. It amounts to device tree overhaul
> of arch/arm64/boot/dts/rockchip

> This would require community effort of say, equivalent to LibreELEC
> resources, which are not many, but they have enough patience to test
> every proposed change to Rockchip device trees, and could help upstream
> this.

Right, that's a problem.  Even with those changes if we start requiring
new properties that'd be an ABI break anyway which isn't something we
want for DT - ideally the patch should be reworked so that existing
systems continue to work even without DT updates.

--oqajXrr+tNzFbuGg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmL74JcACgkQJNaLcl1U
h9BDfgf/R+7cHPTGaflPAPmRkOaSn/gRenSZX8frJDklkBP1bF4QnK41YxVGSjKz
SJ1mFZ9i6i3T4taKMUk3HFacRhLgidkIiVhNf/S0wHgp+uJW0YXfBzhYVYND9FQ6
ePPQfdT5qsZSvajCrTbEuZu5grLn+aV8EiIzyZ7uCG0aQgBVb0XG66JIxz9B8asV
w2xTndH5QcgzMXhRS0mtUwoKb2tnWlM6pXXlY3DQ0oQQNtFEhp3ikZhML8nxQO6k
maQneH7398UbVVFTCYMQnK/YueAitouCoz+edl1qD1VCA71qXQJd8e7r+iYJdLqg
pzCzrIfq0R5xoHrhkIfdawmVr6Qgzg==
=e6UV
-----END PGP SIGNATURE-----

--oqajXrr+tNzFbuGg--
