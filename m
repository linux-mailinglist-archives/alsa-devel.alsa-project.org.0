Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 55E13780A55
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Aug 2023 12:40:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F1815DF5;
	Fri, 18 Aug 2023 12:39:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F1815DF5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692355220;
	bh=vFAZ1Utliu702svOrf5d6FWGD+PrHHslBoI4AdL29VM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qlgam9OfB4RkIGhpUMorReuiKF0onZuRcKZzM+xVIiOmZPnvkkCkDFpB73F2ssDhS
	 ebKNHlV6cAeTbUXjifBZiO2H/CxWZxfRKwc7ZbKEOnP02oBC9nXkDUQqWVJooWvtRK
	 LOtvS60jyeekWKt+r30eFr9s0y3eAprFvudn7pt0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E76BAF80510; Fri, 18 Aug 2023 12:39:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 74539F8016D;
	Fri, 18 Aug 2023 12:39:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3B09FF801EB; Fri, 18 Aug 2023 12:39:24 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id B68DFF800D1;
	Fri, 18 Aug 2023 12:39:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B68DFF800D1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=i6i2iYH0;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=xg17N/4n
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B9F581F893;
	Fri, 18 Aug 2023 10:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1692355155;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1ZxOFOqZ8j/xd34qYyUl+ijDWWP7dMV+5Bn8jWfWbs8=;
	b=i6i2iYH0Ic7tq0OvRkJIjIoOALPVmAymozb0qpuVj49S+eNN0OfnqiVv8z7YBsnOpU8Rw6
	vn2uJY5pWo5K5FMzRzhLs/vKIVdGCzvr78RG9y46HdVgiukWklthL0AKkXMr2hBgtj5hui
	m7ZdAkblq3QASiErqA+RFNIvq6DdBJI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1692355155;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1ZxOFOqZ8j/xd34qYyUl+ijDWWP7dMV+5Bn8jWfWbs8=;
	b=xg17N/4nYs6XoaGiXbnZah+OgVQ0JPsvLycTIjQTGmpBHmMk5HMsdh06CwoPIY7SfoB9i+
	q+fSGvz8bc2me7BQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6DEE7138F0;
	Fri, 18 Aug 2023 10:39:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id IckcGlNK32SuSwAAMHmgww
	(envelope-from <tiwai@suse.de>); Fri, 18 Aug 2023 10:39:15 +0000
Date: Fri, 18 Aug 2023 12:39:14 +0200
Message-ID: <87il9ck52l.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Maarten Lankhorst <dev@lankhorst.se>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	alsa-devel@alsa-project.org,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Mark Brown
 <broonie@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	linux-kernel@vger.kernel.org,
	sound-open-firmware@alsa-project.org
Subject: Re: [PATCH v3 8/9] ASoC: SOF: Intel: Move binding to display driver
 outside of deferred probe
In-Reply-To: <e88d139f-e62b-1654-0d35-a46c698298c6@lankhorst.se>
References: <20230807090045.198993-1-maarten.lankhorst@linux.intel.com>
	<20230807090045.198993-9-maarten.lankhorst@linux.intel.com>
	<4acc7318-69b3-3eb5-1fe8-f7deea8adfad@linux.intel.com>
	<87a5uwr7ya.wl-tiwai@suse.de>
	<e88d139f-e62b-1654-0d35-a46c698298c6@lankhorst.se>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: SRRQBOFCDYOBV7BO233MGEB5UYLISM4G
X-Message-ID-Hash: SRRQBOFCDYOBV7BO233MGEB5UYLISM4G
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SRRQBOFCDYOBV7BO233MGEB5UYLISM4G/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 14 Aug 2023 16:26:01 +0200,
Maarten Lankhorst wrote:
> 
> Ping on this?

Pierre?  Does one of your recent patch sets achieves the suggested
thing?  Or do we need another rewrite/respin of this series?
Currently it's blocking the merge for 6.6.


Takashi

> On 2023-08-12 10:17, Takashi Iwai wrote:
> > On Mon, 07 Aug 2023 16:26:53 +0200,
> > Pierre-Louis Bossart wrote:
> >> 
> >> 
> >> 
> >> On 8/7/23 04:00, Maarten Lankhorst wrote:
> >>> Now that we can use -EPROBE_DEFER, it's no longer required to spin off
> >>> the snd_hdac_i915_init into a workqueue.
> >>> 
> >>> Use the -EPROBE_DEFER mechanism instead, which must be returned in the
> >>> probe function.
> >> 
> >> I don't think this patch is aligned with the previous discussions. What
> >> we agreed on is that snd_hdac_i915_init() would be called from and not
> >> from the workqueue.
> >> 
> >> But this patch also moves all codec initialization out of the workqueue.
> >> 
> >> I think we need two callbacks for device-specific initilization, one
> >> that is called from the probe function and one from the workqueue,
> >> otherwise we'll have a structure that differs from the snd-hda-intel -
> >> which would be rather silly in terms of support/debug.
> >> 
> >> I realize there's quite a bit of surgery involved, and most likely the
> >> SOF folks should provide this patch for you to build on.
> > 
> > So this patch looks like the only significant concern in the whole
> > patch set.  Can we reach to some agreement for merging to 6.6 in time?
> > 
> > 
> > thanks,
> > 
> > Takashi
> 
