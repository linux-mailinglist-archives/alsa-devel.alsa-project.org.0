Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B203177035A
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Aug 2023 16:43:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B6A4B7F8;
	Fri,  4 Aug 2023 16:42:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B6A4B7F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691160219;
	bh=Rsu/TIkVP/+d4O/cILNAz6xs3IcjFd1SoOFBYnlUUFg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EC3Ugq98VzrI6Inbo+Yg2Wl/MXZThqcgXkuVWo1+wdJ5b9OSoZZlsgtHsYHUwjm0F
	 wRuffpHAKjJj52O7GG+XkSi9MU3WYL5zJLRLiFBgXDlp/N0W28lSaCzCnckEIUD2Oa
	 ybILh0Ds6Jzv3r4840a5cBlQcqqNWPaBL+XZc/4Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2F900F8016D; Fri,  4 Aug 2023 16:42:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C6249F801D5;
	Fri,  4 Aug 2023 16:42:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0138EF8025A; Fri,  4 Aug 2023 16:42:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 08644F8016D
	for <alsa-devel@alsa-project.org>; Fri,  4 Aug 2023 16:42:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 08644F8016D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=VOAEK7ug;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=y0yeiLmB
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 5E3A621887;
	Fri,  4 Aug 2023 14:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1691160155;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oB0lNrOJKUUlogCf/u+gqewVk2TCbyYjOzzY2zR+RnI=;
	b=VOAEK7ugrH1i90/6gEFb4X9t+oVrWmcMCv6amGjVhQZpkLiSedYBadDiJbeDhrJr6QR+ZQ
	ZY1uEVG/BaIdKHdZEDw1XRTO/uGA8vPGYJpzsjg6L8diYI6jpsYY1FfikDuTkmyXNVZsAs
	Qst+vD4A3tap3m4JvLsV3XRLKEpL1x4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1691160155;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oB0lNrOJKUUlogCf/u+gqewVk2TCbyYjOzzY2zR+RnI=;
	b=y0yeiLmBOeZSpFhk/exLnzqI0E2Ji5HrZzZb2NzdCvRTD3EzMYYnwdgzRm9TB5qu1i+2m1
	Hq2hFddYWm/VKaCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3580D13904;
	Fri,  4 Aug 2023 14:42:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id IEItDFsOzWRFPQAAMHmgww
	(envelope-from <tiwai@suse.de>); Fri, 04 Aug 2023 14:42:35 +0000
Date: Fri, 04 Aug 2023 16:42:34 +0200
Message-ID: <878raqq36t.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH] ASoC: lower "no backend DAIs enabled for ... Port" log
 severity
In-Reply-To: <63eec3cf-ebba-a366-a66b-34daf76bc0f2@linux.intel.com>
References: <20230804132628.302385-1-hdegoede@redhat.com>
	<63eec3cf-ebba-a366-a66b-34daf76bc0f2@linux.intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: JY5LJASA6DIKMH6YE3TL4P3KKEYCSGJN
X-Message-ID-Hash: JY5LJASA6DIKMH6YE3TL4P3KKEYCSGJN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JY5LJASA6DIKMH6YE3TL4P3KKEYCSGJN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 04 Aug 2023 16:06:45 +0200,
Pierre-Louis Bossart wrote:
> 
> 
> 
> On 8/4/23 08:26, Hans de Goede wrote:
> > If SNDRV_PCM_IOCTL_PREPARE is called when  the mixer settings linking
> > frontend and backend have not been setup yet this results in
> > e.g. the following errors getting logged:
> > 
> > [   43.244549]  Baytrail Audio Port: ASoC: no backend DAIs enabled for Baytrail Audio Port
> > [   43.244744]  Baytrail Audio Port: ASoC: error at dpcm_fe_dai_prepare on Baytrail Audio Port: -22
> > 
> > pipewire triggers this leading to 96 repeats of this in the log
> > after the user has logged into a GNOME session.
> > 
> > IMHO userspace should not be able to get the kernel to spam dmesg like
> > this. Lower the severity of the "no backend DAIs enabled" log message
> > for dai-s with the dynamic flag set to avoid this.
> > 
> > And also changes _soc_pcm_ret() to not log for -EINVAL errors, to fix
> > the other error. Userspace passing wrong parameters should not lead
> > to dmesg messages.
> 
> Maybe, but it's a questionable flow if pipewire tries to open stuff
> without the mixer values set-up. Is there something done about this?

I think it's an oft-seen problem when user runs the system without
installing a proper UCM profile.

> The reason why I am pushing back is that we had a similar issue with
> HDaudio where HDMI/DP PCM devices were opened without checking if the
> jack was connected.
> 
> It really makes no sense for userspace to try and open devices that are
> known to be problematic. We can push kernel error logs below the rug, it
> doesn't make the programming flows better.

Downgrading the message also hides to show what's wrong there.
Although the message doesn't indicate how to fix the problem, no
message would make debug harder.

So in general I agree that it's annoying and it should be fixed, but
hiding all as default can be bad, too.  Maybe we can introduce a
counter and shut out after three strikes?


Takashi
