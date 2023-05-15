Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D5547030F7
	for <lists+alsa-devel@lfdr.de>; Mon, 15 May 2023 17:06:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 57DBB1E3;
	Mon, 15 May 2023 17:05:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 57DBB1E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684163201;
	bh=M+R7QJX9tlmUfjLa93PTIOcnlPo8fCYSptpe+Z31hvI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jWmlb7WUbakat9qs73wb56+WfF5m4jHDDYEywLYFJQAbW3XagndM2PH6FayyajQSA
	 ibRcqrO2iBVY0tH4HZkKio2N2XG2/caYNhX/XnpxG2ud0vZdIhznNDHlgtqwxShG3B
	 KGcvasxK8YCXMPeokbfAozJ04ky8gDSmpCEvdBiA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A58A9F8053D; Mon, 15 May 2023 17:05:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 47C31F8025A;
	Mon, 15 May 2023 17:05:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 94D83F80272; Mon, 15 May 2023 17:05:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 84488F8016D;
	Mon, 15 May 2023 17:05:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84488F8016D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Dm0/l0pj
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DAFAB61FED;
	Mon, 15 May 2023 15:05:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E618BC433A4;
	Mon, 15 May 2023 15:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684163137;
	bh=M+R7QJX9tlmUfjLa93PTIOcnlPo8fCYSptpe+Z31hvI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Dm0/l0pj1T5XWHflBhC+rfrSh3kzTg9GrY3XVsk6KrT0+mVHpuIhNCj7Q/SQKC3B+
	 VcxdsPs/gS8vjGV/PlidJBaytbkh6gKS0ONKAj7ERQoL/ms/rjdByWiMOmQxGxvfJJ
	 Kirghm//gDxI5jmKCmJfIcXLI3rIxSPlLfKWGUL29bvI0HZLo3II+p6Oiy39J6pZk/
	 M1KJmQK/Wlm0UPQMpIQIlFxk18Deot2xqLx5kBtseaflGKQWDljTRkmXrJPTl6PGeD
	 53WTQ1vw+sZjrNINUlM/0LLzWD9mmqs7eX6E0mqjdDYZfEbblThqLdCKrOxdvRCW/K
	 nAt8dy2OpwULg==
Date: Tue, 16 May 2023 00:05:34 +0900
From: Mark Brown <broonie@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Trevor Wu <trevor.wu@mediatek.com>,
	pierre-louis.bossart@linux.intel.com,
	peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
	daniel.baluta@nxp.com, lgirdwood@gmail.com, tiwai@suse.com,
	perex@perex.cz, matthias.bgg@gmail.com, yc.hung@mediatek.com,
	tinghan.shen@mediatek.com, sound-open-firmware@alsa-project.org,
	alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] ASoC: SOF: mediatek: add mt8188 audio support
Message-ID: <ZGJKPuf1FX4AYLXl@finisterre.sirena.org.uk>
References: <20230515052540.9037-1-trevor.wu@mediatek.com>
 <20230515052540.9037-2-trevor.wu@mediatek.com>
 <7c784932-951a-65c0-c48f-bfa4c098b2e1@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="a4Gd7i8RRVnq1R5N"
Content-Disposition: inline
In-Reply-To: <7c784932-951a-65c0-c48f-bfa4c098b2e1@collabora.com>
X-Cookie: Avoid contact with eyes.
Message-ID-Hash: C5PG2BXHDFRTAH5MYXVFIYZ3624FC2LJ
X-Message-ID-Hash: C5PG2BXHDFRTAH5MYXVFIYZ3624FC2LJ
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/C5PG2BXHDFRTAH5MYXVFIYZ3624FC2LJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--a4Gd7i8RRVnq1R5N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 15, 2023 at 01:25:44PM +0200, AngeloGioacchino Del Regno wrote:
> Il 15/05/23 07:25, Trevor Wu ha scritto:

> > +{
> > +	/* common defaults */
> > +	memcpy(&sof_mt8188_ops, &sof_mt8186_ops, sizeof(struct snd_sof_dsp_op=
s));

> Never use sizeof(type), always use destination var size! Anyway, there's =
more.
>=20
> I don't think we need to perform this memcpy: we'll never see an instance=
 of
> both mt8186 and mt8188 drivers on the same machine, so you can safely jus=
t use
> sof_mt8186_ops for mt8188...

> > +	sof_mt8188_ops.drv =3D mt8188_dai;

> ...which obviously means that this becomes

> 	sof_mt8186_ops.drv =3D mt8188_dai;

This does have the issue that it then means the ops struct isn't const
which isn't ideal.  It's also not the end of the world though so I don't
have super strong feelings.

--a4Gd7i8RRVnq1R5N
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmRiSj0ACgkQJNaLcl1U
h9DXNgf5AfJtzdmTyLjLoAOi+seXTanouzlJtqeDLp9sgeXi4XAMwpxoKIZjJmdy
VsSH4ChbVLoFOfsJhTFHPNL25XiJzmpLcXSLSHX6ICeF+4smiSTVfnNmOhr0sjoa
6O64OvuPRfWJwsTuUnaUpnrre638+d13uyk/kdotCEvmIwTOWnLexBlin6pdeyJa
SoPO2RPTuLkO2QLodLDoW3s/C4pP5Oj1hS8UobyIDxbYnH8Azk2mzhOeg4R+aRS0
1JQl4uGFzB0TzW8Ob2Q31pD4lIxV5tSCEc2ChjaUchAqu2TAUDz6ZgMQRus11mSh
OVRLrGihJnGRLQOGDlrtsOS0Uwqa8Q==
=VHrp
-----END PGP SIGNATURE-----

--a4Gd7i8RRVnq1R5N--
