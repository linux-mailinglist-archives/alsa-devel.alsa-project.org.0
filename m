Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 28864859E33
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Feb 2024 09:29:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 60737E7D;
	Mon, 19 Feb 2024 09:28:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 60737E7D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708331348;
	bh=erH4/v2CKMxgJZ8lHD4k+yf1CAwK7bi6Lj8v/IlFaJM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rCrmJzqa7uJlV3REu+ll5Q/Fme1EAw871A+81BTGGH/mggkaCe26qgpRxO0oOokXs
	 1YcF3Bccub7dZxPJWtmOr+3jUTarQcvJlR8RpfymeiY0u/hILol2oSstfVzFspclxC
	 XhvRxjjdY2Bxpzg4Vj71p9ELjS3yqAvEtieIl3Fw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E4DB6F805CA; Mon, 19 Feb 2024 09:28:24 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 77071F805C3;
	Mon, 19 Feb 2024 09:28:24 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8F173F80496; Mon, 19 Feb 2024 09:26:15 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id E4DDDF8019B
	for <alsa-devel@alsa-project.org>; Mon, 19 Feb 2024 09:26:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E4DDDF8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=e+nlVF1a;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=lLQF3Clv;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=e+nlVF1a;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=lLQF3Clv
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4B53921C14;
	Mon, 19 Feb 2024 08:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1708331171;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=L1oTvsJEC0RW4pZVI6O3To2ANPqP0P6uuo0vISwSHEE=;
	b=e+nlVF1aepKag0Vwi9L/ims0suRJs/Wu45zHcyeztTbsp1qJy/Yr4+yzX3FKXFRqDcqFug
	baQaITMFbkXebvyYBniaVW6kO9G+My7nTT8oIhRkuVrCegZbM6ob5sqjldmwmHz/L0m22E
	1HlKJqFHbGHV7SKcXxUT2oxTU5WE5EA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708331171;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=L1oTvsJEC0RW4pZVI6O3To2ANPqP0P6uuo0vISwSHEE=;
	b=lLQF3ClvkZaINHpfiqbOlDeZDJzJQ1UIEofXsSxt8glJKBIQ+3Y40aGieF0XiXEHILWfCR
	Dx91VHYno1TDFZBQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1708331171;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=L1oTvsJEC0RW4pZVI6O3To2ANPqP0P6uuo0vISwSHEE=;
	b=e+nlVF1aepKag0Vwi9L/ims0suRJs/Wu45zHcyeztTbsp1qJy/Yr4+yzX3FKXFRqDcqFug
	baQaITMFbkXebvyYBniaVW6kO9G+My7nTT8oIhRkuVrCegZbM6ob5sqjldmwmHz/L0m22E
	1HlKJqFHbGHV7SKcXxUT2oxTU5WE5EA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708331171;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=L1oTvsJEC0RW4pZVI6O3To2ANPqP0P6uuo0vISwSHEE=;
	b=lLQF3ClvkZaINHpfiqbOlDeZDJzJQ1UIEofXsSxt8glJKBIQ+3Y40aGieF0XiXEHILWfCR
	Dx91VHYno1TDFZBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2752D13647;
	Mon, 19 Feb 2024 08:26:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id jfwMCKMQ02U1BQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 19 Feb 2024 08:26:11 +0000
Date: Mon, 19 Feb 2024 09:26:10 +0100
Message-ID: <877cj0q2ql.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Cc: alsa-devel@alsa-project.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] ALSA: firewire-lib: fix to check cycle continuity
In-Reply-To: <20240218033026.72577-1-o-takashi@sakamocchi.jp>
References: <20240218033026.72577-1-o-takashi@sakamocchi.jp>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=e+nlVF1a;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=lLQF3Clv
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.09 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	 TO_DN_SOME(0.00)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_TRACE(0.00)[suse.de:+];
	 MX_GOOD(-0.01)[];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 BAYES_HAM(-2.58)[98.15%];
	 ARC_NA(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[3];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 MIME_GOOD(-0.10)[text/plain];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 RCVD_TLS_ALL(0.00)[]
X-Rspamd-Queue-Id: 4B53921C14
Message-ID-Hash: 7FYLJVI6XWXVVRIWXIWYAKTTHRWG2GHG
X-Message-ID-Hash: 7FYLJVI6XWXVVRIWXIWYAKTTHRWG2GHG
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
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sun, 18 Feb 2024 04:30:26 +0100,
Takashi Sakamoto wrote:
> 
> The local helper function to compare the given pair of cycle count
> evaluates them. If the left value is less than the right value, the
> function returns negative value.
> 
> If the safe cycle is less than the current cycle, it is the case of
> cycle lost. However, it is not currently handled properly.
> 
> This commit fixes the bug.
> 
> Cc: <stable@vger.kernel.org>
> Fixes: 705794c53b00 ("ALSA: firewire-lib: check cycle continuity")
> Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>

Thanks, applied.


Takashi
