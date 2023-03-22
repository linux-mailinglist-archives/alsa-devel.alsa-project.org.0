Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A2986C4B4A
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Mar 2023 14:08:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E3817E7E;
	Wed, 22 Mar 2023 14:07:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E3817E7E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679490529;
	bh=2Y7bTCRnlSlrxK3L/xRJycRafvM776NSZ/Krg4zHKwE=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=B9eoXaJpiKWLiBeHL6v+O9T8VRt+jHHhpUDrf7rK4XVbZ3G2z5y55Z/LddIa/1nH6
	 VMEUvqrZzKjkkml2ZOW79ySbX4nBfnJ0b+xQ3yjfrIyXSYQd7Zs1cJ7SpdBjc1VF4s
	 Ur01fbBLnzl0OtwhOnlpoAlG4aJcRnnz9voEaUmw=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 61848F80254;
	Wed, 22 Mar 2023 14:07:58 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 16221F8027B; Wed, 22 Mar 2023 14:07:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 96ACFF80105
	for <alsa-devel@alsa-project.org>; Wed, 22 Mar 2023 14:07:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 96ACFF80105
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=kiW+ueNe
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 8CB25B81CE3;
	Wed, 22 Mar 2023 13:07:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6C5CC433EF;
	Wed, 22 Mar 2023 13:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679490463;
	bh=2Y7bTCRnlSlrxK3L/xRJycRafvM776NSZ/Krg4zHKwE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kiW+ueNetZbct+oeecx3pIRKgXYRoB0MujJ6y7p74Bnxfg4mHSKAflQFuIoL1OM0z
	 YfwaJwepj/h1PqtqdJFEYLtJATdPJqrD3bi+niSbmb7ZnbNDBNCAmnsnUMWXgdr1kF
	 ISflWttkCzGmRl5+rSnUcUeLch46tx3qik6Sy16V3nNQAOlGy2hlXST0JhSYFcjvIa
	 rhVu0Ks/TaeYzsM8kSRLwL3xynQuTWta/div7YAC7uZBWDN1axi/bEHKdJHHPia6A8
	 bHWjl6s22r0vCDQKSHO2Yc4ls1AF+jwBePPjmLDgRXflvplvklsKqjIGBQU1vbjR7C
	 FtVQrwfCr+UUQ==
Date: Wed, 22 Mar 2023 13:07:56 +0000
From: Mark Brown <broonie@kernel.org>
To: Marian Postevca <posteuca@mutex.one>
Subject: Re: [PATCH 3/4] ASoC: amd: acp: Add machine driver that enables
 sound for systems with a ES8336 codec
Message-ID: <ZBr9rJn50ovG1w9W@sirena.org.uk>
References: <20230320203519.20137-1-posteuca@mutex.one>
 <20230320203519.20137-4-posteuca@mutex.one>
 <141a3320-ff65-459f-9d00-c8bed691dcfc@sirena.org.uk>
 <87lejpwxzf.fsf@mutex.one>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Ox7OggTfOqKWPV/Q"
Content-Disposition: inline
In-Reply-To: <87lejpwxzf.fsf@mutex.one>
X-Cookie: Single tasking: Just Say No.
Message-ID-Hash: YDW75URUIISVBMKXNB24DIWO4OBZG5FM
X-Message-ID-Hash: YDW75URUIISVBMKXNB24DIWO4OBZG5FM
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YDW75URUIISVBMKXNB24DIWO4OBZG5FM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--Ox7OggTfOqKWPV/Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 22, 2023 at 12:17:24AM +0200, Marian Postevca wrote:
> Mark Brown <broonie@kernel.org> writes:

> >> +	if (SND_SOC_DAPM_EVENT_ON(event))
> >> +		acp3x_es83xx_set_gpios_values(priv, 1, 0);
> >> +	else
> >> +		acp3x_es83xx_set_gpios_values(priv, 0, 1);

> > Why are these two GPIOs tied together like this?

> These GPIOs represent the speaker and the headphone switches. When
> activating the speaker GPIO you have to deactivate the headphone GPIO
> and vice versa. The logic is taken from the discussion on the sofproject
> pull request:
> https://github.com/thesofproject/linux/pull/4112/commits/810d03e0aecdf0caf580a5179ee6873fb33485ab
> and
> https://github.com/thesofproject/linux/pull/4066

Sure, but that doesn't answer the question.  What is the reason
they're tied together - what if someone wants to play back from
both speaker and headphones simultaneously?

> >> +static int acp3x_es83xx_suspend_pre(struct snd_soc_card *card)
> >> +{
> >> +	struct acp3x_es83xx_private *priv = get_mach_priv(card);
> >> +
> >> +	dev_dbg(priv->codec_dev, "card suspend\n");
> >> +	snd_soc_component_set_jack(priv->codec, NULL, NULL);
> >> +	return 0;
> >> +}

> > That's weird, why do that?

> This is needed because if suspending the laptop with the headphones
> inserted, when resuming, the sound is not working anymore. Sound stops
> working on speakers and headphones. Reinsertion and removals of the
> headphone doesn't solve the problem.

> This seems to be caused by the fact
> that the GPIO IRQ stops working in es8316_irq() after resume.

That's a bug that should be fixed.

--Ox7OggTfOqKWPV/Q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmQa/akACgkQJNaLcl1U
h9Ae4gf/e6/5uF/Cshw0/KAUpswFNPMtqowgQJKCeb1t0sE1bo9NguN2cK8tey2g
tycLYii10gLKkaZAHbwUntUmcTPMR/lpArrSRCfrycoJyqZ0XikSIeGloLdOlqAS
czi8c7f/CRq2XJP2YQQ7BY7/6z00KnP7+qXcKO9/Lk1DLd1ZorBC0WEuKPEX6+lz
0FygLY91cCbw1pWB6JiUbvEhgPUXKTKpIaM51W0UB5ShX9hSMiPb2XrWjlY5JOzo
8y3rIClYOMkrrpW855Ep8wZDsx3WbbwjqKvl9onarPQvINYHxA5waQUm3O6rOwwV
gI9AVmGankR8assP1w8NLp1ZcQBmwg==
=s0wu
-----END PGP SIGNATURE-----

--Ox7OggTfOqKWPV/Q--
