Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8964A54C64B
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Jun 2022 12:34:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E0BFF16E0;
	Wed, 15 Jun 2022 12:33:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E0BFF16E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655289280;
	bh=1J5FIdCXMTdaAREzoK9hwYKt1T9ZVL6B+SZnop3VnVg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EIomBCeY+2DA7t1paOvLmsAS7ACwGd9qHE38Zxe/ev96Fx96jeMXcvnKj9VI3NVg5
	 rXXj/GkE9dUMI+VpcntTJW8ypVjIEfGPjeuvAPb6v/hxFureCaU9NR/XPk4Wg+VNDX
	 VvyDaqrsO6hAHBXlWCqR4BKLfTokMVAC3Jtn8yG0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4BD79F8012B;
	Wed, 15 Jun 2022 12:33:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 38752F80162; Wed, 15 Jun 2022 12:33:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 50E41F8012B
 for <alsa-devel@alsa-project.org>; Wed, 15 Jun 2022 12:33:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 50E41F8012B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="I+w70pC8"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B348FB81D68;
 Wed, 15 Jun 2022 10:33:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F4D6C3411C;
 Wed, 15 Jun 2022 10:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655289209;
 bh=1J5FIdCXMTdaAREzoK9hwYKt1T9ZVL6B+SZnop3VnVg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=I+w70pC8ZPbD1S9qVrTDD7WcD736w3zQdRkBEPv95DCFnodoajia8Xr41uPX+V0+9
 So0HZEsWVReh4bJirWgS9hKoVNkkBE4p9nQ/rQMJhQow7i0YoxF/Lv6Ie6GDrJMTG/
 RF/T7zxQT6/P0fKIhYGTtltc3XNkG5FPOvh1/sMJABLfsI1Ymp+QMc1r1xxCiMtRKn
 XKiNTulrj1supnwV+t+VJ9/X36BcRCyJtS4fF/qdlwq7APXtrXCrwiI7Mb7ERdDq7c
 CCsL01YTqaJarU1wU94lgizcQqMVgg3w+Tm9WnGyCVgzdfAShAUWcUmYFNtcUfE2vq
 v3jQU9qY2uppA==
Date: Wed, 15 Jun 2022 11:33:21 +0100
From: Mark Brown <broonie@kernel.org>
To: Judy Hsiao <judyhsiao@chromium.org>
Subject: Re: [v1] ASoC: rockchip: i2s: switch BCLK to GPIO
Message-ID: <Yqm1cTfq1AA/mAV5@sirena.org.uk>
References: <20220615045643.3137287-1-judyhsiao@chromium.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="4CmsN/CfvM2oLYC0"
Content-Disposition: inline
In-Reply-To: <20220615045643.3137287-1-judyhsiao@chromium.org>
X-Cookie: byob, v:
Cc: alsa-devel@alsa-project.org, Heiko Stuebner <heiko@sntech.de>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
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


--4CmsN/CfvM2oLYC0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 15, 2022 at 04:56:43AM +0000, Judy Hsiao wrote:

>  	i2s->bclk_ratio = 64;
> +	i2s->pinctrl = devm_pinctrl_get(&pdev->dev);
> +	if (IS_ERR(i2s->pinctrl))
> +		dev_err(&pdev->dev, "failed to find i2s pinctrl\n");
> +
> +	i2s->bclk_on = pinctrl_lookup_state(i2s->pinctrl,
> +				   "bclk_on");
> +	if (IS_ERR_OR_NULL(i2s->bclk_on))
> +		dev_err(&pdev->dev, "failed to find i2s default state\n");
> +	else
> +		dev_dbg(&pdev->dev, "find i2s bclk state\n");
> +
> +	i2s->bclk_off = pinctrl_lookup_state(i2s->pinctrl,
> +				  "bclk_off");
> +	if (IS_ERR_OR_NULL(i2s->bclk_off))
> +		dev_err(&pdev->dev, "failed to find i2s gpio state\n");
> +	else
> +		dev_dbg(&pdev->dev, "find i2s bclk_off state\n");

This should really validate that it's got both on and off states before
we start using these, especially if we only have off, since we might end
up being able to do one side of the switch but not the other which won't
work.  I'm also wondering if it's better to just use audio active/idle
states rather than saying purely something for the BCLK - effectively
that's what this is doing and it feels like it might be cleaner and more
future proof for people to disable all the audio pins rather than just
BCLK and then switch them together.

--4CmsN/CfvM2oLYC0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmKptXEACgkQJNaLcl1U
h9DonQf/TZGhSlKwJZPQlFmypY1sEE1OjAFYsmr7k+A+owQ3xj2wv9RAPQrb2s5W
No05azxh5PaZe5ZbGA64pH7iDbDcGuffc2QxlnJZgA0vg+02kuZd3lSdcsXcaiDj
oq6oFh0qPN19Fftie3BNVhQ6NLIclG3fszY0eLn+O2VfSIPSb5BrwQJuEKUth1yR
GFAGoVg3kpU+7Vk3apesZhhqrvNLy8MtQ65h2Rn73tGJxPhsrWcqnLQ7dsg+seVO
U4go/CaOBnSS8Cm8zFoxdG9o6xGyPgabb6+uWVAR8ssRkvv4FqCWSl1IBxrSRDpC
XhYLgerh8VFllC0Rgb+v2CW81EFB5w==
=uIhh
-----END PGP SIGNATURE-----

--4CmsN/CfvM2oLYC0--
