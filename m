Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 303384991C5
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Jan 2022 21:17:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9FFB62895;
	Mon, 24 Jan 2022 21:16:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9FFB62895
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643055449;
	bh=1pXgLAy+nWl6yLln3oC3KB5DKl5OP9JI54gLXs+0evk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=trry3qW2eqgArOEa8+/MHfZfFA/AlMurtyj+srfyA/lwIyY16osIOJSsKlGRgPh8O
	 pQLQdmyEJ2ZiSdHjUSz6o6RLuoX1lB/CIffCl98D92DwjTuNQwdlUFsUgxfZzThBBe
	 My7yQw6c9t0blbs5vEw+5p1U2KYaj0UjE9vgSbjM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 10DF7F802BE;
	Mon, 24 Jan 2022 21:16:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0C1C8F8027C; Mon, 24 Jan 2022 21:16:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 47AA5F80161
 for <alsa-devel@alsa-project.org>; Mon, 24 Jan 2022 21:16:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 47AA5F80161
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="rApITNPW"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5B9806137F;
 Mon, 24 Jan 2022 20:16:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAD9EC340E7;
 Mon, 24 Jan 2022 20:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643055373;
 bh=1pXgLAy+nWl6yLln3oC3KB5DKl5OP9JI54gLXs+0evk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rApITNPWNzxYDNNluyM1PbEvFmK5BlvfjGHBbBMUvwTP64u5qjJSj9Sv9BaONAfLF
 01E9eROBb4p/0pJbwo4rPx2+rAE6T/T+6TebLJml5kgoXsbv6SkRVj7PqSoqS+S1T2
 fL5Y7T7a7OodUyql1CqF0TCYlKQBRLYUjR/kPooYdow9FXsyocasl6lz2dC8ESfTb3
 IpkRKspPeD23Pu3eiKUPyooZEWu06jFnz1kG2okxnChBAJv2402mzbCtIPAe3WRJeI
 /eQKDTf026I7GHhXAQqaBaE2DkOWO2t1FE3lnpruzzRLPG7GUIlkbJy0RB0p6McoXR
 9OBITFnHH9IRQ==
Date: Mon, 24 Jan 2022 20:16:09 +0000
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH v1 0/3] ASoC: Add bounds checking for written values
Message-ID: <Ye8JCQdN0hfgr/Z8@sirena.org.uk>
References: <20220124153253.3548853-1-broonie@kernel.org>
 <9eecf478-b705-7273-7553-24bafaec5404@perex.cz>
 <Ye7ZXvIK3sVkvzQJ@sirena.org.uk> <s5hzgnloycd.wl-tiwai@suse.de>
 <b4f715f5-7a52-f433-e11d-53b23ed3f3ad@perex.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="s69SEiKXt0TfJ2OB"
Content-Disposition: inline
In-Reply-To: <b4f715f5-7a52-f433-e11d-53b23ed3f3ad@perex.cz>
X-Cookie: The second best policy is dishonesty.
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>
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


--s69SEiKXt0TfJ2OB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 24, 2022 at 08:20:25PM +0100, Jaroslav Kysela wrote:
> On 24. 01. 22 18:08, Takashi Iwai wrote:

> > Jaroslav, is you concern only about the compatibility of user-space?
> > Or anything else?  The compatibility is always certainly a slight
> > issue; if this breaks really something useful and actually working
> > stuff, we need to consider the workaround...

> My concern is only based on the fact that this code is normally not
> reachable. It only costs some CPU ticks and adds extra code to the drivers
> without any other benefit. The applications should not use out of range
> values and if they do, the behavior is not defined (the drivers should only
> avoid crashes).

> The code seems to be added only to make things consistent for the test
> applications. I don't think that it's worth to care only for this reason.
> What is the goal for this code? The result with the proposed code will be -
> the SoC core has the extra validation conditions.

We need these checks all the time for the generic ASoC controls since
the values for the controls are stored in the underlying device's
register map so the out of range values will be written to the hardware,
pushing it out of specified use.  That's not a great idea in general and
in extreme cases could result in physical damage to the system.  The
biggest risk I see here is around speaker drivers since they deal with
high powers, even ignoring silicon requirements we also don't currently
enforce platform maximums that the machine drivers specify - that
feature was added after an inexperienced user burnt out the speakers in
their Chromebook since the speakers in the system were rated for much
lower powers than the CODEC was able to deliver.

> Basically, I think that those checks should be marked as debug and they
> should be optional like we do for CONFIG_SND_CTL_VALIDATION and enable only
> the fast path by default.

Note also that for everything using these helpers the underlying
register map will be regmap based and with the possible exception of
MMIO based regmaps the cost of writing out the new register value will
be overwhelmingly greater than that of the bounds checks.  It is
extremely hard to envision a scenario in which even a pathological
application would be able to observe a meaningful performance impact.

--s69SEiKXt0TfJ2OB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmHvCQgACgkQJNaLcl1U
h9DKMAf9H8aIkspvlRbZg2BHF7ahIQjPxynZ4Q9IGMz0g5v6mviBfG00J5GSckGx
PK82OYH5Zr5JewMe54i8s/6BW1Yx/SH7gt4gvVoeObOZjgrTJDuQw+Qe+1EWKek4
nm/k9fuwycChtvxkk12eEcU6CVafP6aEJB50/9nO7Whr2e4Vm5PZofRM1N+Lww8E
qF900Bbge4KT019t0P1Ck9yfHX4QsBTZH+lmzgVlrlNFTgeWP0M+g5tt+shhtytW
/Yu4QADYI+y1ZHCxDiYUa4CIsVd2dZQIj6mHh8MZUeR9nXTyT9pYttjUtmNeERWB
PQgLeJFNjoqk4p5XJfv++MC4aqlMXg==
=aaCm
-----END PGP SIGNATURE-----

--s69SEiKXt0TfJ2OB--
