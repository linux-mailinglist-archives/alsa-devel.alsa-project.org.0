Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 07AC2340535
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Mar 2021 13:10:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8E9581687;
	Thu, 18 Mar 2021 13:09:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8E9581687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616069444;
	bh=GM5Z3zsvDtAf7O8rQyIlPmINIJXGXfHhTCZjd/V/RQk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PA7xhJLdM27vv7CNcua+plFGjLf7FlATJtWlNTFXLMSBJPfahkh2MgPxk280y4UoB
	 OELco0qyeWEK0Rx2x3Z/20WAQX/Q6cboo2ACtfVZhmsSiVaFdYDF1O//0WJ03RwqYB
	 lSBonLkdMQ+RQy9XIdmvOmccieNqMCz75upxIzqU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1BA7EF80124;
	Thu, 18 Mar 2021 13:09:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 015B0F80165; Thu, 18 Mar 2021 13:09:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5EFF2F800E0
 for <alsa-devel@alsa-project.org>; Thu, 18 Mar 2021 13:09:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5EFF2F800E0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="P5FSaw8u"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6E35C64E89;
 Thu, 18 Mar 2021 12:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616069341;
 bh=GM5Z3zsvDtAf7O8rQyIlPmINIJXGXfHhTCZjd/V/RQk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=P5FSaw8uE9yuhxD69QUkhBn+tvAYbeHZQ296DaaIPNj7ZkPLJQHQy/Z46njbrkwAQ
 e5SnASc+SUjt821YDoFrDpQYNt2CQXu6OYzyQTM0DHYgMq/QoJ5w69X9c9vtHemX6x
 0V8IHX17saOZZGafqbpCYkdJn3U7pD861yNHOjqqyHHA5b7Vl1YmdX+/fNkePcY5oJ
 I4Ff8KxJIRncyqAELnAg0icJmRwAuYc6LQDxUdQhrttvw6pI7w2HXpgYNwmDHlylFL
 yzSldEicfnrvUleGHOscVZ/VAU8eniekIFKCHVB/cPfWThGYUq2Zcr5BURcuk4PZ0D
 J/sS7bn8jrzrw==
Date: Thu, 18 Mar 2021 12:08:57 +0000
From: Mark Brown <broonie@kernel.org>
To: Jack Yu <jack.yu@realtek.com>
Subject: Re: [PATCH] ASoC: rt715: add main capture switch and main capture
 volume
Message-ID: <20210318120856.GA5469@sirena.org.uk>
References: <a35835bae45f4f468dab8ad0df5ece10@realtek.com>
 <20210317140841.GC5559@sirena.org.uk>
 <5f4be33320754b11ad055aa66fc3a217@realtek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="IS0zKkzwUGydFO0o"
Content-Disposition: inline
In-Reply-To: <5f4be33320754b11ad055aa66fc3a217@realtek.com>
X-Cookie: You are false data.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Oder Chiou <oder_chiou@realtek.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lars@metafoo.de" <lars@metafoo.de>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 Derek =?utf-8?B?W+aWueW+t+e+qV0=?= <derek.fang@realtek.com>,
 Shuming =?utf-8?B?W+iMg+abuOmKmF0=?= <shumingf@realtek.com>,
 "Flove\(HsinFu\)" <flove@realtek.com>
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


--IS0zKkzwUGydFO0o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 18, 2021 at 03:35:31AM +0000, Jack Yu wrote:

> > > -	*l_val = (val_h << 8);
> > > +	*l_val = val_h << 8;
> > >  	ret = regmap_read(rt715->regmap, addr_h, l_val);
> > >  	if (ret < 0)
> > >  		pr_err("Failed to get L channel gain.\n");

> > This looks like an unrelated formatting change.

> Because regmap has its own callback for read/write, so the formatting change is required for callback.

This change is literally just removing some brackets that don't do
anything, the regmap API has no impact here.

> > >  	if (mc->invert) {
> > >  		/* for mute status */
> > > -		read_ll = !((read_ll & 0x80) >> RT715_MUTE_SFT);
> > > -		read_rl = !((read_rl & 0x80) >> RT715_MUTE_SFT);
> > > +		read_ll = !(read_ll & 0x80);
> > > +		read_rl = !(read_rl & 0x80);
> > >  	} else {
> > >  		/* for gain */
> > >  		read_ll = read_ll & 0x7f;

> > This too.

> This change is just to simplify the code. The result will still be the same.

Sure, but that should be a separate patch with a separate changelog
which explicitly says that this is being done.

--IS0zKkzwUGydFO0o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmBTQtgACgkQJNaLcl1U
h9ARiQf+NoXTvfXSJssZMKEijOQyfYRrPi4Cz64JbcD5DUa/LMvuJYLJ8yTfgAJW
TdnIZ7KJEQSO34Lw3gmxqYG2+R8Rx8D+qCVtQte7DCwR7H5OYPUvcwmFU2DiX7Bh
nt+sw/M9xFv1kXZn8/WCaEbkO23oXIFcz872DUFBJYWRv0Gzf9CvUk4q6etaEy4v
lbTn/RkdyJVDx2Dmi7Yn0tPDui4qxXXRRdTLbuVPYnIH4a6lu7hCSA6t67ysPykf
xheyLKmNRDWcyJlK3S0wS/aCMXI0BarI8LXs7QIOtGFAf9/AAPFq4v13VxrrAI89
ocr6kOeAOEtN3hzPKf1swIGgxXB7sw==
=4f9f
-----END PGP SIGNATURE-----

--IS0zKkzwUGydFO0o--
