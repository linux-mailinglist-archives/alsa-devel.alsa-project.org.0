Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F1DEC860D2A
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Feb 2024 09:48:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 323AC847;
	Fri, 23 Feb 2024 09:48:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 323AC847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708678125;
	bh=MbzFblemUzYkADWph8f3TZcmyBcAvKEcQ5C0lPM1+IE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OiTY0bdFNylcy7lME173kcBdvKYOGueW/TUApZ1s9oKEDfmhUK7bj5F4rICzHfpP2
	 sQClYAc98rLSziFnXqSks/EEtK4ZrfJ6zH4tQ7YnKcUNJ8t6VKGZjUOXGsivrqTqBp
	 1U9yHMxLe6JVl9fys5OC5dEbk8FfAiDZHXRSsJv0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CEE58F80568; Fri, 23 Feb 2024 09:48:14 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A7446F804CC;
	Fri, 23 Feb 2024 09:48:13 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 69109F80496; Fri, 23 Feb 2024 09:47:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ADE34F800ED
	for <alsa-devel@alsa-project.org>; Fri, 23 Feb 2024 09:47:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ADE34F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=jx27WXk8;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=ynzfX375;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=jx27WXk8;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=ynzfX375
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9F000223A0;
	Fri, 23 Feb 2024 08:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1708678064;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TFEg+FvVq3KaypUT0cn7mMsIX35PhU9wQxVed0FSNeU=;
	b=jx27WXk8C32nzOYEZ3fIgL/LS+S0KSALrRUIl5vxkIosb1XCfKPV6VMNEqxTmjNwdd1nMG
	MQDkX4wQE1cuDhTsd7hKZsjMDjyCKRsp3DFKGVHhwuwjf8MH04sS4qrWfNdgW3PW2aqTzs
	IUnzR4nV0ks7+YtPL6VyA7wTlMtwars=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708678064;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TFEg+FvVq3KaypUT0cn7mMsIX35PhU9wQxVed0FSNeU=;
	b=ynzfX375s9eHhR6nXjeAF1lxfygFY2gU/0bAHK4FRoCVif/ERJF0P/vaYQmE4VzYhNww5A
	M4X5tb6CHq3VdnBg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1708678064;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TFEg+FvVq3KaypUT0cn7mMsIX35PhU9wQxVed0FSNeU=;
	b=jx27WXk8C32nzOYEZ3fIgL/LS+S0KSALrRUIl5vxkIosb1XCfKPV6VMNEqxTmjNwdd1nMG
	MQDkX4wQE1cuDhTsd7hKZsjMDjyCKRsp3DFKGVHhwuwjf8MH04sS4qrWfNdgW3PW2aqTzs
	IUnzR4nV0ks7+YtPL6VyA7wTlMtwars=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708678064;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TFEg+FvVq3KaypUT0cn7mMsIX35PhU9wQxVed0FSNeU=;
	b=ynzfX375s9eHhR6nXjeAF1lxfygFY2gU/0bAHK4FRoCVif/ERJF0P/vaYQmE4VzYhNww5A
	M4X5tb6CHq3VdnBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3282D133DC;
	Fri, 23 Feb 2024 08:47:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 75cWC7Bb2GV6PAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 23 Feb 2024 08:47:44 +0000
Date: Fri, 23 Feb 2024 09:47:43 +0100
Message-ID: <878r3b4le8.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,	Ville =?ISO-8859-1?Q?Syrj?=
 =?ISO-8859-1?Q?=E4l=E4?=
 <ville.syrjala@linux.intel.com>,<broonie@kernel.org>,
 <alsa-devel@alsa-project.org>,<linux-sound@vger.kernel.org>,
 <tiwai@suse.com>,<perex@perex.cz>,<jani.nikula@linux.intel.com>,
 <joonas.lahtinen@linux.intel.com>,<tvrtko.ursulin@linux.intel.com>,
 <intel-gfx@lists.freedesktop.org>,<amadeuszx.slawinski@linux.intel.com>,
 <pierre-louis.bossart@linux.intel.com>,<hdegoede@redhat.com>
