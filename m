Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C7FB339232A
	for <lists+alsa-devel@lfdr.de>; Thu, 27 May 2021 01:21:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 60E08170D;
	Thu, 27 May 2021 01:20:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 60E08170D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622071282;
	bh=ciZ5AzQ3UeZYvNdtuH0evLsZQ+TmtURSB14Bq6rutBM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kyaaxULP1RmgHKJu6+wD8ydBMPexKYHlwEnI/r6MloXNPlZIxziu/zM1OCyJJHE0U
	 50NGDFC+hlg0/Y9kg3yckOAYmHTM+uydA43fg+xxeuEdrGngzi+foWmPGUpAY3KvQP
	 fA1v1vqk+9netcPnTRDE1oL3Zq5wSmE7nIKiofW0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C51D9F8026B;
	Thu, 27 May 2021 01:19:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0C649F80264; Thu, 27 May 2021 01:19:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B4139F80212
 for <alsa-devel@alsa-project.org>; Thu, 27 May 2021 01:19:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4139F80212
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="OF6bzLxg"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZqNavKRWEoT6x1NcJ+AMgYD2IfBpXmQ926CizGXKJ0A=; b=OF6bzLxgXsJEHAc66hEAsXuzk/
 oZqNQRbDfTKzWpykUZHnh+kLh/hexx1miCZ1e4aZyOMYnB605vpGzZQTYRp4GUicBIVioDVYuzC6T
 H5OpPbQtHDxGXIAI8UsCk68QhAxPWP0Oryjxq8/CRB2CNvNWbtTJuXw9Ovhn6vl87C4w=;
Received: from 94.196.90.140.threembb.co.uk ([94.196.90.140]
 helo=fitzroy.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <broonie@sirena.org.uk>)
 id 1lm2oW-006AWs-9Q; Wed, 26 May 2021 23:19:48 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 885A3D0E9DC; Thu, 27 May 2021 00:19:46 +0100 (BST)
Date: Thu, 27 May 2021 00:19:46 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v2 2/7] ASoC: soc-core: add snd_soc_runtime_get_dai_fmt()
Message-ID: <YK7Xkp6eEGIFmdeK@sirena.org.uk>
References: <871racbx0w.wl-kuninori.morimoto.gx@renesas.com>
 <87y2ckaifm.wl-kuninori.morimoto.gx@renesas.com>
 <YK2GOSIgiz2EmpUe@sirena.org.uk>
 <87tumqmcut.wl-kuninori.morimoto.gx@renesas.com>
 <87mtshm7hv.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="2HjWWqATZji6/yFb"
Content-Disposition: inline
In-Reply-To: <87mtshm7hv.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: A penny saved has not been spent.
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


--2HjWWqATZji6/yFb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 27, 2021 at 07:54:04AM +0900, Kuninori Morimoto wrote:

> > >   1. Try to match both DAI's 1st choice, if match use that.
> > >   2. Pick one DAI A, try it's 2nd choice with the other DAI B's 1st
> > >      choice.
> > >   3. Swap and try 1st choice of A and 2nd choice of B.
> > >   4. Try 2nd choices of both DAIs.

> About this, Because we might use Multi-CPU/Codec,
> step 3 is difficult.
> Except it I can implement.

Yeah, I think it's probably too hard to implement the whole thing
and may be safer to simply go with what you've implemented
already (with the documentation changes) as a first step.  Like I
said I'm a little worried about what happens if we change the
algorithm later.

--2HjWWqATZji6/yFb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmCu15EACgkQJNaLcl1U
h9Cf6Af9FMcHVVbSmVMin9ldd/bWObOcK8G1trapcD1qH//kX99QD4MmaNjWl0S+
JwFiLKrxiJYiSebhwYlv6f7A6/+BYhPTzi9qvL3HvoYwlOKFC30Sapokae/PYrNS
kDyS6w2xmaMnE4P/cvWrDLCtAapyWSkCi6DLjZKJ1vx35i50Yq8QL1bNoMfN7h+7
WjPWzGV+On2uq00A/Id3149mOvBFHFQV6+GOCCO1E7/I8k8nxiRJQXCsPfgkD1VT
myVaxIsFtzdJGbysEsypW7ejuXsPeytJwXkIrWUFrhhPk/p9PiKaMb5aHLgzM/Vs
qT9NL90aDZUfjPa7w3FVH7tcgll31A==
=ru3V
-----END PGP SIGNATURE-----

--2HjWWqATZji6/yFb--
