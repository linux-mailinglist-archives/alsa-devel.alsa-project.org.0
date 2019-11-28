Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A398410C8A5
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Nov 2019 13:25:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2451016E4;
	Thu, 28 Nov 2019 13:24:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2451016E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574943930;
	bh=MjX+KirqClOUhq/+IrwMQYyGK+c1S3q1cY5O3TxFRUs=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hZV+Z7Kyi2DronhHJLjVyQN6dnBzpfWvMZ4OyKvYlXxMkaMGL45JOWdfrpXEzA9Z7
	 0cXH7/9NtFQm6eFP+CeER3GKs4VnKtbIBWVGVRdfttvaj1ixq+RISbtIDbO7bku6R0
	 JaSeNgmbXdhgCDSgFJfchYvdw+6rEtZFpu8HoCJI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C1A97F80159;
	Thu, 28 Nov 2019 13:23:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3BE74F80149; Thu, 28 Nov 2019 13:23:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 0BCFDF80106
 for <alsa-devel@alsa-project.org>; Thu, 28 Nov 2019 13:23:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0BCFDF80106
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E309A31B;
 Thu, 28 Nov 2019 04:23:39 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6186B3F6C4;
 Thu, 28 Nov 2019 04:23:39 -0800 (PST)
Date: Thu, 28 Nov 2019 12:23:37 +0000
From: Mark Brown <broonie@kernel.org>
To: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Message-ID: <20191128122337.GC4210@sirena.org.uk>
References: <20191128093955.29567-1-nikita.yoush@cogentembedded.com>
 <20191128121128.GA4210@sirena.org.uk>
 <ecfa48d3-284b-5234-02b9-adc0c6892b6f@cogentembedded.com>
MIME-Version: 1.0
In-Reply-To: <ecfa48d3-284b-5234-02b9-adc0c6892b6f@cogentembedded.com>
X-Cookie: Do not dry clean.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 "Andrew F. Davis" <afd@ti.com>, Chris Healy <cphealy@gmail.com>,
 Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [alsa-devel] [PATCH] ASoC: tlv320aic31xx: Add HP output driver
 pop reduction controls
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
Content-Type: multipart/mixed; boundary="===============5912515223616721428=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============5912515223616721428==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="w7PDEPdKQumQfZlR"
Content-Disposition: inline


--w7PDEPdKQumQfZlR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 28, 2019 at 03:19:38PM +0300, Nikita Yushchenko wrote:

> > I'm not seeing any integration with DAPM here, I'd expect to see that so
> > we don't cut off the start of audio especially with the longer times
> > available (which I'm frankly not sure are seriously usable).

> I believe driver already has that integration, there is
> aic31xx_dapm_power_event() that is called on DAPM events, and polls state in
> register bits waiting for operation to complete.

> Btw, the default setting for register fields in question is "304ms" /
> "3.9ms" thus some delay is already there. This patch just makes it
> explicitly controllable by those who wait it.

Can you confirm that this does take effect (should be easy with the
longer delays) and put a comment in indicating that please in case
someone is cut'n'pasting?

--w7PDEPdKQumQfZlR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl3fvEkACgkQJNaLcl1U
h9DlHgf/SsdPanPk6tcxh3RNkH+E1k2QbOZyqz3ogi46FtVFl/EySbEnLUh0vvfV
yr8xLzJaENOWRlmBPP8NeB65/Zq4gfCp4vNX8fmm+0i7Uphn07vD13M2LMFMyWWn
H+NMnpM/8u+UsPY/dW7lk4cSt4sWhoV9D1FfwZt3fyabVGYF11+m440TFjUxqd1a
8NZTM7n2vOLlH7CXYXFyJqsJ0TGmmxdB1xWoT7S4XCHvsCBdyDYMyLFooZS/ClLW
MD24Rq9hH90CWAqcKbicRtGYs2fohXUZfzGEFDnSS2VYB7vlF4QPw7w8s9UGNvu1
bvEXSMuQhdTSHtz/BvV3d59WPNkRJw==
=+Mvy
-----END PGP SIGNATURE-----

--w7PDEPdKQumQfZlR--

--===============5912515223616721428==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============5912515223616721428==--
