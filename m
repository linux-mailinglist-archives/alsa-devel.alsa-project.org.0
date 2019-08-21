Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B245C97A3C
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Aug 2019 15:01:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 08A801616;
	Wed, 21 Aug 2019 15:01:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 08A801616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566392511;
	bh=VQfEitPbBExtmPwPoEFEmZGIXRXK5zFwgImnp/xVVCA=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jP1VTnYYFL2HrfUOWPNnLjt4iFyh6GN9op9LhYsU8Xy1bbljBKfKR4U4r7mifmmku
	 nDkcjw+x3Mhz2b1d0QFNJZpBvMMkOIKWrB08Kgbr6RaOoqUvGl8a7c2SrUVAFLG2V+
	 fI6rsdfGfydcUi8LnbXxS4JI242Y0nsnxvf6UzB8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EC521F80306;
	Wed, 21 Aug 2019 15:00:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6688AF80306; Wed, 21 Aug 2019 15:00:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-wm1-f98.google.com (mail-wm1-f98.google.com
 [209.85.128.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B3613F800BF
 for <alsa-devel@alsa-project.org>; Wed, 21 Aug 2019 14:59:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B3613F800BF
Received: by mail-wm1-f98.google.com with SMTP id f72so2021206wmf.5
 for <alsa-devel@alsa-project.org>; Wed, 21 Aug 2019 05:59:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=MByKXfqnDA0/TEXshC73r4nKlG/9wq5CsnqAlVuFWLI=;
 b=BdpsVofjz3wyOulDacYdBjjegLl2ImhJ9rtMMJKAW6V3YUydioxEvW/7MO5wz5bnc5
 VN0GHNdDfj4TOvFmfu5Ti7pboxWKy170TFct1vqHii81bk6ryOQnGLOQ6Rkwdbf4bJuw
 2qY62cieGhqqi3W2bXuTRS3lH8TNGwmqIjcJlbqdE3aP9K6fW4UyWBtfhjj0CCiBpDmE
 oqdHjWA3n6RXiLEkQ53elIbObJl4t7kZ5HS0FDwdGvQBda7IC7Ylsa1G14QSWa8R+9ZG
 RyhaOXemtGHoggnwqCZElMVHageGrobnyaea+pJiulsrKSk6lmTMzDNVmU1glIqoI4y/
 G4Ow==
X-Gm-Message-State: APjAAAUtTs9bx0rRDWcRkxnQok4TcSO9OzSkue/0nTLkZ9UnP48Nhdt8
 RdyOyY5W7aTRrk9kW918k5GnHV/jx5gVJ84era65Eiho2HwusqnT5VpyZYjvpBV/TQ==
X-Google-Smtp-Source: APXvYqxslqShgIrUOarus+V+FX8T/WQBuHgvil/7NAQjmMooPd6aBaEJyv9A5KZgpJsxsL2ZiZGRfRXjNA3X
X-Received: by 2002:a1c:b6d4:: with SMTP id g203mr5994494wmf.100.1566392397638; 
 Wed, 21 Aug 2019 05:59:57 -0700 (PDT)
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk.
 [2a01:7e01::f03c:91ff:fed4:a3b6])
 by smtp-relay.gmail.com with ESMTPS id w10sm328905wre.38.2019.08.21.05.59.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Aug 2019 05:59:57 -0700 (PDT)
X-Relaying-Domain: sirena.org.uk
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1i0QDV-0007Fw-EA; Wed, 21 Aug 2019 12:59:57 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 86AD5274112A; Wed, 21 Aug 2019 13:59:56 +0100 (BST)
Date: Wed, 21 Aug 2019 13:59:56 +0100
From: Mark Brown <broonie@kernel.org>
To: Jaska Uimonen <jaska.uimonen@linux.intel.com>
Message-ID: <20190821125956.GJ5128@sirena.co.uk>
References: <20190821123252.30920-1-jaska.uimonen@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <20190821123252.30920-1-jaska.uimonen@linux.intel.com>
X-Cookie: Sic transit gloria Monday!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Jaska Uimonen <jaska.uimonen@intel.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: SOF: topology: fix get control data
 return type and arguments
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
Content-Type: multipart/mixed; boundary="===============0282348963489296831=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============0282348963489296831==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0FRtVia6Q6lt+M0P"
Content-Disposition: inline


--0FRtVia6Q6lt+M0P
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 21, 2019 at 03:32:52PM +0300, Jaska Uimonen wrote:

> +static int sof_get_control_data(struct snd_sof_dev *sdev,
> +				struct snd_soc_dapm_widget *widget,
> +				struct sof_widget_data *wdata,
> +				size_t *size)
>  {
>  	const struct snd_kcontrol_new *kc;
>  	struct soc_mixer_control *sm;
>  	struct soc_bytes_ext *sbe;
>  	struct soc_enum *se;
> -	size_t size = 0;
>  	int i;


> -		size += wdata[i].pdata->size;
> +		/* don't accept 0 size for data */
> +		if (!wdata[i].pdata->size)
> +			return -EINVAL;

This should really be a separate change.

> +
> +		*size += wdata[i].pdata->size;

We appear to be requiring that the size passed in is zero initialized
which is a bit unusual and seems likely to break even if it happens to
work right now.

--0FRtVia6Q6lt+M0P
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1dQEsACgkQJNaLcl1U
h9B1GQf+Oiobkwncu2CQ4291dJFDKKCFU4KkgiY5kGuBhPPiTVrIA0nS4HrOqYgV
8jRQzjcPgW5ie4adzXjFIqJZBYpfQd9S+v5TjHiYN13XpoYaO0ykr0BeSXFSXcKu
dz78s1vupShO0ZdkGMev4DkKDTos3exppu66mXUM9Mx+9yAfEfPCWZGchhFbzM9o
eHEuvO5Di1e/8DXi6X37OsCx+idd0Et4ryd9vlDCsjvx5BpP7dJpqBkhQUUj3W+z
rxWYN8URKz8OAbmt7Uuz8NLGunx6JVVbBMnFE89pRKIXVQnhE07iEjO0SyuO80ac
WPX7VdTMDD5krV3O3Fc4i4nb/nzwBA==
=DdyM
-----END PGP SIGNATURE-----

--0FRtVia6Q6lt+M0P--

--===============0282348963489296831==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============0282348963489296831==--
