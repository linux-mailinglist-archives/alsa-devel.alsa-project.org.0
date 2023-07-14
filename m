Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AD41C7544DD
	for <lists+alsa-devel@lfdr.de>; Sat, 15 Jul 2023 00:14:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0EC419F6;
	Sat, 15 Jul 2023 00:14:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0EC419F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689372891;
	bh=l96L9J8hBsWDuTUH/ZGsqG5CQNHNXWiy1xFGFIrYsnk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=f+IUA5MOcd4APbEWHL4rv8Lq32Y8bQonbt6cqlk061/jlJuEKkLEWQcafAR2Zf9Tt
	 tIEmv1F7gT43P7xwkBRTUdNgoUZhQMZiYOCHezjwd7c737QnrOtpuO210oSzStIrGm
	 qlCj7/akZhxKdD0ztCcgW5FY0fo60i+0SaB7m1To=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B0F3AF80544; Sat, 15 Jul 2023 00:13:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 66794F80236;
	Sat, 15 Jul 2023 00:13:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1FCF3F80249; Sat, 15 Jul 2023 00:13:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C3ECAF80093
	for <alsa-devel@alsa-project.org>; Sat, 15 Jul 2023 00:13:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C3ECAF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=D2gg56bL
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2417161DF2;
	Fri, 14 Jul 2023 22:13:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D829CC433C7;
	Fri, 14 Jul 2023 22:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689372805;
	bh=l96L9J8hBsWDuTUH/ZGsqG5CQNHNXWiy1xFGFIrYsnk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D2gg56bLJPYiYa0V2YONcgUj+/t+cTs/v7bW/E7jv/U91FLKCTklXpS+cMIG2garf
	 UFryoh/iHRBrGEDbhALjjkizQODgjdNqHXlCsvqb3MwxAL5CvBjXqUmSWvt+aObD/z
	 UEhlNZ5TQkk3P493kz7AzfoeoRW0XN+mPKbC8mmgNfqRcxBk5gtKvIAmXPc95ALj1T
	 0T1gBnfs/tCNJ5DtOINfmg75Y+NP2FxJdSD4mzJMRdS4WUD0FCgIvuyzvGBI12+u4U
	 hzm9dd5NSc9FyEC3p1CVfe56kIaV4NS6bp8WGAKjqOhn5HZ3Xd9BZ2Sm0uW9x5aHUW
	 zj8gfSVTrJheg==
Date: Fri, 14 Jul 2023 23:13:21 +0100
From: Mark Brown <broonie@kernel.org>
To: "Ding, Shenghao" <shenghao-ding@ti.com>
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: Re: [EXTERNAL] {standard input}:866: Error: value -148 out of range
Message-ID: <da0e5aab-9ed2-438d-a05a-e9e7ff1e7726@sirena.org.uk>
References: <aa4c25eec6d947f5a3d19860680541de@ti.com>
 <a9019847806c476f992e4c33045e6ca5@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TlLTAPrQhV/s1gp7"
Content-Disposition: inline
In-Reply-To: <a9019847806c476f992e4c33045e6ca5@ti.com>
X-Cookie: Preserve the old, but know the new.
Message-ID-Hash: UNXM2NQJXK5QDCECVHTBVKLJOJS3MUFU
X-Message-ID-Hash: UNXM2NQJXK5QDCECVHTBVKLJOJS3MUFU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UNXM2NQJXK5QDCECVHTBVKLJOJS3MUFU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--TlLTAPrQhV/s1gp7
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 12, 2023 at 05:40:31AM +0000, Ding, Shenghao wrote:

> > the=A0same=A0patch/commit),=A0kindly=A0add=A0following=A0tags
> > |=A0Reported-by:=A0kernel=A0test=A0robot=A0<mailto:lkp@intel.com>
> > |=A0Closes:
> > |https://lore.kernel.org/oe-kbuild-all/202307100413.lPlgpaPd-lkp@intel.c
> > |om/

> > All=A0errors=A0(new=A0ones=A0prefixed=A0by=A0>>):

> > =A0=A0=A0{standard=A0input}:=A0Assembler=A0messages:
> > >>=A0{standard=A0input}:866:=A0Error:=A0value=A0-148=A0out=A0of=A0range
> > >>=A0{standard=A0input}:866:=A0Error:=A0value=A0of=A0ffffff6c=A0too=A0l=
arge=A0for=A0field=A0of
> > >>1=A0byte=A0at=A00000043b

> Would you be so kind and give me some advice on how to I fix this issue?

That's...  not obvious :/ .  I'd try contacting the m68k maintainers and
see if it rings any bells for them.  If you don't have a m68k toolchain
then the ones Arnd maintains at:

    https://mirrors.edge.kernel.org/pub/tools/crosstool/

should be able to help you out, perhaps some playing around with the
config might turn something up.

--TlLTAPrQhV/s1gp7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmSxyIEACgkQJNaLcl1U
h9CI7wf/YN24KGRGVcKvF9NTwhXoNPvYvZjawxR8laspbTR4vcqEOP046gCif9Ji
0kgHTTUR3MPRJYKHh588YtuMNPHZLLg2NPNGyIJbMTVOS8+H8VScQ3WU5HPpyFVR
Rks/bDy1egKlmsD4iIzKexzydjDymEXtOjcuTDFlFi2nwhMDqBWN/DszLDaefISA
PDOIbgl72ABTHXILvF4kRZFpt9pRZu0Xzf46J3r3loGfRPn1wzDlASE2WC9TZm/9
L+0sZ8mbhr+/sRU+K4kRnfpSeLCyPmvhNK2i43XHHeul3663eNXKHGARNpf15xS6
Dgz16ghiS97/wjkK6481o1HHqUzu+A==
=yNLN
-----END PGP SIGNATURE-----

--TlLTAPrQhV/s1gp7--
