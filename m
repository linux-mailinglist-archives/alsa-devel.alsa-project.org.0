Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B70B477334
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Dec 2021 14:32:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA0FB1F18;
	Thu, 16 Dec 2021 14:31:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA0FB1F18
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639661533;
	bh=49Z6wFi4YNUCTmFU5vkrqttrjiblP0wsp+lNNiakJQk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DG++nIq4LnfFQ15b+QCI1sR2V3iTR/XyXxRV4YvnOVUPMfhIfMjynIgvejSxTjTVu
	 jsao2rFDMKTSXQdY25Rv+iwBEqhXeZdFWVp1DaOVu6SDOjXMJ/CcVCAx8HfMrsQ6j2
	 pL3XlfwbTF63MHldYJ4+qdYfiU5K31Y7f7qIbGRw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2EAE2F8015B;
	Thu, 16 Dec 2021 14:31:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B72C6F8014C; Thu, 16 Dec 2021 14:31:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B2880F800DE
 for <alsa-devel@alsa-project.org>; Thu, 16 Dec 2021 14:30:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B2880F800DE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="QHi+UVii"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9DB4061DF0;
 Thu, 16 Dec 2021 13:30:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BE70C36AE5;
 Thu, 16 Dec 2021 13:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639661456;
 bh=49Z6wFi4YNUCTmFU5vkrqttrjiblP0wsp+lNNiakJQk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QHi+UViioPPW6PNkWMgsBFoBf/ETYKdd3BMxkIZCdufE5LSGQGS4otPLLq9NPDtwD
 +xapfBSoXDYcbsdIrzzXwcUwlrlv135Q+2ezM3ibIwKImjoa0UENpi8NC3HgjJ2/R3
 MUD/m7UzZnBZHkyiOq+bmgEiuLoIeDLcgQzNfgu6RDsgMrkkoco2FWh/Uw32UVcgEE
 nPz/Q1jF2xS84IcAWLQPIPqJ5GLMJ9wgUVEChh2Fj+QcvaNWUlXsuUoMjD2zaqmpp7
 Ptcx1QEZBYzaRR5kbdQG6PSv0RTJeIhuko+s05GOuKse/NL9UtCLJCUyI59eyUaUa0
 dczhfrGJu0cQA==
Date: Thu, 16 Dec 2021 13:30:51 +0000
From: Mark Brown <broonie@kernel.org>
To: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
Subject: Re: [PATCH] ASoC: max98357a: Add mixer control to mute/unmute speaker
Message-ID: <Ybs/i3Lg9VN0d4kg@sirena.org.uk>
References: <20211208185850.1555996-1-AjitKumar.Pandey@amd.com>
 <YbETxcwa83U8WXTO@sirena.org.uk> <YbEYVq+uvIcoxqko@sirena.org.uk>
 <3ec805fc-07cc-6091-551a-771dffe459d0@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="v2TZdMJ+b8CyeONp"
Content-Disposition: inline
In-Reply-To: <3ec805fc-07cc-6091-551a-771dffe459d0@amd.com>
X-Cookie: No solicitors.
Cc: alsa-devel@alsa-project.org, Sunil-kumar.Dommati@amd.com,
 open list <linux-kernel@vger.kernel.org>, Basavaraj.Hiregoudar@amd.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Vijendar.Mukunda@amd.com, Alexander.Deucher@amd.com
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


--v2TZdMJ+b8CyeONp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 16, 2021 at 05:54:45PM +0530, Ajit Kumar Pandey wrote:

> Thanks for suggestion. We tried using SND_SOC_DAPM_PIN_SWITCH() for the
> speaker widget and it invoke dapm_event callback based on switch i.e
> max98357a_sdmode_event() but codec driver isn't enabling/disabling gpios in
> such event callback instead they are doing that in dai_ops trigger callback.
> In our platform single I2S controller instance (cpu-dai) is connected to two
> different endpoints with a single PCM device, hence we want to switch or
> enable/disable output based on Machine driver controls only.

DAPM should cope perfectly fine with this setup...

> Initially we thought to configure gpio within sdmode_event callback but
> there was some pop noise issue reported in one platform with that change
> hence reverted. Check https://patchwork.kernel.org/project/alsa-devel/patch/20200721114232.2812254-1-tzungbi@google.com/#23502085
> So we thought of exposing a mixer control to enable/disable amp from UCM
> in our platform without breaking existing functionality. Please let us
> know any other alternative way if possible.

Whatever is going on this should be managed from the driver rather than
having a direct control, especially given the issues I mentioned with
there being zero coordination between this and the management that the
driver already does.  You could have DAPM controls set a variable and
coordinate with whatever you're doing in the pcm_ops, I'm not clear what
the use case is for having the manual control TBH.

--v2TZdMJ+b8CyeONp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmG7P4oACgkQJNaLcl1U
h9BGLgf/QrD75IeSRsyIplUF5g81WOZxgP3BPYqnddbQW7NMYJtmvJ4hlDTs4uHt
26td84vJTxIlDxNfXLVilgTDtt3SSP5lcFwh61S/reqVz2GLNXKkMzF1MX70O/ti
FGiNQefrG+EcB4EWMqbb/327+cC4nPDRx0Axt8FVdrxnMWL50vFHlo+U80FFGsP/
xAt3TGWjLdQO3AYLk4rF/OLoCWGg297Xk/7JLT84oo98h5VPChyVKLLDHqiqNaa2
X23TfiGxK8+Vfe4WLfVpFGSaFXkTWcCQmBGybSfZY8Y6PN0gm483m3VE+Y6R0JY6
oVBaIJ7yNcKkPTk59SEgHCzqzLQi5g==
=wPBI
-----END PGP SIGNATURE-----

--v2TZdMJ+b8CyeONp--
