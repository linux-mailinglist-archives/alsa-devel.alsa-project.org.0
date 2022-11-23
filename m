Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B993635CFF
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Nov 2022 13:38:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B97081666;
	Wed, 23 Nov 2022 13:37:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B97081666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669207110;
	bh=NaxuRVk9RVvJOaNWjBCutqF7BHzHg3yDkhHVcLmBJFM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lTCEDY8Gmcqs3nLV1O4UAtrz/D04v0/5bvmg/QqWitbDWejSDlZcPHmwivSOCtIWs
	 udKxC4pe38mXye8FgAZBELK/YouaPe474nqbjtAXdStD1a9oOz7YYJBCq4oZoTHEgc
	 J4S51/kcZQfeubzGdELoK+hZyoi9IsZdYyH9C+vM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A59DF8030F;
	Wed, 23 Nov 2022 13:37:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A48B7F8025D; Wed, 23 Nov 2022 13:37:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_HI,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 62BBEF80149
 for <alsa-devel@alsa-project.org>; Wed, 23 Nov 2022 13:37:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 62BBEF80149
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="TH/sIRm5"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9911CB81F30;
 Wed, 23 Nov 2022 12:37:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5ADA9C433C1;
 Wed, 23 Nov 2022 12:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669207050;
 bh=NaxuRVk9RVvJOaNWjBCutqF7BHzHg3yDkhHVcLmBJFM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TH/sIRm5kLP50uEpookZHbRv/GqBR8HzO/TSBHIsdE4YN3qwr8ctS5swaR8URBUHZ
 rSuwHVcpU4nzWV2gbODBBE5SAS2BM37EBixVwCQmmCgn3iyb4v+OnoRskyc/Lpg34V
 mZTyGigxqjEJxMnpDp1tBoJGLNDrVarSr/Xu8goeXkiTGG9xrbDFHdD1KotfTiVlLs
 EgETQntlC5XRrtOC1hIhLkOC3gb1/TiDXU9/C1t5qXyqpz0VJT+5AoiSgRegTBRsWQ
 p2ifgjesADrZy8ZpmC20J8qeavkFhKEr2Hm1UzNfgJnwtJiOW1rArTEo+WicNKzrHg
 kPeKkRr2nwmWQ==
Date: Wed, 23 Nov 2022 12:37:24 +0000
From: Mark Brown <broonie@kernel.org>
To: Artem Lukyanov <dukzcry@ya.ru>
Subject: Re: [PATCH] ASoC: amd: yc: Add Xiaomi Redmi Book Pro 14 2022 into
 DMI table
Message-ID: <Y34UBNoHZ+W2IJHn@sirena.org.uk>
References: <20221123065820.55159-1-dukzcry@ya.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="WeZze+YwmFBfOa6Q"
Content-Disposition: inline
In-Reply-To: <20221123065820.55159-1-dukzcry@ya.ru>
X-Cookie: Positively no smoking.
Cc: alsa-devel@alsa-project.org
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


--WeZze+YwmFBfOa6Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 23, 2022 at 09:58:20AM +0300, Artem Lukyanov wrote:
> This model requires an additional detection quirk to enable the
> internal microphone - BIOS doesn't seem to support AcpDmicConnected
> (nothing in acpidump output).

This doesn't apply against current code, please check and resend.

--WeZze+YwmFBfOa6Q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmN+FAMACgkQJNaLcl1U
h9DC8Qf+JrRWMKShodhKG0REKySSyATGRX8/y5uRBdE9EIfFJ2vLPpjoX9JWbtrZ
BWZUlb1k7X9tIiJBdBk4DQYhkPrXYF5ISaXLOZbQfdF0lVINg9/q2ZLnEHk5V5gL
qlVtUnL2Zfr0/mv48e1h2dqZQFKiDUKZjWVJwB9O+c9sFX4rkQ0TevKGdcoKN9KU
lhe3KoonJjQaV6g4/4cd5orT8ONwoRiOC0Z6muPS+0FpQ4VEbNTGFPYKIn0MEphx
1t0mPvXTD1BFMgsMpPTOv3oE9ZQQYNTL1bHPwo6qbOkv0xmtnUMGnouyuljQjAMA
vej7bOTn1Bc+/N1WS8l43H4O9zJpGw==
=6UM8
-----END PGP SIGNATURE-----

--WeZze+YwmFBfOa6Q--
