Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0273B1696EE
	for <lists+alsa-devel@lfdr.de>; Sun, 23 Feb 2020 10:02:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3F79916D9;
	Sun, 23 Feb 2020 10:01:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3F79916D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582448536;
	bh=m8FCzHQOvgPJhK0YZBFuhAyQHSIDGedvd5prHI1JF/g=;
	h=Subject:From:To:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pMQEjPKhZKaQkgLWs/viz9/GhJ5f2USeczGfATtPrwYWxJvDww/aSgXjk1kQZAKw+
	 9cty6VfaRryDJDYUgqQPWA4eDhM+7mf1OaRUyLpgLd0styUl2sd0UUSYw/ImBneRzt
	 CezYSYzOTovGiG7o7B4ITSaXNAJw4ba+WEYlcXtU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3B47CF80142;
	Sun, 23 Feb 2020 10:00:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9871BF80143; Sun, 23 Feb 2020 10:00:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_PASS,SPF_NEUTRAL,SURBL_BLOCKED,URIBL_RHS_DOB autolearn=disabled
 version=3.4.0
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3BF6EF800C6
 for <alsa-devel@alsa-project.org>; Sun, 23 Feb 2020 10:00:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3BF6EF800C6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="HQUC6ofd"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 4829A6EC;
 Sun, 23 Feb 2020 04:00:25 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Sun, 23 Feb 2020 04:00:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=nLKITkKDEwDT5cxQMraucgZLYRXTuanDZe9g8XqWP
 Vg=; b=HQUC6ofdSXzFaPLcEjdYqr9NEFA3qBocBfBcTONHniGuUpR7T1F1DENs+
 CrPnfrtWTHQEHhCF+CDLFkr+qBGomI1WhMVsE7GLC1ZHY6u/E5yF1UaN7FsHCRsJ
 0RepxSpTBChdunREO4x5wGDNbHs5DTNFA9xcIcKPkMvinpXJb+TjzIIhoLPFe7rP
 tHdKajd0+5ZqYsNUxuhVueBhimXZ2RNGRho9ameYQTsH9NZS0vdXNly+QUD/l2//
 ArTwJdRkIGZHgxJxxpmTc3UjZmL4IJZpWuYwqYTbuuQiIeRiKW6KhQJEznEXuuxC
 MPege3NviL24uWEN7O3EYcCjI5l2w==
X-ME-Sender: <xms:JT9SXi8_BN39uyzuGmTCNkSu4DYrXudrnbB4gzkUbQm8ReFIXzZZhg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrkeejgdduvdduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepkffuhffvffgjfhgtfggggfesthejredttderjeenucfhrhhomhepvfgrnhhu
 ucfmrghskhhinhgvnhcuoehtrghnuhhksehikhhirdhfiheqnecuffhomhgrihhnpehprg
 htrhgvohhnrdgtohhmpdhlihgsvghrrghprgihrdgtohhmnecukfhppeduleeirddvgeeg
 rdduledurdeltdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
 hrohhmpehtrghnuhhksehikhhirdhfih
X-ME-Proxy: <xmx:JT9SXm8WDI7z-InfwaDzvzjdE2__cTNf86oVPrn_LR5rEz2GGet5_g>
 <xmx:JT9SXjA0TAkzXs1n54daewdjw6M6FmCva_nEJccGXaJJ3N-mSgHxSw>
 <xmx:JT9SXuxhlDfWqQkt187jHSKiobBmwH2YZDpBwYfOuXJJPxvj5YDXww>
 <xmx:KD9SXuJzOlVLEl4dG2MzCaBdBdZDsSB9ATylVjasB1mdtheFX3aLhg>
Received: from laptop (unknown [196.244.191.90])
 by mail.messagingengine.com (Postfix) with ESMTPA id 2F4B93060BD1;
 Sun, 23 Feb 2020 04:00:21 -0500 (EST)
Message-ID: <084fc279e86e5fdf7439161aede4a75c85be69a0.camel@iki.fi>
Subject: Re: [pulseaudio-discuss] [alsa-devel] Question about the various
 mixer options in UCM
From: Tanu Kaskinen <tanuk@iki.fi>
To: Jaroslav Kysela <perex@perex.cz>, General PulseAudio Discussion
 <pulseaudio-discuss@lists.freedesktop.org>, alsa-devel
 <alsa-devel@alsa-project.org>
Date: Sun, 23 Feb 2020 11:00:16 +0200
In-Reply-To: <9c35a20952f53624c8cd082a5e7de33d2d34adca.camel@iki.fi>
References: <50ae39498982ba2fc3fc8df1b9f0eac15a2b98c8.camel@iki.fi>
 <cb58008e-e9cc-8390-cfc8-c5c93d31c862@perex.cz>
 <ae7b6d8a745ef718d8a6f3f2d7e4aeabe4f7d2b6.camel@iki.fi>
 <99522cac281eb998981ef2552c7e06846171b25f.camel@iki.fi>
 <fc493e83-3eaa-3580-483b-4bb7754245ef@perex.cz>
 <9c35a20952f53624c8cd082a5e7de33d2d34adca.camel@iki.fi>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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

