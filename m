Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 16D518614A0
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Feb 2024 15:50:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C4F7825;
	Fri, 23 Feb 2024 15:50:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C4F7825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708699846;
	bh=ZHMRCL/USoNuXmlcg1B2bxpVq7YuRIiljBBwqbSTQHk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nuqdCyX35/Nek8iJF39qrWIrAT1Mk/DrRaG3ATjArYPtWrfrPSlGohcuNbBzcb7/L
	 IrLlDca01D5W4Gl84s8h7Mbfxc5V9rxENHjJvzB5i6zuvTezwuLcA3e1LGJkEM8Lbt
	 iZdM0pWVaR7FPoo1XSNws2Zqvs1dWhRuGLKUbLJ8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 87DDDF805AC; Fri, 23 Feb 2024 15:50:15 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A0599F805A0;
	Fri, 23 Feb 2024 15:50:14 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6CC68F80496; Fri, 23 Feb 2024 15:50:09 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 16EDBF80104
	for <alsa-devel@alsa-project.org>; Fri, 23 Feb 2024 15:50:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 16EDBF80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=ePxqFOng;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=WIcC01iy;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=ePxqFOng;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=WIcC01iy
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 41EDB221BA;
	Fri, 23 Feb 2024 14:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1708699805;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5oOZbTrkv5gvQuvGpYNYpDMlKNRGmwL5Ip4+yibFw+Q=;
	b=ePxqFOngBvr8XRJJ8iI73u4U2zdvnPJBgItLRrF0VBNAjHP9P2h2ZdMy3BUfcy56BmefGs
	+X8GZ4vRHE9L8wHjPlfZHu2aymVZgBWMV2E9C7aRanlH8ilZsxOQ3lK7K83OT5+QvkiLLd
	kdGinvMUYDZ+6AK6M7Ez3/qaJLLlkA0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708699805;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5oOZbTrkv5gvQuvGpYNYpDMlKNRGmwL5Ip4+yibFw+Q=;
	b=WIcC01iyCn2a9glzrhC7x4wjfgZ6cWTjgunVGqHgq0lleo6dQvVRrVw2Cj0334PEsMQsDJ
	c9mbLA9ZdaHd2ODQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1708699805;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5oOZbTrkv5gvQuvGpYNYpDMlKNRGmwL5Ip4+yibFw+Q=;
	b=ePxqFOngBvr8XRJJ8iI73u4U2zdvnPJBgItLRrF0VBNAjHP9P2h2ZdMy3BUfcy56BmefGs
	+X8GZ4vRHE9L8wHjPlfZHu2aymVZgBWMV2E9C7aRanlH8ilZsxOQ3lK7K83OT5+QvkiLLd
	kdGinvMUYDZ+6AK6M7Ez3/qaJLLlkA0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708699805;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5oOZbTrkv5gvQuvGpYNYpDMlKNRGmwL5Ip4+yibFw+Q=;
	b=WIcC01iyCn2a9glzrhC7x4wjfgZ6cWTjgunVGqHgq0lleo6dQvVRrVw2Cj0334PEsMQsDJ
	c9mbLA9ZdaHd2ODQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C95A5133DC;
	Fri, 23 Feb 2024 14:50:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id v4OuL5yw2GUpGQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 23 Feb 2024 14:50:04 +0000
Date: Fri, 23 Feb 2024 15:50:04 +0100
Message-ID: <87msrr2q1v.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: broonie@kernel.org,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	jani.nikula@linux.intel.com,
	joonas.lahtinen@linux.intel.com,
	rodrigo.vivi@intel.com,
	tvrtko.ursulin@linux.intel.com,
	intel-gfx@lists.freedesktop.org,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com
Subject: Re: [PATCH v2 0/4] ALSA/ASoC: Conditionally skip i915 init and
 cleanups
In-Reply-To: <20240223114626.1052784-1-cezary.rojewski@intel.com>
References: <20240223114626.1052784-1-cezary.rojewski@intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Authentication-Results: smtp-out1.suse.de;
	none
X-Spamd-Result: default: False [0.90 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 RCPT_COUNT_TWELVE(0.00)[14];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.00)[29.61%]
Message-ID-Hash: MJDMDYGHAFKQVPYACZIBUNAKUNHK77DU
X-Message-ID-Hash: MJDMDYGHAFKQVPYACZIBUNAKUNHK77DU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MJDMDYGHAFKQVPYACZIBUNAKUNHK77DU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 23 Feb 2024 12:46:22 +0100,
Cezary Rojewski wrote:
> 
> A small set of changes to improve initialization of the audio stack on
> HDAudio devices and pair of cleanups.
> 
> As the first change is the most important one here, following is the
> technical background for it:
> 
> Commit 78f613ba1efb ("drm/i915: finish removal of CNL") and its friends
> removed support for i915 for all CNL-based platforms. HDAudio library,
> however, still treats such platforms as valid candidates for i915
> binding. Update query mechanism to reflect changes made in drm tree.
> 
> At the same time, i915 support for LKF-based platforms has not been
> provided so remove them from valid binding candidates.
> 
> The snd_soc_hda change is a follow up for the above and the cleanup
> patches do not bring any functional changes.
> 
> Changes in v2:
> - list of problematic VGA devices is now declared locally, no more
>   touching drm stuff
> 
> Cezary Rojewski (4):
>   ALSA: hda: Skip i915 initialization on CNL/LKF-based platforms
>   ASoC: codecs: hda: Skip HDMI/DP registration if i915 is missing
>   ASoC: codecs: hda: Cleanup error messages
>   ALSA: hda: Reuse for_each_pcm_streams()

As far as I see, all those 4 patches are rather individually
applicable, right?
The essential change is the first patch, and the patch 2 is rather an
improvement (the driver gives -ENODEV as of now).
And the rest two are merely cleanups.


Takashi
