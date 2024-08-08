Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 699E694C2D5
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Aug 2024 18:35:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D0F65845;
	Thu,  8 Aug 2024 18:35:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D0F65845
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723134924;
	bh=Ss07Ig0Vc0WTFPvO7fYvtBUA+bSnfXv7lWQANVwNBvE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DRIn975siTfoT3uThaaYPn+Jq9i4te1kbDqo1po8HTRv6cnzvaQURr+mdqY0cho1f
	 +UJnGIHlY6oCOvbtJK+GL5LOJZ1fYSK9GOjFgkTss6dv/a3S9/EfzD3JLkq5wXRomP
	 MKHR2w2kT+jlSRW6I5UH6JkXzF8d859w/3MqeMds=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 99ED7F805BB; Thu,  8 Aug 2024 18:34:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E1CCFF805B0;
	Thu,  8 Aug 2024 18:34:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EE886F80448; Thu,  8 Aug 2024 18:32:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 71DACF800E3
	for <alsa-devel@alsa-project.org>; Thu,  8 Aug 2024 18:32:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 71DACF800E3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=DXZai/bt;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=QqpzbkHJ;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=OB+fIaYl;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=7byGmy7+
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0F50E1FCE9;
	Thu,  8 Aug 2024 16:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1723134753;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=H8chINUKV2piRga7HhL1/U/V6Fkt52brkH0qlXNSc60=;
	b=DXZai/bt+v3XBpfjfcvjUErBnJP08T8GXuKAW1sEykWLqzGV5LGiETkTXqe31bA5CxXCSX
	9jBpBHySwjEIfjFTYBy2/QkGV487Giz7X7ALNoDnZnWq2NJFa1+xnRGhoSRzFtcjikfBPU
	Q2Sdnm4iX41TF5w5mAnNBC5tPLCiVkY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723134753;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=H8chINUKV2piRga7HhL1/U/V6Fkt52brkH0qlXNSc60=;
	b=QqpzbkHJwqjKxtygxeos5r6dBcvKZu6YG+KhH0kqHTsOvfTGTBWu+b9rwWcafa0fvIA7dR
	+o4FJ7XuHhjFKHDg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=OB+fIaYl;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=7byGmy7+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1723134752;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=H8chINUKV2piRga7HhL1/U/V6Fkt52brkH0qlXNSc60=;
	b=OB+fIaYlY0Ma6CWZl9Q8dwtKT2wLnna0rJirSdCACLg8wT+JsAiNdoG/3ngi+c3ByHF2SR
	40pq7h1dOxPpDIPkSiYcSLFwB+ACDVx7ESS1WJkHAqpKvlGXcYho5l3EdqTzYDX3oP6d6e
	iVc/kJbowFcPvyhrcgokqx7iIv0/dKw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723134752;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=H8chINUKV2piRga7HhL1/U/V6Fkt52brkH0qlXNSc60=;
	b=7byGmy7+1GLdYzU6ljcyvna0g6MLnN6vSTuAQBPIUyraFjyPRNVYFLtwgh7i3CubkHOCpq
	WdN2nHIW8mdFBzDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CBF5C13B20;
	Thu,  8 Aug 2024 16:32:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id sYNtMB/ztGZvLgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 08 Aug 2024 16:32:31 +0000
Date: Thu, 08 Aug 2024 18:33:10 +0200
Message-ID: <87ed6z7z5l.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Daniel Mack <zonque@gmail.com>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: snd-usb-caiaq: use snd_pcm_rate_to_rate_bit
In-Reply-To: <20240808134857.86749-1-jbrunet@baylibre.com>
References: <20240808134857.86749-1-jbrunet@baylibre.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-2.51 / 50.00];
	DWL_DNSWL_MED(-2.00)[suse.de:dkim];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[suse.com,perex.cz,gmail.com,alsa-project.org,vger.kernel.org];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,baylibre.com:email];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,baylibre.com:email];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 0F50E1FCE9
Message-ID-Hash: 2BL7MNJEZMPKQ4YNPGQEEBY76BPH4JCO
X-Message-ID-Hash: 2BL7MNJEZMPKQ4YNPGQEEBY76BPH4JCO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2BL7MNJEZMPKQ4YNPGQEEBY76BPH4JCO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 08 Aug 2024 15:48:54 +0200,
Jerome Brunet wrote:
> 
> Use snd_pcm_rate_to_rate_bit() helper provided by Alsa instead
> re-implementing it. This reduce code duplication and helps when
> changing some Alsa definition is necessary.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Thanks, applied now.


Takashi
