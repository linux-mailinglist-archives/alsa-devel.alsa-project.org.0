Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 60AEC5EB6C6
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Sep 2022 03:23:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC7D8825;
	Tue, 27 Sep 2022 03:22:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC7D8825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664241805;
	bh=hp+Getvf20REd13CjkVP1RLdAGelfRkM6LL+Ec+Lp6g=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=j4g97QhgNjQiXBd6eEAehYICgDcM3VAeqTDR2SYUknWBLYfDQcM1Z5vSMPm6k1j6C
	 mWZt23oJHj3tbD7VkU6klZC6iOx5Nkj+g/0zhGyTYV4f8EQSg18fR0KmCgXdwjvJPF
	 fmsThnCXMJJy2JuA1SBvg2zOxfVoqGQYygJxrPZU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 444A7F80134;
	Tue, 27 Sep 2022 03:22:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3713AF80134; Tue, 27 Sep 2022 03:22:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F1271F80134
 for <alsa-devel@alsa-project.org>; Tue, 27 Sep 2022 03:22:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F1271F80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="Fvr3CKnL"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="IgtgZJwq"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id A5F32320096F;
 Mon, 26 Sep 2022 21:22:13 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 26 Sep 2022 21:22:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1664241733; x=1664328133; bh=Cj
 vFxcEc3dKpGFXXUMsJEmLNS/6S2FoZIh9mpElYBRY=; b=Fvr3CKnL8ZRmI2/bCB
 zNpZPmIv3qntsOyAhfcnmQgqeMwAtUlBg1SB3krVvp+Aaz4F7igSsfAbVco7YufG
 fJV2KN+GEthi3/7tW9wDvFq8ev/MnmSui9oEQ1xZ1ZWvo1ECjG0oZmXUG9tgInx3
 zfINSebPjm2zqHrOxpEMCOK4jJ0+tejpXoWmhljCQ4aJ8JkHm4w9mqkCWdWQKbrQ
 HdhbQTjeonYFk5xqoq9Ya65SxCNwatv5Y8dy0RA7/NWcKrg5oZh4uEP8wOvXNHCx
 iewgEBmxeq0yGOOYReB7ZIW4dM6d68E6Zut5m1pZMKToXvpMn9zqyC0TTouB82Aw
 fa9Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1664241733; x=1664328133; bh=CjvFxcEc3dKpGFXXUMsJEmLNS/6S
 2FoZIh9mpElYBRY=; b=IgtgZJwqLfAoBWWHQomfVVFNmZNJFV3UBmV5ymqF8R4W
 kzhXO6+I9AzYXD7eBrq0LZIZiFge6w+QCwwtuE9F+6idt1Hd/KuucrOYpgEWWsQw
 DvQAWjGf1BG86r7crt3vroEBCZUETMmStn+8f5SgT3Kv98kCog5sSdQtiQ1hggRv
 E3uCWnjOS9NMlOr5wakAFBz8KPn0Zf98nlQlOzi7s4wB0j/d5I1SfV8JJXCkHDsD
 ROUewS18PyUiNrPXQeypv1qkKABMvhZgu0Z9Q7exQytoOgN0FnGfscb43C+BKiTX
 90yVKcDppCDVIDSlhjHjYcXBA1MG5k1L3JEeVQbYqw==
X-ME-Sender: <xms:RFAyYzAAhiaDY_rEK1FB8COnkkzNy5SKbP9_YilTItn9MXwJxlUoAg>
 <xme:RFAyY5hQb98KtDgW1SZHctugzu1eSdp8rP2QB5uKySbzN6a37VTmFGtiPOPN1ppEQ
 PFbAZmH0vDatmpXb58>
X-ME-Received: <xmr:RFAyY-k4TjiA6zMczVleHg--JnVRWV2Az6bUWPJj--ASEf5YMrR_9R-d3AeMiplOMcDuywSQ6KfnEGKzFi1XYu-h5R3NAhL3>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeegfedggeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepvfgrkhgr
 shhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhird
 hjpheqnecuggftrfgrthhtvghrnhephefhhfettefgkedvieeuffevveeufedtlefhjeei
 ieetvdelfedtgfefuedukeeunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
 hmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:RFAyY1z9Hgok1woA3C1hVmKHNbwwjbKrIiLx0VjgyghOZRtfLi-s3A>
 <xmx:RFAyY4RM5rtU4nzK8jCTtyyJRXrgOHM4xBZZv3kCzw4voxjuQWATpw>
 <xmx:RFAyY4bIY2ytS6CgnqzE3GZHS8-GvSIQToG1hZ3tS5J6AIAByyPvAQ>
 <xmx:RVAyY9IHST7benZBQz_LBu1mGz6RUYEiMb2ojgwNs8c1gRDRj-Glvw>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 26 Sep 2022 21:22:09 -0400 (EDT)
Date: Tue, 27 Sep 2022 10:22:07 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH 00/11] ALSA: PCM state reference optimization
Message-ID: <YzJQP26l3k7yrTrs@workstation>
Mail-Followup-To: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Felipe Balbi <balbi@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
References: <20220926135558.26580-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220926135558.26580-1-tiwai@suse.de>
Cc: Felipe Balbi <balbi@kernel.org>, alsa-devel@alsa-project.org,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

