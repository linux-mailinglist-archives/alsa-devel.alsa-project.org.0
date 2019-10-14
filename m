Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F04CD66F3
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Oct 2019 18:12:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A606A1677;
	Mon, 14 Oct 2019 18:11:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A606A1677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571069566;
	bh=z493Y2sM8Ds1708faugBJ2Y4wP6Undkl5YoIdR57vdY=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=O8F3GmvlED5xKZZeH/qRNICCzR6TZ9fpNvutgwkyya13cbHzim/A72fBgn361aLD7
	 lzuEThr4xVEoPHmL1Z2rGEtUFBPWMf7uqHi98GqckbDZzBxTYOldvohKk2qJLELqvt
	 IMYj39z92lCvs2XL6lrkrN1iCh/F8VMl74hblzJs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 11749F8036C;
	Mon, 14 Oct 2019 18:11:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CA0FEF80362; Mon, 14 Oct 2019 18:10:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 817D5F80138
 for <alsa-devel@alsa-project.org>; Mon, 14 Oct 2019 18:10:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 817D5F80138
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="gCSqGd0X"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LhyxX5ncwWMkRp8vxryZGyvmWf4LnTI5tug7GizY/50=; b=gCSqGd0X/lKA22S45zRpWVRww
 Yqlyvdl4tbX4tq+o/FF58x/P67M/w0rSKsXkCXNEaYmeaLVkK8qEBcP1PuAaF7xu/m6tzf50CKHaB
 6kcY1DDhrBy8BKb6psQGhsnoOppsyZQFuoP6I/19mS9I69/n82QxnIpVlUDHmf65I7NXU=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iK2vv-0007yQ-Vm; Mon, 14 Oct 2019 16:10:56 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id DDA3B2741EF2; Mon, 14 Oct 2019 17:10:54 +0100 (BST)
Date: Mon, 14 Oct 2019 17:10:54 +0100
From: Mark Brown <broonie@kernel.org>
To: Daniel Baluta <daniel.baluta@gmail.com>
Message-ID: <20191014161054.GD4826@sirena.co.uk>
References: <20191013190014.32138-1-daniel.baluta@nxp.com>
 <20191013190014.32138-3-daniel.baluta@nxp.com>
 <20191014115635.GB4826@sirena.co.uk>
 <CAEnQRZDbXZUhix_aR_DCUzFn1NYz1Zh7MxW5uwnuycps9PNohw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAEnQRZDbXZUhix_aR_DCUzFn1NYz1Zh7MxW5uwnuycps9PNohw@mail.gmail.com>
X-Cookie: Androphobia:
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Devicetree List <devicetree@vger.kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Takashi Iwai <tiwai@suse.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Jerome Laclavere <jerome.laclavere@nxp.com>, dl-linux-imx <linux-imx@nxp.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Guido Roncarolo <guido.roncarolo@nxp.com>
Subject: Re: [alsa-devel] [RFC PATCH 2/2] ASoC: simple-card: Add
 documentation for force-dpcm property
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
Content-Type: multipart/mixed; boundary="===============1771025202210433970=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============1771025202210433970==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Dzs2zDY0zgkG72+7"
Content-Disposition: inline


--Dzs2zDY0zgkG72+7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 14, 2019 at 04:17:31PM +0300, Daniel Baluta wrote:
> On Mon, Oct 14, 2019 at 2:57 PM Mark Brown <broonie@kernel.org> wrote:

> > DPCM is an implementation detail of Linux (and one that we want to phase
> > out going forwards too), we shouldn't be putting it in the DT bindings
> > where it becomes an ABI.

> I see your point. This is way I marked the patch series as RFC. I need to find
> another way to reuse simple-card as machine driver for SOF.

Have a look at the way the Renesas systems are using this and the audio
graph card - they have DPCM.

--Dzs2zDY0zgkG72+7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2kng4ACgkQJNaLcl1U
h9AY3Qf+KqjpJbSFjgUExOknWKmIQsHL8qO28Dh8CbziYGq/2T/5n/myzuBq77rJ
Jsf5asU3PTubpf1TQOytAog3UDtT69cqu4JIgAu2GCv7HrX7aZ7keiAlw5rlH8OC
wh5SxpbIgE959u5iOlD3l5e+koSPk+nnpiZAXfq8faWGDcbsA4OlzNqxq5kEX3j6
wQxJwGKHX73MatU5AF2IEBdZQeyg1eygBqNLvAyLp8//NdN/TijgVQbpxK2ZVeCL
RRtZDUu+j2yIvXE6ugzHd/6RQD0VnCZmAXfA/R5hgKIaNVJeyJ6hXZJ3sW7Go4Iu
1DzGwQiDN5A8JadoizM4L/L9L7MAKA==
=ZL3b
-----END PGP SIGNATURE-----

--Dzs2zDY0zgkG72+7--

--===============1771025202210433970==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============1771025202210433970==--
