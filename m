Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A4D599BEC
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Aug 2022 14:32:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E21AA823;
	Fri, 19 Aug 2022 14:31:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E21AA823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660912365;
	bh=+3EXLY8o04OSSA/x4uyO14uk39dCZTPP09CNwDpZm0M=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UJreRLdMN0Di3oqgHThoPCc4gzWQy+oLhF2kDZjk5uTDsURPL+GAmkWkaTwTBkawF
	 1lB3xdLLw/AprKVwgf/szoybkJUIkDkcyqxjni6LecukWT2Nf98C/UQy9N1nRiCyBd
	 pn88ZsNVTYWYPxJDESFHT3e5aJL/iAgdWjN7mcmo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5020AF80217;
	Fri, 19 Aug 2022 14:31:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B19F9F801F7; Fri, 19 Aug 2022 14:31:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4BDC8F800EE
 for <alsa-devel@alsa-project.org>; Fri, 19 Aug 2022 14:31:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4BDC8F800EE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="fHEh+K+y"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5AB98617E5;
 Fri, 19 Aug 2022 12:31:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D28E2C433C1;
 Fri, 19 Aug 2022 12:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660912296;
 bh=+3EXLY8o04OSSA/x4uyO14uk39dCZTPP09CNwDpZm0M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fHEh+K+yaTJJ64Icg1xjRI4o6Es8qe12qI9kLRLn78DyPqzByJuhV1gBGQDgSUNib
 lYoIXBBY0CpbXOdBcE8AnIGA6y6ysYSr9FAc39KfIycj9FgLfEWxkU2xweKfs/mC//
 duGnQ8vsFK+RA7c2hmoGQBcBxk+lasWjKFkgMZCEpvSu+mLAn4f2wEsCQQ3fT80VoF
 M3qHn786zba3wkk/MBg+k+n6An/kpw9o2a2FJdsuSx6Kz0e/sZ+u/+Sl3GSXSzjMlQ
 epjUBDFaaUDgFd+R3+VPBf6fH53cJI6uy1uypgoBr8nBAq+K0Z1HDVOmzhaFBP94fw
 rMcD0p/tGJx/g==
Date: Fri, 19 Aug 2022 13:31:31 +0100
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Re: [PATCH] ASoC: SOF: Fix compilation when HDA_AUDIO_CODEC config
 is disabled
Message-ID: <Yv+CozZ4IxklQaTW@sirena.org.uk>
References: <20220819122908.3563930-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="4O9Q5fPb8w6UZRFo"
Content-Disposition: inline
In-Reply-To: <20220819122908.3563930-1-cezary.rojewski@intel.com>
X-Cookie: Price does not include taxes.
Cc: alsa-devel@alsa-project.org, kernel test robot <lkp@intel.com>,
 kai.vehmanen@linux.intel.com, pierre-louis.bossart@linux.intel.com,
 tiwai@suse.com, hdegoede@redhat.com, amadeuszx.slawinski@linux.intel.com
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


--4O9Q5fPb8w6UZRFo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 19, 2022 at 02:29:08PM +0200, Cezary Rojewski wrote:
> hda_codec_device_init() expects three parameters, not two.
>=20
> Fixes: f2183b08c81a ("ASoC: Intel: Drop hdac_ext usage for codec device c=
reation")

This commit doesn't appear to exist upstream.  Did you mean
3fd63658caed9494cca1d4789a66d3d2def2a0ab from Takashi's tree?

--4O9Q5fPb8w6UZRFo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmL/gqIACgkQJNaLcl1U
h9AiFwf/RtIuyyhleD3U/VQH7eCmoPdLw41yzmo8U4TGuVJckJiG57p1ke/coaYh
glw7J3ijcNzRCvLfXxjFsLAXK3ZaQ7wTdiM8zAWKILY1XVkZ/R+E+j7Awmo4pu9p
CL4EV2WCPvwQolaH2GQAKcsc/Dh/FL6CpbFsk1paEWGEg/tQxZ+PL61fTyErSXAj
e/2QmKJjNJSaNHGblIXzrJ0tOy6OJhwcu4KQVfelLO1yo9xaapFPWwfBjSd3hKN0
iZ9ukcu+E70+OVelqWxrEWn+V7eBPiW/b0gkogNcePFJpcR0gy64RFwJrn947zT5
W17Fx3FpTF0i6/zVPgJeCmZf70CmwQ==
=yoEN
-----END PGP SIGNATURE-----

--4O9Q5fPb8w6UZRFo--
