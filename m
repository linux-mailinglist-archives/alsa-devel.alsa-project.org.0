Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B6266981A
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Jan 2023 14:12:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C224A732;
	Fri, 13 Jan 2023 14:11:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C224A732
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673615528;
	bh=T6DcHaUS2ZgAu0yg0rxXiAk5OPOrFCdJJ5msq7BnzAY=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=WLoVth9TUWoH19rO9DxtNLvrgWJCuv1Ha8WfYVprTGaTPYLoFOARHYaMcHwBm3F6/
	 UyDyxvIbwwxGwYfdcmcj0M1uC/qPuwymejDK9Cfdr8SNzDzuqc2V3+eic38LfYHekp
	 ic+3auHmEQH+VIaYkr/MWip3VpD0sB/Jc988nX70=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5655BF803DC;
	Fri, 13 Jan 2023 14:11:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 85D44F8030F; Fri, 13 Jan 2023 14:11:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 02932F8026D
 for <alsa-devel@alsa-project.org>; Fri, 13 Jan 2023 14:11:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 02932F8026D
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=A/wcSIlr
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7216861AA9;
 Fri, 13 Jan 2023 13:11:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08AEEC433EF;
 Fri, 13 Jan 2023 13:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673615461;
 bh=T6DcHaUS2ZgAu0yg0rxXiAk5OPOrFCdJJ5msq7BnzAY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=A/wcSIlrhz5kpY0/JmiynRVyaBfFGOxHvPSS0lsNccuZERfQsidNCviJcYZEZnTa9
 KaLMdvog2qJ5bk1UlmlF0+WyKnHlYY8RSNjyRSRnlQFm8EwF2I+jVVRBvcFKLVx1b4
 i0D2f3/5g9XEchcQKo1G4yVVbC+TtaNiL18AY1Va7kh/6Jty7xhcWslezAAqsyRTC2
 IBFLdpXAtQdCaYivV3o3A3NaCNo5WLOi1InqagVC+d9/xKGAR5Ih5C+QTcJQNpsUms
 h05hrGvWxmHz5Pqt4eCXE9pJoiKH9Mv/ooZfvJZQIuwptoS5UAloaBQszpN0HXhwXw
 ckRvZ87pChTyA==
Date: Fri, 13 Jan 2023 13:10:56 +0000
From: Mark Brown <broonie@kernel.org>
To: Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>
Subject: Re: [PATCH 1/2] ASoC: Intel: avs: Use asoc_substream_to_rtd() to
 obtain rtd
Message-ID: <Y8FYYHi2li26xkbC@sirena.org.uk>
References: <20230113191410.1454566-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="CnfMuUfmP+PERmOa"
Content-Disposition: inline
In-Reply-To: <20230113191410.1454566-1-amadeuszx.slawinski@linux.intel.com>
X-Cookie: I know how to do SPECIAL EFFECTS!!
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
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, Vinod Koul <vkoul@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--CnfMuUfmP+PERmOa
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 13, 2023 at 08:14:09PM +0100, Amadeusz S=C5=82awi=C5=84ski wrot=
e:
> From: Cezary Rojewski <cezary.rojewski@intel.com>
>=20
> Utilize the helper function instead of casting from ->private_data
> or snd_pcm_substream_chip() directly.

If there's no dependency between cleanup patches for different
subsystems it's usually better to send them separately rather than as
part of a series since otherwise it looks like there's dependency issues
to work out.

--CnfMuUfmP+PERmOa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmPBWF8ACgkQJNaLcl1U
h9BmWQf+NYVpi64x/5XWvPorqH/xIRxb1QdToFN/AtmMIoRbCq3T3kuvTtpvI7GK
i1IOhPwN2zIAaCyB80vPJzEsMSMSwjS7EUeOXcf7AiGLGV2OoRO1XLoi1HbEwgSE
/d59oFzz2+Q56YqS6eMsV10hu2lAPDr0mBLXfEp24HlOWLLn+kSMek8yyNujU57D
h7LOZbaJDNZWh/+5pLpwdPiJOt47/pybG9pwUX5l6m9pb/57N3Qq7rBY/aXZhke1
HHuWTTTThxnmhE5g2QV1n5RhxDJ3Td3ZTKLbPmA+wbdnnCUMBOch0HbEmPxgbde/
rgulO7F+hd1vVIl3kdQYLwQD95z5RQ==
=Q/yn
-----END PGP SIGNATURE-----

--CnfMuUfmP+PERmOa--
