Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F53B32661C
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Feb 2021 18:09:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A187A1689;
	Fri, 26 Feb 2021 18:08:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A187A1689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614359348;
	bh=4NFCf/3GqnwD1v8f6EoY1Q4brnjtfbikb24cQ9AwLh4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iTgfFk+xi7cCRCvawIr9MlN8Y33ml3+GxsVjrAdv7DpFVPAQUC/MRJNuY/Qs2ywqR
	 sqt49nELqD5IUJ83wjMPQaSw2EXs4UxW2jY1W4nxpvrd2Y2ny/wOI4xRdsJFYwnFbG
	 PYRCVBbJ2X16QcCPkxqsRTICZLU+i57SVk0kydgo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 22ACCF8022B;
	Fri, 26 Feb 2021 18:07:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ED211F8016C; Fri, 26 Feb 2021 18:07:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 23CEBF8012C
 for <alsa-devel@alsa-project.org>; Fri, 26 Feb 2021 18:07:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23CEBF8012C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="V+0grJg2"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9176464DDA;
 Fri, 26 Feb 2021 17:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614359249;
 bh=4NFCf/3GqnwD1v8f6EoY1Q4brnjtfbikb24cQ9AwLh4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=V+0grJg2h++Wa9FqP9/wlmKLIcHwK1lb7ientXAaYoNSAm3kVidcQGCxB1PoQLP/e
 5OD+vyopx6xsts4XZxLxMOV15g7aMfj3RtRNiOsj/ktVql+jjXRwtm8rD+W8VBTc+i
 tdL04NtQ+/sVKiUWiFTp2EfXJmywqXPUI4LYwSg+kdb2DgFK75vsSVWleknSN7Ksry
 ySZTfxxCfE/KbnwW/ud1z9MrFHsJ1SCSeYmio73Yt9/hS9eLPp43UlxEd4nYcaMR2D
 AV4MJJvkwn2oXcjyR7QgY0JLejDg6Dvks0UNqB4Gf/qECkodXiLmQUF2b4BnMpN/md
 F5xmu+SSOTxtg==
Date: Fri, 26 Feb 2021 17:06:25 +0000
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Subject: Re: ASoc: soc_core.c stream direction from snd_soc_dai
Message-ID: <20210226170624.GA4518@sirena.org.uk>
References: <5598a2fc-9b49-ad5e-2265-fbc0593ead1b@flatmax.org>
 <0d9a9459-9cd7-d384-b1ff-72860895ad13@linux.intel.com>
 <73148789-58f7-2228-ae42-465cdafcff4c@flatmax.org>
 <52e1a640-b46f-b494-2047-849c1999eb28@flatmax.org>
 <7607dd99-0d54-2bab-7407-836a42647f4c@metafoo.de>
 <CAA+D8ANpWEggM4128p7=wzFNLdn6YF4JWQpm0fMbk_WWZGKBTA@mail.gmail.com>
 <20210223135743.GG5116@sirena.org.uk>
 <CAA+D8AN--agWZpcmsCrAD2OtMAEZxsr+41S1m8UNxynjdV0f+w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="45Z9DzgjV8m4Oswq"
Content-Disposition: inline
In-Reply-To: <CAA+D8AN--agWZpcmsCrAD2OtMAEZxsr+41S1m8UNxynjdV0f+w@mail.gmail.com>
X-Cookie: Academicians care, that's who.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Lars-Peter Clausen <lars@metafoo.de>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Matt Flax <flatmax@flatmax.org>
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


--45Z9DzgjV8m4Oswq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 26, 2021 at 01:58:12PM +0800, Shengjiu Wang wrote:
> On Tue, Feb 23, 2021 at 9:58 PM Mark Brown <broonie@kernel.org> wrote:

> > I'm not sure having two DAIs is an issue if you have them running the
> > smae format - does it cause any practical problems or is it just that it
> > doesn't seem elegant to you?  There were quite a few devices that pretty
> > much just had two unidirectional DAIs, in those cases it seems like a
> > sensible representation for the hardware.  If you can set unrelated
> > formats on transmit and receive then it's not clear that it's actually
> > the same DAI in anything except logical labelling.

> When an i2s device, Sometimes it is connected as async mode, there is
> different clock for tx and rx then there should be two DAIs,  Sometimes
> it is connected as sync mode, then there should be one DAI.

> So we need to register different DAIs according to the async or sync mode
> when the driver probes. right?

You should just be able to connect the same device twice for the other
end of the link, once for Tx and once for Rx.

--45Z9DzgjV8m4Oswq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmA5KpAACgkQJNaLcl1U
h9DjVQf/exgRM9Q2RZRM3LjSDpDmgFwxQxOtPrLusBTurdbkYwi2VTcfwmeRb44K
i6Nw/nwwKHqX0YC9POmjzGwS43F0zXV5dhWX33HUjy598LQTKneI6ntrUuAu/Cb1
kiyT7yeND8Bft/uztDodmZN2dlD2CEQNQuoZT3rrQxZ4aebnLFaV8tPc1BCmU+nI
5u7bqqwPvFm8jwDmklXmo2sEXQ9MLoXlTYAok0vY5eGXFN+9ZGoMXJGLx4hmDQ6t
Nfb0V+VKsEIHHmDbMiIiqhaB7/SaTAouaDecGU5M+Vmw83fuPl/N6YpQUxSqqUMN
zkmYjOoDEawNYLby6yR5RiQYj0Qr+w==
=uHGP
-----END PGP SIGNATURE-----

--45Z9DzgjV8m4Oswq--