Subject: Re: [PATCH 1/4] ALSA: hda: Skip i915 initialization on CNL/LKF-based
 platforms
In-Reply-To: <Zde0kkWX5TrZu-U7@intel.com>
References: <20240222170614.884413-1-cezary.rojewski@intel.com>
	<20240222170614.884413-2-cezary.rojewski@intel.com>
	<ZdeDNT5jCgXAP16Z@intel.com>
	<13fdb738-1a37-47e2-8d06-959bbb85c2b4@intel.com>
	<Zde0kkWX5TrZu-U7@intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=jx27WXk8;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=ynzfX375
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.51 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 MIME_GOOD(-0.10)[text/plain];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 DKIM_TRACE(0.00)[suse.de:+];
	 MX_GOOD(-0.01)[];
	 RCPT_COUNT_TWELVE(0.00)[15];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%]
X-Rspamd-Queue-Id: 9F000223A0
Message-ID-Hash: FEEN2WEKTZU4Y6KOBQT6IPG4ASKIV62H
X-Message-ID-Hash: FEEN2WEKTZU4Y6KOBQT6IPG4ASKIV62H
X-MailFrom: tiwai@suse.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FEEN2WEKTZU4Y6KOBQT6IPG4ASKIV62H/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 22 Feb 2024 21:54:42 +0100,
Rodrigo Vivi wrote:
> 
> On Thu, Feb 22, 2024 at 06:53:12PM +0100, Cezary Rojewski wrote:
> > On 2024-02-22 6:24 PM, Ville Syrjälä wrote:
> > > On Thu, Feb 22, 2024 at 06:06:11PM +0100, Cezary Rojewski wrote:
> > > > Commit 78f613ba1efb ("drm/i915: finish removal of CNL") and its friends
> > > > removed support for i915 for all CNL-based platforms. HDAudio library,
> > > > however, still treats such platforms as valid candidates for i915
> > > > binding. Update query mechanism to reflect changes made in drm tree.
> > > > 
> > > > At the same time, i915 support for LKF-based platforms has not been
> > > > provided so remove them from valid binding candidates.
> > 
> > ...
> > 
> > > > @@ -127,15 +128,26 @@ static int i915_component_master_match(struct device *dev, int subcomponent,
> > > >   /* check whether Intel graphics is present and reachable */
> > > >   static int i915_gfx_present(struct pci_dev *hdac_pci)
> > > >   {
> > > > +	/* List of known platforms with no i915 support. */
> > > > +	static struct pci_device_id denylist[] = {
> > > > +		INTEL_CNL_IDS(NULL),
> > > > +		INTEL_LKF_IDS(NULL),
> > > > +		{ 0 }
> > > > +	};
> > > 
> > > I thought these don't actually exist in the wild?
> > 
> > To my knowledge the opposite is true - while LKFs were shipped in limited
> > number, they still were. I did ask few weeks ago my friends from Windows
> > side about the support and they're still running full-scopes on HDMI
> > endpoints on LKF platforms in their CIs. It seems the drm support is there
> > though. Once you re-boot to linux we get -19 during probe().
> > 
> > In regard to CNL, the commit removing CNL-support left the IDs intact what's
> 
> I would prefer to go the other way around and remove the unused/unsupported
> IDs entirely and for good.
> 
> > very handy to us - we have a lot of spare CNL boards for our validation
> > purposes - CNL-based AudioDSP spans multiple platforms, e.g.:
> > CNL/CFL/WHL/CML. The number of newer boards is lower, unfortunately.
> 
> Well, I do see your point here and you are not asking for us to add gfx
> support back, but only help to have this protection here.
> 
> However I'm afraid that these entries in the list would only cause
> further confusion. Couldn't they get defined inside your .c directly as
> a const deny_list? so when we go there and remove the missing bits
> of CNL we don't conflict or cause undersired issues to you.

That makes sense.  Maybe drm people would get rid of the dead CNL*()
definitions from the header as a cleanup in near future, and we'll hit
a trouble.


thanks,

Takashi
