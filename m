Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2870F1B70F9
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Apr 2020 11:32:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A02F916C3;
	Fri, 24 Apr 2020 11:31:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A02F916C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587720769;
	bh=ClZZ+zNkpZtjl/C5ITekfMDtYhjvWj1JuDvsxQceVy8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=P8Z9TDMtWrvax8iiSXJey/CHHRWEJFZpIgPvBeMqXRhlljuqqnhPnHj7sJe88yHE5
	 gJxSrm5PPz6rTZNny5VLGbwoeRNyBBpwpnofrn1cuHkhzZFgiQ70TOSp/j97zC6hlX
	 EySq/wbX8AT58IGrMt6go67KHUNpjr5IRIy1EdtE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D2FCDF801D9;
	Fri, 24 Apr 2020 11:31:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 182E8F8021C; Fri, 24 Apr 2020 11:30:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B8765F801D9
 for <alsa-devel@alsa-project.org>; Fri, 24 Apr 2020 11:30:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8765F801D9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="nuioZ6cr"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D7CB420736;
 Fri, 24 Apr 2020 09:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587720654;
 bh=ClZZ+zNkpZtjl/C5ITekfMDtYhjvWj1JuDvsxQceVy8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nuioZ6crqRqT6ywAgGFJTNzf14utCcTkooewPUyM2jbEvgCeVwaoHTt2kqGLc55Dk
 HJdHGeWZJXe+SBkjS92Ji+6zGvpNeY3aVyCItYT9JfWiNiq8qnPyg5cTPV2PxRBv+j
 rgtIjRsKC3RqF3FppSYVnvN+FEsaHzWo4xX24mQY=
Date: Fri, 24 Apr 2020 10:30:51 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 02/17] ASoC: soc-dai: don't overwide dai->driver->ops
Message-ID: <20200424093051.GA5850@sirena.org.uk>
References: <871rofunaq.wl-kuninori.morimoto.gx@renesas.com>
 <87y2qnt8oy.wl-kuninori.morimoto.gx@renesas.com>
 <20200423150933.GO4808@sirena.org.uk>
 <874kt9u8qq.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="YZ5djTAD1cGYuMQK"
Content-Disposition: inline
In-Reply-To: <874kt9u8qq.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: Information is the inverse of entropy.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
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


--YZ5djTAD1cGYuMQK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 24, 2020 at 07:39:58AM +0900, Kuninori Morimoto wrote:
> > > From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

> > > Current ASoC overwides dai->driver->ops if it was NULL.
> > > But, it is not good idea, because dai->driver might be reused
> > > when modprobe/rmmod or bind/unbind, etc.

> > This is fine but it's not a correctness issue since we're always filling
> > the same value in - the big issue with putting stuff in structures is
> > when you end up using the same struct for two different different things
> > so you fill different values in.

> I see.
> But all my remaining patches are based on this patch,
> and rebase without it seems very difficult.

> So, I want to keep it.
> v2 patchset still has it, but adds different git-log.

Right, like I say the change is fine - it was just a note about the
changelog.

--YZ5djTAD1cGYuMQK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6isccACgkQJNaLcl1U
h9Dspwf/V3LiqfaOGUfPzZWjuPUX43pGOfY/pR8SDStU9hU0UEbXfLpn6htXr2KQ
9DfGw9cbRlXX/2Qsjme/9BDJ0ExC/sOOLF3MLkP3zGw9rb9mzG5alXl/AMwDWOLc
AAbXoh8vC1ZEgGa/yIW3LTeE1FfUAaamt6OF9Lto3WXaiDPVLM9PYNWocdsMkN/4
5D9xO09eVswe+vt+Fr1Hw8RgIpzP2pLoEeWBbVKrmZ3zZOmMPCXJgr4cUUafW9hx
7hAxSv2Km9qNMre5QiTjstZ8SfTK6AV1oem8qITCLgDVISWpxm4bsgaPV8klgCpA
00hik+YNLRWt5kvQQ0so0SZzHdh29g==
=UJHo
-----END PGP SIGNATURE-----

--YZ5djTAD1cGYuMQK--
