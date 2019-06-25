Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7228C54CD6
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jun 2019 12:55:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DB9459F6;
	Tue, 25 Jun 2019 12:54:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DB9459F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561460131;
	bh=eDt76ieV/sutzjdCSK8cnAyFb3E3exrS0RqAmXqDxEk=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lbidLiP/ct43ZfpZA3vaum0/1Ddh8rWF3+rcJbH5GHwnn6leB7ylhIatwlzWuUH31
	 OR8U8hOZvRYPgbNZOrG4O9OYPFRt5srXPayqiy2tdY4onwjWH7zHV8HmdW7rYrSvSM
	 M3nVjk3TDdOCvzYFPSU8WXXMBX5ayhJynz6V5MX0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 63F06F896F9;
	Tue, 25 Jun 2019 12:53:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 154B8F896F9; Tue, 25 Jun 2019 12:53:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 98303F896EA
 for <alsa-devel@alsa-project.org>; Tue, 25 Jun 2019 12:53:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 98303F896EA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="Ga2t8OgT"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zURBce9HQLj0G2xdo/Hp3u9B5hKF0XtHc0YMl1oyxhM=; b=Ga2t8OgTzZ7ivU5qJ/8mH38nC
 mr6uZDlv7nLikCcmWH69qnK0YipWR9gVFIj82decZh+YjHWW5CCWXC8c0OPrfvd4XoV9sLCr6/erb
 8sLeUu9vdCG+xq+rXHYiRsNiQ0Qv6r0If+ualgaeck2XcXO2+fH+5G+3Adaa6+VCsQMrg=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hfj4y-00050u-6R; Tue, 25 Jun 2019 10:53:36 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 7648F440046; Tue, 25 Jun 2019 11:53:35 +0100 (BST)
Date: Tue, 25 Jun 2019 11:53:35 +0100
From: Mark Brown <broonie@kernel.org>
To: cezary.rojewski@intel.com
Message-ID: <20190625105335.GO5316@sirena.org.uk>
References: <20190613190436.20156-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
In-Reply-To: <20190613190436.20156-1-cezary.rojewski@intel.com>
X-Cookie: Editing is a rewording activity.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: lgirdwood@gmail.com, alsa-devel@alsa-project.org, tiwai@suse.com,
 pierre-louis.bossart@linux.intel.com
Subject: Re: [alsa-devel] [PATCH 0/7] ASoC: Intel: Skylake: Critical IPC
 fixes and flow adjustments
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
Content-Type: multipart/mixed; boundary="===============7766505464853236442=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============7766505464853236442==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="G3Z/XoW3/0g+zQCP"
Content-Disposition: inline


--G3Z/XoW3/0g+zQCP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 13, 2019 at 09:04:29PM +0200, cezary.rojewski@intel.com wrote:
> From: Cezary Rojewski <cezary.rojewski@intel.com>
>=20
> This set of changes contains critical IPC fixes:
> - ASoC: Intel: Skylake: Read HIPCT extension before clearing DONE bit
> - ASoC: Intel: Fix race condition in IPC rx list

Pierre, any thoughts on this series?

--G3Z/XoW3/0g+zQCP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl0R/SwACgkQJNaLcl1U
h9A5rAf+OMqGUDZJe6WyKCe4+6DveFRKfB350STkSrAgc+6tuz4X3KFlXucZj4PH
OHqW/TfSSeXtqRrcz3CCkAS66kGKrCoodE4y8fQhUkT1reFx/nmNusmXT8sdj8rz
eYT0QFUk8LiXBmaLBLLEQWCItq8TAN3TaPYQq18hR4VtnaQc6uRbUfFRmF4N4PHe
54TOJ3J9ZuK94CjeYWkonueU/94JxHB1F7Z8nXZLkK+gRa2j6LBX7zMzGYue3Z0+
jx1Y1YkRkebFEIw71lAf5oNj2/BS/U1BZzFktW2ECW//3n4zh7N6hBFrvxsVW5Y3
EMqRi/keXF1/4LS+BB/9lxH6wfTNBw==
=WAWO
-----END PGP SIGNATURE-----

--G3Z/XoW3/0g+zQCP--

--===============7766505464853236442==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============7766505464853236442==--
