Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F486FD3BD
	for <lists+alsa-devel@lfdr.de>; Wed, 10 May 2023 04:09:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E8817107A;
	Wed, 10 May 2023 04:08:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E8817107A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683684552;
	bh=/aB6kLGQsdDoF5LzQIW0x9AQv/Kb2c1fLHvOZxL5Roo=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PFvV4ZBW0TJSFKjJ63ohDIRWpHDSH+RVpSC0RENQCr/LDBO3g+qHlKC5OUslS9WFr
	 DaEFlr9nwI3NeWH2BP7FHWaIzLYK72HC7pX8u/SdYsAu1Xz8M7IvxtbwvgcMEUg9NB
	 vumVhuYS/CbeAGvFu/hoUw3O2S9H2xW+JMi97z5g=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E18AF80310;
	Wed, 10 May 2023 04:07:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 933D8F8032D; Wed, 10 May 2023 04:06:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D6E16F802E8;
	Wed, 10 May 2023 04:06:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D6E16F802E8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=k7OXl0w7
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1494960B90;
	Wed, 10 May 2023 02:06:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB312C433D2;
	Wed, 10 May 2023 02:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683684362;
	bh=/aB6kLGQsdDoF5LzQIW0x9AQv/Kb2c1fLHvOZxL5Roo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k7OXl0w7LXcyRl9ifwkJvBjAmNuz20zv5oEMBS3HBiDXVEGii0TtoVrGrjyZNsNWt
	 H89tzgjzHOiTogJaxuob1s6HtyBY9g0t5kR94r71FGgqBrcBcKEb1BkdyTzvSh/AcW
	 oGrsQ8uPuJyICLFh4pJ3tNy/i9vBynE4tsvJbfXi59+cPsXLodAk0TQ1j0JhSC3Koq
	 fPv8bul/I7pNvExjRy1VRhMiWlnN7eNbzv6oxR9iS6Gh/8V61sMZYld1ZmrpMXFgTx
	 gH/Pxs39sfJP04ceOYFLYMmigF32iGyARQPMbAV/J9tbVekN6p19U0M6QPl3tuS5xm
	 xwxkB0ITotfPA==
Date: Wed, 10 May 2023 11:05:59 +0900
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>
Subject: Re: DMARC (Was: Re: [alsa-devel@alsa-project.org: [PATCH 3/5] ASoC:
 mediatek: mt8195-afe-pcm: Simplify runtime PM during probe])
Message-ID: <ZFr8B5UFx16sz7S0@finisterre.sirena.org.uk>
References: <ZFMF2cD3nPgpZOpa@finisterre.sirena.org.uk>
 <87o7n0mtv9.wl-tiwai@suse.de>
 <87ednwmssr.wl-tiwai@suse.de>
 <87wn1jdzuq.wl-tiwai@suse.de>
 <e76c1395-5eb2-849e-120d-1b7389fc97c7@perex.cz>
 <ZFoUaNKBkIgbW0rD@finisterre.sirena.org.uk>
 <ff43dccf-ba6d-d7fa-352a-5d5a8c4b977f@perex.cz>
 <ZFpaOVRc2E/CZBHI@finisterre.sirena.org.uk>
 <10075912-5c0b-549f-58e1-1323683d250d@perex.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yhUUIjHs3ZOHmy+I"
Content-Disposition: inline
In-Reply-To: <10075912-5c0b-549f-58e1-1323683d250d@perex.cz>
X-Cookie: Avoid contact with eyes.
Message-ID-Hash: AIKIFZXZFT32YWPY2DTFYX6NRFCJX4XC
X-Message-ID-Hash: AIKIFZXZFT32YWPY2DTFYX6NRFCJX4XC
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 sound-open-firmware@alsa-project.org,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AIKIFZXZFT32YWPY2DTFYX6NRFCJX4XC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--yhUUIjHs3ZOHmy+I
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 09, 2023 at 08:03:39PM +0200, Jaroslav Kysela wrote:
> On 09. 05. 23 16:35, Mark Brown wrote:

> > It's not b4 that's the issue here except in that it causes me to fetch
> > copies of the message that went to the list instead of my inbox which
> > didn't get mangled by the list.  git am just does not understand what's

> b4 can detect, if the e-mail is wrapped and use only the wrapped message.
> The wrapping is the correct semantics per mailman 3 not mangling (see [1]).

> https://docs.mailman3.org/projects/mailman/en/latest/src/mailman/handlers/docs/dmarc-mitigations.html

As Konstantin pointed out this isn't entirely practical, especially with
the message ID rewriting breaking things.  I suspect any mitigation here
would have to be on the archive side with it trying to unpack and
archive the enclosed message but that doesn't deal with all the issues.

> > if I try to apply it the top of the commit message looks like:

