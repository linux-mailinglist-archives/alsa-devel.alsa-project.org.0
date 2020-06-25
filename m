Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B79A5209797
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Jun 2020 02:21:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F50218C3;
	Thu, 25 Jun 2020 02:20:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F50218C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593044471;
	bh=qVf+rh6SYpYq/GWYn/8OxOTEIoWgEFxcX0zRY7UWQgw=;
	h=In-Reply-To:References:Date:From:To:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OAn+NGxmJbRoxdYa/5KIQfrg/rucJCwMMY/kTYru0HCgkGtGyomg1GCbw+YkiS6Qg
	 h395VmBADDS3gNrUcktpZAv1jg8iOzRIjK7n6cykg95ox7zeSenrCfHS2lb5CxiMsP
	 cVKz8ShaEXRHpE8Dq0Vc6ig+J03837bKU3dX7nUQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C8B6F8012F;
	Thu, 25 Jun 2020 02:19:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C87D4F8015B; Thu, 25 Jun 2020 02:19:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EF45CF800B2
 for <alsa-devel@alsa-project.org>; Thu, 25 Jun 2020 02:19:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EF45CF800B2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=arunraghavan.net header.i=@arunraghavan.net
 header.b="HVvSTMcQ"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="OVm8di3Q"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id 52490AB2;
 Wed, 24 Jun 2020 20:19:20 -0400 (EDT)
Received: from imap21 ([10.202.2.71])
 by compute2.internal (MEProxy); Wed, 24 Jun 2020 20:19:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 arunraghavan.net; h=mime-version:message-id:in-reply-to
 :references:date:from:to:cc:subject:content-type
 :content-transfer-encoding; s=mesmtp; bh=JkMmSAtz9/uwbVU/+g4RyPx
 1dK2wpBYZ8QyZmDl7mts=; b=HVvSTMcQkmnjiexW/lqdDliVTbQ4FkCrahI9M+E
 rGMunuqhJdWuKWT+ZefWxHaLolVfP9oPNMACgV+U/01IkjV0X8L5DHc2WJ+yrEcZ
 knHms3RkK/PYAPRQtlyzGF6fTjaAVOG+eMtuNthXQUkUdnFBGv5Iz4riqv7hkiSz
 gXRM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=JkMmSAtz9/uwbVU/+g4RyPx1dK2wpBYZ8QyZmDl7m
 ts=; b=OVm8di3QbPIwXRqmMqPlcQ2tN6nea09OLDmOd29aa2LU1XxeP4ANB3AcI
 /UQboTGJghfA1kWKSsuYavy/7ewy+LazDziJZKAdjUn/mMR9V8imVFIiM36ttfMZ
 IBWv5u1Drn0argX+n/rvAurCKojbf7noffRWKJ93Hbe5Vhf/M6kvxJ43yw98TAPM
 YmXNv67u7UnLJOfqDab8+uDz78nLVqC0DyKfO7VXxrSrBt7YzJZBNFCYuKGFkCHG
 6MkuQ/tt3XHifL1nYJd9GshvgKDvgep9Ql+Wkf2mVRaAWVSrGchuBkDiBhq7AJiA
 fy7Lk8YizBZz7zg22Vj9NTDPXmyCw==
X-ME-Sender: <xms:h-3zXm-_XVf5lxqAOm6_OTVtaXkIwdU5m_tyn1FsZP-cYpLMiZ0XjQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudekkedgfeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgfgsehtqhertderreejnecuhfhrohhmpedftehr
 uhhnucftrghghhgrvhgrnhdfuceorghruhhnsegrrhhunhhrrghghhgrvhgrnhdrnhgvth
 eqnecuggftrfgrthhtvghrnhepffekjeeludeggfffjeeludefudeuudeluddvheethefg
 udegffegkeefjeevjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
 hilhhfrhhomheprghruhhnsegrrhhunhhrrghghhgrvhgrnhdrnhgvth
X-ME-Proxy: <xmx:h-3zXmtYMnHtL-8ckyCdP0uOvhdRsbZV-Sre_1WkI-q4wVu-KlGXTA>
 <xmx:h-3zXsAf5LH6JZOgJDhV10kc60FzLyjAxuFMqmre81LunCat_BAEnw>
 <xmx:h-3zXudwi7ywXfzb1s4BAJkZQrKxa8W3f0LGAm3jF44cc9le7IEz1g>
 <xmx:h-3zXkpoRkiuHhrl1olblah-It57-Kr4J9Zqlalm6ZsR1Wif6nkQZA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 2227D66007F; Wed, 24 Jun 2020 20:19:19 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-dev0-543-gda70334-fm-20200618.004-gda703345
