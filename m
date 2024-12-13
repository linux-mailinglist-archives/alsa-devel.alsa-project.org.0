Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E83399F10E5
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Dec 2024 16:24:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1BF73311;
	Fri, 13 Dec 2024 16:24:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1BF73311
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1734103480;
	bh=/L2BRum8V73qtETJCILZboD8K816tH5sCP1OEzZP+ys=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZpXSYDoSLUu6vK53mIZwrywqkUorzeoVMAYNbvvqidg4MCmUk1FjpR6RiP6wodRwD
	 r2bAF0yQjigNoEBLpUQ3svWs4wMYEyrrTZl0YJP4Sh0zsClgLHlJM9XARMWq9O7hDI
	 iXPzMHkq5+pB3RryiXmz5Zcf7u4jR8fwYIt526Ro=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2C785F805C0; Fri, 13 Dec 2024 16:24:02 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A26FBF805C0;
	Fri, 13 Dec 2024 16:24:02 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B5935F80212; Fri, 13 Dec 2024 16:23:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EBE8FF800EE
	for <alsa-devel@alsa-project.org>; Fri, 13 Dec 2024 16:23:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EBE8FF800EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=bU4AAnnx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734103434; x=1765639434;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=/L2BRum8V73qtETJCILZboD8K816tH5sCP1OEzZP+ys=;
  b=bU4AAnnxFRK60Td5sQ/JH0DZW2f9rCTCCZ45CHvQPe603CMgbA/NHcHp
   eJO57KjJiAIRBnej3lkfJjOPvQeAsEK6nZLUmYUofDJXZu4LIaaRQyByW
   6MILS+iM4Cvb6OySNUN2w535iGQbgjmRK5A82+lSOLiGMo9MLzwVqBK7U
   rkeCMcgXt3oT1Xz8e2FbEEaau4EOXG30mzqrVKSFqtPn7TrzIN7Xamljy
   eow+5x4bAtD5Jtto8LWRq3mrUgQijfJs3PEZ9ujZp3jbFed0K65p1DD7V
   wc4s0y54XYqPi0YA/6xKDK7ECkg0HlSBZod0zlU8cQUk56p33jzhGjJTp
   w==;
X-CSE-ConnectionGUID: 5qHHiKPXTryTFs2wuH5wXA==
X-CSE-MsgGUID: FURURT/cQTqgJHopBaiJxA==
X-IronPort-AV: E=McAfee;i="6700,10204,11278"; a="45945115"
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600";
   d="scan'208";a="45945115"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2024 07:23:49 -0800
X-CSE-ConnectionGUID: 6OlwYim/Tau/E5xNYYaxxg==
X-CSE-MsgGUID: JJsHhcarQ6uQPQpJ8iVJRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,231,1728975600";
   d="scan'208";a="101583297"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2)
 ([10.125.110.169])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2024 07:23:48 -0800
Date: Fri, 13 Dec 2024 09:23:36 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Daniel Vetter <daniel.vetter@ffwll.ch>, alsa-devel@alsa-project.org,
	Jani Nikula <jani.nikula@linux.intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
	Maarten Lankhorst <dev@lankhorst.se>, dri-devel@lists.freedesktop.org
Subject: Re: hda: how to implement component master_unbind?
Message-ID: <itxamqrgaiukl3u63zz73brvqpfr6kjdwifrvx7ntjvzdewrlb@miy5fjm4v7ds>
References: 
 <alpine.DEB.2.22.394.2109221456080.3554566@eliteleevi.tm.intel.com>
 <s5ha6jxnekp.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <s5ha6jxnekp.wl-tiwai@suse.de>
Message-ID-Hash: EZNWHISEBFVNW7SWOWSYSTZ7CTKIHBJR
X-Message-ID-Hash: EZNWHISEBFVNW7SWOWSYSTZ7CTKIHBJR
X-MailFrom: lucas.demarchi@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EZNWHISEBFVNW7SWOWSYSTZ7CTKIHBJR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Thanks Kai to pointing me to this thread, trying to revive it.
Also adding dri-devel as it may be relevant there and Maarten who worked
on the xe integration recently

On Tue, Sep 28, 2021 at 01:07:34PM +0200, Takashi Iwai wrote:
>On Wed, 22 Sep 2021 14:40:19 +0200,
>Kai Vehmanen wrote:
>>
>> Hi Takashi et al,
>>
>> I've been having multiple discussions with our i915 team w.r.t. audio
>> driver behaviour when the aggregate component is unbound, triggered by
>> i915 unbind. This came up again in the recent regression with devres
>> allocations and I now dug into the topic again.
>>
>> In short, I'm puzzled how to really implement this. ALSA (or ASoC) don't
>> really have support for individual components of a card disappearing in a
>> hotplug fashion. At card level, we do have such support (USB, firewire and
>> recent work for PCI hotplug). But not individual components of a card
>> getting unplugged.


