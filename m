Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 62EED8A9405
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Apr 2024 09:32:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA92BEDB;
	Thu, 18 Apr 2024 09:31:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA92BEDB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713425520;
	bh=V8W5eJCawbdGL5jA4GpB/sidgLpAVnXqP2OZun/RdiU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FOhsfYCsf4mXxAi4m5S6nEYnfdIGpKGJTd31iKRvHUhwnoX3JMhFJdozT/0z1zG88
	 IsvQBvnXnsktTv4Sa+690gWLnuEVkk5J78Yekn8AqYblfFk/k0zUztL2MmHlzFmMRK
	 4UYydk4w2I7wmB+KxX57VAnEzbPdTJ1QJuzu/Cxw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AC358F805AC; Thu, 18 Apr 2024 09:31:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 279E7F805A0;
	Thu, 18 Apr 2024 09:31:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DAB7DF8025A; Thu, 18 Apr 2024 09:31:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 588D4F8003A
	for <alsa-devel@alsa-project.org>; Thu, 18 Apr 2024 09:31:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 588D4F8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=tNNs1BuL;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=odBcOFHG;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=tNNs1BuL;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=odBcOFHG
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 01AF45C5E1;
	Thu, 18 Apr 2024 07:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1713425467;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Gm0WKneDt6T4QEdBgQcIxzWrvmhDwkvlbQQZhAQymXw=;
	b=tNNs1BuLgxAd+iqfoHxo8u9D864ofv4oBrRDkBBvqSPUIzM73BOwPosByp3L9NQkp4tfrz
	mO6mo6Ky3WoxfBSNpouaHZIWRIRWqRtRyyR7rMNZkDqaKogaO3bP7/mZJ2hFGlbu2pIQ4v
	ceGfj7KjXivG1pFk5mwH0gJ0z3KKxek=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1713425467;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Gm0WKneDt6T4QEdBgQcIxzWrvmhDwkvlbQQZhAQymXw=;
	b=odBcOFHGHMVrXSJe9d+6PWBHKCmYtupts9kLy0XD9yzQpD3+7RE2VZhjrZG/Ey0QrJ4Efu
	/edKuoGyx6jizZBg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=tNNs1BuL;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=odBcOFHG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1713425467;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Gm0WKneDt6T4QEdBgQcIxzWrvmhDwkvlbQQZhAQymXw=;
	b=tNNs1BuLgxAd+iqfoHxo8u9D864ofv4oBrRDkBBvqSPUIzM73BOwPosByp3L9NQkp4tfrz
	mO6mo6Ky3WoxfBSNpouaHZIWRIRWqRtRyyR7rMNZkDqaKogaO3bP7/mZJ2hFGlbu2pIQ4v
	ceGfj7KjXivG1pFk5mwH0gJ0z3KKxek=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1713425467;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Gm0WKneDt6T4QEdBgQcIxzWrvmhDwkvlbQQZhAQymXw=;
	b=odBcOFHGHMVrXSJe9d+6PWBHKCmYtupts9kLy0XD9yzQpD3+7RE2VZhjrZG/Ey0QrJ4Efu
	/edKuoGyx6jizZBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CEC381384C;
	Thu, 18 Apr 2024 07:31:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ZdTXMDrMIGbwCgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 18 Apr 2024 07:31:06 +0000
Date: Thu, 18 Apr 2024 09:31:15 +0200
Message-ID: <87cyqnxh30.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Pavel Hofman <pavel.hofman@ivitera.com>
Cc: alsa-devel@alsa-project.org,
	Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH 0/3] adding 705.6/768kHz rates; DSD and 768kHz in aloop
In-Reply-To: <20240416121726.628679-1-pavel.hofman@ivitera.com>
References: <20240416121726.628679-1-pavel.hofman@ivitera.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-0.58 / 50.00];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	BAYES_HAM(-0.07)[62.32%];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spamd-Bar: /
X-Rspamd-Queue-Id: 01AF45C5E1
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
Message-ID-Hash: B26UOPX6OM4YTJ6IBC4GLA62E4IKACUP
X-Message-ID-Hash: B26UOPX6OM4YTJ6IBC4GLA62E4IKACUP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/B26UOPX6OM4YTJ6IBC4GLA62E4IKACUP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 16 Apr 2024 14:17:23 +0200,
Pavel Hofman wrote:
> 
> This patch series allows using the loopback driver in modern chains with
> samplerates up to 768kHz and DSD formats.
> 
> The patch "ALSA:pcm: add support for 705.6kHz and 768kHz sample rates" is
> basically a copy of commit 4cc4531c310e ("ALSA: pcm: add support for 352.8KHz and 384KHz sample rate").
> 
> As of loopback performance at 768kHz - in my tests aloop runs OK event at
> 12MHz samplerate.
> 
> Pavel Hofman (3):
>   ALSA:aloop: add DSD formats
>   ALSA:pcm: add support for 705.6kHz and 768kHz sample rates
>   ALSA:aloop: add support for up to 768kHz sample rate

Applied to for-next branch now.  Thanks.


Takashi
