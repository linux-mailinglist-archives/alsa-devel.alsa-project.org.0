Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F32F6D2C1C
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Oct 2019 16:07:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7059B1673;
	Thu, 10 Oct 2019 16:06:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7059B1673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570716424;
	bh=wHwX7roALlG5dHlugBcp2wroCNVE/sFjF3dB88EVIHQ=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Sg3XK8jN50s4PlvV+LWim8Uhub9FbBbeqTrkOszSA6DYW1bPor6dcKk7YdQHuMoE4
	 A9hg+F+rDujxv4kCOSr6QuluEl7WtWXrSPlYjellz+2iHMeEMD2Cvl1KpuNybeZb+1
	 CDoRrIpEvwFYSEPPCBWiccARDH+RoD6jGw5zbjNs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BCFF6F8038F;
	Thu, 10 Oct 2019 16:05:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7B678F8038F; Thu, 10 Oct 2019 16:05:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 08EADF80113
 for <alsa-devel@alsa-project.org>; Thu, 10 Oct 2019 16:05:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 08EADF80113
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="AVWXSHoe"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YKb2E0bqtC+1TS6bbf5/9WOYFCNWex11PfY1IyHGgs0=; b=AVWXSHoeV5dXwKMHtFgapdpHe
 luf83G9y5Cvk+3H6TVEWgYuBPnHWJKjh7dQq0Ubl6R+3OjeeZq/SnQGXaeQBwow27JLd3OinXxuhW
 NaHgIzrRmwUdGbGojf/VkSpa/I0rbQPcSHLi3Kb7DDobrloTpriQK1++chVZZl7oT4+qY=;
Received: from fw-tnat-cam3.arm.com ([217.140.106.51]
 helo=fitzroy.sirena.org.uk) by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1iIZ45-0001Vb-9c; Thu, 10 Oct 2019 14:05:13 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id DC38CD0003A; Thu, 10 Oct 2019 15:05:12 +0100 (BST)
Date: Thu, 10 Oct 2019 15:05:12 +0100
From: Mark Brown <broonie@kernel.org>
To: Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>
Message-ID: <20191010140512.GT2036@sirena.org.uk>
References: <20191010074234.7344-1-nuno.sa@analog.com>
MIME-Version: 1.0
In-Reply-To: <20191010074234.7344-1-nuno.sa@analog.com>
X-Cookie: Be careful!  UGLY strikes 9 out of 10!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Lars-Peter Clausen <lars@metafoo.de>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>
Subject: Re: [alsa-devel] [PATCH v3 1/2] ASOC: Add ADAU7118 8 Channel
 PDM-to-I2S/TDM Converter driver
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
Content-Type: multipart/mixed; boundary="===============0006631323230166991=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============0006631323230166991==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZYwTRRUThkGj9JQ7"
Content-Disposition: inline


--ZYwTRRUThkGj9JQ7
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 10, 2019 at 09:42:33AM +0200, Nuno S=E1 wrote:

> +			/* power on */
> +			ret =3D regulator_enable(st->iovdd);
> +			if (ret)
> +				return ret;
> +
> +			/* there's no timing constraints before enabling dvdd */
> +			ret =3D regulator_enable(st->dvdd);
> +			if (ret) {
> +				regulator_disable(st->iovdd);
> +				return ret;
> +			}

You could use regulator_bulk_enable() here (and similarly on
disable) but it doesn't fundamentally matter - they do guarantee
that they'll do things in sequence, though they don't wait for
the ramp to complete before kicking off the next enable in the
sequence which can be an issue for some hardware.

--ZYwTRRUThkGj9JQ7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2fOpUACgkQJNaLcl1U
h9BEPwf/VxMhiR0z6PYlab1hBh6JMo2K1WIXb2S3zahILtM5SXxYMmwRh16GuG0o
pIrwnxc5hMD4+bqp6vYu9QaISbKB8UoBsAr+SU5b/eHsba3r0Jbl/wNdTdbgCVus
ZCYLHYtnWZrx9okSggQ9viUDkqls7dLCPMfu/+qV5NiDAasZJZUIEjkaUdfAhYwS
z0yrot94R5p3QdNEI5ds7y5ZuKWGDEcWJNU3PekJ+putlZyUF8qa9/nV+/uZigQ/
hH+oMbQGEg9pgx/neQN2VxC4hIXtXcaDMT4WuEVt2HjWCK2xcFrauNzAg7HkdV0z
EkVGgsiWwDQG59xutrTflWxmmQCOtw==
=S+PA
-----END PGP SIGNATURE-----

--ZYwTRRUThkGj9JQ7--

--===============0006631323230166991==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============0006631323230166991==--
