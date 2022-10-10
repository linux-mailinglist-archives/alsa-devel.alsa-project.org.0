Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 87C385FA16F
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Oct 2022 17:54:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DD3332DE8;
	Mon, 10 Oct 2022 17:53:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DD3332DE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665417282;
	bh=LMeKhxfmAfdwjuQ3iXb8eIas5DAK6CL7U9L+xY2kA6k=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BCn0kO5zKTSblZt1NUemCGEG8J4gSHtroMkWifUj5A0PrqxuaATuye+wDwu1B3lxf
	 fI054RkopMpKCC6vWRtw4UhXn6Ma7/oDM9PkzNlA50V2SzK7G8G4yN6W/ukDfBZ4GW
	 Y1zbTuW+pOHYLuZkGGwdDrqRqiP0kiflnkWtqntI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 54D5EF8032B;
	Mon, 10 Oct 2022 17:53:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CACF2F80256; Mon, 10 Oct 2022 17:53:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 940E5F80107
 for <alsa-devel@alsa-project.org>; Mon, 10 Oct 2022 17:53:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 940E5F80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="eiOYrzJ5"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1398560F83;
 Mon, 10 Oct 2022 15:53:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF46BC433D6;
 Mon, 10 Oct 2022 15:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1665417220;
 bh=LMeKhxfmAfdwjuQ3iXb8eIas5DAK6CL7U9L+xY2kA6k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eiOYrzJ5l++msOUwryKwXxVCMQwoWdUrtoRvCfAlYcxU1+thvwwJoWxRXzGz3pihQ
 xCgtc+AHvisvr/XI46QwOCJ9vXAqjlBKFwXTl7NYfe5xops+V78FBdliz4xY188BYN
 4j9Y/+pv6T6CYtRUy+81cy1lWuvGmlUBZ2OLYR/MUHXR/ODd4SgRzNBY7tWcVszzfB
 Lk+Z41U/nyjQAuZkXJy03/TLUchAJKa57Sw2GvHlJQFcJIiiOTBRYHoRob0GzBRKKz
 wfKt9ijgvJ4cf2z9ngaJ14pz6aLS5w1ZLTrCBxYiZi0BFwl581wfbegxZtVftBRJqH
 LQ9tLhX77+mUA==
Date: Mon, 10 Oct 2022 16:53:35 +0100
From: Mark Brown <broonie@kernel.org>
To: Siarhei Volkau <lis8215@gmail.com>
Subject: Re: [PATCH] ASoC: codecs: jz4725b: Various improvements and fixes
Message-ID: <Y0Q//+onKu16VQKH@sirena.org.uk>
References: <20221008181655.2747857-1-lis8215@gmail.com>
 <Y0P/u4pJT8rup8Za@sirena.org.uk>
 <CAKNVLfZhH3s=jBWAoSppXSotY9giRRJbub9MqxCtjdZKh4fprg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="zP4tF1TsbOA9/jYj"
Content-Disposition: inline
In-Reply-To: <CAKNVLfZhH3s=jBWAoSppXSotY9giRRJbub9MqxCtjdZKh4fprg@mail.gmail.com>
X-Cookie: This sentence no verb.
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Paul Cercueil <paul@crapouillou.net>
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


--zP4tF1TsbOA9/jYj
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 10, 2022 at 06:20:24PM +0300, Siarhei Volkau wrote:
> =D0=BF=D0=BD, 10 =D0=BE=D0=BA=D1=82. 2022 =D0=B3. =D0=B2 14:19, Mark Brow=
n <broonie@kernel.org>:

> > and will presumably cause problems for any existing configurations...

> I'm curious why this didn't cause problems earlier, as the wrong
> control was used
> for the Master Capture Volume.

The issue is that if someone is relying on the current behaviour and the
control starts doing something completely different they might be
surprised, it at least needs a separate change.

--zP4tF1TsbOA9/jYj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmNEP/4ACgkQJNaLcl1U
h9DKlQf/YSQIWB5gynvqXZHjvurY3pBrf82bZh2fiApXWPANyOMBHxVXG2wdg/GZ
+6nAX7UhTnJeSfTK0CoifZkwYXiOPs+qwIi76mcUirMGJU+uxG0G3mXfAu3asRTa
IG+B+uy8RInF2vcUzwamCRSQeMJA/DoiI874PAc4szy+adG1TnYQtX5AFtEjB12R
xt2lOLObkSeEpGIJgj8yMglpHR0+Tu186ojscpvs1JfQBwePULy14fOfOHgcwal0
Ym73bAbOh8HNigz7UXZmiQ8LKLWLnTER+Q7ZEDcjvfSl65jo96GhtnSvJoRMocwr
x7+RmH/x/kDNZa27gVnwfrUsNjH7Dw==
=EaAl
-----END PGP SIGNATURE-----

--zP4tF1TsbOA9/jYj--
