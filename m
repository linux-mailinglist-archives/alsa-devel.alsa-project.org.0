Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D57009855E2
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Sep 2024 10:54:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 858FAB60;
	Wed, 25 Sep 2024 10:54:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 858FAB60
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727254483;
	bh=1zWwlFWmFVwYVAzytW6yvqI5W4QRdh3sKMqwLclSRPM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=c6NK0usTngqptQus+4ywqdXRICu1q05ffhYwedfcgDj3m2UKZtXsku1avZ7OPxepJ
	 vqfeXVKRYSvR5tDpxOebtu1X/fxW+jBZWFXuwAqiDS+V2pKR1ZlgHzV4t5lYDAnWyx
	 sgMa8JGwwkmBNqh9fcmdWzLW6eIt0Q1bSl8anHW0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1C68AF805B2; Wed, 25 Sep 2024 10:54:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 14F1FF805B2;
	Wed, 25 Sep 2024 10:54:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5F2D4F802DB; Wed, 25 Sep 2024 10:54:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7680DF80074
	for <alsa-devel@alsa-project.org>; Wed, 25 Sep 2024 10:54:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7680DF80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Evv4akEb
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 18AFAA43D5F;
	Wed, 25 Sep 2024 08:53:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15D1DC4CEC3;
	Wed, 25 Sep 2024 08:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727254441;
	bh=1zWwlFWmFVwYVAzytW6yvqI5W4QRdh3sKMqwLclSRPM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Evv4akEbOILJlNV7aFx1NjrXQX5vMFBvUQXuYWx6lTqjoogKLcK+mJ6vpmFUiGPft
	 hRawpDFDggiD01yqjpHqZKXfhtvKDqcwuwQQoerRyAPAMZVSVHHSlTt2lg7kgZZ3Ol
	 Rce5zTXOiLYjHyNKybBGR4P3gRB72YoWHCIZwlNLoPSi4Qup1HyTlPZeflgMgXbXJS
	 WeRgnlgQgdWIP1eQMwsnJPH39XxnDgF+2j7bz83p0z83SIP7tRURML5qYh6RLlivNS
	 iYlVawl3a0YUDW2dTIRnPi64KNEAwuhrOTc7uvLs5ckmR+bPNnZDwwQls2ADWIARqf
	 h9feHkD2TSU0Q==
Date: Wed, 25 Sep 2024 10:53:57 +0200
From: Mark Brown <broonie@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Alexey Klimov <alexey.klimov@linaro.org>,
	srinivas.kandagatla@linaro.org, a39.skl@gmail.com,
	linux-sound@vger.kernel.org, lgirdwood@gmail.com, perex@perex.cz,
	tiwai@suse.com, alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	krzysztof.kozlowski@linaro.org, vkoul@kernel.org,
	klimov.linux@gmail.com
Subject: Re: [PATCH REVIEW 1/2] ASoC: codecs: lpass-rx-macro: fix RXn(rx,n)
 macro for DSM_CTL and SEC7 regs
Message-ID: <ZvPPpfobvDmmTCfi@finisterre.sirena.org.uk>
References: <20240925043823.520218-1-alexey.klimov@linaro.org>
 <czlx4thp7thnb6jrauilpbtzgbq637rmnwlpifxq5b5jfa3lqm@toyy3b2viscr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="irEqxi+ka1OxLIPG"
Content-Disposition: inline
In-Reply-To: <czlx4thp7thnb6jrauilpbtzgbq637rmnwlpifxq5b5jfa3lqm@toyy3b2viscr>
X-Cookie: Editing is a rewording activity.
Message-ID-Hash: CV22FG2IPDSVBKDQ5ATPREH2JDPIZHEQ
X-Message-ID-Hash: CV22FG2IPDSVBKDQ5ATPREH2JDPIZHEQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CV22FG2IPDSVBKDQ5ATPREH2JDPIZHEQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--irEqxi+ka1OxLIPG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 25, 2024 at 11:27:54AM +0300, Dmitry Baryshkov wrote:
> On Wed, Sep 25, 2024 at 05:38:22AM GMT, Alexey Klimov wrote:

> > +#define CDC_RX_RXn_RX_PATH_SEC7(rx, n)		\
> > +	(0x0434 + rx->rxn_reg_stride * n + n * (n - 1) * rx->rxn_reg_stride2)

> This is a nice hack to rule out n=0 and n=1, but maybe we can be more
> obvious here:

> (0x0434 + stride * n + (n > 2) ? stride2 : 0)

Yes.  We could also use some brackets to make the + and * precedence
obvious.

--irEqxi+ka1OxLIPG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmbzz6QACgkQJNaLcl1U
h9BAYQf/YgiwTSgbZyHotiHwyPV5y+CGjF1uCjiLDGpUl6fQvcBBXnFs7kg0zBGn
awD0JqOtywgMW7B9hdvskzi9mThnJq4ab8sWB39c9RPvYYKswcsaNj10LxURjxfX
WWmg08RzTKSnqubd5tijYAdg++OfwcAPbU9C8ZxyHs+xPgJOYNveWH9DUDu7p+ga
tQSZkc5OArWpAtPNiQJR2r3b7Ys6YIk9vOZfrPWy2WGGM/duR8bvy0V2yyndEWo0
fA3XF+1HQ4BPmHOVcpvqhBrrGqYunoK2VT1dqhdmWJsu9OS9CedPwbXsx9p7WHbt
FzSoZOaCJJmax5da7Yx2OpdpQjf+XA==
=Xc1o
-----END PGP SIGNATURE-----

--irEqxi+ka1OxLIPG--
