Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1288F28B633
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Oct 2020 15:30:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 78A40168D;
	Mon, 12 Oct 2020 15:30:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 78A40168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602509455;
	bh=Y2SVs9VC58sy97+sj10Si5NdhZ4WeQDhmXPiEOpS6ik=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AVYdEn2AYcIQH3vp8ToyEfNqH4WKkRv9kQ6LbAnI5BupYHtCWieoXlemDt9BvHj9a
	 8u1jrhQcwFEB1BI5DdrcWBKfZI4XeI9iyzDsMFY6kxPDBh09u2+hNJe93VfNnZNbex
	 VCcIFZ0O3CM8lYE8gs8e7KEME0ycjviQa/LYC8g4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EF149F80141;
	Mon, 12 Oct 2020 15:29:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 77D87F80217; Mon, 12 Oct 2020 15:29:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2CE26F800D8
 for <alsa-devel@alsa-project.org>; Mon, 12 Oct 2020 15:29:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2CE26F800D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="LKg6Herq"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 35382204EA;
 Mon, 12 Oct 2020 13:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602509342;
 bh=Y2SVs9VC58sy97+sj10Si5NdhZ4WeQDhmXPiEOpS6ik=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LKg6Herq9noTAGnms0oJmvfF2LePSpy4YWq/FXs72p2tqEaAM1PTFdFbv+aKdvwMq
 mtXf3srEQIxKfj1z+/6idNOFbs1Uhc/853uwfqu30e7yhQJp1w6xqTQjVtOMyg0I9l
 //y2n9mc2syhl5a9l3CiVYx/J5zxjjkGghF/6EhQ=
Date: Mon, 12 Oct 2020 14:28:57 +0100
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>
Subject: Re: [GIT PULL] ASoC updates for v5.10
Message-ID: <20201012132857.GC4332@sirena.org.uk>
References: <20201012130845.816462076C@mail.kernel.org>
 <a31e2b24-9ef4-c84f-a663-c2a44b0c8938@perex.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="0vzXIDBeUiKkjNJl"
Content-Disposition: inline
In-Reply-To: <a31e2b24-9ef4-c84f-a663-c2a44b0c8938@perex.cz>
X-Cookie: Fremen add life to spice!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>
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


--0vzXIDBeUiKkjNJl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 12, 2020 at 03:16:18PM +0200, Jaroslav Kysela wrote:
> Dne 12. 10. 20 v 15:08 Mark Brown napsal(a):

> > ASoC: Updates for v5.10

> I miss the SOF cleanups here:

> https://lore.kernel.org/alsa-devel/20200930152026.3902186-1-kai.vehmanen@linux.intel.com/

Yes, looks like they didn't make it.  Nothing looks particularly urgent
in there.

--0vzXIDBeUiKkjNJl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+EWhkACgkQJNaLcl1U
h9BAqQf+KP4wdvcYEU1hDVdbRCI9zuDTm923kmkYVfpV/LPBaUbapQnULYWcw3o9
6XmdRQF9y0+6qCNLPGNnYiHvCcSuU9rwXTfCI9HrHP6O9lrc779vJ6FqPgd4jb+y
63GpKcChZUaIhzA/oF8VNknoOvuoLpHdOJBo7MyISbVGgepWLD88lwQLZ9twCVm5
q07Kut7/HvwoANNrLFB9W4IxwB6q4cys6am0LiqZ/rtda7mXoH0zgRCZOZrKbhaT
NXiKXOjbUO17H6/9SM32AoBqnEqacUNpxyMdmIrrx1uz58ltpypi3Ek5tqT9C8Wx
aaC3sD1SvMgmY+/P7A0HtslCdAVAYA==
=3lqC
-----END PGP SIGNATURE-----

--0vzXIDBeUiKkjNJl--
