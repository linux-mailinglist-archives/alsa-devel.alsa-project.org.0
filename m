Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D9C21E4456
	for <lists+alsa-devel@lfdr.de>; Wed, 27 May 2020 15:49:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D1EA017B7;
	Wed, 27 May 2020 15:48:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D1EA017B7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590587373;
	bh=qYSYXseydU1Jl/FMCMZsu00a3c88OPa9IaYxEBjkW44=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sjgnb5rRDPdpLWiUIBxY+ONYwZpuh8rFpZRbjF5/20hB8vb0XMFOXkRDCPQkRnxYA
	 rDyWqwJv4OpOIKB3+b3grspCmPEytOxyvLNdXVYb8rwZ9AkdbRRYzkkuqONUF4OwXM
	 oZX0GTySXvDD0wFXeyMGPGiN3TBWBGyCNjJ/cNQw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 14224F800FF;
	Wed, 27 May 2020 15:47:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A06DBF8014E; Wed, 27 May 2020 15:47:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B1A01F800FF
 for <alsa-devel@alsa-project.org>; Wed, 27 May 2020 15:47:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B1A01F800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="eyo9QQOp"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 92C882078C;
 Wed, 27 May 2020 13:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590587266;
 bh=qYSYXseydU1Jl/FMCMZsu00a3c88OPa9IaYxEBjkW44=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eyo9QQOpWhRfR0asYM+i5Txt1or/d7KRnBjpggOx5OgZH0GO2KTu0oxSC6GNNHFp/
 qrKuUj/lWKiq7FUDDHXBkQydTuSyv0FC+3lN5K+UDDtG7V+hR/uu5gMjRVUXOUSfnE
 0aR0jbD0hH0UVzXytvukYJs/6JRmGJZHb+N4Y4x4=
Date: Wed, 27 May 2020 14:47:43 +0100
From: Mark Brown <broonie@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] ASoC: amd: rt5682: fix soundwire dependencies
Message-ID: <20200527134743.GH5308@sirena.org.uk>
References: <20200527134151.834555-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="nFBW6CQlri5Qm8JQ"
Content-Disposition: inline
In-Reply-To: <20200527134151.834555-1-arnd@arndb.de>
X-Cookie: Drop in any mailbox.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Akshu Agrawal <akshu.agrawal@amd.com>
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


--nFBW6CQlri5Qm8JQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 27, 2020 at 03:41:26PM +0200, Arnd Bergmann wrote:

> Maybe the SND_SOC_RT5682 driver itself can be reworked so that
> the common part depends on neither soundwire nor i2c and the two
> bus specific options can be loadable modules when the common part
> is built-in.

Yes, please do that.

--nFBW6CQlri5Qm8JQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7Ob34ACgkQJNaLcl1U
h9Au/Af/ToAlo8MIFiY0pB1HedOb/UPzvkcA2KB3IzxEpvf6D/CM9anQAjdbDqYv
RdpDzNNKLxv5msIIMdK2k+T0kRTIaYwCNcqj2n3N3QQrqB2EkneZ8++/J14Sydkc
cZSRseQFFvGOcXkzQE9IKwTUp9b4pkwZ1DlUS+ZUcHtrQIp7EsqK1ji8mtRCzAM1
sK+MNyknZ+mnPgHHEYkjWq1v8lJCID+RQ2HqLZmAiaGbtfb+xM4+GRrQuFPfM1Wq
P6PuCDeIWw0ypRcY702tt2KEoYw7ztu0jER0jpkunDYOybDBStZfOG42+lbsgB94
IsODB/lf4WgAsdbGTa+RT0EZs9NfaQ==
=oGtp
-----END PGP SIGNATURE-----

--nFBW6CQlri5Qm8JQ--
