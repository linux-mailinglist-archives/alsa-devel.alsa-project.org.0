Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 292CC84C574
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Feb 2024 08:06:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1143D850;
	Wed,  7 Feb 2024 08:05:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1143D850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707289562;
	bh=EXW6XWWmdQH4JwkwGz7Ylm1fbJKRhblA7kQzzwKv14I=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bsSxDi4JTbewGnc0h9PN42ie8TajvdTc+K1fA/pDC/H1iju9yyq+U568KO87TjNln
	 s+9LNUs149mWK6dPWDwJ3bZmEuf6ZBFqphGHWnUfUN02hmwJPCaWS6mrQD+SUtTXLu
	 ay7om+/YLoehTOBI0/xQ/6sswAatl5NdkynfafXw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 62010F80579; Wed,  7 Feb 2024 08:05:30 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 567C3F805A1;
	Wed,  7 Feb 2024 08:05:29 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0AD81F801EB; Wed,  7 Feb 2024 08:05:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 510B1F800E3
	for <alsa-devel@alsa-project.org>; Wed,  7 Feb 2024 08:05:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 510B1F800E3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=pMEPN5i+;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=2Y1DwWSj;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=BVXP1nkI;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=CfugtL1Q
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E21512216B;
	Wed,  7 Feb 2024 07:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1707289517;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8HJIOCuzaPdkBcXNr239npB0JKRrCXPsquj3JkdNAPI=;
	b=pMEPN5i+Lu13GC+jWqQ3jk1LNuadyRVmDLOj4pSTFtN6HXPyyJrtX6vdoq7OdTBKiKchz4
	ofpCwJoMZK9IZi7/hamp+jN3BmCmeJl5NCaPL+/o76VZ6e6xSa0e75RCmR0JfEWX91nH43
	krgyk298FzhRTX6CQq0y/zb9ZL/n6WQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707289517;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8HJIOCuzaPdkBcXNr239npB0JKRrCXPsquj3JkdNAPI=;
	b=2Y1DwWSjCHRMwvgkzLcepI3bRq3b/rRwT1ana8e2fhUzTIepWs66oNzfG2vmsGy+xoQh+P
	G8zPS9jHT+voqkAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1707289516;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8HJIOCuzaPdkBcXNr239npB0JKRrCXPsquj3JkdNAPI=;
	b=BVXP1nkIDhCAx9Q5usIsQZNU6udEKJoNd64DEFApskn0IGl1EALHtmjrllSS2awdUJeTvc
	t6tPxNaMMgawjDkqj7bOtgg369T517B1NbbfW35mIPv6H+esmBJqHEpVsvspCAwpzhiUy/
	LQXNEBRQQMc1y6GnIiCmocHBO8pbkMg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707289516;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8HJIOCuzaPdkBcXNr239npB0JKRrCXPsquj3JkdNAPI=;
	b=CfugtL1QerC0Mii2wg1EJXe7pyXSl8GuKx7QtIMPXxxvhJaCyNmcex+gJS+FLZDcuCDCvt
	Lt7lMDGchRhPdCDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 43587139D8;
	Wed,  7 Feb 2024 07:05:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id TiDJDqwrw2XfLAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 07 Feb 2024 07:05:16 +0000
Date: Wed, 07 Feb 2024 08:05:15 +0100
Message-ID: <877cjg7o0k.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: <srinivas.kandagatla@linaro.org>,
	<mathias.nyman@intel.com>,
	<perex@perex.cz>,
	<conor+dt@kernel.org>,
	<corbet@lwn.net>,
	<lgirdwood@gmail.com>,
	<andersson@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>,
	<gregkh@linuxfoundation.org>,
	<Thinh.Nguyen@synopsys.com>,
	<broonie@kernel.org>,
	<bgoswami@quicinc.com>,
	<tiwai@suse.com>,
	<robh+dt@kernel.org>,
	<konrad.dybcio@linaro.org>,
	<linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>,
	<linux-sound@vger.kernel.org>,
	<linux-usb@vger.kernel.org>,
	<linux-arm-msm@vger.kernel.org>,
	<linux-doc@vger.kernel.org>,
	<alsa-devel@alsa-project.org>
Subject: Re: [PATCH v13 35/53] ALSA: usb-audio: Prevent starting of audio
 stream if in use
In-Reply-To: <ef83036f-6605-1db3-d962-ac28a10711ac@quicinc.com>
References: <20240203023645.31105-1-quic_wcheng@quicinc.com>
	<20240203023645.31105-36-quic_wcheng@quicinc.com>
	<87y1bxvj0o.wl-tiwai@suse.de>
	<ef83036f-6605-1db3-d962-ac28a10711ac@quicinc.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=BVXP1nkI;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=CfugtL1Q