On Sat, 2020-02-22 at 08:53 +0200, Tanu Kaskinen wrote:
> On Sun, 2020-02-16 at 18:38 +0100, Jaroslav Kysela wrote:
> > Dne 16. 02. 20 v 11:06 Tanu Kaskinen napsal(a):
> > > On Sun, 2020-02-16 at 11:42 +0200, Tanu Kaskinen wrote:
> > > > + pulseaudio-discuss@lists.freedesktop.org
> > > > 
> > > > On Sat, 2020-02-15 at 17:25 +0100, Jaroslav Kysela wrote:
> > > > > Actually, I am also trying to resolve the description of the speaker
> > > > > configuration. It may not be only enough to give the PCM device, because we
> > > > > don't know, if user connected the stereo or surround speakers to the sound
> > > > > card output for example. I play with an idea to add device variants to UCM,
> > > > > but the question is, how we can map this to pulseaudio profile/port schematics.
> > > > > 
> > > > > My quick idea is to export those variants via the verbs, so the exported verb
> > > > > names might look like:
> > > > > 
> > > > > HiFi:Speaker-Stereo
> > > > > HiFi:Speaker-5.1
> > > > > 
> > > > > Where 'HiFi' is the verb name, 'Speaker' is the device name and 'Stereo' is
> > > > > the variant name.
> > > > > 
> > > > > If we need to define multiple variants, all may be exported like:
> > > > > 
> > > > > HiFi:Speaker-5.1,Mic-4.0
> > > > > 
> > > > > Also, we can enhance this and store the configuration to a file, thus 'HiFi'
> > > > > can refer to 'HiFi@Speaker-5.1,Mic-4.0' by default.
> > > > 
> > > > Verb + list-of-device-variants sounds like a good way to map UCM
> > > > devices to pulseaudio profiles (and if there's just one verb, which I
> > > > expect to be the common case, don't show it in the profile name). I
> > > > don't know how the variants should be configured in UCM, but I know
> > > > that device variants should be able to declare conflicts with other
> > > > devices (or device variants). For example, 5.1 speaker output may make
> > > > recording impossible, while stereo speaker output can be used toghether
> > > > with a mic. If this information is not provided by UCM, pulseaudio will
> > > > have to probe all variant combinations (like it currently does with the
> > > > legacy mixer system).
> > > 
> > > Sorry, now I realized that the Verb + list-of-device-variants scheme
> > > doesn't really work after all as the profile scheme. Or maybe it does,
> > > but it's significantly different from what we do currently. Switching
> > > between Headphones and Speaker-Stereo often doesn't require reopening
> > > the PCM device, so there's no need for separate Headphones and Speaker-
> > > Stereo profiles. I guess we could still create separate profiles, it
> > > just means that the profile list will get much longer.
> > > 
> > > We could add a separate optimization step to the profile creation
> > > process. That is, first create all possible device-variant combinations
> > > as the initial profile list, and then inspect which profiles can be
> > > merged. Naming the merged profiles becomes a problem, but I imagine
> > > it's solvable with static rules (e.g. merging Speakers-Stereo and
> > > Headphones becomes Analog-Stereo), and if necessary the merging can be
> > > improved gradually over time.
> > > 
> > > > From profile creation perspective the ideal scheme would be not based
> > > on UCM devices but on PCM devices and their configuration variants, but
> > > I imagine naming would be an even bigger problem with this scheme (how
> > > to map PCM device names to sensible user friendly names?).
> > 
> > I think that I didn't explain my idea in detail. The variant verbs may be 
> > almost identical (thus all devices will be defined) like the "master" one. But 
> > the specific variant configuration will be returned to the application. So it 
> > will differ only in the channel count value for the Speaker device or so. The 
> > PCM device name + PCM parameters check will be fine. I don't think that we 
> > should modify something on the PA side. PA activates only one verb per 
> > soundcard now.
> 
> Oh, you want to create variant verbs? Is the idea that all possible
> device combinations will be made separate verbs? That would make life
> easier for PulseAudio, but wouldn't it mean a lot more work for UCM
> configuration writers? Rather than generating the device combinations
> automatically in PulseAudio, the combinations would have to be manually
> listed in every UCM configuration.
> 
> I think it would be better to define only one verb per sound card and
> declare the conflicts between the devices or device variants, and let
> PulseAudio automatically generate the device combinations as profiles.
> 
> I may be misunderstanding something, I didn't for example understand
> what you meant by "the PCM device name + PCM parameters check will be
> fine". Some examples could be useful. Let's say that there's a sound
> card that has stereo output (either headphones or line-out), 4.0
> output, 5.1 output, SPDIF output and stereo input. If input is used,
> 5.1 output can't be used at the same time. Would UCM define the
> following verbs?:
> 
> HiFi:Headphones,SPDIF,Mic
> HiFi:Line-Stereo,SPDIF,Mic
> HiFi:Line-4.0,SPDIF,Mic
> HiFi:Line-5.1,SPDIF

I'm currently writing UCM configuration for Audigy2, because
PulseAudio's default configuration doesn't work with that card
properly. I'm creating verbs for each possible device combination, and
I ran into a naming issue. How should "bidirectional" devices be listed
in the verb name? If there's both line-out and line-in and SPDIF
supports both input and output, maybe the verb name could be for
example this:

HiFi:Line-4.0-Out,SPDIF-Out,Line-Stereo-In,SPDIF-In

The device name in SectionDevice would be just "Line" or "SPDIF".

I don't really like bidirectional devices, i.e. I'd prefer have
separate SectionDevice names for Line-In and Line-Out, but I guess
merging them into one device can work.

-- 
Tanu

https://www.patreon.com/tanuk
https://liberapay.com/tanuk

