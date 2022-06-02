Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7606C53B903
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jun 2022 14:33:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C73DF173A;
	Thu,  2 Jun 2022 14:32:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C73DF173A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654173212;
	bh=K5d2fzWkeafars2FjYX7WLWLlaG6QuJW6ebRgQiaPD0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PHyM67L81YspCsofVwjQiBxYVm2s29SxEqugKR6MPxxAWFGylnTPiW74be3a/y1DN
	 8hWlJEuTzSpFSw6e6MjSynAcKwgfeYZdL7FbHwd22g6GL8U95GPv5kcy5ATVOqaNTg
	 Em6mI2I9qbc8eGuH331EMY1pgh88E3g0zCvWVpys=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3ECBBF8025E;
	Thu,  2 Jun 2022 14:32:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 41212F80158; Thu,  2 Jun 2022 14:32:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F07B0F80089
 for <alsa-devel@alsa-project.org>; Thu,  2 Jun 2022 14:32:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F07B0F80089
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Q4S80nqp"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CAE2BB81F1B;
 Thu,  2 Jun 2022 12:32:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5378EC385A5;
 Thu,  2 Jun 2022 12:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654173146;
 bh=K5d2fzWkeafars2FjYX7WLWLlaG6QuJW6ebRgQiaPD0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Q4S80nqpCu3EKQVCvsY+GiiGH22u3WQADzdj5TL96l3EnDdKOPIhNAjYjreSJkLli
 1kcDleHYJeWQGJeMxwdw6479bWh0mc0oNaHow98sOKEH/Pxq7srJUnnD43OWdkPAf6
 pH2e2glL7LGiC/PrO0JYywKz4H3DD2P1hHBahOrZHkBOEWMPcf/IoVdDl8MPV8qYKy
 SGH+hAKJ3N4WhlH4LSOnnoj7QvQnF7lid4Pwd8ZvEYB62BiK9N3P4UHuN2V5Nq7Idj
 ZtE4dkq9gSiNM0jdwG1L/8wgBVH3VAEgO32OLQFnlKZXihnSGg91nOLDNO1ljEPyU7
 AYsrMfaDlMHsw==
Date: Thu, 2 Jun 2022 14:32:23 +0200
From: Mark Brown <broonie@kernel.org>
To: Sascha Hauer <sha@pengutronix.de>
Subject: Re: Audio mem2mem devices aka asymmetric sample rate converters
Message-ID: <Ypit14mY/Tx8pgK2@sirena.org.uk>
References: <20220602112106.GO2387@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="CzdiyakCjeeQEUvg"
Content-Disposition: inline
In-Reply-To: <20220602112106.GO2387@pengutronix.de>
X-Cookie: May your camel be as swift as the wind.
Cc: alsa-devel@alsa-project.org
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


--CzdiyakCjeeQEUvg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 02, 2022 at 01:21:06PM +0200, Sascha Hauer wrote:

> How would such units be integrated into ASoC? I can think of two ways. First
> would be to create an separate audio card from them which records on one end
> and plays back with a different sample rate / format on the other end, in the
> v4l2 world that would be a classical mem2mem device. Is Alsa/ASoc prepared for
> something like this? Would it be feasible to go into such a direction? I
> haven't found any examples for this in the tree.

You could certainly do that, though I'd expect userspace wouldn't
know what to do with it without specific configuration.  It also
feels like it's probably not what users really want - generally
the use case is for rewriting an audio stream without going back
to memory, going back to memory means chopping things up into
periods which would tend to introduce additional latency and/or
fragility which is undesirable even if the devices were DMAing
directly to memory.

> The other way is to attach the ASRC to an existing audio card. That is done
> with the existing in-tree sound/soc/fsl/fsl_asrc.c and
> sound/soc/fsl/fsl_easrc.c drivers.  This approach feels somehow limited as it's
> not possible to just do conversions without playing/recording something. OTOH
> userspace is unaffected which might be an advantage. What nags me with that
> approach is that it's currently not integrated into the simple-audio-card or
> audio-graph-card bindings. Currently the driver can only be used in conjunction
> with the fsl,imx-audio-* card driver. It seems backward to integrate such a
> generic ASRC unit into a special purpose audio card driver. The ASoC core is
> fully unaware of the ASRC with this approach currently which also doesn't look
> very appealing. OTOH I don't know if ASoC could handle this. Can ASoC handle
> for example a chain of DAIs when there are different sample rates and formats
> in that chain?

This is essentially the general problem with DPCM not really
scaling at all well, we need to rework the core so that it
understands tracking information about the digital parameters of
signals through the system like it tracks simple analog on/off
information.  At the minute the core doesn't really understand
what's going on with the digital routing within the SoC at all,
it's all done with manual fixups.

If you search for talks from Lars-Peter Clausen at ELC-E you
should find some good overviews of the general direction.  This
is broadly what all the stuff about converting everything to
components is going towards, we're removing the distinction
between CPU and CODEC components so that everything is
interchangable.  The problem is that someone (ideally people with
systems with this sort of hardware!) needs to do a bunch of heavy
lifting in the framework and nobody's had the time to work on the
main part of the problem yet.  Once it's done then things like
the audio-graph-card should be able to handle things easily.

In theory right now you should implement the ASRC as a component
driver.  You can then set it up as a standalone card if you want
to, or integrate into a custom card as you do now.

--CzdiyakCjeeQEUvg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmKYrdQACgkQJNaLcl1U
h9C/Zwf/Z5mkAMjfE8EhvDWiFIHgTYDKrGXUqQruRHZSc0lLP7wEe3z2ztV0SWws
sWA1L+FtHALLWg3wtBpmUvf6ERWDmx9BR5d6PWWjuBgTsg7+PmwBrHbu8TIAyl0y
z0plq3ZN5faLPqzfJHV+K7vAY6AZCki0lygOw73bohY/Z0gNFyLQ0yD1A2wERJGr
OvXzJVXiz1x9pvPh8t0/Yuk3dCWalMILguEneBEYOX6UTYBfzx9T2Qx9SLogQfQm
hAwu9yh0vvm0veyYgPx/FVfvMrKAJNuEa6Pru6P25SQECSNw/NXeNaQutlEzwm5L
haaZQ4aXZSjm5WH6KEwKKfjuTtLdSQ==
=GLWm
-----END PGP SIGNATURE-----

--CzdiyakCjeeQEUvg--
