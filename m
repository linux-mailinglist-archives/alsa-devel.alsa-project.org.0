Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B05E59A895
	for <lists+alsa-devel@lfdr.de>; Sat, 20 Aug 2022 00:39:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8EECF1695;
	Sat, 20 Aug 2022 00:38:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8EECF1695
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660948770;
	bh=s/GG84sikI0Itd78mUGXKSubznopCbavV7DFi48tcdg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ePKiQ840m91Afh65DN8/AztFZPSCdhCDuYZf71YlmcMEwNx6S2rqompBt7Tp/QjkZ
	 99Y4wkRso9seKxuDPdMVfBHDeg7cSia3QiF3/SApQ/PjlMzeNNB82hGKlXtal4wd8a
	 kxgMj4rVUa2LBvjkvwqDTcwGpDlAC2Rj0mrgfDsU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 05343F800B5;
	Sat, 20 Aug 2022 00:38:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AD354F801F7; Sat, 20 Aug 2022 00:38:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 03C7CF800B5
 for <alsa-devel@alsa-project.org>; Sat, 20 Aug 2022 00:38:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03C7CF800B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="jGBhNYcA"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 81115617F7;
 Fri, 19 Aug 2022 22:38:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16410C433D7;
 Fri, 19 Aug 2022 22:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660948703;
 bh=s/GG84sikI0Itd78mUGXKSubznopCbavV7DFi48tcdg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jGBhNYcANumxEn1f8q5ZLM24OMGhISmjaQ4ziYX7oH+g6bx4ighI0NCoThPLKEr+r
 0JE7b50PfbLwyDGsvBMzRd1SH7Ty0ChMC4ySGn4k0dsDbVsVwVp4A/f9h/2EJ+vmtz
 BVDaS+nMrGY22Z8zTTVFfWEy/U5w5NZoIXZ9NddZ2dfAntNKU+9geLjUxA1fUyO7Cf
 dccWpp72O3CRr/OTEXtMYtyKAL6hZV9M/c+YpJW6JUOy5HI1TBR8q9O7Mivg+RHyeM
 TUea/g7hImUCnI5Ki9Kz8OiF/loD1JIgCJF5LVXjcZ4Py+ryba9w02XN3Liod0uDe/
 yLek/nJMj0t7A==
Date: Fri, 19 Aug 2022 23:38:19 +0100
From: Mark Brown <broonie@kernel.org>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Subject: Re: [PATCH] ASoC: ops: Don't modify the driver's plaform_max when
 reading state
Message-ID: <YwAQ2+OLowhA+14d@sirena.org.uk>
References: <20220603112508.3856519-1-broonie@kernel.org>
 <4507B606-8424-4820-A8CE-F79BEDE5181D@cutebit.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="vtze+xjH08JFU6nH"
Content-Disposition: inline
In-Reply-To: <4507B606-8424-4820-A8CE-F79BEDE5181D@cutebit.org>
X-Cookie: Process promptly.
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>
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


--vtze+xjH08JFU6nH
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 19, 2022 at 06:17:25PM +0200, Martin Povi=C5=A1er wrote:
> > On 3. 6. 2022, at 13:25, Mark Brown <broonie@kernel.org> wrote:

> > This means that platform_max is no longer treated as a direct register
> > value for controls were min is non-zero. The put() callbacks already
> > validate on this basis, and there do not appear to be any in tree users
> > that would be affected.

> At least =E2=80=98put_volsw' seem to validate on the other conflicting in=
terpretation
> of platform_max [as was introduced in commit 9bdd10d57a88 (=E2=80=9CASoC:=
 ops:
> Shift tested values in snd_soc_put_volsw() by +min=E2=80=9D)].

Ugh, so it does.  The patchwork of reuse and differing interpretations
of these controls is causing all sorts of confusion :/

> Also, the soc.h definitions of SOC_SINGLE_*/SOC_DOUBLE_* set platform_max
> to the register maximum, again interpreting platform_max the other way.

That use of platform_max has been removed since it was just obviously
not sensible anyway, the whole purpose of platform_max is to override
what was set in the control so having both max and platform_max set is
just redundant and causing confusion.

> > Signed-off-by: Mark Brown <broonie@kernel.org>

> This commit breaks controls with non-zero minimum.

Could you specify more exactly how it does that, and indeed where we
have non-zero minimums - all the info callbacks report 0 as a minimum as
far as I can see?  Life would be a lot simpler if the controls had all
been defined to just be the register values, I've never been able to
figure out why they're anything else since the ABI for controls supports
negative values just fine.

--vtze+xjH08JFU6nH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmMAENgACgkQJNaLcl1U
h9AWlwf/RjiL1boNHRAZYhVGSO1wGB4HirOqVSoG2gp0tgGB2MAhEwlT4R0CR8s4
irPISWEIyAkYXwT2XZ8ZHltguUdD/a8NWP8Mi4CK+FCbv9dqpQexMG5fITPIZSSQ
BSjNNQfZiB0EvnrUV1Q8OnsbWregeCxZNkezjT/Z+8pCnDghICdgiWxYTe3Lk7DQ
+/701ULj4JVf/58UnaGcGuTABxLXWJEpErbdUCgPncRm58dReVcJGao3b8na+xpu
0146ROUId4f5BPVQh4JKsJxpuNHxS9q9r0gOh+WZMrNMQ06NK1K5qo0KB8pcyJ56
kh5ELy6Oz48mFuOiGpxjDnxJE21hVQ==
=aY/V
-----END PGP SIGNATURE-----

--vtze+xjH08JFU6nH--
