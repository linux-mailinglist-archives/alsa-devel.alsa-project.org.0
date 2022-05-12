Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD73D524B6C
	for <lists+alsa-devel@lfdr.de>; Thu, 12 May 2022 13:20:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7DC661AC7;
	Thu, 12 May 2022 13:19:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7DC661AC7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652354434;
	bh=Wboi126+YfBCgOZel66M9W/DGH8CF2/wuN0i039Wu6A=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rPJ5+D/+aAHd4A/k83RSus3UCiQFKRLfL48rbpKaqnxtabzzZprEeI+DiHWg2oPUF
	 zL4HRpihqmcjZl76AyhOxcavcm6yyoxkzHp/5+hXwbb9k8yTtHDi8q+Gd7TNnY8XYK
	 qcRnk0+4OkK0zVB/KevhQZGFEnKMY0tSM5phBxKU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 77876F80249;
	Thu, 12 May 2022 13:19:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CB649F80254; Thu, 12 May 2022 13:19:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 63F22F80154
 for <alsa-devel@alsa-project.org>; Thu, 12 May 2022 13:19:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 63F22F80154
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="XZESPBE0"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5AD64B8279B;
 Thu, 12 May 2022 11:19:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C2DDC34113;
 Thu, 12 May 2022 11:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652354349;
 bh=Wboi126+YfBCgOZel66M9W/DGH8CF2/wuN0i039Wu6A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XZESPBE0mbOTwKOmNVL1PzjoweYsLMFyPKWGtzvQhQWoIa9wXhkBVdQML2hjBgvCB
 /AVhPc0xAIuR1UWKTa5OFR1ChZkqkXnX4yul7/l88pJxcf0KYWCIXHyUAGjZhGqocK
 pnJ3zP7B9dU8GorwT78p1Z6HvgbXxZmAHyE2kC7HWWDWHydbL7lqaal+W81mC1WNEc
 n95QhdcsIOCqov3D0aDefEKJ7cRhg81/V/LccDFxGbPs4ECm9XUGptBaI6ECAcWUMH
 gMUhM8a3YT64r2xuImOSACMoDeBovCvLaAbEv2FAdgRkczkPhZyCkJEIv1UxtiLZoU
 831Nvw6fKMFtQ==
Date: Thu, 12 May 2022 12:19:03 +0100
From: Mark Brown <broonie@kernel.org>
To: Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
Subject: Re: [PATCH] ASoC: max98088: add support for reg_4a_cfg_bypass reg
Message-ID: <YnztJxdSFau6SYC5@sirena.org.uk>
References: <20220512074359.446999-1-tommaso.merciai@amarulasolutions.com>
 <YnzdcubW7m+CwnvN@sirena.org.uk>
 <20220512104642.GD649073@tom-ThinkPad-T14s-Gen-2i>
 <YnznExLDOvRpXNVh@sirena.org.uk>
 <20220512110959.GF649073@tom-ThinkPad-T14s-Gen-2i>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="vzfHvuAqf/UpV8KV"
Content-Disposition: inline
In-Reply-To: <20220512110959.GF649073@tom-ThinkPad-T14s-Gen-2i>
X-Cookie: Oh, wow!  Look at the moon!
Cc: alsa-devel@alsa-project.org, linux-amarula@amarulasolutions.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linuxfancy@googlegroups.com, linux-kernel@vger.kernel.org
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


--vzfHvuAqf/UpV8KV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 12, 2022 at 01:09:59PM +0200, Tommaso Merciai wrote:
> On Thu, May 12, 2022 at 11:53:07AM +0100, Mark Brown wrote:
> > On Thu, May 12, 2022 at 12:46:42PM +0200, Tommaso Merciai wrote:
> > > On Thu, May 12, 2022 at 11:12:02AM +0100, Mark Brown wrote:

> > > > These look like they should be DAPM controls since they're controll=
ing
> > > > audio routing but they're being added as regular controls.

> > > Sorry again. You suggest to create a new structure for these entries,
> > > for example:

> > If that's how they fit into the routing for the device, yes - you'd need
> > to define the bypass mixer as well and set up appropraite routes.

> I added this reg as regular controls because this reg is pretty generic
> as you can see this controll bypass of some output, not all.=20
> What do you think about?

That sounds exactly like a DAPM control, please make them DAPM controls.

--vzfHvuAqf/UpV8KV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJ87ScACgkQJNaLcl1U
h9Dw5Qf+IAzN05yBHx3+P8CnH/ZzZvCdfKCMrlXsGMWEkbvsl7M3RXLXCsyK7ZR7
3ENP4a7u/wSJi01dsgRrP1lz+NCTk7tfjLOFSgfyWDKIwvdRQ8C2S3HfGNwX2FSu
pDN2MgiPqvodD4XiYPQcVTq8SXE6rA0y9kmiflbpQSCWIz4UyJmCAL6nz0AdjuJ9
6XowU37kD6PeDIZlUABJmUhGLChCpi5+WBwE+yXHtOFyu0JNzl+p89ZmvS1KnQUI
YmIDIgNFGC4augrVxeOslEOye6MV58IHCSK2a6FS8IyJFs8lmVkNUtiouASIsU54
dsoyyOewGtIR4a3aG+OpiTFOAVWFNA==
=JvJ6
-----END PGP SIGNATURE-----

--vzfHvuAqf/UpV8KV--
