Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7BE16F8ED
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Feb 2020 09:06:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 10B59169B;
	Wed, 26 Feb 2020 09:05:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 10B59169B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582704373;
	bh=TggjErwDgGW9RcRuTZ3SVG/0NDqDFvpWVz82ZpmoP94=;
	h=Subject:From:To:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lvmaEkcEVYkcCBwsSd6XBkuXOYz4+xQe7WucRGIGe97/2ocj8+9Vb3eHEj3t3kKF6
	 HSPvbtWykvqDjHZD7b1fXGaopJUWBL/cmr0IZWg1s5eQeUv43ZL38o3OHgPaEFH4XX
	 dRWQJEa/BNxcprYIQ3XAQPWVTawY+iuDNs3tzCnA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A37CF8014D;
	Wed, 26 Feb 2020 09:05:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C57BDF80171; Wed, 26 Feb 2020 09:05:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 PRX_BODY_30,SPF_NEUTRAL,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BF3FDF800E8
 for <alsa-devel@alsa-project.org>; Wed, 26 Feb 2020 09:05:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BF3FDF800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="CbQhUTLS"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id B5AEA21B36;
 Wed, 26 Feb 2020 03:05:10 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Wed, 26 Feb 2020 03:05:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=ZApxCE2qGoIRIH/mNXoL4CFQ/4lFSz/NXRCIPtcNy
 Ic=; b=CbQhUTLSZ17UdAC0L+AOjQSMDJH4ks9lEmH5NIcBGLXkEBLubDhHSUiV0
 JqZdXpRghoQJS2ILdEcJVZbb1x6ECmQu2c/rydnDuEwagdXQNtObfeshYCJ8tUqT
 5dyb0Qwn4YHQ46D8m9JZKoQNAoQ78/+TlXuvQWVdbLBmDoyGHHBuGRvfBCses7IF
 kgGIijsc5oTLOl1vvNv8DCdCDVKJHYz85S6+uB5ZrqaG58tBS0bLvzQpXRJ2uZYq
 SYaLcJTY6p3F5bg688UZzVMe2Jpb2tspo7oA0datbs9SMFhcJam7dCl64f7owHOU
 UllzWK2ED6DTUcgW+tO/n6FWf+y1g==
X-ME-Sender: <xms:tSZWXvwdjaafq1CcNutN3AC8077J3LZLP90H51yLsGhAZnqeeLfDyA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrleefgdduudeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepkffuhffvffgjfhgtfggggfesthejredttderjeenucfhrhhomhepvfgrnhhu
 ucfmrghskhhinhgvnhcuoehtrghnuhhksehikhhirdhfiheqnecuffhomhgrihhnpehprg
 htrhgvohhnrdgtohhmpdhlihgsvghrrghprgihrdgtohhmnecukfhppeduleeirddvgeeg
 rdduledurddvieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
 hrohhmpehtrghnuhhksehikhhirdhfih
X-ME-Proxy: <xmx:tSZWXrs6MzOTfcEuVwNvqymaw_1oahuhCQAm-_OrLg2SdQTCRCqqwA>
 <xmx:tSZWXkoYMf7IFmXf70QEviWy4S0yond9_0LZmqVLatvZSJhfL-127g>
 <xmx:tSZWXm1_lsmSraUjNpfad7pjRnEKi0fo6yGQQ5lXgWbQ13Jrz73wxA>
 <xmx:tiZWXohxx0nsK9QOxXUItkhSv8zWiXWWTCvLN4gxSPvj6qLJoit6cw>
Received: from laptop (unknown [196.244.191.26])
 by mail.messagingengine.com (Postfix) with ESMTPA id 221763060BD1;
 Wed, 26 Feb 2020 03:05:09 -0500 (EST)
Message-ID: <0552285710f31d73efbe211b75a877888ac22593.camel@iki.fi>
Subject: Re: [pulseaudio-discuss] [alsa-devel] Question about the various
 mixer options in UCM
From: Tanu Kaskinen <tanuk@iki.fi>
To: Jaroslav Kysela <perex@perex.cz>, General PulseAudio Discussion
 <pulseaudio-discuss@lists.freedesktop.org>, alsa-devel
 <alsa-devel@alsa-project.org>
