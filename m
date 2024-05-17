Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CC5288C9E56
	for <lists+alsa-devel@lfdr.de>; Mon, 20 May 2024 15:47:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0231C820;
	Mon, 20 May 2024 15:47:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0231C820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716212854;
	bh=tz2kY6qZxYu8TUGihVyLmMBdD0mSnRDdr1XJJV0fdqw=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PgtXqppwVIMG8Yi6IvQZUgF0y8iatW4xzuQRI/CJbeAx2SaDpX/dN6Ax7Rq1EX2Y3
	 Tx+hb3T9Rugz6rUr6VKdwy8QVpguPchQ4D4CLibo8tRmQYhclGejPQRQGBUpKb3uQO
	 xSNsbvVVzcRToyhhR8SwhTXhEh5H7sy6Mn/OYR1g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BEBF9F80634; Mon, 20 May 2024 15:46:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8729EF80630;
	Mon, 20 May 2024 15:46:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4BE0AF800BA; Mon, 20 May 2024 14:56:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 75DC7F800BA
	for <alsa-devel@alsa-project.org>; Mon, 20 May 2024 14:56:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 75DC7F800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=hQy4PIpg
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 065AF619C0;
	Fri, 17 May 2024 11:17:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29952C2BD10;
	Fri, 17 May 2024 11:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715944647;
	bh=tz2kY6qZxYu8TUGihVyLmMBdD0mSnRDdr1XJJV0fdqw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hQy4PIpgYaKxXAHLGvLX+gUDvsDu0a15TR2Y2mPX//3bbTmVe/LF42kVNmBCWnrIF
	 fXggLSUVDlRgG8/nB5tFhPY4GpcIiGYQBQRpMMPvtbclDKqH3Qnab61xQFVGHq2E2B
	 ao1JK8A6/I+vrUgOJv3Dqfry4TbETyrS/EwqZs6+lMa8i3a3TvJF66NVcnL3FOE/d7
	 EKMK8Lf7bk4KqjpHqxIZJonIMDYbfuZMldEu32/tyybWRpV/5PTq4PLsakYSgjOjj/
	 szCeeggBtdpenLeZv1HQ0li+bHqGpiJhMedlDwAJ0RCCwi8ibZnRe2zj8+qUn3xZUy
	 hTr7GqHUkMODg==
Date: Fri, 17 May 2024 12:17:20 +0100
From: Mark Brown <broonie@kernel.org>
To: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
Subject: Re: [PATCHv4 7/9] ASoC: fsl-asoc-card: add DT clock "cpu_sysclk"
 with generic codec
Message-ID: <da74d276-b028-448b-bb28-295de49dbcda@sirena.org.uk>
References: <20240515135411.343333-1-elinor.montmasson@savoirfairelinux.com>
 <20240515135411.343333-8-elinor.montmasson@savoirfairelinux.com>
 <ffb3624f-2170-4642-aaa5-fb6736a75d59@sirena.org.uk>
 <822567441.349330.1715936735603.JavaMail.zimbra@savoirfairelinux.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZuqvFG62+4JL9ncV"
Content-Disposition: inline
In-Reply-To: 
 <822567441.349330.1715936735603.JavaMail.zimbra@savoirfairelinux.com>
X-Cookie: Function reject.
Message-ID-Hash: TA4RXBJN27HNKTME67DV5HLA5TGH7VC2
X-Message-ID-Hash: TA4RXBJN27HNKTME67DV5HLA5TGH7VC2
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, shengjiu wang <shengjiu.wang@gmail.com>,
 Xiubo Lee <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 linux-sound <linux-sound@vger.kernel.org>,
 devicetree <devicetree@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 alsa-devel <alsa-devel@alsa-project.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--ZuqvFG62+4JL9ncV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 17, 2024 at 05:05:35AM -0400, Elinor Montmasson wrote:
> From: "Mark Brown" <broonie@kernel.org>
> > On Wed, May 15, 2024 at 03:54:09PM +0200, Elinor Montmasson wrote:

> >> +		struct clk *cpu_sysclk = clk_get(&pdev->dev, "cpu_sysclk");
> >> +		if (!IS_ERR(cpu_sysclk)) {
> >> +			priv->cpu_priv.sysclk_freq[TX] = clk_get_rate(cpu_sysclk);
> >> +			priv->cpu_priv.sysclk_freq[RX] = priv->cpu_priv.sysclk_freq[TX];
> >> +			clk_put(cpu_sysclk);
> >> +		}

> > I don't really understand the goal here - this is just reading whatever
> > frequency happens to be set in the hardware when the driver starts up
> > which if nothing else seems rather fragile?

> The driver allow to set the sysclk frequency
> of the CPU DAI through `priv->cpu_priv.sysclk_freq` when calling
> `fsl_asoc_card_hw_params()`.
> Currently it is hard-coded per use-case in the driver.

> My reasoning was that with a generic codec/compatible, there might
> be use-cases needing to use this parameter, so I exposed it here via DT.

> Is it a bad idea to expose this parameter ? This is not a requirement for the
> driver to work, most of the current compatibles do not use this parameter.
> It is currently used only for `fsl,imx-audio-cs42888`.
> In that case I can remove this commit.

I'm having a hard time connecting your reply here with my comment.  This
isn't as far as I can see allowing the frequency to be explicitly
configured, it's just using whatever value happens to be programmed in
the clock when the driver starts.

--ZuqvFG62+4JL9ncV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZHPMAACgkQJNaLcl1U
h9A/Mwf/e8Oa99TU5bBwUqPPv4RdS3EWv4/897XflQzPXjxfkxnMFOUUf0EBVm61
5WnYoirwxy+DfhNF5ubdVm7WNINPuCs1X7mMZcN6aBE4Vo9yw1deDjFV8/s+QSCd
6JpsmssN8sIOQh+w5Axkp+Qk9JuVRbVI8nFDMhD/tPRUMkUG9mjCLjP3xQoV59+d
p9ElIEC+zSBWu9HCQW4i19eO+O53iT/9s7jkpXhFBbai02OOzw5q5LcwyL/qh0Zg
fhOWA9PFrwg7iS7Rknp3Np5Msb09gh86McZtp2htgkkbggFl7ak0nRG+qlfyN0P/
AKOYQ4agvMxC3FKsb/HmPv9Q+Brc5w==
=Zf2Q
-----END PGP SIGNATURE-----

--ZuqvFG62+4JL9ncV--
