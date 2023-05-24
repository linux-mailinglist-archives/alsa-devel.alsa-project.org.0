Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A0C270F19B
	for <lists+alsa-devel@lfdr.de>; Wed, 24 May 2023 10:59:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 58BDD1F9;
	Wed, 24 May 2023 10:58:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 58BDD1F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684918744;
	bh=D5d6mBIlSxvhMaND02II0k3IaiNYbeQM4kSCl9JoOmw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=V/aegddmG+92B1lUL8sh9i1xb+lWBImYJui2y10E3zQbRkhgAF8kktB/Nj90YHOMW
	 qZX8RDtRGPpbT+VcgoJJD7SBSC303QB76CPVGmRYjdq06R5ffL1ZdTAvG4ynSDGqVZ
	 yCclqCUpE80P020AFceqLewyB6AWtBoCzF+5tR50=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BF73FF80549; Wed, 24 May 2023 10:58:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 76E64F80249;
	Wed, 24 May 2023 10:58:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BA401F8024E; Wed, 24 May 2023 10:58:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7504CF80086
	for <alsa-devel@alsa-project.org>; Wed, 24 May 2023 10:58:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7504CF80086
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=g7cxjMCm
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 36ECB63B1A;
	Wed, 24 May 2023 08:58:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2EE4C433D2;
	Wed, 24 May 2023 08:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684918682;
	bh=D5d6mBIlSxvhMaND02II0k3IaiNYbeQM4kSCl9JoOmw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g7cxjMCmb6oKhOdh5jbG0/aWdwmk5EY0zmVXs9YHngGMybX5ACa6LQgQGPw/FUUTq
	 gaFb2Fa92W48YR2fBls55A0+2O2p6KIxnfd0i+ubwrP0imJWsWk1AdTOc1hB4oPk3e
	 qh9pUb1tM/UFqfqqdRv7qZWPQYk15beuM3ddznUrwb21n/E4K3zEjzwku+/uwOobh8
	 RnErEpSEndTGhIm1kEgLkmsWC5yXgTTMYS+ba63TwzTjFcSDZ8GAh+QbdIqTcndZlO
	 IOFbm2lwiJIuUq+eHJC9ZhQvn7bzU/D37n7Q9rClnDZTiYnqRrDV2jHC+eWr3dUy87
	 ahBYR23M9J8jg==
Date: Wed, 24 May 2023 09:57:57 +0100
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: perex@perex.cz, tiwai@suse.com, lgirdwood@gmail.com,
	ckeepax@opensource.cirrus.com, kuninori.morimoto.gx@renesas.com,
	linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH 1/2] ASoC: codecs: wsa883x: do not set can_multi_write
 flag
Message-ID: <d94e734c-e816-4b3f-9fb3-a6589063c05a@sirena.org.uk>
References: <20230523154605.4284-1-srinivas.kandagatla@linaro.org>
 <00283665-e44f-457b-b2c9-1acf59d1cbd8@sirena.org.uk>
 <c37b88ae-7f54-3c07-666f-010a5fd84bd1@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="etqstALKWZ9H8K4L"
Content-Disposition: inline
In-Reply-To: <c37b88ae-7f54-3c07-666f-010a5fd84bd1@linaro.org>
X-Cookie: You will be divorced within a year.
Message-ID-Hash: SAPCJ6RTAGK5YHU2V2OWCZA2QYQ3GG2F
X-Message-ID-Hash: SAPCJ6RTAGK5YHU2V2OWCZA2QYQ3GG2F
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SAPCJ6RTAGK5YHU2V2OWCZA2QYQ3GG2F/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--etqstALKWZ9H8K4L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 24, 2023 at 09:51:00AM +0100, Srinivas Kandagatla wrote:
> On 23/05/2023 17:55, Mark Brown wrote:

> > Does the CODEC support mulitple writes?  If so it seems better to leave

> No, the codec itself does not support multi-write. All the codec register
> level interface is via SoundWire Bus. which also does not support with the
> existing code.

I'm unclear, is this a limitation of the hardware or of the current
Soundwire code?

--etqstALKWZ9H8K4L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmRt0ZQACgkQJNaLcl1U
h9AOMgf/WO5YS4C+JsjQSfwCknP55UoFjGXPXq3xXsBDSAWWsAoYmn1YChO63rdG
SdIFrP/9qYLeBViWCnkc6eoDNAx/yCcgt2EOyNHe6AaOK1NFiFItGVfb0EZH9pzE
irNrK33iUtmj5wFJBS7/xk4G3zrW9rjd8PHIQw/f23uo+Ghv44zptBrOC8FCP4q+
wjbtQ/XzpsZlyudpHg1ABYEw4qdsML0F6cj+P/t8/Y0NCiYESnhBt6bazvEl2LAf
fcWuSbSrRxcyVyWgIGwwg/HRnXVROs8pX9kLlj/Y+ek8jHP5TObHNuiRrVh95OJM
o279APGUrW9DQldUk5LGDKDxNV8uIw==
=c42b
-----END PGP SIGNATURE-----

--etqstALKWZ9H8K4L--
