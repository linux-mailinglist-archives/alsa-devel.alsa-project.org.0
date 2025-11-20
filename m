Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE55C72FAC
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Nov 2025 09:54:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1DB486020F;
	Thu, 20 Nov 2025 09:54:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1DB486020F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1763628884;
	bh=klB2+B9sDzDYoNW6WKYMZtypGHaAH8xupJ26q9aXk/8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YNOb7FPMsDm9QdowbECC4oLnQfzG/GHHgHrNbbe6zQ4JEzkXZgHJTzGVZXkN9VdtX
	 Lvrk3rtkUgltgsmTA/bI87KdSgYveVQj7huB1asNL3lVY+Dp/nY6BQApVUJELewV/Y
	 KZhLXlxj3xDg6xLf/yr4DS3lM2lcO7EhKGIIKK3c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 24A2EF8053D; Thu, 20 Nov 2025 09:54:07 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A438AF805B6;
	Thu, 20 Nov 2025 09:54:07 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 482A6F8021D; Thu, 20 Nov 2025 09:53:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 87E27F80072
	for <alsa-devel@alsa-project.org>; Thu, 20 Nov 2025 09:53:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 87E27F80072
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=peGC0TXs;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=bUenFSx4;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=peGC0TXs;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=bUenFSx4
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 91CB9211D2;
	Thu, 20 Nov 2025 08:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1763628818;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vWuLvkMbQWkvSyXGcor9GejzAGS7+ZW5L5NcoA3Zkqg=;
	b=peGC0TXsB/GcE//YFpZvepZnvzxlC9LBs4I9hUsxuLM6XF5wrRHnwa9m9lFR6gwN16UI3g
	yE9CLTeT2RDBqlanXV7uFg+o6F4qIhzg9ykKj7GgiI1RTKNH3Spe/dn2juHusjoF1ZyBLU
	90orGmqSsweY0J+zUU9ThpRY5/XYLrg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1763628818;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vWuLvkMbQWkvSyXGcor9GejzAGS7+ZW5L5NcoA3Zkqg=;
	b=bUenFSx4rzBWH6eJ5sMH+z/Oli64BPCRX92DPWOM093gctgCzPqJlRYArz6COrEzWd2sVb
	72iy8n0Cy3jN44Cw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=peGC0TXs;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=bUenFSx4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1763628818;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vWuLvkMbQWkvSyXGcor9GejzAGS7+ZW5L5NcoA3Zkqg=;
	b=peGC0TXsB/GcE//YFpZvepZnvzxlC9LBs4I9hUsxuLM6XF5wrRHnwa9m9lFR6gwN16UI3g
	yE9CLTeT2RDBqlanXV7uFg+o6F4qIhzg9ykKj7GgiI1RTKNH3Spe/dn2juHusjoF1ZyBLU
	90orGmqSsweY0J+zUU9ThpRY5/XYLrg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1763628818;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vWuLvkMbQWkvSyXGcor9GejzAGS7+ZW5L5NcoA3Zkqg=;
	b=bUenFSx4rzBWH6eJ5sMH+z/Oli64BPCRX92DPWOM093gctgCzPqJlRYArz6COrEzWd2sVb
	72iy8n0Cy3jN44Cw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 682F83EA61;
	Thu, 20 Nov 2025 08:53:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id oV46GBLXHmlUfQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 20 Nov 2025 08:53:38 +0000
Date: Thu, 20 Nov 2025 09:53:37 +0100
Message-ID: <87see9axv2.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Kailang <kailang@realtek.com>
Cc: " (alsa-devel@alsa-project.org)" <alsa-devel@alsa-project.org>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
Subject: Re: Support Tas2781 and mute led for HP platform
In-Reply-To: <c9c11acbefa24f7e8d0c62daecc00ac8@realtek.com>
References: <c9c11acbefa24f7e8d0c62daecc00ac8@realtek.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 91CB9211D2
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
Message-ID-Hash: TFNLO2EKDDBX7VRKBDRC3VNMR4E4WVJG
X-Message-ID-Hash: TFNLO2EKDDBX7VRKBDRC3VNMR4E4WVJG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TFNLO2EKDDBX7VRKBDRC3VNMR4E4WVJG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 20 Nov 2025 09:12:38 +0100,
Kailang wrote:
> 
> Hi Takashi,
> 
> Attach patch was supported Tas2781 and mute led for HP platform.

Applied to for-next branch now.
A comma was missing in the table entry, so I corrected it locally.


thanks,

Takashi
