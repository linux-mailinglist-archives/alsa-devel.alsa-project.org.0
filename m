Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E821C3800
	for <lists+alsa-devel@lfdr.de>; Mon,  4 May 2020 13:24:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 862471706;
	Mon,  4 May 2020 13:24:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 862471706
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588591493;
	bh=0VcTrmTIO63RLKDps5wd81aJX3Moc6zHyDdTsurqaUE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=stQT6t6oGEeb6Xqe6syLdBhvQh9589+MbKgn3zYqSVXIE1uKWxbwkps0+1by7Fanx
	 XHNC8fjKAHsF9478p/xmM5VoIP+npLWuK1OWaXVcldLY9xJWS0LnO+eDPRKiIAhKOP
	 J7Sr3MCzgTWzd8PxIlp4UVPUSJGmfK1E4XrUDRC4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BA704F80258;
	Mon,  4 May 2020 13:23:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A9EF9F80249; Mon,  4 May 2020 13:23:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DE32DF800EE
 for <alsa-devel@alsa-project.org>; Mon,  4 May 2020 13:23:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DE32DF800EE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="a8wP2WBs"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CCE3220721;
 Mon,  4 May 2020 11:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588591385;
 bh=0VcTrmTIO63RLKDps5wd81aJX3Moc6zHyDdTsurqaUE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=a8wP2WBsvFlQjoOEQk+sxa7+/cJXHDsV+jUyX1IrZyXVuuuYM5guSfr8tX9nMNjCH
 syLoQ78I7XgYcba0O4co0nixC4+JGrJnj/Ux0goQGiilXV28DFRqziKVgGtxSkhKWw
 NdZ/TccQvqcB5vUMMwaTPH1tGTgSxruEYnqvipsI=
Date: Mon, 4 May 2020 12:23:02 +0100
From: Mark Brown <broonie@kernel.org>
To: Oder Chiou <oder_chiou@realtek.com>
Subject: Re: [PATCH 1/2] ASoC: rt1308: Revise the devicetree file mode
Message-ID: <20200504112302.GB5491@sirena.org.uk>
References: <20200504074007.13002-1-oder_chiou@realtek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="wzJLGUyc3ArbnUjN"
Content-Disposition: inline
In-Reply-To: <20200504074007.13002-1-oder_chiou@realtek.com>
X-Cookie: My life is a patio of fun!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: jack.yu@realtek.com, alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 derek.fang@realtek.com, shumingf@realtek.com, flove@realtek.com
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


--wzJLGUyc3ArbnUjN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 04, 2020 at 03:40:06PM +0800, Oder Chiou wrote:
> The patch changes the devicetree file mode correctly.

This and patch 2 don't seem terribly related so there's no need to send
them as part of a series, merging things into a series when it's not
needed can slow things down if earlier patches in the series end up
having problems.

--wzJLGUyc3ArbnUjN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6v+xUACgkQJNaLcl1U
h9CU5gf+PVIijyJXsPRq1GoERpcGGPRqADFIR9Ak+4PEteLgrcwtIksyqUFLTeP1
xWxYft8z3jzx9gjeOHokJkbWzbnDAUOgQ2TINm5LAGoe6b2wEBkFr4WQGoPGBlcp
otfbde+McAAA/l4FU/YRaxvvuLeRWvOKlle1Q7BmgOB4VGt9pcAr/tV/7sKyha4r
UmVXBs1AUE5Otg61es2Se/9oN8FH6KfLpBCEN6EI5iA8Fk7MC/XoKjvAM6/CD/5Q
/yANqYDW5ZlVdEH8VTmgKcT2Y+k2fPSDhbhOQlnmHj7aS+yNiBnfwrxtRqWcq+zS
GEI/sVZFQA+owWaM4iGj0Zzuz34UEw==
=ZEQw
-----END PGP SIGNATURE-----

--wzJLGUyc3ArbnUjN--
