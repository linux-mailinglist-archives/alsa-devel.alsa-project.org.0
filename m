Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B5B91C54CA
	for <lists+alsa-devel@lfdr.de>; Tue,  5 May 2020 13:53:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 444CA1741;
	Tue,  5 May 2020 13:52:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 444CA1741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588679595;
	bh=zHBoT/KGlclwyw1KLVdz+tgGbFh+vVpAI9xL1PxTI1U=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VbEUoOhAsU5v9Rvd0CL1cTJo91OE53V2QUnlaBExJp3TiKvE5/UWiuo/jFO9HnrNi
	 wr+5gW0WB3SHLokpkvL1ckV/q+3WC5vjUG2EoKT8XnSI7+Rs71DzigdFOcXV/rm+3+
	 7z1ZrAy05TdnfuluyC3MoLW/HJqK8E0vOoYh9wQU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E425F8023E;
	Tue,  5 May 2020 13:51:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 11F0AF801D9; Tue,  5 May 2020 13:51:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8DB40F800EE
 for <alsa-devel@alsa-project.org>; Tue,  5 May 2020 13:51:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8DB40F800EE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="FsNbVa7s"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id ABB69206A4;
 Tue,  5 May 2020 11:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588679470;
 bh=zHBoT/KGlclwyw1KLVdz+tgGbFh+vVpAI9xL1PxTI1U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FsNbVa7spd2Y8tI7gvo0xNcUmz1Whzp24fe2RRo/xczxXI/Yx3Yo/JAU0Yh1O80K+
 LxhE4qrre5dkF+oH6EcXgtLsqmFfQRHrvtFX5Y4SgIZ95L8mKwEGWTy+9NjarPWJB8
 7v9l4sngn1CMqXhkIjeyVzzOCWHBgtP3ej1QcvtE=
Date: Tue, 5 May 2020 12:51:07 +0100
From: Mark Brown <broonie@kernel.org>
To: Akshu Agrawal <akshu.agrawal@amd.com>
Subject: Re: [PATCH] ASoC: amd :High hw_level while simultaneous capture
Message-ID: <20200505115107.GD5377@sirena.org.uk>
References: <20200505114023.251409-1-akshu.agrawal@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="hxkXGo8AKqTJ+9QI"
Content-Disposition: inline
In-Reply-To: <20200505114023.251409-1-akshu.agrawal@amd.com>
X-Cookie: Poverty begins at home.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
 Colin Ian King <colin.king@canonical.com>
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


--hxkXGo8AKqTJ+9QI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 05, 2020 at 05:10:20PM +0530, Akshu Agrawal wrote:

> Simultaneous capture on dmic and headset mic is having
> issue with high hw_level being reported.

> Issue Can be reproduced by:
> arecord -D hw:2,0 -f dat -d 60 /tmp/test0 &
> arecord -D hw:2,2 -f dat -d 60 /tmp/test1 &
> cat /proc/asound/card2/pcm?c/sub0/status

What is a "high hw_level" and how does this patch address it?  As far as
I can see this patch reorders some of the initialzation but it's not
entirely obvious what the issue was or how this fixes it.

--hxkXGo8AKqTJ+9QI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6xUyoACgkQJNaLcl1U
h9CM5Af+JYWGYgh3XlATPjacnOL+W5keHgZMiQQM+Ga6iTruOWyQnCQn1RoFa0jS
YmP9je6E4IGkUqgzXg65+E8fuiY4wWmuNbi7EE8zrBmCd3uJVd7B4gMTp+JU8vL4
0dSiN68vCcL7G8ksqtRd0lslBy5bf4tdlJBejP/KvvaQyObEYZBZdPEqObOsLV+7
hiKkM2bE9cQU2Jl4YhfkuDIozbCglRjX4Z0hwoVaBY6vBK0oIlkh797jFa1T4qsm
sUBqDeK45EzB29lyaCYeMg2IggTgpyGfeYTGBCvj78viipVIGnxjNgK60skm/pdX
vdbxD0/69T9kMNCvmdMw9fVPjNbk5A==
=W0sp
-----END PGP SIGNATURE-----

--hxkXGo8AKqTJ+9QI--
