Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F3F76E6518
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Apr 2023 14:57:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 115D7E72;
	Tue, 18 Apr 2023 14:56:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 115D7E72
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681822619;
	bh=HSBVQEr2YenXIsFg84DdNoNf25PlYiz5rIbOySfFikc=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cnrNLbjEo7I6KEkjeqZGYJV8/Iv9k8k6NmZFM+w1S11aGR/kN/jFaF6blN2XURqzG
	 Xg8u0gW9jav+dE1jmjNvTjMjaaLaOfNli02LlZ6GSenWg87wsN+tbGb6pVCkDe7Igr
	 Fhh6PU+4pLVGWg3Hr1/PaEsnHnnkLoim40oZQwc8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 65F08F80149;
	Tue, 18 Apr 2023 14:56:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 16775F80155; Tue, 18 Apr 2023 14:56:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4CBE5F800D0
	for <alsa-devel@alsa-project.org>; Tue, 18 Apr 2023 14:56:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4CBE5F800D0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=BpAjkp+2
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2870663479;
	Tue, 18 Apr 2023 12:55:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A320EC433EF;
	Tue, 18 Apr 2023 12:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681822558;
	bh=HSBVQEr2YenXIsFg84DdNoNf25PlYiz5rIbOySfFikc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BpAjkp+2LYPiA300PIvALCfoPj1m+xNP0kLMpqFa012MrW0N7DkaVTPp39UUdtYYK
	 CBKVaxgYORLb+2M5dk8LvHc8px0HZJcAgyUQpLT2pNWPR+wF9H2ptbHT58OcEoeYYm
	 xaQ1mIPyal6ptLC0VNPc1pFjm0sitRTp4CKW9fJESjT0fRMB+sRnc66B63Ms2RTBeE
	 BH6kh6L/P7aEB28c/vkRUWdpkx1l1vcrq5bVVq1rms+7fMYaNk/5KFrXpR4mMOXvcq
	 YFCVxHNaabrnEqwMymSAQfG1VPBPT3jhsoYiScrtQ2g9w7nvHUh2GJRZv4T8/SyPah
	 kdpifmB5NaFOA==
Date: Tue, 18 Apr 2023 13:55:53 +0100
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 1/4] ASoC: codecs: wcd9335: Simplify with dev_err_probe
Message-ID: <63a3b1c7-a68a-496c-99fe-9c936f4ebd94@sirena.org.uk>
References: <20230418074630.8681-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aPaN6pUpmk2Njt+z"
Content-Disposition: inline
In-Reply-To: <20230418074630.8681-1-krzysztof.kozlowski@linaro.org>
X-Cookie: Just to have it is enough.
Message-ID-Hash: 47TO4PMU3X5ERWE2ICJ5KAC7YCNPHLEZ
X-Message-ID-Hash: 47TO4PMU3X5ERWE2ICJ5KAC7YCNPHLEZ
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/47TO4PMU3X5ERWE2ICJ5KAC7YCNPHLEZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--aPaN6pUpmk2Njt+z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 18, 2023 at 09:46:27AM +0200, Krzysztof Kozlowski wrote:
> Replace dev_err() in probe() path with dev_err_probe() to:
> 1. Make code a bit simpler and easier to read,
> 2. Do not print messages on deferred probe.

>  	 */
>  	wcd->intr1 = of_irq_get_byname(wcd->dev->of_node, "intr1");
> -	if (wcd->intr1 < 0) {
> -		if (wcd->intr1 != -EPROBE_DEFER)
> -			dev_err(wcd->dev, "Unable to configure IRQ\n");
> -
> -		return wcd->intr1;

This is already not printing a message on deferred probe.

--aPaN6pUpmk2Njt+z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmQ+k1gACgkQJNaLcl1U
h9Argwf9FVUXbPmi43xza/mxro0zXAPflx5weIplmXJzMEUOk6arptqbRYUP08rn
MGe98MgbZI21r4uVM8VSyJmCG/FsyMvXaw39CrV6XeIJ/K8XUkeUQk1Y9oONTbuq
25jaOfawbhBOts5F8bQ5/hAniS+F7Tx/cUIuzVxsEgWP6evL+fqEXayQPUSiBE91
MJ+gcOVlBz8XkmVX+g/60wmmXYkNt9j8J0rKo+bN64MITZV/795m6JNZLzHnApI0
M1IXd5RadXtuFznJz8YPuWHLnBREoi2M06BskwkmIViZjJVykoIzRN0vSA74XGAK
OmRoIgcBQ0SYDhypfFBej5A8B2zx+w==
=P3mp
-----END PGP SIGNATURE-----

--aPaN6pUpmk2Njt+z--
