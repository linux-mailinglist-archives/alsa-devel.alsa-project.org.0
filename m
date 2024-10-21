Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F12AD9A5C15
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Oct 2024 09:09:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 81CB0DF9;
	Mon, 21 Oct 2024 09:09:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 81CB0DF9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1729494565;
	bh=DJ/LMXa8DNzbZlDTMg9MkBRugetCEuzG8+gEMP8AGOs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lmKglehJ1YX4YMKPm28XD5xVbCjmIu9yWsIcRS0L+4/HXiy4hqZXryur3U/FzYLEe
	 habX/ZswRin3kxQD8OAfbYPJyQx0nIix4kXDTB8pjUau4D8OTUP17u9WOKKjQ3D/aL
	 4Mww03wamf/ALW3v+cSOrEXn6ipEc3IyXm9B/bLQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5610EF805BB; Mon, 21 Oct 2024 09:08:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EBFD4F805B0;
	Mon, 21 Oct 2024 09:08:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 23E19F8016C; Mon, 21 Oct 2024 09:08:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 07CD6F8014C
	for <alsa-devel@alsa-project.org>; Mon, 21 Oct 2024 09:08:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 07CD6F8014C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=w2bqYB2D;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=x5pkQ8Dc;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=ohGxU7if;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=cTdeW+gC
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D172121FC9;
	Mon, 21 Oct 2024 07:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1729494523;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mbDBxoWKkQMhSe40y2KcT39f+Czf7BLV/i78/Xk1dFs=;
	b=w2bqYB2DWayNdgQk+kyqKcswbyy/uH0bbsnlOPnCbFPofbdkVJVhO/fxbZJ45Gog7GWQ1l
	CeF7+zPwps+wIHuJyRR3+Jdp0FG8IJ4j8l/SyQMxuGdXFEzgMDn1ccSQ5ES0+4TuE5fhAA
	2B5bJuvS7UI67EOxo9/QRbDTueW1W2w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1729494523;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mbDBxoWKkQMhSe40y2KcT39f+Czf7BLV/i78/Xk1dFs=;
	b=x5pkQ8DcWQZ9Xo7oSzwc/bG0e1xBnLr50pLwGwb2j6Z7jf1rNiwG1vqAfXWIfz9k8FKhb+
	90lHIsZN83qz/dAA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1729494522;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mbDBxoWKkQMhSe40y2KcT39f+Czf7BLV/i78/Xk1dFs=;
	b=ohGxU7ifBTz6z8C+KkJBBWIcKtYQiOWSp8/Ov/Ung0jP6WBKqWjhWkj04JdCVUQxPS9vl1
	Sz9UZiLZM0z7v7P40jwwnb64W2p9jBX1/sFNwFXrwf9+8Bq23CEhGu/mxuKlAjERD91S4G
	1ocwmihwI+a1SWFnlv+p5PbLyFXSeu4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1729494522;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mbDBxoWKkQMhSe40y2KcT39f+Czf7BLV/i78/Xk1dFs=;
	b=cTdeW+gC1dpK6vVuBhBoNKqwBKQ9oUSI4DF6rjcPn9TsQuTF0XJK9woqG3liqPCeZMsdld
	Ar7Mrl+AI0BpxBAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 699FB136DC;
	Mon, 21 Oct 2024 07:08:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id weFNGPr9FWcXSgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 21 Oct 2024 07:08:42 +0000
Date: Mon, 21 Oct 2024 09:09:42 +0200
Message-ID: <874j56j5jd.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Andrey Shumilin <shum.sdl@nppct.ru>
Cc: Clemens Ladisch <clemens@ladisch.de>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org,
	lvc-patches@linuxtesting.org,
	khoroshilov@ispras.ru,
	ykarpov@ispras.ru,
	vmerzlyakov@ispras.ru,
	vefanov@ispras.ru
Subject: Re: [PATCH] ALSA: firewire-lib: Avoid division by zero in
 apply_constraint_to_size()
In-Reply-To: <20241018060018.1189537-1-shum.sdl@nppct.ru>
References: <20241018060018.1189537-1-shum.sdl@nppct.ru>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_DN_SOME(0.00)[]
Message-ID-Hash: RGN2WZMWYHH66D3XFSVRAZRPQPPVEVIB
X-Message-ID-Hash: RGN2WZMWYHH66D3XFSVRAZRPQPPVEVIB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RGN2WZMWYHH66D3XFSVRAZRPQPPVEVIB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 18 Oct 2024 08:00:18 +0200,
Andrey Shumilin wrote:
> 
> The step variable is initialized to zero. It is changed in the loop,
> but if it's not changed it will remain zero. Add a variable check
> before the division.
> 
> The observed behavior was introduced by commit 826b5de90c0b
> ("ALSA: firewire-lib: fix insufficient PCM rule for period/buffer size"),
> and it is difficult to show that any of the interval parameters will
> satisfy the snd_interval_test() condition with data from the
> amdtp_rate_table[] table.
> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 
> Fixes: 826b5de90c0b ("ALSA: firewire-lib: fix insufficient PCM rule for period/buffer size")
> Signed-off-by: Andrey Shumilin <shum.sdl@nppct.ru>

Applied now.  Thanks.


Takashi