Mime-Version: 1.0
Message-Id: <3bfd1d2f-a2f0-4321-8f9d-2b9f265dcebd@www.fastmail.com>
In-Reply-To: <s5hftakid2e.wl-tiwai@suse.de>
References: <1592954796-12449-1-git-send-email-harshapriya.n@intel.com>
 <s5hr1u4lxee.wl-tiwai@suse.de>
 <f2da25c0-c740-4d44-ab66-6017622f7dde@perex.cz>
 <7dd38f98-e74a-94c0-6888-523e6189c00b@linux.intel.com>
 <s5ho8p8ifcn.wl-tiwai@suse.de>
 <2404f45d-832d-69a0-fb3b-1981ae455f50@linux.intel.com>
 <s5hftakid2e.wl-tiwai@suse.de>
Date: Wed, 24 Jun 2020 20:18:58 -0400
From: "Arun Raghavan" <arun@arunraghavan.net>
To: "Takashi Iwai" <tiwai@suse.de>,
 "Pierre-Louis Bossart" <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] ALSA: hda/hdmi: Add Intel silent stream support
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
Cc: Harsha Priya <harshapriya.n@intel.com>, kai.vehmanen@intel.com,
 alsa-devel@alsa-project.org, Emmanuel Jillela <emmanuel.jillela@intel.com>,
 PulseAudio Discussion <pulseaudio-discuss@lists.freedesktop.org>
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

+pulseaudio-discuss for information

On Wed, 24 Jun 2020, at 1:33 PM, Takashi Iwai wrote:
> On Wed, 24 Jun 2020 19:05:14 +0200,
> Pierre-Louis Bossart wrote:
> >=20
> >=20
> >=20
> > On 6/24/20 11:43 AM, Takashi Iwai wrote:
> > > On Wed, 24 Jun 2020 17:33:45 +0200,
> > > Pierre-Louis Bossart wrote:
> > >>
> > >>
> > >>>>> The silent stream is enabled with a Kconfig option, as well as=
 a kernel
> > >>>>> parameter should there be a need to override the build time de=
fault.
> > >>>>
> > >>>> I'm not sure whether the module option is the best interface.
> > >>>> An alternative is a mixer element that controls dynamically.=C2=
=A0 Then
> > >>>> it'll be per card unlike the module option.
> > >>>
> > >>> +1, kcontrol seems the appropriate way to control this.
> > >>
> > >> It was my suggestion to use Kconfig+kernel parameter for
> > >> simplicity/overrides.
> > >>
> > >> The kcontrol is a nice idea, but in practice we typically only ha=
ve
> > >> one card dealing with HDMI.
> > >
> > > Not really.  There are systems with two HDMI outputs from both
> > > integrated and discrete GPUs.  Most modern systems are only with
> > > hybrid graphics, though.
> >=20
> > Ok, maybe I am mistaken, in most of the HDMI issues we've seen only
> > one HDMI source.
> >=20
> > But it's a good point that this is only supposed to be used for Inte=
l
> > whether it's a kernel parameter or a kcontrol shouldn't this be
> > dependent on a PCI ID being detected and a SKYLAKE flag being set?
> > it's my understanding that this applies from Skylake to TigerLake, n=
ot
> > before.
>=20
> I guess we can check it from the codec ID?  Change the probe function
> for Skylake+ codecs to patch_i915_skl_hdmi and co, and set the flag
> there.
>=20
> > >> It also doesn't have a UCM representation
> > >> so would force the use of amixer and manual configs, or the UCM f=
ile
> > >> would always set the mode.
> > >
> > > But people usually use the distro kernels, so the situation is mor=
e or
> > > less equivalent; you'd have to adjust a module option manually if =
you
> > > want a different one from the default, and you'd have to be root t=
o
> > > change it.
> > >
> > > So, rather the question is how we should provide the setup of such=

> > > parameter.  It's supposed to be a part of power management stuff t=
hat
> > > should be touched by either a smart PM tool or a manual override s=
uch
> > > as runtime PM setup?  Or can it be seen as a more casual tuning?
> >=20
> > I am not aware of such tools. The only thing I know is that some of
> > the HDaudio power settings are already controlled by kernel
> > parameters, e.g.
> >=20
> > /etc/modprobe.d/audio_powersave.conf
> > options snd_hda_intel power_save=3D1
>=20
> Yes, it's been the primary knob for years to turn on/off the runtime
> PM for HD-audio and other legacy drivers.  This was used by powertop
> or some other power-aware daemons and tools, to be toggled dynamically=

> per the power cable state or such.
>=20
> And, how the silent stream feature should be seen?
> Should it be a system-wide root-only setup or adjustable per user?
> Would it be changed often?  Such questions and answers will lead us to=

> the right direction, I hope.

For audio, would UCM not be the appropriate point for a system integrato=
r to decide how the audio device should be set up?

This would allow for a choice based on the situation in which the device=
 is actually being deployed without users having to muck around with mod=
ule parameters -- maybe someone wants want this enabled for an HTPC setu=
p, but not on a desktop connected to a monitor.

-- Arun
