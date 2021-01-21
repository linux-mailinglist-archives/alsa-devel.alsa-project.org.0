Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 789D32FEA1B
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Jan 2021 13:32:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1CAA918DB;
	Thu, 21 Jan 2021 13:31:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1CAA918DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611232334;
	bh=7bGSxVwCt6R9lN37iL/5CUJ5ovzlI7BXQidFJHMM7lo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZtpyXs5bxGXvqSmn5XFktWlQ6+8T/sHPORAoKkGOEKpBKHmabv4+gK2V47Xy5H/Xn
	 kPoSts/zsIRcwyGU5gHci/Y9qlvw3DHnZAQ6GqFEJ6UDlwYq0refjigc35NNpy3XoF
	 tjgo9jGcOuLlXErqbBQeuxRXq5ysz/Ae8KxguCBc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0EE7DF80255;
	Thu, 21 Jan 2021 13:30:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 75E9DF80257; Thu, 21 Jan 2021 13:30:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 19A9AF80162
 for <alsa-devel@alsa-project.org>; Thu, 21 Jan 2021 13:30:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 19A9AF80162
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="rzsR9agW"
Received: by mail.kernel.org (Postfix) with ESMTPSA id B16C5239EF;
 Thu, 21 Jan 2021 12:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611232197;
 bh=7bGSxVwCt6R9lN37iL/5CUJ5ovzlI7BXQidFJHMM7lo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rzsR9agWQ/4c3CEBsqt3rv4Zskh+QaMjmsrn2zVKDUJYgr38RLFDnemkSNMsqA8sW
 ec6uVMa/gSVaxVl5wl4cX9Mo7KKVttP6OSV9fdqsuk7bDV7wqWVnIfwWWT62SpinfL
 hDkyrXtBNceokkWxTaE/my2wLLBgrU1zbZcSWGPNyIfb6obr88Ri9NXeAIKByFLuOe
 e1noewF0XHK1iM339vJSdCkGT9lWL36Xfof/AxZsE528tyX/E89BJ/WD0SEmQ6TH1Y
 R17ResVGGCf8xFPI/E7fsfCrOXGNq/c19NP86Mbg3frNo9UzC9mUdsNcLDxmCy8LI0
 1ETJam/tgOf4g==
Date: Thu, 21 Jan 2021 12:29:18 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: duplicate line at samsung speyside driver
Message-ID: <20210121122918.GA4588@sirena.org.uk>
References: <87h7nb9buz.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="M9NhX3UHpAaciwkO"
Content-Disposition: inline
In-Reply-To: <87h7nb9buz.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: Generic Fortune.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
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


--M9NhX3UHpAaciwkO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 21, 2021 at 01:09:18PM +0900, Kuninori Morimoto wrote:

> I noticed samsung speyside driver has duplicate line on audio_paths.
> I think it is typo or something...

Yes, that looks like a mistake.

--M9NhX3UHpAaciwkO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmAJc50ACgkQJNaLcl1U
h9AADQf/aptj6upcNMF8UUT9iPspFUAt69AhtWHgL7M8zr44ImXauL+PNG+N4vaX
ZrxLuAVnEfwMvrcX0yOemIFhccIM1xqlZfTq5UgqF/kVpvFJhA60T5qz0udw1IWN
cahqd9oOqhoJ/Pz3MeD3VQUDde4KUOEWaPBLcuceYjpenBD/p5Z+ooRp6/rv22aK
AJAHpGCoRY5R4Gj1pzBzHOxlL47uYZFL3BQx0y91RAL2a81jYZGC04ACT0ggoqVF
49MocOG4UHIs+1IziEc3abeL6Ax8KXm2FbgVJJxND9XKTGU9Mo+i95ee+OxPGYAl
iiacSMOuYhseOqOziM30kK02mCrosw==
=HiGb
-----END PGP SIGNATURE-----

--M9NhX3UHpAaciwkO--
