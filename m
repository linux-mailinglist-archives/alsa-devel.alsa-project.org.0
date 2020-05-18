Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A9A1D7FBE
	for <lists+alsa-devel@lfdr.de>; Mon, 18 May 2020 19:11:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2D15C1737;
	Mon, 18 May 2020 19:10:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2D15C1737
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589821882;
	bh=PnsI7DI6LbRcbDjsAtEl9OcO2CexznTU/8XlVSkOp+Q=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Wn6vOW5Gib2VzohXs0KuOqjgVmwtfWhqvnQsitjiYzo6DbzAhz5qBbgj/YOyazZ/t
	 9TAlWY5Yz/sim15lACaz1rcDD32fLWVqTwF4TP6iWj3SXuh3DVllxMoxLS2SBIbUOA
	 XYGnfCpqKDVlBjmagFEW+8SaSHC0LTpieHgrh8Ek=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 56B02F801D8;
	Mon, 18 May 2020 19:09:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 79273F801DA; Mon, 18 May 2020 19:09:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1B0F4F800C9
 for <alsa-devel@alsa-project.org>; Mon, 18 May 2020 19:09:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1B0F4F800C9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="DRUMj2/R"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 12E1220709;
 Mon, 18 May 2020 17:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589821775;
 bh=PnsI7DI6LbRcbDjsAtEl9OcO2CexznTU/8XlVSkOp+Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DRUMj2/RUkpMMptpGIrbIsCa+6XDOMn8AB1lZ1yWsbKhimVXxkkeVTC63zMNH4JG9
 /VUE2S8Uee932IkmHvoqhxxCZCn7UzigD/bLGHBuVIBZDNe/ZRMPwgkn+8yTmv4Ydl
 V/rvXvwUwhvdPKQw56kWI/S/GMu7H3P/1hAPA7dU=
Date: Mon, 18 May 2020 18:09:33 +0100
From: Mark Brown <broonie@kernel.org>
To: Sia Jee Heng <jee.heng.sia@intel.com>
Subject: Re: [PATCH v2 2/4] ASoC: Intel: Boards: Add KeemBay machine driver
Message-ID: <20200518170933.GB28178@sirena.org.uk>
References: <1589768242-4594-1-git-send-email-jee.heng.sia@intel.com>
 <1589768242-4594-3-git-send-email-jee.heng.sia@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="i0/AhcQY5QxfSsSZ"
Content-Disposition: inline
In-Reply-To: <1589768242-4594-3-git-send-email-jee.heng.sia@intel.com>
X-Cookie: Chess tonight.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: liam.r.girdwood@linux.intel.com, alsa-devel@alsa-project.org,
 tiwai@suse.com, pierre-louis.bossart@linux.intel.com
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


--i0/AhcQY5QxfSsSZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 18, 2020 at 10:17:20AM +0800, Sia Jee Heng wrote:
> Add KeemBay machine driver which glues the tlv320aic3204 codec driver
> and kmb_platform driver to form the asoc sound driver.

Why do you need a custom machine driver for this, as this is a DT based
platform and I'm not seeing anything complex or unusual in the code you
should be able to use audio-graph-card (or simple-card but the former is
more modern and should be preferred for new systems).

If this is required the DT binding should be documented.

--i0/AhcQY5QxfSsSZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7CwUwACgkQJNaLcl1U
h9DAaQf/fJnExYr7k3h9pumAp9xViZcDtYhprlKP8I0pDBH0U4VWxBn3WheexrLk
iGqi1BPcjydgy8gjO16OyeVL0/oZFcb+xpqPek4++h4frkg45rahNwqhaEyJXhem
QSG6bVp3EXmGfJ+2ySgR6IX3qbfnpayFvUpn3ksyZkCxzGeY7+NhtPWQSDlAx46l
JPZamw3YJK8q/OBr5K31py6eriI4VM2EwsCz/FCUl1cVIbMzEmfdhyR5T7VJYzHe
Cvd4f8R7Fd3u81icp3n4EQqqON2/DDeCQuRKWD1uAx/6NayGwLJhUc9+yRqToOAK
zH4o65YnHF+zveUr4TZGx000rdl3qA==
=6EuS
-----END PGP SIGNATURE-----

--i0/AhcQY5QxfSsSZ--
