Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D14D170FBE7
	for <lists+alsa-devel@lfdr.de>; Wed, 24 May 2023 18:46:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1EC8320C;
	Wed, 24 May 2023 18:45:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1EC8320C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684946760;
	bh=0u2MW2aLAiWF+iXBGwp0uD/2j7OwS91rgd6Dp/srwPw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rJ9jJmveyWE/rPPgaYs1qVKs4DUOn9rwBkv3FoVrEp328jk5Cdr2/dy4PpwcdM/9i
	 8AbURH2UzNVNbVMDk/rMH/mUEPqjqE+fz2x22vPVuWAoZBjftPOMCuTb2xEs02tkts
	 uq6+kg+FW2n50GSytnI6dtlau87iAiL+WkpRrkvk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 515BBF80548; Wed, 24 May 2023 18:44:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A0D94F80249;
	Wed, 24 May 2023 18:44:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 30B8EF8024E; Wed, 24 May 2023 18:44:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D5549F80053
	for <alsa-devel@alsa-project.org>; Wed, 24 May 2023 18:44:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D5549F80053
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Lv55bcss
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B12646344A;
	Wed, 24 May 2023 16:44:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0A6EC4339B;
	Wed, 24 May 2023 16:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684946690;
	bh=0u2MW2aLAiWF+iXBGwp0uD/2j7OwS91rgd6Dp/srwPw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Lv55bcssphrDQQvmCAu+CTTzNBn9A3NLdpJEuiOkUYphaGZO0ZWLtkmaL7fu/Tatt
	 Q8E6Baw/1+0WnmKGy6zJ/Hx82eTMU5/NMPLDe+m0fRpGKA2ZmEJkg+EluWackhd3o8
	 1RQInsLZbzC2UePTcwumIQOsWlarIvSDMIdOR41rPeN5sYGMCveQvU5tv5spaGxL4z
	 ctp0eZaBepBCgBx4THj3ONjuopgd4Khhe8xOUkoVvMBtdQVsVErpwJft3U0J6/o/UP
	 iA+Q98CLxd8AqvFC0fw4K/bojr1bW3rcXiFXgXNRVUzR7hUwmjhYyzYJFiCb2v5/7B
	 TVTbVgMM/2HVg==
Date: Wed, 24 May 2023 17:44:43 +0100
From: Mark Brown <broonie@kernel.org>
To: Chris Morgan <macroalpha82@gmail.com>
Cc: linux-rockchip@lists.infradead.org, alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org, zyw@rock-chips.com,
	sebastian.reichel@collabora.com, andyshrk@163.com,
	jagan@amarulasolutions.com, perex@perex.cz, tiwai@suse.com,
	lgirdwood@gmail.com, heiko@sntech.de, conor+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
	Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [PATCH 1/6] ASoC: es8328: Enabling support for 12Mhz sysclk
Message-ID: <bab1bdca-4254-43a4-b8ce-d1b59e5fb448@sirena.org.uk>
References: <20230523213825.120077-1-macroalpha82@gmail.com>
 <20230523213825.120077-2-macroalpha82@gmail.com>
 <f5b780ac-e079-4c24-9dfc-05aee52deb9c@sirena.org.uk>
 <646e3784.050a0220.71431.07f7@mx.google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="D8ZuulpqfGevSiIX"
Content-Disposition: inline
In-Reply-To: <646e3784.050a0220.71431.07f7@mx.google.com>
X-Cookie: You will be divorced within a year.
Message-ID-Hash: VEQGPKHTVOVIETER6US6C34EZ4H7MJIV
X-Message-ID-Hash: VEQGPKHTVOVIETER6US6C34EZ4H7MJIV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VEQGPKHTVOVIETER6US6C34EZ4H7MJIV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--D8ZuulpqfGevSiIX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 24, 2023 at 11:12:49AM -0500, Chris Morgan wrote:
> On Wed, May 24, 2023 at 12:57:02PM +0100, Mark Brown wrote:

> > The other constraints have separate rates and ratios, with wildly
> > different values between the two - the ratio (I'm guessing a clock
> > divider) being written to a 5 bit field which obviously can't contain
> > the actual sample rate.

> A bit over my head here, I saw this patch from the Rockchip BSP kernel
> branch and tested it on my mainline kernel. Long story short the clock
> for the mclk is 12000000. I see that there are similar issues for the
> ES8316 on the Rock 5B, so I will probably just wait for a proper fix
> there and then implement something similar here.

It sounded from the rest of the series like you don't actually want to
run at 12MHz anyway, you want a change which deconfigures the sysclk
when the card is idle - that'd allow it to be reconfigured as needed to
support the widest possible set of rates.  That'd be work in the generic
cards.

--D8ZuulpqfGevSiIX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmRuPvsACgkQJNaLcl1U
h9CKjQf/XHEUXXItHX5/gPBJ90ZKLi1OYX/JLxGuuYpAP9+nnC4ZMj0rF4xwm4wQ
rMQTGuyi6ogPip5lNSF+F+7UKRg/HzCp2mRFEU1rltLzkCF5GXZDtybewiUScQD+
DrUoNStDRb55MK8fyL8Q0WpNfF0mX61/qV4KVBKsUlaV4uMrXiJNzv0gNu0U7NHZ
HDHlCUVMxsY0bxuV+x33iYhxdkBlrR1JX65Fw1J2qxT4opc6SL8QwOkrljcKteuw
i24SN85wQvUyJNbcqwTOpI63d/+1rHNe4fwrKC5b+l6Dxi/p09OiEVrdIt5ILGbn
YFPwCAih9x6aYEAEUuZ2NGOeAnbkrg==
=aAXM
-----END PGP SIGNATURE-----

--D8ZuulpqfGevSiIX--
