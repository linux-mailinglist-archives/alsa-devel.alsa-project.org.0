Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F4090234952
	for <lists+alsa-devel@lfdr.de>; Fri, 31 Jul 2020 18:44:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 85A791667;
	Fri, 31 Jul 2020 18:43:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 85A791667
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596213868;
	bh=IHs1Gy2eQqx3hUYseGXeXPwN9kh746iSmm5M2Zufh3I=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UvfcC9rirqCLratKg7qshCtOfQwWtv4NUzTAZsPTxpMO0UMTvi0m1j6dr2K1A6c5N
	 oa/nBKkRMKWBWfSndTP3zYq+eb/Vl7N+81GSKCnKrjtsrlQEQrR5q8SVYe2UXjVAaE
	 bHVGncg29HTg+ofri+z6rm1WjIScEax+NcN1lDDI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8ED15F80111;
	Fri, 31 Jul 2020 18:42:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 98F82F80171; Fri, 31 Jul 2020 18:42:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B83B0F80111
 for <alsa-devel@alsa-project.org>; Fri, 31 Jul 2020 18:42:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B83B0F80111
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="BZ/IQ65k"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B60C821744;
 Fri, 31 Jul 2020 16:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596213752;
 bh=IHs1Gy2eQqx3hUYseGXeXPwN9kh746iSmm5M2Zufh3I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BZ/IQ65konpkGC1wadZ8q0V+e/CYsWHgatFvRtmrlSxbixuqouTkwZsnvI9OsdMGD
 1qHq4Zmb2LNqSj0FEFIS5Bq89wG/0Gn2KOCxdbEyfa4TPKowf91bibs1HgZsCJDtiZ
 0hAgIUTpGl05KUYFQflvzxcQgymhxUWa82YJVDl0=
Date: Fri, 31 Jul 2020 17:42:11 +0100
From: Mark Brown <broonie@kernel.org>
To: Lars-Peter Clausen <lars@metafoo.de>
Subject: Re: [PATCH 0/3] ASoC: core: Two step component registration
Message-ID: <20200731164211.GB4510@sirena.org.uk>
References: <20200731144146.6678-1-cezary.rojewski@intel.com>
 <1828f3a2-f198-e6cd-ca6c-c66dc1ef82d1@linux.intel.com>
 <61faef6e-70e9-5574-5f3a-e333d0a71617@intel.com>
 <a6d3e9fb-4aa2-b75b-4535-037edb256112@metafoo.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Yylu36WmvOXNoKYn"
Content-Disposition: inline
In-Reply-To: <a6d3e9fb-4aa2-b75b-4535-037edb256112@metafoo.de>
X-Cookie: Some optional equipment shown.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>, olivier.moysan@st.com,
 alexandre.torgue@st.com, alsa-devel@alsa-project.org, tiwai@suse.com,
 arnaud.pouliquen@st.com, lgirdwood@gmail.com, mcoquelin.stm32@gmail.com
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


--Yylu36WmvOXNoKYn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 31, 2020 at 05:58:00PM +0200, Lars-Peter Clausen wrote:
> On 7/31/20 5:47 PM, Cezary Rojewski wrote:

> > Patchset targets entire ASoC framework, not Intel catalog. As
> > _initialize and _add are already in place, having a two-step
> > registration is cohesive with other "frameworks" e.g. device one.

> For what it is worth, I think this is a sensible change for the outlined
> reasons. It's something I've always had in the back of my mind, but there
> was never enough of a need to actually do it.

Yeah, it's a common pattern in the kernel and someone might want it so
there's no great reason not to do it.

> One change I'd like to see is the addition of snd_soc_component_alloc(),
> which combines the step of kzalloc() and snd_soc_component_init() as these
> will be done pretty much always in lockstep. And it also matches the APIs
> that other frameworks offer.

That'd be good.

--Yylu36WmvOXNoKYn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl8kSeIACgkQJNaLcl1U
h9C63Qf/WuZoonGanky6ar3rcnyaw8zYmZ9Dq+tV0cmr6kKic1pI+6e46a60bsxd
p1xbgS6b27gSruRomGid+PSULgNm/lNAaG7UptgcOFWOBGfzAvDqeTP9vFI+eWDM
hNBE8t0OtCP/du2zU/Gzg5rWuBtfbUI6T8Ekm/TQb/aYGDfqna0w4FcFJ355Tr3S
omRMXry/wil/JTVMCrS0nMrf8SO86NDjrrQ8yxMPJig9ezgdi+AvYAOX7vJ80OlI
7asU7DJGB24iMenvgXQjEwQ8h4lTIElm3fZ6lJGZ7hjig0j9GUgu02id2h2oHz8z
q/kNz1j5oh/wbmG1cKFNXcXIeWekrw==
=F6E+
-----END PGP SIGNATURE-----

--Yylu36WmvOXNoKYn--
