Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FBEA28425C
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Oct 2020 00:05:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 10C7817AB;
	Tue,  6 Oct 2020 00:05:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 10C7817AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601935557;
	bh=61XGn3T4xXkqPSTxzD7SbY0ibI+JKrb8n4iSHgAM7y0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qZS0M9MvvpW8Dt7IVDf7JG068SKQgiTBA/1GUM1iWgAzvkTn5tRkisqUtNgLfBsIW
	 nKYbAZIn4sSqBakIq/WS0/7CFDve1rxEsM+T/Ot1+K6JThPew5gHQ3X6pnsAN6J/A3
	 qeUdyHRBI0Nhf8CXU7AeBiyqW2I90KAoygtaL18A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 25A86F80245;
	Tue,  6 Oct 2020 00:04:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6B0EAF8025A; Tue,  6 Oct 2020 00:04:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A7DC8F80121
 for <alsa-devel@alsa-project.org>; Tue,  6 Oct 2020 00:04:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A7DC8F80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="1gBpJz92"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0AE0820665;
 Mon,  5 Oct 2020 22:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601935443;
 bh=61XGn3T4xXkqPSTxzD7SbY0ibI+JKrb8n4iSHgAM7y0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=1gBpJz925Mkt8c+LEOvzjBlUY34zwZ4R5sChRzuHHq+WnmNgSKKniEi+eZPyfK/F9
 5Ikbgm0zZNiVdIbgOceXhk+tfJqTEmfD31DwB8p/IJjhgrc8pn8TlnV4JmRTqNgh7j
 ib8sEne6DdcKGGfwIn+omKKqpgrR8QgnonfOou98=
Date: Mon, 5 Oct 2020 23:03:00 +0100
From: Mark Brown <broonie@kernel.org>
To: Primoz Fiser <primoz.fiser@norik.com>
Subject: Re: [PATCH 1/2] ASoC: fsl: fsl_ssi: add ac97 fixed mode support
Message-ID: <20201005220300.GL5139@sirena.org.uk>
References: <20201005111644.3131604-1-primoz.fiser@norik.com>
 <20201005114925.GC5139@sirena.org.uk>
 <bc31e0f2-969c-4eb1-1dc0-cf4284427a4b@norik.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="HBg0C3yr6HVa1ZCc"
Content-Disposition: inline
In-Reply-To: <bc31e0f2-969c-4eb1-1dc0-cf4284427a4b@norik.com>
X-Cookie: Most of your faults are not your fault.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Timur Tabi <timur@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>,
 Shengjiu Wang <shengjiu.wang@gmail.com>
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


--HBg0C3yr6HVa1ZCc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 05, 2020 at 02:59:53PM +0200, Primoz Fiser wrote:
> On 5. 10. 20 13:49, Mark Brown wrote:

> > If this is something that happens based on the CODEC shouldn't we be
> > doing this by quirking based on the CODEC the system has rather than
> > requiring people set a separate DT property?

> To be totally honest, we are not 100% sure if this is only CODEC's fault or
> something else might be causing these issues.

OK, the description made it sound like it was an interop issue with the
CODEC but if there's concerns about there being board related issues
then a property is fine.

> Additionally, we are using WM9712 codec and UDOO board is using VT1613,
> right? So these issues might not be CODEC related at all.

ISTR people had got the WM9712 (or was it WM9713?) working with some
i.MX SoCs.

--HBg0C3yr6HVa1ZCc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl97mBMACgkQJNaLcl1U
h9Ai9Af9EnetNzk27asZeCJEUdHxcx5lmB/10Xw9EZX8DNXzvfNdgSG4mKxKsNyz
+DRy92SDN7NXUUssT6807ne146GaVps7IEtaL0cN0h7O3xUVksrwts3lo/064MNs
BwqiHT7sB7+xjbDTSsHnvhdgcgB19Z/KkZ8euwkKjviD7MZ7d/gc6TcrsHetxjb5
E3oUYzUExSWwFKgLrd3Hl6kWAnllNqENh6ZvdVgQJK5YXTpaDvxD9qEW8Amzu6fC
pIUbIownl7b/hS/47s0mWdEToVhIV+O3Ff/touHfOSOL2HblGjDwMl81dZ88ch9E
wlNQd9ZlafSqiWdpuMXUdyFz0q28MA==
=t7Cu
-----END PGP SIGNATURE-----

--HBg0C3yr6HVa1ZCc--
