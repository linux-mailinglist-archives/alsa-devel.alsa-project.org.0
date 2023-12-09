Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F96A80B31F
	for <lists+alsa-devel@lfdr.de>; Sat,  9 Dec 2023 09:17:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DC776DEB;
	Sat,  9 Dec 2023 09:17:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DC776DEB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702109862;
	bh=rgFsWbplqF7kjuvavoSx3MciKyYQOsBdV3nWjt9fAR4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=omFzlk6rLYnvJ5JCRh+Ljd9lFgcBL2sEf8mV2RrdJnhqCQ1QWm7MR+QanMc4BEWsW
	 f99l0afsfeTWh6IvZE0QkzEjacJXqQ7JwLijAyjLbviCAjGrcxi8ReaeQx2LD4Zw87
	 APf8KOUkeuTvWnosd6f6zqOcNkv1oRw71Uf5osL4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 12782F805EA; Sat,  9 Dec 2023 09:16:49 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F208CF805E1;
	Sat,  9 Dec 2023 09:16:48 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 993DCF8025A; Sat,  9 Dec 2023 09:11:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 21E26F800F5
	for <alsa-devel@alsa-project.org>; Sat,  9 Dec 2023 09:10:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21E26F800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=13p/SZfi;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=9gL8jGZn;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=13p/SZfi;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=9gL8jGZn
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4EB3021DAA;
	Sat,  9 Dec 2023 08:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1702109456;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7c26mC+66VMAVt1GIwXQwVx/6dZRK5Hi5j94l+x99q0=;
	b=13p/SZfimif1weYWzGmk4lztLxOjIQlEvV+IRoJf84mrAuNmvA0kq0nNgMe1I7kDK+hbtr
	vlYAD/ZPQvuizUh6aISL7vEShjyVy6+QPv8WTRmH0y4cXuhFOyF7Gxe5ZfbpAYM2V8oKXR
	MxhQ/E1bpwnFCuY/j7nJD2iPtX5HeZY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1702109456;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7c26mC+66VMAVt1GIwXQwVx/6dZRK5Hi5j94l+x99q0=;
	b=9gL8jGZnNgB0J8ZRNAGlJvX0Jp0orL8XvNXPIYD4vT1qImlMpynMhT4BEQZCwnji8+Y/tO
	mmjVqwdzTdEvRwAg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1702109456;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7c26mC+66VMAVt1GIwXQwVx/6dZRK5Hi5j94l+x99q0=;
	b=13p/SZfimif1weYWzGmk4lztLxOjIQlEvV+IRoJf84mrAuNmvA0kq0nNgMe1I7kDK+hbtr
	vlYAD/ZPQvuizUh6aISL7vEShjyVy6+QPv8WTRmH0y4cXuhFOyF7Gxe5ZfbpAYM2V8oKXR
	MxhQ/E1bpwnFCuY/j7nJD2iPtX5HeZY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1702109456;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7c26mC+66VMAVt1GIwXQwVx/6dZRK5Hi5j94l+x99q0=;
	b=9gL8jGZnNgB0J8ZRNAGlJvX0Jp0orL8XvNXPIYD4vT1qImlMpynMhT4BEQZCwnji8+Y/tO
	mmjVqwdzTdEvRwAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F0E98136D6;
	Sat,  9 Dec 2023 08:10:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id RI9QOQ8hdGWSdQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 09 Dec 2023 08:10:55 +0000
Date: Sat, 09 Dec 2023 09:10:55 +0100
Message-ID: <87ttor6bjk.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Gergo Koteles <soyer@irl.hu>
Cc: Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] ALSA: hda/tas2781: leave hda_component in usable state
In-Reply-To: 
 <c3e903fedec7d84929664377307019e58dc22494.1702058704.git.soyer@irl.hu>
References: 
 <c3e903fedec7d84929664377307019e58dc22494.1702058704.git.soyer@irl.hu>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Authentication-Results: smtp-out1.suse.de;
	none
X-Spamd-Result: default: False [-3.29 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 MIME_GOOD(-0.10)[text/plain];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 NEURAL_HAM_SHORT(-0.20)[-0.983];
	 RCPT_COUNT_SEVEN(0.00)[9];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-2.99)[99.96%]
Message-ID-Hash: JDUXFO3MJYKRBSH2SEWLGUCVR4JEH7TQ
X-Message-ID-Hash: JDUXFO3MJYKRBSH2SEWLGUCVR4JEH7TQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JDUXFO3MJYKRBSH2SEWLGUCVR4JEH7TQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 08 Dec 2023 19:06:49 +0100,
Gergo Koteles wrote:
> 
> @@ -612,9 +612,13 @@ static void tas2781_hda_unbind(struct device *dev,
>  {
>  	struct tasdevice_priv *tas_priv = dev_get_drvdata(dev);
>  	struct hda_component *comps = master_data;
> +	comps = &comps[tas_priv->index];
>  
> -	if (comps[tas_priv->index].dev == dev)
> -		memset(&comps[tas_priv->index], 0, sizeof(*comps));
> +	if (comps->dev == dev) {
> +		comps->dev = NULL;
> +		strscpy(comps->name, "", sizeof(comps->name));

This looks suboptimal.  Either just set *comp->name = 0, or fill all
with memset().


thanks,

Takashi
