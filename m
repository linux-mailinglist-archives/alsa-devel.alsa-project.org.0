Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A36964B96
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Aug 2024 18:23:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6EBC682B;
	Thu, 29 Aug 2024 18:23:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6EBC682B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724948601;
	bh=xCJMHOX25QOgtyzPIKPwJ4McoZCcuj2+xMof2qIuWgU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=e47Rtygz+j/Q9Hn4EMzcQOHjWB3HPzG4UG8T9zuMwDOtuJDDnR31i9Y25qNzyFNbs
	 aEExfR8Kh+v8seAatG2ONSAXiZ+2+ki3q4/fODJLWoxfOwtjZ3T7UsRqeHKJjbowtH
	 I1f80oBivY+IH2Yhub1tBUQ9aPmeNoZAxgl9mhDo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B6C45F805B1; Thu, 29 Aug 2024 18:23:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A251F80589;
	Thu, 29 Aug 2024 18:23:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 54F82F80518; Thu, 29 Aug 2024 18:22:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 65DABF8025E
	for <alsa-devel@alsa-project.org>; Thu, 29 Aug 2024 18:22:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65DABF8025E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=BdotlAeI;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=Tegg2S6s;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=WhyHXXT4;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=X08BLpck
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id DA8C11F449;
	Thu, 29 Aug 2024 16:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1724948572;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lqxE3wVAnc67PfYzr6H1KIHv1Iy/FY0+ZzpQO2C1mxI=;
	b=BdotlAeI0VSdcxvGLRC7bygesEtHqHnR6XWaqk5mHPusCdqYwSaOp2jVXUv2m86de9Rpoj
	sEQvqufbCYGhZe6gXPojVz9JR3Xl0HUkM8A5rmo6llYuXrO/ea8xSPr4Dp8Uo/4cSlvwgm
	deO0GTfuDHxcX8oEZn2Yv1Oufyo6X1k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1724948572;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lqxE3wVAnc67PfYzr6H1KIHv1Iy/FY0+ZzpQO2C1mxI=;
	b=Tegg2S6s91p1Ak43LJHtRTZuJlc0H03bdO+XGa3KShtg4wItYLorPL9yVkCVIsdCnRhKdB
	7DpmAJsS6gRV21BA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=WhyHXXT4;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=X08BLpck
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1724948571;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lqxE3wVAnc67PfYzr6H1KIHv1Iy/FY0+ZzpQO2C1mxI=;
	b=WhyHXXT47Nmzdddu3hmBPFwDW3NyK5FrysR+qeabrhhpU1CLD7kBR/2zBSVly+O9CC/DAK
	O/IYBayw34IuMbgrZZZxQiaWEmjsAReP3bvxNQY2oqUeKFrYg9WNzc2LMYODCHRuZti/VH
	8rtPDi4UkwRxXM3FQWUl8m+BzKY7mu8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1724948571;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lqxE3wVAnc67PfYzr6H1KIHv1Iy/FY0+ZzpQO2C1mxI=;
	b=X08BLpckludQQ+MOsb/Rt+EkPS09ZuJFKIb/TWSsQPxWABMFAnB6YTUVOlp9YiqiGbwqAq
	ff1kcSFma9pKQ4Dg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AC5AC13408;
	Thu, 29 Aug 2024 16:22:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 0RzXKFug0GZUeQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 29 Aug 2024 16:22:51 +0000
Date: Thu, 29 Aug 2024 18:23:36 +0200
Message-ID: <87wmjzl2lz.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Simon Trimmer <simont@opensource.cirrus.com>
Cc: <tiwai@suse.com>,
	<linux-sound@vger.kernel.org>,
	<alsa-devel@alsa-project.org>,
	<linux-kernel@vger.kernel.org>,
	<patches@opensource.cirrus.com>
Subject: Re: [PATCH] ALSA: hda/realtek: Autodetect Cirrus Logic companion
 amplifier bindings
In-Reply-To: <20240829161114.140938-1-simont@opensource.cirrus.com>
References: <20240829161114.140938-1-simont@opensource.cirrus.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: DA8C11F449
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	DWL_DNSWL_MED(-2.00)[suse.de:dkim];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[cirrus.com:email,suse.de:mid,suse.de:dkim];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
Message-ID-Hash: VX2UNMXUKCH7JGY7XF37FAWOYJE7YICE
X-Message-ID-Hash: VX2UNMXUKCH7JGY7XF37FAWOYJE7YICE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VX2UNMXUKCH7JGY7XF37FAWOYJE7YICE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 29 Aug 2024 18:11:14 +0200,
Simon Trimmer wrote:
> 
> We do not need model specific HDA quirks to construct the component
> binding details of Cirrus Logic companion amplifiers as this information
> is already present in the ACPI.
> 
> Quirks are then only required for special workarounds not described in
> the ACPI such as internal configuration of the Realtek codecs.
> 
> The codec pointer is now initialized in hda_component_manager_init() so
> that we can detect when companion amplifiers are found in the ACPI but
> the SSID invokes a quirk that also attempts to create the component
> binding.
> 
> Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
> ---
> v1 - This patch applies to for-next with this additional patch:
>      b1faff28a2bd ("ALSA: hda: hda_component: Fix mutex crash if nothing ever binds")
>      which is currently only in the for-linus.

OK, I now merged for-linus to for-next, and applied yours.

>      We're looking to do the same for the CS35L41 devices, but that will
>      come later because there are many more quirks to work through.

That's understandable.  Thanks!


Takashi
