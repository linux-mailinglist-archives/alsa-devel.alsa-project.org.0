Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D43B814DB3A
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Jan 2020 14:05:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4AB5A1678;
	Thu, 30 Jan 2020 14:04:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4AB5A1678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580389519;
	bh=kyjVEKmh8PmRU2ar+UvPMFTeo0cXxJvKHJIBMIxilTs=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Bc/euphAkR97ZeuiR/igqtd5vEJ0Fddj99kN9NvljTfixGRqkvx8EonU8+msJckd9
	 jGCzWB8uYB8GxaP2LaJO0MbQ/SynF7/Wks92RtvGYFowa5lcnXh6oV2kmpfkY12HY+
	 podNX+p8p6u6iLkfrVfDjGUQHNq9XEqFOSWFFMHw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E2F1F80123;
	Thu, 30 Jan 2020 14:03:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1C7C6F8014B; Thu, 30 Jan 2020 14:03:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 PRX_BODY_30, SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id A43BCF80082
 for <alsa-devel@alsa-project.org>; Thu, 30 Jan 2020 14:03:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A43BCF80082
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2B2EE328;
 Thu, 30 Jan 2020 05:03:30 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9D4B73F68E;
 Thu, 30 Jan 2020 05:03:29 -0800 (PST)
Date: Thu, 30 Jan 2020 13:03:28 +0000
From: Mark Brown <broonie@kernel.org>
To: Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>
Message-ID: <20200130130328.GB6682@sirena.org.uk>
References: <20200129220726.31792-1-pierre-louis.bossart@linux.intel.com>
 <20200129220726.31792-6-pierre-louis.bossart@linux.intel.com>
 <2c982980-32f2-60a4-a384-7b767fafab66@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <2c982980-32f2-60a4-a384-7b767fafab66@linux.intel.com>
X-Cookie: Positively no smoking.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH 5/9] ASoC: SOF: Move DSP power state
 transitions to platform-specific ops
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
Content-Type: multipart/mixed; boundary="===============5707361555911957989=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============5707361555911957989==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zx4FCpZtqtKETZ7O"
Content-Disposition: inline


--zx4FCpZtqtKETZ7O
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 30, 2020 at 08:47:28AM +0100, Amadeusz S=C5=82awi=C5=84ski wrot=
e:
>=20
>=20
> On 1/29/2020 11:07 PM, Pierre-Louis Bossart wrote:
> > From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> >=20
> > The DSP device substates such as D0I0/D0I3
> > are platform-specific. Therefore, the d0_substate
> > field of struct snd_sof_dev is replaced
> > with the dsp_power_state field which represents the current
> > state of the DSP. This field holds both the device state
> > and the platform-specific substate values.

Please delete unneeded context from mails when replying.  Doing this
makes it much easier to find your reply in the message, helping ensure
it won't be missed by people scrolling through the irrelevant quoted
material.

--zx4FCpZtqtKETZ7O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl4y1B8ACgkQJNaLcl1U
h9AVLQf/ShR1MsgXUkvCniEZrDGxaqeOM+B+1moj6Yq8qjUoVNq+dvYa2otESFR2
dPW+/cVWofS7I1QeGaPMmoninW3wDi5yg+yUU2Y5yCOxn7TTpORvax4VOK5mQYSd
MTpIYDT2dq+tduZljMO7JBuZBRNhF1Rk8eoW712ksRv7SW20kETfgD0mEbkfU/Wt
X0B8E8Fv+nNFcgR4oiURtHNCi/xud24m8xtV/M5F7zJwrkN5n3nGepz0IPkgZygL
WyH3Wyiog608Z7k4qUrLeEhNiSKaqQFI1GUMriZavNW4/XrD0QaiT2Dgv5MI4nVL
tkyMuTgQxX81CMk1UclAaMy2SNcmTQ==
=Bm+L
-----END PGP SIGNATURE-----

--zx4FCpZtqtKETZ7O--

--===============5707361555911957989==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============5707361555911957989==--
