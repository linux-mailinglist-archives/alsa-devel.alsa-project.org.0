Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E123215CCEA
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Feb 2020 22:05:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7D93B16A1;
	Thu, 13 Feb 2020 22:04:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7D93B16A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581627938;
	bh=hvwU5++S0SQgUqutWcoo57MnXsCoaVY6lSEa0yxarhY=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=o+7NbOkZcPdzKQKQRMfaklbRrYdjXf9gCbGjddpPYd08gbZlQjbiOhzLt60U5MfX7
	 IiGJ466ULB0pT8GIg4OgKcy2t2HbUv+AMUEy4j/5QyQM9Tt2vK0Tne7G0kNiChd13H
	 v9R4Fgxa5bLMrzommH/LwVEGfk2OwHVqcpshnIEk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A2C22F80146;
	Thu, 13 Feb 2020 22:04:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6ABB4F80139; Thu, 13 Feb 2020 22:04:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 9BA61F80139
 for <alsa-devel@alsa-project.org>; Thu, 13 Feb 2020 22:04:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9BA61F80139
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8BFC01FB;
 Thu, 13 Feb 2020 13:04:06 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0DD233F6CF;
 Thu, 13 Feb 2020 13:04:05 -0800 (PST)
Date: Thu, 13 Feb 2020 21:04:04 +0000
From: Mark Brown <broonie@kernel.org>
To: Jack Yu <jack.yu@realtek.com>
Message-ID: <20200213210404.GM4333@sirena.org.uk>
References: <2fe07b2c200f43bc81de61f4e6c780ac@realtek.com>
MIME-Version: 1.0
In-Reply-To: <2fe07b2c200f43bc81de61f4e6c780ac@realtek.com>
X-Cookie: Academicians care, that's who.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Oder Chiou <oder_chiou@realtek.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lars@metafoo.de" <lars@metafoo.de>,
 =?utf-8?B?a2VudF9jaGVuQHJlYWx0ZWsuY29tIFvpmbPlu7rlro9d?=
 <kent_chen@realtek.com>, =?utf-8?B?6Zmz5pi25b+X?= <kenny_chen@realtek.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 Derek =?utf-8?B?W+aWueW+t+e+qV0=?= <derek.fang@realtek.com>,
 Shuming =?utf-8?B?W+iMg+abuOmKmF0=?= <shumingf@realtek.com>,
 Mingjane Hsieh <mingjane_hsieh@realtek.com>,
 "Flove\(HsinFu\)" <flove@realtek.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: rt1015: fix typo for bypass boost
	control
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
Content-Type: multipart/mixed; boundary="===============3554242645956130123=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============3554242645956130123==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bPrm2PuLP7ysUh6c"
Content-Disposition: inline


--bPrm2PuLP7ysUh6c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 12, 2020 at 01:59:49AM +0000, Jack Yu wrote:
> Fix typo for "Bypass Boost" control.

This doesn't apply against current code, please check and resend.  Also
this is more of a cut'n'paste error than a typo.

--bPrm2PuLP7ysUh6c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5FucMACgkQJNaLcl1U
h9AKRQf/TAWL+07NV308bM/JY2nuRiFzrHsqwGRvoN7EVB+Bz4oEU17ZhJjXQBJm
lYur8/o/am4Fyi6MnIy4PnFkXp3CTy2auHlOgRQO3+XInP6K16hu3Ky0n9FU0Zxn
MRjEx/NQgK+4gPo89lC4xvEG3u9t56p46mZkUolWj9Icf6v4PINwajZk1qAo0SZK
IvksVkn9HgrO0chELyrbkwW3zmGO/u+p0dwGOqixLMLdrB2RWQgWBgTt8oKLxTOt
3OP2iviz5kBpJO4Wg6cmLZ/QFXl9fai21Jyxg++OczxmOLaQ8hMeYcz18rHIfZkM
V9eQImH4DDqvn91MkCF1IfXmQAD24Q==
=iqpu
-----END PGP SIGNATURE-----

--bPrm2PuLP7ysUh6c--

--===============3554242645956130123==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============3554242645956130123==--
