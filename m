Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 686027F15ED
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Nov 2023 15:41:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1B798A4A;
	Mon, 20 Nov 2023 15:40:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1B798A4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700491308;
	bh=fKSFDTPaD6Lcq6nGxYGityzYPzRmBFK23grRo+/lSPA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UlCZlkZwo5W0WVf/z8llStLLnpng49d3K3+S2KBWi+Yk0aBGC6djUkFqqsfIcLlkZ
	 kR3cSQ83oCVXRtYjgAezhlkfkjoj4OUzKa54JBpdiV1vWC51WnM6xvsXWCR3nNq9Wc
	 jFHvWm9PnnJojHSQaZ2Shyrq3LhdrpGro1VaMxc4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 963A3F80254; Mon, 20 Nov 2023 15:40:58 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3225FF80249;
	Mon, 20 Nov 2023 15:40:58 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7737CF80254; Mon, 20 Nov 2023 15:40:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 94253F80246
	for <alsa-devel@alsa-project.org>; Mon, 20 Nov 2023 15:40:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94253F80246
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=km2pYWqS
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B25EE612D2;
	Mon, 20 Nov 2023 14:40:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12022C433D9;
	Mon, 20 Nov 2023 14:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700491241;
	bh=fKSFDTPaD6Lcq6nGxYGityzYPzRmBFK23grRo+/lSPA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=km2pYWqSd0Akzz7o5kzivimfr413uygrPREk+75MALZPGzevA//nGj1CPjLaS6tia
	 hT7CZk+8Db35Jek1PHuWWP+fJIVcNv+TGwkouyWdN4Fhefe87L34bXIASzl+kGdxQB
	 UcUCfP0d/yC14aBvmUII0eZzNNTIjEQfqToI2CZtu/oWinDfAzuv81ovNdsueXlkHb
	 df4yUkxLFulA6pDBumapL3Kls1r7Z/B2+5GEsYAFgrHhvqx3Uy6R2knCT8EZuxAUPj
	 I1vOsuW9eQ9Pydu1WOb/6y+yxLVF+F+4EYb2e3HgMhPSfpfx3NjRtcg8wnVkCjyIXp
	 WTfdDap97Q4RQ==
Date: Mon, 20 Nov 2023 14:40:36 +0000
From: Mark Brown <broonie@kernel.org>
To: Maciej Strozek <mstrozek@opensource.cirrus.com>
Cc: James Schulman <james.schulman@cirrus.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] ASoC: cs43130: Allow driver to work without IRQ
 connection
Message-ID: <7248897a-0b59-4cdc-9915-d3297f2d6efe@sirena.org.uk>
References: <20231120141734.76679-1-mstrozek@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ngykg7d4U2ShnusP"
Content-Disposition: inline
In-Reply-To: <20231120141734.76679-1-mstrozek@opensource.cirrus.com>
X-Cookie: <Manoj> I *like* the chicken
Message-ID-Hash: RHGHVWUAAR65EIZ3TS22ZKO7HBJOCR3B
X-Message-ID-Hash: RHGHVWUAAR65EIZ3TS22ZKO7HBJOCR3B
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RHGHVWUAAR65EIZ3TS22ZKO7HBJOCR3B/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--ngykg7d4U2ShnusP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 20, 2023 at 02:17:34PM +0000, Maciej Strozek wrote:

> +	if (cs43130->has_irq_line) {
> +		ret = wait_for_completion_timeout(to_poll, msecs_to_jiffies(time));
> +	} else {

If you just put a return here then you don't need the else and can
reduce the intentation level of the rest of the function, making it more
legible.

> +		if (to_poll == &cs43130->xtal_rdy) {
> +			offset = 0;
> +			flag = CS43130_XTAL_RDY_INT;
> +		} else if (to_poll == &cs43130->pll_rdy) {
> +			offset = 0;
> +			flag = CS43130_PLL_RDY_INT;
> +		} else if (to_poll == &cs43130->hpload_evt) {
> +			offset = 3;
> +			flag = CS43130_HPLOAD_NO_DC_INT | CS43130_HPLOAD_UNPLUG_INT |
> +				CS43130_HPLOAD_OOR_INT | CS43130_HPLOAD_AC_INT |
> +				CS43130_HPLOAD_DC_INT | CS43130_HPLOAD_ON_INT |
> +				CS43130_HPLOAD_OFF_INT;
> +		} else {
> +			return 0;
> +		}

Is it a bug to call this function without to_poll set to something
known?  This will just silently ignore it which seems wrong and is
inconsitent with the handling in the interrupt case which will wait for
the the completion to be signalled and report a timeout on error.

> @@ -2545,8 +2579,10 @@ static int cs43130_i2c_probe(struct i2c_client *client)
>  					IRQF_ONESHOT | IRQF_TRIGGER_LOW,
>  					"cs43130", cs43130);
>  	if (ret != 0) {
> -		dev_err(cs43130->dev, "Failed to request IRQ: %d\n", ret);
> -		goto err;
> +		dev_dbg(cs43130->dev, "Failed to request IRQ: %d, will poll instead\n", ret);
> +		cs43130->has_irq_line = 0;
> +	} else {
> +		cs43130->has_irq_line = 1;

This will treat probe deferral as the interrupt not being supplied, and
will squash even real errors silently - it should probably check for
both the specific error the clock API returns when no clock is provided
by the firmware and probe deferral and handle both specifically.

--ngykg7d4U2ShnusP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmVbb+QACgkQJNaLcl1U
h9ANtQf9HpUItxdNu8HZE7UjElxpRzAIFKCaS3TPUtFoTXoNzA+4OKON8YPVsS2q
/Layk4N8U75c4dANNdQ2gj+PvJcsclCig5JowC3T4+DI5OnvuDwgsdRO3YXpSZUx
nwEEJ9F5s1M+YcOpSqmyRK7DIzd7oAySK/omwlETb6xBZxjYuLLAmgIiUl6YUzMk
2TGL2kz1Bue2lVfMoDAHUKm3ciJSjqEZf6yqcLDrBziUYKQHZwInggmGh2Wcn1JP
IOEQWDZBGtTSw+m6X2Y48QnWRVxNiYtwRHamlAlEnXCUKEWwD11x5VWAViGmFhMa
8KqsU+/V7+hpI4BkPQ+jhjhDw8VQQQ==
=M67k
-----END PGP SIGNATURE-----

--ngykg7d4U2ShnusP--
