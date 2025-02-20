Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E945CA3E1D9
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Feb 2025 18:08:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 21A3060591;
	Thu, 20 Feb 2025 18:08:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 21A3060591
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1740071310;
	bh=jxkfGLseJKQGm/Wu+jSyJs6KRESNwJzdUAWbwAMZZSk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TS3/msHT65VaSgMNBuYx6wyYt+R3Iko2y6outQ4lbDUy2y371DvJYd5lteAv6hs9/
	 01Qk2vo3dQxpKfGioyVMLNHExRwqTiSTl0LLvY8mfjvGKiNkdCNaN6AMPgBE3apzXg
	 EFa3vmJNNHzGyGT7grxoCsoq3tXnSIoqhtDKODfs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6F711F800E3; Thu, 20 Feb 2025 18:08:16 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B891F805B4;
	Thu, 20 Feb 2025 18:08:12 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 61261F8032D; Thu, 20 Feb 2025 18:07:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4A6A8F8001D
	for <alsa-devel@alsa-project.org>; Thu, 20 Feb 2025 18:07:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4A6A8F8001D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=xCtgKqIY;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=pwqMUwhq;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=xCtgKqIY;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=pwqMUwhq
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 5E88021174;
	Thu, 20 Feb 2025 17:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1740071263;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rxqeAyyRTMh5dpkBIDFcAuh2XPnTNJPihX/jfHLsZZQ=;
	b=xCtgKqIYq8vRyodmDCi9evTiqMTjTKgBugQgBpcFgTzDDllnhaHIlbsPK+xeGbiltv23nM
	w5aZ9mBdedQ6BWcxMIBNyHE7ib0JuWwhG+S106tu+l4yWAHB7eKQQ6cHjN9IYd9WlohSnZ
	vNRzacQnAznfgND9kFQ0CcmeDvKNdgk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1740071263;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rxqeAyyRTMh5dpkBIDFcAuh2XPnTNJPihX/jfHLsZZQ=;
	b=pwqMUwhq0BFKn3J3USaz8Nf6EKiefCbYbNG7aKKHo2gwxSA3VeeRQ8M/wgV6EKFkHFSp+k
	cG/cczNMmRvNztCg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1740071263;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rxqeAyyRTMh5dpkBIDFcAuh2XPnTNJPihX/jfHLsZZQ=;
	b=xCtgKqIYq8vRyodmDCi9evTiqMTjTKgBugQgBpcFgTzDDllnhaHIlbsPK+xeGbiltv23nM
	w5aZ9mBdedQ6BWcxMIBNyHE7ib0JuWwhG+S106tu+l4yWAHB7eKQQ6cHjN9IYd9WlohSnZ
	vNRzacQnAznfgND9kFQ0CcmeDvKNdgk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1740071263;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rxqeAyyRTMh5dpkBIDFcAuh2XPnTNJPihX/jfHLsZZQ=;
	b=pwqMUwhq0BFKn3J3USaz8Nf6EKiefCbYbNG7aKKHo2gwxSA3VeeRQ8M/wgV6EKFkHFSp+k
	cG/cczNMmRvNztCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2401213301;
	Thu, 20 Feb 2025 17:07:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id SEukBV9ht2exEQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 20 Feb 2025 17:07:43 +0000
Date: Thu, 20 Feb 2025 18:07:42 +0100
Message-ID: <87a5ag35pd.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Dmitry Panchenko | d-Systems <dmitry@d-systems.ee>
Cc: alsa-devel@alsa-project.org
Subject: Re: [PATCH] ALSA: usb-audio: Re-add sample rate quirk for Pioneer
 DJM-900NXS2
In-Reply-To: <20250220161540.3624660-1-dmitry@d-systems.ee>
References: <20250220161540.3624660-1-dmitry@d-systems.ee>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
Message-ID-Hash: SBU3FMILKEVO6QFVZPNE4KRPHCGTEW55
X-Message-ID-Hash: SBU3FMILKEVO6QFVZPNE4KRPHCGTEW55
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SBU3FMILKEVO6QFVZPNE4KRPHCGTEW55/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 20 Feb 2025 17:15:37 +0100,
Dmitry Panchenko | d-Systems wrote:
> 
> From: Dmitry Panchenko <dmitry@d-systems.ee>
> 
> Re-add the sample-rate quirk for the Pioneer DJM-900NXS2. This
> device does not not work without setting sample-rate.
> 
> Signed-off-by: Dmitry Panchenko <dmitry@d-systems.ee>

Thanks, applied now.

But at the next time, please rather post to linux-sound ML instead of
alsa-devel ML, and put me to Cc.  (I see you've sent a separate post
to me without Cc to ML.)


Takashi