> > | commit 8f0e0ee514b189cf7b4e7fa09581e3f1d246fa09 (HEAD -> tmp)
> > | Author: Richard Fitzgerald via Alsa-devel <alsa-devel@alsa-project.org>
> > | Date:   Thu Apr 20 11:20:43 2023 +0100

> > with all the headers dumped in there which is just completely mangled.
> > Note the rewritten author.

> You should apply the wrapped message not the capsule.

That's just not how any of the tooling works here, it is *possible* to
unpack things but it's really fighting against the tooling.

> > mutt also represents this incredibly badly, it just shows the
> > "attachment" as the body of the message with all the headers dumped in

> I think that you can configure the tool to process this attachment in mutt.

I don't know off hand what that configuration would be, and in any case
it'd have knock on effects with reordering messages in the mailboxes
plus the overhead of having to open the mailbox to figure out if there's
any mangled messages in there.

> > The issue I'm seeing here is the rewriting which I'm not aware of any
> > other lists having turned on, even infradead ones which are also mailman
> > based.  Either they're just tolerating people having issues with gmail
> > (which seems reasonable TBH) or they're jumping through some additional
> > hoops to avoid issues.

> I checked infradead and they're using mailman 2. Mailman 2 does not support
> DMARC mitigation.

AFAICT that "mitigation" is actively harmful...

> > I believe vger does sometimes manage some backchannel which probably
> > helps it somewhat.

> Using a non-standard mechanism is not a big win.

> DMARC is a internet standard - see RFC7489, RFC8616. It means that the
> mailing lists cannot send e-mails with From from other domains which have
> restricted policies set by *their* administrators. So basically, all mail

I'm perfectly aware of what DMARC is, though I've not run a list server
since it became a thing.  As far as I'm aware the backchannel stuff for
vger is more on the policy front (eg, with stuff like rate limit based
mitigations) and not anything to do with relaxing any standards based
security.

> servers violates this if they keep the From header. Mailman 3 implemented
> several types of mitigations and the message wrap is the best one in my
> eyes. The mangling of the From header or reject e-mails from those senders
> is even worse (see [1]).

AFAICT the only other option is munging the From without enclosing the
message in a wrapper?  That's potentially marginally less harmful but
it's still going to break things badly enough that I'm not sure it's a
worthwhile improvement.

> When I turn off the mitigation in mailman, my ALSA server will have bad
> reputation for gmail users soon in an unpredictable manner. I also saw that
> ATT incoming mail servers had similar issues. We can expect that the list of
> the ingress SMTP servers not accepting e-mails based on the DMARC policy
> will grow. It's something that we don't have under control.

It's not quite that broken.

> If we don't find that it's time to move forward and accept this policy, I
> can turn off the mitigation, but in a cost that gmail (and soon maybe other)
> users will bomb me (they already did last years) that the ALSA mail server
> does not deliver e-mails for them. Are we a community on internet or not?

> Ideally, we should start upgrade and fix our tools...

> Let me just know, if you (and Takashi) insist to turn the mitigation off
> after this discussion. I'll do so...

I'd really like to see it turned off, in conjunction with the
suggestions from Konstantin for passing DMARC.  As far as I can tell the
standards are not so broken as to be unusable, though any list is going
to have some issues with gmail due to things like people incorrectly
reporting spam (eg, when they want to unsubscribe or didn't realise what
sort of list they were signing up for),

For the signatures thing IIRC even before this change to wrap things the
list server was mangling incoming siguatures, they'd typically not
verify if they came through the list - I never checked into it fully
since it was just something I had to be aware of but that's been there
since b4 had signature verification.  I *think* ideally existing
signatures should be preserved, or a new one added if there is none.
That may well be more of the issue than anything else.

--yhUUIjHs3ZOHmy+I
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmRa/AYACgkQJNaLcl1U
h9A02wf9E05/EfMx+rBP1aPEUp9WsIP9MxqHU7IPOhZJY+wxSNTWbQ81+KZq0/IA
wDvpU5Ad1/tmOB/SgRtPx0s/7VzIseqi213dKJPyOhTCQlOPfZWfYDjKLubzDwh/
bfARjiTJXgtnvIyvKyi6iqfoilwa5MMOa7g0W61Gr5PLPu+0fKP5cvPI3npkMRAB
BJw9CQwg37YjJ83Z2Tjrf4r3xaUbnSP/H+J8HqZ0wubaadl2+sFtzGmvanYNft1x
9aZtsH2YYYdXc1Nz1XFROW0nd6WgCwxI92aeGJwmWNFOqparRbSswoTbrK63GuhK
NVXICYtU5KYT1Py94OG5uyVnBijU+Q==
=Du4z
-----END PGP SIGNATURE-----

--yhUUIjHs3ZOHmy+I--