I think we will need to add some support here and handle the component
going down the same as a pci hotplug.


>>
>> In current code we have this:
>> static void hdac_component_master_unbind(struct device *dev)
>> {
>> »       struct drm_audio_component *acomp = hdac_get_acomp(dev);
>>
>> »       if (acomp->audio_ops && acomp->audio_ops->master_unbind)
>> »       »       acomp->audio_ops->master_unbind(dev, acomp);
>> »       module_put(acomp->ops->owner);
>> »       component_unbind_all(dev, acomp);
>> »       WARN_ON(acomp->ops || acomp->dev);
>> }
>>
>> ... when e.g. i915 driver is unbound (but could be any driver using the
>> component framework, not jus Intel hw), i915 calls component_del() and HDA
>> gets call to the above. After this, acomp ops are null are audio no longer
>> has ability to talk to i915 driver (which makes sense given it's unbound).
>>
>> If audio was runtime suspended, this kind of works (but relies on some
>> good luck). Upon HDA controller resume, we note acomp ops are NULL and
>> HDMI/DP operations (like snd_hdac_display_power()) silently become no-ops.
>> PCM streaming will go to /dev/null, but this is ok'ish since no monitor
>> can be connected anyways.
>>
>> If audio was active, we start to get warnings or worse. Audio expects hw
>> display codec to be powered and programmed, but suddenly it mey lose
>> state. If the audio controller is actually part of the display hardware
>> (e.g. discrete GPUs), then controller registers can stop functioning (they
>> should be still available, but given the main diplay driver is unbound,
>> odds of suprising behaviour are high).
>>
>> So this is less than ideal. I've been looking at options:
>>
>> 1) prevent/block the unbind if audio device is busy
>>
>> The component framework does not allow individual components to return
>> -EBUSY, so there's no way to let others know that unbind is not possible
>> now.

and there's no way to block unbind from the pci level neither, so this
is not really possible. There's nothing blocking someone to unplug the
card if it's on a hotplug-capable bus and/or someone calling

	# echo 0000:00:02.0 > /sys/module/xe/drivers/pci:xe/unbind

to tell the module to unbind from the device. If that involves multiple
components, I think they all should treat that as a device hotplug
rather than handling it differently.

>>
>> This would force anyone testing DRM driver unbind to first unbind
>> the audio driver and stop any active audio use-cases if needed.
>>
>> 2) unbind the ALSA card
>>
>> I've experimented doing a device_unregister() from the above callback, but
>> this has not really worked (onion peeling exercise of new probelms). The
>> code is shared by multiple controllers, so getting a handle to an snd_card
>> object is not straighforward (drvdata is differnet for SOF and
>> snd-hda-intel for instance). But with some new work, maybe we could call
>> snd_card_disconnect() to detach the card and inform user-space.

yeah, since it depends on the i915/xe side to power up the display
engine, I think handling that esssentially the same as a hotplug would
be ideal


>>
>> 3) continue as-is and try to fix bugs
>>
>> If audio is active, maybe we could force a acomp->put_power() to ensure
>> a clean unregister of the display part. But this leaves a big chunk of
>> issues especially with HDA controllers that require the display to
>> be powered on, to function.
>>
>> ..
>>
>> Any ideas, and/or has there been prior work? It seems Takashi it's been
>> mostly you who has been active working on the acomp integration recently.
>> I also included Chris, Daniel and Jani who've had patches to
>> hdac_component.c.
>
>Removing a component from the card is a PITA for now, indeed,
>especially when its influence is over different APIs (PCM, control,
>whatever)...

I'm not yet very familar with the sound side and checking if something changed
from when this thread started: for cards that can't work without the
other component, would it be hard to escalate that event to handle it
the same as a hotplug? Because from this thread it seems usb/pci hotplug
is already available.

thanks
Lucas De Marchi

>
>One thing I can think of is to perform like the vga_switcheroo
>handling in hda_intel.c; it's essentially a forced runtime suspend,
>and disable the whole card.  But in the case of audio-component
>unbind, we need to think about re-binding -- or completely ignore
>re-binding until the whole driver gets unloaded.
>
>
>Takashi
