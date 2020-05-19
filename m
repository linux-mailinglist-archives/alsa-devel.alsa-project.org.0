Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 34DF11D9572
	for <lists+alsa-devel@lfdr.de>; Tue, 19 May 2020 13:41:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DB4DB175C;
	Tue, 19 May 2020 13:40:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DB4DB175C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589888475;
	bh=bcWYvf7LQVHMDZmwFZQVAC9Pt0iGf6m3QVJzN4Qa7WE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RTI3lU9kjN86zqHkbRlAhWIKeUKjh3mbt0RF5INmHEWDyrtKP3rl0RCdAZPrSKh1w
	 Bq8wIKp1drYRLhvinNs5+NFB3nKbCY5A4jsfCKXeO8MIf2twnblmbJae8Tjd3jFY+L
	 NgXtaZIxVOOKoGFNM5fOphmsltmfjk0QxS4AlP50=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9547AF801F8;
	Tue, 19 May 2020 13:40:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A0F75F801A3; Tue, 19 May 2020 13:40:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3EEC4F80132
 for <alsa-devel@alsa-project.org>; Tue, 19 May 2020 13:40:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3EEC4F80132
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="sIvS1Ov3"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 21D8920709;
 Tue, 19 May 2020 11:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589888414;
 bh=bcWYvf7LQVHMDZmwFZQVAC9Pt0iGf6m3QVJzN4Qa7WE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sIvS1Ov3ZImuiz7Qk/XWcnHrXzE7vvTvDr9WPVawDCOygTxiItuIjoSz3TJvHsu4Y
 60+7NIquXL9kIkXo6e5i/ieq+rhCFo/0zi/3KbPGh5ne365UWnJ/his4doRQj2gYRL
 YjxmvMNyiOTFYLSVPDk6aqencJs1U8jOupWba1vk=
Date: Tue, 19 May 2020 12:40:12 +0100
From: Mark Brown <broonie@kernel.org>
To: "Mukunda, Vijendar" <Vijendar.Mukunda@amd.com>
Subject: Re: [PATCH v3 08/14] ASoC: amd: add ACP PDM DMA driver dai ops
Message-ID: <20200519114012.GH4611@sirena.org.uk>
References: <20200518171704.24999-1-Vijendar.Mukunda@amd.com>
 <20200518171704.24999-9-Vijendar.Mukunda@amd.com>
 <20200519111907.GD4611@sirena.org.uk>
 <DM6PR12MB2633954F20E044F44CA89D5497B90@DM6PR12MB2633.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="r5lq+205vWdkqwtk"
Content-Disposition: inline
In-Reply-To: <DM6PR12MB2633954F20E044F44CA89D5497B90@DM6PR12MB2633.namprd12.prod.outlook.com>
X-Cookie: Do not write below this line.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "tiwai@suse.de" <tiwai@suse.de>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
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


--r5lq+205vWdkqwtk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 19, 2020 at 11:37:39AM +0000, Mukunda, Vijendar wrote:

> > > +	case TWO_CH:
> > > +	default:
> > > +		ch_mask =3D 0x00;
> > > +		break;
> > > +	}

> > The TWO_CH define isn't adding anything, and I'd expect there to be
> > invalid channel configurations this is rejecting - at the minute this
> > just boils down to an assignment.

> Currently we have added two channel support.=20
> As of today, as we restricted no of channels to 2 , there is no point=20
> to check invalid configuration.
> It kept for future expansion to support more than two channels.

You should still return an error here, if nothing else it ensures that
this gets updated when support for other configurations is added.

> > > +	config_pdm_stream_params(ch_mask, rtd->acp_base);

> > Does this function have any other callers - is there a need for it to be
> > a separate function?

> Current ask is only to support 48Khz, 2 Channel streams.
> This is kept for future reference.
> This API works as place holder to expand the logic to support multiple
> sample rates and no of channels.
> Even we can discard this API , do in it calling API itself.

Even when you support more configurations these will be configured from
hw_params().

--r5lq+205vWdkqwtk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7DxZsACgkQJNaLcl1U
h9A6Mwf/e3EQZgv+uygFeYcsiPMckaAfbeAe60K0oo+1pBVIcJakyyW8fIPuuSfo
CF4dk/tZg8khTyTj0Z0tLH7qQTUHKiHsoqNlJwNvdCUKKqioTJennqC3SiDHfCRx
c7OtebI+TR7151K0Mf8FQqK3N+xLLVXyGp7WI/fV3F5a91MDmCit/HfAdCxVU/St
bRL+me2VnTQKBM59/9+/0DtdYRr1/I1YtH8GhvcochLjh0qtqoiQK3cjoQJIFjYz
56eHlf656Ybm3lSQpNLkOuqwc4+mGHaMr8IiJ3buPDgOyaMM0ueNfNNX6R8+0Xbw
fvqfcdDqPVeJ684mJe0tCBUJP/kA6w==
=shJO
-----END PGP SIGNATURE-----

--r5lq+205vWdkqwtk--
