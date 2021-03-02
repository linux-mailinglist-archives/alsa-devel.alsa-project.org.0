Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1E832A82C
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Mar 2021 18:32:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 596CB18D1;
	Tue,  2 Mar 2021 18:31:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 596CB18D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614706328;
	bh=zMsEr7NF02vkcIHVkx/Vs36PXAllyxVlPl3cpejbnoU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PDuMf9MgHPgxEEXcbQALR0J3PJ89QSecu5d/3m/yBawGID/SZ1ps8loHa1aPlLZxF
	 3K8be9bvRAOtyQfytvsvma+AX5a8hvAAF4OadnKRBAPA2QPrYZ/FvuN188jM6PIDjS
	 xeFSSVHY14mu8hp9hjKhVpwiicOVTzZXRFCTsAIg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 973EBF80271;
	Tue,  2 Mar 2021 18:30:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 00547F80269; Tue,  2 Mar 2021 18:30:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8C180F80088
 for <alsa-devel@alsa-project.org>; Tue,  2 Mar 2021 18:30:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8C180F80088
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Vdz68UEf"
Received: by mail.kernel.org (Postfix) with ESMTPSA id DDC0A64F34;
 Tue,  2 Mar 2021 17:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614706231;
 bh=zMsEr7NF02vkcIHVkx/Vs36PXAllyxVlPl3cpejbnoU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Vdz68UEfkqL3qK16PfAG44S7Ef3+Rw01xKKIGTBCtV0a+UFCAAKEXm15pNkdSPTbU
 wHZkW45hj4L+trxZSL3Jrw7Wf8q/G0sBo7CV5SbtE2JaZMDhJCp4XbeXwJRqDurzhT
 y3u/tCM+489GPba1K3pwEaWtr+6G2g7mwN14De0Yu06QmMDeKsrpnmOpCM2pBOA/8c
 YFH1YpVPV4CgUB80V1ysdMxkEb1dMbIqBgfRrXx07XnVr8NrbImTSVVqVgJPxa/v+7
 nGSg8MmXhTrceKigBGHxFpMLj+5iTwWdE/CLFaPY/qvFt0RVMDzQPFv+fLvspMhLGp
 JPVEVuCaQz+IQ==
Date: Tue, 2 Mar 2021 17:29:23 +0000
From: Mark Brown <broonie@kernel.org>
To: Lucas Tanure <tanureal@opensource.cirrus.com>
Subject: Re: [PATCH 10/15] ASoC: cs42l42: Report jack and button detection
Message-ID: <20210302172923.GR4522@sirena.org.uk>
References: <20210302170454.39679-1-tanureal@opensource.cirrus.com>
 <20210302170454.39679-11-tanureal@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="o+ZCuNqY+dEAKBWl"
Content-Disposition: inline
In-Reply-To: <20210302170454.39679-11-tanureal@opensource.cirrus.com>
X-Cookie: Friction is a drag.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 Liam Girdwood <lgirdwood@gmail.com>, David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 James Schulman <james.schulman@cirrus.com>, linux-kernel@vger.kernel.org
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


--o+ZCuNqY+dEAKBWl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 02, 2021 at 05:04:49PM +0000, Lucas Tanure wrote:

> Report the Jack events to the user space through ALSA.
> Also moves request_threaded_irq() to component_probe so it don't get
> interrupts before the initialization the struct snd_soc_jack.

This looks like it should be split into two changes too, one for the
code motion and one for the jack API.  However I'm not convinced it's a
good idea to move the interrupt requesting to the component
registration, in general we should be doing resource acquisition in the
main probe function so things like deferred probe work well - it gets
messy if we try to handle stuff like that in component registration.

I'd have expected the interrupt handling to just be able to check if
there's a jack set, and note that snd_soc_jack_report() supports being
called with a NULL jack anyway.

--o+ZCuNqY+dEAKBWl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmA+dfMACgkQJNaLcl1U
h9CiVgf/dFINDm+6qu7kKJCs0YL6+0f85LIlSpcHaZ9UE5N60AVCnC7jZqbDmygz
j/DhCUDmk6o5G8IU6S1OOD76dLRHO7UMTzTo72DWLPUKfNsceNNZr3D3uNYQ0xNk
1uW01K4kEXwp1xfChstEp/PqJQ86QMiYiAIE8qmm+1vM5NqscS8xLOfmDdUjJwI5
o8U2P8VIJscJ5KKfLUzyJ55AtYwl88WfeLTjDCvn8fSHF/X5HghO58HfomWfXDkm
KSNmGBbnKmxVSBxxSapAjvLD8HMChpuis1ulxZMh5MiocoAiRVtRaRG6WrTZ2ToM
nXb5LftNZQTx7+Dqet0CIsGxBdK3EA==
=Ov94
-----END PGP SIGNATURE-----

--o+ZCuNqY+dEAKBWl--
