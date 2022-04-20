Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 93085508D30
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Apr 2022 18:24:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 34587177E;
	Wed, 20 Apr 2022 18:23:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 34587177E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650471877;
	bh=SBnyZwALtyPYeKnG3vPDUEjUDcPRsFRW6H4/3UQsehI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dJ9YpsLvftwPwXtHRWfywm+RdoTBCD2zR9P3eNYX9/o771I1buAeX83eBvHPw/MGs
	 iWN6chH+uJAEN4BZ2f8Uo8tTLavSjsgXDEi/0w6MELWdK5R8hNECyMD4IWNCecgZOL
	 nda0JTCOdf082QPtD7xcDeUiOWogQBad+Xqln/I8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B1579F800C1;
	Wed, 20 Apr 2022 18:23:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A5F27F80125; Wed, 20 Apr 2022 18:23:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 57BCEF800C1;
 Wed, 20 Apr 2022 18:23:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57BCEF800C1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="JjtEy44t"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2AA1F6193B;
 Wed, 20 Apr 2022 16:23:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2886CC385A1;
 Wed, 20 Apr 2022 16:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650471811;
 bh=SBnyZwALtyPYeKnG3vPDUEjUDcPRsFRW6H4/3UQsehI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JjtEy44tAZJMG/MPWmRPct3HexSkYWqmoasVTFPZ0uDJo4SfOND2yhrgLZrbiom4E
 mAGZAKGNCF60K4HILY+oQR1dyXxr4n/3mH3rfA7VOBsYl1mujCzegSxvutbkcuH0dU
 zGS9YqNNGBQkE9j9glelr4mQpowsUk1hD//UDzaPtn3AFPs7VNGhbJGgT2gudlmy+7
 hxEq/KBeXcuts/XtmA3+D1MCzJXMMxaAxoC1ClyIv2nlOfmZ8V4JP1HJJR51dvjDl/
 vmkVJsVvyG5oY7wufmwSGblpizL0tpauqJBzYmyq5iNkjO4pWNOYYSZZoZunBmFrF2
 UOFmw635NmDog==
Date: Wed, 20 Apr 2022 17:23:25 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: using pm_runtime_resume_and_get to simplify
 the code
Message-ID: <YmAzfTlr9VauoyLu@sirena.org.uk>
References: <20220420030315.2575691-1-chi.minghao@zte.com.cn>
 <78c7edc3-f431-9735-238d-9aa2b45ec45e@linux.intel.com>
 <YmAljQjpLCoBv+nj@sirena.org.uk>
 <2572220e-57d0-4f10-1695-bfeab54de38d@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="pPSA/PyGUaMRPFlK"
Content-Disposition: inline
In-Reply-To: <2572220e-57d0-4f10-1695-bfeab54de38d@linux.intel.com>
X-Cookie: Will it improve my CASH FLOW?
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 cgel.zte@gmail.com, Zeal Robot <zealci@zte.com.cn>, lgirdwood@gmail.com,
 Minghao Chi <chi.minghao@zte.com.cn>, ranjani.sridharan@linux.intel.com,
 daniel.baluta@nxp.com, linux-kernel@vger.kernel.org,
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


--pPSA/PyGUaMRPFlK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 20, 2022 at 11:11:03AM -0500, Pierre-Louis Bossart wrote:

> ok, I'll send follow-up patches for the remaining code.

Thanks, like you say there's a lot to get through here!

--pPSA/PyGUaMRPFlK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJgM3wACgkQJNaLcl1U
h9CQJgf/fmHmEvmSkw+o5cwa89eqRnsRjl0W9UEoY268KcH7oP1YF3/DZCS5KkLi
fkv2zMjTMNU96KRgcX7T0LQ1nqatX4hkWZXfYmTfPTT03sVzJ1q9FXT4IEERV587
Y+R0wsTgHWV2e4/n3GNsYcq3dgfeDt1c2LrcLnhpClO8SMTl0Qjdv2ci0NCBdmqe
ISS9aCBtP2e2zAu8MOqwFBR0BVwaPu8euKJiVtpu7y6cXuh3awKaqOQYnGCUm/dD
cqYtMnQwLh3WzAoyKUrK5Pohu/AtQBkssGiS/n3c9JMjU7utg/K5x2+t2tZrBh88
fvVmR2Mo8H18gUzxmZ6rybDj0TM1BA==
=XETb
-----END PGP SIGNATURE-----

--pPSA/PyGUaMRPFlK--
