Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F574E3DE0
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Mar 2022 12:57:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 241801666;
	Tue, 22 Mar 2022 12:56:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 241801666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647950268;
	bh=7xG5mNqi2R3wWhDgrDX/C46cSMJD++/cNXEOMfP18Vw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iN/3QCToMDi8Rf1iF2LcsLFJIMeWN4NJU54hWzlrkwzJ9iCGbHZUEjmjGnZZCg4+9
	 QY6ixSb97Jnyid5jS429O4jPiyjALJGg4ivvPHoBXj2ta5h8W9aaUMljMG6boHOVhw
	 p97O8q/BYBK9ESdEqgJg9Ul4o6r+7UsiNw8Zu5nk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 96FBFF8032D;
	Tue, 22 Mar 2022 12:56:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 97FAEF800FD; Tue, 22 Mar 2022 12:56:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 40035F800FD
 for <alsa-devel@alsa-project.org>; Tue, 22 Mar 2022 12:56:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 40035F800FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="QIpx7t1I"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B0F3D61323;
 Tue, 22 Mar 2022 11:56:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE5C4C340EC;
 Tue, 22 Mar 2022 11:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647950189;
 bh=7xG5mNqi2R3wWhDgrDX/C46cSMJD++/cNXEOMfP18Vw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QIpx7t1IES4wkzWdvaxOHvTLwjzz7j19a5wm3BtA9HcmeGkBpsSdSQemcv7Sog13g
 k6EY7vZvfoDb2bQOSwjMzcmsg7HZlgC6mdbYVRAqNdMUwsfdhMGb2RrIR4CuDhq6Id
 YVHw0K76gswezQyp8EdBfAaJEpgyYWWtjPXfKV+U87kVlJP/JjbtZszQMkYiBzhw0j
 X4BiJsRDv7mYgG7H/lAdscjlMqBw3bzIuclgUbcik6iRdw5SBprM4caFh4vcxDxjR4
 PNImqJITifwuR2AaoX/SkYe9CTldKyXEJXAw4zatenGcxPi1xAOFPsmp+1/TE8708G
 +wu1ADQwNJPBA==
Date: Tue, 22 Mar 2022 11:56:24 +0000
From: Mark Brown <broonie@kernel.org>
To: Raphael-Xu <13691752556@139.com>
Subject: Re: [PATCH v3 1/2] Rename tas2764 to tas27xx
Message-ID: <Yjm5aMn/i2DgDwG5@sirena.org.uk>
References: <20220322070438.506-1-13691752556@139.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="DhF17j+PZD3OJT8q"
Content-Disposition: inline
In-Reply-To: <20220322070438.506-1-13691752556@139.com>
X-Cookie: Drop that pickle!
Cc: navada@ti.com, alsa-devel@alsa-project.org, shenghao-ding@ti.com,
 raphael-xu@ti.com
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


--DhF17j+PZD3OJT8q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 22, 2022 at 03:04:37PM +0800, Raphael-Xu wrote:
> Signed-off-by: Raphael-Xu <13691752556@139.com>
> ---
>  sound/soc/codecs/{tas2764.c => tas27xx.c} | 0
>  sound/soc/codecs/{tas2764.h => tas27xx.h} | 0
>  2 files changed, 0 insertions(+), 0 deletions(-)
>  rename sound/soc/codecs/{tas2764.c => tas27xx.c} (100%)
>  rename sound/soc/codecs/{tas2764.h => tas27xx.h} (100%)

This needs a change to the Makefile and Kconfig as well but is otherwise
fine, however I was expecting another patch or two doing the updates
that were in your initial patches so we'd end up with three or four
patches.  Sorry if that wasn't clear.

--DhF17j+PZD3OJT8q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmI5uWcACgkQJNaLcl1U
h9DD/wf/cHXWc5YwfSqGHwjCPfc6LROOe9Jx4tWXOMCBmCmgJGFuXxycDEvhJeds
zzWTXY7J+HFHFx90kTMe48ywGM3Wvt6zkMZthf/uNZanlEdEcjMPmGiR4JcD6xzJ
79HbD/jYYEd4/F6jjPUXkxaJj2k1J5J2x9fvwXmglmS+5O1qBAfWqpAmEQ1B+RqI
UOnWmImSRldgFITerW6ID9PgqGZHg8c5CjW3kIq5uuBAkHbNfEbGmM0W9zEsN2dy
PwodnZfeGGj5bqQ3WYURc9kTmaDNeOEIKiKS4xnEBsOdSGh3fn2Tc1MgMhcoAN7u
AGb9FORiW9k6rAmJdS6iwoeweRdZpw==
=M4/Y
-----END PGP SIGNATURE-----

--DhF17j+PZD3OJT8q--
