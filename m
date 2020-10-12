Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A7F528B3EA
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Oct 2020 13:38:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3E5D6168D;
	Mon, 12 Oct 2020 13:37:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3E5D6168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602502702;
	bh=zPTLYmvSGS/cMRVixgLVelg6vIMfedfSXZOI3BwW4ZI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=M5OyM5pBpWS+OAmoqe/M9EeiMv03e1iliIHGb2cRiB5sIAso1j2wieBxiW1qbGgFq
	 SrDcZ5BmvdRf2/F8tjU7BX0Uy5w/Dmj54QP82l0mBdwUqFVS0CXSh8WfvReFJ2RCsr
	 Bery7/7m0+P4WQUOEE0tIfhD/gU1vaFtgsGO7vbM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B8D32F800D8;
	Mon, 12 Oct 2020 13:36:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 32BC9F80217; Mon, 12 Oct 2020 13:36:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 09037F80141
 for <alsa-devel@alsa-project.org>; Mon, 12 Oct 2020 13:36:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 09037F80141
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="qVYS2wSo"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0EB4E2080D;
 Mon, 12 Oct 2020 11:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602502590;
 bh=zPTLYmvSGS/cMRVixgLVelg6vIMfedfSXZOI3BwW4ZI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qVYS2wSoxtWo/nddYYXgDZTqfEqpAKjEzcabWt2KUKl5fFUaErAeCbuX8UQjhoqlX
 RgsVuiQF9cKrZcbEZ8boWR0U4/6ZyZAqN0YHCHri+HsfepDumkZb2LNFD+oQcglTu5
 owzholIgw2Cuh2uqsh/UQuDO2KcR0LTvCBUH9APA=
Date: Mon, 12 Oct 2020 12:36:26 +0100
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH v2 00/13] ASoC: Intel: Remove obsolete solutions and
 components
Message-ID: <20201012113626.GA4332@sirena.org.uk>
References: <20201006064907.16277-1-cezary.rojewski@intel.com>
 <cf1fb47d-412f-48fd-4501-e63f1db32bc1@redhat.com>
 <s5ha6wrretr.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="mP3DRpeJDSE+ciuQ"
Content-Disposition: inline
In-Reply-To: <s5ha6wrretr.wl-tiwai@suse.de>
X-Cookie: Fremen add life to spice!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, filip.proborszcz@intel.com,
 krzysztof.hejmowski@intel.com, filip.kaczmarski@intel.com,
 harshapriya.n@intel.com, lgirdwood@gmail.com, ppapierkowski@habana.ai,
 marcin.barlik@intel.com, zwisler@google.com, alsa-devel@alsa-project.org,
 pierre-louis.bossart@linux.intel.com, Hans de Goede <hdegoede@redhat.com>,
 amadeuszx.slawinski@linux.intel.com, michal.wasko@intel.com, tiwai@suse.com,
 andriy.shevchenko@linux.intel.com, cujomalainey@chromium.org,
 vamshi.krishna.gopal@intel.com
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


--mP3DRpeJDSE+ciuQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 12, 2020 at 11:09:04AM +0200, Takashi Iwai wrote:
> Hans de Goede wrote:

> > replacement and dropping the old code ?  I'm not sure if that is such
> > a great idea, what is the fallback plan if testing does find significant
> > issues with the new catpt code ?

> I find the action a bit too rushing, too.  OTOH, the old code wasn't
> well maintained, honestly speaking.  So, from another perspective,
> switching to a new code can be seen as a better chance to fix any
> bugs.

That was my take as well - the old code seemed to be very fragile for
structural reasons which are hopefully addressed here and Intel seem
willing to actively work on supporting this version.  I have to confess
I had assumed Hans had seen all this stuff going past, the new driver
got quite a few rounds of review.

> Of course, we could keep two stuff parallel, but it's rather
> confusing.  And, the HSW/BDW devices that need SST are quite rare and
> old, so the impact is limited, I guess.

Yes, figuring out which of the various x86 audio driver options you need
is fairly painful ATM.  Worst case it's just a revert of this removal
commit.

--mP3DRpeJDSE+ciuQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+EP7kACgkQJNaLcl1U
h9ClYAf/dhEDD58DUhFdQHw2ClS+7rFobrVIyX+Uz6fkFs60d/A7xutX5WOO9diW
tpWT7gddCcFRgxbB0gtjQqqSEyrN6r6nok3Jk9yI1pu7maChhhsZsvVEf24VCwwI
xYLPUH8OemHFKIsSNZG3pqI6cIKNnzFqQ7TJ9iBMAIj5cmrbHVoxiXDXtweMAk2I
QNyezlY+4LNWdG7N9dKLz1wCV2JXSU1FrUXuUI4ZvIXpQ01l4uB/1JrgZ+LRTxeA
WFZE4ElNQ5jCzkWcee71F68X9MFan/Iw6DCkvWTaFoY57yqHSDQc0JnqWLDG1hug
IoeFLFFyPPZ1zdsNQhYT8jjbil95jA==
=Gf6U
-----END PGP SIGNATURE-----

--mP3DRpeJDSE+ciuQ--
