Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A60F80D40E
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Dec 2023 18:37:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 910CA823;
	Mon, 11 Dec 2023 18:37:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 910CA823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702316237;
	bh=Ako3lvIvEUfiqGQJq4GqRqTsaTMhVesj9bhTZOv+avA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sMLM0qby9l7IvftHN2z+DraruH8UiLluf0ZxVurWg6mb8sWVk1/opX6ibhQPqC6/B
	 ZqRTjjUtRAAljUIlTIZEdBPsKASy0g7k8vmH2zO8ELDfm+yPcd+K1FY/YQhiU8Gpyg
	 x1yDzzDu+afmLnaIJcEO/X0suDpf012LC4EF7j7c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 35613F8057D; Mon, 11 Dec 2023 18:36:45 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 54087F80571;
	Mon, 11 Dec 2023 18:36:45 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E4DE0F80166; Mon, 11 Dec 2023 18:36:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5A961F800D2
	for <alsa-devel@alsa-project.org>; Mon, 11 Dec 2023 18:36:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A961F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Cv1+xrqX
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id EB83FCE13AA;
	Mon, 11 Dec 2023 17:36:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1CFCC433C7;
	Mon, 11 Dec 2023 17:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702316193;
	bh=Ako3lvIvEUfiqGQJq4GqRqTsaTMhVesj9bhTZOv+avA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Cv1+xrqXoHFbWdUJLTpczJTYJa5136QAg8p6zLoBASeDwSQPJEGvfqHhPkQJxwAsj
	 6BZCcIbYNQq+GeQVeC8BWl3x+b2c9DBWhroFbuc6z8B2F0+aZMJWp54PixQoKCDFGt
	 jgJdPnLwggbppAuLR4+FzYF9wW5JVFrPbAxWtF6SUCOydC3D6/h+geJ6K7D5WKIPm3
	 8UACbWFhw/YQlJ8eO9XeJko/Mdo0d5j6xeTtN+y0fKPEJpwirXmqHAawBrRHO5df/v
	 GLcstuYk1daow0GukEskHUbPRdWxB8LF0oILCP8MCoOGBqY2KwnKRFO1RujcWxhzxg
	 6wCX045ThnJsw==
Date: Mon, 11 Dec 2023 17:36:26 +0000
From: Mark Brown <broonie@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] ASoC: dt-bindings: qcom,lpass-rx-macro: Add X1E80100
 LPASS RX
Message-ID: <a210dd57-a22f-41ab-8e3b-93fa1fd03a0c@sirena.org.uk>
References: <20231211123104.72963-1-krzysztof.kozlowski@linaro.org>
 <20231211-cardstock-elevator-3e19f9d41ac2@spud>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="n42/ISRIigQDPDMF"
Content-Disposition: inline
In-Reply-To: <20231211-cardstock-elevator-3e19f9d41ac2@spud>
X-Cookie: Better dead than mellow.
Message-ID-Hash: HR4YGIIUCZ5PLTIQRM4WOTI5KVPI3WXJ
X-Message-ID-Hash: HR4YGIIUCZ5PLTIQRM4WOTI5KVPI3WXJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HR4YGIIUCZ5PLTIQRM4WOTI5KVPI3WXJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--n42/ISRIigQDPDMF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Dec 11, 2023 at 05:29:50PM +0000, Conor Dooley wrote:
> On Mon, Dec 11, 2023 at 01:31:01PM +0100, Krzysztof Kozlowski wrote:
> > Add bindings for Qualcomm X1E80100 SoC Low Power Audio SubSystem (LPASS)
> > RX macro codec, which looks like compatible with earlier SM8550.

> > Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

> I wish you'd send cover letters when you send series of trivial patches
> like this that could be acked in one go.

In general any patch series should have at least a brief cover letter,
it makes everything work much better.

--n42/ISRIigQDPDMF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmV3SJkACgkQJNaLcl1U
h9DAmwf9FAyBzWGolz41aTQV/iYxTZfK4ZqEsyyThB9fYsQrPLVGYOw5PHpUTeul
0d88h6YldHkaT+pffLxlmSlq0D8H2XmOSsSjKE0/8RCLSZL4V5MgOksiQzQxsBUV
Sbrz2hfDZqYhg5bis2VHpjwrfdXjY7lrpOtGwomGqaecaAm7swTu3tyL7Eh23dBF
w4MpjYr20bJnbt7qwi32NxvzETYnVm0JFaX1biUkJtHowZpi55Z+9XydwmRWlvJZ
w6G3K+++zd8Wo+ViR1pYaHWOxlvLB0RXP0kEZtIiCeNAiaSOlIDcGMVwkyVGcPfF
FBb4ujCnVVxe6GlilQfyEDfJThkmJA==
=8Yu8
-----END PGP SIGNATURE-----

--n42/ISRIigQDPDMF--
