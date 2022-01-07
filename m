Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A7548783E
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Jan 2022 14:32:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DA6DD17BB;
	Fri,  7 Jan 2022 14:31:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DA6DD17BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641562348;
	bh=0uYEMZjLJVS5sam12tTkOe+hzpZiYLXEHLaLNwCfGCc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RMuZ/X+prUfXmpqtAloxEj/+FVi0gY0qBZTIs3quYjYNCwBhPFowxaJfV0RC2G/IX
	 BffBchJlmxNZQMf74rqyaAWv2G7jGFoF8F5M6VdjOhLmTvOPY5NSyI4HYrtQpgn1TV
	 9Z5g+D/P6KkX+LWCB16sg7MaKZyWgm2+j5rhkg6E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E572F80254;
	Fri,  7 Jan 2022 14:31:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C408CF80249; Fri,  7 Jan 2022 14:31:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B0F10F800AE
 for <alsa-devel@alsa-project.org>; Fri,  7 Jan 2022 14:31:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B0F10F800AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Zg1DSE+p"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DDE9C60ED0;
 Fri,  7 Jan 2022 13:31:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C125CC36AE0;
 Fri,  7 Jan 2022 13:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641562271;
 bh=0uYEMZjLJVS5sam12tTkOe+hzpZiYLXEHLaLNwCfGCc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Zg1DSE+pSqjbL/xEXs1k2mAZZkoHQ7MUIP0jvVadWavLKG56JOJzkXb2PZEf+D0dL
 LFt+lDXSFg6/eErJoPMQd9s/882BTjGOCkMngFWQdbPk4jGjjKVa9j32auHAdgmGBL
 wTtYYAmeUWuYjq4z75FSEk0ktlIVe0EuXx1Othv+3mukBj/Z7II1jPBI/uIJpm6GBJ
 8ePNBLT2Yt/BaDsHaZ1W0UOmwECrwC9j1PxXEJ+xQzYfK+WdwlgETRb+F1e28kv3L0
 li8Uq2MvjG70/jxIjpZkQJDb8Ebl4h1RcNI6ExrguOjHU4tPcoRDUt8oGblcOE/2Qw
 QjkBTEYHKp4dQ==
Date: Fri, 7 Jan 2022 13:31:06 +0000
From: Mark Brown <broonie@kernel.org>
To: Robert Hancock <robert.hancock@calian.com>
Subject: Re: [PATCH 3/5] ASoC: xilinx: xlnx_i2s.c: Handle sysclk setting
Message-ID: <YdhAmoqgikJBjgyt@sirena.org.uk>
References: <20220105225146.3517039-1-robert.hancock@calian.com>
 <20220105225146.3517039-4-robert.hancock@calian.com>
 <YdbjoQGKGedGLl/d@sirena.org.uk>
 <1265a3bbd578a3bd2350bc44b9e77de4f46c3f84.camel@calian.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="gMxMTRRkxDaN22vs"
Content-Disposition: inline
In-Reply-To: <1265a3bbd578a3bd2350bc44b9e77de4f46c3f84.camel@calian.com>
X-Cookie: teamwork, n.:
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "kuninori.morimoto.gx@renesas.com" <kuninori.morimoto.gx@renesas.com>,
 "tiwai@suse.com" <tiwai@suse.com>,
 "maruthi.srinivas.bayyavarapu@xilinx.com"
 <maruthi.srinivas.bayyavarapu@xilinx.com>,
 "michal.simek@xilinx.com" <michal.simek@xilinx.com>
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


--gMxMTRRkxDaN22vs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 06, 2022 at 11:25:28PM +0000, Robert Hancock wrote:
> On Thu, 2022-01-06 at 12:42 +0000, Mark Brown wrote:
> > On Wed, Jan 05, 2022 at 04:51:44PM -0600, Robert Hancock wrote:

> > snd_soc_params_to_bclk().

> I don't think that works here since that depends on the result of
> snd_soc_params_to_frame_size, which doesn't account for the bits per sample
> being forced to 32 when the 32bit_lrclk mode is active?

OK.

> > > +		if (!sclk_div || (sclk_div & ~I2S_I2STIM_VALID_MASK)) {
> > > +			dev_warn(i2s_dai->dev, "invalid SCLK divisor for sysclk
> > > %u and sclk %u\n",
> > > +				 drv_data->last_sysclk, sclk);
> > > +			return -EINVAL;
> > > +		}

> > This indicates that we should be setting some constraints on sample rate
> > based on sysclk.

> Is there a way to do this at this level given that it can only be enforced
> after set_sysclk is called? Most of the other drivers that enforce rate
> constraints seem to be more of a fixed list..

	if (drvdata->sysclk) {
		/* set constraints */
	}


like a bunch of other drivers do (eg, wm8731).

> > > +		writel(sclk_div, drv_data->base + I2S_I2STIM_OFFSET);
> > > +	}

> > Does the device actually support operation without knowing the sysclk?

> It could work if set_clkdiv is called to directly set the divider, rather than
> set_sysclk. simple-card doesn't do that, but possibly some other setup which
> uses this does?

We should be migrating away from set_clkdiv() anyway, it'll be fine to
require that such drivers be updated.

--gMxMTRRkxDaN22vs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmHYQJkACgkQJNaLcl1U
h9BVIgf/Q2MK18+tHc0UJi5ta6QuXqHachFJoBPjnmXzulh9FpO4FLMyxBszhU3j
Qq6oQEbX2XhTP46uR7mMgQb7VhGtz/yGPyJzfgaeqKIOvYzltUSCQC7trWmbOPb3
8Oq00svkuNtsNlUlSD2wtrdxqq3w1aW2uhWVl+gKOJt9anqhC3JWi7t+4/wsC5d8
o9tL5uc0t5JZLlcIhd2LOlV1rY8MW0ceoZxM9qCspGcyaNVxa5DMjUoEW7IuFpo2
DbdTQ1b63L9i69VPngVUdNwcE7WdqLvfuLyAAImkmfMiYIOXUAfKIWKFRs6g49OL
WqcnGHZ0v97KYrvrIoqt5u6+Eh74Rw==
=ptGF
-----END PGP SIGNATURE-----

--gMxMTRRkxDaN22vs--
