Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B6D815459B
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Feb 2020 14:59:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B0664169E;
	Thu,  6 Feb 2020 14:58:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B0664169E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580997546;
	bh=TrOLhD7TyqpuAtzzDjV0dlSFSllpVXeXnu1Dvq8+0Jk=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aFHaHCIg44YssRwm7egJsrS/sD9ol4g5SFI1V2JRpz/67j9U0mnYXpRG5KpRIoUsZ
	 1xnjXJIfcHIhfIXJ0PI2QkqOVHTq7+3Dd265lAWT2qtu/uAxVydba2k0DJXVCvux07
	 J3sg1QU5XnKsu2bXML/kWMb68o4E6wW5a4l1w/hc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BBA5FF8015B;
	Thu,  6 Feb 2020 14:57:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 32250F80162; Thu,  6 Feb 2020 14:57:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6B6EBF800C6
 for <alsa-devel@alsa-project.org>; Thu,  6 Feb 2020 14:57:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B6EBF800C6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="h1BSwCcL"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BY3bAmfDGpjwi1ZC/nQxJs5fLqd4G6irce8OC6djfEA=; b=h1BSwCcLlgimk6Oh3na09vu/N
 AbeV6VNbvypZMJ77dtITNE6feYpGs3nzvQ6YOFFredtdIeVKhbrW6GAZkBdPIHoxS2SbWCUBfUzSG
 SiiXB0bFFLqXUm+Sl79j8fgCaHIktc6HeQdPXZAt8eHrQpqugIU9jadLOG+04x/pKALtU=;
Received: from fw-tnat-cam2.arm.com ([217.140.106.50]
 helo=fitzroy.sirena.org.uk) by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1izheg-0002Jg-TW; Thu, 06 Feb 2020 13:57:18 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 8977ED01D7F; Thu,  6 Feb 2020 13:57:18 +0000 (GMT)
Date: Thu, 6 Feb 2020 13:57:18 +0000
From: Mark Brown <broonie@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
Message-ID: <20200206135718.GQ3897@sirena.org.uk>
References: <cover.1580950046.git.robin.murphy@arm.com>
 <29a846da33c02df64eca62b5fa0f3884652f788f.1580950046.git.robin.murphy@arm.com>
 <20200206114606.GM3897@sirena.org.uk>
 <ad2c941a-9724-510e-959f-3cca3cab1dc2@arm.com>
MIME-Version: 1.0
In-Reply-To: <ad2c941a-9724-510e-959f-3cca3cab1dc2@arm.com>
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
Content-Type: multipart/mixed; boundary="===============0080288747176685048=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============0080288747176685048==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="k1RcuuA4CmYq3pph"
Content-Disposition: inline


--k1RcuuA4CmYq3pph
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 06, 2020 at 12:36:04PM +0000, Robin Murphy wrote:
> On 2020-02-06 11:46 am, Mark Brown wrote:

> > This makes sense but it is an ABI break so is going to need
> > quirking for existing boards that unfortunately rely on the
> > existing behaviour.

> I guess the existing (mis)behaviour could be predicated on an
> of_machine_is_compatible() check for Rock64 boards - it's ugly, but should
> do the job if you feel it's more important to be 100% strict about not
> regressing supported systems for any possible kernel/DTB combination.

Yes, that's what I'm suggesting - we don't need to be exhaustive
but having an obvious place for people to put the quirk in if
they are affected is much better practice than just silently
letting things break.

--k1RcuuA4CmYq3pph
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl48Gz0ACgkQJNaLcl1U
h9Dqlwf/e9pbZnoHIpXKjbaTLD0JTMQR2bflNKfkFgJa4HN0EBmRU/2zzjhQsMBj
FwXbRw0mbFlfh8DvJcHwjp9Nt+DzRk084QZm1xjXyIdok04lxQCq0/XwBENKJGUp
icw2FFpQGCVQJRixdXMaY0M0woDlf8GF/gk+KkNrJWvtD3JYD3pbaNqDO3Sfg4C/
ECfMVskfkS0XSKhcMWqbmFBf8ImMABUOu8qV6oWbEmxRlmjMxv28pNjXi+L96X83
qZ9St2FvccCApJ7twkomusHVtpw62Cpwy0OOwxOFIjEWTHXzhyAH/vFtPmMJwZJJ
vHRSZAgaioZ451LfVRCV/L6YnOeigg==
=S0B3
-----END PGP SIGNATURE-----

--k1RcuuA4CmYq3pph--

--===============0080288747176685048==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============0080288747176685048==--
