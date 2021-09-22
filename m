Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 153B3414997
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Sep 2021 14:48:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 68DA182E;
	Wed, 22 Sep 2021 14:47:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 68DA182E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632314903;
	bh=rFGozPr+54uyJZJqRRbM2Rf9/Cs4yd4PpAh1PsYjm4Y=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=DeNL91mjCbnVSl3uk87D6tD5e2kNuBcvdF3jn7KzyuhgtAasqi60NaXvxyZVcpI/f
	 mXkBcqQVqybHyLiWlKOnOumJCLVt6e/8JXou7Z7lyvkSgmp0asJvIPTs4xMi2tTBjK
	 znsd00TWlF60oJMy9GuPF55gCcqXydLXcpusMBfk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D773CF80279;
	Wed, 22 Sep 2021 14:47:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D9E40F8025D; Wed, 22 Sep 2021 14:47:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7E98CF8014E
 for <alsa-devel@alsa-project.org>; Wed, 22 Sep 2021 14:47:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7E98CF8014E
X-IronPort-AV: E=McAfee;i="6200,9189,10114"; a="203738024"
X-IronPort-AV: E=Sophos;i="5.85,314,1624345200"; d="scan'208";a="203738024"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2021 05:46:58 -0700
X-IronPort-AV: E=Sophos;i="5.85,314,1624345200"; d="scan'208";a="550232696"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2021 05:46:56 -0700
Date: Wed, 22 Sep 2021 15:40:19 +0300 (EEST)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org, 
 Chris Wilson <chris@chris-wilson.co.uk>, 
 Daniel Vetter <daniel.vetter@ffwll.ch>, 
 Jani Nikula <jani.nikula@linux.intel.com>
Subject: hda: how to implement component master_unbind?
Message-ID: <alpine.DEB.2.22.394.2109221456080.3554566@eliteleevi.tm.intel.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Content-ID: <alpine.DEB.2.22.394.2109221526520.3554566@eliteleevi.tm.intel.com>
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: 8BIT
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
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

Hi Takashi et al,

I've been having multiple discussions with our i915 team w.r.t. audio 
driver behaviour when the aggregate component is unbound, triggered by 
i915 unbind. This came up again in the recent regression with devres 
allocations and I now dug into the topic again.

In short, I'm puzzled how to really implement this. ALSA (or ASoC) don't 
really have support for individual components of a card disappearing in a 
hotplug fashion. At card level, we do have such support (USB, firewire and 
recent work for PCI hotplug). But not individual components of a card 
getting unplugged.

In current code we have this:
static void hdac_component_master_unbind(struct device *dev)
{
»       struct drm_audio_component *acomp = hdac_get_acomp(dev);

»       if (acomp->audio_ops && acomp->audio_ops->master_unbind)
»       »       acomp->audio_ops->master_unbind(dev, acomp);
»       module_put(acomp->ops->owner);   
»       component_unbind_all(dev, acomp);
»       WARN_ON(acomp->ops || acomp->dev);
}

... when e.g. i915 driver is unbound (but could be any driver using the 
component framework, not jus Intel hw), i915 calls component_del() and HDA
gets call to the above. After this, acomp ops are null are audio no longer
has ability to talk to i915 driver (which makes sense given it's unbound).

If audio was runtime suspended, this kind of works (but relies on some 
good luck). Upon HDA controller resume, we note acomp ops are NULL and 
HDMI/DP operations (like snd_hdac_display_power()) silently become no-ops.
PCM streaming will go to /dev/null, but this is ok'ish since no monitor
can be connected anyways.

If audio was active, we start to get warnings or worse. Audio expects hw 
display codec to be powered and programmed, but suddenly it mey lose 
state. If the audio controller is actually part of the display hardware 
(e.g. discrete GPUs), then controller registers can stop functioning (they
should be still available, but given the main diplay driver is unbound,
odds of suprising behaviour are high).

So this is less than ideal. I've been looking at options:

1) prevent/block the unbind if audio device is busy

The component framework does not allow individual components to return 
-EBUSY, so there's no way to let others know that unbind is not possible 
now.

This would force anyone testing DRM driver unbind to first unbind
the audio driver and stop any active audio use-cases if needed.

2) unbind the ALSA card

I've experimented doing a device_unregister() from the above callback, but 
this has not really worked (onion peeling exercise of new probelms). The 
code is shared by multiple controllers, so getting a handle to an snd_card 
object is not straighforward (drvdata is differnet for SOF and 
snd-hda-intel for instance). But with some new work, maybe we could call
snd_card_disconnect() to detach the card and inform user-space.

3) continue as-is and try to fix bugs

If audio is active, maybe we could force a acomp->put_power() to ensure
a clean unregister of the display part. But this leaves a big chunk of 
issues especially with HDA controllers that require the display to
be powered on, to function.

..

Any ideas, and/or has there been prior work? It seems Takashi it's been 
mostly you who has been active working on the acomp integration recently. 
I also included Chris, Daniel and Jani who've had patches to 
hdac_component.c.

Br, Kai
