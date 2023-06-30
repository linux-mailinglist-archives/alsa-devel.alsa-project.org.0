Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 81509743ABC
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Jun 2023 13:23:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1A79B7F4;
	Fri, 30 Jun 2023 13:22:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1A79B7F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688124220;
	bh=m5STNqiJvAYLI/NlBN13tyDYzsXURBtP7i6n5935fIk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pehee35dMghbwZcvSMAjd0quD0K05VRaRi3YH8NRIjQ7afp3QP98bsFoV2LNqA+cJ
	 +6yBRtc4YFwa54iGgYK3lrlRVh/490vgboKL4hLq+e2DhLuUEiNOhGJrpcqegncxQ1
	 xtDlzXC383ueA+fupQGrv1/L8ATtIxSocN68+1M0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9346AF8051E; Fri, 30 Jun 2023 13:22:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 45DD5F80169;
	Fri, 30 Jun 2023 13:22:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4AF36F80212; Fri, 30 Jun 2023 13:22:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 39693F80124
	for <alsa-devel@alsa-project.org>; Fri, 30 Jun 2023 13:22:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 39693F80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=KXTFKFIn
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4737961714;
	Fri, 30 Jun 2023 11:22:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DB8EC433C8;
	Fri, 30 Jun 2023 11:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688124157;
	bh=m5STNqiJvAYLI/NlBN13tyDYzsXURBtP7i6n5935fIk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KXTFKFInaQsuvChh3L6rrCqd0dYf533iVP+lqfxOAV81gg7IkRu5vnZorwc0vRkEg
	 hj2Upkk5KxFMZZaqy76KLCKfuTNscamHnRnJazxR3Iu8S5gWTfLzkSrdWaESpxpDn5
	 J6H4srZ7wmkDFYYIOlLO9Sb9fFeJUs/DPyvaX/wYCdvN13ey8dx+Cdb+20LqmoQNC1
	 U8O27vgeTbkf0FBqDl3ofjzRXRtVURxtXeM1rigC+rGJT/WaqLaN9g5Ws2uXWzAqUU
	 Njnng51YdRI3zBs/f59pD+fxUaYpRZdiv8H8jSaRWvErxs+XcC+MV4O2z+UfZ7/Qqu
	 ocZUOmMvxz1EA==
Date: Fri, 30 Jun 2023 12:22:31 +0100
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, tfiga@chromium.org,
	m.szyprowski@samsung.com, mchehab@kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Xiubo.Lee@gmail.com, festevam@gmail.com, nicoleotsuka@gmail.com,
	lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 4/6] ASoC: fsl_asrc: Add memory to memory driver
Message-ID: <f234b307-9ee6-489d-af8f-46cdc966a6cb@sirena.org.uk>
References: <1688002673-28493-1-git-send-email-shengjiu.wang@nxp.com>
 <1688002673-28493-5-git-send-email-shengjiu.wang@nxp.com>
 <f6598cb0-6773-4475-85e1-5dfacaa16de3@sirena.org.uk>
 <CAA+D8ANbMYr9ATSfWnbq69ECHOPNTiOBc7QACEeHomCC+rTHng@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZYyaaohwRe2QLoL2"
Content-Disposition: inline
In-Reply-To: 
 <CAA+D8ANbMYr9ATSfWnbq69ECHOPNTiOBc7QACEeHomCC+rTHng@mail.gmail.com>
X-Cookie: Old mail has arrived.
Message-ID-Hash: X2RUWW2R366FZ4OYJSDGZK4KUZ2QXUN7
X-Message-ID-Hash: X2RUWW2R366FZ4OYJSDGZK4KUZ2QXUN7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/X2RUWW2R366FZ4OYJSDGZK4KUZ2QXUN7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--ZYyaaohwRe2QLoL2
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 30, 2023 at 11:37:29AM +0800, Shengjiu Wang wrote:
> On Thu, Jun 29, 2023 at 7:39=E2=80=AFPM Mark Brown <broonie@kernel.org> w=
rote:
> > On Thu, Jun 29, 2023 at 09:37:51AM +0800, Shengjiu Wang wrote:

> > > Implement the ASRC memory to memory function using
> > > the v4l2 framework, user can use this function with
> > > v4l2 ioctl interface.

> > This feels like the bit where we interface v4l to ASoC should be a
> > separate library, there shouldn't be anything device specific about
> > getting an audio stream into a block of memory.  I'm thinking something
> > like the way we handle dmaengine here.

> > I've not dug into the code yet though.

> Users may want to get the ASRC output in the user space, then
> do mixing with other streams before sending to ALSA.

> As there is no such API in ASoC,  the best interface I found is
> the V4L2, but I need to do a little modification of the V4L2 API,

> extend it for audio usage.

> Could you please suggest more about the "separate library"?
> Should I place this "sound/soc/fsl/fsl_asrc_m2m.c" in another folder?

The concept of connecting an audio stream from v4l directly to something
in ASoC isn't specific to this driver or even to the i.MX platform, the
code that deals with that part of things should be split out so that it
works the same for any other drivers that do this.

--ZYyaaohwRe2QLoL2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmSeuvYACgkQJNaLcl1U
h9DZPQf/WRYZwwHKLB9mVIRQZZ3u6JtZ0ySgC91H4ZgQ5NoaNPmmTmrm01BN5uZY
g1Olg2Bv9gQOnIpXDWytRn/v2JUdQ20dZ6cLKy+bbl1BhQqvulFIGTzKGMq4b3IH
7PYrDvV/5kgWexeIpT9DLyjRkbGqKQyBvqNBlFqNfxkMsIrt62KoCV675wsDlMWD
EU1tqBs19JrAxETCTXrL2RJ5S04bAWMke1rUCk0+1VmY3ZdogUqzcG+5aNGu76BS
brxQXCbTUXO///D75UaNwnA/8+O4lhy6G+2AHIjU3ipDArCU7JOtZgb5OAHKIM/N
IqrbcHoRZmDTkY8gRIRocOi8b3wQUA==
=zz+l
-----END PGP SIGNATURE-----

--ZYyaaohwRe2QLoL2--
