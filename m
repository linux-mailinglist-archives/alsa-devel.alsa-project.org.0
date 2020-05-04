Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA381C3B24
	for <lists+alsa-devel@lfdr.de>; Mon,  4 May 2020 15:22:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 643D61715;
	Mon,  4 May 2020 15:21:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 643D61715
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588598566;
	bh=TmTThPPzqPGpxwdSnGjDCaspiEw5yMD7Er/gNQKbhp4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MwUdoPO9NHLy++W1/eO5Bp3IaSYB22hrEiua+jHdp896oYlpzLqcJyCBYjXd5ODg2
	 FUk41A2RlHMMThF6iDlxCCI2DGHhzIrnDi1YmxOQ5nWcs9gmj3IhudqSocVFk8uUip
	 SetZTZgzBdO9o+XHoqD8y5lu6nQ8D8u36YutfweM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 609D2F800E5;
	Mon,  4 May 2020 15:21:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DC999F80249; Mon,  4 May 2020 15:21:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AC057F800EE
 for <alsa-devel@alsa-project.org>; Mon,  4 May 2020 15:20:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AC057F800EE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="fXJJaX2V"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2F8F62073B;
 Mon,  4 May 2020 13:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588598454;
 bh=TmTThPPzqPGpxwdSnGjDCaspiEw5yMD7Er/gNQKbhp4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fXJJaX2Vl0YL18pOKUF/1VGP2I3cbrVG1ibTCHHfOpha8wJ2sSBP2awNOEPaJvX/a
 wVU5G/vDymXuIlJXDylvcakC9l59ISiMvHTaC9cPnEqAWRYbM5HZHHI+Yxe3UiV6el
 /Hc7p/Xd6+JT7sefJghKkObs2GrBARPiYcbsCFGM=
Date: Mon, 4 May 2020 14:20:52 +0100
From: Mark Brown <broonie@kernel.org>
To: Tang Bin <tangbin@cmss.chinamobile.com>
Subject: Re: [PATCH] ASoC: qcom: Remove the unnecessary cast
Message-ID: <20200504132052.GA20675@sirena.org.uk>
References: <20200504073558.2340-1-tangbin@cmss.chinamobile.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="fUYQa+Pmc3FrFX/N"
Content-Disposition: inline
In-Reply-To: <20200504073558.2340-1-tangbin@cmss.chinamobile.com>
X-Cookie: YOU PICKED KARL MALDEN'S NOSE!!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, bgoswami@codeaurora.org, plai@codeaurora.org,
 linux-kernel@vger.kernel.org,
 Zhang Shengju <zhangshengju@cmss.chinamobile.com>
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


--fUYQa+Pmc3FrFX/N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 04, 2020 at 03:35:58PM +0800, Tang Bin wrote:
> It's not necessary to specify 'void const __force *' casting
> for 'drvdata->lpaif'.

This doesn't apply against current code, please check and resend.

--fUYQa+Pmc3FrFX/N
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6wFrMACgkQJNaLcl1U
h9CERwf/XWEzr0Iyb/54nGEKIkr/672FzoBds5lVOpbHkmXe6MUiIble9RCFzH1y
bwy40nhuE7TJajc4Fc0jI+a5ZP6SgeVPXVdjhU3Wk33sBDLYD4XJtTzRXjiNsB0g
YoOy6jHJ6+ruWZZ83fRj3t2peQ9KTJWDJxL4h7FxeC7jXFCECipkG8FOUTtZ8xIU
YKz1q4C0Notu2IlqnwktxTY7TnRuaUxnrGIq8AsO4hWD8VTEAySGdFkKI5Wa8Qbc
+qfwlo8jCARWb+DRm3Mnxn3yZwvmivfe72PoI7uBZiY0DihpiJGoN3KI7MSrwMHa
0rK9gsO6USmtGAS/z9FY3p85R1mC0A==
=4D65
-----END PGP SIGNATURE-----

--fUYQa+Pmc3FrFX/N--
