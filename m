Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E466252BBB
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Aug 2020 12:51:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 09BC71738;
	Wed, 26 Aug 2020 12:51:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 09BC71738
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598439110;
	bh=TqPevqx6D2J7PXGgLZWIHZHYHYk8i8daoX9CkV8jVM0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UoOFH0GHuqPEu5+GevsK5uvwhgbc1hMjUOH4A3p9QVatm+EkKibBKgb1NSZ/9nJ64
	 M2L97ny5sPBte2bMU/meEUzThzW5Nr7JgZyQYi24WPWwrS0fcAbQt7gAe2EekJKRHI
	 JPJO+C575uYhu1FVUZXCHdOchI6cqRebGpvrgO1w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F7C0F8016F;
	Wed, 26 Aug 2020 12:50:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6739DF801D9; Wed, 26 Aug 2020 12:50:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5B70AF80143
 for <alsa-devel@alsa-project.org>; Wed, 26 Aug 2020 12:49:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B70AF80143
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="2sgsrLL8"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 96C69206EB;
 Wed, 26 Aug 2020 10:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598438996;
 bh=TqPevqx6D2J7PXGgLZWIHZHYHYk8i8daoX9CkV8jVM0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=2sgsrLL8+6Se7RV01jW3bbRE2mvcZfKUPxov22vTodcl7jsNoAEyoN0nVtDuiV9Uy
 YbCjL5vyGCjtkW9Gxm5wwLDgAmsvpiB284grpS1ZcdGjsR1BQyldPXZ4OTsLiXQNpw
 4Ie/fRL6Whnaa9pcDNOXdoOByiDooJoftVzQm78I=
Date: Wed, 26 Aug 2020 11:49:19 +0100
From: Mark Brown <broonie@kernel.org>
To: syzbot <syzbot+fbe34b643e462f65e542@syzkaller.appspotmail.com>
Subject: Re: INFO: task can't die in p9_fd_close
Message-ID: <20200826104919.GE4965@sirena.org.uk>
References: <000000000000ca0c6805adc56a38@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ryJZkp9/svQ58syV"
Content-Disposition: inline
In-Reply-To: <000000000000ca0c6805adc56a38@google.com>
X-Cookie: Should I do my BOBBIE VINTON medley?
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: lucho@ionkov.net, alsa-devel@alsa-project.org, ericvh@gmail.com,
 netdev@vger.kernel.org, asmadeus@codewreck.org, tiwai@suse.com,
 syzkaller-bugs@googlegroups.com, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, v9fs-developer@lists.sourceforge.net,
 rminnich@sandia.gov, kuba@kernel.org, daniel.baluta@nxp.com,
 davem@davemloft.net
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


--ryJZkp9/svQ58syV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2020 at 03:38:15AM -0700, syzbot wrote:

> console output: https://syzkaller.appspot.com/x/log.txt?x=3D10615b36900000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=3Da61d44f28687f=
508
> dashboard link: https://syzkaller.appspot.com/bug?extid=3Dfbe34b643e462f6=
5e542
> compiler:       gcc (GCC) 10.1.0-syz 20200507
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=3D15920a05900=
000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=3D13a78539900000
>=20
> The issue was bisected to:
>=20
> commit af3acca3e35c01920fe476f730dca7345d0a48df
> Author: Daniel Baluta <daniel.baluta@nxp.com>
> Date:   Tue Feb 20 12:53:10 2018 +0000
>=20
>     ASoC: ak5558: Fix style for SPDX identifier

This bisection is clearly not accurate, I'm guessing the bug is
intermittent and it was just luck that landed it on this commit.

--ryJZkp9/svQ58syV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl9GPi8ACgkQJNaLcl1U
h9DyfAf8C2paLbOwHHdDVOi687LcmeI2dZuyjT7chCNm5YaFacrU8e5nRF/fnG6y
G350XTQP7ygvtDz3oeIoEzMn8bJa7Xzeo03wiNm2JrUiMFRT6/S77JOk5g1d75xv
tVwBelb7UdHY869OzQLeLc7exArpn9SsuSpRXkwqrY3EO4Ki/ZwwQPgOPrtYNdLM
x1gX63pYxXoLCaHV3QHnselGfBIcz551NPsJJFowk4+ztuCDvaCp1pCYQpfaA+mS
RU3Ttf+3q8xnCtvFF/Fz8deIGx9sXK9SMlc/uLC9GwhuP57oJ3G3O+JKLiaD9ONf
rdK9/4syv9inh3Wwk3n22yqnKN96hw==
=g5nP
-----END PGP SIGNATURE-----

--ryJZkp9/svQ58syV--
