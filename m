Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D10C777042C
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Aug 2023 17:16:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 30F667F8;
	Fri,  4 Aug 2023 17:15:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 30F667F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691162183;
	bh=Ii4vnBXTV2fHEPMlaYmSPimAc/CJV6bzlx+PJEIBBDw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SUhgTTG2uX03v55Flz3H7Bsc0EY6LThgodo8hPe07C6EyUTTFsrfR1OvaLKpKxKIc
	 GOUTaJoasqeB0Q8OqJ9hMq7dBroJH4e2KsbJIIynB3rV2j+irL8R7V4H0w4A6pkHrk
	 UN0fBhzdHVHYGdm1narq/BTMULOFpnMciguUAlko=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8F448F801D5; Fri,  4 Aug 2023 17:15:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2134DF801D5;
	Fri,  4 Aug 2023 17:15:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3E887F8025A; Fri,  4 Aug 2023 17:15:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F3F2BF8016D
	for <alsa-devel@alsa-project.org>; Fri,  4 Aug 2023 17:15:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F3F2BF8016D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=RWFZ6z3u
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9A5486205C;
	Fri,  4 Aug 2023 15:15:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2B8FC433C7;
	Fri,  4 Aug 2023 15:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691162119;
	bh=Ii4vnBXTV2fHEPMlaYmSPimAc/CJV6bzlx+PJEIBBDw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RWFZ6z3u+etkHNQ6bj4QyAH+u2pvHnKHt/BVBAOY1g2CDK2CGQ9Z8LEc10YDEweeG
	 +WBUq8+euq5CSnep2tJCjcKT2E82912gMuIwPs1WeDnNnJLvaqidoa1O6/txcpq7S6
	 OQHCKKw5fdCdjP3DEU/C1fmwFeyQgb3MqnPFGd/1b0R+ZwzG95lOg1rqi7Jcew1/Py
	 PnPaBeInkp7idBCp6vvlY9VJE4wBGKnZdcSlowPA2GqFHhM8jaHyr765quRfHyrCQy
	 nbNTo4Q6v7dcxnI4AgwjH2RbNM1tJ7/2kpfNYLUF+FCM/3xI7Uxg/iIh16YhhKUVmd
	 CAjv5vphHs7/w==
Date: Fri, 4 Aug 2023 16:15:14 +0100
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH] ASoC: lower "no backend DAIs enabled for ... Port" log
 severity
Message-ID: <c320a2f8-7e53-4e51-84b9-9e7763ce1541@sirena.org.uk>
References: <20230804132628.302385-1-hdegoede@redhat.com>
 <63eec3cf-ebba-a366-a66b-34daf76bc0f2@linux.intel.com>
 <878raqq36t.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zLGtIDBKqv2LU7pT"
Content-Disposition: inline
In-Reply-To: <878raqq36t.wl-tiwai@suse.de>
X-Cookie: I'm hungry, time to eat lunch.
Message-ID-Hash: 2IYCA5ZN426SVR56AENL26CPJMAZITOT
X-Message-ID-Hash: 2IYCA5ZN426SVR56AENL26CPJMAZITOT
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2IYCA5ZN426SVR56AENL26CPJMAZITOT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--zLGtIDBKqv2LU7pT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 04, 2023 at 04:42:34PM +0200, Takashi Iwai wrote:
> Pierre-Louis Bossart wrote:

> > > And also changes _soc_pcm_ret() to not log for -EINVAL errors, to fix
> > > the other error. Userspace passing wrong parameters should not lead
> > > to dmesg messages.

> > Maybe, but it's a questionable flow if pipewire tries to open stuff
> > without the mixer values set-up. Is there something done about this?

> I think it's an oft-seen problem when user runs the system without
> installing a proper UCM profile.

Yeah, it's really easy to do.

> > It really makes no sense for userspace to try and open devices that are
> > known to be problematic. We can push kernel error logs below the rug, it
> > doesn't make the programming flows better.

> Downgrading the message also hides to show what's wrong there.
> Although the message doesn't indicate how to fix the problem, no
> message would make debug harder.

> So in general I agree that it's annoying and it should be fixed, but
> hiding all as default can be bad, too.  Maybe we can introduce a
> counter and shut out after three strikes?

Hrm, do systems typically filter out debug logs?  Most of the systems I
work on do still log debug logs, they just only include them in dmesg by
default.  There are ratelimited printk APIs which we could use, though
they're not quite ratelimited enough for this I think.

--zLGtIDBKqv2LU7pT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTNFgEACgkQJNaLcl1U
h9AguAf+ID+SZIufh/n1hId+HPgRfjfo3VdJ1FMJTt7mG/yN5hFQ9gszFl42sVZv
bdnAtnMnNwzpWhmlQUboON+G115uZlMC7As0Exd1Dl/Ls0GqzyyaKhfNo4vDLY2I
gJOmNRgELfl3aYVATD7qYnkmdp4nxkB1V/cMxNwcmDdUYCUTFkAUWpPt+eTVRFaB
OUtxCyccqIlbPCt4ltSOmqQS4Sf3CZdYJ2TmvLbcWa0C0uDV3YXPt110yOMdIn+2
pwtb2RnLwV0M3HRVs5GQhEgChL4EF8UQ2/qAbj6GtaWaorw/jNXvAY7XIP6dIY29
jBD+XmM/svptwWAilvPxhPaX3G5WFA==
=ECf5
-----END PGP SIGNATURE-----

--zLGtIDBKqv2LU7pT--
