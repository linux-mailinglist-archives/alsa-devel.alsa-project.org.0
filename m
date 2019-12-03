Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A6B10FF75
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Dec 2019 14:59:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DC0071658;
	Tue,  3 Dec 2019 14:58:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DC0071658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575381549;
	bh=Ux5ThqfYqirS+OVMRNJNcKxm3ZyJn8C90BwPGZeazNQ=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rWEgzSp7IJAuZLjXUbSlZEyOO38Kpwaxe/LwJeqXnlXGJxYDTh/6/W9bxEwOVLqrN
	 kumFkRJgqOxRBkYKCbHBWXkfcDcgPeCLk/IKe8r0mCblrR5YqhafFWROQTFDwbBI+8
	 GZnf+ntfb0RHjYZ49BUgCUNwjq7FBhvQafCYjim0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 52FC7F8015A;
	Tue,  3 Dec 2019 14:57:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1EB73F80227; Tue,  3 Dec 2019 14:57:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DE935F800F0
 for <alsa-devel@alsa-project.org>; Tue,  3 Dec 2019 14:57:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DE935F800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="qCGwg1s5"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dMhjP/jievxghATJcetWe9ihqNrI1HEWKB+ljOEzpDo=; b=qCGwg1s5egJ+XIcBGmbCeXgZw
 GkcvAIc1pnYNLUidCLIQZQ1rkCb3/AaNvfHaw2loeRf8KcobDk6Iffw3GKAPXozE/QTADJ6YLeO3E
 LBtKDhQD5iQ8Yb9teK9l63w1MuTBjRWc/IJrO/8QUvVY0i8/qsNLLSD9Mkq/rXPg1gbqQ=;
Received: from fw-tnat-cam1.arm.com ([217.140.106.49]
 helo=fitzroy.sirena.org.uk) by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1ic8g2-0002b9-0S; Tue, 03 Dec 2019 13:57:18 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 916A0D002FA; Tue,  3 Dec 2019 13:57:17 +0000 (GMT)
Date: Tue, 3 Dec 2019 13:57:17 +0000
From: Mark Brown <broonie@kernel.org>
To: Brent Lu <brent.lu@intel.com>
Message-ID: <20191203135717.GH1998@sirena.org.uk>
References: <1575358265-17905-1-git-send-email-brent.lu@intel.com>
MIME-Version: 1.0
In-Reply-To: <1575358265-17905-1-git-send-email-brent.lu@intel.com>
X-Cookie: Cleanliness is next to impossible.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org,
 Support Opensource <support.opensource@diasemi.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH] ASoC: da7219: remove SRM lock check retry
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
Content-Type: multipart/mixed; boundary="===============4166544201994375787=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============4166544201994375787==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jRdC2OsRnuV8iIl8"
Content-Disposition: inline


--jRdC2OsRnuV8iIl8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 03, 2019 at 03:31:05PM +0800, Brent Lu wrote:

> For platforms not able to provide WCLK in the PREPARED runtime state, it
> takes 400ms for codec driver to print the message "SRM failed to lock" in
> the da7219_dai_event() function which is called when DAPM widgets are
> powering up. The latency penalty to audio input/output is too much so the
> retry (8 times) and delay (50ms each retry) are removed.

> Another reason is current Cold output latency requirement in Android CDD is
> 500ms but will be reduced to 200ms for 2021 platforms. With the 400ms
> latency it would be difficult to pass the Android CTS test.

Adam pointed out some specific problems this causes here but at a
higher level this commit message isn't great since it just says
"I don't like these delays so I made them shorter" which doesn't
really explain what the delays are doing or why it's OK to make
them shorter - there are plenty of audio devices which require
longer ramp times than people would like out there but there's
usually good solid reasons why the delays have to be there.

--jRdC2OsRnuV8iIl8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl3mabYACgkQJNaLcl1U
h9Alvgf+O6LAdo281NDSae5rpCvfsxmLKh9POrtFw+1BQ0Sj8NX6kAjrShi6x//G
pXpypd9N3ikWjox5Fakw7VK1jz5QWUSdGR2PooLz1l8yJiu8KS13BAzZ128+9wzx
xAHMDv4Y4bEAUF6etkVz+C4cjjrvpPoJls41Fkd+mgUf4YJoSI1/2vaveJsh3SFZ
MqqGaxVSJF6Y8NkCiCi1iuwMJ54NEj0StvAJs/DoaC9QAgCKMJBN3A3mbtDvZrWD
efAisKVDhkz+xa6BUV+jW57SnSmFWvTY5zWBLCJGgnCHh2NWURd3nmEuV4kwtDdC
Svgjke4iToZwagfrdJkWbA4FqfAuMQ==
=jUTM
-----END PGP SIGNATURE-----

--jRdC2OsRnuV8iIl8--

--===============4166544201994375787==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============4166544201994375787==--
