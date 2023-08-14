Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA1D77BC40
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Aug 2023 17:00:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF9A3741;
	Mon, 14 Aug 2023 17:00:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF9A3741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692025258;
	bh=tKDjIANVCC9y3EE6nsa2LzfdrNFRcBtxgXa8RFhb5Cs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=th4EbA9axZuTSn23dSYXRiSKATNCUq0RIiIFhHPDBbyVFXqMCvRMtqHP+4yVAaVNG
	 cQnalt/XVT5exVo705rdT5oO6KPrJSQ0Ld2hIbiimicIGPqQI2Do2wJZcJsgfNhdW0
	 GNPFx2zSJG0yMt1bdmKGxttz8jlkfygeMWeoPh7c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6DB06F80254; Mon, 14 Aug 2023 17:00:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 63352F80074;
	Mon, 14 Aug 2023 17:00:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 256D9F8025F; Mon, 14 Aug 2023 17:00:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E6E08F80074
	for <alsa-devel@alsa-project.org>; Mon, 14 Aug 2023 16:59:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E6E08F80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=m0VoYRgl;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=rgh45KNb
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 502651F7AB;
	Mon, 14 Aug 2023 14:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1692025196;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kJPj4Auv3zZbO48xL262OkjyUH0OyuLDbFifZksbfk8=;
	b=m0VoYRglP9NBd/jxcVyFiAbW53pMk8ESIgiRTYnzuAk0AeKq22uDJY10wFhcFb7yok3eQi
	+hfYDq2K+74ubGusCtyKzjDD89R6aDMdh5gxqzfgDdd4tjuVDk78Ioi2XkcZ/ae+wSsAnF
	XDilWQGD7KRqARbapewbpiY01Bf4LQk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1692025196;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kJPj4Auv3zZbO48xL262OkjyUH0OyuLDbFifZksbfk8=;
	b=rgh45KNb6HL54myOkZQAxMw3BQxfUb4rcfZ3cIX8O4MDcJGgWI8OrL6Xjgdass4HQTdpVJ
	vQYIYDBGhtDEJeDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E6F0F138EE;
	Mon, 14 Aug 2023 14:59:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id Vyu7NmtB2mSjCgAAMHmgww
	(envelope-from <tiwai@suse.de>); Mon, 14 Aug 2023 14:59:55 +0000
Date: Mon, 14 Aug 2023 16:59:55 +0200
Message-ID: <87bkf91xg4.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: <broonie@kernel.org>,
	<tiwai@suse.com>,
	<perex@perex.cz>,
	<alsa-devel@alsa-project.org>,
	<amadeuszx.slawinski@linux.intel.com>,
	<pierre-louis.bossart@linux.intel.com>,
	<hdegoede@redhat.com>
Subject: Re: [RFC PATCH 05/17] ALSA: hda: Upgrade stream-format infrastructure
In-Reply-To: <32a12f63-43f5-4f73-6140-91261f10b42e@intel.com>
References: <20230811164853.1797547-1-cezary.rojewski@intel.com>
	<20230811164853.1797547-6-cezary.rojewski@intel.com>
	<87edk51ya4.wl-tiwai@suse.de>
	<32a12f63-43f5-4f73-6140-91261f10b42e@intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: JS2RX6UUN563PU3FHUHSWY3URO3W5IMR
X-Message-ID-Hash: JS2RX6UUN563PU3FHUHSWY3URO3W5IMR
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
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 14 Aug 2023 16:47:05 +0200,
Cezary Rojewski wrote:
> 
> On 2023-08-14 4:41 PM, Takashi Iwai wrote:
> > On Fri, 11 Aug 2023 18:48:41 +0200,
> > Cezary Rojewski wrote:
> >> 
> >> Introduce a set of functions that facilite SDxFMT-related calculations
> >> in atomic manner:
> >> 
> >> snd_hdac_format_normalize() - format converter. S20_LE, S24_LE and their
> >> unsigned and BE friends are invalid from HDAudio perspective but still
> >> can be specified as function argument due to compatibility reasons.
> > 
> > Which compatibility reason?  Those formats should have been never used
> > for HD-audio codecs at the first place, so shouldn't it rather return
> > an error?
> 
> In regard to avs-driver we can "force" the S24_LE out, no
> problem. However, I do not believe the same is true for the
> skylake-driver. I agree, S24_LE and its friends should not have been
> used, but they were.

Hm, if those formats are actually passed to the codec side, then it's
rather a bug, I suppose.  It can be used for the controller where DSP
converts the format, though.


Takashi
