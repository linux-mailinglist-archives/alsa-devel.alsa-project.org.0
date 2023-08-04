Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DCAAE77050B
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Aug 2023 17:41:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2774E832;
	Fri,  4 Aug 2023 17:41:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2774E832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691163717;
	bh=w4k7TpOhDVi6isiOPzQKbGMbuFeprx20jFJ0uDz8VFY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=paOBvIziO2ylKrzcjR0W642mSXzKS4QN6wdvlT8gycCKuwQXd59hlkYiMbv0qaH4p
	 biFsOmEgbZBMnW2n17iFvpioP3DnzLW2+5parFt1ODRyIYmMJF3HJg8GYa91Whc39/
	 peBMAylu5AfFJHSiBLCxe0frR5IL7PQxlrtl0Zxk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6098EF8055B; Fri,  4 Aug 2023 17:40:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C061F80544;
	Fri,  4 Aug 2023 17:40:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 97297F80549; Fri,  4 Aug 2023 17:40:27 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id D9B39F80535
	for <alsa-devel@alsa-project.org>; Fri,  4 Aug 2023 17:40:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D9B39F80535
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=RLz0iAxa;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=Ph80zAV5
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2572C21870;
	Fri,  4 Aug 2023 15:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1691163621;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2VexcRQTB4Hcr/bSlY/s/+H87DomHEPeTaS9WMC0J00=;
	b=RLz0iAxaryh2eQHSdiaTe8nNW4csVVzoTXY8icdNHypfOFeqvgIqYnEe5IlAikdgqs3gVf
	JvPNxvmfc1QR2vnJcyr5wK8Bs/wQ7SfoXmFtfbKqGKSSsgIqvpDWC3069DGohhbprOdCSW
	PyEvefQYE+2Ycvj5IGRzxyl/+DOo1xU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1691163621;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2VexcRQTB4Hcr/bSlY/s/+H87DomHEPeTaS9WMC0J00=;
	b=Ph80zAV5EVuhYpJwFr9AceGILJENkPTTpH5K/+Nb8yeFVN4Ffm4TBjG0CsYcmlj5Nl3i7K
	PrH+/FPCbA1wI0Dg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F0151133B5;
	Fri,  4 Aug 2023 15:40:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 3LWXOeQbzWQjWAAAMHmgww
	(envelope-from <tiwai@suse.de>); Fri, 04 Aug 2023 15:40:20 +0000
Date: Fri, 04 Aug 2023 17:40:20 +0200
Message-ID: <87y1iqoly3.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH] ASoC: lower "no backend DAIs enabled for ... Port" log
 severity
In-Reply-To: <c320a2f8-7e53-4e51-84b9-9e7763ce1541@sirena.org.uk>
References: <20230804132628.302385-1-hdegoede@redhat.com>
	<63eec3cf-ebba-a366-a66b-34daf76bc0f2@linux.intel.com>
	<878raqq36t.wl-tiwai@suse.de>
	<c320a2f8-7e53-4e51-84b9-9e7763ce1541@sirena.org.uk>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: 3AUTLIYPYXHIDJ5IFC5T7DXSTTXUTPBP
X-Message-ID-Hash: 3AUTLIYPYXHIDJ5IFC5T7DXSTTXUTPBP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3AUTLIYPYXHIDJ5IFC5T7DXSTTXUTPBP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 04 Aug 2023 17:15:14 +0200,
Mark Brown wrote:
> 
> On Fri, Aug 04, 2023 at 04:42:34PM +0200, Takashi Iwai wrote:
> > Pierre-Louis Bossart wrote:
> 
> > > > And also changes _soc_pcm_ret() to not log for -EINVAL errors, to fix
> > > > the other error. Userspace passing wrong parameters should not lead
> > > > to dmesg messages.
> 
> > > Maybe, but it's a questionable flow if pipewire tries to open stuff
> > > without the mixer values set-up. Is there something done about this?
> 
> > I think it's an oft-seen problem when user runs the system without
> > installing a proper UCM profile.
> 
> Yeah, it's really easy to do.
> 
> > > It really makes no sense for userspace to try and open devices that are
> > > known to be problematic. We can push kernel error logs below the rug, it
> > > doesn't make the programming flows better.
> 
> > Downgrading the message also hides to show what's wrong there.
> > Although the message doesn't indicate how to fix the problem, no
> > message would make debug harder.
> 
> > So in general I agree that it's annoying and it should be fixed, but
> > hiding all as default can be bad, too.  Maybe we can introduce a
> > counter and shut out after three strikes?
> 
> Hrm, do systems typically filter out debug logs?  Most of the systems I
> work on do still log debug logs, they just only include them in dmesg by
> default.

I thought flipping the dynamic debug flag needed for showing them up
with dev_dbg() and co.

> There are ratelimited printk APIs which we could use, though
> they're not quite ratelimited enough for this I think.

Yes, this is printed not too frequently but just repeatedly.

IMHO, dev_err_once() would be a good compromise.


thanks,

Takashi
