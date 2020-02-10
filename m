Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA3E158421
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Feb 2020 21:10:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DB95B1673;
	Mon, 10 Feb 2020 21:09:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DB95B1673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581365434;
	bh=WhOPa64nPp8OtNqATg2gz/WTaJtDiBWD6uxuFNkq7dM=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dTEGUuPisI6oqneSwCbZOpmPIZkU/eVYFedIrIiby+JTlQ52oCvlhH/qWatRcu+f/
	 j4oGFT6Ig51LR1daf7RejV37JbUTSFEaR9+sMH3pprFgbRu3tXub1LAzTF+zIyTTgi
	 PwI/0uMcDNp47WTNqDTHBi+QO3s883MOvhRR5KnU=
Received: from vmi242170.contaboserver.net (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E3795F80158;
	Mon, 10 Feb 2020 21:08:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 72392F80157; Mon, 10 Feb 2020 21:08:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id B3CA7F800FD
 for <alsa-devel@alsa-project.org>; Mon, 10 Feb 2020 21:08:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B3CA7F800FD
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DF8D431B;
 Mon, 10 Feb 2020 12:08:41 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 614613F68F;
 Mon, 10 Feb 2020 12:08:41 -0800 (PST)
Date: Mon, 10 Feb 2020 20:08:39 +0000
From: Mark Brown <broonie@kernel.org>
To: Adam Serbinski <adam@serbinski.com>
Message-ID: <20200210200839.GG14166@sirena.org.uk>
References: <20200207205013.12274-1-adam@serbinski.com>
 <20200209154748.3015-1-adam@serbinski.com>
 <20200209154748.3015-9-adam@serbinski.com>
 <20200210133636.GJ7685@sirena.org.uk>
 <18057b47c76d350f8380f277713e0936@serbinski.com>
 <20200210182609.GA14166@sirena.org.uk>
 <f88d21773f47f5a543a17ad07d66f9b7@serbinski.com>
MIME-Version: 1.0
In-Reply-To: <f88d21773f47f5a543a17ad07d66f9b7@serbinski.com>
X-Cookie: No lifeguard on duty.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>,
 linux-arm-msm@vger.kernel.org, Patrick Lai <plai@codeaurora.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Srini Kandagatla <srinivas.kandagatla@linaro.org>,
 Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH v2 8/8] ASoC: qcom: apq8096: add kcontrols
	to set PCM rate
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
Content-Type: multipart/mixed; boundary="===============3193895756842110903=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============3193895756842110903==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OFj+1YLvsEfSXdCH"
Content-Disposition: inline


--OFj+1YLvsEfSXdCH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 10, 2020 at 03:00:55PM -0500, Adam Serbinski wrote:
> On 2020-02-10 13:26, Mark Brown wrote:

> > To repeat my comment on another patch in the series there should still
> > be some representation of the DAI for this device in the kernel.

> Respectfully, I'm not sure I understand what it is that you are suggesting.

> Is it your intention to suggest that instead of adding controls to the
> machine driver, I should instead write a codec driver to contain those
> controls?

I have already separately said that you should write a CODEC driver for
this CODEC.  I'm saying that this seems like the sort of thing that
might fit in that CODEC driver.

> Or is it your intention to suggest that something within the kernel is
> already aware of the rate to be set, and it is that which should set the
> rate rather than a control?

That would be one example of how such a CODEC driver could be
configured, and is how other baseband/BT devices have ended up going
(see cx20442.c for example).

--OFj+1YLvsEfSXdCH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5BuEcACgkQJNaLcl1U
h9DMaQf9GjP0HkMcqo5yI64nvRK1tv1Ea9AL0H1Mlyqry7AQgS5d1PcRXiYU9MOj
9eMHwbPyh02erDpaLNZLuawcksp7JmDypG7Wj6ZAw6FUh3YnybFjq+pao5SBb/e4
4xvGxokT0mYhgXkBOL8l+Rarkz4HHmnsuag1YeGP82F8ZnCpDH0mzO4D005vA83D
Xlv0KtbReo0N2zuM8ElShKIiIBaO4gnvsU6Mxf4PaOhPTYh3Q7ubtB4zJ/+JJh7/
O+q5EyXDZnXR+FK65tdzGg3UaaQwGyaAAEhdW8A5u48uxnidwWTKM0QE+eHolHL4
5vpjCOhUsJOeS+8qXyfakKzjpY2E1w==
=02k4
-----END PGP SIGNATURE-----

--OFj+1YLvsEfSXdCH--

--===============3193895756842110903==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============3193895756842110903==--
