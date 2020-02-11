Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0E6158D90
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Feb 2020 12:31:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 46D4B166E;
	Tue, 11 Feb 2020 12:30:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 46D4B166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581420691;
	bh=nUuyJ4Fs5Bo7dpMuppGvwy+reXsM3+ORHSToJxU7h6c=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Kte+rLvZOUYvKfvj7l1xj+MLp9iow66UXVv85ZMpbgj9mi+Y+ttLFz+g4Yf82B3gD
	 Xd4510z5qBtBC7ncgNukpC81vnmfRK2drKabUL5DLYdn2ORmJhTO81IfTA8U++oCcW
	 v3B9Gkze0dEzlTQMlM8ba+XyE4I9aSPAGp/beniw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 70FABF800F0;
	Tue, 11 Feb 2020 12:29:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5ED3BF80145; Tue, 11 Feb 2020 12:29:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 2C368F800F0
 for <alsa-devel@alsa-project.org>; Tue, 11 Feb 2020 12:29:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2C368F800F0
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F227831B;
 Tue, 11 Feb 2020 03:29:38 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 75F5A3F6CF;
 Tue, 11 Feb 2020 03:29:38 -0800 (PST)
Date: Tue, 11 Feb 2020 11:29:36 +0000
From: Mark Brown <broonie@kernel.org>
To: Tzung-Bi Shih <tzungbi@google.com>
Message-ID: <20200211112936.GB4543@sirena.org.uk>
References: <20200204102016.I73b26b5e319de173d05823e79f5861bf1826261c@changeid>
 <20200210183803.GB14166@sirena.org.uk>
 <CA+Px+wV8R1eA9cy5V9LsEAAd2TxjKjf5aPBhwh+5a4-qeimOPA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+Px+wV8R1eA9cy5V9LsEAAd2TxjKjf5aPBhwh+5a4-qeimOPA@mail.gmail.com>
X-Cookie: Hire the morally handicapped.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Dylan Reid <dgreid@google.com>, Jimmy Cheng-Yi Chiang <cychiang@google.com>,
 Jiaxin Yu =?utf-8?B?KOS/nuWutumRqyk=?= <jiaxin.yu@mediatek.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: max98357a: add speaker switch
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
Content-Type: multipart/mixed; boundary="===============3924819006828361256=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============3924819006828361256==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kORqDWCi7qDJ0mEj"
Content-Disposition: inline


--kORqDWCi7qDJ0mEj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 11, 2020 at 06:32:20PM +0800, Tzung-Bi Shih wrote:

> Did you mean (in machine driver):
> - Add SND_SOC_DAPM_SPK("Speakers", NULL)
> - Add SOC_DAPM_PIN_SWITCH("Speakers")
> - Add DAPM route "Speaker" (from max98357a) to "Speakers"
> User space program controls "Speakers Switch" to toggle the switch?

Yes.

> We found the method cannot avoid max98357a->sdmode being set.  As a
> result, max98357a consumes power even if we don't switch on it.

That seems like something that you can address by improving integration
with DAPM.

--kORqDWCi7qDJ0mEj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5CkCAACgkQJNaLcl1U
h9DdHAf+KIzWUkR+2BQzcFwHKkDUsotb6ohYaNG9NevFCKOUlJSA6prdn2B3oKsm
n4R7SDAmeVuARbfZHH4AgA8HT9z5J2qqM/rme6JZxx2GbojGT+ujkXrxm9HXC41m
RLFWkTON5CvxOIZSo521FMEuPUL5HVh2gBAPPZYYDKkxWwMo3WaFkJU97JF5ecmA
pvng5l5RRfKy3jroKQawNIAOyiey4twjHNqc7VH8AD4Tbwp4C2thAAaO0EH3zmc/
Jt/8NcNLu1PPDXEkGPaYX1vfsiqfO6CvKIj9tZmzuW0Bq0A+IeK17SKdDvvFcb97
BzECwoAnhdHXsH47dv+cQqdmLaPxsw==
=7wKu
-----END PGP SIGNATURE-----

--kORqDWCi7qDJ0mEj--

--===============3924819006828361256==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============3924819006828361256==--
