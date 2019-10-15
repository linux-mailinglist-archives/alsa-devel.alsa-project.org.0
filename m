Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D21D80CD
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Oct 2019 22:13:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4C735857;
	Tue, 15 Oct 2019 22:13:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4C735857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571170431;
	bh=oCoSZnfuVUMOmQf81vpNfMuJqq8rwA0Je+yzlrm0NKs=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ALWef37jM8AgTHPhIBk+vGSpetl+x1Q6ViGKsy1+Qf32ltlw4r/dHp80B46QvhbAI
	 pQAWHdImONv1LfFu2b4cJpAwrvEV5J/QyZUOKCerIdJwMKzLSXkjMdM/5uRnBZXBMG
	 Gj4jFLsRCQ3uuA7/+ocyUo1Q2v9pqvRrUxcuD+4Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 34182F805AA;
	Tue, 15 Oct 2019 22:11:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F3F03F805AE; Tue, 15 Oct 2019 22:11:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 69650F80323
 for <alsa-devel@alsa-project.org>; Tue, 15 Oct 2019 22:11:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 69650F80323
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="mJA4lBG8"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9RNVhSacKl7aMzBfUB2f/ZzxMChkZuQHUjV7ALb3C20=; b=mJA4lBG8L6aR1WKDGiil5MLYe
 XNWhsGoCc3FQFP/hgrbfXAeKeRd89BPzJmSHhAowleWFMt1Sv2+zSu3w1Y6rQxgzTpiU8EUfkykXw
 kly49L5RAvoCMV9eZFiQkYrIt4ToX7szwBt/heUTEp9ve5xDM3IBddEubD//baLXseAvQ=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iKTAV-0003On-7B; Tue, 15 Oct 2019 20:11:43 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 678252741CD7; Tue, 15 Oct 2019 21:11:42 +0100 (BST)
Date: Tue, 15 Oct 2019 21:11:42 +0100
From: Mark Brown <broonie@kernel.org>
To: Curtis Malainey <cujomalainey@google.com>
Message-ID: <20191015201142.GF4030@sirena.co.uk>
References: <20191009181356.GO2036@sirena.org.uk>
 <3811afd6d83c491077dd30089bcf836f56f146c3.camel@linux.intel.com>
 <CAOReqxgt6VM_ZVUJLQk=DSKdNgCxSB40sM0bxyQ6xkMLPGJPSQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAOReqxgt6VM_ZVUJLQk=DSKdNgCxSB40sM0bxyQ6xkMLPGJPSQ@mail.gmail.com>
X-Cookie: Yes, but which self do you want to be?
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Takashi Iwai <tiwai@suse.de>, ALSA development <alsa-devel@alsa-project.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [alsa-devel] [ANNOUNCE] 2019 Linux Audio miniconference
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
Content-Type: multipart/mixed; boundary="===============2527383783686229658=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============2527383783686229658==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ni93GHxFvA+th69W"
Content-Disposition: inline


--ni93GHxFvA+th69W
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 14, 2019 at 01:16:40PM -0700, Curtis Malainey wrote:

> Are we going to get a whatsApp chat going beforehand again like last year?

Seems sensible, will ping off-list nearer the time.

--ni93GHxFvA+th69W
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2mJ/0ACgkQJNaLcl1U
h9CP0wf7BXvg70djdBolgBO/MrMO4NSnOXz5Zhindbi6KeTjeB/yvLbAEJ+DoYRS
R8T5taKd0XG9o0O4uKLwym3UTjIz3Mu42XoXKSqn+Rc1QrRGvKpvXwaPzjXynq2/
D6d/YX9YYwl2Xf76O3n6aEVn5bf8rKWddFF/FWOEvWH+tMcJtlpNqCiE1pHA7o6a
5UXbaLy8FWE69E6MVZ69uByLX2jwI1t8pJy4j1vw+WRFlfyqTkDqt3+jx3VH+OkA
R763HmkZXs/6BytTV9CUUexyZnt1sCleYrd1Wg2YT7oMj0Y+HLHjn7Lv/xJ9aPeX
LXUZhMVcEyAXSSbIoBRzUYBUu8jzsA==
=QZJu
-----END PGP SIGNATURE-----

--ni93GHxFvA+th69W--

--===============2527383783686229658==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============2527383783686229658==--
