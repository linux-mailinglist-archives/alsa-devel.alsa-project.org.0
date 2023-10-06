Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC7C7BB40A
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Oct 2023 11:15:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AAEA8829;
	Fri,  6 Oct 2023 11:14:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AAEA8829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696583746;
	bh=iV/9R80a0s5Pfp554nsDMDmgQ9E4nn7c4rJtmvT5+UI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Vs+N0EpnWt/0MIxbvrk4YVbwU+Jg/aT7Uvw/PnB24VhAGLssZ34xRxzzMU/+Lma71
	 1zoz99EP+/RrPVcG0VxPUiD4ujSIt//4PcYJStmJT3XH8ZRDILRlVZf/AJxPxONMqM
	 nigODkdBse4hbjpv1+A7NLvp9nj+vLCrHZMSkYAw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BF2DAF80552; Fri,  6 Oct 2023 11:14:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4FF93F80310;
	Fri,  6 Oct 2023 11:14:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 38833F8047D; Fri,  6 Oct 2023 11:14:22 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 54753F801EB
	for <alsa-devel@alsa-project.org>; Fri,  6 Oct 2023 11:14:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54753F801EB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=D2OG2T53;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=oUz6AEgx
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C4B9C21878;
	Fri,  6 Oct 2023 09:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1696583659;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gl0+NHc5htZ4Tkar7BUm/HZZN3m+SeL6z/28Kd0Ifo4=;
	b=D2OG2T532StiFn7CiZxVeB7t6uMhqWjo9FVP0XdD/bm8S/Svn5f90TtLJad+bnV0GPV8Cg
	//TjvaWbLn0Wa4ODwph0UiaLB5ZitwTE14Dx9b89IfXxI/B2F9vlLwGMZFJmPvJXDmb4pt
	+hUO9LxlxRfNUPPGtujC/0FO3VMZ314=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1696583659;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gl0+NHc5htZ4Tkar7BUm/HZZN3m+SeL6z/28Kd0Ifo4=;
	b=oUz6AEgxq5+9Awg8qFWOsIhvFn9i6wyls89QwARkd8EDK0FC0X2N2mw3ekZECRGXMBb/qU
	BQI2rDhu585N9aCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8CEAE13586;
	Fri,  6 Oct 2023 09:14:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id ZkJLIevPH2UIMAAAMHmgww
	(envelope-from <tiwai@suse.de>); Fri, 06 Oct 2023 09:14:19 +0000
Date: Fri, 06 Oct 2023 11:14:19 +0200
Message-ID: <87fs2ow1sk.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: <broonie@kernel.org>,
	<tiwai@suse.com>,
	<alsa-devel@alsa-project.org>,
	<perex@perex.cz>,
	<amadeuszx.slawinski@linux.intel.com>,
	<pierre-louis.bossart@linux.intel.com>,
	<hdegoede@redhat.com>
Subject: Re: [PATCH v3 0/4] ALSA: hda: Abstract and update HOST-stream setup
 procedure
In-Reply-To: <bb4d4eb6-9bca-f007-da90-f38f910fa541@intel.com>
References: <20230926080623.43927-1-cezary.rojewski@intel.com>
	<87y1ggw36h.wl-tiwai@suse.de>
	<bb4d4eb6-9bca-f007-da90-f38f910fa541@intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: PNTA5DMUG52UO53EZ3AVVRRXFHZZLYP2
X-Message-ID-Hash: PNTA5DMUG52UO53EZ3AVVRRXFHZZLYP2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PNTA5DMUG52UO53EZ3AVVRRXFHZZLYP2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 06 Oct 2023 11:01:44 +0200,
Cezary Rojewski wrote:
> 
> On 2023-10-06 10:44 AM, Takashi Iwai wrote:
> > On Tue, 26 Sep 2023 10:06:19 +0200,
> > Cezary Rojewski wrote:
> >> 
> >> The patchset targets two intertwined topics:
> >> 
> >> The driver shall poll SDxFIFOS to ensure a valid value is set by the
> >> controller after programming SDxFMT. Due to amount of users and
> >> limited-number of configuration available in our CI when compared to
> >> overall possibilities on the market, the check is non-blocking.
> >> 
> >> Second topic relates to stream setup procedure. The procedure differs
> >> between HDAudio controller device revisions. Right now those differences
> >> are handled directly by a platform driver. Existing top-level
> >> 'if (pci->device == APL)' could be replaced by a abstraction in lower
> >> parts of the code instead.
> >> 
> >> With that done, the two users are updated accordingly. In avs-driver
> >> case, this updates the flow to the recommended one.
> >> 
> >> Changes in v3:
> >> - fixed issues pointed out by scripts/kernel-doc
> >> 
> >> Changes in v2:
> >> - fixed ->host_setup assignment in patch 02/04
> >> 
> >> Cezary Rojewski (4):
> >>    ALSA: hda: Poll SDxFIFOS after programming SDxFMT
> >>    ALSA: hda: Introduce HOST stream setup mechanism
> >>    ASoC: Intel: avs: Use helper to setup HOST stream
> >>    ASoC: Intel: Skylake: Use helper to setup HOST stream
> > 
> > Sorry for the late reaction, as I've been (still) off since the last
> > week.
> > 
> > Now applied now to for-next branch.
> 
> Hello Takashi,
> 
> Now I'm the one sorry for the late replay - I've found two new things
> when fixing the debug message (reported by me in patch 1/4).
> - null-ptr-deref when assigning hdac_stream (when type=COUPLED)
> - azx_dev->fifo_size is initialized incorrectly
> 
> It's good to debug things, you never know what you may find!
> 
> May I send v4 as a collective update? It would address the two above
> and the false-positive debug message that appears when code-loading
> AudioDSP firmware.

As other patches have been already applied, could you submit the
incremental fixes on top of v3 instead?  You can see the latest state
in for-next branch of sound.git tree.


thanks,

Takashi
