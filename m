Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 08246779E08
	for <lists+alsa-devel@lfdr.de>; Sat, 12 Aug 2023 10:18:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5E93C822;
	Sat, 12 Aug 2023 10:18:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5E93C822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691828331;
	bh=e4OD5R8FVjiAlVwqAq9Ol8nYrjR2+Nvlmc/1lmNT7FE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=c07lkPELXhDHooryhHgIeychLbTD86hSeoyABP55lgoEAn301PwfwBZkYMXCCJ7Uk
	 KTvGnj/eq1s4d8GZytrchh/O3Uxr0UBJgcUpkdKnI4swQqzbtC35Sfcrs7Fh8c93Zy
	 qP9NUG65DC4zDbcGZBWBNzb+jqLSC3wkXRX5TIMI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BE493F801EB; Sat, 12 Aug 2023 10:18:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3EEB9F80134;
	Sat, 12 Aug 2023 10:18:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E908CF80166; Sat, 12 Aug 2023 10:17:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 43BE7F800F4;
	Sat, 12 Aug 2023 10:17:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43BE7F800F4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=O7RGBn5m;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=L9q1qNWa
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C034F2189C;
	Sat, 12 Aug 2023 08:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1691828222;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IvbMXIj3oMLFsiOocJzfiZGs8fX86KHXcj7ZvFKQQVk=;
	b=O7RGBn5moLPNITcUn0kfD/vOLcBD6GFK4QnVYDsjy7Qz8afPdJ22PHrKAYo5HP3Yw8Y4+v
	84b8DzhjYKJja13IMOfaxTECXLiw9ltjQOwdHo8FdEK1UZ2cZOIfzQIlhAE9haZlBZQeMX
	qjG9acIyKUKKfRzLo+UVFGblrX+w7Yk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1691828222;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IvbMXIj3oMLFsiOocJzfiZGs8fX86KHXcj7ZvFKQQVk=;
	b=L9q1qNWagPfhKOtQ3dwiY6eHpudGDCwrbAGeYO6vSzT/GsVQv3x0tUbvjVy4hj93o1301Y
	t2vdxLf060vLxmAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 45A4613274;
	Sat, 12 Aug 2023 08:17:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id eZH/Dv4/12S9FgAAMHmgww
	(envelope-from <tiwai@suse.de>); Sat, 12 Aug 2023 08:17:02 +0000
Date: Sat, 12 Aug 2023 10:17:01 +0200
Message-ID: <87a5uwr7ya.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	alsa-devel@alsa-project.org,
	Maarten Lankhorst <dev@lankhorst.se>,
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
In-Reply-To: <4acc7318-69b3-3eb5-1fe8-f7deea8adfad@linux.intel.com>
References: <20230807090045.198993-1-maarten.lankhorst@linux.intel.com>
	<20230807090045.198993-9-maarten.lankhorst@linux.intel.com>
	<4acc7318-69b3-3eb5-1fe8-f7deea8adfad@linux.intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: TUTDMSV4HQ2OFY3GIHENLXRVJL7SDCF7
X-Message-ID-Hash: TUTDMSV4HQ2OFY3GIHENLXRVJL7SDCF7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TUTDMSV4HQ2OFY3GIHENLXRVJL7SDCF7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 07 Aug 2023 16:26:53 +0200,
Pierre-Louis Bossart wrote:
> 
> 
> 
> On 8/7/23 04:00, Maarten Lankhorst wrote:
> > Now that we can use -EPROBE_DEFER, it's no longer required to spin off
> > the snd_hdac_i915_init into a workqueue.
> > 
> > Use the -EPROBE_DEFER mechanism instead, which must be returned in the
> > probe function.
> 
> I don't think this patch is aligned with the previous discussions. What
> we agreed on is that snd_hdac_i915_init() would be called from and not
> from the workqueue.
> 
> But this patch also moves all codec initialization out of the workqueue.
> 
> I think we need two callbacks for device-specific initilization, one
> that is called from the probe function and one from the workqueue,
> otherwise we'll have a structure that differs from the snd-hda-intel -
> which would be rather silly in terms of support/debug.
> 
> I realize there's quite a bit of surgery involved, and most likely the
> SOF folks should provide this patch for you to build on.

So this patch looks like the only significant concern in the whole
patch set.  Can we reach to some agreement for merging to 6.6 in time?


thanks,

Takashi
