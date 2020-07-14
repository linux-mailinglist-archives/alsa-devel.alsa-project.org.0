Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6810921F717
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jul 2020 18:19:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EA4E5166C;
	Tue, 14 Jul 2020 18:18:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EA4E5166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594743576;
	bh=GHc/A54ej8xbpj6gfhPRdrZjqYoOmZGcyrndwuh7kUw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=baRkwVIChM/yP0LRwmejyIUbHoV+qjP+RAYC2xacmwt5xkDIE3m3cAni3LOVK7xOQ
	 Mo+HZ91E5C+OoCxbNHMk+grxhqjG/yZlj1hnLT09GX6EUv3XcuBkrWBBJ5B83SXmnH
	 t4aCEkdEysKmTc0UswEUFQL9M0MHafKXufoAdRqk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EF804F8016F;
	Tue, 14 Jul 2020 18:17:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 35905F8019B; Tue, 14 Jul 2020 18:17:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3DC99F80113
 for <alsa-devel@alsa-project.org>; Tue, 14 Jul 2020 18:17:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3DC99F80113
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="SjOM0G1b"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4CCF82082F;
 Tue, 14 Jul 2020 16:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594743467;
 bh=GHc/A54ej8xbpj6gfhPRdrZjqYoOmZGcyrndwuh7kUw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SjOM0G1bw04Wq//QItGFQXxxCi+rDxZneHP6HJQNDuZRZ9AloSlcf2HEuC9pMQEU2
 j4n6d9hwWBGmUGaO3XbuhR3NAYcoSSH8NE//NYCrAVHMgO+RdE056Dp5+q4IOm6A3l
 Fge2bhgS2PCihgavkSzLhk3Xt4RhQbN4qukVrv00=
Date: Tue, 14 Jul 2020 17:17:38 +0100
From: Mark Brown <broonie@kernel.org>
To: Primoz Fiser <primoz.fiser@norik.com>
Subject: Re: ASoC: codecs: wm9712: Mux no paths errors
Message-ID: <20200714161738.GG4900@sirena.org.uk>
References: <b050f906-35e7-b9a8-ea9d-93786ea5006a@norik.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="7uYPyRQQ5N0D02nI"
Content-Disposition: inline
In-Reply-To: <b050f906-35e7-b9a8-ea9d-93786ea5006a@norik.com>
X-Cookie: Your password is pitifully obvious.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org
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


--7uYPyRQQ5N0D02nI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 14, 2020 at 02:17:34PM +0200, Primoz Fiser wrote:
>=20
> I have a sound setup based on fsl_ssi + wm9712 codec.
>=20

Copying in the Cirrus driver maintainers, not deleting anything for
their benefit.

> On every drivers load I get the following console error:
>=20
> > > [ 5666.776770] wm9712-codec wm9712-codec: ASoC: mux Capture Phone Mux=
 has no paths
> > > [ 5666.784281] wm9712-codec wm9712-codec: ASoC: mux Differential Sour=
ce has no paths
>=20
> What is the proper way to get rid of this errors?
>=20
> As a temporary solution I have ifdef-ed the following muxes from the driv=
er
> like so:
>=20
> > @@ -364,8 +365,10 @@ SND_SOC_DAPM_MUX("Out3 Mux", SND_SOC_NOPM, 0, 0,
> >         &wm9712_out3_mux_controls),
> >  SND_SOC_DAPM_MUX("Speaker Mux", SND_SOC_NOPM, 0, 0,
> >         &wm9712_spk_mux_controls),
> > +#if 0
> >  SND_SOC_DAPM_MUX("Capture Phone Mux", SND_SOC_NOPM, 0, 0,
> >         &wm9712_capture_phone_mux_controls),
> > +#endif
> >  SND_SOC_DAPM_MUX("Left Capture Select", SND_SOC_NOPM, 0, 0,
> >         &wm9712_capture_selectl_controls),
> >  SND_SOC_DAPM_MUX("Right Capture Select", SND_SOC_NOPM, 0, 0,
> > @@ -374,8 +377,10 @@ SND_SOC_DAPM_MUX("Left Mic Select Source", SND_SOC=
_NOPM, 0, 0,
> >         &wm9712_mic_src_controls),
> >  SND_SOC_DAPM_MUX("Right Mic Select Source", SND_SOC_NOPM, 0, 0,
> >         &wm9712_mic_src_controls),
> > +#ifdef 0
> >  SND_SOC_DAPM_MUX("Differential Source", SND_SOC_NOPM, 0, 0,
> >         &wm9712_diff_sel_controls),
> > +#endif
> >  SND_SOC_DAPM_MIXER("AC97 Mixer", SND_SOC_NOPM, 0, 0, NULL, 0),
> >  SND_SOC_DAPM_MIXER("Left HP Mixer", AC97_INT_PAGING, 9, 1,
> >         &wm9712_hpl_mixer_controls[0], ARRAY_SIZE(wm9712_hpl_mixer_cont=
rols)),
>=20
> which works but feels like a dirty workaround, right?

> How can this be properly fixed in the wm9712 driver or somewhere else?

Someone needs to either removing the muxes as you have at the minute or
filling in their inputs (which should be fairly straightforward if you
take a look at the datasheet).  TBH if nobody's noticed them being
broken in all the time the driver has been in mainline it's probably not
that great a loss to remove them, someone who needs the support can
always re-add the muxes themselves while adding their inputs.

--7uYPyRQQ5N0D02nI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl8N2qEACgkQJNaLcl1U
h9CfTAf/dzNSBDWoKd/nl1gombwrTyxq1WpJx1BFGIr68UUkIkR+Q++vK6NSSLHR
L7HQhNLoHEBwmCkhM8ZR/iqVNhrvSMgMKm/EfCuYuROHGewDzGYwzyKapEo2Uzu0
DBTMD9PWqrek1VCe6s+GBsaQawjc34klv9KM2jOFUhDiZNqaRFgp8ejsjPd87Aau
7+NCxYcldAGwVEOzfMe427+il9s7MZG6hGJkIZc4Is4Xja/7ckk99YHlcgPD/gpK
2Q5yR3jj26fCVxja9bPdyrKCRXNWovs7YWL9SCuy47/vSavc4zbC2hLRT0rZD+Qg
1uJk/np/FGvt3VNiQ0+Im0j7rLlhxA==
=D6Ym
-----END PGP SIGNATURE-----

--7uYPyRQQ5N0D02nI--
