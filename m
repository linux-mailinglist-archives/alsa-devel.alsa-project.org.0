Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 056746640CF
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Jan 2023 13:47:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 02F7EBAAB;
	Tue, 10 Jan 2023 13:46:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 02F7EBAAB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673354845;
	bh=N0xiTqJTsS2DNlsKT9boACqzqDa0GpBth/o0DzpO1dg=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=c7PwgiNLSZVV8x1vB/NBjMw+SBdlFNEiIjbXUUWWgggh64Fyk8jv2o2AVAD41HCgq
	 LTcIYfrz5ZxrMacGRtT71nJmscdvbBkjr++Ou9Oh8e05Uh2mHDOBC6GI8RhPHfatS6
	 aeXmiBy1jEcamPs0MWvkTs9yZ1gxxSmcCsGTzVcc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4171DF804BD;
	Tue, 10 Jan 2023 13:46:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1C23EF804BD; Tue, 10 Jan 2023 13:46:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CD94EF800C7
 for <alsa-devel@alsa-project.org>; Tue, 10 Jan 2023 13:46:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CD94EF800C7
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=M/Q0H46j
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 90257616C9;
 Tue, 10 Jan 2023 12:46:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4BE6C433EF;
 Tue, 10 Jan 2023 12:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673354785;
 bh=N0xiTqJTsS2DNlsKT9boACqzqDa0GpBth/o0DzpO1dg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=M/Q0H46jq7uJgCFuC95WOryqHAOp8nCtcx5fzj5yZ9zA0Fv7epk+W9IRvDyiQghAC
 AEUx1rnlscrmydXvrf54lBtHFxJazP5MGXtsYwDYBH7Cxm7kDt8WuyWs2mXsJOr/vg
 NgFbZxuuRzJX+JB9MdmV/ok7Jn+9qJbT1g/Uxi0g+Xgk96vlOvAgdeTtYJrzz65Zsz
 /hS3R6CAbmA34zWu07C8E18ePGnjfDEmsS61IFbBSw5wvT80c40KYIs1d2i6np7CeS
 ig9UNn786gZ4TtgLHdGZmkV9Gx97mjcf3N0r8X2GhcEiYWyzJaRKtkDu7La/uplLuN
 NThsrQK83vm/A==
Date: Tue, 10 Jan 2023 12:46:19 +0000
From: Mark Brown <broonie@kernel.org>
To: Seven Lee <wtli@nuvoton.com>
Subject: Re: [PATCH] ASoC: nau8821: Implement DRC controls
Message-ID: <Y71eG0VgAkntqH0I@sirena.org.uk>
References: <20230110031622.459686-1-wtli@nuvoton.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="E5PgoC1cmYVKJTwl"
Content-Disposition: inline
In-Reply-To: <20230110031622.459686-1-wtli@nuvoton.com>
X-Cookie: Live free or die.
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, scott6986@gmail.com, SJLIN0@nuvoton.com,
 KCHSU0@nuvoton.com, lgirdwood@gmail.com, YHCHuang@nuvoton.com,
 CTLIN0@nuvoton.com, dardar923@gmail.com, supercraig0719@gmail.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--E5PgoC1cmYVKJTwl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 10, 2023 at 11:16:22AM +0800, Seven Lee wrote:
> This patch is support dynamic range compression controls.
>=20
> Signed-off-by: Seven Lee <wtli@nuvoton.com>

This still isn't applying for me, for example on my for-6.3 branch:

Applying: ASoC: nau8821: Implement DRC controls
Using index info to reconstruct a base tree...
error: patch failed: sound/soc/codecs/nau8821.c:322
error: sound/soc/codecs/nau8821.c: patch does not apply
error: patch failed: sound/soc/codecs/nau8821.h:350
error: sound/soc/codecs/nau8821.h: patch does not apply
error: Did you hand edit your patch?
It does not apply to blobs recorded in its index.
Patch failed at 0002 ASoC: nau8821: Implement DRC controls

Are you sure you don't have any other changes in your tree?

--E5PgoC1cmYVKJTwl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmO9XhoACgkQJNaLcl1U
h9DrKgf8Djuiygtuwn7aimNIj8a1Eu89Vwd5dQ7JAF+Fq9ywAqWdm5hZ5XVtS/aT
nBStpQNa99S3xRAYK+ll6PDWcp5R5jVUUTRyNLY9CgBfkZqT+cq9pKKSN/B0xcm7
so9F0Z9/ESBnVTMzAge0iEZlCzliN4pshIGHofdYnOvgn0qTtZ0pYvQ1/UZ1Wndl
h+j4QJilrG9+aw6wsN/Mvht4USKJmigthBqP6uGN5Gouq1f2nt6m5IvLXiXMKfrs
zkXr0++4wTw7aLk47p7vQp4nLeXww9AQ7NLvidFvnch0hi7AMSiZdYIRdBQHgPKP
ScKBPMU02FK2HW6/N1Cx4xMFd47YMw==
=5F+n
-----END PGP SIGNATURE-----

--E5PgoC1cmYVKJTwl--
