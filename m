Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E8D1561779
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Jun 2022 12:17:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C0E1416C1;
	Thu, 30 Jun 2022 12:16:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C0E1416C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656584236;
	bh=jcZKWVt2cjtK89lhBmxZ8YIRJjZNI/FPZusa5VlI/N0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bWi2UqIzlVf+KBDiw8Ayenu+w57ovyxTHtlU0ecekfnLpFm0hAWN97zVqXgQP5W32
	 Jq8dU1uvagolLROHSbBId8rh+e8+UmQQ9L7jhqRBN/ebsABwoCpdxP4qN552TNuLT2
	 War8j7QMqu0xqcyuB6HK177VqbAxcwYtUfKGEdUk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2907AF8014E;
	Thu, 30 Jun 2022 12:16:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E552DF804DA; Thu, 30 Jun 2022 12:16:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 326A9F804D8
 for <alsa-devel@alsa-project.org>; Thu, 30 Jun 2022 12:16:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 326A9F804D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="GO1V87FL"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 437C862169;
 Thu, 30 Jun 2022 10:16:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0464C34115;
 Thu, 30 Jun 2022 10:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656584168;
 bh=jcZKWVt2cjtK89lhBmxZ8YIRJjZNI/FPZusa5VlI/N0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GO1V87FLObd07KNLLcwvaWddzRv1K4pv7OXda6p+Tcr3NU92e8x7ep8SESYToljbI
 +sJmDbECw2nWGMMgYuuEoT2mPCaFbckKYLDtd01KZxwKNSnvfO+ZwFxjl6oTwQXXr3
 ZEOXyEXlCrFQx0ra5Hix83+sN5+7ITnBUE3hzjLEBgWTnGDI1FDEjLe1MFckz3JDqv
 e6rBZLnCs/X3NwpJkbQsVGk5GqUn7svZPK/MBctvWcT8j+CdxAH0EQwaaJC3rP/Mn0
 s3YoB8Nf4fK7Rw5OeoQmZMkKLdHP5xrnFiAYzzCr0oq7K8Jgz4WTk7ThKeuGCSPS5e
 rN4NwhQMjLfGg==
Date: Thu, 30 Jun 2022 11:16:03 +0100
From: Mark Brown <broonie@kernel.org>
To: Li kunyu <kunyu@nfschina.com>
Subject: Re: [PATCH] sound: delete a semicolon
Message-ID: <Yr1348gai+/fwvfd@sirena.org.uk>
References: <20220630020347.7148-1-kunyu@nfschina.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="eFiyZ/QO4UMV0jds"
Content-Disposition: inline
In-Reply-To: <20220630020347.7148-1-kunyu@nfschina.com>
X-Cookie: Today is what happened to yesterday.
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com, jonathanh@nvidia.com,
 thierry.reding@gmail.com, linux-tegra@vger.kernel.org
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


--eFiyZ/QO4UMV0jds
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 30, 2022 at 10:03:47AM +0800, Li kunyu wrote:
> extra semicolons could be deleted.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--eFiyZ/QO4UMV0jds
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmK9d+IACgkQJNaLcl1U
h9DF7Qf8CAYvofkRcK5v5MvU90SRuDZNQcjuoWbLJ9bGdMBpQRcmMqGmFj1+aP/G
zXcMRgWG8gFi/MHnzncM8sRVIcubHZZtsNEJ7sAoCqtEwMbCYk3GrW+wgA4gToFa
sRWySXtIF/sxBXWuDyEWa/ck2G0LzRJHUZzpr1DsPP6mqe00ICHmRLSgXIMIcpIJ
Xb7uwh1hBKxvBDDkLOEh00deNY/ZgyqWvcFPPXu+DmaN+4D2zHo6il4S9iOonN5M
cR1PsG2fR5QMTEYsXaAGRYbRdK77LSiGPWYo2nNeTwy9Z/CgLVRlK+4++JojcGsW
wjsHxT8Rs8paU1+HCuWYf9qq9E5K8w==
=PsW0
-----END PGP SIGNATURE-----

--eFiyZ/QO4UMV0jds--
