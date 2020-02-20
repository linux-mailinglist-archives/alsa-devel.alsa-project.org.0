Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 042C9166689
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Feb 2020 19:46:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 842D816DA;
	Thu, 20 Feb 2020 19:46:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 842D816DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582224417;
	bh=pha4rbkELR+MlKiZpAxJZCb6i63te+xfEwqIiyC67gE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZQXl0uswKnElPnfZBc/6ZwWiVplKXh7EUic9KoBOnL9pkPU5zIiF+REtR/Z3tWdH7
	 cWLkZ2zsBjtqLwO6tw+o92RGRj0x8XMCMzo1mWc7O72d/QhmAQ/u1Gj0GdMQdUPPKQ
	 JTA7Qmn2UBHtZ7E4vabX2A1Zb+xOiEwqjI0ndKMs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9AE7CF80101;
	Thu, 20 Feb 2020 19:45:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 289ABF80148; Thu, 20 Feb 2020 19:45:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 8B2FCF80101
 for <alsa-devel@alsa-project.org>; Thu, 20 Feb 2020 19:45:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8B2FCF80101
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AA4B130E;
 Thu, 20 Feb 2020 10:45:09 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1E7B63F6CF;
 Thu, 20 Feb 2020 10:45:08 -0800 (PST)
Date: Thu, 20 Feb 2020 18:45:07 +0000
From: Mark Brown <broonie@kernel.org>
To: Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH] ASoC: tas2562: Add support for digital volume control
Message-ID: <20200220184507.GF3926@sirena.org.uk>
References: <20200220172721.10547-1-dmurphy@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="hK8Uo4Yp55NZU70L"
Content-Disposition: inline
In-Reply-To: <20200220172721.10547-1-dmurphy@ti.com>
X-Cookie: You are number 6!  Who is number one?
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.com,
 lgirdwood@gmail.com
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


--hK8Uo4Yp55NZU70L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 20, 2020 at 11:27:21AM -0600, Dan Murphy wrote:

> +	/* Set the Digital volume to -110dB */
> +	ret = snd_soc_component_write(component, TAS2562_DVC_CFG4, 0x00);
> +	if (ret)
> +		return ret;
> +	ret = snd_soc_component_write(component, TAS2562_DVC_CFG3, 0x00);
> +	if (ret)
> +		return ret;
> +	ret = snd_soc_component_write(component, TAS2562_DVC_CFG2, 0x0d);
> +	if (ret)
> +		return ret;
> +	ret = snd_soc_component_write(component, TAS2562_DVC_CFG1, 0x43);
> +	if (ret)
> +		return ret;

Is there a reason not to use the chip default here?  Otherwise this
looks good.

--hK8Uo4Yp55NZU70L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5O07IACgkQJNaLcl1U
h9DAjQf/cHDeWkaSRl4OHbk2bFU+NNUeICiEs7d2VmUuNe3pOWY4jw6w2tx/LGZ0
s0Ikm3/e6VYxuCqbUND6kIbzypru4df7TSoxV8nR5/5vM1mbVGKh1/zB2pURJ0M3
ZY1fEqA2gZLpdyJD1HwryukT7PnyhzbK1ACp+cnvdI8W6X2sV/7pIe/W33EvuHj7
BrxixQa7E3SGdOa0MM7014WUsOhcuh7KPjKswKH9j/hKNGYlLB0FI02qFFUR0fkT
1aFocXH34YKqP2NDRyDSY/0yijWTlf02Sa0kDgaIgTrOrwjBAtNkj1QwgSVbT477
s9fpTvqt7E5DAudi/+TK2YsORkI5JQ==
=Q0Wc
-----END PGP SIGNATURE-----

--hK8Uo4Yp55NZU70L--
