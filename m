Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB748B8419
	for <lists+alsa-devel@lfdr.de>; Wed,  1 May 2024 03:57:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CEC05A4B;
	Wed,  1 May 2024 03:57:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CEC05A4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714528648;
	bh=YHqNQfR2KzM3NdArIJMkOcJO9cdsTJsp3u0H/eNeyPI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZO6QU6sxWN4RGuoervRVFzfVd8NWXUWG6fKvwq0L3RqEKzHVUUSAnvs6t5rTM25LE
	 +tNKwpKRLZuVimHtpXV/rkCOnVJrkWTnnOTVhiakYP1uC8HI7jyOnCHk58U3jaZCXc
	 vyf3wHIb/kZvtjLNAQihGEzbOJScFz7PSa72J1s0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 92870F805AE; Wed,  1 May 2024 03:56:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 12E7EF8057F;
	Wed,  1 May 2024 03:56:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CFA9FF80266; Wed,  1 May 2024 03:56:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 662B9F800E2
	for <alsa-devel@alsa-project.org>; Wed,  1 May 2024 03:56:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 662B9F800E2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=eSStSS/N
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1256361774;
	Wed,  1 May 2024 01:56:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FD2CC2BBFC;
	Wed,  1 May 2024 01:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714528582;
	bh=YHqNQfR2KzM3NdArIJMkOcJO9cdsTJsp3u0H/eNeyPI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eSStSS/NICuFDdVh5b39LHmEYgRreHSqX8JHJYP/UBw7rK3B6MK/2TPkLre3fEHfu
	 tLQSNFeTvzu8j1h0d6CBrA6ZFZMH3z2AqRFdPJEalH2PHrSs64AmD3NPhOS1Zu/gcU
	 HBi44k60jAkcvP6MHmgniiYlLG1si5ZshpPh2azKd+8WEGrcyGtwLePwl5zYB49WIb
	 HeXw89okgcX3KnOeSqGEm1czuK2mdFp6t7IAES7cHMxRHuod9ZJHIPg+5YSCtAk+z1
	 bA9hZY9fouyoWtbyyiNt3kCY2+xGK03foFE7ETcr+bHYdSRxqXWF7BkBDziHtta/hE
	 Vmr6/qX+g7Fkg==
Date: Wed, 1 May 2024 10:56:15 +0900
From: Mark Brown <broonie@kernel.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sebastian Fricke <sebastian.fricke@collabora.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>, hverkuil@xs4all.nl,
	sakari.ailus@iki.fi, tfiga@chromium.org, m.szyprowski@samsung.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz,
	tiwai@suse.com, alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v15 00/16] Add audio support in v4l2 framework
Message-ID: <ZjGhPz-bokg6ZbDJ@finisterre.sirena.org.uk>
References: <1710834674-3285-1-git-send-email-shengjiu.wang@nxp.com>
 <20240430082112.jrovosb6lgblgpfg@basti-XPS-13-9310>
 <ZjEEKyvb02CWz3l4@finisterre.sirena.org.uk>
 <20240430172752.20ffcd56@sal.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1s5XZL2PHP3gK0J2"
Content-Disposition: inline
In-Reply-To: <20240430172752.20ffcd56@sal.lan>
X-Cookie: lisp, v.:
Message-ID-Hash: D7WSKPXFBIZI5RIF3MH7FRD7JQGKPWJT
X-Message-ID-Hash: D7WSKPXFBIZI5RIF3MH7FRD7JQGKPWJT
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/D7WSKPXFBIZI5RIF3MH7FRD7JQGKPWJT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--1s5XZL2PHP3gK0J2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 30, 2024 at 05:27:52PM +0100, Mauro Carvalho Chehab wrote:
> Mark Brown <broonie@kernel.org> escreveu:
> > On Tue, Apr 30, 2024 at 10:21:12AM +0200, Sebastian Fricke wrote:

> > The discussion around this originally was that all the audio APIs are
> > very much centered around real time operations rather than completely

> The media subsystem is also centered around real time. Without real
> time, you can't have a decent video conference system. Having
> mem2mem transfers actually help reducing real time delays, as it=20
> avoids extra latency due to CPU congestion and/or data transfers
> from/to userspace.

Real time means strongly tied to wall clock times rather than fast - the
issue was that all the ALSA APIs are based around pushing data through
the system based on a clock.

> > That doesn't sound like an immediate solution to maintainer overload
> > issues...  if something like this is going to happen the DRM solution
> > does seem more general but I'm not sure the amount of stop energy is
> > proportionate.

> I don't think maintainer overload is the issue here. The main
> point is to avoid a fork at the audio uAPI, plus the burden
> of re-inventing the wheel with new codes for audio formats,
> new documentation for them, etc.

I thought that discussion had been had already at one of the earlier
versions?  TBH I've not really been paying attention to this since the
very early versions where I raised some similar "why is this in media"
points and I thought everyone had decided that this did actually make
sense.

--1s5XZL2PHP3gK0J2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmYxoT4ACgkQJNaLcl1U
h9Cdygf/bf6TAsptAknaEPQAw2Z5iLipMaPxhatnFylMl5K5iu0XYqQKgMjz9hzh
pGWiv30tMEb1WWSd01RSGVLhVOz6Q/BoFOLmnu8iqikc/Y9AXuMpznA5kR9n+frq
Vlmf+jK0/Yx/co+47MPq9h7wsuCHeavsUyinC7Iw+M5MkxLXy4ga/C/0tl2tDANc
Ev6nkmUcjKAhI2O6zqwyxvO+0fagaQevxsYwhxJGbcqNcXzaa+OYshVVq8y00ugk
paLFfitKTRz1J3qN5WfkELm40cyRulKxZIdJAQIO0VFwzCIWOdty1FYDs5GXlL0f
Ys8S/0aZLJEVbPqQA1tZML2Y+D99YQ==
=NaHt
-----END PGP SIGNATURE-----

--1s5XZL2PHP3gK0J2--
