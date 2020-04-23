Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 080A51B6081
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Apr 2020 18:15:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 91A9511C;
	Thu, 23 Apr 2020 18:14:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 91A9511C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587658505;
	bh=vDHVx4FW0XNnRYZbKBU9+aaxnz2beeSbDiBL6DfrOvE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uJrc8zsN9G7TKH+DzJrNTfyBvYrd3MASulsbnd+OFORBl2CZCr29NVQyAo0Mbr7KL
	 NNigxh2Tlq7sjT+wB2reo0heWr4Eg/9YEWgbFYtsKhnALSFnOsD/4EWmsp4lNy82qs
	 8mQl6ru2WX0cg3UU+pscvXAtjnm0yOT1PGEf7yOU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7CF91F800FF;
	Thu, 23 Apr 2020 18:13:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E5F44F801EC; Thu, 23 Apr 2020 18:13:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 194E3F800F2
 for <alsa-devel@alsa-project.org>; Thu, 23 Apr 2020 18:13:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 194E3F800F2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="GZK12FzW"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D521520728;
 Thu, 23 Apr 2020 16:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587658390;
 bh=vDHVx4FW0XNnRYZbKBU9+aaxnz2beeSbDiBL6DfrOvE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GZK12FzWq1ySsNfwDW1hsUp6FVLN/UCi7+FgM54YUEcI03ERqBpBQU4FXN8pamH4f
 nhgj09ezW1gjVunuu7PLK/XmwFnMWjZ2YIBFS/CEQWyYsp5uRMFHMZo3lB6idW0inu
 iu1fjHVSi9t6J9LEsnAZDOpvTGHVHlcw09uLgJC4=
Date: Thu, 23 Apr 2020 17:13:07 +0100
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>
Subject: Re: ASoC driver names
Message-ID: <20200423161307.GP4808@sirena.org.uk>
References: <c57f21dc-412d-3057-6150-b96d96a20727@perex.cz>
 <20200423110437.GF4808@sirena.org.uk>
 <e31a20e6-91ab-2f30-f496-064bea07762a@perex.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="jh06fhy6YTawvwPV"
Content-Disposition: inline
In-Reply-To: <e31a20e6-91ab-2f30-f496-064bea07762a@perex.cz>
X-Cookie: This unit... must... survive.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Takashi Iwai <tiwai@suse.de>,
 ALSA development <alsa-devel@alsa-project.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Pierre-louis Bossart <pierre-louis.bossart@linux.intel.com>
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


--jh06fhy6YTawvwPV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 23, 2020 at 01:19:31PM +0200, Jaroslav Kysela wrote:
> Dne 23. 04. 20 v 13:04 Mark Brown napsal(a):

> > With ASoC systems there is no clear controller - you've got a bunch of
> > different components, usually connected by separate buses, and it's not
> > super obvious what if anything should be the singular name that gets
> > picked for some grouping of devices.  The whole point of the subsystem
> > is to glue a bunch of independent devices together, we've generally
> > picked that glue as the driver name.

> I refer mostly the top-level code which creates and registers the ASoC card structure.
> So it seems the platform name for many ASoC drivers should be there.

At that level you could just say ASoC...  bear in mind that a huge
proportion of cards are going to come out as one of the generic cards
(especially on DT platforms where the firmware situation is less
shambolic) which I'm not sure is super useful for grouping things.

> > Without knowing what you're actually proposing it's hard to know, and
> > there is the risk of userspace breakage here when you change things
> > people are relying on.

> +#ifdef CONFIG_SND_SOC_DRIVER_NAMES
> +       card->driver_name = "SDM845";
> +#endif

OK, so really I think your actual need here sounds like reference
platforms here.  There's obviously some overlap with drivers but only
for the things which use DPCM and ideally we'll be able to move these
things over to drivers going forwards which would mean that you'd have
the same problem again.

> >>    The goal is to group the related UCM2 configurations and do the required
> >> split inside the UCM2 top-level configuration file based on card components
> >> string or other card identificators (related to the driver).

> > This sounds like you either want some enumeration of the card components
> > or perhaps you're looking for some for some indication of the reference
> > design that an individual board is based off so you can have a generic
> > configuration for that reference design and then override bits of it?

> I'd like to group the related configuration files and it seems that the driver
> name field in the CTL info structure is misused (duplicate information).

For the generic cards you're not going to get a useful grouping based on
the name of the machine driver, they are flexible enough that there can
be minimal similarities in the underlying hardware or what it looks like
to control in userspace.  You are likely to be able to get useful
groupings based on things like the CODEC or the SoC from them but the
machine driver name isn't going to help much.

--jh06fhy6YTawvwPV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6hvpIACgkQJNaLcl1U
h9CayQf9FL8v7yIavrfZo0jCEKe6B/9Ds9FikDgIFXkbddydZovau7ePkIscX7VI
uCQz3u9A7f0/OAWKufDqiSwHFC/Pxx/fhIjFdvhbhWNDts8pbgs24736TqkXCoDg
RNcATbXGwrcPIIxuuOhLZkhNEpqil4khSVqHwC3VhZOH0pdwvpqf8XksekoarLH9
oFQx1i7nD6AtV6vsX6r/aFbhmroXbGe/Rl4thZziPl0sHMfjMeN/VsGkE0HDCPTm
Cy8VONsAjywDn45WbRBT9LtrzmtvAFcXePuyznOUX02PeExraieJ+d39txbO3BFC
IkdWTy9Ndo7rwTJK8hV2TX3j4Gdprg==
=f/+U
-----END PGP SIGNATURE-----

--jh06fhy6YTawvwPV--
