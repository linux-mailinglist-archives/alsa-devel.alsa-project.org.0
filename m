Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 058D586DF98
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Mar 2024 11:48:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 76D18847;
	Fri,  1 Mar 2024 11:48:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 76D18847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709290131;
	bh=GncIjYQFKSI5OHKs2/2JjiMcE0TZH3rTYcWPo/6HJqA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Yvi3XH52wxpQpY6hR4rjfaqmub8Qc7I8SBT0Mp0R1bsJ3X1EepSMxIJWOC5v5NxPm
	 nnliIPTFhU8UG4zfdj4JxEHIzXQU4GGM8ef5nCn36WWQxw7VVwWqI5c0fsbbixr/5d
	 sq4yFvVn4m3TI1ZdVsJreX3JQ71w7GD+xbbl0VNA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 402E2F805A0; Fri,  1 Mar 2024 11:48:12 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5501CF805A8;
	Fri,  1 Mar 2024 11:48:11 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E649BF8024C; Fri,  1 Mar 2024 11:48:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4A4F8F80088
	for <alsa-devel@alsa-project.org>; Fri,  1 Mar 2024 11:47:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4A4F8F80088
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=GhvRVu/C;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=Sq+LaSDe;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=GhvRVu/C;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=Sq+LaSDe
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 2FA5720196;
	Fri,  1 Mar 2024 10:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1709290065;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bWGSaEX/Y5LMnuTka/zcFMuOxuaVz5XxBPp27koraVs=;
	b=GhvRVu/Cw8VfI9KQO5dvejU32WKE58DUFLCI9mWBi7PNvErU9ZI8I6tnh7je8iss7Zc3AZ
	Y5rDgj5LObPpPGp95OIP9lLpHCFuT6CcI6PZf3zytAfuq1HA0YvgN9kEd8F7L2qHLx+mdj
	mSSrPd5yeSNLNes3NeoHoABXVGpxTRg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1709290065;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bWGSaEX/Y5LMnuTka/zcFMuOxuaVz5XxBPp27koraVs=;
	b=Sq+LaSDeFROys/+qh21g/9XXQzVygEe7k4URIZUUIBLr9EMSk6ms3D1tQpzAsCkK6VzypX
	qdVuigJrIAJieTCw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1709290065;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bWGSaEX/Y5LMnuTka/zcFMuOxuaVz5XxBPp27koraVs=;
	b=GhvRVu/Cw8VfI9KQO5dvejU32WKE58DUFLCI9mWBi7PNvErU9ZI8I6tnh7je8iss7Zc3AZ
	Y5rDgj5LObPpPGp95OIP9lLpHCFuT6CcI6PZf3zytAfuq1HA0YvgN9kEd8F7L2qHLx+mdj
	mSSrPd5yeSNLNes3NeoHoABXVGpxTRg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1709290065;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bWGSaEX/Y5LMnuTka/zcFMuOxuaVz5XxBPp27koraVs=;
	b=Sq+LaSDeFROys/+qh21g/9XXQzVygEe7k4URIZUUIBLr9EMSk6ms3D1tQpzAsCkK6VzypX
	qdVuigJrIAJieTCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F041413A59;
	Fri,  1 Mar 2024 10:47:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Y5wqOVCy4WXJMwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 01 Mar 2024 10:47:44 +0000
Date: Fri, 01 Mar 2024 11:47:44 +0100
Message-ID: <87a5ni5iun.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: songxiebing <soxiebing@163.com>
Cc: alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	songxiebing@kylinos.cn,
	tiwai@suse.com
Subject: Re: [PATCH v2] ALSA: hda: optimize the probe codec process
In-Reply-To: <20240301011841.7247-1-soxiebing@163.com>
References: <878r35huf0.wl-tiwai@suse.de>
	<20240301011841.7247-1-soxiebing@163.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="GhvRVu/C";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Sq+LaSDe
X-Spamd-Result: default: False [-4.31 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[163.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 DWL_DNSWL_MED(-2.00)[suse.de:dkim];
	 RCPT_COUNT_FIVE(0.00)[5];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 DKIM_TRACE(0.00)[suse.de:+];
	 MX_GOOD(-0.01)[];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
	 FREEMAIL_TO(0.00)[163.com];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 2FA5720196
Message-ID-Hash: 2G6L7WTXE5SMA3EYBNTPZEFG6QYBNKYH
X-Message-ID-Hash: 2G6L7WTXE5SMA3EYBNTPZEFG6QYBNKYH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2G6L7WTXE5SMA3EYBNTPZEFG6QYBNKYH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 01 Mar 2024 02:18:41 +0100,
songxiebing wrote:
> 
> From: songxiebing <songxiebing@kylinos.cn>
> 
> In azx_probe_codecs function, when bus->codec_mask is becomes to 0(no codecs),
> execute azx_init_chip, bus->codec_mask will be initialized to a value again,
> this causes snd_hda_codec_new function to run, the process is as follows:
> -->snd_hda_codec_new
> -->snd_hda_codec_device_init
> -->snd_hdac_device_init---snd_hdac_read_parm(...AC_PAR_VENDOR_ID) 2s
> 		       ---snd_hdac_read_parm(...AC_PAR_VENDOR_ID) 2s
> 		       ---snd_hdac_read_parm(...AC_PAR_SUBSYSTEM_ID) 2s
> 		       ---snd_hdac_read_parm(...AC_PAR_REV_ID) 2s
> 		       ---snd_hdac_read_parm(...AC_PAR_NODE_COUNT) 2s
> when no codecs, read communication is error, each command will be polled for
> 2 second, a total of 10s, it is easy to some problem.
> like this:
>   2 [   14.833404][ 6] [  T164] hda 0006:00: Codec #0 probe error; disabling it...
>   3 [   14.844178][ 6] [  T164] hda 0006:00: codec_mask = 0x1
>   4 [   14.880532][ 6] [  T164] hda 0006:00: too slow response, last cmd=0x0f0000
>   5 [   15.891988][ 6] [  T164] hda 0006:00: too slow response, last cmd=0x0f0000
>   6 [   16.978090][ 6] [  T164] hda 0006:00: too slow response, last cmd=0x0f0001
>   7 [   18.140895][ 6] [  T164] hda 0006:00: too slow response, last cmd=0x0f0002
>   8 [   19.135516][ 6] [  T164] hda 0006:00: too slow response, last cmd=0x0f0004
>  10 [   19.900086][ 6] [  T164] hda 0006:00: no codecs initialized
>  11 [   45.573398][ 2] [    C2] watchdog: BUG: soft lockup - CPU#2 stuck for 22s! [kworker/2:0:25]
> 
> Here, when bus->codec_mask is 0, use a direct break to avoid execute snd_hda_codec_new function.
> 
> Signed-off-by: songxiebing <songxiebing@kylinos.cn>
> ---
> Changes in v2: fix some non-ASCII comma letters.

Thanks, applied now.


Takashi
