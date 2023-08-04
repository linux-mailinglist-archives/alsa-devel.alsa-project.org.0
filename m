Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 37838770565
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Aug 2023 17:58:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B339B820;
	Fri,  4 Aug 2023 17:57:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B339B820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691164719;
	bh=HmVhhrMTqCTyQ4Z5LB+fhxrmQN5yxF9iFoO+Z0+yMZg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=A8wLrIgEjkIDKuUfHtP9nUnKIxhqfQaIvzuJcSmB7Z/n/ZWiezsiHQ31YUtgZ1800
	 P1nmZtqZGu/l9ttf8oazBVdQxrlLHko7us5vjvsHHMeVTeEZWx20oHoPiJ+mgb9tCr
	 Tp6kL3dr+6r8uS3rxpQX7y9/PGpoRFtqrWvzx3Fo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 61D23F8015B; Fri,  4 Aug 2023 17:57:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 85C92F801D5;
	Fri,  4 Aug 2023 17:57:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2089FF8025A; Fri,  4 Aug 2023 17:57:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 040F2F80087
	for <alsa-devel@alsa-project.org>; Fri,  4 Aug 2023 17:57:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 040F2F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=EbqLeUjk;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=xAZ1MTpG
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 963241F88C;
	Fri,  4 Aug 2023 15:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1691164656;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=utxqvo3sXLuMNNYnUBTYumuN2r32VbC95AbD7uI0gc8=;
	b=EbqLeUjkx1xsFsOFwY2YOhnj6JJf2inrVYHswQHeGY0UXwudIJr1YTR+uBGaaYtI7Q7myV
	5wqaibSHjVWI90p5QyhadZxVz/VyumTo4oEfSVoROMh4kndlEtmhq4ufSI0cCyl6/ab6ab
	4M3jMbp6l/XDcq4fdepSW+lDBuw/AZ0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1691164656;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=utxqvo3sXLuMNNYnUBTYumuN2r32VbC95AbD7uI0gc8=;
	b=xAZ1MTpGHnIqIdALFdwq8H8+/ZCav4iy+ry4kle0zRnKRvhzJR30XtveOVTS6nF0l3pA2n
	4BfB4hZsEBJzwlCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6C562133B5;
	Fri,  4 Aug 2023 15:57:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id egOHGfAfzWRDYAAAMHmgww
	(envelope-from <tiwai@suse.de>); Fri, 04 Aug 2023 15:57:36 +0000
Date: Fri, 04 Aug 2023 17:57:36 +0200
Message-ID: <87sf8yol5b.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH] ASoC: lower "no backend DAIs enabled for ... Port" log
 severity
In-Reply-To: <9fdc2acf-6c33-46f2-8e2a-1c2cf506bd6c@sirena.org.uk>
References: <20230804132628.302385-1-hdegoede@redhat.com>
	<63eec3cf-ebba-a366-a66b-34daf76bc0f2@linux.intel.com>
	<878raqq36t.wl-tiwai@suse.de>
	<c320a2f8-7e53-4e51-84b9-9e7763ce1541@sirena.org.uk>
	<87y1iqoly3.wl-tiwai@suse.de>
	<9fdc2acf-6c33-46f2-8e2a-1c2cf506bd6c@sirena.org.uk>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: 6HVYG6X44PDFTQU72ZKPIK4MAID2YIKJ
X-Message-ID-Hash: 6HVYG6X44PDFTQU72ZKPIK4MAID2YIKJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6HVYG6X44PDFTQU72ZKPIK4MAID2YIKJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 04 Aug 2023 17:50:02 +0200,
Mark Brown wrote:
> 
> On Fri, Aug 04, 2023 at 05:40:20PM +0200, Takashi Iwai wrote:
> > Mark Brown wrote:
> 
> > > Hrm, do systems typically filter out debug logs?  Most of the systems I
> > > work on do still log debug logs, they just only include them in dmesg by
> > > default.
> 
> > I thought flipping the dynamic debug flag needed for showing them up
> > with dev_dbg() and co.
> 
> That's an optional feature, I guess perhaps distro kernels will tend to
> turn it on but not the defconfigs I'm generally using so I've not been
> seeing it.

Ah yes, most distros set CONFIG_DYNAMIC_DEBUG, but defconfig is a
different set.

> > > There are ratelimited printk APIs which we could use, though
> > > they're not quite ratelimited enough for this I think.
> 
> > Yes, this is printed not too frequently but just repeatedly.
> 
> > IMHO, dev_err_once() would be a good compromise.
> 
> I can imagine that being *super* frustrating when trying to actually
> develop configurations since you only get told once per boot that
> there's something missing.  dev_dbg() did seem like a sensible choice
> here, even with dynamic debug you can at least turn it on.  Perhaps both
> a dev_err_once() and a dev_dbg() so you get a hint that there's
> something wrong in the logs and can still get ongoing information when
> developing your configuration.

+1, this sounds like a solution.


thanks,

Takashi
