Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F97915669
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Jun 2024 20:21:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CABD4847;
	Mon, 24 Jun 2024 20:21:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CABD4847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719253307;
	bh=LMQM4ggkNAmyZtbcQnIjN/xx2r5UXt3+sfPf7Izs3Bo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RaGnjIEi50tSzoBrrXzEpoYqT/lfv1dEGK0TBLspDcoXoraTA170ISrvTia7z1UIt
	 mk2zuohT7rzdNJeNmcqNaoZCkRm5SHbAwhWxQqgrEproqGnuVFkGpsuWc5DSntKPXj
	 1jZ3PYfuzBm/N4f/eWJVjoXQCsJ/0aMueeut9mY0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 98DF1F805B3; Mon, 24 Jun 2024 20:21:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D39F0F805AF;
	Mon, 24 Jun 2024 20:21:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 00FFBF800ED; Mon, 24 Jun 2024 20:14:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6CBF2F80154
	for <alsa-devel@alsa-project.org>; Mon, 24 Jun 2024 20:11:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6CBF2F80154
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=SqMPig+f
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 33DD260F86;
	Mon, 24 Jun 2024 18:11:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9F66C2BBFC;
	Mon, 24 Jun 2024 18:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719252699;
	bh=LMQM4ggkNAmyZtbcQnIjN/xx2r5UXt3+sfPf7Izs3Bo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SqMPig+fKRfPD9amnFFJ2z6A6QAgchFEO6lAZm+DiRbuMGOC5Q5BkfamFOirb5YF1
	 xCqVt1UJ5vPOpIGj4IyP32fpsTF0zsnPpqc9aGs71cmWLO4BAgZspTZ/LnHNNiuv60
	 5cJOKWnohBicmHM2R/p92xtjmlo1naNYnVCwkDFuR77FYc/wNGrxJCaB716g7eR4Q2
	 wOLzEMIVUebf3q0Hq+Be+QKFb0Clk1Be9pCgEXh3I++kEAQ5oObamVdI6WO/8Iy068
	 d2j5J0y5rWXaNy4tNoRnIUKLHaPVBD60O7EGHJ0AmhP7Y4q1AgZmns4TogD2Ek316a
	 RFZRk146j1YsA==
Date: Mon, 24 Jun 2024 19:11:35 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.de,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>, stable@vger.kernel.org
Subject: Re: [PATCH 2/3] ASoC: SOF: ipc4-topology: Use correct queue_id for
 requesting input pin format
Message-ID: <61a68a33-7c65-4b0f-af3b-a258bb1544a5@sirena.org.uk>
References: <20240624121519.91703-1-pierre-louis.bossart@linux.intel.com>
 <20240624121519.91703-3-pierre-louis.bossart@linux.intel.com>
 <ec992bf9-667c-48a4-81ed-3a1232123987@sirena.org.uk>
 <7372501f-0393-4ba5-9e05-71d59dc1449b@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="e4ptfVfnpd/tRlJd"
Content-Disposition: inline
In-Reply-To: <7372501f-0393-4ba5-9e05-71d59dc1449b@linux.intel.com>
X-Cookie: Allow 6 to 8 weeks for delivery.
Message-ID-Hash: G5NILPTTPCQQ4XYTNFBLAUJZ7Y2H7EMP
X-Message-ID-Hash: G5NILPTTPCQQ4XYTNFBLAUJZ7Y2H7EMP
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/G5NILPTTPCQQ4XYTNFBLAUJZ7Y2H7EMP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--e4ptfVfnpd/tRlJd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 24, 2024 at 05:26:32PM +0200, Pierre-Louis Bossart wrote:
> On 6/24/24 14:36, Mark Brown wrote:
> > On Mon, Jun 24, 2024 at 02:15:18PM +0200, Pierre-Louis Bossart wrote:
> >> Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> >> Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> >> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
> >> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> >> Cc: <stable@vger.kernel.org> # v6.8+

> > Please put fixes at the start of serieses, or send them separately -
> > it makes things much easier to handle if they're separate.  This ensures
> > that the fixes don't end up with spurious dependencies on non-fix
> > changes.

> Agree, I wasn't sure if this was really linux-stable material, this
> patch fixes problems on to-be-released topologies but it doesn't have
> any effect on existing user setups. At the same time, it certainly fixes
> a conceptual bug. Not sure if the tag is needed for those cases?

Given the enthusiasm with which stable backports things it's probably
fine, I suspect the device quirks might end up getting pulled back.

--e4ptfVfnpd/tRlJd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZ5ttYACgkQJNaLcl1U
h9DAEwf/ZuByiNrlInuQ8Dol95wy3z5F8WHBuuyD6/CxhHerYx8ICHQRC4/0kZnI
vmE0gKsMi/idFkGE1ZTpBzCMGyrZeAFF2S8J6qDXMg1V1t8q+aZSg69sXUVHdaT3
mnGgJtfeiF7ctTl2GNUB1NOzLpkFaoU19jDBPCJXgUN6sGhzEDNkrqNvrsBFAhBQ
hhtQ2ynn6o/l5rg6kX+fovYG1J1CRr8GeczeJAfcjcALJlwI8ZgJNLf9Wa75q+uJ
TqabyUqoQO9L86BW7TBMJCvun6hMiL9i5JUbF5KcZN9ndAJ0tnHGGhhWp91a0iho
5J0J8jCaXa1bGl+1h1ZzMgRxEvkdtg==
=x3+9
-----END PGP SIGNATURE-----

--e4ptfVfnpd/tRlJd--
