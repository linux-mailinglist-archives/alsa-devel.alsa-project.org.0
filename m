Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 36FB9614C9E
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Nov 2022 15:32:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 19BCA1692;
	Tue,  1 Nov 2022 15:31:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 19BCA1692
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667313149;
	bh=PraM4w70iFnWAoFu4Zw06rGjP1yDdSv36Dxtp9QORCY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WUIDthuOd9rfF02JyEAtXGdaHZOlLGy+yG9jhlLmBRejl/qhLcIsHasCSKJlsOUj/
	 T4hupuFWSgCiIzNGLL21MxMhILLQAZgFy/glD6LQb0SyREx0ojxU+8/tliIJtBT3OD
	 kao5ez/azlOo0+5hNurU3ffqNE3/XQq5qmg9/5Co=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8EF7EF800F3;
	Tue,  1 Nov 2022 15:31:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4606AF80423; Tue,  1 Nov 2022 15:31:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 70CB4F800F3
 for <alsa-devel@alsa-project.org>; Tue,  1 Nov 2022 15:31:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 70CB4F800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="hVImuBQ6"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5E0E9B81BD2;
 Tue,  1 Nov 2022 14:31:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C179C433D6;
 Tue,  1 Nov 2022 14:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667313085;
 bh=PraM4w70iFnWAoFu4Zw06rGjP1yDdSv36Dxtp9QORCY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hVImuBQ6/V7ednkLtp5llPdeQ1b3JSfc3EoS9xWvDeibHATvolK13vgMEdM+b7nxE
 ZxB7Oiozvcp9nzmLeJhn7I//LlL563AxjoLdVBG38lDZ1vvFQQwOdEBF6XVSEMsvU+
 iejvoT94DPqtkeDz1tlgePKjmDtXicoP5ntdY0bQaLbLGsqJc9oRJodAdD1AcqZvG3
 YVqqXISsgotRCL++Xu5AYWhT8s4L9oVankx+1nmFXEKczIoGc3/t/QC7mIzLXC+IGt
 vOIkNN6eIIjtZyX4N0Ct90QD6IVN5AS+0OHGvLpOYjenj10SuhlLXroRM/B3CWZjEI
 s1um1R79cwXRw==
Date: Tue, 1 Nov 2022 14:31:18 +0000
From: Mark Brown <broonie@kernel.org>
To: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
Subject: Re: [PATCH] CHROMIUM: ASoC: amd: acp: Add tdm support for codecs in
 machine driver
Message-ID: <Y2EttkwUvMReQcqg@sirena.org.uk>
References: <20221028103443.30375-1-venkataprasad.potturu@amd.corp-partner.google.com>
 <Y1u1vj0K3m33wCTd@sirena.org.uk>
 <b384e012-31c5-8412-8b05-cd026c5d6a0f@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="5IRjf+q9nPdcPFUH"
Content-Disposition: inline
In-Reply-To: <b384e012-31c5-8412-8b05-cd026c5d6a0f@amd.com>
X-Cookie: Do not write below this line.
Cc: alsa-devel@alsa-project.org, Sunil-kumar.Dommati@amd.com, ssabakar@amd.com,
 Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
 ye xingchen <ye.xingchen@zte.com.cn>, Basavaraj.Hiregoudar@amd.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Venkata Prasad Potturu <venkataprasad.potturu@amd.corp-partner.google.com>,
 Vijendar.Mukunda@amd.com, vsujithkumar.reddy@amd.com,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 open list <linux-kernel@vger.kernel.org>
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


--5IRjf+q9nPdcPFUH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 01, 2022 at 03:15:08PM +0530, Venkata Prasad Potturu wrote:

> On 10/28/22 16:28, Mark Brown wrote:
> > > +static int tdm_mode =3D 0;
> > > +module_param_named(tdm_mode, tdm_mode, int, 0444);
> > > +MODULE_PARM_DESC(tdm_mode, "Set 1 for tdm mode, set 0 for i2s mode");
> > Why is this a module parameter - how would a user decide to set this?
> > Is it something that someone might want to change at runtime?
>=20
> While inserting this module we need to pass tdm_mode variable as 0 or 1 l=
ike
> below.

> sudo insmod /lib/modules/$(uname
> -r)/kernel/sound/soc/amd/acp/snd-acp-mach.ko *tdm_mode=3D1*

Right, that's what the code does but why is this something that should
be controlled in this fashion?

--5IRjf+q9nPdcPFUH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmNhLbYACgkQJNaLcl1U
h9C8Xwf/dZTML7Oy1rYG4am+cIqjeHDdSvmUtO3Pgrl/V+cjSxjhhF2IWtdgHS8q
7/ISFey6kCHwnXPb2rZr6WHVsQmNHznUrP+6i2zMC79EPVr8XRab0wSYM8xyd0sm
BJqWRHqlVpRn2y4VIsJOyqj8eZcqCdX/3N/BEMx+bIX7oeJss1bE++9ioKBCLvHk
4X7mqNOXTbKWMh2rFcl57z+aDGEnu/T4cUjU+hDMQV/LvZG7yzC+VLHQjVo4kcHV
zrw+tMnYwUfw7ypW6sI//Boxy9cdIqjRGBCXrZzd4Mx77I+EtaDPRZGZCVFEFB34
Rpv3Sl96f+v/CunfP5dtZSi5CFn9RA==
=jy5F
-----END PGP SIGNATURE-----

--5IRjf+q9nPdcPFUH--