X-Spamd-Result: default: False [-4.31 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	 TO_DN_SOME(0.00)[];
	 R_RATELIMIT(0.00)[to_ip_from(RLe67txhfobum3fqdb5xx8e3au)];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_TRACE(0.00)[suse.de:+];
	 MX_GOOD(-0.01)[];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 BAYES_HAM(-3.00)[100.00%];
	 ARC_NA(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 FROM_HAS_DN(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 TAGGED_RCPT(0.00)[dt];
	 MIME_GOOD(-0.10)[text/plain];
	 DWL_DNSWL_HI(-3.50)[suse.de:dkim];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 RCPT_COUNT_TWELVE(0.00)[23];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[quicinc.com:email,suse.de:dkim];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FREEMAIL_CC(0.00)[linaro.org,intel.com,perex.cz,kernel.org,lwn.net,gmail.com,linuxfoundation.org,synopsys.com,quicinc.com,suse.com,vger.kernel.org,alsa-project.org];
	 RCVD_TLS_ALL(0.00)[];
	 SUSPICIOUS_RECIPS(1.50)[]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: E21512216B
Message-ID-Hash: 4SPZHBL53LJK5D7QG5QTVQMF22RTZQU2
X-Message-ID-Hash: 4SPZHBL53LJK5D7QG5QTVQMF22RTZQU2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4SPZHBL53LJK5D7QG5QTVQMF22RTZQU2/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 07 Feb 2024 01:08:00 +0100,
Wesley Cheng wrote:
> 
> Hi Takashi,
> 
> On 2/6/2024 5:07 AM, Takashi Iwai wrote:
> > On Sat, 03 Feb 2024 03:36:27 +0100,
> > Wesley Cheng wrote:
> >> 
> >> With USB audio offloading, an audio session is started from the ASoC
> >> platform sound card and PCM devices.  Likewise, the USB SND path is still
> >> readily available for use, in case the non-offload path is desired.  In
> >> order to prevent the two entities from attempting to use the USB bus,
> >> introduce a flag that determines when either paths are in use.
> >> 
> >> If a PCM device is already in use, the check will return an error to
> >> userspace notifying that the stream is currently busy.  This ensures that
> >> only one path is using the USB substream.
> >> 
> >> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> > 
> > Hm, I'm not sure whether it's safe to hold chip->mutex there for the
> > long code path.  It even kicks off the auto-resume, which may call
> > various functions at resuming, and some of them may re-hold
> > chip->mutex.
> > 
> 
> That's a good point.
> 
> > If it's only about the open flag, protect only the flag access with
> > the mutex, not covering the all open function.  At least the re-entry
> > can be avoided by that.
> > 
> 
> Sure, let me re-order the check/assignment and the mutex locking.
> Since this is now checked here in USB PCM and the QC offload driver,
> we want to make sure that if there was some application attempting to
> open both at the same time, we prevent any possible races.
> 
> I think the best way to address this would be something like:
> 
> static int snd_usb_pcm_open(struct snd_pcm_substream *substream)
> {
> ...
> 	mutex_lock(&chip->mutex);
> 	if (subs->opened) {
> 		mutex_unlock(&chip->mutex);
> 		return -EBUSY;
> 	}
> 	subs->opened = 1;
> 	mutex_unlock(&chip->mutex);
> 
> //Execute bulk of PCM open routine
> ...
> 	return 0;
> 
> // If any errors are seen, unwind
> err_resume:
> 	snd_usb_autosuspend(subs->stream->chip);
> err_open:
> 	mutex_lock(&chip->mutex);
> 	subs->opened = 0;
> 	mutex_unlock(&chip->mutex);
> 
> 	return ret;
> }
> 
> Set the opened flag first, so that if QC offload checks it, it can
> exit early and vice versa.  Otherwise, if we set the opened flag at
> the same position as the previous patch, we may be calling the other
> routines in parallel to the QC offload enable stream routine.  The
> only thing with this patch is that we'd need some error handling
> unwinding.

The above is what I had in mind.

But, thinking on this again, you might be able to get the same result
by using the ALSA PCM core substream open_mutex and hw_opened flag.
This is already held and set at snd_pcm_core() (the hw_opened flag is
set after open callback, though).  The offload driver can use those
instead of the own lock and flag, too, although it's not really
well-mannered behavior (hence you need proper comments).


thanks,

Takashi
