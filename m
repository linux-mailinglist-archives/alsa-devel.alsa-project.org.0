Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B2958C7830C
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Nov 2025 10:38:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF60860217;
	Fri, 21 Nov 2025 10:38:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF60860217
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1763717926;
	bh=t7nlKrgmssB7q+CNTTWdT9AtIi0AEug274YJaPc/NEU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=I8DNcWTj3E4jJNmScbe1jx4FS3SLeAYIOoz3YWq5377k3r9HMwv1QNQjtSqlJiibP
	 BiPq/Y/IjEfpb8f/SMEM+00ehS3ZfJyNoIbS6hKnue6jrVf0dacvpvPFYt1qQapqOq
	 XR7Qm3Kp2Sm+UzPSnnBIWY8zp0IfQQgroLixWaHg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A10D5F805D4; Fri, 21 Nov 2025 10:38:13 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 074FBF8053D;
	Fri, 21 Nov 2025 10:38:13 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 34EF4F80448; Fri, 21 Nov 2025 10:38:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 65E8BF80072
	for <alsa-devel@alsa-project.org>; Fri, 21 Nov 2025 10:38:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65E8BF80072
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=qgZU0jiy;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=+zAjp6L9;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=iafgl/MV;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=rhYspFT0
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 52A2120F31;
	Fri, 21 Nov 2025 09:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1763717879;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hBej4R4RGLqwB3zPRIgsB4AW7i30BQ/SJn56YvEut0o=;
	b=qgZU0jiyajvOMB01vm4d5MTTAqqlxeQ7r6UCot760VWiG4ZUzFuz/QiK0FHLaTVMDytumm
	oSCrW1WStJ8eHSjJCCzEaUE9CssPmOdbanAbuZGmzwNeRUqnnuLJcvL28op8QSA76E8Fuo
	77++hl5pA3StRhyfSt32gLma8gACqZE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1763717879;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hBej4R4RGLqwB3zPRIgsB4AW7i30BQ/SJn56YvEut0o=;
	b=+zAjp6L9rrTn+ofwu1xfC22V1pZQ4r+ybbT/1A66VtwReBPPUw4Le6sDz4R0RD8JfkWlvK
	nctUMFR8xxo3ddAg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="iafgl/MV";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=rhYspFT0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1763717878;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hBej4R4RGLqwB3zPRIgsB4AW7i30BQ/SJn56YvEut0o=;
	b=iafgl/MVEmTqxsf6xZgPCXkWzIRqeHVaO99qjvUohZH6Xy0O297+PLpLHSz9XheKSyFwhq
	BFVImKYh1Fgvvp4JsJgsAAcH4iXU12dES2tx41tVQ+9rT0kwu7jAW9CG6quCHqLT6IwbCJ
	+tRVAOgfoQINwGZB4xuoyni+4cnXS0U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1763717878;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hBej4R4RGLqwB3zPRIgsB4AW7i30BQ/SJn56YvEut0o=;
	b=rhYspFT0+OdliJC+QbuF9U0CCP3iBq14qBmw8mCXAqyTiYvBeMLlKNCsmrBGtLN+vECLcA
	99vtodDMgjJJaeCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 31C6A3EA61;
	Fri, 21 Nov 2025 09:37:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id w4wIC/YyIGkeewAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 21 Nov 2025 09:37:58 +0000
Date: Fri, 21 Nov 2025 10:37:57 +0100
Message-ID: <878qfz4tfu.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Jacob Zhong <cmpute@qq.com>
Cc: tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] add the SND quirk for HP pavilion aero laptop 13z-be200
In-Reply-To: <tencent_E2DFA33EFDF39E0517A94FA8FF06C05C0709@qq.com>
References: <tencent_E2DFA33EFDF39E0517A94FA8FF06C05C0709@qq.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 52A2120F31
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_TO(0.00)[qq.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[qq.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid]
Message-ID-Hash: K4IDQXP6ZDPW4CHUKYXDQG52RC3GUL6P
X-Message-ID-Hash: K4IDQXP6ZDPW4CHUKYXDQG52RC3GUL6P
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/K4IDQXP6ZDPW4CHUKYXDQG52RC3GUL6P/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 21 Nov 2025 02:57:12 +0100,
Jacob Zhong wrote:
> 
> The laptop uses ALC287 chip (as shown in /proc/asound/card1/codec#0).
> It seems that every HP pavilion laptop in the table uses the same quirk,
> so I just copied them. I have verified that the mute LED on my laptop
> works with this patch.
> 
> For reference, here's the alsa-info of my laptop:
> https://alsa-project.org/db/?f=2d5f297087708610bc01816ab12052abdd4a17c0
> 
> Signed-off-by: Jacob Zhong <cmpute@qq.com>

Applied now.  Thanks.


Takashi
