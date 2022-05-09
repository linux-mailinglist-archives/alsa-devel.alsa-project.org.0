Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 951AF51FB30
	for <lists+alsa-devel@lfdr.de>; Mon,  9 May 2022 13:22:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2942B18C5;
	Mon,  9 May 2022 13:21:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2942B18C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652095364;
	bh=IIvsWODmX0KI3MoORXOy0Ju3TSkGG3RxXgnBJ4rEB7c=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cZW9FraLCnwHug1v5Qc9Wtf1ZtvdlVap7xogXCCMHSBfA5NoA5qgRQgO2mJLTuupd
	 BcehIgr1eJiA/T1fkluQRMrqhLNKvqjw7GrViwE5+gtzbsbKcmRRb8dSLU2UFJ2uWW
	 pL7/IAwLSn8QAhjIemz0XyIQT1eLM6JeGuMwtUz0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8589DF80269;
	Mon,  9 May 2022 13:21:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 99556F8025D; Mon,  9 May 2022 13:21:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3C72BF8014C
 for <alsa-devel@alsa-project.org>; Mon,  9 May 2022 13:21:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C72BF8014C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="SeCAK2rY"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A19DE6118D;
 Mon,  9 May 2022 11:21:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 804C1C385A8;
 Mon,  9 May 2022 11:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652095297;
 bh=IIvsWODmX0KI3MoORXOy0Ju3TSkGG3RxXgnBJ4rEB7c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SeCAK2rYuJDg4HjfqQhuGMfkRZ2uM+bYFA67XcWJP5jgWSXIPZmTEkRJCfnyoiGp/
 mBO/9QLCbp4XcM/fzCOd9PQm5rqWdQl1MmQACg4SV2NE0SnH76sW5A5E+MejMDuuVy
 ycxvOITauQA3DzIiRSiAUciE/t5CuXaO+Wr9+y+/IytZMpVBLjmuLJX3vRG/hKhjxX
 Zpimic9+G8vhSCgFcpQMOzr5pnX7ZAgEq3e+vYadzX0F6HhCTHFUwdxHotbB9Ur4/T
 ftFiaLcRDICi1/6MWKBw48KgGgXhClXD2vsQsKgUS+wuxpx3Y+1nPKN8K9LsjicyeS
 f09cWfZE/xJyw==
Date: Mon, 9 May 2022 12:21:32 +0100
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH 00/26] ALSA: hda: cirrus: Add initial DSP support and
 firmware loading
Message-ID: <Ynj5PG0flJhn9iYD@sirena.org.uk>
References: <20220427150720.9194-1-vitalyr@opensource.cirrus.com>
 <YmljEm6jUr3Odsv9@sirena.org.uk> <s5hbkw7m6ew.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="p9Zw1zY8ht5OOUdB"
Content-Disposition: inline
In-Reply-To: <s5hbkw7m6ew.wl-tiwai@suse.de>
X-Cookie: Boycott meat -- suck your thumb.
Cc: alsa-devel@alsa-project.org,
 Vitaly Rodionov <vitalyr@opensource.cirrus.com>, patches@opensource.cirrus.com,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org
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


--p9Zw1zY8ht5OOUdB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 09, 2022 at 10:55:35AM +0200, Takashi Iwai wrote:
> Mark Brown wrote:
> > On Wed, Apr 27, 2022 at 04:06:54PM +0100, Vitaly Rodionov wrote:
> > > The CS35L41 Amplifier contains a DSP, capable of running firmware.
> > > The firmware can run algorithms such as Speaker Protection, to ensure
> > > that playback at high gains do not harm the speakers.
> > > Adding support for CS35L41 firmware into the CS35L41 HDA driver also
> > > allows us to support several extra features, such as hiberation=20
> > > and interrupts.

> > There's a bunch of changes for this driver in the ASoC tree, it looks
> > like the bits that touch ASoC will need basing off those.

> How is the situation for the time being?
> I've been off in the last weeks, so couldn't follow the whole
> thread.

No change, Vitaly didn't update or respond as far as I remember.  We'll
need a new version.

--p9Zw1zY8ht5OOUdB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJ4+TsACgkQJNaLcl1U
h9Beagf/as89leek9FmSiElfBkp4f1KqydfalbmNjD8V4is3Iu63RMb4Vba7xepv
pa05jYfRfhuU7H7fw4Dxy3tOkFWF1Y2qq76HqL+MfC3kFB4sQbBoK8Fujq+c9o4u
ZgK626VB7WsYimYvzJsKClQPvA4bfkvRaS40uKkUx9vLm6WSCs/JRIAck12sXPUp
J5Be37OsScV07pZ11wWateu4fFLRDIIz7Xv0QbqKy/Y7U4OAQpKfPJwHIx13II7Y
5SqL87jRoNYNcBjfVQZaWlZewmfLUedpBB1t9olUZkr9/1k6VgI0HV70HgJ5nnRZ
SE1JOWGdP+INy/G4JNmGUks5Rx2oqw==
=I9P/
-----END PGP SIGNATURE-----

--p9Zw1zY8ht5OOUdB--
