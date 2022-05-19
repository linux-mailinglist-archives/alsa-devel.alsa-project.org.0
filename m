Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6295852DC0B
	for <lists+alsa-devel@lfdr.de>; Thu, 19 May 2022 19:55:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 079FF17ED;
	Thu, 19 May 2022 19:54:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 079FF17ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652982945;
	bh=I8tgd+WoWDMrJR4jZEp3jZktha7OhUuqZeTJmNYKX6g=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IFKo0v2fjW9bh8omKr4WygsyGGNKmwTC35Dojb9WXloBWPoFSr+jtr6r3JDLmW3LT
	 H6INfGi9CPy0Kzb8dWEyYYeBplYKGyrzk/jvgzr3k56iThN2V8neYtbrrkItsxj/Ct
	 U4b1FITuZUkM0xBjC3WWa+feLqJkrbIk+omxV620=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 80C41F80269;
	Thu, 19 May 2022 19:54:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 64A7DF800D1; Thu, 19 May 2022 19:54:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2252BF800D1
 for <alsa-devel@alsa-project.org>; Thu, 19 May 2022 19:54:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2252BF800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="d/3aArFJ"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 15DBF619B9;
 Thu, 19 May 2022 17:54:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D432AC385AA;
 Thu, 19 May 2022 17:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652982882;
 bh=I8tgd+WoWDMrJR4jZEp3jZktha7OhUuqZeTJmNYKX6g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=d/3aArFJ6c3CEjmZ1AHkWYwCGRmTO7nIwAUeFPSqz8UU8up3BaYwKv2fcjZzF1GDH
 O3mqj/q3qf/3JlbZTuGwgQXLoZcS/NBefZnBFF4dy69tTvRWSDiK/92ETRjY1xT7E7
 jC7oR03PmbhgBfky/0b0N/4dLhyrOYr21usdRmudB1jO8WZLpaYQ6+6aIGKfA7ANRj
 pkpR5JK/FqwO+nOVnvmSfAG2nUnr6K6HhDHc7Hb56hAttQhOzqXl3oQ7WYoSquc5OH
 LvPEopuwRSthF8B258lLQTEmECBZ+J1vavktEDH0+fq5P8repHA5c7b2c+hKBF/3ra
 v5lJEzGkpvvSg==
Date: Thu, 19 May 2022 18:54:37 +0100
From: Mark Brown <broonie@kernel.org>
To: Alexey Khoroshilov <khoroshilov@ispras.ru>
Subject: Re: [PATCH] ASoC: max98090: Remove unneeded check in
 max98090_put_enab_tlv()
Message-ID: <YoaEXWGEY4s14je+@sirena.org.uk>
References: <1652980212-21473-1-git-send-email-khoroshilov@ispras.ru>
 <YoZ+dmprwb5Ohto3@sirena.org.uk>
 <fd58c07c-488e-1c90-a755-194f714bbe45@ispras.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="25luxRjqlhvCfi1Q"
Content-Disposition: inline
In-Reply-To: <fd58c07c-488e-1c90-a755-194f714bbe45@ispras.ru>
X-Cookie: Some restrictions may apply.
Cc: ldv-project@linuxtesting.org, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>
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


--25luxRjqlhvCfi1Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 19, 2022 at 08:49:48PM +0300, Alexey Khoroshilov wrote:
> On 19.05.2022 20:29, Mark Brown wrote:
> > On Thu, May 19, 2022 at 08:10:12PM +0300, Alexey Khoroshilov wrote:

> >> -	if (sel < 0 || sel > mc->max)
> >> +	if (sel > mc->max)

> > The check needs to be moved, not removed.  The userspace ABI allows
> > passing in of negative values.

> Would (sel > mc->max) be enough in this case anyway?

Oh, the check won't be working properly - it's just that like I say the
fix is to move rather than remove it so it's operating on the signed
value.

--25luxRjqlhvCfi1Q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmKGhFwACgkQJNaLcl1U
h9CrFQf/Spd84BxyW43FtCv+kRymc8xAoxAjmgQI4n2HG3oXiv+WajOLPVB/AWmu
Ng/gUYtttDs+U2jQbWtkHjO0Q8Y2N6l1z+8+RGnJh//YX6dtSPQDtoS9aJ5w6JTd
SF9BM02u66EznHe/landjz+0N6cmY6H0QnVuuom1UCuixrB+5xiN1vIacLavIBJ+
yGHWfM/Jaj8CfwDlv5TBSu/wA0jYbFJzMOQ+B2zeQtcfTqFXvrwKP9miXTE7oQIM
xaJvVt/NnJTzgUn84dQPg/k4+kn6nBIubCoy01HhBaW+evcRbdoZ4FJsdKWMTKdL
SvQCgoxRRKWPo1bXaftaPcODCk0ziA==
=79Ws
-----END PGP SIGNATURE-----

--25luxRjqlhvCfi1Q--
