Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1DC6A2232
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Feb 2023 20:16:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D23681F1;
	Fri, 24 Feb 2023 20:15:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D23681F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677266208;
	bh=wvpHz3Awiez4EzQ/5a9FnelPVKhKufDDpe5+aqSfoVY=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RKUWlTGk8la+40lpQRNdnuhjyv8snCrwLFhmy1U6A6LvU9UZQG/Kn0TcpwXZ7kxTG
	 fEmB7IKY0OLijMhYfLkp8jZK+Hs0VJYxxK8lfcdkkQ8J3TFknOJAfmcPieY0q4ybhM
	 4XJjOgaMeR1yCgxjfhBXXJL596P2kXaaoHhl0UDA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4D245F8014C;
	Fri, 24 Feb 2023 20:15:16 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F3574F80290; Fri, 24 Feb 2023 20:15:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A9886F80125
	for <alsa-devel@alsa-project.org>; Fri, 24 Feb 2023 20:15:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9886F80125
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=K4ZimhzF
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id CB989B81D03;
	Fri, 24 Feb 2023 19:15:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F3DFC43442;
	Fri, 24 Feb 2023 19:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677266107;
	bh=wvpHz3Awiez4EzQ/5a9FnelPVKhKufDDpe5+aqSfoVY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K4ZimhzFe113b+q2l+n7gImRPaTvekuZtWzz9EMWw4/hQKQUV+HEXMrS3hANxJ8yn
	 WqdkjEiYeWpIUNdSBNQ9QMOSW0Rzl0g70WzSSy6pxLnZA1vWq5uylWRFnY1RT+WTTM
	 NxoZJPNUXCg2qWrXw8w+sRummFlXU/fYwgKjMVi60z/5sSC+bJVcSoWWMtNaBkaJQM
	 rtIi0B7JJnzzbv388SsmJiqpS4hEwEnI7yp38zgLcm/9NHSmE0Q7/7UJg8GPYNpN88
	 IzSSj8Ea7YFGFcORBpn2dkB9fsgnfJ9dxBI0WVwCLjVflshHTns4zXSUT9BH42tC4U
	 BPBC+aVbYKQ/g==
Date: Fri, 24 Feb 2023 19:15:01 +0000
From: Mark Brown <broonie@kernel.org>
To: =?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>
Subject: Re: [PATCH 1/4] ASoC: mt8192: Remove spammy log messages
Message-ID: <Y/kMtXmrIYoLNV8a@sirena.org.uk>
References: <20230223-asoc-mt8192-quick-fixes-v1-0-9a85f90368e1@kernel.org>
 <20230223-asoc-mt8192-quick-fixes-v1-1-9a85f90368e1@kernel.org>
 <20230224190657.edrvkg22gz5gff4g@notapiano>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="udvt/bvCvfnRf3US"
Content-Disposition: inline
In-Reply-To: <20230224190657.edrvkg22gz5gff4g@notapiano>
X-Cookie: The early worm gets the bird.
Message-ID-Hash: QPNJSIKXENP7DF45OUG3GKMYCMDXM3GS
X-Message-ID-Hash: QPNJSIKXENP7DF45OUG3GKMYCMDXM3GS
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QPNJSIKXENP7DF45OUG3GKMYCMDXM3GS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--udvt/bvCvfnRf3US
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 24, 2023 at 02:06:57PM -0500, N=EDcolas F. R. A. Prado wrote:

> Probably the spammiest messages are=20

> [   33.881459] mt8192-audio 11210000.syscon:mt8192-afe-pcm: mt8192_afe_ru=
ntime_resume()
> [   33.889320] mt8192-audio 11210000.syscon:mt8192-afe-pcm: mt8192_afe_en=
able_clock()
> [   34.029456] mt8192-audio 11210000.syscon:mt8192-afe-pcm: mt8192_afe_ru=
ntime_suspend()
> [   34.041718] mt8192-audio 11210000.syscon:mt8192-afe-pcm: mt8192_afe_di=
sable_clock()

> from mt8192-afe-pcm.c, so I think it would make sense to get rid of those=
 in
> this commit as well.

They should definitely go as well, I don't know that there's a specific
need for it to be this commit though - it was mostly just what I noticed
while looking at the controls that were failing tests.

> Way less spammy, but there are also

> [  176.209790] mt8192-audio 11210000.syscon:mt8192-afe-pcm: mtk_dai_tdm_h=
w_params(), id 43, rate 48000, channels 2, format 6, mclk_rate 24576000, bc=
k_rate 3072000
> [  176.224149] mt8192-audio 11210000.syscon:mt8192-afe-pcm: mtk_dai_tdm_h=
w_params(), out_channels_per_sdata =3D 2
> [  180.272153] mt8192-audio 11210000.syscon:mt8192-afe-pcm: mtk_tdm_en_ev=
ent(), name TDM_EN, event 0x8
> [  180.281462] mt8192-audio 11210000.syscon:mt8192-afe-pcm: mtk_tdm_bck_e=
n_event(), name TDM_BCK, event 0x8, dai_id 43

> from mt8192-dai-tdm.c.

Yup.

> Anyway, if you prefer to keep only changes in the ADDA driver for this co=
mmit
> that's fine too, and I can send another patch removing these other ones l=
ater.

That'd be great, I will probably take more passes at this stuff at some
point but it's very much a background thing.

--udvt/bvCvfnRf3US
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmP5DLUACgkQJNaLcl1U
h9DLFwf/YAM2Ep/kv6qQZQ6+TxtU7vTdLiprq5aQtl2WrtHV1TeDyqQh7kR9Li5D
75H051WimadBJSKxF19fHEd3ISMefuIYUhpQACpS0xyyN5Dg8kbp/Kfp2HdIWLsl
Kiptkup62x8YDVO1kVkyNrsJlimZU14yPx8OhPk475PB/pBXUXrozRiI9uwxHELc
/GiMndnDjS/xHRHqIBvg2wrSQYaZblAw8NBNL5wbgc99twQ04kftOceFoY+LDZ1y
ouTizm1i/w8ZtV9WjbQ2sq3/dMS3hSoXEMgQFcuZfyGdN/JTKKTwtg/2BiHr8k/J
3+69dA+Tg4vSKZjKrkiZs6ROKKxJ4w==
=J6dC
-----END PGP SIGNATURE-----

--udvt/bvCvfnRf3US--
