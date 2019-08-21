Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BF74F978E2
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Aug 2019 14:10:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 380231669;
	Wed, 21 Aug 2019 14:09:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 380231669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566389448;
	bh=mWqNwGQ+Dks2XSaAnYfu/l7va1MKFTFAIo2cy8l85z4=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KM5W3au1HTyqs8KRaMWfdh9rFMan7+mDyPlwrJuZeS3Y5qTzB5r8rgX7HxRGMPeOP
	 jXc0a1qwSOll2a1q8bGw93RFx+29FarLpzQECkNPvJOhjPOW7NVaeQXMIn0ZobfyFD
	 wfKkhTDLgcKhd8TNkkSG4U8q3kHY9VBk0yzJaXUo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E0CAAF805A1;
	Wed, 21 Aug 2019 14:08:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7AA8AF8036B; Wed, 21 Aug 2019 14:08:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-wm1-f100.google.com (mail-wm1-f100.google.com
 [209.85.128.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 618B4F802E0
 for <alsa-devel@alsa-project.org>; Wed, 21 Aug 2019 14:08:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 618B4F802E0
Received: by mail-wm1-f100.google.com with SMTP id 10so1856980wmp.3
 for <alsa-devel@alsa-project.org>; Wed, 21 Aug 2019 05:08:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=IXl+woG1rIEs+O3NNWtP4CdrfA4jeEZO6W2YRUD74Vg=;
 b=ha+KVTgvRTN1QAzXDYkZmaloQ7gNrrg/lMyYKwJ6PwXy3zAy03YEpgpQKhxsuqU3gM
 dqMRlEZBcZ0OJP70WXOVuQ4ALSO6exZcJNaprAI9rgSqBGqncPXFRrWFm8eM/OjTVjay
 /oj8LwNJ25vG1ufvRp9UTF335SF3ssS80V3ovTcHtNNgJJDNCt+VPG5tClUYxJ0LAL2r
 kaHYAgnMeBFbl5uySBRC9KO8Phiy2gG9Xsjso/ZKXAcWYdTcsXkqYnGvG72yXugQ2zY+
 DDeyD8iQ4Id4NHidpFk/mgGXd/7h3cB+2cYLaXz9Bf+11fVA7gSIBknvPZmHtricz486
 Brvw==
X-Gm-Message-State: APjAAAV3evyL2ShzJR97sO+/Vj6giIQdb+6UuTjQ2Fd7Dv2FA5WrPomQ
 CPSmz1K0bTsGbXoL0i5vap+sDoTMAgL2Jat/5oTCyNO13Acl3WPLj/nHnGQJPTKX2A==
X-Google-Smtp-Source: APXvYqxtUrQDZD16TEkWwrpONiJQYCo9gx6jkQDbEQ5duVJ8iCotfEsg9v+PYIoSY7pc0i6PYvNLF6mOB9hl
X-Received: by 2002:a1c:7009:: with SMTP id l9mr5689043wmc.159.1566389325299; 
 Wed, 21 Aug 2019 05:08:45 -0700 (PDT)
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk.
 [2a01:7e01::f03c:91ff:fed4:a3b6])
 by smtp-relay.gmail.com with ESMTPS id i6sm369197wro.76.2019.08.21.05.08.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Aug 2019 05:08:45 -0700 (PDT)
X-Relaying-Domain: sirena.org.uk
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1i0PPx-00075t-1U; Wed, 21 Aug 2019 12:08:45 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 879BF2742FCD; Wed, 21 Aug 2019 13:08:44 +0100 (BST)
Date: Wed, 21 Aug 2019 13:08:44 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20190821120844.GH5128@sirena.co.uk>
References: <20190820034331.38171-1-jaska.uimonen@intel.com>
 <2dc34431-7302-85c7-8215-472c7d994f7f@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <2dc34431-7302-85c7-8215-472c7d994f7f@linux.intel.com>
X-Cookie: Sic transit gloria Monday!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
 Jaska Uimonen <jaska.uimonen@intel.com>
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
Content-Type: multipart/mixed; boundary="===============6689198127121539000=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============6689198127121539000==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="v2Uk6McLiE8OV1El"
Content-Disposition: inline


--v2Uk6McLiE8OV1El
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 20, 2019 at 07:30:25AM -0500, Pierre-Louis Bossart wrote:
> Added Mark and Takashi in Cc.
>=20
> On 8/19/19 10:43 PM, Jaska Uimonen wrote:
> > sof_get_control_data returns negative values even though the return
> > value is defined unsigned (size_t). So change the return value type
> > to int.

Please send me the actual patch, I can't apply quoted material.

--v2Uk6McLiE8OV1El
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1dNEsACgkQJNaLcl1U
h9AOMQf+IXUqh+tEdDG3vJ/gD7+IKOUXG6qfezuU4lbM/r2AOc0z8qdM8SEtAnaZ
TzO3Q8M5qYWzo7zmtM9Fpv6k1FOd4dTylRpYI8QvALg7D0+8zyONEPFp1kHipaph
3SBkgRf6nIJZi80cZklOaiipCejC6X3Gl/ndDrpNJt86hg8Lj4PMcBuCN+qBRHBt
f8cyCGDAI6hjGedQtdR+PXiJFdBvMZJnOrbnh5b7fPFVpED5FI0lyAij6JZ2o7Pc
tw+5kpyfcEj2sogx0vZBkgexZFzP29I/dvDb6aPUFwKryqIlfUmzWAelZgh3d8FB
NW1SYAP7pCM0N82py/UByzOnkYcvAA==
=Xssx
-----END PGP SIGNATURE-----

--v2Uk6McLiE8OV1El--

--===============6689198127121539000==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============6689198127121539000==--
