Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 870A77845C7
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Aug 2023 17:39:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F1669836;
	Tue, 22 Aug 2023 17:39:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F1669836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692718791;
	bh=RhNInhN30LSGL8wLmngGhD1Q3XqednRQYo/LdjCAPnY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VtJNdPFPrfI0YdOIaWjRsf8y/Ctwen3vMQlfJ8zo71MrWfQII/mkZVM2aQeTSG09D
	 ipDaIUGQzLk7ZSAI8cYD5xKCW7D9yyCzy7ax+R7NqRiH5FR8FlevONQDXEWNWziDuP
	 DcQuBKRSSSxbffS0H+rs9QCX8hOg1DMVuWSSCi+Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 040C0F8025F; Tue, 22 Aug 2023 17:38:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2B568F800F5;
	Tue, 22 Aug 2023 17:38:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6D56AF80158; Tue, 22 Aug 2023 17:38:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 77199F800D1
	for <alsa-devel@alsa-project.org>; Tue, 22 Aug 2023 17:38:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77199F800D1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=0KRN0a40;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=uBmjSZdD
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8677722BA5;
	Tue, 22 Aug 2023 15:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1692718711;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pcHRHWnRv22C6XAZOd4CvZ/TVK7i32civZMykjFM6KM=;
	b=0KRN0a40BFu/K794C2ZmQjraWuFoaggR+lzNHFvYHTiqOKhWXCVMIbtyQyBkkHXpm190qY
	v8drF8YGju0OS3BiAjfqCnMUTgSTkXKJ508/Mdck9k6/rD8kte7QsGj1v+Dle20JFKTWSk
	lGJkDTf6YD+ioog92AHTfsERTthCYG4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1692718711;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pcHRHWnRv22C6XAZOd4CvZ/TVK7i32civZMykjFM6KM=;
	b=uBmjSZdDo9k0SKkuZJKWXvxZZl6FKKYwhJmXg+lilqCQUA300XZEl5yEDrI2upgOwKbuRe
	1ePYDtEPfaMsirAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 56766132B9;
	Tue, 22 Aug 2023 15:38:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id j7s7FHfW5GR3RAAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 22 Aug 2023 15:38:31 +0000
Date: Tue, 22 Aug 2023 17:38:30 +0200
Message-ID: <874jkrdr49.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Jaroslav Kysela <perex@perex.cz>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	broonie@kernel.org,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com
Subject: Re: [RFC PATCH 01/17] ALSA: pcm: Introduce MSBITS subformat interface
In-Reply-To: <67fc99db-baf8-17b0-e7c4-f420676e5c8a@perex.cz>
References: <20230811164853.1797547-1-cezary.rojewski@intel.com>
	<20230811164853.1797547-2-cezary.rojewski@intel.com>
	<43b25b8b-3e28-bd91-a29a-846a5aa7579e@perex.cz>
	<87bkezdsjh.wl-tiwai@suse.de>
	<67fc99db-baf8-17b0-e7c4-f420676e5c8a@perex.cz>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: NGZ3LKLUQ4TRCQQPAYBQH6MEFWFF6OKQ
X-Message-ID-Hash: NGZ3LKLUQ4TRCQQPAYBQH6MEFWFF6OKQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NGZ3LKLUQ4TRCQQPAYBQH6MEFWFF6OKQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 22 Aug 2023 17:29:47 +0200,
Jaroslav Kysela wrote:
> 
> On 22. 08. 23 17:07, Takashi Iwai wrote:
> > On Tue, 22 Aug 2023 17:03:02 +0200,
> > Jaroslav Kysela wrote:
> >> 
> >> On 11. 08. 23 18:48, Cezary Rojewski wrote:
> >> 
> >>> +#define SNDRV_PCM_SUBFMTBIT_MSBITS_32	_SNDRV_PCM_SUBFMTBIT(MSBITS_32)
> >> 
> >> What was reason to add 32/32 format ? Subformat STD + msbits == 32
> >> should already handle the maximal resolution. Until we do not have 64
> >> bit formats, it seems like an useless extension.
> > 
> > My understanding is to distinguish the cases "we do fully support
> > 32bit" and "we don't care".  But, the end effect is same for both,
> > user-space would handle 32bit in both cases, so this difference won't
> > help much, indeed.
> 
> I don't think that we have a "do not care" situation. The applications
> currently expects to use the maximal msbits for STD subformat. The
> subformat should be used only to refine (downgrade) the resolution on
> the driver / hw side on demand. I would just add only necessary API
> extensions and save one bit for now.

Well, the current behavior (with STD) is to choose whatever 32bit
format the driver supports, and the driver may set a different value
of hw_params.msbits at hw_params.  The explicit MSBITS_32 would
enforce the hw_params.msbits to be 32, otherwise hw_refine would
fail.  So I see a potential difference.


Takashi