Date: Wed, 26 Feb 2020 10:05:04 +0200
In-Reply-To: <06be7c66-ef8e-f7ee-ae1c-69db8fa59f24@perex.cz>
References: <50ae39498982ba2fc3fc8df1b9f0eac15a2b98c8.camel@iki.fi>
 <cb58008e-e9cc-8390-cfc8-c5c93d31c862@perex.cz>
 <ae7b6d8a745ef718d8a6f3f2d7e4aeabe4f7d2b6.camel@iki.fi>
 <99522cac281eb998981ef2552c7e06846171b25f.camel@iki.fi>
 <fc493e83-3eaa-3580-483b-4bb7754245ef@perex.cz>
 <9c35a20952f53624c8cd082a5e7de33d2d34adca.camel@iki.fi>
 <084fc279e86e5fdf7439161aede4a75c85be69a0.camel@iki.fi>
 <06be7c66-ef8e-f7ee-ae1c-69db8fa59f24@perex.cz>
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

On Sun, 2020-02-23 at 14:55 +0100, Jaroslav Kysela wrote:
> Dne 23. 02. 20 v 10:00 Tanu Kaskinen napsal(a):
> > On Sat, 2020-02-22 at 08:53 +0200, Tanu Kaskinen wrote:
> > > On Sun, 2020-02-16 at 18:38 +0100, Jaroslav Kysela wrote:
> > > > Dne 16. 02. 20 v 11:06 Tanu Kaskinen napsal(a):
> > > > > On Sun, 2020-02-16 at 11:42 +0200, Tanu Kaskinen wrote:
> > > > > > + pulseaudio-discuss@lists.freedesktop.org
> > > > > > 
> > > > > > On Sat, 2020-02-15 at 17:25 +0100, Jaroslav Kysela wrote:
> > > > > > > Actually, I am also trying to resolve the description of the speaker
> > > > > > > configuration. It may not be only enough to give the PCM device, because we
> > > > > > > don't know, if user connected the stereo or surround speakers to the sound
> > > > > > > card output for example. I play with an idea to add device variants to UCM,
> > > > > > > but the question is, how we can map this to pulseaudio profile/port schematics.
> > > > > > > 
> > > > > > > My quick idea is to export those variants via the verbs, so the exported verb
> > > > > > > names might look like:
> > > > > > > 
> > > > > > > HiFi:Speaker-Stereo
> > > > > > > HiFi:Speaker-5.1
> > > > > > > 
> > > > > > > Where 'HiFi' is the verb name, 'Speaker' is the device name and 'Stereo' is
> > > > > > > the variant name.
> > > > > > > 
> > > > > > > If we need to define multiple variants, all may be exported like:
> > > > > > > 
> > > > > > > HiFi:Speaker-5.1,Mic-4.0
> > > > > > > 
> > > > > > > Also, we can enhance this and store the configuration to a file, thus 'HiFi'
> > > > > > > can refer to 'HiFi@Speaker-5.1,Mic-4.0' by default.
> > > > > > 
> > > > > > Verb + list-of-device-variants sounds like a good way to map UCM
> > > > > > devices to pulseaudio profiles (and if there's just one verb, which I
> > > > > > expect to be the common case, don't show it in the profile name). I
> > > > > > don't know how the variants should be configured in UCM, but I know
> > > > > > that device variants should be able to declare conflicts with other
> > > > > > devices (or device variants). For example, 5.1 speaker output may make
> > > > > > recording impossible, while stereo speaker output can be used toghether
> > > > > > with a mic. If this information is not provided by UCM, pulseaudio will
> > > > > > have to probe all variant combinations (like it currently does with the
> > > > > > legacy mixer system).
> > > > > 
> > > > > Sorry, now I realized that the Verb + list-of-device-variants scheme
> > > > > doesn't really work after all as the profile scheme. Or maybe it does,
> > > > > but it's significantly different from what we do currently. Switching
> > > > > between Headphones and Speaker-Stereo often doesn't require reopening
> > > > > the PCM device, so there's no need for separate Headphones and Speaker-
> > > > > Stereo profiles. I guess we could still create separate profiles, it
> > > > > just means that the profile list will get much longer.
> > > > > 
> > > > > We could add a separate optimization step to the profile creation
> > > > > process. That is, first create all possible device-variant combinations
> > > > > as the initial profile list, and then inspect which profiles can be
> > > > > merged. Naming the merged profiles becomes a problem, but I imagine
> > > > > it's solvable with static rules (e.g. merging Speakers-Stereo and
> > > > > Headphones becomes Analog-Stereo), and if necessary the merging can be
> > > > > improved gradually over time.
> > > > > 
> > > > > >  From profile creation perspective the ideal scheme would be not based
> > > > > on UCM devices but on PCM devices and their configuration variants, but
> > > > > I imagine naming would be an even bigger problem with this scheme (how
> > > > > to map PCM device names to sensible user friendly names?).
> > > > 
> > > > I think that I didn't explain my idea in detail. The variant verbs may be
> > > > almost identical (thus all devices will be defined) like the "master" one. But
> > > > the specific variant configuration will be returned to the application. So it
> > > > will differ only in the channel count value for the Speaker device or so. The
> > > > PCM device name + PCM parameters check will be fine. I don't think that we
> > > > should modify something on the PA side. PA activates only one verb per
> > > > soundcard now.
> > > 
> > > Oh, you want to create variant verbs? Is the idea that all possible
> > > device combinations will be made separate verbs? That would make life
> > > easier for PulseAudio, but wouldn't it mean a lot more work for UCM
> > > configuration writers? Rather than generating the device combinations
> > > automatically in PulseAudio, the combinations would have to be manually
> > > listed in every UCM configuration.
> > > 
> > > I think it would be better to define only one verb per sound card and
> > > declare the conflicts between the devices or device variants, and let
> > > PulseAudio automatically generate the device combinations as profiles.
> > > 
> > > I may be misunderstanding something, I didn't for example understand
> > > what you meant by "the PCM device name + PCM parameters check will be
> > > fine". Some examples could be useful. Let's say that there's a sound
> > > card that has stereo output (either headphones or line-out), 4.0
> > > output, 5.1 output, SPDIF output and stereo input. If input is used,
> > > 5.1 output can't be used at the same time. Would UCM define the
> > > following verbs?:
> > > 
> > > HiFi:Headphones,SPDIF,Mic
> > > HiFi:Line-Stereo,SPDIF,Mic
> > > HiFi:Line-4.0,SPDIF,Mic
> > > HiFi:Line-5.1,SPDIF
> > 
> > I'm currently writing UCM configuration for Audigy2, because
> > PulseAudio's default configuration doesn't work with that card
> > properly. I'm creating verbs for each possible device combination, and
> 
> Note that variants are not supported in UCM yet.

