Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DA353D79D7
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Jul 2021 17:33:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B438A1F0C;
	Tue, 27 Jul 2021 17:32:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B438A1F0C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627399979;
	bh=qZESz2Li7SATc5n/S6HM1Gg3kMqcExVqNUr1UA+V4Wo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YicKFgITdpNDP/OU3nXJrPRSXKF4tbS1Vf0sWBgD6Zf7XAMVy6CuOqTyZ/j10E7xH
	 tUsVqfqpX2yCPknI1inDSQ7yHSh3+uAPaXBNB/XlyS6uY9p+hFWsESzqe0qZ8BbxvI
	 N7knxeGHlI7ytnD3syUST8k6dKv0MgdfSPOCALuE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3CFE9F80276;
	Tue, 27 Jul 2021 17:31:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A73B5F8026C; Tue, 27 Jul 2021 17:31:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 53C36F80212
 for <alsa-devel@alsa-project.org>; Tue, 27 Jul 2021 17:31:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 53C36F80212
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="VkFAJMuI"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9F61561AA9;
 Tue, 27 Jul 2021 15:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627399878;
 bh=qZESz2Li7SATc5n/S6HM1Gg3kMqcExVqNUr1UA+V4Wo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VkFAJMuIuJRLYWiWzNvJz7VNxdeVQIPKMdoaG2qK9DXZlL04OqSIsQvVdd1XhWtFP
 cPCRA3jwLzDMfIOFaikQSGiUSgNAUN7MI5tR4yr5zA6sJuy1xKtfxNQypb+qroXjE9
 gFNbjaLP7Em2MwJeYh48cBo/QBmS/a+6ky7jPV8VbdkXHjsxquSPSn54X13ufM0uCS
 rFXE2McP4rVYhQVBrP3ZOwt4pagfPwNjmOq3GpkGlMUjfLLunnL8yqoNDvu+eALVSc
 fqyyrfmTh9HY7oVTZQfjlw6POrdb66EuTIwr2S8TwQQ+aFigmtKvJBp4c3o2JGzY/7
 MB/hhukbShm9Q==
Date: Tue, 27 Jul 2021 16:31:08 +0100
From: Mark Brown <broonie@kernel.org>
To: David Rhodes <drhodes@opensource.cirrus.com>
Subject: Re: [PATCH v4 2/2] ASoC: cs35l41: Add bindings for CS35L41
Message-ID: <20210727153108.GU4670@sirena.org.uk>
References: <20210726223438.1464333-1-drhodes@opensource.cirrus.com>
 <20210726223438.1464333-3-drhodes@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="BrzieSmlpF6NDzIw"
Content-Disposition: inline
In-Reply-To: <20210726223438.1464333-3-drhodes@opensource.cirrus.com>
X-Cookie: Vini, vidi, Linux!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: robh@kernel.org, brian.austin@cirrus.com, ckeepax@opensource.cirrus.com,
 patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 david.rhodes@cirrus.com
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


--BrzieSmlpF6NDzIw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 26, 2021 at 05:34:38PM -0500, David Rhodes wrote:

> +  cirrus,right-channel-amp:
> +    description:
> +      Boolean to determine which channel
> +      the amplifier is to receive the audio data on. If present the
> +      amplifier receives data on the right channel of I2S data.
> +      If not present the amplifier receives data on the left
> +      channel of I2S data
> +    type: boolean

Does this need to be in the DT or could it be a runtime control (eg, for
a system that supports being rotated to adjust which speaker things go
out of).

> +  cirrus,amp-gain-zc:
> +    description:
> +      Boolean to determine whether to use the amplifier
> +      gain-change zero-crossing feature. If the feature is enabled, any
> +      user-controlled amplifier gain change will occur on a zero-crossing point.
> +      (Default) Disabled
> +    type: boolean

This is usually a runtime control too.  This applies to a bunch of the
properties TBH.

> +  cirrus,classh-bst-overide:
> +    description:
> +      Boolean which will disable Class H tracking and
> +      set Boost voltage to the value in the 'boost-ctl-millivolt' property
> +    type: boolean
> +  cirrus,classh-bst-max-limit:
> +    description:
> +      Value set to the BST_CTL_LIM_EN field.

At some point in the file we stop having a blank line between the
properties.

> +required:
> +  - compatible
> +  - cirrus,boost-peak-milliamp
> +  - cirrus,boost-ind-nanohenry
> +  - cirrus,boost-cap-microfarad

The driver has regulator support but there's no regulator properties
documented anywhere in the binding document.

--BrzieSmlpF6NDzIw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmEAJrsACgkQJNaLcl1U
h9D9bwf6AyJb60vLtROnnuA2F8E1uHDs9QP5lkZtDRlzW+71AdMvrk0fEG2OiMsZ
gFyTzFwbEddKWWDdm0Io6yVmJgP5gl7eLWYD8J7rNfCGfAW9sl4yzDoEgfALlbe6
TbN4/w3pX5VH2lr7PgF35SGGWf3guNprFw/o3Kv+UIq3lieGCxc7MX60QHY2QXh5
EeMCRUIcJdKJ8llbujb0GiMjnm46gg2HHO9HwAOqpfl5enNhS/W7VnQ5YJlMEo7g
xL7xkYxaN6AXP+g2JiiCjOlTMOiNTGdf6Rx7ShiSZf9HHDsQdQUyymuxtSk+WfrJ
sOTnAKLhBewvm7Ftxs+NG4v2C7ylsg==
=d14o
-----END PGP SIGNATURE-----

--BrzieSmlpF6NDzIw--
