Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 455B55B02DE
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Sep 2022 13:27:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DEB421660;
	Wed,  7 Sep 2022 13:26:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DEB421660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662550064;
	bh=ciKLrkYNMWLS2k+Fc43SiKpXyXILR6c+3eE5MBG7T3A=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=S9SQ1ma38oV40W4LXdc6gqiBsvdk+bWOfA8Pl72cwzKSu009MfRw/X0Erhf+Z/vuU
	 NGvAgjJLvCJtf/JaB2OPpSsbKpUut2iMmXZJLjy4mR0CMH2BUMDT9cDQ+La5CUXehJ
	 5KMh2I93IOmOo7LxeaRZbfaMMBxRpU47cF40ejJA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5F7FFF8011C;
	Wed,  7 Sep 2022 13:26:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C10FDF8011C; Wed,  7 Sep 2022 13:26:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9BB81F8011C;
 Wed,  7 Sep 2022 13:26:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9BB81F8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="LPlQbUpJ"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 08B51B81BEC;
 Wed,  7 Sep 2022 11:26:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9CC3C433D7;
 Wed,  7 Sep 2022 11:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1662549993;
 bh=ciKLrkYNMWLS2k+Fc43SiKpXyXILR6c+3eE5MBG7T3A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LPlQbUpJ0/GfVJ79v+DQw7K+hLnoTy6P3P/Eigcwov/vXUqdo+tDEmqOzIN9xpDKO
 pEPDX2/TJBgk0mdc+oLiMaShk9PsbyZrochyu/SWH8d31fKGpRuRaE29JayEEymV0E
 wfsgdVdN+Vl7nVdGac+0JQ+mvPHnqaHQLiJF+762jBE6LLVAZnZT4GxIGAlkSGo1Mk
 SIcHgX4HfZpsmQnBmMrhBv3SqaH5tOkByrDhNszmdjJKex7sSq1YKhDBmZpNOfkM1O
 PuugOHSJpQPDlVP4OQV195vamUDYIUZ811km2Ga53mXj14L32BfHvgmvqRv/4AMu5c
 boGUWYW12sTmQ==
Date: Wed, 7 Sep 2022 12:26:27 +0100
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: Re: [PATCH 3/7] ASoC: SOF: Intel: Don't disable Soundwire interrupt
 before the bus has shut down
Message-ID: <Yxh/4xQIvitrldRW@sirena.org.uk>
References: <20220907101402.4685-1-rf@opensource.cirrus.com>
 <20220907101402.4685-4-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="y4vOpZSr9wJlnE+n"
Content-Disposition: inline
In-Reply-To: <20220907101402.4685-4-rf@opensource.cirrus.com>
X-Cookie: You have a truly strong individuality.
Cc: daniel.baluta@nxp.com, alsa-devel@alsa-project.org,
 kai.vehmanen@linux.intel.com, lgirdwood@gmail.com,
 yung-chuan.liao@linux.intel.com, ranjani.sridharan@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, vkoul@kernel.org,
 patches@opensource.cirrus.com, sanyog.r.kale@intel.com,
 peter.ujfalusi@linux.intel.com, linux-kernel@vger.kernel.org,
 sound-open-firmware@alsa-project.org
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


--y4vOpZSr9wJlnE+n
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 07, 2022 at 11:13:58AM +0100, Richard Fitzgerald wrote:
> Until the Soundwire child drivers have been removed and the bus driver has
> shut down any of them can still be actively doing something. And any of
> them may need bus transactions to shut down their hardware. So the
> Soundwire interrupt must not be disabled until the point that nothing can
> be using it.

Acked-by: Mark Brown <broonie@kernel.org>

--y4vOpZSr9wJlnE+n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmMYf+IACgkQJNaLcl1U
h9C1lQf/QQ7834+HysNjSeJWB8OQqFmAuvTcRvjskQ7KiMtML52BD0aYaHgAJVNA
+sPph3cYAkcu4h8OM5G4OZ1nDVHcJ9bIDQO0ybGx4V6B4IfTqm2HcBZI5XjuvAy/
xcRiOoCR9QoWHe83pNTQMH3j0/sC6WNlE38KMokQS1MFJmx3ld0XdjmOpKhF04TM
A9tVkWAzzJjFaK9aWY+aJRJkD4xyVJBHq9n/EtgMW4MeppzzBch7tCJrQHh1XG9i
3kmXQRrQ7S80q9m8zI3UlfvVfTflUPK/h6o+szJTBmyeZLDG4GkPKQyWWm+EwAjY
9UzaLD8yNp8o9DCGxb6SzOFsfMDzTA==
=GacH
-----END PGP SIGNATURE-----

--y4vOpZSr9wJlnE+n--
