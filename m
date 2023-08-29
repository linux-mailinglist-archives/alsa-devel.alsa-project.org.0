Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 14BB278C6E1
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Aug 2023 16:07:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 48A381F2;
	Tue, 29 Aug 2023 16:06:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 48A381F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693318052;
	bh=V8og7F98B7bYgHw01piphPhBi9cts8reFsop7nuju6s=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=om8BsbU4aSRfkngTPT1GiV7qY7/oKGlnVEhvFJmghHg2rmDPt/FDDCL0Ab0fxsXyB
	 tLAcp9C8cTntlOjDQZU/X/YqKjxLp3DxXTYgFT/23TTETmfxRsJleAUFfSjbkqBali
	 ehdH8dzqX0liVPaCwuZ7q7lUbiFseSW0PPOKb7IU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E2795F80236; Tue, 29 Aug 2023 16:06:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B1BDCF80155;
	Tue, 29 Aug 2023 16:06:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 57933F80236; Tue, 29 Aug 2023 16:06:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2DA62F800D1
	for <alsa-devel@alsa-project.org>; Tue, 29 Aug 2023 16:06:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2DA62F800D1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=Icu3cYn7;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=ddNrhpwt
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 037EB1F45B;
	Tue, 29 Aug 2023 14:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1693317995;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bRHPiHCMm5kQciIqN85NnbPa+/D3qdXc+l72vu74acc=;
	b=Icu3cYn7A3Kh+pBbrf1rF9LltMScuNV/n0baffUrrjtxAYQ+ncJ4dOsKx6w6MYDBJFnROM
	NOZOnUkNeXEfIv6Uzbn6FhcQoZLsSFce/t+hcdRNEgz2BAmWW7Zzy+NHG0xwjbRgQNPOat
	8Pc2awNUB1gXfd7t5bzLKWoU8zhUeVg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1693317995;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bRHPiHCMm5kQciIqN85NnbPa+/D3qdXc+l72vu74acc=;
	b=ddNrhpwtKRvVRK5RzwIkRRwEEzp36nl+O26eBAnst4HGo76Ah9V9YRErUFvt6TJHJs4oiz
	xApRR/StlVseWQAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6B875138E2;
	Tue, 29 Aug 2023 14:06:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id G+1JGWr77WQMcwAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 29 Aug 2023 14:06:34 +0000
Date: Tue, 29 Aug 2023 16:06:33 +0200
Message-ID: <87sf82t02e.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: Pierre-Louis Bossart
	<pierre-louis.bossart@linux.intel.com>,
	<agross@kernel.org>,
	<andersson@kernel.org>,
	<robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>,
	<conor+dt@kernel.org>,
	<catalin.marinas@arm.com>,
	<will@kernel.org>,
	<mathias.nyman@intel.com>,
	<gregkh@linuxfoundation.org>,
	<lgirdwood@gmail.com>,
	<broonie@kernel.org>,
	<perex@perex.cz>,
	<tiwai@suse.com>,
	<srinivas.kandagatla@linaro.org>,
	<bgoswami@quicinc.com>,
	<Thinh.Nguyen@synopsys.com>,
	<linux-arm-msm@vger.kernel.org>,
	<devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<linux-usb@vger.kernel.org>,
	<alsa-devel@alsa-project.org>,
	<quic_jackp@quicinc.com>,
	<oneukum@suse.com>,
	<albertccwang@google.com>,
	<o-takashi@sakamocchi.jp>
Subject: Re: [PATCH v4 31/32] sound: usb: card: Allow for rediscovery of
 connected USB SND devices
In-Reply-To: <2c0e76ab-1e3a-70d6-24dc-32b2e66c2a3a@quicinc.com>
References: <20230725023416.11205-1-quic_wcheng@quicinc.com>
	<20230725023416.11205-32-quic_wcheng@quicinc.com>
	<671a524d-b4c8-78d8-33de-40170a23d189@linux.intel.com>
	<87wmyotk74.wl-tiwai@suse.de>
	<2c0e76ab-1e3a-70d6-24dc-32b2e66c2a3a@quicinc.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: O3KNAFIDOCG36QKG44ZXEIPXIOZ2CEPK
