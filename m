Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF66F75C528
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jul 2023 12:59:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C0825210;
	Fri, 21 Jul 2023 12:58:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C0825210
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689937154;
	bh=hmeQCdu5v40iiR20fJUoBc02HjdqXlFrV8Xc3/rqpvQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Dbno08U+qOb5LXEs4rmeURqUvla+cU4U7x2mo6VM9ftppIAeCnlyB9k1jf6ML7inz
	 tGpjukTOeLChHK1HCIR+8LKMu8/+AD87h+eMKpShI6ne8uv//4+rINJdLsgNBnIVsy
	 XvS5TP9VwXevNQQmaHwE0hNITWOoHkZJnssjcyw4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 41EFFF800D2; Fri, 21 Jul 2023 12:58:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CAFC3F8032D;
	Fri, 21 Jul 2023 12:58:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E1A3FF8047D; Fri, 21 Jul 2023 12:58:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6D776F800D2
	for <alsa-devel@alsa-project.org>; Fri, 21 Jul 2023 12:58:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6D776F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=I80gSmkz;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=uQYJg3Aq
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 27D38218A2;
	Fri, 21 Jul 2023 10:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1689937095;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ENY78oLHZhOAC6EECfepl0Erw4YArx4QCjqh+tXANK0=;
	b=I80gSmkzJ17c7Nu4x7K/fZ1MrznmIQCuFpaaQ4S7eKp+IclkbJgHdpQ3DAg2JFagWXJrbw
	7AYHZNRw+fDCkEMFBQdHcHHSfnrp+8qkR6WEH6DbH/kCze3qbeW+87NJLwuZOxSvUr2Zf5
	n3gOaw5Gu2i0KpiI1rQGMbI9HClY75s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1689937095;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ENY78oLHZhOAC6EECfepl0Erw4YArx4QCjqh+tXANK0=;
	b=uQYJg3AqvG0VksuvoOS88sM8MrUmGC9CpFFDtJx3t0ezu6hfYEb6PmcejdP9CjA7Niqc23
	krr7x36TlPqlnxCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F0F36134B0;
	Fri, 21 Jul 2023 10:58:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id qqzzOcZkumRBHwAAMHmgww
	(envelope-from <tiwai@suse.de>); Fri, 21 Jul 2023 10:58:14 +0000
Date: Fri, 21 Jul 2023 12:58:14 +0200
Message-ID: <87y1j9fs55.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Dan Williams <dan.j.williams@intel.com>
Subject: Re: [PATCH v1 1/1] ALSA: korg1212: Re-use sockptr_t and respective
 APIs
In-Reply-To: <ZLphAJG4Tz8zLUSN@smile.fi.intel.com>
References: <20230721100146.67293-1-andriy.shevchenko@linux.intel.com>
	<878rb9h901.wl-tiwai@suse.de>
	<ZLphAJG4Tz8zLUSN@smile.fi.intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: 6NZAFGXGODBIFV6MFQSAWIM4NCSJIEO6
X-Message-ID-Hash: 6NZAFGXGODBIFV6MFQSAWIM4NCSJIEO6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6NZAFGXGODBIFV6MFQSAWIM4NCSJIEO6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 21 Jul 2023 12:42:08 +0200,
Andy Shevchenko wrote:
> 
> On Fri, Jul 21, 2023 at 12:08:46PM +0200, Takashi Iwai wrote:
> > On Fri, 21 Jul 2023 12:01:46 +0200,
> > Andy Shevchenko wrote:
> > > 
> > > The sockptr_t (despite the naming) is a generic type to hold kernel
> > > or user pointer and there are respective APIs to copy data to or
> > > from it. Replace open coded variants in the driver by them.
> > 
> > While I see the benefit, I feel this is very confusing.  If we use the
> > API for a generic use, it should be renamed at first.
> > 
> > Also, the current function actually follows the call pattern, and we
> > know in the caller side whether it's called for a kernel pointer or a
> > user pointer.  So, if any, the PCM core callbacks should be revised to
> > use a generic pointer instead of fiddling in each driver side.
> 
> Any suggestion for the name?

It's a universal pointer...  uniptr_t?
Or a generic pointer, genptr_t?

I'm not good at naming, and I'm open for it.

> And I believe for the bigger series the new callback should be added first.

Yes.


Takashi
