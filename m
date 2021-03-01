Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D58D1329264
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Mar 2021 21:46:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 66E971676;
	Mon,  1 Mar 2021 21:45:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 66E971676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614631569;
	bh=d+AEg65zmrmh8VDHPJxjIA6Vztu0ZBgkNflnsaeLfHw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YBLcvNuvDn4N5c95hb3PpG76xM6QNstBj/la4HQ2R67awYH8lXd0aNLh/iYiOVaWL
	 fDEs4cH16fodpH+eVofX/Nm0zvZUrfmPOQ82RWY6nHAjiTXTMvsDlWrn8L3W5N/a00
	 OPFecIumMpLUxT+dnKTWER5J5xKsVvzytnDAhGbI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A5F85F8026A;
	Mon,  1 Mar 2021 21:44:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 76FE8F8025E; Mon,  1 Mar 2021 21:44:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BB05CF8010B
 for <alsa-devel@alsa-project.org>; Mon,  1 Mar 2021 21:44:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB05CF8010B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="B7x2mbqt"
Received: by mail.kernel.org (Postfix) with ESMTPSA id D0D1E600CD;
 Mon,  1 Mar 2021 20:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614631460;
 bh=d+AEg65zmrmh8VDHPJxjIA6Vztu0ZBgkNflnsaeLfHw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=B7x2mbqtpZNXisaJhVI503LUMu0dSKqAEHihb9IQffr6an8tBqgqtUwCjf9UQN6kE
 CIuIPlv6FHf7ETfyqk52AKs/8K7ks5uizKSQTkc3QeA81/3BjlGfRWCzBQCcUw9AVK
 7cZmSMNoUbUUTbP8auByxc18BpN8/1AJStPhfAg4hTuCRsRBl2dPbow5rcBMWiHQJ9
 V67M6yI2rCs6OtF2lPJebLbHW1WqZR4FBmWQ3QZqBPXQIpCNwP4hN6Ugvh2m0Q9ubz
 8ghAs/l8uoDIzo5d+wOA7E8VDuiu6JBw4vkznW8QM/bhHftT7X7NGwZ5kB4R6QBV8Z
 lisd5L9RzOxzg==
Date: Mon, 1 Mar 2021 20:43:13 +0000
From: Mark Brown <broonie@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [RFC 2/2] ASoC: rt5670: Add LED trigger support
Message-ID: <20210301204313.GK4628@sirena.org.uk>
References: <20210224125927.GB4504@sirena.org.uk>
 <e47c7fa5-cb1a-f8a3-bfe4-1f6bca6a7d80@redhat.com>
 <20210224193626.GF4504@sirena.org.uk>
 <56ea1110-c129-5f3a-264b-fb389f615dbe@redhat.com>
 <20210225145901.GB5332@sirena.org.uk>
 <c785af21-8170-62ca-6f08-0a9a1a9071bb@redhat.com>
 <20210301132352.GA4628@sirena.org.uk>
 <76103f3e-c416-c988-7bc2-d7657e1868bd@redhat.com>
 <20210301191503.GI4628@sirena.org.uk>
 <54c5fd8e-1835-b9c3-d5fd-5cb363eab32c@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="08ATZu8fEq0x2T3M"
Content-Disposition: inline
In-Reply-To: <54c5fd8e-1835-b9c3-d5fd-5cb363eab32c@redhat.com>
X-Cookie: Body by Nautilus, Brain by Mattel.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Oder Chiou <oder_chiou@realtek.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.de>, Liam Girdwood <lgirdwood@gmail.com>,
 Bard Liao <bard.liao@intel.com>
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


--08ATZu8fEq0x2T3M
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 01, 2021 at 08:49:34PM +0100, Hans de Goede wrote:
> On 3/1/21 8:15 PM, Mark Brown wrote:

> > Off the top of my head something like writing a control name into a
> > sysfs file might work, it doesn't scale if you need to use multiple
> > controls as rt5640 does though.

> Currently ALSA/UCM does not use sysfs files for anything, so this
> feels very inconsistent with how all the rest of this currently works.

Yes, you'd really want to add string controls in ALSA.

> > drivers make a list of all output stage mutes and then use that to build
> > a standard global mute control which functions similarly to this one and
> > could be force wired to the LED trigger input, seems like a big hammer
> > but it'd be reasonably consistent.

>         /* Speaker Output Volume */
>         SOC_DOUBLE("Speaker Channel Switch", RT5640_SPK_VOL,
>                 RT5640_VOL_L_SFT, RT5640_VOL_R_SFT, 1, 1),
>         SOC_DOUBLE_TLV("Speaker Playback Volume", RT5640_SPK_VOL,
>                 RT5640_L_VOL_SFT, RT5640_R_VOL_SFT, 39, 1, out_vol_tlv),

> Where userspace expect "Speaker Channel Switch" to be named
> "Speaker Playback Switch" (aligning it with the vol-control name)
> instead.

This isn't great but be aware that the control names stuff breaks down
very, very easily in the presence of general hardware - things like
multiple general purpose outputs can cause problems.

In any case a big hammer virtual control which mapped straight onto the
LED would sidestep some of that, though it does assume there are useful
mute controls in all the paths which may or may not be the case.

> And we cannot just rename this since the control names are
> used in UCM profiles and if a UCM profile refers to a non-existing
> control it won't work.

I thought UCM already had support for remapping control names?  It was
certainly something discussed very early on - a mechanism to allow the
UCM file to say "treat control X as name Y in this use case", where the
X used for Y might vary between use cases.

> I do know that we need to much more careful going forward to make sure
> that control names match the conventions expected by userspace.

That in general won't scale well, ideally we'd be exposing the routing
graph to userspace and annotating the non-DAPM controls onto that
routing graph so that userspace can figure out where everything sits -
that'd make several things a lot easier.  It does require somoene with
the time and enthusiasm to define a new ABI though which isn't something
you should hold your breath for.

--08ATZu8fEq0x2T3M
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmA9UeAACgkQJNaLcl1U
h9DXswf+IPaiSG6bv1ma7zV5L2edlLGhHLTy0/O0fiS+EcM8SsBgE8EhTmGNaflc
1oNeKflsy7YGTspCWD+vsBGjtqz87lPijh7bh/FH5/x7m10lmtNpMWb3oHNbMaE6
dbgdJJCw+UsgdN6t/GeNrDt8aKmayw6bhh4mLQyUon0/3kKurFu0ujoEimv9xBQC
mzHlaAGHvSBjVc84LikiB9Gp4bHNGYOsed5ybjatf2rpOOEXYlx3lXQPUpkYHVvt
/Nego/ERBDaewpVpBkXx4pA1n3ZRH+Ou/Y2oJ6EpgPFBP8uF8RJ1XkfgxNC4UbYm
iG0zi0XSxCtFhk524RO/hPo1yfplog==
=06sG
-----END PGP SIGNATURE-----

--08ATZu8fEq0x2T3M--
