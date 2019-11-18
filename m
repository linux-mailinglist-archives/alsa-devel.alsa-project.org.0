Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F61C100637
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Nov 2019 14:10:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0B7091691;
	Mon, 18 Nov 2019 14:09:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0B7091691
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574082647;
	bh=J8KPeBFrFRjUfHEovv0S5QWImLMRpLOwq3sfrRPLQ+w=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=E5IHnMUIjo46xUZDAhYla8rEX3AE13oNNtRVt1B4hdbn3o7T/YGG0DfrXg4QOYRy6
	 7nnlqnGvgxhXQgKKCzoBcxJ4OawCeaW1j9wTLCh/sg7v66J46yqUXMYgMvBuuQSaQg
	 tYGmpCyhEJXUH1uq8i7HZ0ogOdGBAaEd6C5a4gPY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6FE20F8013B;
	Mon, 18 Nov 2019 14:09:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1200FF8013B; Mon, 18 Nov 2019 14:09:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 8355EF800FF
 for <alsa-devel@alsa-project.org>; Mon, 18 Nov 2019 14:08:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8355EF800FF
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8D7DA1FB;
 Mon, 18 Nov 2019 05:08:57 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F0A143F6C4;
 Mon, 18 Nov 2019 05:08:56 -0800 (PST)
Date: Mon, 18 Nov 2019 13:08:55 +0000
From: Mark Brown <broonie@kernel.org>
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
Message-ID: <20191118130855.GE9761@sirena.org.uk>
References: <20191113124734.27984-1-peter.ujfalusi@ti.com>
 <20191113124734.27984-2-peter.ujfalusi@ti.com>
MIME-Version: 1.0
In-Reply-To: <20191113124734.27984-2-peter.ujfalusi@ti.com>
X-Cookie: no maintenance:
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kuninori.morimoto.gx@renesas.com, linus.walleij@linaro.org,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org
Subject: Re: [alsa-devel] [PATCH 1/2] bindings: sound: pcm3168a: Document
	optional RST gpio
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
Content-Type: multipart/mixed; boundary="===============7459659424209108600=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============7459659424209108600==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Rgf3q3z9SdmXC6oT"
Content-Disposition: inline


--Rgf3q3z9SdmXC6oT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 13, 2019 at 02:47:33PM +0200, Peter Ujfalusi wrote:
> On boards where the RST line is not pulled up, but it is connected to a
> GPIO line this property must present in order to be able to enable the
> codec.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--Rgf3q3z9SdmXC6oT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl3Sl+YACgkQJNaLcl1U
h9CQRAf+IOHuqykiR2XV9orGZa0JGfA9jN/HKH9JdghHPcxQ0jzR/dfC3kNnBy/l
QAeSXU6vF5LuJx75MIHsf6Dx15bZ0kZ0WKpJnI9Fqn+k/PKeXWPhBB+6sPet4msQ
A5opWLa03tkaXlmNZd14uQrEV6Zbir9q9WT5UqAvM7Ceb3k1jDKRBb7tWvPUggTi
Rk2DeiXEHNOWWa0eekadtR453n2MTfUtmEncqiKzZu2+PGOI5sz+banoXhgaXlim
Jwbk83xfZ/HrgB6Wqvw2pneJ+1fEsu8aix6z8ty3UWhPwcIuNqNZGyOlVPjGYUTm
5g86BZwQ18875HSZ3tAi1meDwJt1cA==
=7OaS
-----END PGP SIGNATURE-----

--Rgf3q3z9SdmXC6oT--

--===============7459659424209108600==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============7459659424209108600==--
