Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 65FA51B6114
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Apr 2020 18:36:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C312516A1;
	Thu, 23 Apr 2020 18:35:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C312516A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587659767;
	bh=snSEUMNG2EV2Jo59jHoTDA7zGZsRBA55IewXlFTL7hk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SIwa1uAwefFE8i/L1iRwidw8NPe0YdlCPNnFqyPD9WqcIgoTuFk0dG/TRO46L3IZY
	 SUlpgczEHcdjq7MCB9dGQzpTE67HY4yBSOdcwMIH/DeZ/nQQurRza4Xh9S9AQCa3UE
	 YY91BSjaqdoHyE3j1eJHSM3mnUStT1xrp56qpUj8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4C83AF801F5;
	Thu, 23 Apr 2020 18:35:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 63262F801EC; Thu, 23 Apr 2020 18:35:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 94BC0F800FF
 for <alsa-devel@alsa-project.org>; Thu, 23 Apr 2020 18:35:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94BC0F800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="toESXYtd"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2113920728;
 Thu, 23 Apr 2020 16:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587659699;
 bh=snSEUMNG2EV2Jo59jHoTDA7zGZsRBA55IewXlFTL7hk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=toESXYtd6OdaU7e0rDn1uEm5suSRV1UykPLrmK0EyNrzxPslnjWD1BRoZMp1WfjqC
 o4RJhRjy5IUuiDpR0J5IDCafnzEEGCdIIpANNHjxj+N92kbDNNrAamnfpZNVWE9wog
 nwrvsgw1xf/57x/HvFsx3R050pObl6pi+Q1s/QBE=
Date: Thu, 23 Apr 2020 17:34:57 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: Add missing dependency on IMX_SCU
Message-ID: <20200423163457.GR4808@sirena.org.uk>
References: <20200423142805.52757-1-broonie@kernel.org>
 <8faa8f98-2b9e-8229-e67d-cd5c88ddebef@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="84mZ5ifxO1MoKVCL"
Content-Disposition: inline
In-Reply-To: <8faa8f98-2b9e-8229-e67d-cd5c88ddebef@linux.intel.com>
X-Cookie: This unit... must... survive.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>
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


--84mZ5ifxO1MoKVCL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 23, 2020 at 11:25:41AM -0500, Pierre-Louis Bossart wrote:
> On 4/23/20 9:28 AM, Mark Brown wrote:

> >   	bool "SOF support for i.MX8"
> > +	depends on IMX_SCU

> this works, but there is another issue with IMX_MBOX that's a mandatory
> dependency for IMX_DSP, so another risk of unmet dependency

> I can send the additional fix on top of this one or a combined fix, your
> call Mark.

Please send something incremental, like I said in the other thread this
was just a quick fix for the error Stephen reported to make sure there's
something there for tomorrow's -next.  A better/more comprehensive
replacement would definitely be good.

--84mZ5ifxO1MoKVCL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6hw7AACgkQJNaLcl1U
h9BbQwf/aBeMhFiCo/cpAlXgzmzeaUZzMmJjclQ5XatzCpQ8W7tpVXzuVoAHiXFP
3LvOtdkwpTDjev4TpYZoq9rzeg7pTNd8wamhvOGDKa8+1RqlHkVBitOfkNPkjGos
8K5YUcHOTynga20CEENa3nwkZpmFTGcsCrcn7+48dqfDAuCZpOxR7G9mAb/mEVJ3
yzdeBX48zX2y7Jpil6QE6eGKopFQwh70LwQzb9tL8d6kedwOqzu6MsHYyFC0Bbg5
kPF2myPQO8N9SMrP/g+L61riKOz4cCVcyp+zFtql2TCvg3maju0SkToUWysSjdhk
h9H4SCeLYss/tdB/KAEOC6+3YQJUAw==
=C9Sr
-----END PGP SIGNATURE-----

--84mZ5ifxO1MoKVCL--
