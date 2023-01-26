Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE3A67C275
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Jan 2023 02:36:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 69470207;
	Thu, 26 Jan 2023 02:35:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 69470207
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674696964;
	bh=nu4UPM0/6e6SUI3Gzu5WHyydw+Ycd1gwt3bHMLAiK1k=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Ly3M+kbfEI9cXojCd3+yhgp2TANiLZhb+yqiN4i2pe0VuJpCom7SqSg/3Zt0AFz91
	 t9uzF8R3qExoYR/nJv/PPIQpGcM+OHUYbt87hSrkNKDs1AgwxDFnkg95NH/YUFOhPc
	 V5L822JafZ5R3UcxjMGn40sqmY+S7sjZIhb51fLE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 92EB4F800AE;
	Thu, 26 Jan 2023 02:35:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BC449F80424; Thu, 26 Jan 2023 02:35:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 71A2AF80163
 for <alsa-devel@alsa-project.org>; Thu, 26 Jan 2023 02:34:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 71A2AF80163
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=DFSeeH4W
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2F68B616FD;
 Thu, 26 Jan 2023 01:34:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2333DC433EF;
 Thu, 26 Jan 2023 01:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674696896;
 bh=nu4UPM0/6e6SUI3Gzu5WHyydw+Ycd1gwt3bHMLAiK1k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DFSeeH4W10NzaZBu/6MN89aAQD5oNOJjn445RK3PBc//OK7E7Jb7dSxpoHJ5kiubE
 uzzpZP3xLW+TPuzMox5J6be1k4DUJWKhkOqvYQ78Lql40aaUEswp6szJ4Bi/F55DB/
 Et+lVRAh/qvc3sEBeESOLSPf8FqLcogp6hKtNBNa5gxk4P8QJ0ODrzNoLCQz55nm7s
 UWODyvazN5A9kntQSQaT72gZCNxaJ5U7D8xwm/C84gNchOXsrGLaQF8wVswpmgfUlx
 0TkumxSuy2tQr7HI4M9vYq/dHsohsZwV+VgZPKOZ8VWptkGHscbVvCAXwlyOm/Bhcl
 U4x3v5+W9wCSA==
Date: Thu, 26 Jan 2023 01:34:53 +0000
From: Mark Brown <broonie@kernel.org>
To: Ki-Seok Jo <kiseok.jo@irondevice.com>
Subject: Re: [PATCH v2 1/2] ASoC: sma1303: Add driver for Iron Device SMA1303
 Amp
Message-ID: <Y9HYvUMHj1GSkFa5@sirena.org.uk>
References: <20230109091402.11790-3-kiseok.jo@irondevice.com>
 <Y8F5+7vgl+f9rytb@sirena.org.uk>
 <SLXP216MB0077F86978B363B5F4ECEBC78CC49@SLXP216MB0077.KORP216.PROD.OUTLOOK.COM>
 <Y8konjHXimUfm4NH@sirena.org.uk>
 <SLXP216MB007747CCA6C43D139712535C8CCE9@SLXP216MB0077.KORP216.PROD.OUTLOOK.COM>
 <Y9EWif///aqn6MiS@sirena.org.uk>
 <SLXP216MB0077D804A2DBDA92B884C4048CCF9@SLXP216MB0077.KORP216.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ImfCbhcru9xaRAYg"
Content-Disposition: inline
In-Reply-To: <SLXP216MB0077D804A2DBDA92B884C4048CCF9@SLXP216MB0077.KORP216.PROD.OUTLOOK.COM>
X-Cookie: Serving suggestion.
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Application <application@irondevice.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--ImfCbhcru9xaRAYg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 26, 2023 at 01:28:32AM +0000, Ki-Seok Jo wrote:

> > This at the very least needs a comment since it's not clear how someone
> > would work that out from the code, there's no connection here to the mute
> > operation so someone might just remove the delay.  It may even be that this
> > is happening well over 55ms after the mute happened.  The ideal thing would
> > be to track the time from the last mute, the regulator core does something
> > along those lines with off_on_delay.

> Currently mute control is registered in mute_stream function in
> dai operations. After that, amp shutdown is performed in DAPM
> PRE_PMD. Since a 55 ms delay was required in the meantime, it
> seems correct to change the position of the delay like you
> said. I will also include a comment about delay. Please reply
> if there is any problem.

I think that sounds fine.

> > Please fix your mail client to word wrap within paragraphs at something
> > substantially less than 80 columns.  Doing this makes your messages much
> > easier to read and reply to.

> Thanks, I fixed the mail setting.

Seems not to have worked (at least for the text version) :/

--ImfCbhcru9xaRAYg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmPR2LwACgkQJNaLcl1U
h9BnXwf+O4zPasAO3NxIazQzb4KUqqO66N5DalKOiGD7gGCpfZNmFb8ZInifG0Gq
yB0fkvWgRIU43sQcZ63YTGFZ+oZpOhOe3+OwPyy9lQw+blimD9M8q/XUZs8AWug0
boxtVHbSnmU/guoLP1f4ylODO+R5Uiz9BEaE2KfeXgMmOENU7ZSpFeo9zeyDI4YK
SsEHH3QxDw2kqtUGCNhi/i/sG/d0x4iYDT1+lFk4+s/EseUOyq8oLB2/S3QRJO/W
gxdbxZgdqqoPp9eigeAy/2sSItSSa49QVdMqSPshcaHoPCKiP894v9GQmaZRYn1D
RBt6wBpldICKfTBCxCFRZRQYV2aTig==
=M5mi
-----END PGP SIGNATURE-----

--ImfCbhcru9xaRAYg--
