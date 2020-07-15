Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F548221229
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Jul 2020 18:23:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D2D711674;
	Wed, 15 Jul 2020 18:22:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D2D711674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594830219;
	bh=eT6BTd/Zx8Q5ccT8rkBpk/1FMwIdvf+1GrdYf74olgc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GTjq/FMwIhUTrmD5jhhaTmVUrzN05Bzh+SYpravvCb7BOiKfI3nVyJzDC5iXAVVZa
	 U0zWBCS+aC9c/eivpTp7/PregoeijGtIzlqbyTTua9rlPqpyMIn+/XGiro+UPyFzDp
	 OcurSd1LPQEXsW+FXE+UMSEmcTShTEtfU2gEFJ90=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 45F18F80113;
	Wed, 15 Jul 2020 18:22:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AD54EF80229; Wed, 15 Jul 2020 18:22:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 006E9F80113
 for <alsa-devel@alsa-project.org>; Wed, 15 Jul 2020 18:22:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 006E9F80113
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="xtBMl1Lk"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 607842065E;
 Wed, 15 Jul 2020 16:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594830131;
 bh=eT6BTd/Zx8Q5ccT8rkBpk/1FMwIdvf+1GrdYf74olgc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=xtBMl1Lkp2tHTt9F0hewQXObOrrserzLr+rKu4S4aktKmcNKltsAmxyGYDskLoMTt
 dS2nIL8K+eHBckSCxbCGTXI6Fd3LDmfG8htgV9VTM58BKQOSCTt6zz9+n+kNxjkREB
 I6JgfGJRBr9lKocj0owTpglgIJ5owpryEeTDW/hY=
Date: Wed, 15 Jul 2020 17:22:02 +0100
From: Mark Brown <broonie@kernel.org>
To: Arnaud Ferraris <arnaud.ferraris@collabora.com>
Subject: Re: [PATCH 0/4] ASoC: fsl_asrc: allow selecting arbitrary clocks
Message-ID: <20200715162202.GJ5431@sirena.org.uk>
References: <20200702142235.235869-1-arnaud.ferraris@collabora.com>
 <20200702184226.GA23935@Asurada-Nvidia>
 <3f39a0bb-a766-f646-28b3-a51cf9983c6b@collabora.com>
 <3fea8912-63df-ff27-0c29-6284a85107ab@collabora.com>
 <20200714201544.GA10501@Asurada-Nvidia>
 <20200714202753.GM4900@sirena.org.uk>
 <20200714205050.GB10501@Asurada-Nvidia>
 <20200715140519.GH5431@sirena.org.uk>
 <0a56326b-27a9-d9f4-3923-8773963d7548@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="+9faIjRurCDpBc7U"
Content-Disposition: inline
In-Reply-To: <0a56326b-27a9-d9f4-3923-8773963d7548@collabora.com>
X-Cookie: 40 isn't old.  If you're a tree.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 Nicolin Chen <nicoleotsuka@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 kernel@collabora.com, Fabio Estevam <festevam@gmail.com>
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


--+9faIjRurCDpBc7U
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 15, 2020 at 06:18:38PM +0200, Arnaud Ferraris wrote:
> Le 15/07/2020 =E0 16:05, Mark Brown a =E9crit=A0:

> > Honestly for anything that fun it tends to be a custom machine driver.
> > A property would seem reasonable though.

> I think so, does my initial implementation of the properties look
> sensible to you? ("fsl,asrc-input-clock" & "fsl,asrc-output-clock")

Those look reasonable enough off the top of my head, not that I've
really looked at the hardware.

--+9faIjRurCDpBc7U
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl8PLSkACgkQJNaLcl1U
h9BkmAf/Z0V1Eb+A2EGmiFuW+ziL7yJnYp0req34SxMFVo/WgQPUOSpA8ioVX/a+
xt5KVDHCN9FmjHphFHf6t+t7XJjEtnlfrKyoAhJlmu30K4Hyw6YeFnACEr2gQzcL
qJYhS22uU76Jrgk0l11rvDlX3pAsGrjEwBo+INsYdix6x339mi3cVc8dNQp76lPO
OiGE+vnHKqbtw71caWc+No4JXPVm0W8FD/ovs52fvWEg1mjHKXENDMaxAWvXEMo/
fvx9P5LgACTfmclCzh+Iub3Qz+ETuUreytKgi8I647DAO2pMxul9HuxlZ8ZmcvTP
Ibm55Iff0fv/6vg5p7ze/mxldgAN9A==
=un2V
-----END PGP SIGNATURE-----

--+9faIjRurCDpBc7U--
