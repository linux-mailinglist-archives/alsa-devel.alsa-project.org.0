Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 49AFE243F7D
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Aug 2020 21:52:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DD34F166B;
	Thu, 13 Aug 2020 21:51:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DD34F166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597348325;
	bh=lgCkL8DoD8o7rUfggCAC0y0W9Olwf9aZvs7AHqqVxh0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MkphKsADtpA59Rn0ucC7/GM7MtePXewzNYubLdkbhnhyWoFoGqU44DThlhtXPaY2k
	 8fsccHgUxcmN8wZCLhpjZNLcBGlTq+kM3hSiNaRXeIfjtYfGWsVeDdd4ABOM24wtGZ
	 PEUkF0ATOfuN43/olTcKaGE5Uo7kxerLsry2gJnQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 193AEF80161;
	Thu, 13 Aug 2020 21:50:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ED8C5F8015B; Thu, 13 Aug 2020 21:50:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 30DBAF80100
 for <alsa-devel@alsa-project.org>; Thu, 13 Aug 2020 21:50:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30DBAF80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Ao0JbPEP"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7B43320829;
 Thu, 13 Aug 2020 19:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597348216;
 bh=lgCkL8DoD8o7rUfggCAC0y0W9Olwf9aZvs7AHqqVxh0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ao0JbPEP/LpVhDYaKcPczb2Y3qidAw4xshPrj0D0mU55L4SyEnCYodMI5AH+5BoWL
 CXTVbmP28CFSJ0SxMBlUphf+PwC8E712izhEXRSITNjI8q2lrAWd0RS6FCQnG/Fml6
 6kJIkyDFuh9DWJ3YXTN/XM0H9dDkgDwUz+a5gWeE=
Date: Thu, 13 Aug 2020 20:49:48 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 5/5] ASoC: Intel: sof_sdw: clarify operator precedence
Message-ID: <20200813194948.GF5541@sirena.org.uk>
References: <20200813175839.59422-1-pierre-louis.bossart@linux.intel.com>
 <20200813175839.59422-6-pierre-louis.bossart@linux.intel.com>
 <20200813184541.GD5541@sirena.org.uk>
 <0b8b306f-f9b7-bb62-2fd2-9b396b862f6f@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="XStn23h1fwudRqtG"
Content-Disposition: inline
In-Reply-To: <0b8b306f-f9b7-bb62-2fd2-9b396b862f6f@linux.intel.com>
X-Cookie: Your mileage may vary.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org
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


--XStn23h1fwudRqtG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 13, 2020 at 02:43:50PM -0500, Pierre-Louis Bossart wrote:
> On 8/13/20 1:45 PM, Mark Brown wrote:
> > On Thu, Aug 13, 2020 at 12:58:39PM -0500, Pierre-Louis Bossart wrote:

> > > -	hdmi_num = sof_sdw_quirk & SOF_SDW_TGL_HDMI ?
> > > +	hdmi_num = (sof_sdw_quirk & SOF_SDW_TGL_HDMI) ?
> > >   				SOF_TGL_HDMI_COUNT : SOF_PRE_TGL_HDMI_COUNT;

> > Or better yet, just don't abuse the ternery operator like this and write
> > normal conditional statements.

> I count 795 uses of the ternary operator in sound/soc and 68776 in my local
> kernel branch.
> Can you clarify in what way this is an abuse? I don't mind changing this, I
> wasn't aware this is frowned upon.

If you write a normal conditional statement then not only is the
precedence clear but it's just generally easier to read.  There are
cases where it can help make things clearer (eg, avoiding the use of
scratch variables to hold results) but this is most definitely not one
of them and I don't understand everyone's enthusiasm for trying to put
them in.

--XStn23h1fwudRqtG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl81mVsACgkQJNaLcl1U
h9DqVQf+LMYtrJV4PgnyGpP/Yo/5ZBZyF+OTLU/mSGMhp2cPp4K1O0Gbg1Roq/q/
iC2zXn+PQCd1WOtx9BVvuxrLv4CxgkwuUp1t1/e3kEdjVo8DkduLhWS9AKgADez/
ila1e0hgPUdV1ssRnp4OQowzw9CLmSmLVcgBR4FXPkLcae7nFkT5kIJT8uU3wud8
w9DsEvM5r0DjhtbNEPqcvUucCLJwyjlS5EOj6XNSXejlRtklj4lK/lSYPACb4X1Q
7w1GDY9j3WuowcjVZfNKjJZb/0NgL55nfgVdlwTPycZAbHub0f3OqXWsKLh0TQh/
RGvGZQ9VRxsYKWgWykxyTDZOO6/LyQ==
=ppj9
-----END PGP SIGNATURE-----

--XStn23h1fwudRqtG--
