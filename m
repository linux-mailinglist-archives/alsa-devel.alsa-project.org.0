Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C67387CF26
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Mar 2024 15:42:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 882AF231C;
	Fri, 15 Mar 2024 15:42:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 882AF231C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710513749;
	bh=/q5YpMd9flHlseDCFPbg8au4ag1109m5lTjQTwS5gjw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GjQRNR01bu5XmBsmzARW5v9gg2kpwzeC4Hl7fjXM3gNqsGA6r1KEWBziQCto9vdKp
	 0BCrfkPu/qc+MGc85cUCABnRcvFuLkqs4w3wE1EUtWvsd9HgssSVXAy/FXotQa8Kd7
	 usxQHqs3RXHwkUfaOu/pugtNNtFDty4GbEhnAhrI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1D406F80564; Fri, 15 Mar 2024 15:41:54 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8DE49F80564;
	Fri, 15 Mar 2024 15:41:53 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E1A99F8028D; Fri, 15 Mar 2024 15:41:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2CA77F800E4
	for <alsa-devel@alsa-project.org>; Fri, 15 Mar 2024 15:41:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2CA77F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Xh9YWr5X
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 5CECBCE20AD;
	Fri, 15 Mar 2024 14:41:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 277A7C43394;
	Fri, 15 Mar 2024 14:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710513629;
	bh=/q5YpMd9flHlseDCFPbg8au4ag1109m5lTjQTwS5gjw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xh9YWr5X8ZC2LB5aTOiLwQb+ka5kfR3Rq3WSR2N14VU3k+/gBkTescbM5r8gxPImq
	 PYMXqiXv+1R5zvYmVQRbOj6ISyIIs0Jg8SW9cu6tBsgV/NDNrsaCAXlUSFYZxqToWn
	 l4Q6LURoBzapyHnLXCTKsDJVE8U0/mXF0vJu3TgISaWVou228FJcyNcrrXVWgFf61b
	 /wkXznU5VRw4R7GUKnxZMu75XOzGg7FqW58iVcnSpE65Z/LJnJSZZlhEc0IwZgcdU4
	 AXBntKqJoom6SKD0SvFQTZtZ0ljv+F6gieBnDhx3uW4Kl499/3lbwubH7ebT/R2iuF
	 LFfM0sXO6WpOA==
Date: Fri, 15 Mar 2024 14:40:23 +0000
From: Mark Brown <broonie@kernel.org>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Bastien Curutchet <bastien.curutchet@bootlin.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	christophercordahi@nanometrics.ca
Subject: Re: [PATCH 04/13] ASoC: ti: davinci-i2s: Replace dev_err with
 dev_err_probe
Message-ID: <2f58922d-8964-4693-ab8a-612eb2f427e1@sirena.org.uk>
References: <20240315112745.63230-1-bastien.curutchet@bootlin.com>
 <20240315112745.63230-5-bastien.curutchet@bootlin.com>
 <6102130b-b496-4e75-9b9f-f960484848fb@sirena.org.uk>
 <20240315152332.57c8fdc4@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="15hPqMQpuEKqXq2/"
Content-Disposition: inline
In-Reply-To: <20240315152332.57c8fdc4@bootlin.com>
X-Cookie: A well-known friend is a treasure.
Message-ID-Hash: R55DTDSHKA3BCUPJGW6HGXWXZOJGGELV
X-Message-ID-Hash: R55DTDSHKA3BCUPJGW6HGXWXZOJGGELV
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/R55DTDSHKA3BCUPJGW6HGXWXZOJGGELV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--15hPqMQpuEKqXq2/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 15, 2024 at 03:23:32PM +0100, Herve Codina wrote:
> Mark Brown <broonie@kernel.org> wrote:

> > dev_err_probe() with a fixed error code doesn't seem to make much sense,
> > the whole point is to handle deferral but for a straight lookup like
> > this that can't happen.

> The error code is uniformly formatted and the error path is more compact.
>   https://elixir.bootlin.com/linux/latest/source/drivers/base/core.c#L4963

> IMHO, to benefit of these feature, it makes sense to use it even with a fixed
> error code.

I'm not convinced TBH, the fixed error code smells pretty bad.

--15hPqMQpuEKqXq2/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmX0XdYACgkQJNaLcl1U
h9BL+Qf/e/mT3mvVoCNVK90XX2T3vJXR/x4cDU6LIbiYli44yw2LIvQ6NEJdy1s2
h2NuvcMj4KFqXuOmTHZFkLVj3bteWZpfEBCd9Yyp3k0S2v3lz6vKMo6WeI2JTMnZ
Or+DSkLgGs8Rgn7aVqilsMBQRKQjnZ9JrYK0v02oMMWjm4Lg5Gk9AXwOOPvHAbWt
m/SrXOnPfFeWn0XXywm3AjF1vWnFu1g+qbPq/MniiwA7kYF7CG2fZCm/p1itXQIc
C+Phc9DjmvnJQwC+pSgTSoWx8nwKW6cDiV0ndVaJkudn90o4yxWj4DGJSxzCz8U+
ytZAz8Q0eZ+iH6t2K2R+Mt/5eNGvrg==
=GIiK
-----END PGP SIGNATURE-----

--15hPqMQpuEKqXq2/--
