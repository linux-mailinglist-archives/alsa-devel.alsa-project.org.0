Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 652574F8510
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Apr 2022 18:38:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E907816B9;
	Thu,  7 Apr 2022 18:37:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E907816B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649349494;
	bh=anQLnsuZxYc4YusrMg10WYGJTNoSFZFyAbngTsYWJWM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dmicf6fx1pUORCuJseXHwwkaIBtJd1CoqEA3eNAy/ZWo/zSgZqUhkkrMGIkKLDmoA
	 Y5A6fkNn4BrR0J8ZbdNhh7Kc7eJUbWr8iScb5wjS0SrEtOK6z5EFWybyeW/A84W26n
	 LTuRP46kBe55RMlfHTbQjh/mtn1Q0ahcRlY6vo68=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5651FF80054;
	Thu,  7 Apr 2022 18:37:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0C3F1F8024C; Thu,  7 Apr 2022 18:37:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 584F4F80054
 for <alsa-devel@alsa-project.org>; Thu,  7 Apr 2022 18:37:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 584F4F80054
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="MeF0uNyy"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0187660C24;
 Thu,  7 Apr 2022 16:37:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DAFEC385A4;
 Thu,  7 Apr 2022 16:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649349426;
 bh=anQLnsuZxYc4YusrMg10WYGJTNoSFZFyAbngTsYWJWM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MeF0uNyyDZzNOfXb9zUW1ftJBxaHSlt6MObKb6s0BTNxUNtyW0lFoawXT0zMd8biU
 pyqo1BWrOCMPNYTfZ66BNUZnLqrtLxk7pFLwUgqBD5CX0hKn/Y4mpUjHd0Mi4mKaQ8
 YD9TNJta/h9laHydGgegv6HOVBGF2c/eVh+5RwzceEPyjFVqGCbcKON8iKHxpv0zb4
 NIGekAl0KkJJ574m7dBxP1xcotWdLh84f1yCIzzXhL64WdIh50aRoAjeqrtgJKREQv
 M5CGWtlSIYn4PlgnXO/WobFneA1owfz5rpaAb1YEY4qj8vSOeM1lxY5vKevedXQGui
 EQhk7UaTrKtcQ==
Date: Thu, 7 Apr 2022 17:37:01 +0100
From: Mark Brown <broonie@kernel.org>
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: Re: [PATCH] ASoC: rt5682: Add jack kcontrol
Message-ID: <Yk8TLUnEHRKstyxq@sirena.org.uk>
References: <20220407141316.5099-1-akihiko.odaki@gmail.com>
 <Yk7+jbQ0KBM0zVh9@sirena.org.uk>
 <96dae189-c0ff-4054-3d00-41c3b44c2cd6@gmail.com>
 <Yk8Ktyyt0veW4g+j@sirena.org.uk>
 <f86a10e1-b5a7-5c59-8e53-cec65d97234b@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="K9Hi8t9P2T4/0vtf"
Content-Disposition: inline
In-Reply-To: <f86a10e1-b5a7-5c59-8e53-cec65d97234b@gmail.com>
X-Cookie: Look ere ye leap.
Cc: Oder Chiou <oder_chiou@realtek.com>, Liam Girdwood <lgirdwood@gmail.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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


--K9Hi8t9P2T4/0vtf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

j
On Fri, Apr 08, 2022 at 01:11:22AM +0900, Akihiko Odaki wrote:
> On 2022/04/08 1:00, Mark Brown wrote:

> > That bit is very common but there's still machine specific aspects - is
> > the required hardware wired up, if it is wired up how exactly are things
> > wired (separate microphone jack, headset jack, one of many jacks?).  A
> > lot of the machine driver part of things is about labeling things so
> > that it can be displayed in a way that's easy to connect to the physical
> > system.  Generally the machine driver would define a jack and then
> > connect the CODEC to it.

> Whether the required hardware wired is told from the user of the codec via
> jack's type specified with snd_soc_card_jack_new(). The other details live
> in the codec.

So I'm confused about what problem this patch is intended to fix.  It
really sounds like there's some issue with the driver not using standard
interfaces that you're trying to work around but the changelog is not at
all clear.  The "doesn't use DAPM" bit is a bit of a warning sign, it
sounds like the audio signals to and from the CODEC aren't being
connected to the jack properly.

Look at how other devices with jack detection hardware handle this and
follow a similar pattern.

--K9Hi8t9P2T4/0vtf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJPEywACgkQJNaLcl1U
h9BD0wf/VfBhw9GQTwXU5Qj1Mq/d+fRP1+2jj+kUbV7xuu9nyDuVH7YLFP/Da2G5
dFgQBgY6vSA7++fPrbG4kqzGpvLPcNy6s+kjZHj2anBccZg/4Q9yADqp5ifggHcj
o/ltdaGMidJydvYgAF0EZnoW37eKRXNR/caF2nvE4aa7X9t/e3FOFQsfEP9nYi6Y
8zyr5aUabYQe5NYx903wgSoUKQoc0c8VS820KAxyoSw5T7Y3O/CprXZyFk8Wc05y
OpPLRzW2d/fqjWe/bhzaC2AYICirJSaO7R6fAMaV12fbZJj4i+F5K3+CU/7GlWc0
H3WCDElgw0O9PivSGGwzUasIlzOWYw==
=9nxM
-----END PGP SIGNATURE-----

--K9Hi8t9P2T4/0vtf--
