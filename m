Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E86C87A22BA
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Sep 2023 17:44:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E437C84B;
	Fri, 15 Sep 2023 17:43:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E437C84B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694792681;
	bh=j9q2DlOkoE2QhMMg+WIyXTHXrkJmqA4vzmrcUwcWDAs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=H+5aVr3qocZ/DtWWptITGWsLf9lnAdxEAvU+Pp8oMZ9nsYx6wn5bbKyNKZIbPL25b
	 k0k26rvLGBrCjIb1ArmSGIohJrVgOcC6Ja76ycRMq8MyROoCXSEU2IpmJe6i1wX4hu
	 zNPpRhRZw6d3MSpQ8fr23Uol7j10qWrr/6omWsE0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 48555F80549; Fri, 15 Sep 2023 17:43:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0254AF8007C;
	Fri, 15 Sep 2023 17:43:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1D62CF80425; Fri, 15 Sep 2023 17:43:44 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id E502FF801F5
	for <alsa-devel@alsa-project.org>; Fri, 15 Sep 2023 17:43:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E502FF801F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=UAv6WF4M;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=iTBnwDvZ
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 4C9D01FD73;
	Fri, 15 Sep 2023 15:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1694792615;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TsUtvyIy8QYODPqWrfssR5hMzz+Rfpupg7Om3YgtHr4=;
	b=UAv6WF4MwABsqamiOY5QUGByAk/QU4k7Dffcy1IY01lJ3i5X4693tzKRM82/NmEf7e7cvB
	v6l+Ky4YRMOSQsup/ZKn1dsXJWtSZgj6l+KMJVVnB86hxfBidnAB7qGzPlqDcI6c7QKy5g
	x9TCnBzyCNLfsYDlvefdk/upxErSRQ8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1694792615;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TsUtvyIy8QYODPqWrfssR5hMzz+Rfpupg7Om3YgtHr4=;
	b=iTBnwDvZ9ALdwrM7h9aJbjX2e2eLoPiimgSFGL8WTYm+WyK2NaiPlxNXeXiSsISOiIz41W
	gli2Lp5DtvRjyjCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 08AC41358A;
	Fri, 15 Sep 2023 15:43:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id nV0+Aad7BGVAIwAAMHmgww
	(envelope-from <tiwai@suse.de>); Fri, 15 Sep 2023 15:43:35 +0000
Date: Fri, 15 Sep 2023 17:43:34 +0200
Message-ID: <87fs3fv3vd.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: tiwai@suse.com,
	perex@perex.cz,
	alsa-devel@alsa-project.org,
	pierre-louis.bossart@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	fred.oh@linux.intel.com,
	chao.song@linux.intel.com
Subject: Re: [PATCH] ALSA: hda: hdac-i915: make i915 timeout configurable
In-Reply-To: <20230915134527.16679-1-peter.ujfalusi@linux.intel.com>
References: <20230915134527.16679-1-peter.ujfalusi@linux.intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: KL65EUHBZQA6PNIXAQIBCOZ6QEJP5QZH
X-Message-ID-Hash: KL65EUHBZQA6PNIXAQIBCOZ6QEJP5QZH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KL65EUHBZQA6PNIXAQIBCOZ6QEJP5QZH/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 15 Sep 2023 15:45:27 +0200,
Peter Ujfalusi wrote:
> 
> From: Fred Oh <fred.oh@linux.intel.com>
> 
> When enabling new platforms, missing dependencies on i915 driver
> updates cause i915 timeouts. Rather than wait 60s for no good reason,
> this patch adds a kernel parameter so that developers can cut to the
> chase and skip a known problem.
> 
> Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> Reviewed-by: Chao Song <chao.song@linux.intel.com>
> Signed-off-by: Fred Oh <fred.oh@linux.intel.com>
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

The change looks trivial, but this would be little use if we support
EPROBE_DEFER, right?  Or does it need to be merged into 6.6?


thanks,

Takashi
