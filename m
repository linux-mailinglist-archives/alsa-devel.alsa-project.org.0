Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 287B62F244E
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Jan 2021 01:44:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9E47316C0;
	Tue, 12 Jan 2021 01:43:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9E47316C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610412266;
	bh=ixruP2jH6jsjZSfS1b9tO6gucm00OKQq+Tt59fxAIQo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JeEwj+LJ+8DS4ptyqkidbE2ElwcLj3MRYjGEOxaDk8jTCtl9LJ8KRdf6VYSdihCm2
	 qCwSbVmDxagXu/nX2ia14Fy54YkwiyF3/FP4Xhx/4WedMTrQMRTlSyuaml5W7fKdnu
	 Vv11x+PE6afDBNw9/KWC6JTyY3Psceaf9eg5tWMo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0624CF80254;
	Tue, 12 Jan 2021 01:42:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0FDE9F8016D; Tue, 12 Jan 2021 01:42:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DD479F8013D
 for <alsa-devel@alsa-project.org>; Tue, 12 Jan 2021 01:42:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DD479F8013D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="f2ar9cwl"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8DCA5224BD;
 Tue, 12 Jan 2021 00:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610412160;
 bh=ixruP2jH6jsjZSfS1b9tO6gucm00OKQq+Tt59fxAIQo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=f2ar9cwlhCekx8U9xqAaUt5oxbm+Pz3pY88CGx06ZcMOayXZMW96cYZz7tqFJbjBK
 XNxsNgF5xW7mMHZ3XqRI706mA+qaSk5/chLY0waCTgQdazPZNubdDnLhAbQlKm4+4y
 NhDWH2scjUFZ4qsktVls5o9g+29OhMz74+7RdXhlXFoUSUX7S0U2k0dAHxUEgkJ3aI
 AY8iR3O1YM5/pJ5WT2PH/aTkwXGpuFlO9nCrD/c75LmK9x4dhHj2jpF3hrqX1N/lxl
 akQkOJWQFg34PSAQ0ceUCudkBaEX03Hfy2fI8abrIR0mkFNzC5A511Q3IUniUTpoNL
 Q8b0MupcLQzmg==
Date: Tue, 12 Jan 2021 00:42:07 +0000
From: Mark Brown <broonie@kernel.org>
To: Yu-Hsuan Hsu <yuhsuan@chromium.org>
Subject: Re: [PATCH 1/2] cros_ec_commands: Add EC_CODEC_I2S_RX_RESET
Message-ID: <20210112004207.GN4728@sirena.org.uk>
References: <20210107085942.2891525-1-yuhsuan@chromium.org>
 <20210107135459.GB4726@sirena.org.uk>
 <CAGvk5PqMCEib8Yr=V4SxT0BBMoC1+yGXm0y+52+LwC5dPQUVnA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="GOzekVbrLdOLv44p"
Content-Disposition: inline
In-Reply-To: <CAGvk5PqMCEib8Yr=V4SxT0BBMoC1+yGXm0y+52+LwC5dPQUVnA@mail.gmail.com>
X-Cookie: Too much is not enough.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: ALSA development <alsa-devel@alsa-project.org>,
 "Gustavo A . R . Silva" <gustavoars@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Guenter Roeck <groeck@chromium.org>, Prashant Malani <pmalani@chromium.org>,
 Pi-Hsun Shih <pihsun@chromium.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Benson Leung <bleung@chromium.org>, Cheng-Yi Chiang <cychiang@chromium.org>
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


--GOzekVbrLdOLv44p
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 08, 2021 at 12:57:51PM +0800, Yu-Hsuan Hsu wrote:
> Mark Brown <broonie@kernel.org> =E6=96=BC 2021=E5=B9=B41=E6=9C=887=E6=97=
=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=889:55=E5=AF=AB=E9=81=93=EF=BC=9A

> > I think the request was to sync over all the commands that are supported
> > in the EC rather than just split this one addition into a separate
> > patch.

> Got it. However, after running make_linux_ec_commands_h.sh to create
> the new cros_ec_commands.h, I found there are lots of difference (1092
> insertions(+), 66 deletions(-)). In addition, there are also some
> redefined variables(most are in ./include/linux/usb/pd.h) causing the
> compile error.

> It seems not easy to sync cros_ec_commands.h. I'm afraid of breaking
> something. Does anyone have any suggestion? Thanks.

TBH that seems like a big enough change to split out from this and done
as a separate series, I'd be perfectly happy to apply your original
change.  I guess part of doing that sync up should ideally be to
refactor things so that it can be done mechanically in future.

--GOzekVbrLdOLv44p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl/88F4ACgkQJNaLcl1U
h9AUXgf+NGKX1X7yUNmCGqQyYEJS+HdyisSjro4ojSQQ+LK3e9fnBBUOFoOg1Y+S
rCgD6DHL041jBL/BV1Eh9e9B2j+nbzI3EqDUHLOjfd1zmKHfV23qLbvGkwaNUoF6
Qd3Yb1bG4DCZtDymdhI/90CsM3rRamfrYOI4TwmkMASsRbU1PkmnNxmuUNqZRhxL
kdT3mTVgtA8p2SzXIwBJzpS7ves32OGVGcMSO0ZXW8TCiLLO/vAhTDv8Bt72BSei
FSEzehrc1QDdX5z3gYDG1aKOLtTeklrUSgYWpvjH5Fq8kfcfOBCSkIYv4mhGHvee
6/ebyNfgdP1O8aXF3gURGpw7m8oYGQ==
=N0ny
-----END PGP SIGNATURE-----

--GOzekVbrLdOLv44p--
