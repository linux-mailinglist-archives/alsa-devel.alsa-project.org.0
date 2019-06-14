Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D55C461EB
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Jun 2019 17:01:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E5BEC1876;
	Fri, 14 Jun 2019 17:00:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E5BEC1876
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560524486;
	bh=9rQTnf1cr4pYEr/t4EZnecqWBC6kFlGpmxUvTfyxVGE=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EQEM383NtddaflzlnOMKof5F8+BoijsaOWRvI4ldwCBghlHp9yYmRg1KytYJkrGob
	 wrnjuttHvi79i0iNtx0qRQT54xI0Gi1VPD6y9Q4dSpHin6befFT4g7n8N54fChNRp6
	 4BWl/vncaeVTjS+7nYVpf0Ca8en8+v/ZiaWDVAr0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 332D7F8076F;
	Fri, 14 Jun 2019 16:59:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5A59BF896E0; Fri, 14 Jun 2019 16:59:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 46817F8076F
 for <alsa-devel@alsa-project.org>; Fri, 14 Jun 2019 16:59:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 46817F8076F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="p8HXGeEV"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XdrG6AwWe5+osoXCCB/9Em5BYQX9l2XUTl+D9QcX5Ww=; b=p8HXGeEVDbcUHgTBuz3XA0DfT
 IO27glw1H07YRRcIMKKyVEvigBqzjo8MPWVa7N2M0TAaZQ6krt7tJcOO/HhcIW/51UHBNss755a0P
 53/GH7gqbpIrA+uSjAVCiEeygf0eYg2j5QBup0aR7mb1oMrraA70inU1/hA9fTDxvAPJ4=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hbnfy-00085p-IH; Fri, 14 Jun 2019 14:59:34 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 1820F440046; Fri, 14 Jun 2019 15:59:34 +0100 (BST)
Date: Fri, 14 Jun 2019 15:59:33 +0100
From: Mark Brown <broonie@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-ID: <20190614145933.GB5316@sirena.org.uk>
References: <20190614094756.2965-1-gregkh@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <20190614094756.2965-1-gregkh@linuxfoundation.org>
X-Cookie: Editing is a rewording activity.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH 1/5] sound: SoC: sof: no need to check
 return value of debugfs_create functions
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
Content-Type: multipart/mixed; boundary="===============0103161275146942713=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============0103161275146942713==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IFrzt5yFNjsAZ17G"
Content-Disposition: inline


--IFrzt5yFNjsAZ17G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 14, 2019 at 11:47:52AM +0200, Greg Kroah-Hartman wrote:
> When calling debugfs functions, there is no need to ever check the
> return value.  The function can work or not, but the code logic should
> never do something different based on this.

Please use subject lines matching the style for the subsystem.  This
makes it easier for people to identify relevant patches.

--IFrzt5yFNjsAZ17G
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl0DtlUACgkQJNaLcl1U
h9Dfzwf/b2V71DkyppdHr3vePJaj/boJ8W7t8v3VO/pkwgHYoOwMgQ5hrHmkS9X8
HYmkPBozwOOaZK1ZP4YUOrkcxOEvKjvMz6uutr17CBfEKknn5YkJcs3b4NT4T8U+
yBg2FC+G9JN/JAGVuf7HZl4yteTbB0YwtcN0BNpELp9hri9919rcYrocxuQcLlvu
icUKq2oHeCgiFGtyxKFCHHr9xtT4maRLCZTh38zMfZqhPyW9BZrxpLH26CXZVZEj
CSZCLLKKa8R8opvK3wX3ewUlpv5oICzJEIcmuKlXsyIOuFi4e5RXepQSvWls487b
FCrLRy/RNyJ/QE9eJJY0fijLexyyQA==
=Qu0z
-----END PGP SIGNATURE-----

--IFrzt5yFNjsAZ17G--

--===============0103161275146942713==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============0103161275146942713==--
