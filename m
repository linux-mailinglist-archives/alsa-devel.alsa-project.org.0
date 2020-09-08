Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E58B2612CB
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Sep 2020 16:36:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2620E17A5;
	Tue,  8 Sep 2020 16:36:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2620E17A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599575814;
	bh=LLqzfbaXuLpi8XQRlqE8+Mwx6Q6ozmVyZhaeLmBIWDc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=P4IpfQBy19VRR+hwTGEoasMVeG2H8SwCGzBi29veCYHy+IYJF7xEtuABCNTGsNPAD
	 MSFPaw3vtf9n6JBGEYDCq1ZtJowpsdeVV/f9TqQJ7ZK7KrD/P3U99xtV3pL5Vf4O/C
	 Vo6MRDiG2Z4bzxz7CNAi5TxXC9V+A66FfFQxQ79M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F9AFF80277;
	Tue,  8 Sep 2020 16:36:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B1F0BF80264; Tue,  8 Sep 2020 16:36:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E6753F8015F
 for <alsa-devel@alsa-project.org>; Tue,  8 Sep 2020 16:35:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E6753F8015F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="nzOOKrbB"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3422B2087D;
 Tue,  8 Sep 2020 14:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599575748;
 bh=LLqzfbaXuLpi8XQRlqE8+Mwx6Q6ozmVyZhaeLmBIWDc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nzOOKrbBnSjItUp40TKjpb0Jbm8doYcFKJQttSAbqP04XeGPCk9PuqU2utSf9RvzT
 rV0pEYJvmZUW06EXdB4vNt6lvXhat5QuIa6gpPmitiUSCGMXFYFyIfAhluI6T3yaH/
 XuYlhSms6THVdPpXVspQMWWN46Pvvyw0SLMqgBI4=
Date: Tue, 8 Sep 2020 15:35:04 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [RFC PATCH 1/3] topology: use inclusive language for bclk
Message-ID: <20200908143504.GD5551@sirena.org.uk>
References: <20200903201024.1109914-1-pierre-louis.bossart@linux.intel.com>
 <20200903201024.1109914-2-pierre-louis.bossart@linux.intel.com>
 <s5hd03152mr.wl-tiwai@suse.de>
 <deaae562-80f2-a934-d551-ac5d9a047bbf@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="7DO5AaGCk89r4vaK"
Content-Disposition: inline
In-Reply-To: <deaae562-80f2-a934-d551-ac5d9a047bbf@linux.intel.com>
X-Cookie: Vini, vidi, Linux!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
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


--7DO5AaGCk89r4vaK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 08, 2020 at 08:39:13AM -0500, Pierre-Louis Bossart wrote:

> > > -	__u8 bclk_master;	/* SND_SOC_TPLG_BCLK_ value */
> > > +	__u8 bclk_provider;	/* SND_SOC_TPLG_BCLK_ value */

> > Is it 100% compatible?  Note that the uapi/* header is a copy from the
> > kernel header, and it means that we'll change the same for the kernel,
> > too.

> It's absolutely 100% compatible by design.
> I was planning to update the kernel uapi header to align changes, but the
> volume of code is much lower on the alsa-lib side. Will resubmit with the
> preferred provider/consumer wording.

It's binary compatible but it'd break the build for any existing code
using the UAPI headers.

--7DO5AaGCk89r4vaK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl9XlpcACgkQJNaLcl1U
h9BQ6Qf+Mp5e0bKxd7OCMFb9GZHH3BG9BZMppoXmPpA1O8HuoVyfaChoTRn227/2
KWKGh/hGt2ZrDHboCUqNdSSNJzRO13jLBXIqWP2En64ijSVNXVTNn+kKDp6SqhYy
wILu+n24bUcSPplBe5HwDMCzIHYDT+NJurf9T2C9p9y7aGyXed1/YnUw1EWbnXuX
FLRXROq6TMns0JioFK+ZSKxLfcVJuFxl+jUtTZjfwiiqQv/2Ec3V4qVlFAboV4nq
JKf50cCJypWNt0lkp2fVDWhYUeeqOsY6JVe+i9AnowR2TNVye4J1UEFy6pv68RUE
4vr03LppZFxMAjpZruYcAh99K3HlwA==
=Ufqn
-----END PGP SIGNATURE-----

--7DO5AaGCk89r4vaK--
