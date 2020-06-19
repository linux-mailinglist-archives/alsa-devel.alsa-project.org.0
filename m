Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D94822014BD
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Jun 2020 18:19:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A4F2167E;
	Fri, 19 Jun 2020 18:18:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A4F2167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592583573;
	bh=lrCRWa0UIx9dDmqzEpeeKTZbbW/BkHejRfk5aTaPA0s=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BZq+RMIpMuU399guSMZujI3WyUCw15ifWReOR4brboe1TaMZ1v1e1mnhwNB6pwI9j
	 HZs+IyMC7ql3QTGE8AoAsLx0IwRMMS0q7YoLQQI3KkPyAZZRpay9D71BQFtkp7J1xU
	 RXnxROxtAaMUnapqRMasXWAuhDZe1zkkeGb8uqGo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C98EF80255;
	Fri, 19 Jun 2020 18:17:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9CBE9F80252; Fri, 19 Jun 2020 18:17:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C3C81F800EF
 for <alsa-devel@alsa-project.org>; Fri, 19 Jun 2020 18:17:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C3C81F800EF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="k5YSysoM"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CE0612168B;
 Fri, 19 Jun 2020 16:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592583459;
 bh=lrCRWa0UIx9dDmqzEpeeKTZbbW/BkHejRfk5aTaPA0s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=k5YSysoMqSjDMlPIERn0w3HYpHc/5pJvaQU1T6Tmoqtt/HbjZy1HVKEi1x5Xd26MV
 jQFPBYsIA4ThGvHdkgY39OKVPdIuQDDhXS0E1k4oK++yDMgCHffz7moWCJzdCpAOGK
 RYaE5sOP2/Azu4Mt+RBGBj3snX+LABK8PjZdHYis=
Date: Fri, 19 Jun 2020 17:17:37 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 01/16] ASoC: soc-component: merge
 snd_soc_component_read() and snd_soc_component_read32()
Message-ID: <20200619161737.GA6251@sirena.org.uk>
References: <87tuzb4mjg.wl-kuninori.morimoto.gx@renesas.com>
 <87sgev4mfl.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="UlVJffcvxoiEqYs2"
Content-Disposition: inline
In-Reply-To: <87sgev4mfl.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: Q:	Are we not men?
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
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


--UlVJffcvxoiEqYs2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 16, 2020 at 02:19:41PM +0900, Kuninori Morimoto wrote:

> -	snd_soc_component_read(component, PW_MGMT1, &mgmt1);
> -	snd_soc_component_read(component, PW_MGMT3, &mgmt3);
> +	mgmt1 = snd_soc_component_read(component, PW_MGMT1);
> +	mgmt3 = snd_soc_component_read(component, PW_MGMT3);

It's a bit sad that we're loosing the possibility of error handling with
this stuff, but OTOH looking at how much useful error handling we're
actually doing here it's hard to argue that it's much of a loss.  Ho
hum.

--UlVJffcvxoiEqYs2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7s5SAACgkQJNaLcl1U
h9Bkiwf7Bf1cYWscUKuukv4CmlUNVfcQp3BtG38eTyOnWHTul7Lt2uAcuxM5W+YT
BLVvnbVjXBuoh5i6UxYHzANWIOhceoYOFdTgrV6kjGowt8HRMAcEAOpBFoHx2p79
dLsPHZwPC4wez8q5Roqt3ziGaN0Z12vIn9gRlHKigVwEOUHKuepDX9XVldz5Nrw6
dHdAVwWDUxQbDEV+nYlwiAU3SCnxpUmhvg7BSdnGAL6dxR6XSN1MuDdlozq7TjK3
qSCnuUITkRJuWl27CLl/KhJmWe28TFdjfHT5++O3JME5d9Fm50xCUbOsysM4wu7y
0GCyqoUovPU0xg8QUCP+gl1NiU04MQ==
=/KdC
-----END PGP SIGNATURE-----

--UlVJffcvxoiEqYs2--
