Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F26B43E9435
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Aug 2021 17:05:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8804F173B;
	Wed, 11 Aug 2021 17:04:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8804F173B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628694343;
	bh=MEKpd2JWqLokdbSkx61YNu9WAsXeRAvvzmRiMnR33Ng=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=enSqp7JbdDVwqC2oL0O5rxiv0h0SLzbrUM4kixvdjbnru30hHUsIgZQnH7GcPyhmW
	 V1DdFlfbm90Igf/Sqm8jxYsdIfhJmfw070l+64Kts6TEylHBa+iW7JRorgggYW+EE0
	 NpPudxhGq8B3LUkJudakGpbHqmOrFFeO+a4WmJnQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C2688F80148;
	Wed, 11 Aug 2021 17:04:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DE9E5F8020D; Wed, 11 Aug 2021 17:04:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B31D0F800F4
 for <alsa-devel@alsa-project.org>; Wed, 11 Aug 2021 17:04:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B31D0F800F4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="s8WWgAep"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3436060FDA;
 Wed, 11 Aug 2021 15:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628694239;
 bh=MEKpd2JWqLokdbSkx61YNu9WAsXeRAvvzmRiMnR33Ng=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=s8WWgAepXBPBgkk9rn/oSYpYObUthAeDylwJBqIKptcOjxqjN8Ln3GNc/jpYGR0rs
 skB7OXc+ggRXWgUpNjMgrhD2NHQsvYaJvLmSYG+SQVCTh49HJS/Mx7ovF80qUVvHTi
 kHRECWufjTHQ+tVSFlyfGV7kLrLGIgqHv6bQQ7QMuO14lbKaZCWlEYbHg+XM7HVsaD
 5pua2rb2ZJfwY1ZAvsll0Pn3jNxeLpEilrqTcyFYKXWl5xmvdVFDhQA0tkSYbINN8w
 btgAxzAyhu10vWrVcUcGPdZ6oZPdHM5PiQVLRdxV5EWB/kPXzQHMB6ivsqTRyG++dC
 mxocrA/vQ99Kg==
Date: Wed, 11 Aug 2021 16:03:40 +0100
From: Mark Brown <broonie@kernel.org>
To: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH] ASoC: rt5682: Properly turn off regulators if wrong
 device ID
Message-ID: <20210811150340.GG4167@sirena.org.uk>
References: <20210810165850.1.I4a1d9aa5d99e05aeee15c2768db600158d76cab8@changeid>
 <CAE-0n50K+gAa0U9-kswTCdt+UAkxhuJ8BMg-D4sQayP1xqWTyQ@mail.gmail.com>
 <CAD=FV=VdjTYvLmKfGONCZhpbyrzM_tG7uXkm5==-X6-uO1gTVw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Zrag5V6pnZGjLKiw"
Content-Disposition: inline
In-Reply-To: <CAD=FV=VdjTYvLmKfGONCZhpbyrzM_tG7uXkm5==-X6-uO1gTVw@mail.gmail.com>
X-Cookie: To stay youthful, stay useful.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Oder Chiou <oder_chiou@realtek.com>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Liam Girdwood <lgirdwood@gmail.com>, LKML <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Bard Liao <bardliao@realtek.com>,
 Stephen Boyd <swboyd@chromium.org>
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


--Zrag5V6pnZGjLKiw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 11, 2021 at 07:40:59AM -0700, Doug Anderson wrote:
> On Tue, Aug 10, 2021 at 9:24 PM Stephen Boyd <swboyd@chromium.org> wrote:

> > Nit: Add newline here.

> How strongly do you feel about it? I purposely left the newline off to
> try to tie the devm_add_action_or_reset() more closely to the
> devm_regulator_bulk_get(). I wanted to make it more obvious that the
> two of them were "together" and shouldn't be split up. That being
> said, it's no skin off my teeth to add a newline if everyone likes it
> better. ;-)

TBH the newline looks off before I've got as far as reading the code.

--Zrag5V6pnZGjLKiw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmET5ssACgkQJNaLcl1U
h9BthQf/fUr37JaTB6dDdW5fjOJOkbaLPTH1s18AdnVXPERV5CAFhW7MLpHpQtAJ
5YeFi0j26U5SHmdyk0gWijwgT+NqBzIyPQBC5wo8wr7XniyF+XZTRw68oVB+1UPW
3EO3n6jvlSqM9GKRHh3vvOcOeS7DKcUXWHlU15dfTMCPLpYebjU4/HVSADQMfifr
WBP5iTnEg4G/0lkihF5gZSdkV7o+3D8uXLO7Lo1SMyteEXeQO6eOl9MwRKl6dGPF
+VxNGfSwCWQjRMZIXGwvRdIUQejFJfsUHLb8OzZ85S+qOLiu5yPckjT19hJsF679
+ThWf0Yaw/mMpWppdr7wuQKgq1cCMQ==
=4IAY
-----END PGP SIGNATURE-----

--Zrag5V6pnZGjLKiw--
