Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 472B557858F
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Jul 2022 16:36:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C8735164F;
	Mon, 18 Jul 2022 16:35:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C8735164F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658154988;
	bh=/EskvqncNfuAlLHtEQSMFsRi3mTIEdrZ+Id+muUNZhg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EIcJemxpsPN03TYmWo1zcOJR+terJ3Twn7sBdtj132u3YBfsWZcPinT0zJfJuFGDX
	 H51gM5aNxm6f9Qbxd8/SLt8BcmkUJC21XINv6y8zQytGhP1abH9iBoq3FVQdOrMt9j
	 eOBn5RK+PpPTW08EG0Hep/mdjb+m53W2285ZSFlA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 15380F8050F;
	Mon, 18 Jul 2022 16:35:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 69B3EF80508; Mon, 18 Jul 2022 16:35:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1F3ADF800F5
 for <alsa-devel@alsa-project.org>; Mon, 18 Jul 2022 16:35:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F3ADF800F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="qRsmvWnh"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id ABCE7B8161D;
 Mon, 18 Jul 2022 14:35:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57FA4C341CA;
 Mon, 18 Jul 2022 14:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658154921;
 bh=/EskvqncNfuAlLHtEQSMFsRi3mTIEdrZ+Id+muUNZhg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qRsmvWnhdUNqnTtXbX0z81G4NiR2SiczBVyOs4xO64HN37dMh1IhWzD4G/2DXSzOO
 x+aGWLLQfXE7sSokrksfOKJCmI1ZrsqHl8HS+zsGjZba7Mr+r5p7794ESZV4kJnAdL
 uRELAreXDIdTKbyCS+UThL0rTh3uk+DbuZUXP2boH+lm2ZNbh2RrZQORBcerGACV8k
 hColTf074kEWtSaaGFNQ7l4WeEaHYR5pD73+IYU5H6cNWZ9mhdyf//8kz4sandvbyj
 n8mvGyX4M7rK1YKqRx+BmrHalz/A6LjRifKu02HsyHIlpgoUOQpChVQJCpEi1A7f85
 nl1kyilu/z1bQ==
Date: Mon, 18 Jul 2022 15:35:16 +0100
From: Mark Brown <broonie@kernel.org>
To: Zheyu Ma <zheyuma97@gmail.com>
Subject: Re: [BUG] ASoC: nau8821: Found a bug when removing the module
Message-ID: <YtVvpKe9SX7OAPUF@sirena.org.uk>
References: <CAMhUBjm2KOZZj=M3=yLvLm4QcNYpOTa+2_dPcHr7nHm4GE73DA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="FvMj+3yP1v5LZGNx"
Content-Disposition: inline
In-Reply-To: <CAMhUBjm2KOZZj=M3=yLvLm4QcNYpOTa+2_dPcHr7nHm4GE73DA@mail.gmail.com>
X-Cookie: The greatest remedy for anger is delay.
Cc: alsa-devel@alsa-project.org, steve@sk2.org, lgirdwood@gmail.com,
 wtli@nuvoton.com, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, tiwai@suse.com,
 Vijendar.Mukunda@amd.com
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


--FvMj+3yP1v5LZGNx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 16, 2022 at 05:12:38PM +0800, Zheyu Ma wrote:
> Hello,
>=20
> I found a bug in the driver nau8821.
>=20
> When removing the module, I got a warning:
>=20
> [   64.226442] nau8821 0-0010: remove
> [   64.227621] ------------[ cut here ]------------
> [   64.227918] WARNING: CPU: 5 PID: 243 at kernel/irq/devres.c:144
> devm_free_irq+0x80/0x8c
> [   64.235307] Call trace:
> [   64.235501]  devm_free_irq+0x80/0x8c
> [   64.235746]  nau8821_i2c_remove+0x28/0x3c [snd_soc_nau8821]
> [   64.236982]  i2c_device_remove+0xcc/0xf8

I'm guessing you have no interrupt on this platform, or that jack detect
isn't used since the driver currently only requests the interrupt when
that's enabled (which is a bit dodgy but not the immediate issue).  I've
sent a patch

	https://lore.kernel.org/r/20220718140405.57233-1-broonie@kernel.org

--FvMj+3yP1v5LZGNx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmLVb6MACgkQJNaLcl1U
h9CG+gf/XKoOdFy8AVhZ0NTrBOtMJo96SDkS8JOiKEiT5sh4gXMXC1UkXde32QcZ
gRuPtxSDku10rL7qtMY2mTnZVKEAzmbb4L8lVSFi4FFgs3f/Yag/9ZgSuW3yOmoW
FWtJ4wQCTx+9nJucks0c8kMCj476Bg1CKLjRcxf/vvmW4RNhtVdPhSw8hmb1kwNd
qxzwcI2oDNC4xa4ijGipIWJ9BLqzz/bGrGIp+xqt9oTqH6bilZvUcIRXfkJrzgwu
aj1JiX4R9O7D6hQqAuSVGioLLjvUy9pSZr0QHB5qSepqb+WUapITYh9+YHlkGuAW
zVthcPrcLBT3rEITmqprJCUUsKoCfg==
=VvsL
-----END PGP SIGNATURE-----

--FvMj+3yP1v5LZGNx--
