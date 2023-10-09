Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ADBF67BEACC
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Oct 2023 21:44:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 008E1EDF;
	Mon,  9 Oct 2023 21:44:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 008E1EDF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696880695;
	bh=YfxqTSYOT3VS+bRSZm1IokFfH9SJpPuVC57XIHPEazM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=byRFr7IU6Ir7aq4fvosREXuQJHW6u4thmlW9vbSt6m6uxKd8G+fXQA39HynUUOTfX
	 WQlgrMZ1EnLcxqkbNi2IrRxcQNw35CgyxqVV/LwDp1T1zFVzeiOsPQ2KqiUMjnCMkD
	 xc02XbLglWJa10ip3X0xV8R/3l5vycgSqMTg80cU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5ADC6F802BE; Mon,  9 Oct 2023 21:44:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 156CCF8027B;
	Mon,  9 Oct 2023 21:44:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C28CAF802BE; Mon,  9 Oct 2023 21:44:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 92D49F80130
	for <alsa-devel@alsa-project.org>; Mon,  9 Oct 2023 21:43:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92D49F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=jZQrpLLa
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EF40F61338;
	Mon,  9 Oct 2023 19:43:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59A64C433C7;
	Mon,  9 Oct 2023 19:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696880631;
	bh=YfxqTSYOT3VS+bRSZm1IokFfH9SJpPuVC57XIHPEazM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jZQrpLLa+O8FD3mcAg/kZXws2IqrU5KE7NC8BhjKtYoS4Wh0V95J3DbXqVVsdQ0wo
	 E77MJtmvY5Jh5rBuhAvMKkSK6pp+nEHyKLrai3ps3UxZEHqia+3y0VPgPAPAtDXdTu
	 vhgafmCDi5B97DYvx5yYdB0DCg5bq9aqMHjzrYkl1rQBVyf0NrcntDBid9mbYPp1FF
	 RMLJ5LjbpeY4eLR5bttaBKGYqL8C5/6lKuD4nsPXbH+TSNlvRZ5g5pV3n/Xqp9+sdM
	 Dap7fMsY5FnGpVY8VqrTQN4q0PALJGZ0wYxYA1I10uME5vWOuL7QUq94Sz8Nk5q3uq
	 PE0ivw3SRxXQg==
Date: Mon, 9 Oct 2023 20:43:44 +0100
From: Mark Brown <broonie@kernel.org>
To: Kees Cook <keescook@chromium.org>
Cc: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	asahi@lists.linux.dev, alsa-devel@alsa-project.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] ASoC: apple: mca: Annotate struct mca_data with
 __counted_by
Message-ID: <6d665575-7658-4619-a763-438e0d3aaf2e@sirena.org.uk>
References: <20230922175050.work.819-kees@kernel.org>
 <202310061321.E7247C52B@keescook>
 <6c7db067-78f2-4637-8064-3dc7c0489b90@sirena.org.uk>
 <202310090958.27F5025BDB@keescook>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wbIehCkvRN7FYjXS"
Content-Disposition: inline
In-Reply-To: <202310090958.27F5025BDB@keescook>
X-Cookie: What is the sound of one hand clapping?
Message-ID-Hash: PFBYXFCRXJQ6WTRUM3K4OZ2XJK4P5HCA
X-Message-ID-Hash: PFBYXFCRXJQ6WTRUM3K4OZ2XJK4P5HCA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PFBYXFCRXJQ6WTRUM3K4OZ2XJK4P5HCA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--wbIehCkvRN7FYjXS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 09, 2023 at 10:17:33AM -0700, Kees Cook wrote:
> On Fri, Oct 06, 2023 at 09:53:49PM +0100, Mark Brown wrote:

> > Please don't send content free pings and please allow a reasonable time
> > for review.  People get busy, go on holiday, attend conferences and so=
=20
> > on so unless there is some reason for urgency (like critical bug fixes)
> > please allow at least a couple of weeks for review.  If there have been
> > review comments then people may be waiting for those to be addressed.

> I'm happy to do whatever you'd like for this kind of thing, but I'm
> annoyed by this likely automated response seems to ask for the things
> that have already happened or generally don't make sense. :P

