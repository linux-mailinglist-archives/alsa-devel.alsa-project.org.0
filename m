Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1523E46DA65
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Dec 2021 18:53:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A64C025C6;
	Wed,  8 Dec 2021 18:52:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A64C025C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638985991;
	bh=CQyllldqUe3sZMM+raaViUfgVi189mi0EE42YGu8z14=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RHFyqIUwPY/mbqzzzQ3K8iqVqzJRdmSpuSONvZCZ+a5410QgXgT98Vq//uWQjKtNF
	 wYu9tthGp50NPBH7n6WcvaSdhvn1QEgAumTEz60EA0LNkaDwK7Bw+lLsyVf9g3polq
	 /USbHCJm9jJ4aprVbkh44kvrJUtXSxLV+E8qKP24=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F0D2F804EC;
	Wed,  8 Dec 2021 18:52:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5FAFBF804E5; Wed,  8 Dec 2021 18:51:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_14,PRX_BODY_72,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 94AC5F80103
 for <alsa-devel@alsa-project.org>; Wed,  8 Dec 2021 18:51:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94AC5F80103
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="GYI18wol"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 7E4E1CE22A7;
 Wed,  8 Dec 2021 17:51:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAA98C00446;
 Wed,  8 Dec 2021 17:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638985908;
 bh=CQyllldqUe3sZMM+raaViUfgVi189mi0EE42YGu8z14=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GYI18wolvRbbQcT/NeBTv0fC0vSJMSeB3KFv3mcZxmYWQJcdn8SCPW9H+zTZ5Rs9z
 93DM+wPS9tY/CsYva1eHvEYyRwAhdZVxFwTVAUqY5UGc2A+1ZSiJfwB5amdsGlwk22
 A6awebHmmHNBU7acdEeTWnZfLTzjQWoywb3YS7AU/ur3vKgC3tsSM/NRL6Tv+vUzlE
 PYs2W28Xd9Lb6t8OIbXrKOwN4dPU2uWpWdyZZ/ofKOrJF6nqQspfJT2js8VBl5tcyT
 vilxUinuMeCiDVPxz2X/gqCfqt72TZyHWbISEGqRTDFauwSPPBo4nWOTMFcb8ry+oz
 uCvP91GE13RpA==
Date: Wed, 8 Dec 2021 17:51:42 +0000
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [RFC 00/37] ASoC: Intel: AVS - Audio DSP for cAVS
Message-ID: <YbDwrkw7BbIoc1H3@sirena.org.uk>
References: <20211208111301.1817725-1-cezary.rojewski@intel.com>
 <59681534-aeee-003b-0fea-af17503bb813@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="rlK4yh087kkOf+91"
Content-Disposition: inline
In-Reply-To: <59681534-aeee-003b-0fea-af17503bb813@linux.intel.com>
X-Cookie: Alex Haley was adopted!
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, rad@semihalf.com,
 upstream@semihalf.com, harshapriya.n@intel.com,
 yung-chuan.liao@linux.intel.com, tiwai@suse.com, alsa-devel@alsa-project.org,
 hdegoede@redhat.com, ranjani.sridharan@linux.intel.com,
 amadeuszx.slawinski@linux.intel.com, cujomalainey@chromium.org,
 peter.ujfalusi@linux.intel.com, lma@semihalf.com
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


--rlK4yh087kkOf+91
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 08, 2021 at 10:27:43AM -0600, Pierre-Louis Bossart wrote:

> @@ -0,0 +1,24 @@
> +What:=09
> /sys/devices/pci0000:00/<dev>/<tplg_name>/<path_template>:<path>/<pipelin=
e>/state

> That was my biggest worry in internal reviews, I do not see any
> rationale for exposing an interface to userspace to modify pipeline
> states. I believe the intent is to have a follow-up series on this
> topic, but it's not clear what problem this is trying to solve. There's
> a fundamental disconnect here as to why the kernel driver could not
> control states on its own, and it begs the question if the 37 patches
> actually work without this odd userspace interface.

If it's mainly used for debugging then it could be exposed through
debugfs with less worry.

> b) the concept of 'path' is totally specific to this driver and will not
> be used by any other Intel solution. The notion of having more
> flexibility in dynamic reconfiguration of a pipeline, e.g. to avoid
> instantiating an unnecessary sample-rate conversion, is on paper a good
> one and is used in Windows solutions, but in practice all the existing
> end-to-end integrations in Linux/Chrome do require fairly static
> configurations with fixed sample rates. In other words, it's debatable
> whether any end-user will see any benefits in terms of
> experience/power/performance, and the added complexity is handled with a
> custom solution instead of improvements to DAPM/DPCM - which as we found
> out does need significant love to support multiple streams being
> mixed/demuxed. At the ALSA/ASoC level, I believe we have more important
> priorities such as the notion of 'DAPM domain', constraint propagation
> and hardening for complex use-cases, and improvements to the pipeline
> handling shall be done at the framework level, not the platform-specific
> driver level.

I've not meaningfully looked at the series yet (it's quite large!) but
commenting generally I do agree that if we're adding interfaces offering
detailed control of the digital domain we should be doing this at the
framework level - it's a common problem affecting a bunch of SoCs and
some CODECs too and it's only going to get harder to address in a
generic fashion if we add per driver interfaces.  On the other hand if
there's good interfaces that work for people in practice with driver
specific implementations perhaps they can be adapted to be more generic.

> I completely disagree with Cezary and his management's decision to float
> 37 patches upstream as RFC, with more coming. This goes against
> everything we've tried to do in the last 3 years to improve Intel's
> standing. I don't think it's right to ask for feedback from the
> maintainers and community when internally we were unable to make
> progress. What can I say other than 'this is really sad'.

> The work in the SOF driver will continue regardless of what happens with
> this patchset, which I am not going to comment further on.

This is obviously not ideal, I would like to have a consistent view from
at least Intel about the direction this is heading but I understand that
this might be difficult to achieve in such a large organization.  Input
=66rom users like the distributions and PulseAudio/PipeWire is also very
important here, they'll face a lot of the complexity and hassle from end
users.  What conversations have been had thus far?  I guess ChromeOS is
going to prefer some combination of sticking with what it's got for
stability and transitioning to SoF for control of the firmware?

I do see that the code is using snd_intel_dsp_driver_probe() so we
should be able to manage any transition between implementations here,
though for that to be fully effective we'd need to be able to build both
=66rom once.

--rlK4yh087kkOf+91
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmGw8K0ACgkQJNaLcl1U
h9AbvAf/fUbvQXyvXD71FjuUlEnd0Xq+wFy8BA1Y6POBMyyJjPoOybjiQetl4UHl
0OkOzZi9kY5iAbfnmue6mXdIU7pyin0GrwUqjKgUzXhbGqXe6q3yhHK/rrTvc/IC
E/n+nAleeCvnIOzg+YYesi3gXXRV+nUDRc2okv65KJZG4hLpghS1KraU2R+LiZot
Zt+gf1YcJUtOxpGaDzmGwwhoWDHkTVGkA30R3pqB0eu+zgOJ0IMZTCgKzPfH+gcR
E1OAfHQlyR/F/1zt7a7IEfr+uFBl6NuMgGVeWB5dDXr+MWryvwUnTzWN0Daa1nzy
Dz9GSK3ln1/ZYVb798Ph18t4iz8KwQ==
=kDqI
-----END PGP SIGNATURE-----

--rlK4yh087kkOf+91--
