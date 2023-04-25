Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F546EE5F3
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Apr 2023 18:43:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2295010D5;
	Tue, 25 Apr 2023 18:42:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2295010D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682440999;
	bh=j2FI866f7bJRSZe9pyoQke2gaKz6vKX/jQrjan0VOyQ=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tBS0SgJEW9efGNvHnA+Tdidpno/bRDyT+iPkNop8Lt4cfDjSBdeqgKSWPZJuGZaUL
	 +DSmTIetsnEfcKYx2sL3R4PrkNInwfQzPyjy2JKed+sGLvicMkXh3sEVfsf5VVQy/m
	 StPcWTY4+JY9fgJ8cCXXXzB0OxaI6Mr6Dc61iBaI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 93C78F80104;
	Tue, 25 Apr 2023 18:42:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1A560F80236; Tue, 25 Apr 2023 18:42:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5D421F80104
	for <alsa-devel@alsa-project.org>; Tue, 25 Apr 2023 18:42:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D421F80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=uc49KU1x
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1F04862FE7;
	Tue, 25 Apr 2023 16:42:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A77F6C433D2;
	Tue, 25 Apr 2023 16:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682440931;
	bh=j2FI866f7bJRSZe9pyoQke2gaKz6vKX/jQrjan0VOyQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uc49KU1xoyNHghB/S2mkrucoVJ6dNXsKowUEI6tYnUyGgzir6xHVINqi4TMBPmFQZ
	 fuYws4vt5muCYXw6Pz+aItDSuVUrJPvKcctIz8Lsy3X8ezdi5DV0EgMN8aDvrY7dNh
	 G5H0ggiBFHl79QJp8f/4jSivUevYCykoQm7FEmOAYwaeRB37gcIegwUE7ahMg6CVve
	 AUqwNFIQOrPU8rb7RChBJEN8389wVJ1kEBbRNHwDrGVLvgnrg3OSwBf8VtyYitI+G/
	 v59RXq6l0l+/5FwUbLLUKm65vW57WqQfQXHtJG2uzHXMcLcOz6kSYKkYtIgxjsOuWU
	 RbRVSRK4JageA==
Date: Tue, 25 Apr 2023 17:42:03 +0100
From: Mark Brown <broonie@kernel.org>
To: =?utf-8?B?UGF3ZcWC?= Anikiel <pan@semihalf.com>
Subject: Re: [PATCH 5/9] ASoC: ssm2602: Add workaround for playback with
 external MCLK
Message-ID: <417f9340-3270-4579-8cff-701200a62591@sirena.org.uk>
References: <20230414140203.707729-1-pan@semihalf.com>
 <20230414140203.707729-6-pan@semihalf.com>
 <cb35f3f2-4dc9-4d56-96bd-bcffb33b7aaf@sirena.org.uk>
 <CAF9_jYSMieE=GP3T-gsXe+SDjuWKGVy9LjhMHKB9_hW7czuZmg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zKP4caOJkrTJMMD/"
Content-Disposition: inline
In-Reply-To: 
 <CAF9_jYSMieE=GP3T-gsXe+SDjuWKGVy9LjhMHKB9_hW7czuZmg@mail.gmail.com>
X-Cookie: The meek don't want it.
Message-ID-Hash: R4YN3WBR67FXUQJEBEL3H3Y2OXZ7T2YK
X-Message-ID-Hash: R4YN3WBR67FXUQJEBEL3H3Y2OXZ7T2YK
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com, tiwai@suse.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, dinguyen@kernel.org,
 lars@metafoo.de, nuno.sa@analog.com, upstream@semihalf.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/R4YN3WBR67FXUQJEBEL3H3Y2OXZ7T2YK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--zKP4caOJkrTJMMD/
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 25, 2023 at 06:02:20PM +0200, Pawe=C5=82 Anikiel wrote:
> On Fri, Apr 14, 2023 at 7:35=E2=80=AFPM Mark Brown <broonie@kernel.org> w=
rote:
> > On Fri, Apr 14, 2023 at 04:01:59PM +0200, Pawe=C5=82 Anikiel wrote:

> > > Apply a workaround for what seems to be a hardware quirk: when using
> > > an external MCLK signal, powering on Output and DAC for the first time
> > > produces output distortions unless they're powered together with whole
> > > chip power.

> > This doesn't seem coherent, these are multiple register writes so
> > clearly can't be done at the same moment as initial power on.  Clearly
> > there's some other constraint here.

> The "at the same time" part is done by writing multiple bits at once
> to SSM2602_PWR. But before that, SSM2602_ACTIVE has to be set, and
> then the chip is reset (SSM2602_RESET) to power everything down again.

So you need to power up the chip then do a register write sequence -
that's noticably different to what the description says.

> > > Here are some sequences run at the very start before a sw reset (and
> > > later using one of the NOT OK sequences from above):

> > >   ssmset 0x09 0x01 # core
> > >   ssmset 0x06 0x07 # chip, out, dac
> > >   OK

> > I can't tell what any of this is trying to say, especially given all the
> > magic numbers, and obviously no actual use of the driver should be
> > writing directly to the register map.

> These are shell commands run from userspace (with no ssm2602 driver
> present in the kernel). ssmset is a wrapper for the i2cset command:
> ssmset() {
>         i2cset -y 0 0x1a $(($1*2)) $2
> }
> I definitely should have made that more clear.

> Do you think these logs are worth adding? If so, I'll improve the
> explanation what these mean.

Probably?  Since I couldn't really follow what these were trying to tell
me it's a bit hard to say.  It looks like you worked this out yourself
rather than using an erratum so documenting where the workaround comes
=66rom seems useful.

--zKP4caOJkrTJMMD/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmRIAtoACgkQJNaLcl1U
h9CamAgAhCuIv1AvQmJghDPpVDrb/Wzz212HfxzlxLRi8TgBJV4fLdTc6tUs0YqN
XYMXREF2B9AZR+d92U8auVTbEgPxS0wQxr453J7TICBcvyK6t+xlKSg5AhPmQ0lh
uCjjErq3YoxLp13vNrNE84SjLb9PL92+r7vS2dA8WJmwhcwQIk67QVqiF6ywKFUR
sH6EBeAZVZVpsn++ll8z/F/uNVS+cyi/I0IeMuG5kxCsSFcOciYwHUgqWcZYLZA2
bu6ez52dmOPPt5G17MfGSt3W4kZZBM9LT/Qzc+qJ8auQapwAgut/aAYnqPUewlSM
hBfGzlMAlsLti8PUCA7rmd9LbECjVw==
=hoS+
-----END PGP SIGNATURE-----

--zKP4caOJkrTJMMD/--