It's a form letter so not quite automated but sure.  Since it's the same
form letter I send for all these pings it covers a bunch of things that
might not apply in each individual case.

> - It _has_ been 2 weeks.

That's *at least* two weeks.  For a non-urgent change like this I'd
generally go with longer than that, for example I'd originally had these
changes queued for -rc5 to give the driver maintainers a couple of weeks
to look at them (my scripting understands -rcs more than dates so you'll
see more patches going in on Mondays). =20

> - Review comments have _not_ required changes.
> - Sending a no-change patch is just as much email as sending a ping.

A no-change patch is directly and readily actionable, a ping typically
requires going and digging out the original mail or sending a reply
asking for a resend.

> - It's not content-free: I'm asking if you're going to take it;
>   patches have gotten lost in the past, so it's a valid question.

That is not something I can meaningfully distinguish from being content
free, it provides no new information.  Something with content would be
for example information about dependencies progressing.

> - I'm not interested in other subsystems, I'm interested in yours. :P

> You've made it clear you don't want me to pick up these kinds of trivial
> patches that would normally go through your tree, so I'm left waiting
> with no indication if you've seen the patch.

Sure, but that seems fairly normal for the kernel - when sending this
sort of stuff myself I'd be leaving it more like a month before I got
particularly worried.  One way or another it seems fairly common for
things to be left for at least a couple of weeks with things like
waiting for review, restrictions on when patches actually get applied
and just people being busy or whatever.

Personally for incoming patches when I'm leaving time for driver
maintainers I tend to go for leaving things for a -rc or two - things
like who's involved, how early it is in the week when the original patch
gets sent and how late in the release cycle we are will factor in there.
More urgent things like fixes will tend to go faster, minor stuff that
just needs to be handled sometime before the next release will tend to
be slower.

I don't send out mails saying that I've reviewed and queued things
before actually applying them since doing that tends to discourage other
people from doing review and I'd rather they did, this means I don't
generally send out entirely positive review comments prior to applying
anything unless I'm actively chasing for feedback from someone.  It can
also be a bit confusing for people if I tell them something is OK then
later run into test issues.

> My normal routine with treewide changes is to pick up trivial stuff that
> has gotten review but the traditional maintainer hasn't responded to
> in 2 weeks.

> Do you want these kinds of patches to be re-sent every 2 weeks if they
> haven't been replied to by you?

No, please leave it longer - that's the main thing here, you're not
leaving adequate time for non-urgent patches like this.  If you leave it
two weeks for maintainer review and I also leave it two weeks for
maintainer review then we will both expire the timers at the same time
and we're going to trample over each other.  For me it will typically be
a bit more or less than two weeks rather than two weeks to the day but
IIRC the time you applied something it was while the patch was actually
running through my CI.

Off the top of my head I'd say wait at least three weeks for this sort
of patch before doing anything and then prefer to do a resend, that's
should avoid most issues.  If you're going to just apply things yourself
I'd suggest waiting for -rc6 or so before doing so (assuming the patches
were initially sent reasonably early), that does seem like a reasonable
backstop so things don't completely miss releases.

--wbIehCkvRN7FYjXS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmUkV/AACgkQJNaLcl1U
h9Cx6wf+Mp6vpDV8u/RSsfNyyeauwAka4z1Hlk5P6r1BUk1ILsu1HZenW134Gs9B
TVvsTnRHXt+ncyEVjC/JOrPHanYdJ1mAuTeYA9zYpmq1KnxE/Nkj+wUwbyytSpq4
JDiC5X03Vfra9BWkTKlFzOTpRkfOj5nXukvKxsHPZS2g3j5eEH/V2ZbEk6Wp0b8b
M9dU6NviQJtpgCPKtj1R4D7HQ5MZ6IWagIHWk0P8sxU6aM6QJkTJlUv4eZ/gWh+Y
0gMPR0XkpoITVUbXrpvpPN2jAthOMMm+erfm9E8pb1eceGv+UKTJR8f6ELtojzU/
4jy8hXGLu/8ghtVcLfX+6p9YQAP1wA==
=d//l
-----END PGP SIGNATURE-----

--wbIehCkvRN7FYjXS--
