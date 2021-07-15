Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F1ECD3CA08C
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Jul 2021 16:19:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 69809167E;
	Thu, 15 Jul 2021 16:19:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 69809167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626358798;
	bh=6Tn/bHMMoFMkTpR5Cc+yMgZwnfSPFP99ggxrB8ZaDts=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ayw+3qOWeQ0S3Z3czftlONWBwqCU4cEdu8QetQiL83+MCFdYibvqv4T0BY9SptPU3
	 gZfcbBCTMCMPi3uskUd/0WJIiYAQQpXgB/MTbWiSl5r3FQ5U5gCBrH0eb7AgdB3PPP
	 inyDZAvR+nD1xw2H0qfEl3QxyWjtlmQdmHFSgRMQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BE7AEF80229;
	Thu, 15 Jul 2021 16:18:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2A962F80217; Thu, 15 Jul 2021 16:18:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C9ED7F80095
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 16:18:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C9ED7F80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="lt1+xDmj"
Received: by mail.kernel.org (Postfix) with ESMTPSA id A0B9B6127C;
 Thu, 15 Jul 2021 14:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626358698;
 bh=6Tn/bHMMoFMkTpR5Cc+yMgZwnfSPFP99ggxrB8ZaDts=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lt1+xDmjNlKpUQJ4DVBCaZQXeM4xO/RTBAFX0h0daQaABwztUHGNrS80LLRIpUn8l
 iQ8m83UftbZPLae6PtV/AAQGkX3U81e9NsaT1TAPO583x79IfvzKnHM0XukQozjue/
 datrukQ46KWvo0TpJJddvluztrTKMz4lpMpcozyrBtalAIhW/7/wXvmmg9tLf3ZO7S
 ajHkydWWux7qTJ1xF73x0AX5+U+HET/ghqg6/4fq05QS7zmTmDU0V9jeCF0xJc30Gc
 pvmC5unBHkLJ5EOdPdiG5RGM/L036H8LS75cMFedSEJEK+ea/Zp1wzGusU2RHL63dB
 +Dwt2OqyM7uZw==
Date: Thu, 15 Jul 2021 15:17:40 +0100
From: Mark Brown <broonie@kernel.org>
To: Vijendar Mukunda <vijendar.mukunda@amd.com>
Subject: Re: [PATCH V3] ASoC: add a flag to reverse the stop sequence
Message-ID: <20210715141740.GC4590@sirena.org.uk>
References: <20210708175529.13313-1-vijendar.mukunda@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="NU0Ex4SbNnrxsi6C"
Content-Disposition: inline
In-Reply-To: <20210708175529.13313-1-vijendar.mukunda@amd.com>
X-Cookie: You look tired.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Sunil-kumar.Dommati@amd.com,
 amistry@google.com, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 open list <linux-kernel@vger.kernel.org>, Basavaraj.Hiregoudar@amd.com,
 Takashi Iwai <tiwai@suse.com>, Chuhong Yuan <hslester96@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Alexander.Deucher@amd.com,
 nartemiev@google.com
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


--NU0Ex4SbNnrxsi6C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 08, 2021 at 11:25:27PM +0530, Vijendar Mukunda wrote:

>  include/sound/soc.h                  |  6 ++++++
>  sound/soc/amd/acp-da7219-max98357a.c |  5 +++++
>  sound/soc/soc-pcm.c                  | 22 ++++++++++++++++------
>  3 files changed, 27 insertions(+), 6 deletions(-)

This should be two patches, one adding a new feature and the other using
it.

--NU0Ex4SbNnrxsi6C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmDwQ4QACgkQJNaLcl1U
h9ABpQf/XSip+BC68mqysPaI6+TXiMCNF6fKsG5ZD8dvlFh+bGqRrm+qOG/CHnqd
IjTNrzxysPvNM19HhztFyrUyv0rAETY+4hpOFoOng4MruSnCgMOq0qBj/Xt7cxMU
6mdWVWy9JZdFLzEUrWg6G49yr9LysgwY6HQcUVMrisi+spm6m+IG+YDGTgb5CHG5
wqpatcj2DSoLVeOlZW9BuSZZ8+SXXcE4yy0Zh3Wm6Q7LmTw0GR4uLEoNGeQAl870
vuFXYREMa17MCBSY83f/AWfTGJPHSneO4n3+axyfUEvQ8NKgCmScl78o8lhWi/dg
SAQCw5LHw8j3qOhM7nFWDhAJg9raWg==
=8oKq
-----END PGP SIGNATURE-----

--NU0Ex4SbNnrxsi6C--
