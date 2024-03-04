Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0173786FB94
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Mar 2024 09:19:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 84A1B741;
	Mon,  4 Mar 2024 09:19:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 84A1B741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709540376;
	bh=XEPY+h5hm6XfNYyMM8GSi3FdJ7RSjQ9IB4KseluI3DI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ldhwZ18hTNDMWpguXtvWlSNeQmRdoAJZKmQFR7f9SWE8/WDKF5VTvNZV54cOX/tTU
	 YuY99AmrjqRD5R+w8QbD4rC0uqBHgfrea/oXxpvfVHUCkTJy/mOYHYMGhLDoaGnzgD
	 RYfEx6BDLgmOBdcyqIdDfX+X/wjpurlGRYkpMnyU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 79930F8058C; Mon,  4 Mar 2024 09:19:05 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 184BEF8059F;
	Mon,  4 Mar 2024 09:19:04 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 94932F8024E; Mon,  4 Mar 2024 09:18:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E8AB8F80093
	for <alsa-devel@alsa-project.org>; Mon,  4 Mar 2024 09:18:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8AB8F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=r1o4XTcn;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=KttDyL/9;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=r1o4XTcn;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=KttDyL/9
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 7DC77687A5;
	Mon,  4 Mar 2024 08:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1709540328;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0GcM6Zqc7S8KzSFH/QRWGM93gGR/7+3SWwjm/qiQ8mk=;
	b=r1o4XTcnhHzb7nMm8K7OEJ1wRWlb21LxDNMQf0r0ctNsgdS2Kp420vCKM+CJTvsmBWd55M
	Kx4jX3skMWDuUjblZzlctHu1VEBGz3w2VZBSFCnHwhOExQbu47hSFHjO9u81LQzggkiRQs
	rHTwrOQXkYuTSh+1/j6VPYGDh2nair8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1709540328;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0GcM6Zqc7S8KzSFH/QRWGM93gGR/7+3SWwjm/qiQ8mk=;
	b=KttDyL/9tqsbQ1NkCk/c+CVu+CmQHBG/VZMUlGn01xYjL+8DRsYSwp6a46n4Rf/ZsbO9pn
	YwSb3e3IHX7LEVDA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1709540328;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0GcM6Zqc7S8KzSFH/QRWGM93gGR/7+3SWwjm/qiQ8mk=;
	b=r1o4XTcnhHzb7nMm8K7OEJ1wRWlb21LxDNMQf0r0ctNsgdS2Kp420vCKM+CJTvsmBWd55M
	Kx4jX3skMWDuUjblZzlctHu1VEBGz3w2VZBSFCnHwhOExQbu47hSFHjO9u81LQzggkiRQs
	rHTwrOQXkYuTSh+1/j6VPYGDh2nair8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1709540328;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0GcM6Zqc7S8KzSFH/QRWGM93gGR/7+3SWwjm/qiQ8mk=;
	b=KttDyL/9tqsbQ1NkCk/c+CVu+CmQHBG/VZMUlGn01xYjL+8DRsYSwp6a46n4Rf/ZsbO9pn
	YwSb3e3IHX7LEVDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 150B913A58;
	Mon,  4 Mar 2024 08:18:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id KTGUA+iD5WVeagAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 04 Mar 2024 08:18:48 +0000
Date: Mon, 04 Mar 2024 09:18:47 +0100
Message-ID: <87y1ay1kbc.wl-tiwai@suse.de>
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
Subject: Re: [PATCH v3 0/5] ALSA/ASoC: Conditionally skip i915 init and
 cleanups
In-Reply-To: <20240226124432.1203798-1-cezary.rojewski@intel.com>
References: <20240226124432.1203798-1-cezary.rojewski@intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Bar: /
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=r1o4XTcn;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="KttDyL/9"
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-0.76 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 MIME_GOOD(-0.10)[text/plain];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 DKIM_TRACE(0.00)[suse.de:+];
	 MX_GOOD(-0.01)[];
	 RCPT_COUNT_TWELVE(0.00)[14];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.25)[73.24%]
X-Rspamd-Queue-Id: 7DC77687A5
Message-ID-Hash: KAWW35V5A2DJQCSBF6DP6MCMP2PEVS34
X-Message-ID-Hash: KAWW35V5A2DJQCSBF6DP6MCMP2PEVS34
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KAWW35V5A2DJQCSBF6DP6MCMP2PEVS34/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 26 Feb 2024 13:44:27 +0100,
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
> Changes in v3:
> - snd_soc_hda_codec now returns -ENODEV on attach() if i915 is not
>   present
> - denylist now const
> - added new patch for the avs-driver to address -ENODEV during
>   probe_codec()
> - note: retained reviewed-by for patch 1/4 as changes are minimal
> 
> Changes in v2:
> - list of problematic VGA devices is now declared locally, no more
>   touching drm stuff
> 
> Cezary Rojewski (5):
>   ALSA: hda: Skip i915 initialization on CNL/LKF-based platforms
>   ASoC: codecs: hda: Skip HDMI/DP registration if i915 is missing
>   ASoC: Intel: avs: Ignore codecs with no suppoting driver
>   ASoC: codecs: hda: Cleanup error messages
>   ALSA: hda: Reuse for_each_pcm_streams()

Applied to for-next branch now.  Thanks.


Takashi
