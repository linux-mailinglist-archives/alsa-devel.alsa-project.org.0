Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D30B1B7C35
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Apr 2020 18:51:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2B92016C3;
	Fri, 24 Apr 2020 18:50:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2B92016C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587747098;
	bh=MybT2iqsn9jaRlTPmSjAHRlwU3TMM/SESgNPmA5yhhM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mTQi6Sh6CmeOuFUXTRPxi1CKvP4BwUzUwzo+KViQaCkjpxYxIJ5MUIiRYVJVGhPLU
	 oTJ6XVQGE5UQmG8/FTkbPcso8hE7pSOeRxDo2zTWrc8hTqjHR9/3NBaZycSGEN9Cno
	 15pxtJFYrLQNclKEcK4mU7lMKotRTfQKGrXfRihI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9E29AF800BE;
	Fri, 24 Apr 2020 18:49:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8B78CF800BE; Fri, 24 Apr 2020 18:49:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ADD3EF800BE
 for <alsa-devel@alsa-project.org>; Fri, 24 Apr 2020 18:49:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ADD3EF800BE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="tr+KgBDK"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BCC1E20728;
 Fri, 24 Apr 2020 16:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587746987;
 bh=MybT2iqsn9jaRlTPmSjAHRlwU3TMM/SESgNPmA5yhhM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tr+KgBDKUWNQSFvlwrMSBAd01MsOdX8z0z1ckwRQzvHixzaVPW5j26HRrYUf9VKa+
 D3ov9Lwb7wFWPrLCEYqCGwJTr4+T/e+P10QQDDJP/NNK6ZruE+9RtM6vnOW/a4mXgo
 un5vesSYtGmilppyy8vkqpewejOLcPdVQnoNJaoo=
Date: Fri, 24 Apr 2020 17:49:44 +0100
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>
Subject: Re: ASoC driver names
Message-ID: <20200424164944.GI5850@sirena.org.uk>
References: <c57f21dc-412d-3057-6150-b96d96a20727@perex.cz>
 <20200423110437.GF4808@sirena.org.uk>
 <e31a20e6-91ab-2f30-f496-064bea07762a@perex.cz>
 <7b44a625-fe88-5eac-280f-daa15a7c83dc@linux.intel.com>
 <20200423184056.GS4808@sirena.org.uk>
 <aaff591f-9f3a-257b-4fba-71c39b3bf3ea@perex.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="k9xkV0rc9XGsukaG"
Content-Disposition: inline
In-Reply-To: <aaff591f-9f3a-257b-4fba-71c39b3bf3ea@perex.cz>
X-Cookie: Information is the inverse of entropy.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Takashi Iwai <tiwai@suse.de>,
 ALSA development <alsa-devel@alsa-project.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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


--k9xkV0rc9XGsukaG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 24, 2020 at 10:52:38AM +0200, Jaroslav Kysela wrote:
> Dne 23. 04. 20 v 20:40 Mark Brown napsal(a):

> > My instinct is that the machine driver name is being used as a
> > proxy for something else here and that if we need to change the ABI
> > perhaps we need to extend it rather than trying to shoehorn things into
> > what's there.

> My point is that this information is duplicated in the sense, that we have
> three fields with the similar contents passed from the audio driver by the
> ASoC drivers whose set only snd_soc_card->name from the device tree.

> For generic drivers: They can pass a generic driver name (like 'ASoC
> Simple') for the simple card driver (soc/generic/simple-card.c).

> So my proposal is to change the driver_name to the right contents (it was
> the initial intention for this field - changed somehow for ASoC). An
> information about the used driver which is independent on the real
> configuration (device tree, ACPI, component enumeration etc.). In other
> words, the name should be more close to the source (top-level driver) code
> name than the hardware configuration.

So if it's not really going to be used for anything particularly
concrete then I'm having a hard time summoning the enthusiasm for a
change.  It feels more like a neatness thing than anything else and the
postitive case just isn't jumping out at me, certainly not as a thing to
force for everything.  New stuff, sure.  I guess I'm not bothered enough
to block any platform that has a burning desire to convert either though
if users start coming and complaining about kernel upgrades breaking
things we'd have to revert.

> I would prefer to have the sound hardware description in the long name field
> than the whole hardware platform info here, too.

Does it also cope with the DT equivalents (and I guess there's nothing
we can do for board file based systems)?  This stuff does get used for
embedded systems where the plastics are often important for the
configuration.

BTW I think the reason why we're putting the board name in as the driver
name is that historically there used to be pretty much one machine
driver per board, I can't remember if they were just always taken from
the same place or if someone noticed duplicate strings all over the
place and removed the duplication.

--k9xkV0rc9XGsukaG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6jGKcACgkQJNaLcl1U
h9BS0Af/TxL/dw1rlI4TcWxvlelIzndYWFn7rGMozgb7Jbo1bSG8gu/+YzKzlUep
N17Sk6Ip9TeuADREXCV740XEnZtnhGtLfy8k/cHgdE5HMoJXWbR8ZPYalCOSdXgj
OWTY9QDN/IucWrZRO8ihrC8mKHosAL2YoqGScB4nyjft2qeYRhxzjWlAnl8n+tMH
OJOKqSL+O8P5UfMyYz9be1K8GM9l5Cd7z6BMxvZ4hcx82ptSHU5Ar9JZYREaoRqH
Z+WK43CHECL2WrHkozMNIfwCNg5Fw+zar1beiJkA93NMkWcFX2uZpPM9MfcB6gc2
HMxPKtInXO/8RPinXJXaZ46poSNCnQ==
=UEUR
-----END PGP SIGNATURE-----

--k9xkV0rc9XGsukaG--
