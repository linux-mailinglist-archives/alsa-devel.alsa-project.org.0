Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D7639A2641
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Aug 2019 20:42:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5A320165F;
	Thu, 29 Aug 2019 20:41:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5A320165F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567104143;
	bh=GELgMEZWIhgyaA8jcwKxiP81R8mBdUt0/ZbvONHjsxQ=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gvrIw0JNhb0wgiVKKcNXUVowi1Ohc3s6JDXQzRrOCqAqgzl33wQD+zkJNVT2Vj5Vd
	 wWI+Qh3ggPSng2/ZVAJ3ImqZF2XiZ67NTdfXVRFIE1TYKGVjQnwRg4ODjdsjIhUS8u
	 wWyBajQ/0SmXO6aA/B7r1c7ThukmXpdcF1GdtGYg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A038AF80096;
	Thu, 29 Aug 2019 20:40:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CB7B6F80148; Thu, 29 Aug 2019 20:40:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C9EFCF80096
 for <alsa-devel@alsa-project.org>; Thu, 29 Aug 2019 20:40:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C9EFCF80096
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="JQDdFLiH"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eOmhqy9BafmWstDTYVha+Yie5DS/+5Tnyj+jCMOlKXs=; b=JQDdFLiHfFQD2qdaD/1M16MpK
 +J7gM5DQc1+87mEoNoKq3dFww/o37wBC/dMLV4UZBhKqsx1yEBcaCDlzO/sQEhNijKonLfJLENUUp
 Rmhxn9rhMSpCcv2hE/DNPJrZU8bLA9XHf0sCUaa5sd3BLTL36ePIQDbQ2bVrWc5OlfNCY=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1i3PLS-0002na-6w; Thu, 29 Aug 2019 18:40:30 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id EDF3E27428D1; Thu, 29 Aug 2019 19:40:28 +0100 (BST)
Date: Thu, 29 Aug 2019 19:40:28 +0100
From: Mark Brown <broonie@kernel.org>
To: Curtis Malainey <cujomalainey@google.com>
Message-ID: <20190829184028.GI4118@sirena.co.uk>
References: <20190827202825.GP23391@sirena.co.uk>
 <CAOReqxjCTZosbvv8Q-t5zGdreKnk8nWH2Yq-9soLbOk8FOcsgw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAOReqxjCTZosbvv8Q-t5zGdreKnk8nWH2Yq-9soLbOk8FOcsgw@mail.gmail.com>
X-Cookie: Lensmen eat Jedi for breakfast.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Takashi Iwai <tiwai@suse.de>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 ALSA development <alsa-devel@alsa-project.org>
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
Content-Type: multipart/mixed; boundary="===============7987020503983961197=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============7987020503983961197==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HkMjoL2LAeBLhbFV"
Content-Disposition: inline


--HkMjoL2LAeBLhbFV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 29, 2019 at 10:54:29AM -0700, Curtis Malainey wrote:

> > As with previous years let's pull together an agenda through a mailing
> > list discussion - if people could reply to this mail with any topics
> > they'd like to discuss we can take it from there.  Of course if we can
> > sort things out more quickly via the mailing list that's even better!

> I may be miss reading this but I'm reading that as 'the mailing list'
> or ' the mailing list'. Is there an alternative such as a google doc?

It's the same wording I've cut'n'pasted for several years now!  The
alternatives are that we either put things on the agenda via the mailing
list or work out what to do before the meeting in which case it doesn't
need to go on the agenda.

> I am interested in discussing the possibility of upstreaming some of
> the features we have built into our UCMs locally. With the growing
> number of UCMs being maintained by ALSA upstream we think it would be
> beneficial to get those features upstreamed if the community agrees.

This definitely sounds like a good topic, especially for DSP parameters.
I know there's a few other things out there but as you say nothing
upstream yet.

--HkMjoL2LAeBLhbFV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1oHBwACgkQJNaLcl1U
h9D9TAf/f4+9pmOsZLggsUZti1X07DYzu7Av9K/NzxZn8DXeHD/K2xffhsuu1+2R
2A9R/Hg35jmvriNaw0XxEeKn6b4h67SjRbbgah/VL4UgAMwMjFe8QjjDely48GXa
88ATItKYW8BDfwGsgRGZw5oncl76OPIVE6CK/r94rRnCU5Rm9ObmhTN3Zn1Bylcl
q4KDoAx9YdjawnFhN+86ANHOKSxb0maThsHWnRTw1oOFlI0CQhMpmxKwrwiA9Y/t
w9PqkOMArqtEl/NlqT4dN0gVM+D7V7Z8zhedvlN9XADf024uw/q++eDvi02UIXRj
qC7zoH7hILsLjziD+TTPLkjK2fbl6g==
=mAxc
-----END PGP SIGNATURE-----

--HkMjoL2LAeBLhbFV--

--===============7987020503983961197==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============7987020503983961197==--
