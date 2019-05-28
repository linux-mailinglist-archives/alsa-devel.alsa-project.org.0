Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F942CA41
	for <lists+alsa-devel@lfdr.de>; Tue, 28 May 2019 17:21:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 38FB41860;
	Tue, 28 May 2019 17:20:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 38FB41860
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559056879;
	bh=/YFFf9HtfgIQAL8zTR+dQ00XIWtl1SkZVccvLBrUMbQ=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Bb8+bnrBa3UqPa48kQkQEwB0jWJM7/H+B2Qn3hR7gugo/D3d/AATZmLxEsaVeQt/M
	 ZY1wMmQ1VF8g2FJDIocZd2sUfnRVl9WpnWysNidtR7DYiLLUcxFuhBXi5HckUF7fV6
	 oEB+UVcmlp5d+gtWowmU5MgGMOAjInIuxeo/Sk5c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 04E8AF89708;
	Tue, 28 May 2019 17:20:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B03BAF89706; Tue, 28 May 2019 17:20:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 83B73F8065A
 for <alsa-devel@alsa-project.org>; Tue, 28 May 2019 17:20:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 83B73F8065A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="KwmojihF"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kk7K2Uwsw3zUVLU6J6r1H7hv4BoEBWD8t9U3+QUMPKw=; b=KwmojihFlG6yG1+T6UdKLQlVq
 56OK5It33jUX1H/0oX81bzzKx/Xi6pG8HGI/MVJHeOZPQj6x2XW0LrnZmG60bA8GBxaf7ozBjC3bJ
 YUnm6NnaSOpZAZnZCTKe+7fUDNJowovOj4aSe68DV8fbpvDY3ENIKoCPsoRiW9HZVZa/o=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hVdtZ-0002wA-9M; Tue, 28 May 2019 15:20:09 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 3C832440046; Tue, 28 May 2019 16:20:08 +0100 (BST)
Date: Tue, 28 May 2019 16:20:08 +0100
From: Mark Brown <broonie@kernel.org>
To: Banajit Goswami <bgoswami@codeaurora.org>
Message-ID: <20190528152008.GM2456@sirena.org.uk>
References: <1558684467-11333-1-git-send-email-bgoswami@codeaurora.org>
 <20190524112931.GB2456@sirena.org.uk>
 <e65750b3-1fa6-e982-e695-4566f5e51e0c@codeaurora.org>
MIME-Version: 1.0
In-Reply-To: <e65750b3-1fa6-e982-e695-4566f5e51e0c@codeaurora.org>
X-Cookie: The other line moves faster.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, srinivas.kandagatla@linaro.org,
 plai@codeaurora.org
Subject: Re: [alsa-devel] [PATCH] ASoC: Add a debug log to track DAPM widget
	power up/down
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
Content-Type: multipart/mixed; boundary="===============5181915899872714336=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============5181915899872714336==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9JSHP372f+2dzJ8X"
Content-Disposition: inline


--9JSHP372f+2dzJ8X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 27, 2019 at 06:15:20PM -0700, Banajit Goswami wrote:

> having the dev_dbg here are-

> 1. Do not need to enable trace, which helps collecting logs, without much
> know-how

> about audio or kernel

That approach results in kernel logs that are really hard to use and
wrap round far too fast - if everything starts spamming the logs it does
nothing for readability.

> 2. Dynamic debug (using /sys/kernel/debug/dynamic_debug) can be enabled for

> either just this line of code, or, for the function containing this debug
> statement.

> This way, logs can be collected just for the DAPM widget enable/disable, and
> thereby

> avoid having the output logs filled with unwanted logs.

That's into needing to learn about the kernel at which point there's no
real advantage of this approach.

> 3. Though I agree with you about the additional DAPM debug logs being
> present for

> someone who may not be specifically working on Audio, based on the number of

> widgets in the audio path used, the number of prints should be limited to
> only widget

> power on/off.

Some devices are *much* bigger than others, and some systems will start
and stop audio much more frequently than others (things like noises for
taps for example) both of which will massively amplify the noise.  Even
when actively working on audio with those systems logging everything
gets old really fast.

--9JSHP372f+2dzJ8X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlztUacACgkQJNaLcl1U
h9Cyjgf8CWtiazxsjURSZVITlZIn8HIXUYWIfesweLZSJN3RINF0Cyz/cTXUZEe5
8gMjchjbLW15cSTHH5ekJhKaA5TzuSv/+p6JKcV+G0v9QPF9tib3/ycmQBPwYIAs
q9bgZuKa88r8awOEYDgPRjrYlp3GoxSwbU26FIjVVtFNbKw3sveNH0AWUaSolmEl
l6FYsG12SqDj8uX9t/uPCzbB4cEu+3mYg8fI1h6rG+MCh57+Uq67/NvqQPR/U8DV
BxXOzP8VKWTBRz9NgJ3i9LPeRA7GXasH30W0HjFCAfcvtpJjhReHh+STKveLWZeH
Btj2Ds6I2a3Q6VEZCiuKoHh4vIg5WA==
=SFB6
-----END PGP SIGNATURE-----

--9JSHP372f+2dzJ8X--

--===============5181915899872714336==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============5181915899872714336==--
