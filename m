Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D866B49B508
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jan 2022 14:27:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 739002260;
	Tue, 25 Jan 2022 14:27:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 739002260
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643117271;
	bh=QHLElnKoEhZujfeGg/NDhuyoyaeuEjjwfm1pV1vK82E=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EkVE/2tvdOfVfo+/b3pb5TzT4GQSTjLGnMPTCdPeL5TjiTiL0EMOxeUt+iy8reANW
	 4NoRQgjLLNMB4iqd4qc3RCHuYwSHFaNkzN7d4cvn6spjrd4+BsHk7bkjE+zn+pmhoQ
	 7rGwRQOHXAb1wRN9W9dI+EAbpFRvf/mbFh38OY5g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CAAFAF80516;
	Tue, 25 Jan 2022 14:25:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9CBD1F80516; Tue, 25 Jan 2022 14:25:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 46E00F80516
 for <alsa-devel@alsa-project.org>; Tue, 25 Jan 2022 14:25:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 46E00F80516
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="fhh+RUnB"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A5E4961465;
 Tue, 25 Jan 2022 13:25:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FFADC340E0;
 Tue, 25 Jan 2022 13:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643117132;
 bh=QHLElnKoEhZujfeGg/NDhuyoyaeuEjjwfm1pV1vK82E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fhh+RUnBoBzATV8y5VtJLYsrHC7vVv0jgR9eOOLYEOP3VFGhCGLxema89s5gsrKbK
 dsJckfVtxRt0SFA7M9187T/mWW0WpqTiqZDQnXyqvisGkCQi6a/S0tJdyPNcdcLbb2
 t1PkZN0KzTTaFUHhiN5jGLgAbgpfM0kWFq+10+A23OFeYz6DUrflfRyVFG+/UlCori
 TtrR/cVOqJR9ZfhXA8k9L533JdGtLT/1D3MH/UeZgU4fGOV0Q75OgGURQGu8s0xmVg
 1aR8pAAhvqZI3whD66mM+yI56hi3QlO2mO354/fjgdYUb4XkLNsuaqBC4eCGgRwJSJ
 TKtgl9oGA0ANw==
Date: Tue, 25 Jan 2022 13:25:26 +0000
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Re: [RFC 00/37] ASoC: Intel: AVS - Audio DSP for cAVS
Message-ID: <Ye/6RhSOlmZmhnND@sirena.org.uk>
References: <20211208111301.1817725-1-cezary.rojewski@intel.com>
 <YcXFwTmP6k1Zfbw9@sirena.org.uk>
 <fecf5a0a-c2b6-f4a0-b4b1-d8243ea324a0@intel.com>
 <c5315ea0-2f44-069f-fb17-abda87766157@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="m7xe1mGM6EaXRa0z"
Content-Disposition: inline
In-Reply-To: <c5315ea0-2f44-069f-fb17-abda87766157@intel.com>
X-Cookie: The second best policy is dishonesty.
Cc: alsa-devel@alsa-project.org, upstream@semihalf.com, harshapriya.n@intel.com,
 peter.ujfalusi@linux.intel.com, rad@semihalf.com,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 ranjani.sridharan@linux.intel.com, amadeuszx.slawinski@linux.intel.com,
 cujomalainey@chromium.org, yung-chuan.liao@linux.intel.com, lma@semihalf.com
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


--m7xe1mGM6EaXRa0z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 18, 2022 at 10:42:08AM +0100, Cezary Rojewski wrote:
> On 2022-01-06 2:39 PM, Cezary Rojewski wrote:

> > Your comments and review is much appreciated. While we did separate the
> > series into chunks, I'm keen to agree we could have moved a little bit
> > further with the separation. Below you'll find the list of patches and
> > my thoughts after taking your feedback into consideration. There's also
> > a TLDR if there's not enough coffee in the pot to cover the summary.

> Is the proposal described in my previous message acceptable on your end
> Mark?

Your mail was very long and I've not yet had a chance to go through it
properly yet - I was on holiday last week, and just after the merge
window is quite a busy time.

--m7xe1mGM6EaXRa0z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmHv+kUACgkQJNaLcl1U
h9AL2wf8DzG+J0XqQIPkdAA94CvJyZs0KWJPEo+LU38jXcW40UV//rneqA7fl9tZ
S7hPtF9UFBPVVA7ARu9xXCgELQMbeF3oybv4ZhK4FfAJMvrQlzfJ54lnbr7L7nq9
B7h90HwISKF6MTbW6fkLYKc2v+Cgx2DprZJ165BUdevBSKrPyTuOqM40aucz7FxZ
wqFLAkbUJSab9VZAfSBdG12c6iHwKGwviF8D6AF5AUMu2BEw6oOAhqCjkmpgC44a
Jg/93XIe/fjwT/eeMfZBfGRpjWh14qiLJCRP+grbMp3rb61XpeYSBaWJIjDQAGgt
J3zQArqaMCwKmdfkLMVDI9Du2fctbw==
=ArD1
-----END PGP SIGNATURE-----

--m7xe1mGM6EaXRa0z--
