Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7518B760F48
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jul 2023 11:33:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C59221579;
	Tue, 25 Jul 2023 11:32:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C59221579
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690277617;
	bh=rF3E86auOt4Wqhsj+lVNV2XwA2lGrsrQFwe4H1ILok8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KNISnW9oGmSuXDVVs1+gG2ejVohAHg2KlDPR473Mpi3nA81KtdsLNigr5akNd8E28
	 QYRHKogPq929c4NDdn9YqxMk4XPrEBbAnAUEurBwjyXkrQzeC8coIP5hL8CWBqVAL0
	 46pBsuTsKdxWO47istS4fcZ/V6pCW2h/21inIBuc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4E4A8F8053B; Tue, 25 Jul 2023 11:27:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 21778F8057B;
	Tue, 25 Jul 2023 11:27:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 75242F8057E; Tue, 25 Jul 2023 11:27:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A8A48F805A9
	for <alsa-devel@alsa-project.org>; Tue, 25 Jul 2023 11:27:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8A48F805A9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=PRo+S7Rm;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=YgzmBwsI
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4325821D19;
	Tue, 25 Jul 2023 09:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1690277248;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dlmzFCGGYQOm0hww9I94vhrQZ+jHyAZdm6rRpIEjF90=;
	b=PRo+S7RmJ6Cc6bdhtacBMBVPU0SqboE3Y7rpFnOiK1Mq9XIrUJP3fSFbZsy9kfFcUwujD5
	WAvLiRQ8NOGIh1o3Ewx9MCTnAAf/Ygz6kKruXb7xNcO4nHY6HHOCwUzydKccfWZjjhOAnQ
	D5GnYf0ugpBwpFhA0yMmZBBMuaJsaq0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1690277248;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dlmzFCGGYQOm0hww9I94vhrQZ+jHyAZdm6rRpIEjF90=;
	b=YgzmBwsIwCX1597u5bMv1SYnvoyq1qC84nN2STKtgbnSxaX9bLFt9yxYC1ntPATTKOE1F2
	uFivkNfbgRwy6UCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AE02A13487;
	Tue, 25 Jul 2023 09:27:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id GCooKX+Vv2RgWQAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 25 Jul 2023 09:27:27 +0000
Date: Tue, 25 Jul 2023 11:27:27 +0200
Message-ID: <87wmyotk74.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Wesley Cheng <quic_wcheng@quicinc.com>,
	agross@kernel.org,
	andersson@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	mathias.nyman@intel.com,
	gregkh@linuxfoundation.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	srinivas.kandagatla@linaro.org,
	bgoswami@quicinc.com,
	Thinh.Nguyen@synopsys.com,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org,
	alsa-devel@alsa-project.org,
	quic_jackp@quicinc.com,
	oneukum@suse.com,
	albertccwang@google.com,
	o-takashi@sakamocchi.jp
Subject: Re: [PATCH v4 31/32] sound: usb: card: Allow for rediscovery of
 connected USB SND devices
In-Reply-To: <671a524d-b4c8-78d8-33de-40170a23d189@linux.intel.com>
References: <20230725023416.11205-1-quic_wcheng@quicinc.com>
	<20230725023416.11205-32-quic_wcheng@quicinc.com>
	<671a524d-b4c8-78d8-33de-40170a23d189@linux.intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: BOO7PEVI4R6QK37Y7JNBSOI7UUEIVBTC
X-Message-ID-Hash: BOO7PEVI4R6QK37Y7JNBSOI7UUEIVBTC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BOO7PEVI4R6QK37Y7JNBSOI7UUEIVBTC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 25 Jul 2023 11:15:11 +0200,
Pierre-Louis Bossart wrote:
> 
> 
> 
> On 7/25/23 04:34, Wesley Cheng wrote:
> > In case of notifying SND platform drivers of connection events, some of
> > these use cases, such as offloading, require an ASoC USB backend device to
> > be initialized before the events can be handled.  If the USB backend device
> > has not yet been probed, this leads to missing initial USB audio device
> > connection events.
> > 
> > Expose an API that traverses the usb_chip array for connected devices, and
> > to call the respective connection callback registered to the SND platform
> > driver.
> > 
> > Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> > ---
> >  sound/usb/card.c | 19 +++++++++++++++++++
> >  sound/usb/card.h |  2 ++
> >  2 files changed, 21 insertions(+)
> > 
> > diff --git a/sound/usb/card.c b/sound/usb/card.c
> > index 365f6d978608..27a89aaa0bf3 100644
> > --- a/sound/usb/card.c
> > +++ b/sound/usb/card.c
> > @@ -170,6 +170,25 @@ struct snd_usb_stream *snd_usb_find_suppported_substream(int card_idx,
> >  }
> >  EXPORT_SYMBOL_GPL(snd_usb_find_suppported_substream);
> >  
> > +/*
> > + * in case the platform driver was not ready at the time of USB SND
> > + * device connect, expose an API to discover all connected USB devices
> > + * so it can populate any dependent resources/structures.
> > + */
> > +void snd_usb_rediscover_devices(void)
> > +{
> > +	int i;
> > +
> > +	mutex_lock(&register_mutex);
> > +	for (i = 0; i < SNDRV_CARDS; i++) {
> > +		if (usb_chip[i])
> > +			if (platform_ops && platform_ops->connect_cb)
> > +				platform_ops->connect_cb(usb_chip[i]);
> 
> what happens if the USB device is removed while the platform device adds
> a port?

That should be protected by the register_mutex.  But there can be
other races (see below :)

> This sounds super-racy to me. It's the same set of problems we're having
> between audio and display/DRM, I would be surprised if this function
> dealt with all corner cases of insertion/removal, bind/unbind.

Yes, we need to be more careful about binding.

For example, in the current patch set, I see no way to prevent
unloading snd-usb-audio-qmi module, and it allows user to cut off the
stuff during operation, which may break things while the kernel is
running the code of the unloaded module.  You need to have a proper
module refcount management for avoiding such a scenario.  Most of
drivers don't need it because ALSA core part already takes care of
it.  But in this case, it requires a manual adjustment.


Takashi
