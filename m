Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7991D8CFAC
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Aug 2019 11:32:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 044BD166F;
	Wed, 14 Aug 2019 11:32:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 044BD166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565775172;
	bh=5/90d7cGUfH7XKPIWKHBUJ14sIobxSbdsiDboaRam8w=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jlcRWVQ40/Kfk64pJy5xixBI+ksOAxp9dL+dXjXpGjb+1PxGFBIXNTA58gYNbFY7a
	 QO2PQvGItoQTs8dg/W8Iu5KmvSU60h6ByePKMfMhG0gEDA1LipDT1mSjApIu3eGHJC
	 gO6p8uzDS4rRn6BjZzWZKZ6pZpYTBd2UWRIi0ytI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 11324F8048D;
	Wed, 14 Aug 2019 11:31:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8322FF80214; Wed, 14 Aug 2019 11:31:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-wm1-f99.google.com (mail-wm1-f99.google.com
 [209.85.128.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 28EE7F8015B
 for <alsa-devel@alsa-project.org>; Wed, 14 Aug 2019 11:31:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28EE7F8015B
Received: by mail-wm1-f99.google.com with SMTP id l2so3832902wmg.0
 for <alsa-devel@alsa-project.org>; Wed, 14 Aug 2019 02:31:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=wMvy8Ab385VnpfhpoCL2ty54WiU3FzsQ1ortdbnfmco=;
 b=pVPYfNi/kLejvdRGUP1Wtnoeq+0ArDIRAHulliSoFtFRok0g/3Y8ePGAiiJfva0hIW
 5TKVuPqtrIVH0ZYIpWeek2N+tL461y8S3r0zEp+otXaFvff/Mohr8UjabptzZcQ18nNk
 V2BEzCS0esE5pfddQbitYgsVZ8dvCGPS0gCv44DY8lO/cLVHyjQ8poOu/HYf75PmtvxN
 0g+hYzMxdiYzb7tZF2ipWPXRtUuyJTK20KLWGzHFGg+e3FHQM0CR1fkWmHfyD+v+aPC+
 MXOAQs7pxKBdswxLZWRhn7qVEXt7pMjM3zh0a1EKkFoMdtkJlQ+wX7/pNmtjhDyj7vRF
 s5Mg==
X-Gm-Message-State: APjAAAVigvNlE95sZJ7A4Bk/Jz5iLs81i7SQyXjcs2bP5tcIgC1jf5Uq
 EHc3AW6xlIGrWemELbHOoGgrn4CjfrJZopZCLGoD/L4Duq7eRm542+U5Lik7zodT/Q==
X-Google-Smtp-Source: APXvYqzfrYnvfYIbwxiiUHzAwojyOsQOmwL/wLmnyo7FHmFQeAvkAbkqtmXlkt7RBYKZuSs/1aQeX+6ryJZY
X-Received: by 2002:a1c:4d05:: with SMTP id o5mr7192816wmh.129.1565775078088; 
 Wed, 14 Aug 2019 02:31:18 -0700 (PDT)
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk.
 [2a01:7e01::f03c:91ff:fed4:a3b6])
 by smtp-relay.gmail.com with ESMTPS id q187sm28085wma.20.2019.08.14.02.31.17
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 14 Aug 2019 02:31:18 -0700 (PDT)
X-Relaying-Domain: sirena.org.uk
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1hxpcj-0004j0-N9; Wed, 14 Aug 2019 09:31:17 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 281932742B4F; Wed, 14 Aug 2019 10:31:17 +0100 (BST)
Date: Wed, 14 Aug 2019 10:31:17 +0100
From: Mark Brown <broonie@kernel.org>
To: codekipper@gmail.com
Message-ID: <20190814093117.GE4640@sirena.co.uk>
References: <20190814060854.26345-1-codekipper@gmail.com>
 <20190814060854.26345-4-codekipper@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20190814060854.26345-4-codekipper@gmail.com>
X-Cookie: Bridge ahead.  Pay troll.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 lgirdwood@gmail.com, be17068@iperbole.bo.it, linux-sunxi@googlegroups.com,
 maxime.ripard@free-electrons.com, wens@csie.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] [PATCH v5 03/15] ASoC: sun4i-i2s: Correct divider
	calculations
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
Content-Type: multipart/mixed; boundary="===============7345429381010035882=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============7345429381010035882==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uCPdOCrL+PnN2Vxy"
Content-Disposition: inline


--uCPdOCrL+PnN2Vxy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 14, 2019 at 08:08:42AM +0200, codekipper@gmail.com wrote:

> +	if (i2s->variant->has_fmt_set_lrck_period)
> +		bclk_div = sun4i_i2s_get_bclk_div(i2s, clk_rate / rate,
> +						  word_size,
> +						  sun8i_i2s_clk_div,
> +						  ARRAY_SIZE(sun8i_i2s_clk_div));
> +	else
> +		bclk_div = sun4i_i2s_get_bclk_div(i2s, oversample_rate,
> +						  word_size,
> +						  sun4i_i2s_bclk_div,
> +						  ARRAY_SIZE(sun4i_i2s_bclk_div));

Are we sure there'll never be any new variants which would make a switch
statement for the variant work better?

--uCPdOCrL+PnN2Vxy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1T1OQACgkQJNaLcl1U
h9BePQf8ClHCMDk1/0p2riVMF+Ce3UctBx33fUNPHKz6fXoWHx15dRPn8E0YssEp
QxGtyceUz/+pupjQSBf9ys8YmRmQNnJDMCWoPKcEYsTMQUC20p4lu2RJ2Hs6ZwZp
GK78akZH7ZTALargNyecrfgGpMRhP8sZUxpCSWeviFQZp4W4SbafvXy1jv4jGz9q
i4LfJo4I5I1K7oGjfmW6QWU01EZkYWDFPV/2ulZNPN9qnQk6SLBzE/WLJJQ5pg6z
xSipsQlxBbboOT+6v/mfMovpO2qBSUTL3wzSRNJzANTc4BnZ+32IK1MpssbQ3EBC
o4F3ZOw6kp4o8QdLfGAfvJ9lfbYyNg==
=/pEP
-----END PGP SIGNATURE-----

--uCPdOCrL+PnN2Vxy--

--===============7345429381010035882==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============7345429381010035882==--
