Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 706D6124623
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Dec 2019 12:52:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F01A31615;
	Wed, 18 Dec 2019 12:51:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F01A31615
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576669944;
	bh=dn9AThII9ytKWUYzrltMuIAUx1qScuGVBidehAMDqMg=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=s2xYx5uS6HrQt+fjtDyZmyV3WZJcXLBy28Aq+LUclLFcmpdIH9uEbjM8sqgU0pjeu
	 O9yFpFkkT72oukTabkH36H89rK8r6r60mCPYJ+ucRHjx87sNOtexAi7RtVu41JJxC4
	 ixSwtIqiupEsj1kk/PD1sLeMLjt+gqOc5Kj7UEdA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 50845F8022C;
	Wed, 18 Dec 2019 12:50:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2380EF8022C; Wed, 18 Dec 2019 12:50:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 90A32F80059
 for <alsa-devel@alsa-project.org>; Wed, 18 Dec 2019 12:50:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 90A32F80059
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8ADD430E;
 Wed, 18 Dec 2019 03:50:34 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 091F93F6CF;
 Wed, 18 Dec 2019 03:50:33 -0800 (PST)
Date: Wed, 18 Dec 2019 11:50:32 +0000
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20191218115032.GC3219@sirena.org.uk>
References: <87woavhhfi.wl-kuninori.morimoto.gx@renesas.com>
 <87o8w7hhds.wl-kuninori.morimoto.gx@renesas.com>
 <01e4157a-d4b7-8bb2-d3bf-957d47e3e5f9@linux.intel.com>
 <87lfrbhajp.wl-kuninori.morimoto.gx@renesas.com>
 <87k16vh8d6.wl-kuninori.morimoto.gx@renesas.com>
 <20191217121308.GC4755@sirena.org.uk>
 <124fd50c-db99-7a4a-9e35-ad69b5e16abc@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <124fd50c-db99-7a4a-9e35-ad69b5e16abc@linux.intel.com>
X-Cookie: Power is poison.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [alsa-devel] [PATCH 6/6] ASoC: soc-core: add
 snd_soc_stream_stop()
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
Content-Type: multipart/mixed; boundary="===============8016553187941923391=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============8016553187941923391==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mvpLiMfbWzRoNl4x"
Content-Disposition: inline


--mvpLiMfbWzRoNl4x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 17, 2019 at 07:56:28AM -0600, Pierre-Louis Bossart wrote:
> On 12/17/19 6:13 AM, Mark Brown wrote:
> > On Tue, Dec 17, 2019 at 01:41:09PM +0900, Kuninori Morimoto wrote:

> > > Can we use snd_soc_dapm_stream_stop() for these, too ?

> > That does seem like an oversight...

> What would the rationale for deferring a FE shutdown though?

> IIRC in the Intel machine drivers we only use .pm_ignore_downtime to
> backends to keep some clocks on, and even that is questionable (the clock
> dependencies should be properly modeled instead of hidden with an obscure
> dailink setting). When I asked why exactly this flag was set in most cases
> the reason why 'because others did so in the past'...

It's there as a hack to keep clocks live or to avoid pops and clicks as
the datastream goes to zero during shutdown if the CODEC doesn't support
mute or otherwise handle the input going away cleanly (which is just a
more general case of keeping the clocks live usually).  You'd do it for
front ends as well to make sure things are consistent.

--mvpLiMfbWzRoNl4x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl36EocACgkQJNaLcl1U
h9CTfwf8C0b0qJ0PzxqTHM8nI57pG3y1kApCIRAPoQK6pCvi9d3JLPYnSDzMctEA
dFLVwfxmVUa8/b+EoKgKegL7ntWmF7zGHm6vb9KCcQSC/Czm91Rp1/ugItEnEcWf
P1AFUDjW4kgiYyTvpfchh1U/TD+fIRE24H/AX6mAkx6wAzd7Wsk5p3oihRstoO+z
ukKdWKsKZOOTPDw6cxTlpPtoZIdXSjXVFNI8M+OGWpZMj7q+hgkCkbFi6RBIPi/Q
8PXVw1Sox7HHd5Qc23FbnPc7Jm57DRdZZE5Kjk8z12H25gRmX6cW0mQJFq6q+bxi
zVWgPDBnHH38omWDpwycrtWqJjgH7A==
=H9bI
-----END PGP SIGNATURE-----

--mvpLiMfbWzRoNl4x--

--===============8016553187941923391==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============8016553187941923391==--
