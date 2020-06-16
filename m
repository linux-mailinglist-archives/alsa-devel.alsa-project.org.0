Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D361FB514
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Jun 2020 16:54:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 41D30167A;
	Tue, 16 Jun 2020 16:53:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 41D30167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592319283;
	bh=o0Bhg6+CdsjgFDzC6GZL1NJgiQTDPMtCUhAd0vdksSw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Sp016YADRISLByqdy0w1uAIAwPbcv3vnDy1SHUxSEds2L8PNZbW+DstLkUuU1ohJ/
	 rWDXBYHOb3TnbVaN5SsyE4TdwwThjernQfzYPRRaUYUk2vlUuGUYs57jYBubeu6kKJ
	 JwqU7xV54ar+j7HuzFO0wwqBKC+K/NLyvPrSw38w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4BFD4F80232;
	Tue, 16 Jun 2020 16:53:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1981DF8022B; Tue, 16 Jun 2020 16:52:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 66F9FF80101
 for <alsa-devel@alsa-project.org>; Tue, 16 Jun 2020 16:52:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66F9FF80101
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="yS4ku52I"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3A82C20679;
 Tue, 16 Jun 2020 14:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592319173;
 bh=o0Bhg6+CdsjgFDzC6GZL1NJgiQTDPMtCUhAd0vdksSw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=yS4ku52IvXbM/Et+Ox3vxRA5LQDWhSZ7H1iBMIajdL0K1SLYSNgftlCF31s7DFKVc
 lFINNO5Ax4ui4wSiRg/Q5Mu9quROOTGJ8+8x4jIZ86iM2PKCa10S+c6+w5AGL/cawC
 nalDGd7dOkQONTIqNJz0ZTZLrN6IIVkbmg22B8wo=
Date: Tue, 16 Jun 2020 15:52:51 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 1/4] ASoC: soc-pcm: dpcm: fix playback/capture checks
Message-ID: <20200616145251.GO4447@sirena.org.uk>
References: <20200608194415.4663-1-pierre-louis.bossart@linux.intel.com>
 <20200608194415.4663-2-pierre-louis.bossart@linux.intel.com>
 <20200616085409.GA110999@gerhold.net>
 <20200616090210.GA111206@gerhold.net>
 <254a667e-fa49-240a-6386-7e82df8e5c35@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="/7YWha3R2g8GjXQ0"
Content-Disposition: inline
In-Reply-To: <254a667e-fa49-240a-6386-7e82df8e5c35@linux.intel.com>
X-Cookie: Offer may end without notice.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 alsa-devel@alsa-project.org, Stephan Gerhold <stephan@gerhold.net>,
 tiwai@suse.de, Daniel Baluta <daniel.baluta@gmail.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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


--/7YWha3R2g8GjXQ0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 16, 2020 at 09:23:25AM -0500, Pierre-Louis Bossart wrote:
> On 6/16/20 4:02 AM, Stephan Gerhold wrote:
> > On Tue, Jun 16, 2020 at 10:54:17AM +0200, Stephan Gerhold wrote:

> > > For the QCOM case it may be feasible to set dpcm_playback/dpcm_capture
> > > appropriately because it is basically only used with one particular
> > > DAI driver. But simple-audio-card is generic and used with many
> > > different drivers so hard-coding a call into some other driver like
> > > Srinivas did above won't work in that case.

> Doesn't simple-card rely on DT blobs that can also be updated?

DT is an ABI just like ACPI - it's just more featureful.  Many systems
can easily update their DTs but not all of them and users don't always
want to try to keep it in lock step with the kernel.  Stuff like this is
why I've been dubious about putting DPCM things in there, it's too much
of a hard coding of internal APIs.

--/7YWha3R2g8GjXQ0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7o3MIACgkQJNaLcl1U
h9C6Iwf8DqtSXDce1saLgZazB9BSuYfGkxJTspLp32b773ihq774v2YXBPIjrBNl
fAqFCqGIkvEKm3cQUds5a8zb0+IXuaeCwezGqV0p7mbi/QnA5XbUrR61Z7J22swi
Rm7US4OYQXmhx8VGmbpqsAkG/pf/WzcDXTbc/ngqTOq5Fd9MEWWGc4EJLW62Dq0I
MiTo/QopRpt+QhvtT655FXEKZohDylfgxEQBSuWiyXIfljSGLdQyn+3BGIVaxKzA
3q4jOJ5mHmtWN7Z/z2Qjb5yoQQJim8xFvOq709myh204F3sM5LB4Z+EdsTRlJQ67
GWEpPbBAtuvTLeWT8HX8hNBTQxtlCw==
=N9Bg
-----END PGP SIGNATURE-----

--/7YWha3R2g8GjXQ0--
