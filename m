Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 12754388D1D
	for <lists+alsa-devel@lfdr.de>; Wed, 19 May 2021 13:40:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8556C1681;
	Wed, 19 May 2021 13:39:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8556C1681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621424435;
	bh=k/Cg9sewf2pkY+aL3nTGRGRyuIzL36As8fq/44gs3p8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=f6v1woeq5ZyvjWcw9r4bVzi5vLwL+dC+okKns71e29LOqizvehc31kz3QcMnTNIm+
	 EgDnM/7ID6n05WeMUChw66rj923iCSUvFcwetDG6zPKsaDZIjg3258nmC9NLwzytZ3
	 P51Joh1Cf+8noHkatTvc8ePQV2Ls4rKUH9Ca4zHs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DAFF3F80246;
	Wed, 19 May 2021 13:39:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 50FBCF8016E; Wed, 19 May 2021 13:39:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 07EB3F80127
 for <alsa-devel@alsa-project.org>; Wed, 19 May 2021 13:38:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 07EB3F80127
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="qzPdydjc"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 262B16135C;
 Wed, 19 May 2021 11:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621424330;
 bh=k/Cg9sewf2pkY+aL3nTGRGRyuIzL36As8fq/44gs3p8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qzPdydjcUfeOykNZheQQnJDPKkW9Qxg/no1An7urX76zfKoL3hh9DRo2y1vbZZSQm
 fqzsWtma40gSFTfnmxz8alZimnwP9kN9+RYVZIgnI25s2sF6wDJLmmBYPTJ+a59ELN
 +xVpqCC7jGvHwnanB4ARmxQ2Vq5ulKbYOWs6AkL9kKCH03tsU1gpfufCH9KsJVerEi
 uQ2XURB+CYswSjqZi8l13+nFykbL9i43jgwwzXFuZ8dcg5Ff9krVSGO/e7bONpvgco
 335RXegYI0aKV8LDBl551QxhLkJVo0En9XgK8qbfqAtfnJhS3whauXNqOzuHsru1+u
 ZuSQV34YzMlCQ==
Date: Wed, 19 May 2021 12:38:05 +0100
From: Mark Brown <broonie@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: Question about Tegra UCMs
Message-ID: <20210519113805.GA4224@sirena.org.uk>
References: <20210518001356.19227-1-digetx@gmail.com>
 <20210518001356.19227-3-digetx@gmail.com>
 <20210518180949.GA949047@robh.at.kernel.org>
 <20210518183455.GE4358@sirena.org.uk>
 <92cef674-c454-e08c-b44d-d8c08b1e8ccf@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="AqsLC8rIMeq19msA"
Content-Disposition: inline
In-Reply-To: <92cef674-c454-e08c-b44d-d8c08b1e8ccf@gmail.com>
X-Cookie: There's no time like the pleasant.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Svyatoslav Ryhel <clamor95@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>, Ion Agorria <ion@agorria.com>,
 linux-tegra@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>,
 Rob Herring <robh@kernel.org>
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


--AqsLC8rIMeq19msA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 19, 2021 at 01:31:28AM +0300, Dmitry Osipenko wrote:

> Mark, could you please help me to understand the UCM naming scheme that ALSA uses..

I have no real idea, sorry.  Most of my userspace work has been with
Android which doesn't use UCM.

> IIUC, the "ucm2/Tegra/codec_name" scheme [2] that the current ALSA UCM
> uses simply doesn't work at all. Is there anything on the kernel side
> that I could change to get a working naming scheme? If yes, I may try
> to do something about it in the v2, thanks in advance.

Could you elaborate on the way in which it simply doesn't work at all?
I'd expect there to be something in there that first tries to match on
something to do with the specific hardware platform to take account of
plastics differences but that'd be a userspace change.

Please fix your mail client to word wrap within paragraphs at something
substantially less than 80 columns.  Doing this makes your messages much
easier to read and reply to.

--AqsLC8rIMeq19msA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmCk+JwACgkQJNaLcl1U
h9Dt2Af8D6yTsMzAGTj7KbTr3xEXsDs6SVhpitdY5ohrWjYu32XSNoSMCKHZhj5Z
BXK41d7eh8QTN02078sBrifJ2e5KGpw191xaDKiBDOeMF/pdX4QLMHoNqF0PGUc5
QaBvfT+ZltEUPmq1cjmCFnhXSlkYKekLXx32KIfEX/+xussTbHVqMb1TWdAwUTZx
n8pj+NvXNNpnJDozUWtNcRxykvzDqG2wzmdUygn+IEcRC/6XZYngAqDSPE+7Z+id
/Gl0FzIHhXYf5w5skQV5NhqMpaXwag613VnPwtWWNUvqgWMsP1K3pSx2aC4jSdaK
qJa1qzIIHMbq4qlkl5GMl8bba2Mp8g==
=0Y2O
-----END PGP SIGNATURE-----

--AqsLC8rIMeq19msA--
