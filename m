Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ACD21B63EB
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Apr 2020 20:42:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A6FC9169B;
	Thu, 23 Apr 2020 20:42:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A6FC9169B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587667370;
	bh=oYkwurOVZg81RslFyHFFzzH5Q8hJevd0/981yqPwwCQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=L0SER9xkKLK+zKHCygAKKeZEELsWwhofyM/WLTUnSVZ/cZWH0ZXYYJ65++Tnxj5xi
	 uoi1ZOd125O6HAlpfgNjCCUj01A7+Ou8c7t92uzEQjaHWRhpH9nsVa2Pd4vYscbkWA
	 nxDYLEPZ4OSlfGpHKuRKlSMgcaIPcgCKktvqZGs0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C34DEF800F2;
	Thu, 23 Apr 2020 20:41:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B5BD5F801EC; Thu, 23 Apr 2020 20:41:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AA106F800F2
 for <alsa-devel@alsa-project.org>; Thu, 23 Apr 2020 20:41:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AA106F800F2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="NCcOv6Py"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8D91820767;
 Thu, 23 Apr 2020 18:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587667259;
 bh=oYkwurOVZg81RslFyHFFzzH5Q8hJevd0/981yqPwwCQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NCcOv6PyWvahW8ekC/G3WaPxUp0eGL1Va+hSJJNfaT1mpa7KF49WbXNWOsnWhxGGU
 psNkL0YMu1k8o/25LJBk4RiW6K5qyLBSNeae3/6zVuwhQ6gJtErU1/VPywysERcB+o
 UNSn1RZhBeNy2Q30zpwBqKTK7JchAO/DyKGZSpaU=
Date: Thu, 23 Apr 2020 19:40:56 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: ASoC driver names
Message-ID: <20200423184056.GS4808@sirena.org.uk>
References: <c57f21dc-412d-3057-6150-b96d96a20727@perex.cz>
 <20200423110437.GF4808@sirena.org.uk>
 <e31a20e6-91ab-2f30-f496-064bea07762a@perex.cz>
 <7b44a625-fe88-5eac-280f-daa15a7c83dc@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Er1qpsOqk0l6oMce"
Content-Disposition: inline
In-Reply-To: <7b44a625-fe88-5eac-280f-daa15a7c83dc@linux.intel.com>
X-Cookie: This unit... must... survive.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Takashi Iwai <tiwai@suse.de>,
 ALSA development <alsa-devel@alsa-project.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
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


--Er1qpsOqk0l6oMce
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 23, 2020 at 11:17:30AM -0500, Pierre-Louis Bossart wrote:

> I am all for Jaroslav's proposal of making the driver name the basis for UCM
> identification. we've been working on this since e.g. the addition of the
> sof- prefix creates a driver name that makes no sense after a truncation of
> the card name to 16 characters [1] [2] - still WIP.

> Making the card name more user-friendly is also a good thing, there's also a
> nice hidden feature when the card name contains spaces, the last word -
> typically the codec - is used for the card ID.

> But reporting an error when the driver name is not set is a bit extreme and
> would break all Intel boards. I think we want to encourage people to move to
> the suggested solution, but do we want to break existing setups?

That's an issue, yes - it makes me think we need a really strong case to
change things.

> I must admit I also don't see a generic solution when the card is generated
> from a DT description, it's not straightforward to translate parsed elements
> into human-readable ones.

We do let people just fill in an arbatrary string in the generic cards,
not actually checked how many do something sensible though.  This is a
big worry for me, if we're solving the problem by doing something that
doesn't work for generic cards that means that as the generic cards get
better and we need fewer custom cards whatever issues the current
situation causes in userspace will get worse.  For them the commonality
is likely to come from one or more of the components in the card and the
card itself isn't really interesting.

My instinct is that the machine driver name is being used as a
proxy for something else here and that if we need to change the ABI
perhaps we need to extend it rather than trying to shoehorn things into
what's there.

> While I am at it, I think we should probably avoid using the DMI information
> for the long card name. It's just awful. It might be a better idea to add it
> in the component strings (if it fits) so that UCM can use it internally, but
> it's really horrible. Even with the clean-ups suggested by Jaroslav I
> ended-up with this horror of a long name on my test device:

> root@Zotac:~# cat /proc/asound/cards
>  0 [rt5640         ]: SOF - sof-bytcht rt5640
>                       ZOTAC-XXXXXX-XX-CherryTrailFFD

I don't actually appear to have any DMI equipped systems with non-HDA
sound cards but looking at the systems I have (a mix of Lenovo and Dell)
they all have sensible display names in the DMI corresponding to the
model name.  But yeah, outside of enterprise users nobody really pays
attention to DMI so there's serious QoI issues in general.

> If we really wanted to be user-friendly we'd use something like

> "SOF card for Baytrail/Cherrytrail devices with Realtek RT5640 codec"

> and apply the same pattern for all machine drivers.

It kind of depends on how well filled in the DMI stuff is - if it's
badly filled in it's obviously not useful but if you have a clear model
name it works fairly well and matches what a lot of Windows systems do.

--Er1qpsOqk0l6oMce
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6h4TcACgkQJNaLcl1U
h9DDBgf+IgTyCjP1WaMVWrGmx/woAXQzKj0krf+NXWFO/DMvQqdZZUI/Et4rqYuZ
MwGEMM0i5IAWKkQJTy+2jXzg0qb3hgQH0rFG+BgX09fVAvg2cVzznSv251iVGvU1
sdP+2lYR1zExWEZVBILwFYdGIsrl7v97COToQvqXJEXU+J0fDIhxzTV1A+L5naUN
vRIbWnDAmsr1PGiU2MQTGAm6wjaQKI/vSQ55mR+Y8JvynKKs4CLmSA86CJRD3iCu
QX/HY6zsKyovEUzxKHiw7SecSQ+fbrXtzp4RfoY7s2HWtkYZoqA+bUtBk9oSvHMm
zKGZ45WuiKg3IXFG0ebefJXAE5B3yA==
=OgZZ
-----END PGP SIGNATURE-----

--Er1qpsOqk0l6oMce--
