Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9708939A160
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Jun 2021 14:46:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EDDC41709;
	Thu,  3 Jun 2021 14:45:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EDDC41709
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622724404;
	bh=/0PErPiivKve18T5PWrNZSDblM4Yr8THdIMojDFkKIY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mh8zku60CW2r5SPNLFuG//Iqxt9b5oGkqJsRST0NhqYzLnLqWkXpa8QnUuORLscGD
	 xDSUpYH2Y/NgzI5hC00LFauEh+bMVEc5o7I7bti0OULgjnP7rTIOhHzTaaCgXISPbu
	 EBHgCOgs07x3YN6Ce/sZVO4mIhq6POg4FMwXuqVM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4FCE3F8025B;
	Thu,  3 Jun 2021 14:45:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6CDECF80254; Thu,  3 Jun 2021 14:45:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 03B63F80100
 for <alsa-devel@alsa-project.org>; Thu,  3 Jun 2021 14:45:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03B63F80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="SfNLIlaH"
Received: by mail.kernel.org (Postfix) with ESMTPSA id CA11B61359;
 Thu,  3 Jun 2021 12:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622724307;
 bh=/0PErPiivKve18T5PWrNZSDblM4Yr8THdIMojDFkKIY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SfNLIlaHMkXy6z2Nwq1e62IgDvqFsiO17qMHNj+BAuK2eBbID038FOpOVRQg+VmnD
 gmLsesbPwihI4Y/q1165NFrTqwMWmXUeK56e/fiyQXTNL7RiuoG0YJjJiFyNgKqjnt
 ZsZYJZGbapXCve5ek6JvhtPxuHy4kZqQA6z5NAK9ou5R+n6M+aqxW17tR4VD2Azc9m
 4MRRnNhNo/pEngG66YpM4ar12j3QrXpHPNzabijjh2g66ra2vas1ZIFTxdQR41m1a6
 7RFq/PLwuk6oL+9eLZXZpBnbllg0qzBx+7yLE11RrgkubbjjFVf30Lp2cGf+ZQmUXs
 fT278QpB+0Rog==
Date: Thu, 3 Jun 2021 13:44:55 +0100
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v2 2/4] ASoC: codecs: wcd: add multi button Headset
 detection support
Message-ID: <20210603124455.GE4257@sirena.org.uk>
References: <20210524110700.27077-1-srinivas.kandagatla@linaro.org>
 <20210524110700.27077-3-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="+JUInw4efm7IfTNU"
Content-Disposition: inline
In-Reply-To: <20210524110700.27077-3-srinivas.kandagatla@linaro.org>
X-Cookie: Where am I?  Who am I?  Am I?  I
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: robh@kernel.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com
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


--+JUInw4efm7IfTNU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 24, 2021 at 12:06:58PM +0100, Srinivas Kandagatla wrote:

> +		break;
> +	default:
> +		break;
> +	}
> +	return 0;
> +}
> +EXPORT_SYMBOL(wcd_mbhc_event_notify);

Why is this not EXPORT_SYMBOL_GPL?  Same for the other symbols that are
exported, between ASoC and regmap I'm not clear that there's anything
useful that is usable from non-GPL code...

> +	/* Report insertion */
> +	if (jack_type == SND_JACK_HEADPHONE)
> +		mbhc->current_plug = MBHC_PLUG_TYPE_HEADPHONE;
> +	else if (jack_type == SND_JACK_HEADSET) {
> +		mbhc->current_plug = MBHC_PLUG_TYPE_HEADSET;
> +		mbhc->jiffies_atreport = jiffies;
> +	} else if (jack_type == SND_JACK_LINEOUT)
> +		mbhc->current_plug = MBHC_PLUG_TYPE_HIGH_HPH;

This would be more idiomatically written as a switch statement.

--+JUInw4efm7IfTNU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmC4zsYACgkQJNaLcl1U
h9AHcAf+MAkcShDyOY9iT0Adnp0ijXBX3S6aae7O09/0QaNOvBIWj8b14Iokai81
8r5zFAdH/G8zkVmTIsqEZBZL/3qOWFKUy9mmOIuNkiAAUvoDUZr+Bsk/qcca+SNu
kdlOcue5k8z2We9SBIvF6kxV9LXH4eSw5Le0mJCqEP+/Bj9gViF/EWiOBaJZNJPl
f41hiDlJuG1PyKpDw6OFsulvOtOdgVrBPC+eJThbgi0Ox+gL8BPil5iznwVOuMd1
ca31v0Us5t8lF/GoFCmUgM+7J8k5JKk/LPvSph2oIPXWucW2xsyPLN0va5BPM7/7
y8OCKNeIUnX5pIRwldewtdbEaKa4YA==
=46e+
-----END PGP SIGNATURE-----

--+JUInw4efm7IfTNU--