Yes, I know. But if the variants are going to show up as separate verbs
to PulseAudio, I figured I can already get the same effect by manually
creating the verbs.

> I expect to add the 
> VariantSection to the DeviceSection like this:
> 
> SectionDevice."Speaker" {
>    SectionVariant."4.0" {
>      Value {
>        PlaybackChannels 4
>        ... channel mapping (todo) ...
>      }
>    }
> }
> 
> etc.. The alsa-lib will compose the verbs variants. I believe that we should 
> not duplicate all verb configs just because one line requires a change.

Ok, if alsa-lib autogenerates the verbs, that should make things easy
for both configuration writers and PulseAudio, assuming that there's no
disagreement about the verb generation logic. What logic will alsa-lib
use when creating the verbs? There are at least a couple of
alternatives.

I think it would be best to create a verb for every possible maximal
device variant combination. By "possible" I mean that a verb shouldn't
contain any devices (or device variants) that can't be used
simultaneously with other devices in the verb, and by maximal I mean
not to create verbs that are subsets of other verbs.

Another possibility is to follow the current autogeneration logic in
PulseAudio: generate all possible combinations of one input and one
output, plus a verb for each single device variant. I don't think this
is as good as the first alternative (impossible to use multiple outputs
at the same time, and the single device verbs make the verb/profile
list longer). The only reason to do this would be to avoid changes in
PulseAudio (currently some things won't work as expected if there are
multiple outputs in one profile and if the single-device profiles don't
exist).

> > I ran into a naming issue. How should "bidirectional" devices be listed
> > in the verb name?
> 
> If there is a difference between playback/capture parameters or mixer 
> settings, you cannot define the bidirectional device. But you can use indexes:
> 
> SectionDevice."Line1" {
>    comment "Rear line output"
>    ...  configuration for line-out ...
> }
> 
> SectionDevice."Line2" {
>    comment "Rear line input"
>    ... configuration for line-in ...
> }
> 
> plus variants.

Ok, thanks!

-- 
Tanu

https://www.patreon.com/tanuk
https://liberapay.com/tanuk

