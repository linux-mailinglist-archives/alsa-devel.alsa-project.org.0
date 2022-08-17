Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8106F596DA3
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Aug 2022 13:41:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D96C1621;
	Wed, 17 Aug 2022 13:40:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D96C1621
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660736475;
	bh=tAxziLgNC85rss5KjanACgubW2VS9uSuhJ+/ML74THM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sgLlGgDSu03ntPuPHOoDv9ti2z7SiJ0gwMx9h9svfCvcHhyau85vwVaaThr+qw247
	 W9hoFU/dEDG54yHZEB432i8vHM861tWS4cVk3DFEnTojkirJ+bU3mzjBdeKse0pEPA
	 2txfwMdkZcdxc2ogBum5l6GPHB705OMc/XCH7sIQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A59BF802D2;
	Wed, 17 Aug 2022 13:40:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 96630F8025C; Wed, 17 Aug 2022 13:40:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1D3A4F800DA
 for <alsa-devel@alsa-project.org>; Wed, 17 Aug 2022 13:40:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D3A4F800DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="T3/KpFtv"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B7BD9B81AD4;
 Wed, 17 Aug 2022 11:40:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B0B1C433D6;
 Wed, 17 Aug 2022 11:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660736406;
 bh=tAxziLgNC85rss5KjanACgubW2VS9uSuhJ+/ML74THM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=T3/KpFtv7iQZzL5njKxRzaLCeNS0h0F8QbbeFHdB76IWFap4SuB6RJ6+95NgoGCtT
 nWzhlj/TKBLcLHowUnIGscBFxs4B2DelluDdqjOpdqkAWDiVEVlqLCoyRz2HTgiqTA
 NSo0RJMVk37dyrAr/SQcxfq6O9BmhbUVB+DRG1ToQMgd1SEZfckt+4xZuUAn2drCD/
 sHf0rYN/Z+d40QQe5Gx3H1cUQNEcEy4LiQeeT2nC+PLq6tX5IMNzAQB5LPJMvwtLl1
 SRhExETaUY9G2LH0oZ4LICLBXIM85XESWzCO4EUneFt6Wmt7Ja1iMPN+JqoBV4Mstj
 BcT3VpSuWJYgA==
Date: Wed, 17 Aug 2022 12:40:01 +0100
From: Mark Brown <broonie@kernel.org>
To: "Liao, Bard" <bard.liao@intel.com>
Subject: Re: [PATCH 0/4] ASoC/soundwire: log actual PING status on resume
 issues
Message-ID: <YvzTkQ7fkQlecTVe@sirena.org.uk>
References: <20220714011043.46059-1-yung-chuan.liao@linux.intel.com>
 <YtTzZ4iA0xt68euH@matsya>
 <DM6PR11MB40745C1283CFCC3F5D41FAC9FF6A9@DM6PR11MB4074.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="q+ljVR5GQz+Wtprg"
Content-Disposition: inline
In-Reply-To: <DM6PR11MB40745C1283CFCC3F5D41FAC9FF6A9@DM6PR11MB4074.namprd11.prod.outlook.com>
X-Cookie: Use extra care when cleaning on stairs.
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "tiwai@suse.de" <tiwai@suse.de>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>
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


--q+ljVR5GQz+Wtprg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 17, 2022 at 06:48:56AM +0000, Liao, Bard wrote:

> > > This series just adds a basic read directly from the PING frames to help
> > > confirm if yes/no the device regain sync.

> > > The change is mainly on soundwire. @Mark, Could you ack the ASoC patch
> > > if it looks good to you?

> > The series lgtm, feel free to merge thru ASoC tree with:

> > Acked-By: Vinod Koul <vkoul@kernel.org>

> Both of you are acked.
> Can this series be merged now?

I guess I'll apply it - given that it's mainly a Soundwire change I
would have expected it to go via Soundwire as you'd suggested.

--q+ljVR5GQz+Wtprg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmL805AACgkQJNaLcl1U
h9AiSgf/XBVdYlzcxr231NjGvtIDApKXvygvvaqq/W1JkjymmWieaaDh7HP26Iy/
BZLvAxyC7e7zRVScXKeAtyghwzMeqKIFUH1hVazY4hKPUoiD8wD2QKstxnmpiicU
m0b5McQwRGvqmk2dmK9XPlCr9j9zERI4wsepRY2z6YrfFOfPbz6z+84aMVN5/j/p
fs9XVcafVEo9v6lbp2t7y138TFjPL2Wkh3ODPHRKFRupT5ZBAF0R25gePvwD8g9/
RVmFWTwyUgyoiuDuXAmcJkonHVaaewyBx4GEE5lSIFP+W0YbtLkgxme02gaGgMve
hNY1iDBUTORh9H92CGKFNKMGZny4iQ==
=GC7F
-----END PGP SIGNATURE-----

--q+ljVR5GQz+Wtprg--
