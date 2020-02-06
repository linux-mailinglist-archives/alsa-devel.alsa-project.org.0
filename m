Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E2B15436A
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Feb 2020 12:48:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DAC5416A4;
	Thu,  6 Feb 2020 12:47:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DAC5416A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580989681;
	bh=yKPX6DzybilWaF1gE+n9BIUmwMCjJrZqxw6hJZG758I=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ew1wqaAzgvVzv6DCGphlFkt/rMSwgpRsTwglMSc9CqWwjys0sP+omkA54DeYIS5pw
	 YmphBZ2CWN7XeBcR/MqxPnkfFd1PmV0iqx79/oIU0J+FvoRqFojTI5gLPoPbGdS2Ri
	 0G1a+obDOu09EzaZ0pfAZaBPSPR+ESj2Io/91P+E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F06C1F801DB;
	Thu,  6 Feb 2020 12:46:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DCB30F80162; Thu,  6 Feb 2020 12:46:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 18C2AF80059
 for <alsa-devel@alsa-project.org>; Thu,  6 Feb 2020 12:46:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 18C2AF80059
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="B39UPjFU"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bUWREdoU4He/YcftlGWMKWe1bWizb7OK/93Il52hoRA=; b=B39UPjFUyfKnLbO50oBTfJTAi
 OjSPf4Oa2MILokP3IeooB2GgH2JBR7HTcQiOILxSIbOaTeADKvN447l0n/rQFND70+EhoStAUkM1p
 E64X6U6M6O3hRUNn3F0zdQIeKni+FuDS/srt/WReqeNGEcXCshkm1h4eWO2fkYMjVkUo4=;
Received: from fw-tnat-cam3.arm.com ([217.140.106.51]
 helo=fitzroy.sirena.org.uk) by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1izfbj-0001YB-Cl; Thu, 06 Feb 2020 11:46:07 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id CD968D01D7F; Thu,  6 Feb 2020 11:46:06 +0000 (GMT)
Date: Thu, 6 Feb 2020 11:46:06 +0000
From: Mark Brown <broonie@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
Message-ID: <20200206114606.GM3897@sirena.org.uk>
References: <cover.1580950046.git.robin.murphy@arm.com>
 <29a846da33c02df64eca62b5fa0f3884652f788f.1580950046.git.robin.murphy@arm.com>
MIME-Version: 1.0
In-Reply-To: <29a846da33c02df64eca62b5fa0f3884652f788f.1580950046.git.robin.murphy@arm.com>
X-Cookie: Programming is an unnatural act.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, heiko@sntech.de,
 lgirdwood@gmail.com, linux-rockchip@lists.infradead.org, pgwipeout@gmail.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] [PATCH 2/3] ASoC: rockchip: Make RK3328 GPIO_MUTE
 control explicit
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
Content-Type: multipart/mixed; boundary="===============5650488246636232736=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============5650488246636232736==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+F2yqQIdYdj7GirX"
Content-Disposition: inline


--+F2yqQIdYdj7GirX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 06, 2020 at 01:07:12AM +0000, Robin Murphy wrote:
> The RK3328 reference design uses an external line driver IC as a buffer
> on the analog codec output, enabled by the GPIO_MUTE pin, and such a
> configuration is currently assumed in the codec driver's direct poking
> of GRF_SOC_CON10 to control the GPIO_MUTE output value. However, some

This makes sense but it is an ABI break so is going to need
quirking for existing boards that unfortunately rely on the
existing behaviour.

--+F2yqQIdYdj7GirX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl47/H4ACgkQJNaLcl1U
h9DSgAf/fI2jTkBLGwfZiU8QU+VXIx/+BPEpU9gRjE/WwtBF2zlRRy3WLOiYqQ5Y
Y+Jgt8z1POzBClW3R1EYdRfuno7LdCv0Uw6x3N5lGI48qRilCVvtfDq7wUkMqsCT
o6WrsChoeB3VFYsyKSD/ZKjA2Zxie2VYH4actQ/kdat4TeYXyIVQ/IcEZsMZXPmL
RydsLYzjOLFElnxNVA8FlHbumD9t1u0qRvCW9G0ASdoNa1IHA0AeYUoVBFo2/yGo
5AQ5AZNMfjrTfpvzRbg7zyQdztURC/VUqnqk+dSFOzZ8SC91lj7mw9IC1+9dRF5R
1GxdYx+sA24Phw4T+p07RZO9aUY6xw==
=pHJO
-----END PGP SIGNATURE-----

--+F2yqQIdYdj7GirX--

--===============5650488246636232736==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============5650488246636232736==--
