Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C6C47C5EB
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Dec 2021 19:10:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2DCCF17E3;
	Tue, 21 Dec 2021 19:09:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2DCCF17E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640110240;
	bh=mE1Y2QnGMqwCGUQOY/F5U66oqxEWb7Isr36SaoqyxXU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IJIAtPczQBQY/FqX25XofN2dlFktkxEVa1+nFTWHXKrBnAwwxLvbUc55aTRlsIbzs
	 ydmrbt9ThqL4ZgmBN3wrryhm5x6Kk8pBfDmEz9RO4kDnXObsvTFHv5SoTc1GdfMJV6
	 7S0qFhL3PBl2N7rXE8wZDcANlKyE2mcyVX65jCYA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 91F81F80125;
	Tue, 21 Dec 2021 19:09:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9C294F80118; Tue, 21 Dec 2021 19:09:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3DC9EF80084
 for <alsa-devel@alsa-project.org>; Tue, 21 Dec 2021 19:09:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3DC9EF80084
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="nVDPl0y9"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 13439616E3;
 Tue, 21 Dec 2021 18:09:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4115DC36AEA;
 Tue, 21 Dec 2021 18:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640110164;
 bh=mE1Y2QnGMqwCGUQOY/F5U66oqxEWb7Isr36SaoqyxXU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nVDPl0y9ItMNxgfSKev+eFhe6gpS6z4pvW6lR9CqOkeW2GIKBzlxsuppW+IYawfd4
 O3/zO8TZAnDQu18GnSXbYlcWvk+bE9pukQ8F5DTCqWHxyVt+V9INqEyAT0GrJ7CtA4
 MSMKLCGhlhR3PwOyVqDMNEugRrQY1+MSL361uX3hBZ0Sv7cYaISxdtreTERAbGT5Bi
 X26Rtat2oU4BZnKu/SkmYl38DRqObVNeo5Qv9S31CE5XX6K2MKKcXV46iDYKdYfoTJ
 a9lfFXxp7e1F4ikRl/1v8qBdPLHaQBKX8Y1cX4nvFCuYFzACh+/a7oAVFry7itt5pJ
 kgMlz58vh0kag==
Date: Tue, 21 Dec 2021 18:09:19 +0000
From: Mark Brown <broonie@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH 0/7] ASoC/SoundWire: improve suspend flows and use
 set_stream() instead of set_tdm_slots() for HDAudio
Message-ID: <YcIYT57YLpHR1+9A@sirena.org.uk>
References: <20211213054634.30088-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="jpNuGnQnWByU2nxH"
Content-Disposition: inline
In-Reply-To: <20211213054634.30088-1-yung-chuan.liao@linux.intel.com>
X-Cookie: knowledge, n.:
Cc: alsa-devel@alsa-project.org, vinod.koul@linaro.org, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, vkoul@kernel.org,
 srinivas.kandagatla@linaro.org, sanyog.r.kale@intel.com, bard.liao@intel.com
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


--jpNuGnQnWByU2nxH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Dec 13, 2021 at 01:46:27PM +0800, Bard Liao wrote:

> The topics are independent but the changes are dependent. So please
> allow me to send them in one series.

What's the plan for getting these merged?  Looks like they're mainly
ASoC changes?

--jpNuGnQnWByU2nxH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmHCGE4ACgkQJNaLcl1U
h9BcbAf7BO1nVJqZQ/uFs5ullpcNtIFVdkEaywvlbx547ARaOGph8bkObOP6RD6m
2ohdCpX1ZoetJeQ+PK37HR7SOMD/cRyd71kGI3DYG48b/FFckzm0JrVFIB6a3QYG
h8keelfWZsgp+byhIZrk1AQ9hYco3TUw65R1V1JpgpF9u46cl/ylcf5CcXqu/rV8
2+vuK6ReAbWt91LJiIimvqhd5ti4dOuq6QoMU5nwfCxSrUeTK7DjQ++lxE9N90RS
Fx6llzEgkQ50NTTd2Vzkj3cgnuO98wKVldPSG6pYeLtbJgxp+V00M6dBw5/q54wH
Xh4pjVYATviMV0596xPysypI9pbplg==
=vLY7
-----END PGP SIGNATURE-----

--jpNuGnQnWByU2nxH--