X-Message-ID-Hash: O3KNAFIDOCG36QKG44ZXEIPXIOZ2CEPK
X-MailFrom: tiwai@suse.de
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/O3KNAFIDOCG36QKG44ZXEIPXIOZ2CEPK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 28 Aug 2023 23:25:14 +0200,
Wesley Cheng wrote:
> 
> Hi Takashi,
> 
> On 7/25/2023 2:27 AM, Takashi Iwai wrote:
> > On Tue, 25 Jul 2023 11:15:11 +0200,
> > Pierre-Louis Bossart wrote:
> >> 
> >> 
> >> 
> >> On 7/25/23 04:34, Wesley Cheng wrote:
> >>> In case of notifying SND platform drivers of connection events, some of
> >>> these use cases, such as offloading, require an ASoC USB backend device to
> >>> be initialized before the events can be handled.  If the USB backend device
> >>> has not yet been probed, this leads to missing initial USB audio device
> >>> connection events.
> >>> 
> >>> Expose an API that traverses the usb_chip array for connected devices, and
> >>> to call the respective connection callback registered to the SND platform
> >>> driver.
> >>> 
> >>> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> >>> ---
> >>>   sound/usb/card.c | 19 +++++++++++++++++++
> >>>   sound/usb/card.h |  2 ++
> >>>   2 files changed, 21 insertions(+)
> >>> 
> >>> diff --git a/sound/usb/card.c b/sound/usb/card.c
> >>> index 365f6d978608..27a89aaa0bf3 100644
> >>> --- a/sound/usb/card.c
> >>> +++ b/sound/usb/card.c
> >>> @@ -170,6 +170,25 @@ struct snd_usb_stream *snd_usb_find_suppported_substream(int card_idx,
> >>>   }
> >>>   EXPORT_SYMBOL_GPL(snd_usb_find_suppported_substream);
> >>>   +/*
> >>> + * in case the platform driver was not ready at the time of USB SND
> >>> + * device connect, expose an API to discover all connected USB devices
> >>> + * so it can populate any dependent resources/structures.
> >>> + */
> >>> +void snd_usb_rediscover_devices(void)
> >>> +{
> >>> +	int i;
> >>> +
> >>> +	mutex_lock(&register_mutex);
> >>> +	for (i = 0; i < SNDRV_CARDS; i++) {
> >>> +		if (usb_chip[i])
> >>> +			if (platform_ops && platform_ops->connect_cb)
> >>> +				platform_ops->connect_cb(usb_chip[i]);
> >> 
> >> what happens if the USB device is removed while the platform device adds
> >> a port?
> > 
> > That should be protected by the register_mutex.  But there can be
> > other races (see below :)
> > 
> >> This sounds super-racy to me. It's the same set of problems we're having
> >> between audio and display/DRM, I would be surprised if this function
> >> dealt with all corner cases of insertion/removal, bind/unbind.
> > 
> > Yes, we need to be more careful about binding.
> > 
> > For example, in the current patch set, I see no way to prevent
> > unloading snd-usb-audio-qmi module, and it allows user to cut off the
> > stuff during operation, which may break things while the kernel is
> > running the code of the unloaded module.  You need to have a proper
> > module refcount management for avoiding such a scenario.  Most of
> > drivers don't need it because ALSA core part already takes care of
> > it.  But in this case, it requires a manual adjustment.
> > 
> 
> Sorry for the delayed response...this was routed to another folder,
> and missed it.
> 
> I see, that is a valid situation, so I think the best way to address
> it is to do something like the following:
> 
> static void __exit qc_usb_audio_offload_exit(void)
> {
> ...
> 	snd_usb_unregister_platform_ops();
> 	for (idx = 0; idx < SNDRV_CARDS; idx++)
> 		qc_usb_audio_offload_disconnect(uadev[idx].chip);
> 
> We'll first unregister the platform ops, so that we get no further
> connect/disconnect CBs, and then we'll forcefully ensure that all
> devices are removed/cleaned.  Part of the USB offload disconnect
> sequence will also forcefully stop the offload path on the external
> DSP by issuing a disconnect indication QMI message.
> 
> Then we can safely clean up the rest of the resources.  We do have
> refcounting in place for several of the other structures, but I think
> in the module exit case, we need to ensure the offload path is stopped
> fully.

Yes, the proper disconnection procedure is mandatory.
In addition, you can have a module refcount increment upon the card
binding, too.  This may prevent the unexpected exit (although it's
often still possible to unbind via sysfs).


thanks,

Takashi
