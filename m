Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 905699503F3
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Aug 2024 13:43:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB088233E;
	Tue, 13 Aug 2024 13:43:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB088233E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723549414;
	bh=QPnuwFoAnkb9n+0YixvBFxqQZjB7ohOBsMqeqI4zqp0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=naX2arPKoHlqY+mRBOXroRGhYkmAd77HP/rubkEAB/2FgFZpFIsDaekC+Bl9xtkXI
	 LGu6wAdly/Fj1/bbJf2uwce3tZgT+flIRzQhSCVi8+HZl31P1gg5bp1coxVT6FqGSU
	 0SFsRGwI4qHv5bjV3E69gTk1ztDVLvF/ODR0RJfI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 50F58F8049C; Tue, 13 Aug 2024 13:43:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 74B1EF805B0;
	Tue, 13 Aug 2024 13:43:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 98F76F80423; Tue, 13 Aug 2024 13:35:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CCD94F800BF
	for <alsa-devel@alsa-project.org>; Tue, 13 Aug 2024 13:35:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CCD94F800BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=c+sHFPR1
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id DF4F8CE1294;
	Tue, 13 Aug 2024 11:35:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAC8BC4AF09;
	Tue, 13 Aug 2024 11:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723548934;
	bh=QPnuwFoAnkb9n+0YixvBFxqQZjB7ohOBsMqeqI4zqp0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c+sHFPR1SYZ9hcwXubjAD68XPNBiKSSi37HHxOHCKXafQqTC4YYcNl6Y9YzBcgUm2
	 I+FkeCRhu245lMhVP4SpyyLtHwbcM0QOBbxomJpm4bC9a+3rnftmywiQTsqriV7ed6
	 fe0Eg06IBXRCUZkq89jkFV7gK5DF3WjVkvNpmO0wWINwbLnuRgI6kPQurisDBFIOJC
	 nI1pd+P0vMaQV33Uhlw1wO3Ou2wtGWeRx9hD6RaxldHgfCllr9HIIZoT7k9Vo08Vck
	 b1QRDa1p8F5S1TIs4n0P6+OG6aBjyirSE6SmlTZF1AltDWfo6+MzcYSzW/Yt8ifJy5
	 BB/3PGehv6pHA==
Date: Tue, 13 Aug 2024 12:35:29 +0100
From: Mark Brown <broonie@kernel.org>
To: Zhang Yi <zhangyi@everest-semi.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.com,
	amadeuszx.slawinski@linux.intel.com, yangxiaohua@everest-semi.com,
	zhuning@everest-semi.com
Subject: Re: [PATCH] ASoC: codecs: ES8326: Adjust buttons
Message-ID: <c112c284-67a1-42b4-8e31-fca917487820@sirena.org.uk>
References: <20240813045149.106488-1-zhangyi@everest-semi.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3RCONXoBrp0wnWBv"
Content-Disposition: inline
In-Reply-To: <20240813045149.106488-1-zhangyi@everest-semi.com>
X-Cookie: Say no, then negotiate.
Message-ID-Hash: ZCQ5UCE45SMU65CESDOEXVCPKXIYRLRO
X-Message-ID-Hash: ZCQ5UCE45SMU65CESDOEXVCPKXIYRLRO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZCQ5UCE45SMU65CESDOEXVCPKXIYRLRO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--3RCONXoBrp0wnWBv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 13, 2024 at 12:51:49PM +0800, Zhang Yi wrote:

> To adapt to chrome, we have adjusted the buttons to match the system.

>  	case 0x4b:
>  		/* button volume up */
> -		cur_button = SND_JACK_BTN_1;
> +		cur_button = SND_JACK_BTN_2;
>  		break;
>  	case 0x27:
>  		/* button volume down */
> -		cur_button = SND_JACK_BTN_2;
> +		cur_button = SND_JACK_BTN_3;
>  		break;

This is really problematic, we're changing the keys reported here in a
way that's not ABI compatible.  If this was a new driver then fine but
this is quite old, it's in LTS releases, so we might be disrupting
people's existing systems.  I'm not sure we have a good solution for
this at this point, we're not even swapping the buttons here but rather
using a different set of buttons.  Probably ChromeOS needs to work
around this somehow, or we need to add some mechanism which allows
userspace to configure the driver mapping at runtime.

--3RCONXoBrp0wnWBv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAma7RQAACgkQJNaLcl1U
h9Dapwf/e52yytnpQlqAOh+Cug4Skiil7vcf5dPEZo9EY1sT8rjh2LKtLQKgtBuU
OFsSmVjlLza1h/NTweUKhXsCsDSqADcKuwKA83N4+PRMqNiboFVulgWX0F2+3KPS
jqGru5iGzt51MkqkAxqULf+uYEeeJO4a9NcQgwb0J5GQv2Q4ODXVXmJgt3htWx4J
oQolEbLvebdtE5f0GSWjIHeRFjZCqeIt2PWnxNih+1rI1jMLcybt7YRk8x55V1wL
T86N0R5x/i1ArOHisJ6bClOcKTIAmgfwgVtoVUehhQAqL79BzB9lPFZQKEEbKmO7
8ksecDr2l1EumecJ5/pAlgkMfLb8ig==
=KknK
-----END PGP SIGNATURE-----

--3RCONXoBrp0wnWBv--