Hi,

On Mon, Sep 26, 2022 at 03:55:47PM +0200, Takashi Iwai wrote:
> Hi,
> 
> this is a patch set for simplifying the reference to the current PCM
> state by having the local copy in runtime instead of relying on
> runtime->status indirection.  This also hardens against the attack by
> modifying the mmapped status record.
 
The overall patches looks good to me and I have no objections, while I
have some slight opinions to them in a place of sound driver developer.

> The first patch does the basic job in the core PCM side,

The main concern is indirect accessing to state field via some pointer
hops. I think addition of helper macro at first step eases centre of your
work, like:

```
diff --git a/include/sound/pcm.h b/include/sound/pcm.h
index 8c48a5bce88c..f6a160cb8135 100644
--- a/include/sound/pcm.h
+++ b/include/sound/pcm.h
@@ -669,6 +669,20 @@ void snd_pcm_stream_unlock_irqrestore(struct snd_pcm_substream *substream,
             stream <= SNDRV_PCM_STREAM_LAST;           \
             stream++)
 
+/**
+ * snd_pcm_stream_state - Return state in runtime of the PCM substream.
+ * @substream: substream to check. runtime should be attached.
+ *
+ * Return state in runtime of the PCM substream. The substream should exists and
+ * runtime should be attached to it.
+ */
+static inline snd_pcm_state_t snd_pcm_stream_state(const snd_pcm_substream *substream)
+{
+       snd_BUG_ON(!(sub) || !(sub)->runtime);
+
+       return substream->runtime->status->state;
+}
```

As we can see, sound driver programmer sometimes checks state of runtime
in their code, thus the macro could helps them as well as centre of your
change.

> and the
> second patch flips the PCM status mmap to read-only for hardening,

The patch looks good to me as well as the patch for asihpi driver, and
should be in your tree independent from the others.

> while the remaining patches are for drivers to follow the core
> change.
>
> The conversions are straightforward.  In most places, it's just
> replacing runtime->status->state with runtime->state.

The usage of mentioned macro can control the concerned access. Now
addition of new field, `state` to runtime structure can be done easily.


> Takashi
> 
> ===
> 
> Takashi Iwai (11):
>   ALSA: pcm: Avoid reference to status->state
>   ALSA: pcm: Make mmap status read-only
>   ALSA: aloop: Replace runtime->status->state reference to
>     runtime->state
>   ALSA: firewire: Replace runtime->status->state reference to
>     runtime->state
>   ALSA: hda: Replace runtime->status->state reference to runtime->state
>   ALSA: asihpi: Replace runtime->status->state reference to
>     runtime->state
>   ALSA: usb-audio: Replace runtime->status->state reference to
>     runtime->state
>   ALSA: usx2y: Replace runtime->status->state reference to
>     runtime->state
>   ASoC: intel: Replace runtime->status->state reference to
>     runtime->state
>   ASoC: sh: Replace runtime->status->state reference to runtime->state
>   usb: gadget: Replace runtime->status->state reference to
>     runtime->state
> 
>  drivers/usb/gadget/function/u_uac1_legacy.c |   4 +-
>  include/sound/pcm.h                         |  20 ++-
>  sound/core/oss/pcm_oss.c                    |  42 +++----
>  sound/core/pcm.c                            |   9 +-
>  sound/core/pcm_compat.c                     |   4 +-
>  sound/core/pcm_lib.c                        |  16 +--
>  sound/core/pcm_native.c                     | 128 ++++++++++----------
>  sound/drivers/aloop.c                       |   4 +-
>  sound/firewire/bebob/bebob_pcm.c            |   4 +-
>  sound/firewire/dice/dice-pcm.c              |   4 +-
>  sound/firewire/digi00x/digi00x-pcm.c        |   4 +-
>  sound/firewire/fireface/ff-pcm.c            |   4 +-
>  sound/firewire/fireworks/fireworks_pcm.c    |   4 +-
>  sound/firewire/motu/motu-pcm.c              |   4 +-
>  sound/firewire/oxfw/oxfw-pcm.c              |   8 +-
>  sound/firewire/tascam/tascam-pcm.c          |   4 +-
>  sound/hda/hdmi_chmap.c                      |   2 +-
>  sound/pci/asihpi/asihpi.c                   |   2 +-
>  sound/soc/intel/skylake/skl-pcm.c           |   4 +-
>  sound/soc/sh/rz-ssi.c                       |   2 +-
>  sound/usb/pcm.c                             |   4 +-
>  sound/usb/usx2y/usbusx2yaudio.c             |   3 +-
>  sound/usb/usx2y/usx2yhwdeppcm.c             |   3 +-
>  23 files changed, 150 insertions(+), 133 deletions(-)
> 
> ===
> 
> Cc: Bard Liao <yung-chuan.liao@linux.intel.com>
> Cc: Cezary Rojewski <cezary.rojewski@intel.com>
> Cc: Felipe Balbi <balbi@kernel.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>
> Cc: Liam Girdwood <liam.r.girdwood@linux.intel.com>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
> Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Cc: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> Cc: Takashi Sakamoto <o-takashi@sakamocchi.jp>
> 
> -- 
> 2.35.3

Regards

Takashi Sakamoto
