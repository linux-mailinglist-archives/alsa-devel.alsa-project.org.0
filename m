Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8461F3772D
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Jun 2019 16:53:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E6FD51612;
	Thu,  6 Jun 2019 16:52:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E6FD51612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559832793;
	bh=VmmB1zMNtP4/FkOIvga42gsl4M+HXyh6o9qNdhf+U40=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vA7fX4CSOlUis83hmTsYaP48yUlyUQj/6jRk9enwBhtuonFJy4n97krhKabnUoHu8
	 ObCBZ1do7oPHnBC0tmOqXlh4pH+NG9Su7tmvvucbCFrmT3uPLMH0OHeqTLnWobrMKP
	 iXpEuA4B9EipIeEsNZb/Op0HGVxErZKuTYUAAC7Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 68BCAF896FE;
	Thu,  6 Jun 2019 16:51:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 38F3EF896F7; Thu,  6 Jun 2019 16:51:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 091D0F80768
 for <alsa-devel@alsa-project.org>; Thu,  6 Jun 2019 16:51:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 091D0F80768
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="L6U2uJC0"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Y0xQd2+PXKcb+7GAAargjEL/OeoPk73o+kb8iEIucYE=; b=L6U2uJC013+pWjd/JSDqV6dBq
 yzEEAuuLwSKFHpg9uzd9q8DMiWrKqukqI6BGoOpdn/mjCg5OjT05Bhgo08NDrVgvGNkfR8tKMDyPe
 CgjbxTZSw+RghWqKzzg13A5oRjtfbGx2lKSX3GAvvPao1pdgxejiveYKJe6XaFabDN39I=;
Received: from [2001:470:1f1d:6b5:7e7a:91ff:fede:4a45]
 (helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hYtje-0005ud-B7; Thu, 06 Jun 2019 14:51:22 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id D7F7D440046; Thu,  6 Jun 2019 15:51:15 +0100 (BST)
Date: Thu, 6 Jun 2019 15:51:15 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20190606145115.GC2456@sirena.org.uk>
References: <87h893mkvi.wl-kuninori.morimoto.gx@renesas.com>
 <20190606105632.GY2456@sirena.org.uk>
 <3b43fab0-b476-4623-1bdc-9d750eaae83d@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <3b43fab0-b476-4623-1bdc-9d750eaae83d@linux.intel.com>
X-Cookie: The other line moves faster.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [alsa-devel] [PATCH v2 000/146] ASoC: modern dai_link style
 support
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
Content-Type: multipart/mixed; boundary="===============6590388293274977540=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============6590388293274977540==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tmTZLG6vUqJL4TmU"
Content-Disposition: inline


--tmTZLG6vUqJL4TmU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 06, 2019 at 09:08:56AM -0500, Pierre-Louis Bossart wrote:
> On 6/6/19 5:56 AM, Mark Brown wrote:

> > Are you sure those should be signoffs and not acks or reviewed-bys?

> I did provide 10 corrections with a Signed-off tag directly to Morimoto-san,
> but I am fine with a change to Reviewed-by if it's deemed more appropriate.

Ah, it's the squashed commits - that makes sense!  No problem then.

--tmTZLG6vUqJL4TmU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlz5KGAACgkQJNaLcl1U
h9Cy6gf/V7a41eNNZxgJXvu9Kp17qBM1gR4l6Hd+H59iW2s2AjEG5MxwA8wtpENR
CMFSaJsp0B99boFM8cDptUrOU2l8HYUnCsJHAsUjxv1pXoBZDnKaJzbp/LnJQC0+
wKAAzGLnPf/TkU5o2aPk+x9tYKxe60tLVt4v5T5bCw7ziA1CSItvEhg/HgZJm7wI
Vl9PfugdfcwP8jtw1M6v3PUke5tSBOb2VTHepCbJBNlQVhr0kVswfV3CoLvojAY5
XIbv1hoeSKRr259Uy0seWiPdeLfuL+uJpCcQ6fR/rTK3G/7H+iUH6Hcl4yRwikxP
ZlgaPJnIcPfgztlMT7aFMRLMGUb4Nw==
=Xfg9
-----END PGP SIGNATURE-----

--tmTZLG6vUqJL4TmU--

--===============6590388293274977540==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============6590388293274977540==--
