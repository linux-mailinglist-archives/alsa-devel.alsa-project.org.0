Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F0DCE3BECA3
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Jul 2021 18:57:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6CC3383D;
	Wed,  7 Jul 2021 18:56:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6CC3383D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625677059;
	bh=yCYwvoTdXzMiWqruf7VQogXxinrECldvmRO8q7DVEJk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sUxH9MZCa5lyDN9dSdSerP4Pc473eXSQjHCeWVpi70aFlD7S2NyoTllhfLhRBowv3
	 sS6BAs7EbKFfYAcdvRas71cQfky0CnYBu9Ls30dUCZgXlSmTie578dfLBUCoMZwHcE
	 hQh/ARbSKCUAe++b429w80sNJyuniCDC2MqmR0jU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0EF7FF8025C;
	Wed,  7 Jul 2021 18:56:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F3039F80224; Wed,  7 Jul 2021 18:56:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BB9E9F8012A
 for <alsa-devel@alsa-project.org>; Wed,  7 Jul 2021 18:56:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB9E9F8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="h8nltpkl"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8479861CC9;
 Wed,  7 Jul 2021 16:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625676963;
 bh=yCYwvoTdXzMiWqruf7VQogXxinrECldvmRO8q7DVEJk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=h8nltpklvBakqZgPQz22JuZhs4dGOBKShWmf/nSTmsAmgBtQS+OwyaCVS7ztUmQWh
 NWDMs5rXmw4r1mBulE4m7lSccgkzfYJeGVQ3Uj6FFDM87USiDIoriPr/WWt7nZ8YNU
 cbWvicOBduv4tHa0HkJGuSGBh0pp+g/i1TQDggnb43V+O/tUkwSuNInIplFrMVquuH
 sGAtlxjpSooiI/t5OAy1sn4e3ZFx7xLt3JzuBFUoECrWQDYTHY/jyLYH3FOxVMMwY2
 yTQrKctzvYbydNvSI5CoFwlhnb+Pl80HHs3P+8oQbwg9XnQimpjo0TX7RXHVSqRB9b
 jJtR9pdjQIXSw==
Date: Wed, 7 Jul 2021 17:55:31 +0100
From: Mark Brown <broonie@kernel.org>
To: Vijendar Mukunda <vijendar.mukunda@amd.com>
Subject: Re: [PATCH 00/12] Add Vangogh ACP ASoC driver
Message-ID: <20210707165531.GJ4394@sirena.org.uk>
References: <20210707055623.27371-1-vijendar.mukunda@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="nzri8VXeXB/g5ayr"
Content-Disposition: inline
In-Reply-To: <20210707055623.27371-1-vijendar.mukunda@amd.com>
X-Cookie: I will never lie to you.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Alexander.Deucher@amd.com, alsa-devel@alsa-project.org,
 Sunil-kumar.Dommati@amd.com
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


--nzri8VXeXB/g5ayr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 07, 2021 at 11:26:11AM +0530, Vijendar Mukunda wrote:
> This adds an ASoC driver for the ACP (Audio CoProcessor)
> block on AMD Vangogh APU.

Big picture this looks pretty good - I've sent a bunch of mails with
comments/queries, and I see that Pierre's done so too but it's all
relatively minor stuff.

--nzri8VXeXB/g5ayr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmDl3IIACgkQJNaLcl1U
h9A5OQf8C/Jm6oUHVrpRiJ1s8wFUWv/uOaP1N7HRLbTrYRqtwW/u1ORJ2hwqKKQR
5YpdanUNEUP/dj+6Zur9cGKUQcSoMvQW2JmMTkQuuTY6p2rLUfRiPNsYSWQ3akvV
t5zbR68lNmEbUX1zbubT7sbrEUVMtCUhLQgerynJ2Sgjo5Q1gvfiBCq67dlV+APR
slPK2Zn8rpdPLe2oDbGr8gBm4W2Xzo9Yt3jFJjhB+YxxC+nwB8Njey9izLh8twOZ
c3j4i/WLZBIczOB2vceA1EvWv6UkgjxUe45AVKZnMV5CuUPFeuYNkRTaMc0hnAcp
K29x/XY8AKrnjrwA7b03SFNzktAnng==
=fO5x
-----END PGP SIGNATURE-----

--nzri8VXeXB/g5ayr--
