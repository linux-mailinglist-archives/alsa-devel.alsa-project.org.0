Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D9A14ED895
	for <lists+alsa-devel@lfdr.de>; Thu, 31 Mar 2022 13:35:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A1E2E18DE;
	Thu, 31 Mar 2022 13:35:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A1E2E18DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648726551;
	bh=I5op4/fhnQSUnYzJWaWQNlJ1H4wDb3rq0pO390uPg7E=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TXxeu6Gx5NydOBykDCfowZTpRlQX7b2Zi3JQDB9VnTaVk5nljZJ7x+2v6S77sea2h
	 coW81NDM19vr93zZsuPk1c7Ttgs9H38Z1rlbnatoc+NCX9yOGTPbMyqCwkooT7BI7x
	 ub0r7L5IxkYC0TI0r98aKApZtj+KJFoc29YLoKFk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E167FF80238;
	Thu, 31 Mar 2022 13:34:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B77DDF80227; Thu, 31 Mar 2022 13:34:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ECF66F800E4
 for <alsa-devel@alsa-project.org>; Thu, 31 Mar 2022 13:34:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ECF66F800E4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="L4Mo6lbg"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id AFE91B81BE2;
 Thu, 31 Mar 2022 11:34:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC2EEC34110;
 Thu, 31 Mar 2022 11:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648726476;
 bh=I5op4/fhnQSUnYzJWaWQNlJ1H4wDb3rq0pO390uPg7E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=L4Mo6lbgeciXAh4IfXNOebzQf0owI1GagEsI8A35i+oVILwvxCg/9rvHr/kpgZVVx
 Tu27hq8sDCYkK5Z31kXcQQPk7MdVAijOi6/zE1PXoDYJQf6svNuRtlLSteEuPndVG5
 /lnCyj51ESDtueBzkoSoQL8nXws6VnHgqde2sYVzPkSyI+ghvrXrHvqDT3rFVORRXR
 D9UxEUMBT3mVxoqc4D3eYEARHpsKDS1N1eve9qCwVMXb4+8FYg49PyhqnlUYL9sjtn
 qwmaeh3I3FMfJrtaBfZdI61z9sQt922riRkJpD9gIZvxvoJh6ZEQPpnBJhSFQh20FG
 wDyPiEgmMmctQ==
Date: Thu, 31 Mar 2022 12:34:29 +0100
From: Mark Brown <broonie@kernel.org>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Subject: Re: [RFC PATCH 2/5] HACK: ASoC: Add card->filter_controls hook
Message-ID: <YkWRxWjQSnJ9f281@sirena.org.uk>
References: <20220331000449.41062-1-povik+lin@cutebit.org>
 <20220331000449.41062-3-povik+lin@cutebit.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Rn6cuR2n68nqDaPE"
Content-Disposition: inline
In-Reply-To: <20220331000449.41062-3-povik+lin@cutebit.org>
X-Cookie: Reunite Gondwondaland!
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Sven Peter <sven@svenpeter.dev>, linux-kernel@vger.kernel.org,
 Hector Martin <marcan@marcan.st>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Mark Kettenis <kettenis@openbsd.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
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


--Rn6cuR2n68nqDaPE
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 31, 2022 at 02:04:46AM +0200, Martin Povi=C5=A1er wrote:

> Add a new ASoC card callback for filtering the kcontrols of the card's
> constituent components. This lets the card take over some of the
> controls, deciding their value instead of leaving it up to userspace.

Define "filter".  What is this trying to accomplish?  As a matter of
policy we don't put use case configuration in the kernel, the goal is to
avoid having to update the kernel when people decide to do new things
with their userspace.

> Also, and here's the HACK: part, move dapm_new_widgets call in front
> of the card's late_probe call. This way all kcontrols should have been
> created (and are safe to use) by the time late_probe is called.

This will break any card that adds new controls, you could add a second
call earlier but deleting the existing call is going to break other
users.

--Rn6cuR2n68nqDaPE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJFkcQACgkQJNaLcl1U
h9C7NQf9FwcUXaDm99g8Ruvdg/6JlPdvQmyopRmajEPaCmEEGsO1JSupvTnOYIAa
nbQ1U6aIzTeOfITplg9jm5E5sADl5BBdyr8CHlSq2wxUT+yuDvG94WQuQi0mmzTf
q+yit17En0FxVpnlQtLD/ML/xX13gs2jP8IdAO+B2IMuzfBQ4R2tnDu5Pu7wV7Nh
HEBuZiBW9upxlSQpmKgG8OUE26Jr5Vv/2EuwBBfW1GaigIVFvSE0QCQYWiO8JtA5
Q3dAd6VzuCbCgCwn6MJIG4q4bksBjrmDWykZmQEBgMQWM2C/n1/nvOWhNpyFXmEy
HvhjTsf2toT/vrZQr6tXIKtEdE+4tg==
=7ljO
-----END PGP SIGNATURE-----

--Rn6cuR2n68nqDaPE--
