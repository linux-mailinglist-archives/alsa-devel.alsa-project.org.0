Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AEBA9A1E0D
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Aug 2019 16:55:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 47E4D16D1;
	Thu, 29 Aug 2019 16:55:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 47E4D16D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567090556;
	bh=r2Q5ieZuqi2TFgFgfju92w2lQvRaKxZnQPs8rG4kqPg=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FWeq9vpb5QD/S2dI9VtzbaRZSlBRBj8k2vIKbBYvylLJt9TILiQtiTBS1MEFlJqr9
	 8dHnauqXzj3DRDWw8yUmo4Fc2KCNWGHo/mv2AM8IV2384uFPD8cVRsd6IUzBs0HkvL
	 tlARDKXMfdS4VtSS2S7n7pTwrF/IknDYq/EYhU+4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DDD85F89851;
	Thu, 29 Aug 2019 11:58:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6AE30F8984F; Thu, 29 Aug 2019 11:58:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7AF99F89622
 for <alsa-devel@alsa-project.org>; Thu, 29 Aug 2019 11:58:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7AF99F89622
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="V3SRpgBk"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BAD8WYmCeaaxJNvF8Hz3ukwym3LA9snWGehbGtKQV70=; b=V3SRpgBksZ0d9lR29YTBJJQ41
 StJL0UrhgCCIhNvrVd6pCdezYGTP3XWc++N12u3oas2VKS9Jp9gQIWIIAypLYE3YAMdlk4eQouwsc
 /hlBdgApRUqFrRgdWsPSiI2LPeyaQQP9tKAkHcl7ku2i0WNvZh7Hb/RUXYfa1UfoxbvzU=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1i3HBt-0000q1-LN; Thu, 29 Aug 2019 09:58:05 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 477C12742CDC; Thu, 29 Aug 2019 10:58:04 +0100 (BST)
Date: Thu, 29 Aug 2019 10:58:04 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Message-ID: <20190829095804.GA4118@sirena.co.uk>
References: <87pnlhahr6.wl-kuninori.morimoto.gx@renesas.com>
 <87y305932s.wl-kuninori.morimoto.gx@renesas.com>
 <f3ead090-8c2c-6be5-70b8-c6530239302a@intel.com>
 <20190808111417.7033df42@xxx>
 <87blwk1n9m.wl-kuninori.morimoto.gx@renesas.com>
 <20190828120651.GG4298@sirena.co.uk>
 <87a7bsomnz.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
In-Reply-To: <87a7bsomnz.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: Lensmen eat Jedi for breakfast.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH v2 19/25] ASoC: soc-core: don't call
 snd_soc_component_set_jack()
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
Content-Type: multipart/mixed; boundary="===============5014095392141553262=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============5014095392141553262==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7AUc2qLy4jB3hD7Z"
Content-Disposition: inline


--7AUc2qLy4jB3hD7Z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 29, 2019 at 09:16:08AM +0900, Kuninori Morimoto wrote:

> I agree we want to have robustness.
> To make clear that it is for robustness,
> I think it is better to have such message/comment on code :)

Sure, that sounds sensible.

--7AUc2qLy4jB3hD7Z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1noakACgkQJNaLcl1U
h9BIWwf/WjH9i7rPH0bMcGm+DhPdFmrz6YEaDf8eZpj3l6AXhtTeLzIVtLrVcOlu
wcyznjfNbRcCVJbeUXifc92SvR7trjsJUxMBTkZTEs5d0cRlamxbB07G/isAjRaG
aohZLqTj4aVtuxArWxltHFMfskQYSO36/y7K1+EZRV42NFepKx56uCHmrqCHLWye
lQOmkYlweDhiM2+5Zf8/B84INSQNacG0C0bd2cfhnnPBHpDUr9/afmJEmXS3Y+x+
tsXcL5aUHpDyW6XgD0XAtMwFaa/xYIAydBrD0FEWtXSdtjUBmnPtlgYraf4DuDny
owq64z0/m3kHC75VFD9NGO4orcAhRA==
=u2YX
-----END PGP SIGNATURE-----

--7AUc2qLy4jB3hD7Z--

--===============5014095392141553262==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============5014095392141553262==--
