Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E5CF54E58
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jun 2019 14:06:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 802011612;
	Tue, 25 Jun 2019 14:05:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 802011612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561464405;
	bh=pTim+pChNtoTp6Iha6n2dhuTDkrWsCCY6qHhtffRmNQ=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aNfV4wVGx8iTiFZslBPeZnRu4mpaYcYWDRdB2BTACspmFwmxVY3LIwZRfg6d0M/z1
	 trItaedmAayCOprIKeCEKSrFJR6loE2Am+UglWunF3c9Uwn+lg22J3c/JAHXypsT9N
	 rBFHGPnvSNWXOfe/DuuOy+Swv+xGxvCaNBnXv2jY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E225DF896FD;
	Tue, 25 Jun 2019 14:05:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BE34CF896F9; Tue, 25 Jun 2019 14:04:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A50A5F8071F
 for <alsa-devel@alsa-project.org>; Tue, 25 Jun 2019 14:04:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A50A5F8071F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="YL9CFYho"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DWICQ0zpYKRYMlBGBW8GJ1QjmjM3KJwVVYOSzyrALl0=; b=YL9CFYhoDEySP6EpxF75BmGLG
 mkb0s15KBJDC1IA08M14Xy4TViWorkCjLWg+9zCkblSFG00RZcaQw9zWKLUKYw3P3ba0zsEHE+oNu
 RLqXUbmsDmilnpZWPe0Qja5G+WABPM3FzMvD/FKfbizP3n2HoC/cZwCPKTtvHbEzT3q7M=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hfkBv-0005EI-1f; Tue, 25 Jun 2019 12:04:51 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 7CFA5440046; Tue, 25 Jun 2019 13:04:50 +0100 (BST)
Date: Tue, 25 Jun 2019 13:04:50 +0100
From: Mark Brown <broonie@kernel.org>
To: Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>
Message-ID: <20190625120450.GR5316@sirena.org.uk>
References: <20190617113644.25621-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <20190617113644.25621-1-amadeuszx.slawinski@linux.intel.com>
X-Cookie: Editing is a rewording activity.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Cezary Rojewski <cezary.rojewski@intel.com>, Takashi Iwai <tiwai@suse.com>,
 Jie Yang <yang.jie@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH v2 00/11] Fix driver reload issues
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
Content-Type: multipart/mixed; boundary="===============8603057543414505178=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============8603057543414505178==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eCam2inYEBLywDwW"
Content-Disposition: inline


--eCam2inYEBLywDwW
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 17, 2019 at 01:36:33PM +0200, Amadeusz S=C5=82awi=C5=84ski wrot=
e:
> Hi,
>=20
> This series of patches introduces fixes to various issues found while
> trying to unload all snd* modules and then loading them again. This
> allows for modules to be really _modules_ and be unloaded and loaded on
> demand, making it easier to develop and test them without constant
> system reboots.

Pierre?  You did comment on the general concept in one of the patches
but not on any of the patches directly.

--eCam2inYEBLywDwW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl0SDeEACgkQJNaLcl1U
h9Aszgf/ZJcrZYUqHzmeb3usoo7uoPZKU3yDTW95/KnXa232hRqc+j9GhPGFxXh5
gZjfJzHgyW/51JU+fGwPfMUP4EF/QgSzBBleqChmxPxmnmuD8MPi81bcSLHAtj0e
O2xQ4PJ0FM/FjaZaCWVjSxq0WQf22K4gfZjcRa6GmbYtourQgMPPQVbz3nXREqQc
PCgSV8UyoLC8xR72b0eUIks0UFuR7NVhKJSirPAmdspgdDdPT9WI3pFRmWUeZjno
gVLToJw2hJ9oNp0HIk2fHH/LuAyF6HRWJHQFCJypSWuz3btq/G9b5zgaQYKNxNaT
2XJRfIR7ang8lYLECK/8CnCxS6ZVgA==
=j2NT
-----END PGP SIGNATURE-----

--eCam2inYEBLywDwW--

--===============8603057543414505178==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============8603057543414505178==--
