Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF5A626999
	for <lists+alsa-devel@lfdr.de>; Sat, 12 Nov 2022 14:36:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 359711673;
	Sat, 12 Nov 2022 14:35:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 359711673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668260179;
	bh=hVeujgpbsR+OV5+KCHpDO/ek0DALY7aOLmsd6J8rfNQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nxiz4A52rtnC/A+Z92Jx/TKCaVm+S8+bz8ICFj2wXA+lOLJdRQN5HjfsL1Zcy6CNj
	 qG0slGk+RugSrFGcYuSC8fNieenSmZKWm/+Q0ApcqUp0Um9BjE/6kKxSYeu29LAl+j
	 Tig9zoAyTe88b6RwmUp1VABo0HLwT1TSYo0I1MJo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A33CCF80423;
	Sat, 12 Nov 2022 14:35:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 55291F800E5; Sat, 12 Nov 2022 14:35:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SORTED_RECIPS,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1E130F800E5;
 Sat, 12 Nov 2022 14:35:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1E130F800E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="qh3OumoF"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CB1FA601BD;
 Sat, 12 Nov 2022 13:35:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1FA8C433C1;
 Sat, 12 Nov 2022 13:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668260112;
 bh=hVeujgpbsR+OV5+KCHpDO/ek0DALY7aOLmsd6J8rfNQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qh3OumoFGbOnAzu35kkwGg5ppRqSBWdZzlwJ3s+z6MB7BsUoV8yCg8PhnkgM59sqy
 X54DczvP2IAfvmpSnc92o6a+fmA8/Apntn6TbYeDoV8AKt/J/ysM6/wyfyZ773LVNt
 EA++t0H/RPrttGx/YqdXn/tPlgC915EQckWBBjZk28SDupaCt19pe6pU4NSsqqsakT
 6hKKJSvLttMxkIxoKKf7ZSLauOUs95MbrugpyQ0Oyquf9wbxBUMG9tTSX8HXr1QAYX
 4j0uyqTb1xP4NcBdcFfO5ful0CM/QUuBp8qoh4FfGuxQ8JB2w9Hw8KnfvvDbK9sq9i
 TouOJvS704/bA==
Date: Sat, 12 Nov 2022 13:35:06 +0000
From: Mark Brown <broonie@kernel.org>
To: syzbot <syzbot+9abda841d636d86c41da@syzkaller.appspotmail.com>
Subject: Re: [syzbot] WARNING in snd_usbmidi_output_open
Message-ID: <Y2+hCnVYWHuROAEF@sirena.org.uk>
References: <000000000000734a7305ed3608ba@google.com>
 <00000000000073937205ed45fe5c@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="/RS2WdliLAVa+DOF"
Content-Disposition: inline
In-Reply-To: <00000000000073937205ed45fe5c@google.com>
X-Cookie: Sleep is for the weak and sickly.
Cc: alsa-devel@alsa-project.org, rafael@kernel.org, gregkh@linuxfoundation.org,
 tiwai@suse.com, clemens@ladisch.de, lgirdwood@gmail.com,
 alsa-devel-owner@alsa-project.org, linux-kernel@vger.kernel.org,
 syzkaller-bugs@googlegroups.com, peda@axentia.se
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


--/RS2WdliLAVa+DOF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 12, 2022 at 05:29:21AM -0800, syzbot wrote:
> syzbot has bisected this issue to:
>=20
> commit 4f8ed19593872b710f27bbc3b7a9ce03310efc57
> Author: Mark Brown <broonie@kernel.org>
> Date:   Thu Jun 2 13:10:58 2022 +0000
>=20
>     ASoC: tfa9879: Use modern ASoC DAI format terminology

This bisection really doesn't seem credible for an issue in a different
driver...  The tfa9879 is neither a USB nor MIDI device, and the commit
in question is a stylistic update.

--/RS2WdliLAVa+DOF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmNvoQkACgkQJNaLcl1U
h9BMbQf/Tqra5Lp05g+IVNIpqu8jemjvb4459Sw7r0DMv8JsgIgIMOcucoXt0VT0
pZ9x8JXtgM9t61pG+2I6a3OGDrHHHnZxpuEUTkAuGb0yZlh8s71658kiDAvAgQpm
iCl5MEYpl0aoia5oy+VoEJQ3//Y7/8xMM0IKst61OKmod/XcjVOB1qmGexW3ZDBq
e5iy7Hf7M9D6ZzaPmJHOqwUvXEmozUW06G+1wLcqzAQnAxT6Q/HDqMW8HR624KhK
VuPS2iF8JYCvHPiy9kDYuZyKMb1a71VfRYkgR3sn0Zc2KKbQ7WrfEe9yRFjgo0j+
E0FuF257SOTFiyVcKnqSFlxn7WTcuQ==
=7btB
-----END PGP SIGNATURE-----

--/RS2WdliLAVa+DOF--
