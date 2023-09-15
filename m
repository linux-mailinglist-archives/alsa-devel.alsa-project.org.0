Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 792947A22F1
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Sep 2023 17:50:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 804F8886;
	Fri, 15 Sep 2023 17:49:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 804F8886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694793010;
	bh=y25j1oMbkMZ47n/dJhfOfA2FHxJHHHUnfxxxXuyv1g8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mmNgra+ng4ZrBgL7KvsediL/t9OQ0HqzzE6u9pin9igvW/f/BSTVyEZnkL5PfnNdw
	 c5/VkdSsz11WRe+wUeUGeGJZbOrZLOuLXkRcZhj1qF4CHmUInZDDa1owwg8V/kZHZj
	 bdUTkopCLvDzPw21spT9+7++BkiczquyaY9cowrM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CD9BFF80551; Fri, 15 Sep 2023 17:49:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 86D0BF80246;
	Fri, 15 Sep 2023 17:49:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4E25AF80425; Fri, 15 Sep 2023 17:49:16 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 3EDD6F801F5
	for <alsa-devel@alsa-project.org>; Fri, 15 Sep 2023 17:49:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3EDD6F801F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=OKvcYTlc;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=jsxsdJ0g
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 922E9218F6;
	Fri, 15 Sep 2023 15:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1694792953;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ESanb4EoSX6PvVYr7siEKltKwnIsAMrYzHVjTEKNxZc=;
	b=OKvcYTlcY8fb8/8RR+EA+/kAESXV3JCr2PrvyBPso2bbMrZJ84MUvhlwuGfAogF/OELkIh
	YMCc/LlAVpzyWhYbLkIbVY7c5iqheJ/iy/xoNtUei+xKBGqLA+y2OBlYyWjncm0oWcDlKI
	7mI0w3k7EoCQWhoFPWODtw/qdmjjIB8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1694792953;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ESanb4EoSX6PvVYr7siEKltKwnIsAMrYzHVjTEKNxZc=;
	b=jsxsdJ0gXNXpY/9MtkMdqZc4pAb3qIJ6xe3zQLn4J3BXt+BiYiR2x/jASgvDMGVLGVi2kN
	Y6fHJ2gNi6OfhqCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 531631358A;
	Fri, 15 Sep 2023 15:49:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 9hhbE/l8BGW0JQAAMHmgww
	(envelope-from <tiwai@suse.de>); Fri, 15 Sep 2023 15:49:13 +0000
Date: Fri, 15 Sep 2023 17:49:12 +0200
Message-ID: <87a5tnv3lz.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	tiwai@suse.com,
	perex@perex.cz,
	alsa-devel@alsa-project.org,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	fred.oh@linux.intel.com,
	chao.song@linux.intel.com
Subject: Re: [PATCH] ALSA: hda: hdac-i915: make i915 timeout configurable
In-Reply-To: <9c2e08db-4baf-72fa-2b07-0a08c6a0299b@linux.intel.com>
References: <20230915134527.16679-1-peter.ujfalusi@linux.intel.com>
	<87fs3fv3vd.wl-tiwai@suse.de>
	<9c2e08db-4baf-72fa-2b07-0a08c6a0299b@linux.intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: UX6ZZXFLMC2AZ4ZY25H5BM3BKUS7KZLO
X-Message-ID-Hash: UX6ZZXFLMC2AZ4ZY25H5BM3BKUS7KZLO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UX6ZZXFLMC2AZ4ZY25H5BM3BKUS7KZLO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 15 Sep 2023 17:46:32 +0200,
Pierre-Louis Bossart wrote:
> 
> On 9/15/23 11:43, Takashi Iwai wrote:
> > On Fri, 15 Sep 2023 15:45:27 +0200,
> > Peter Ujfalusi wrote:
> >>
> >> From: Fred Oh <fred.oh@linux.intel.com>
> >>
> >> When enabling new platforms, missing dependencies on i915 driver
> >> updates cause i915 timeouts. Rather than wait 60s for no good reason,
> >> this patch adds a kernel parameter so that developers can cut to the
> >> chase and skip a known problem.
> >>
> >> Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> >> Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> >> Reviewed-by: Chao Song <chao.song@linux.intel.com>
> >> Signed-off-by: Fred Oh <fred.oh@linux.intel.com>
> >> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> >> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
> > 
> > The change looks trivial, but this would be little use if we support
> > EPROBE_DEFER, right?  Or does it need to be merged into 6.6?
> 
> It'd be fine to keep this in the SOF tree for now, and remove it from
> our tree once the deferred probe is implemented.

OK, then let's postpone (or drop) this.  If EPROBE_DEFER stuff can't
be achieved in time, we can reconsider to take this workaround for
6.7.


thanks,

Takashi
