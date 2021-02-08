Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 967C3313BA5
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Feb 2021 18:55:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2C26D168C;
	Mon,  8 Feb 2021 18:54:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2C26D168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612806900;
	bh=44IGlSmiNO/ptXxnKcy68XxNRgV7v3IbiKamvOEVin4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZMbFRNqhjO9OEvZRBXQxv9YuWdSYr6QWAdULlE5jeV8xAwJT9DGmn615Q9xWCJXvC
	 N9C1P4dyUKi4Zz4kCAK6zqB4btMFZPTCmH6dKUFaM6AX0rZNYTxhv5ZyfmHrgkLcsO
	 iKFOC1DFXVDD0aharXovPROEzyoEklHDPVwdga4I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 16E5EF8022D;
	Mon,  8 Feb 2021 18:53:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0AA93F8022B; Mon,  8 Feb 2021 18:53:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7E9CDF80165
 for <alsa-devel@alsa-project.org>; Mon,  8 Feb 2021 18:53:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7E9CDF80165
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="OeXaoUKn"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 185EE64E88;
 Mon,  8 Feb 2021 17:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612806800;
 bh=44IGlSmiNO/ptXxnKcy68XxNRgV7v3IbiKamvOEVin4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OeXaoUKnOrSetN5gaNi/WfUvJWgwfbvr+KsrKvlHtTiBYUNjbQnTYhuSFW4lu+3Xx
 GkuQOB0io1DWeRMwX/6g4UYr/fQ/7y5fBuoiHvO45mneO64+3foNaS/pc27NTOe5t4
 78ym1uJK93sapCAmhzbWtLvooSDh1eD1JBvo2BCEa5ksYKYxvj/GAqvP1vMICDD0/7
 qiHNoN23jFayd7xaYj2uZrVodC4nbVfFboUugYMsKf3tyLyd3oKBgyyd37YoEKiMVP
 z1E9WiAjMf/VHwwpFBKS8kwcR74PWeqKMJodFIN/0wdKJ5rbgFEfG7jHZgEwAIELoA
 y1pVTnL0rQd1Q==
Date: Mon, 8 Feb 2021 17:52:28 +0000
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] ASoC: rt1316: Add RT1316 SDCA vendor-specific driver
Message-ID: <20210208175228.GJ8645@sirena.org.uk>
References: <20210208090432.1078-1-shumingf@realtek.com>
 <20210208122337.GE8645@sirena.org.uk>
 <9eff4f09-b127-5912-f62f-ed1e48db2e36@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="J2uG6jHjFLimDtBY"
Content-Disposition: inline
In-Reply-To: <9eff4f09-b127-5912-f62f-ed1e48db2e36@linux.intel.com>
X-Cookie: You will triumph over your enemy.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, lgirdwood@gmail.com, derek.fang@realtek.com,
 flove@realtek.com, shumingf@realtek.com, bard.liao@intel.com,
 pierre-louis.bossart@intel.com
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


--J2uG6jHjFLimDtBY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 08, 2021 at 09:26:10AM -0600, Pierre-Louis Bossart wrote:

> > > +	rt1316->rx_mask = rx_mask;
> > > +	rt1316->slots = slots;
> > > +	/* slot_width is not used since it's irrelevant for SoundWire */

> > I wouldn't expect to see any TDM stuff at all for SoundWire?  I do see
> > some crept through though :/

> We only use the mask information to let codecs/amplifiers know which
> channels they need to pick in a stream. This is useful e.g. when we have two
> (or more) amplifiers on the same link, and you want to tell amplifierA to
> use ch0 and amplifierB to use ch1.

...

> In most cases though all amplifiers on Intel-based solutions extract the
> same information, and the output will be dynamically selected based on
> kcontrol information. This is easier to use for e.g. orientation and posture
> changes.

Right, this was my expectation for how this would work - dynamic control
at runtime so you can do stuff like that rather than a more static setup
like slot assignment is normally..

--J2uG6jHjFLimDtBY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmAhelsACgkQJNaLcl1U
h9Drkgf+IZlqP3iFcqju4pXleyZRjU0S9YMzJ6G4aIHG/QdrhwMQ8l2GuS3HBsdx
Xt92mFMLbaRAeyzNn/RUjDqiWPsrkvxJgfUZFMi+bsCNbFyrJ9UY8yeXHkh01ipy
5KlOsCecjA/GXd0txJzPg9RnV9oiujloSal/aEWnFRsgdUqc+RPhkW7ctDJX6ypw
eVHTTQjOebUUjQ77sxk6oTbySFt4le7qCOwFhQe7zA+vlgwBmTVJZBB6S4dLXvdU
9GE2ZoXj4m+dYPjTnpmZhl3yM7PHGt3X7lq8az+ML72sshJpYOlIX0HsHE0RoL69
Zyr4Iwttaw/xyyMFl7Obw7ivckkQ2w==
=CyV9
-----END PGP SIGNATURE-----

--J2uG6jHjFLimDtBY--
