Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 342EF606228
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Oct 2022 15:48:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C131B7A48;
	Thu, 20 Oct 2022 15:47:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C131B7A48
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666273723;
	bh=Rf1szAh32hd1G3KF/Bs7TeoBWR6irNKWG/j6QHy9YgY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kI6lCmD9X7bHXQm+cbdSK5u6qO+nuEAzPZ9JU862imPA+5ZQGPoydAuLxyTFJchdZ
	 tu148nKkjXBFByeYp8BxVX7ZFi0CC/BTXQR1csUBjQ9Y855igqBu0A4cAf+QPnxSmz
	 jFRIR6LlzfZV1vP+0jwTEfHzJ+g1dvKt0LeYF0rw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4753DF800B5;
	Thu, 20 Oct 2022 15:47:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B088CF804D8; Thu, 20 Oct 2022 15:47:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 78440F800B5
 for <alsa-devel@alsa-project.org>; Thu, 20 Oct 2022 15:47:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 78440F800B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="d53J/zvS"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D8DA461B60;
 Thu, 20 Oct 2022 13:47:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DADB8C433C1;
 Thu, 20 Oct 2022 13:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666273663;
 bh=Rf1szAh32hd1G3KF/Bs7TeoBWR6irNKWG/j6QHy9YgY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=d53J/zvSG22zTuEQxr8pxSTWTMRBJnJ57sdbSPJsKuW2BNtwixzc53u3kBOWjSHZO
 /SWks/wZLylJnvpCjxC6H5fzEaY1Ljun6bk7DgridUNxrcWgrPfwPUmiJf2KzvMb/k
 b20kAM0kmf0eGRBk15Nu7Z8mPhQnPHkgiqsXrT3Iq467RV/8vyV8FxxY8Ofj/olvd/
 gZq6MgdblaXzgMwo4osmbNgYvEc5hgmkiO65ONI8U7Ns8Emhi2W0x/EdfyS0QBZCzW
 RQBSQa7NrZRlnp9n7GZmF5pGffztyAvI9a5pIfGovd9ruwC8fo2iWy2bq92zJlUqJP
 yJ+oU3b/FDaow==
Date: Thu, 20 Oct 2022 14:47:38 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 07/10] ALSA/ASoC: hda: ext: add 'bus' prefix for
 multi-link stream setting
Message-ID: <Y1FRermozwj2AEfB@sirena.org.uk>
References: <20221019162115.185917-1-pierre-louis.bossart@linux.intel.com>
 <20221019162115.185917-8-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="MzPKzrl7AqkmUbDN"
Content-Disposition: inline
In-Reply-To: <20221019162115.185917-8-pierre-louis.bossart@linux.intel.com>
X-Cookie: Today is what happened to yesterday.
Cc: tiwai@suse.de,
 =?iso-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>,
 alsa-devel@alsa-project.org, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>
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


--MzPKzrl7AqkmUbDN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 19, 2022 at 11:21:12AM -0500, Pierre-Louis Bossart wrote:
> All the helpers dealing with multi-link configurations are located in
> the hdac_ext_controller.c, except the two set/clear routines that
> modify the LOSIDV registers.

Acked-by: Mark Brown <broonie@kernel.org>

--MzPKzrl7AqkmUbDN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmNRUXkACgkQJNaLcl1U
h9Cl/gf/b78NsJ2e+uPKk/MNhPC39orpJAWejGIp6tSS7Y6hyKgMdufavNvJp2bA
B7bmBAYyC44d2fkdzJFZfVJb1LLm2/73BqgpAdd3eo2blrT9Ouw5Ax5rLtu2vRyB
r/M6s7e4o6Z1QixCR+RTx8KeDer06SW2DNkTUaS0/i+/O+bjnyAovXkb7I88fmzi
5dNCwBUSjZuHLcgCwd0FDPX95/PrLvgia3Xhqkx7/bMBjk9Zgb7/9LFzSQcdoHix
VRk5KCYeizrDigfVoO0/5MVETUNH7kgF69LKW+qGls+AN1PYv7rV14aYn2ZKkZ9I
Xlv/rXkE/DXfarvdhBJ86fRUhKPW2Q==
=Sf77
-----END PGP SIGNATURE-----

--MzPKzrl7AqkmUbDN--
